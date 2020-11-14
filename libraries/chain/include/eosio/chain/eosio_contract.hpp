#pragma once

#include <eosio/chain/types.hpp>
#include <eosio/chain/contract_types.hpp>

namespace eosio { namespace chain {

   class apply_context;

   /**
    * @defgroup native_action_handlers Native Action Handlers
    */
   ///@{
   void apply_lpc_newaccount(apply_context&);
   void apply_lpc_updateauth(apply_context&);
   void apply_lpc_deleteauth(apply_context&);
   void apply_lpc_linkauth(apply_context&);
   void apply_lpc_unlinkauth(apply_context&);

   /*
   void apply_lpc_postrecovery(apply_context&);
   void apply_lpc_passrecovery(apply_context&);
   void apply_lpc_vetorecovery(apply_context&);
   */

   void apply_lpc_setcode(apply_context&);
   void apply_lpc_setabi(apply_context&);

   void apply_lpc_canceldelay(apply_context&);
   ///@}  end action handlers

} }
