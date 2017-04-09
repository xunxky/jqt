########################################################################
# styles.make
########################################################################
#
# Generate main CSS stylesheet.
#
# Imported variables:
#	Destination
#	Blocks
#	Styles
# Exported targets:
#	$(Destination)/styles.css
# 	all


# Styles
$(Destination)/styles.css:		\
	$(Blocks)/*/*style.css		\
	$(Styles)/*.css			\
	$(Styles)/*.m 			\
	$(Styles)/milligram/*.css	\

# Generate main CSS stylesheet.
$(Destination)/styles.css: $(Styles)/main.css
	$(info ==> $@)
	@jqt -P CSS-min -I$(Styles) < $< > $@

# Add `$(Destination)/styles.css` to `all` target.
all:: $(Destination)/styles.css

# vim:ai:sw=8:ts=8:noet:fileencoding=utf8:syntax=make