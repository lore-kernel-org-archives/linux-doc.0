Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3D5637E244
	for <lwn-linux-doc@archive.lwn.net>; Thu,  1 Mar 2018 14:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1031203AbeCAOKW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 1 Mar 2018 09:10:22 -0500
Received: from mail-vk0-f67.google.com ([209.85.213.67]:33156 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1030989AbeCAOKV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Mar 2018 09:10:21 -0500
Received: by mail-vk0-f67.google.com with SMTP id z130so3745437vkd.0;
        Thu, 01 Mar 2018 06:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=hYpglUAI8Y2BszWOiV04FwbwQHGBrMVRGG+MVXjRrV4=;
        b=qmC/PBeXGx0jdfI8UljASVSrIKyPhG+B7mXjVXgof3+vd3C8o0EqhCaeCA2VuctAPw
         QLpZzH3hvka5h41HegWmES9HH49g/87/SSWWIuuVUcfXSDe2614+HOUOK8bTPQISnmtu
         1nEvGVG5NMjuI5XvAvPjeb5youZixn8aJso3LSGEJjv1J9HnXoaRLmuGfNM0RMsHJRgD
         aWWO0vrfiTrYaxhkHdbNQCV7cpnHnbOfh6ozGwlvW4oOoSeLPq/o74Ohdq1ytOV4bStZ
         V97dTrpCeI7/lSdwmo/8CiG2ehmZjeYhxIAIkD5JZc8SEefBoLkTsFOyq9VuCR4j/fTe
         h7kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=hYpglUAI8Y2BszWOiV04FwbwQHGBrMVRGG+MVXjRrV4=;
        b=lq34TD3cMFcUqlvVNQQZ+BBmuv4GgSuPgtq8pu/VdirvcnKWAP7xMFkLioeb2mqGUG
         HIsd6xUcx8BJKKV96KbKU0JEzILTh0QXSs/vdlhiGKkJ6BJ+Bzp6cRQSf4KDX5k6Ny6o
         aSji/ECUMHssLH9mftVv38kj/46R2A2EqS+DSWTijI13as4OANj4YZ8vf4kHHfud6z/w
         efaW9L+s6Xrvtm9c8TD6DV1/zS6fnPODR4MUXOJHTpnK5IC5f7Iu/u7WJuBkWW61i/JC
         ANDUr28nSHLdHivkLtpFwNOKab9kt6jrJzc9JWqwqy2ceYuWe1eFkn2hb/YsXT0WGzDD
         soQw==
X-Gm-Message-State: AElRT7E5WkAhozFk2fMH0KGvmsylKUA3FNH6Ks4fX0kUQy9msr8RRp3a
        pP9BtLOB26fKCvy0jgvppaymmjLnnL40J3O4RP8=
X-Google-Smtp-Source: AG47ELuLK/Jo0Tn9Co/VtKvm317I367rxhtIlFFNgBvKQAXcbeOvGvnnGHo/uWL2jmv5sQ6q3wUPGgacMSvyEq0omGM=
X-Received: by 10.31.161.70 with SMTP id k67mr1229342vke.82.1519913419886;
 Thu, 01 Mar 2018 06:10:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.220.145 with HTTP; Thu, 1 Mar 2018 06:10:19 -0800 (PST)
In-Reply-To: <1519886077-31914-2-git-send-email-yamada.masahiro@socionext.com>
References: <1519886077-31914-1-git-send-email-yamada.masahiro@socionext.com> <1519886077-31914-2-git-send-email-yamada.masahiro@socionext.com>
From:   Ulf Magnusson <ulfalizer@gmail.com>
Date:   Thu, 1 Mar 2018 15:10:19 +0100
Message-ID: <CAFkk2KTN9B9wt55PFohVFqZA1dpM-Ep_e=vAXoPpt1QOt7moDQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] kconfig: rename silentoldconfig to syncconfig
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Sam Ravnborg <sam@ravnborg.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Marc Herbert <marc.herbert@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        intel-wired-lan@lists.osuosl.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 1, 2018 at 7:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> As commit cedd55d49dee ("kconfig: Remove silentoldconfig from help
> and docs; fix kconfig/conf's help") mentioned, 'silentoldconfig' is a
> historical misnomer.  That commit removed it from help and docs since
> it is an internal interface.  If so, it should be allowed to rename
> it to something more intuitive.  'syncconfig' is the one I came up
> with because it updates the .config if necessary, then synchronize
> include/generated/autoconf.h and include/config/* with it.
>
> You should not manually invoke 'silentoldcofig'.  Display warning if
> used in case existing scripts are doing wrong.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v3:
>   - Fix Documentation/networking/i40e.txt
>   - Display warning if silentoldconfig is used
>
> Changes in v2:
>   - newly added
>
>  Documentation/kbuild/kconfig.txt  |  2 +-
>  Documentation/networking/i40e.txt |  2 +-
>  Makefile                          |  2 +-
>  scripts/kconfig/Makefile          | 13 ++++++++++---
>  scripts/kconfig/conf.c            | 20 ++++++++++----------
>  5 files changed, 23 insertions(+), 16 deletions(-)
>
> diff --git a/Documentation/kbuild/kconfig.txt b/Documentation/kbuild/kconfig.txt
> index bbc99c0..7233118 100644
> --- a/Documentation/kbuild/kconfig.txt
> +++ b/Documentation/kbuild/kconfig.txt
> @@ -119,7 +119,7 @@ Examples:
>                 15% of tristates will be set to 'y', 15% to 'm', 70% to 'n'
>
>  ______________________________________________________________________
> -Environment variables for 'silentoldconfig'
> +Environment variables for 'syncconfig'
>
>  KCONFIG_NOSILENTUPDATE
>  --------------------------------------------------
> diff --git a/Documentation/networking/i40e.txt b/Documentation/networking/i40e.txt
> index 57e616e..c2d6e18 100644
> --- a/Documentation/networking/i40e.txt
> +++ b/Documentation/networking/i40e.txt
> @@ -32,7 +32,7 @@ Enabling the driver
>  The driver is enabled via the standard kernel configuration system,
>  using the make command:
>
> -     Make oldconfig/silentoldconfig/menuconfig/etc.
> +     make config/oldconfig/menuconfig/etc.
>
>  The driver is located in the menu structure at:
>
> diff --git a/Makefile b/Makefile
> index 7f0aba6..4fb97e9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -597,7 +597,7 @@ $(KCONFIG_CONFIG) include/config/auto.conf.cmd: ;
>  # include/generated/ and include/config/. Update them if .config is newer than
>  # include/config/auto.conf (which mirrors .config).
>  include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
> -       $(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
> +       $(Q)$(MAKE) -f $(srctree)/Makefile syncconfig
>  else
>  # external modules needs include/generated/autoconf.h and include/config/auto.conf
>  # but do not care if they are up-to-date. Use auto.conf to trigger the test
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 41e2a9f..753a6de4 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -3,7 +3,7 @@
>  # Kernel configuration targets
>  # These targets are used from top-level makefile
>
> -PHONY += xconfig gconfig menuconfig config silentoldconfig update-po-config \
> +PHONY += xconfig gconfig menuconfig config syncconfig update-po-config \
>         localmodconfig localyesconfig
>
>  ifdef KBUILD_KCONFIG
> @@ -36,7 +36,7 @@ nconfig: $(obj)/nconf
>
>  # This has become an internal implementation detail and is now deprecated
>  # for external use.
> -silentoldconfig: $(obj)/conf
> +syncconfig: $(obj)/conf
>         $(Q)mkdir -p include/config include/generated
>         $(Q)test -e include/generated/autoksyms.h || \
>             touch   include/generated/autoksyms.h
> @@ -88,7 +88,7 @@ PHONY += $(simple-targets)
>  $(simple-targets): $(obj)/conf
>         $< $(silent) --$@ $(Kconfig)
>
> -PHONY += oldnoconfig savedefconfig defconfig
> +PHONY += oldnoconfig silentoldconfig savedefconfig defconfig
>
>  # oldnoconfig is an alias of olddefconfig, because people already are dependent
>  # on its behavior (sets new symbols to their default value but not 'n') with the
> @@ -97,6 +97,13 @@ oldnoconfig: olddefconfig
>         @echo "  WARNING: \"oldnoconfig\" target will be removed after Linux 4.19"
>         @echo "            Please use \"olddefconfig\" instead, which is an alias."
>
> +# We do not expect manual invokcation of "silentoldcofig" (or "syncconfig").
> +silentoldconfig: syncconfig
> +       @echo "  WARNING: \"silentoldconfig\" has been renamed to \"syncconfig\""
> +       @echo "            and is now an internal implementation detail."
> +       @echo "            What you want is probably \"oldconfig\"."
> +       @echo "            \"silentoldconfig\" will be removed after Linux 4.19"
> +
>  savedefconfig: $(obj)/conf
>         $< $(silent) --$@=defconfig $(Kconfig)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 11a4e45..4e08121 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -23,7 +23,7 @@ static void check_conf(struct menu *menu);
>
>  enum input_mode {
>         oldaskconfig,
> -       silentoldconfig,
> +       syncconfig,
>         oldconfig,
>         allnoconfig,
>         allyesconfig,
> @@ -100,7 +100,7 @@ static int conf_askvalue(struct symbol *sym, const char *def)
>
>         switch (input_mode) {
>         case oldconfig:
> -       case silentoldconfig:
> +       case syncconfig:
>                 if (sym_has_value(sym)) {
>                         printf("%s\n", def);
>                         return 0;
> @@ -293,7 +293,7 @@ static int conf_choice(struct menu *menu)
>                 printf("[1-%d?]: ", cnt);
>                 switch (input_mode) {
>                 case oldconfig:
> -               case silentoldconfig:
> +               case syncconfig:
>                         if (!is_new) {
>                                 cnt = def;
>                                 printf("%d\n", cnt);
> @@ -441,7 +441,7 @@ static void check_conf(struct menu *menu)
>  static struct option long_opts[] = {
>         {"oldaskconfig",    no_argument,       NULL, oldaskconfig},
>         {"oldconfig",       no_argument,       NULL, oldconfig},
> -       {"silentoldconfig", no_argument,       NULL, silentoldconfig},
> +       {"syncconfig",      no_argument,       NULL, syncconfig},
>         {"defconfig",       optional_argument, NULL, defconfig},
>         {"savedefconfig",   required_argument, NULL, savedefconfig},
>         {"allnoconfig",     no_argument,       NULL, allnoconfig},
> @@ -468,8 +468,8 @@ static void conf_usage(const char *progname)
>         printf("  --listnewconfig         List new options\n");
>         printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>         printf("  --oldconfig             Update a configuration using a provided .config as base\n");
> -       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
> -              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
> +       printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
> +              "                          include/{generated/,config/}\n");
>         printf("  --olddefconfig          Same as oldconfig but sets new symbols to their default value\n");
>         printf("  --oldnoconfig           An alias of olddefconfig\n");
>         printf("  --defconfig <file>      New config with default defined in <file>\n");
> @@ -501,7 +501,7 @@ int main(int ac, char **av)
>                 }
>                 input_mode = (enum input_mode)opt;
>                 switch (opt) {
> -               case silentoldconfig:
> +               case syncconfig:
>                         sync_kconfig = 1;
>                         break;
>                 case defconfig:
> @@ -583,7 +583,7 @@ int main(int ac, char **av)
>                 }
>                 break;
>         case savedefconfig:
> -       case silentoldconfig:
> +       case syncconfig:
>         case oldaskconfig:
>         case oldconfig:
>         case listnewconfig:
> @@ -667,7 +667,7 @@ int main(int ac, char **av)
>                 /* fall through */
>         case oldconfig:
>         case listnewconfig:
> -       case silentoldconfig:
> +       case syncconfig:
>                 /* Update until a loop caused no more changes */
>                 do {
>                         conf_cnt = 0;
> @@ -680,7 +680,7 @@ int main(int ac, char **av)
>         }
>
>         if (sync_kconfig) {
> -               /* silentoldconfig is used during the build so we shall update autoconf.
> +               /* syncconfig is used during the build so we shall update autoconf.
>                  * All other commands are only used to generate a config.
>                  */
>                 if (conf_get_changed() && conf_write(NULL)) {
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>

Cheers,
Ulf
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
