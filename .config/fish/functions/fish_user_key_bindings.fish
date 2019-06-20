# Defined in - @ line 21
function fish_user_key_bindings
	fish_hybrid_key_bindings
	bind -M insert ! bind_bang
	bind -M insert '$' bind_dollar
end
