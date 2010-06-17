package Dist::Zilla::PluginBundle::BINGOS;

# ABSTRACT: BeLike::BINGOS when you build your dists

use Moose;
with 'Dist::Zilla::Role::PluginBundle::Easy';

sub configure {
  my $self = shift;
  $self->add_bundle('Basic');
  $self->add_plugins(
    'MetaJSON',
    'PodSyntaxTests',
    'PodCoverageTests',
    'PkgVersion',
    'GithubMeta',
    'ReadmeFromPod',
    'PodWeaver',
    'CompileTests',
    [ 'ChangelogFromGit' => 
        { file_name => 'Changes', tag_regexp => '^\d' } 
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
  tag_regexp = ^\d

  [ReadmeFromPod]
  [CompileTests]

=head2 METHODS

=over

=item C<configure>

See L<Dist::Zilla::PluginBundle::Easy>.

=back

=cut
