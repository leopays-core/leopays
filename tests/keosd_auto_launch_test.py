#!/usr/bin/env python3

# This script tests that leopays-cli launches leopays-wallet automatically when leopays-wallet is not
# running yet.

import subprocess


def run_cli_wallet_command(command: str, no_auto_wallet: bool):
    """Run the given leopays-cli command and return subprocess.CompletedProcess."""
    args = ['./programs/cli/leopays-cli']

    if no_auto_wallet:
        args.append('--no-auto-wallet')

    args += 'wallet', command

    return subprocess.run(args,
                          check=False,
                          stdout=subprocess.DEVNULL,
                          stderr=subprocess.PIPE)


def stop_wallet():
    """Stop the default leopays-wallet instance."""
    run_cli_wallet_command('stop', no_auto_wallet=True)


def check_cli_stderr(stderr: bytes, expected_match: bytes):
    if expected_match not in stderr:
        raise RuntimeError("'{}' not found in {}'".format(
            expected_match.decode(), stderr.decode()))


def wallet_auto_launch_test():
    """Test that leopays-wallet auto-launching works but can be optionally inhibited."""
    stop_wallet()

    # Make sure that when '--no-auto-wallet' is given, leopays-wallet is not started by
    # leopays-cli.
    completed_process = run_cli_wallet_command('list', no_auto_wallet=True)
    assert completed_process.returncode != 0
    check_cli_stderr(completed_process.stderr, b'Failed to connect to leopays-wallet')

    # Verify that leopays-wallet auto-launching works.
    completed_process = run_cli_wallet_command('list', no_auto_wallet=False)
    if completed_process.returncode != 0:
        raise RuntimeError("Expected that leopays-wallet would be started, "
                           "but got an error instead: {}".format(
                               completed_process.stderr.decode()))
    check_cli_stderr(completed_process.stderr, b'launched')


try:
    wallet_auto_launch_test()
finally:
    stop_wallet()
