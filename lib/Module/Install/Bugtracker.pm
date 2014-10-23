package Module::Install::Bugtracker;
use 5.006;
use strict;
use warnings;
use URI::Escape;
our $VERSION = '0.02';
use base qw(Module::Install::Base);

sub auto_set_bugtracker {
    my $self = shift;
    if ($self->name) {
        $self->bugtracker(
            sprintf 'http://rt.cpan.org/Public/Dist/Display.html?Name=%s',
            uri_escape($self->name),
        );
    } else {
        warn "can't set bugtracker if 'name' is not set\n";
    }
}
1;
__END__

=for test_synopsis
BEGIN { $INC{'inc/Module/Install.pm'} = 'dummy'; }
sub name ($) {}
sub auto_set_bugtracker () {}

=head1 NAME

Module::Install::Bugtracker - automatically sets the bugtracker URL

=head1 SYNOPSIS

    # in Makefile.PL
    use inc::Module::Install;
    name 'Foo-Bar';
    auto_set_bugtracker;

=head1 DESCRIPTION

This is a plugin for L<Module::Install> to automatically set the bugtracker URL
via C<bugtracker()> which will then be added to resources under I<META.yml>.

=head1 FUNCTIONS

=over 4

=item C<auto_set_bugtracker>

Sets the bugtracker URL via L<Module::Install>'s C<bugtracker()> function. The
C<name()> needs to be set before calling this function.

=back

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org>.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you. Or see L<http://search.cpan.org/dist/Module-Install-Bugtracker/>.

The development version lives at
L<http://github.com/hanekomu/module-install-bugtracker/>. Instead of sending
patches, please fork this project using the standard git and github
infrastructure.

=head1 AUTHORS

Marcel GrE<uuml>nauer, C<< <marcel@cpan.org> >>

=head1 COPYRIGHT AND LICENSE

Copyright 2009 by Marcel GrE<uuml>nauer

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

L<Module::Install>

=cut

