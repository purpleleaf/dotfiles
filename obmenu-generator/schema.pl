#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL              ICON
  #  {item => ['xdg-open .',       'File Manager',       'spacefm']},
  #  {item => ['gksudo xdg-open .', 'File Manager Root', 'spacefm']},
  #  {item => ['terminology',       'Terminale',         'utilities-terminal']},
  #  {item => ['xdg-open http://',  'Firefox',           'firefox']},
  #  {item => ['gmrun',             'Esegui...',         'system-run']},
  #  {item => ['/home/max/.config/rofi/launchers/misc/launcher.sh',             'Trova applicazioni',         'xfce4-appfinder']},
   # {item => ['', 'Applicazioni', 'folder-applications']},
   # {sep => undef},
   # {beg => ['Applicazioni', 'applications-other']},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessori', 'applications-utilities']},
    {cat => ['development', 'Sviluppo', 'applications-development']},
    {cat => ['education',   'Educazione',   'applications-science']},
    {cat => ['game',        'Giochi',       'applications-games']},
    {cat => ['graphics',    'Grafica',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Rete',     'applications-internet']},
    {cat => ['office',      'Ufficio',      'applications-office']},
    {cat => ['other',       'Altri',       'applications-other']},
    {cat => ['settings',    'Preferenze',    'applications-accessories']},
    {cat => ['system',      'Sistema',      'applications-system']},
    #{end => undef},
    {sep => undef},


    #{sep => undef},
    #{beg => ['Sistema Arch', 'application-menu']},
    #          NAME            LABEL                ICON
    #{item => ['lxappearance',       'Temi e Aspetto',       'preferences-desktop-theme-global']},
    #{item => ['tint2conf',       'Configurazione Tint2',       'tint2conf']},
    #{item => ['asoundconf-gtk',       'Configurazione Audio',       'applications-multimedia-symbolic']},
    #{item => ['lxrandr',       'Configurazione Monitor',       'system-config-display']},

    #{end => undef},

    #{beg => ['Openbox', 'emblem-system-symbolic']},

    #          NAME            LABEL                ICON
     #   {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'text-x-generic']},
     #   {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
     #  {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
     #   {item => ['kickshaw',       'Kickshaw',       'applications-interfacedesign']},
     #   {item => ['obtheme',       'Obtheme',       'applications-interfacedesign']},
     #   {item => ['obconf',       'Obconf',       'applications-interfacedesign']},

      # obmenu-generator category
      #{beg => ['Obmenu-Generator', 'accessories-text-editor']},
      #  {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
      #  {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},

      #  {sep  => undef},
      #  {item => ['obmenu-generator -s -c',    'Generate a static menu',             'accessories-text-editor']},
      #  {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons',  'accessories-text-editor']},
      #  {sep  => undef},
      #  {item => ['obmenu-generator -p',       'Generate a dynamic menu',            'accessories-text-editor']},
      #  {item => ['obmenu-generator -p -i',    'Generate a dynamic menu with icons', 'accessories-text-editor']},
      #  {sep  => undef},

      #  {item => ['obmenu-generator -d', 'Refresh cache', 'view-refresh']},
      #{end => undef},

    
    #{end => undef},

    #             LABEL          ICON
    #{beg => ['My category',  'cat-icon']},
    #          ... some items ...
    #{end => undef},

    #{sep => undef},
    #            COMMAND     LABEL        ICON
    #{pipe => ['~/.config/pipe_menu/date.sh', 'WorldDate', 'appointment-soon']},

    #{sep => undef},
    #{item => ['reconfigure',       'Riconfigura Openbox',       'system-restart-panel']},
    #{item => ['ob-lockscreen -i /usr/share/obarun/ob-lockscreen/oblock.png', 'Blocca schermo', 'lock']},
    #{item => ['obshutdown -c ~/.config/obshut/exit.rc',       'Esci',         'exit']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'applications-engineering']},
    #{sep       => undef},

    ## Custom advanced settings

    ## The xscreensaver lock command
    {item => ['betterlockscreen --lock --show-layout 3', 'Lock', 'system-lock-screen']},

    ## This option uses the default Openbox's "Exit" action
   # {exit => ['Exit', 'application-exit']},

    ## This uses the 'oblogout' menu
     {item => ['obshutdown', 'Exit', 'system-shutdown']},
     
]
