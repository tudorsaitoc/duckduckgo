package DDG::App::Attribution;

use MooX qw(
	Options
);

use Module::Runtime qw( use_module );

sub BUILD {
	my ( $self ) = @_;
	if (@ARGV) {
		for (@ARGV) {
			use_module($_);
			my @attributions = @{$_->get_attributions};
			if (@attributions) {
				print "\nAttributions for ".$_.":\n\n";
				for (@attributions) {
					print " - ".$_."\n";
				}
			} else {
				print "\nNo attributions for ".$_."\n\n";
			}

		}
	} else {
		# TODO, load all and show all attributions
	}
	print "\n";
}

1;