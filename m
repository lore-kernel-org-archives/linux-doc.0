Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BFE7C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 18 Apr 2021 01:52:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08409611AC
	for <linux-doc@archiver.kernel.org>; Sun, 18 Apr 2021 01:52:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234904AbhDRBxH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Apr 2021 21:53:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229870AbhDRBxH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 21:53:07 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 973A8C06174A
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 18:52:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id s14so11148301pjl.5
        for <linux-doc@vger.kernel.org>; Sat, 17 Apr 2021 18:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=GxoIInSPTnlTloB8xIvHIuDbP6pt0D67FGLryBAMQuc=;
        b=Rpl1dv/tIOIdjhehKoDHJdmXOcYKJ4o8++Pvt2k77fcucdO40cAw77WhulIapJ9JNE
         4p9btKD7TiibS+P2X5C2dHkDHREX1eQ2PuYDgjubkXoKnnCQF7SpWrvsM7kWQl9nc12j
         7RPGhuNsXnIgaGgq3lL0VHVlr71w46fH56OZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=GxoIInSPTnlTloB8xIvHIuDbP6pt0D67FGLryBAMQuc=;
        b=AViGpAHZcKbpTH1y+OpN5OZjm+yuQg7QGUTfCKjtIRzMQygkE0JQqhcBOAS2m7sd4j
         SuxnaZ+SDB3iWm8/JWbDypjpEWcU6UFcrhwWg92XcGKLrvr8JTQNQ2XWqQZxNXf6pKnL
         4Hh0nZ6X7+n9+P1b4t/AEe3W4LT+xK+FkBtVL3eiYEUr7z3LRhIyFWodP0IaqnCYpnZL
         H05e/NdtUNwJLiakE7rYx3e3wJrMaRODU/OmKoQo5UdlI4UA6Q6n3Bn0XCBSt+cigf3Z
         ywwbpXeyOCQSJZterdcHOSnvVBVhy/tqpF9Rw5+evSkBmGQbF+geXmHAGgjg+NgW29Jz
         PFMA==
X-Gm-Message-State: AOAM532Xppl+ghfP1Ss14xV+HFRRO6v/nXdWLOtwKskIUiGm3pSwVnd5
        +YBRJ1rPZzyYVw+3ST89aUYMzXczu4+ZoQ==
X-Google-Smtp-Source: ABdhPJwe6cGQvz0Y6erB49Yh8Keam0M80iy1Rf6p/uyPuMeqGo6O+xTW8JSMYB+NR323LBSY9iyN6Q==
X-Received: by 2002:a17:90a:7896:: with SMTP id x22mr16966446pjk.182.1618710757952;
        Sat, 17 Apr 2021 18:52:37 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:e47c:5232:82d9:6d3f])
        by smtp.gmail.com with ESMTPSA id n52sm8778713pfv.13.2021.04.17.18.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 18:52:37 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YHg541E24iy5nddg@gunter>
