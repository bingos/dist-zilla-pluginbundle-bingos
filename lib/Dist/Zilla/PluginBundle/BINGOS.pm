package Dist::Zilla::PluginBundle::BINGOS;

# ABSTRACT: BeLike::BINGOS when you build your dists

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';
with 'Dist::Zilla::Role::PluginBundle::PluginRemover';

sub configure {
  my $self = shift;
  $self->add_bundle('Basic');
  $self->add_plugins(
    'MetaJSON',
    'PodSyntaxTests',
    'PodCoverageTests',
    'PkgVersion',
    'GithubMeta',
    'ReadmeAnyFromPod',
    'PodWeaver',
    'Test::Compile',
    'Clean',
    [ 'ChangelogFromGit' =>
        { file_name => 'Changes', tag_regexp => '^(\\d+\\.\\d+)$', max_age => ( 5 * 365 ) }
    ],
  );

}

__PACKAGE__->meta->make_immutable;
no Moose;

qq[BELIKE::BINGOS];

=pod

=head1 SYNOPSIS

   # in dist.ini
   [@BINGOS]

=head1 DESCRIPTION

This is a L<Dist::Zilla> PluginBundle.  It is roughly equivalent to the
following dist.ini:

  [@Basic]

  [MetaJSON]
  [PodSyntaxTests]
  [PodCoverageTests]

  [PodWeaver]
  [PkgVersion]
  [GithubMeta]

  [ChangelogFromGit]
  file_name = Changes
  tag_regexp = ^(\\d+\\.\\d+)$
  max_age = 1825

  [ReadmeAnyFromPod]
  [Test::Compile]

  [Clean]

This PluginBundle also supports PluginRemover, so dropping a plugin is as easy as this:

   [@BINGOS]
   -remove = PluginIDontWant

=head2 METHODS

=over

=item C<configure>

See L<Dist::Zilla::PluginBundle::Role::Easy>.

=back

=cut
