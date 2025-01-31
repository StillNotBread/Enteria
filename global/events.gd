extends Node

#card-related events
signal card_drag_started(card_ui: CardUI)
signal card_drag_ended(card_ui: CardUI)
signal card_aim_started(card_ui: CardUI)
signal card_aim_ended(card_ui: CardUI)
signal card_played(card: CardUI)
signal card_tooltip_requested(card: CardUI)
signal tool_tip_hide_requested

#player-related events
signal player_hand_drawn
signal player_hand_discarded
signal player_turn_ended
signal player_died

#Battle-related events
signal battle_over_sceen_requested(text: String, type: BattleOverPanel.Type)