References: <20210410015300.3764485-1-swboyd@chromium.org> <20210410015300.3764485-6-swboyd@chromium.org> <YHg541E24iy5nddg@gunter>
Subject: Re: [PATCH v4 05/13] module: Add printk formats to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Jessica Yu <jeyu@kernel.org>
Date:   Sat, 17 Apr 2021 18:52:34 -0700
Message-ID: <161871075477.46595.10848605889976259732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Jessica Yu (2021-04-15 06:04:35)
> +++ Stephen Boyd [09/04/21 18:52 -0700]:
> >diff --git a/include/linux/module.h b/include/linux/module.h
> >index 59f094fa6f74..4bf869f6c944 100644
> >--- a/include/linux/module.h
> >+++ b/include/linux/module.h
> >@@ -11,6 +11,7 @@
> >
> > #include <linux/list.h>
> > #include <linux/stat.h>
> >+#include <linux/buildid.h>
> > #include <linux/compiler.h>
> > #include <linux/cache.h>
> > #include <linux/kmod.h>
> >@@ -367,6 +368,9 @@ struct module {
> >       /* Unique handle for this module */
> >       char name[MODULE_NAME_LEN];
> >
> >+      /* Module build ID */
> >+      unsigned char build_id[BUILD_ID_SIZE_MAX];
>=20
> Hi Stephen,
>=20
> Since this field is not used when !CONFIG_STACKTRACE_BUILD_ID, I
> would prefer to wrap this in an ifdef, similar to the other
> CONFIG-dependent fields in struct module. This makes it explicit under
> what conditions (i.e. config) the field is meant to be used.

Ok will do.

> >diff --git a/kernel/module.c b/kernel/module.c
> >index 30479355ab85..6f5bc1b046a5 100644
> >--- a/kernel/module.c
> >+++ b/kernel/module.c
> >@@ -2770,6 +2771,20 @@ static void add_kallsyms(struct module *mod, cons=
t struct load_info *info)
> >       }
> >       mod->core_kallsyms.num_symtab =3D ndst;
> > }
> >+
> >+static void init_build_id(struct module *mod, const struct load_info *i=
nfo)
> >+{
> >+      const Elf_Shdr *sechdr;
> >+      unsigned int i;
> >+
> >+      for (i =3D 0; i < info->hdr->e_shnum; i++) {
> >+              sechdr =3D &info->sechdrs[i];
> >+              if (!sect_empty(sechdr) && sechdr->sh_type =3D=3D SHT_NOT=
E &&
> >+                  !build_id_parse_buf((void *)sechdr->sh_addr, mod->bui=
ld_id,
> >+                                      sechdr->sh_size))
> >+                      break;
> >+      }
>=20
> If mod->build_id is not used when !CONFIG_STACKTRACE_BUILD_ID, then we
> don't need to look for it. I would be fine with wrapping the function
> body in an ifdef (similar to what we currently do in
> del_usage_links() and do_mod_ctors()).

Ok, done.

>=20
> >+}
> > #else
> > static inline void layout_symtab(struct module *mod, struct load_info *=
info)
> > {
> >@@ -2778,6 +2793,10 @@ static inline void layout_symtab(struct module *m=
od, struct load_info *info)
> > static void add_kallsyms(struct module *mod, const struct load_info *in=
fo)
> > {
> > }
> >+
> >+static void init_build_id(struct module *mod, const struct load_info *i=
nfo)
> >+{
> >+}
> > #endif /* CONFIG_KALLSYMS */
> >
> > static void dynamic_debug_setup(struct module *mod, struct _ddebug *deb=
ug, unsigned int num)
> >@@ -4004,6 +4023,7 @@ static int load_module(struct load_info *info, con=
st char __user *uargs,
> >               goto free_arch_cleanup;
> >       }
> >
> >+      init_build_id(mod, info);
> >       dynamic_debug_setup(mod, info->debug, info->num_debug);
> >
> >       /* Ftrace init must be called in the MODULE_STATE_UNFORMED state =
*/
> >@@ -4235,7 +4255,7 @@ void * __weak dereference_module_function_descript=
or(struct module *mod,
> > const char *module_address_lookup(unsigned long addr,
> >                           unsigned long *size,
> >                           unsigned long *offset,
> >-                          char **modname,
> >+                          char **modname, const unsigned char **modbuil=
did,
> >                           char *namebuf)
> > {
> >       const char *ret =3D NULL;
> >@@ -4246,6 +4266,8 @@ const char *module_address_lookup(unsigned long ad=
dr,
> >       if (mod) {
> >               if (modname)
> >                       *modname =3D mod->name;
> >+              if (modbuildid)
> >+                      *modbuildid =3D mod->build_id;
>=20
> Then maybe we can set *modbuildid =3D NULL in the case of
> !CONFIG_STACKTRACE_BUILD_ID, similar to the kernel case in
> kallsyms_lookup_buildid().
>=20

Sounds good. It means that some more ifdefs are probably required vs.
making the array size be 0 when the config is disabled but that isn't a
big problem for me. I'm reworking the code now and will test and then
send v5 shortly. Thanks!
