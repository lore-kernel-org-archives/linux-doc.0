Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72069C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:57:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 51DF361249
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 22:57:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347659AbhDMW6M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 18:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbhDMW6M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 18:58:12 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D6FAC061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 15:57:52 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id a12so12420746pfc.7
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 15:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:content-transfer-encoding:in-reply-to:references
         :subject:from:cc:to:date:message-id:user-agent;
        bh=6sqdcuryxsdrCZB//EKTroEdj394HnrdQW5wO/Kusf8=;
        b=P+qx3+ElK9fqp8beAocKGE8SgPJiXuTLPTr0aQ/xz1k4vh4+2yrHlHR7vpi9Q0cznk
         kQknvUC6WpvMK5/2n5iH/WUhLNWpB+j8fOvoUK+tmPQbz3KX/QHsVO0gZXT+h1IJWHg8
         fTnwZwS0XsYxm7MI5ujdnoGA6ZIdEAS01Fb0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding
         :in-reply-to:references:subject:from:cc:to:date:message-id
         :user-agent;
        bh=6sqdcuryxsdrCZB//EKTroEdj394HnrdQW5wO/Kusf8=;
        b=TtkF1xFK9xN/PFQjL9jMJzNTnpN2orMQYA0jyUs+gnmzvf6+5NCjBkkbzGlz8aCK41
         BKUfdrLJ01ytwgGdpEA4m9B7FXvCFUhh23IJCzMpvf1hPh2JsJGV4xyIsLAVUNzaRExf
         Nx7ybiaFGK5oTAljGdtvb3ornRUKKHPQGQoTaAD0hrGHCdCE/oCFn31ZxIf/X098QWwb
         khY6Q8DXr2WXTQKYNLs7UyMhwn+GmyH37gKY6PLpz4BeGaXVPJh8+qOl73HXmFLm9gVR
         Mps1/8S4ecMTRFTCsEUnGo8btVMZuueLFe3P/y7Ap3a9M8C8RqSNgI1zouy+RjsFjX0Z
         SLxg==
X-Gm-Message-State: AOAM532FzdJzSJU/4HP2GmHG80lH3lOE4i0yQEFxQXS6Zt2Z1TKkUYA2
        SZG/SGWcrQiAQMLs54dU1UUVFQ==
X-Google-Smtp-Source: ABdhPJz3Cupzqfs4XSmtfJO/mdGNl79Euq/LKJdkMxPcHsb/vAL8g/5JiXAiwb/MWOcm9tkJbS9jJw==
X-Received: by 2002:a63:d70f:: with SMTP id d15mr35400288pgg.397.1618354671737;
        Tue, 13 Apr 2021 15:57:51 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
        by smtp.gmail.com with ESMTPSA id r10sm3378727pjf.5.2021.04.13.15.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 15:57:51 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YHWyOhYZuLsbt2gB@alley>
References: <20210410015300.3764485-1-swboyd@chromium.org> <20210410015300.3764485-6-swboyd@chromium.org> <YHWyOhYZuLsbt2gB@alley>
Subject: Re: [PATCH v4 05/13] module: Add printk formats to add module build ID to stacktraces
From:   Stephen Boyd <swboyd@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Evan Green <evgreen@chromium.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>
To:     Petr Mladek <pmladek@suse.com>
Date:   Tue, 13 Apr 2021 15:57:49 -0700
Message-ID: <161835466995.3764895.13268854960596303989@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Quoting Petr Mladek (2021-04-13 08:01:14)
> On Fri 2021-04-09 18:52:52, Stephen Boyd wrote:
> > Let's make kernel stacktraces easier to identify by including the build
> > ID[1] of a module if the stacktrace is printing a symbol from a module.
> > This makes it simpler for developers to locate a kernel module's full
> > debuginfo for a particular stacktrace. Combined with
> > scripts/decode_stracktrace.sh, a developer can download the matching
> > debuginfo from a debuginfod[2] server and find the exact file and line
> > number for the functions plus offsets in a stacktrace that match the
> > module. This is especially useful for pstore crash debugging where the
> > kernel crashes are recorded in something like console-ramoops and the
> > recovery kernel/modules are different or the debuginfo doesn't exist on
> > the device due to space concerns (the debuginfo can be too large for
> > space limited devices).
> >=20
> > diff --git a/include/linux/module.h b/include/linux/module.h
> > index 59f094fa6f74..4bf869f6c944 100644
> > --- a/include/linux/module.h
> > +++ b/include/linux/module.h
> > @@ -11,6 +11,7 @@
> > =20
> >  #include <linux/list.h>
> >  #include <linux/stat.h>
> > +#include <linux/buildid.h>
> >  #include <linux/compiler.h>
> >  #include <linux/cache.h>
> >  #include <linux/kmod.h>
> > @@ -367,6 +368,9 @@ struct module {
> >       /* Unique handle for this module */
> >       char name[MODULE_NAME_LEN];
> > =20
> > +     /* Module build ID */
> > +     unsigned char build_id[BUILD_ID_SIZE_MAX];
>=20
> Do we want to initialize/store the ID even when
> CONFIG_STACKTRACE_BUILD_ID is disabled and nobody would
> use it?
>=20
> Most struct module members are added only when the related feature
> is enabled.
>=20
> I am not sure how it would complicate the code. It is possible
> that it is not worth it. Well, I could imagine that the API
> will always pass the buildid parameter and
> module_address_lookup() might do something like
>=20
> #ifndef CONFIG_STACKTRACE_BUILD_ID
> static char empty_build_id[BUILD_ID_SIZE_MAX];
> #endif
>=20
>                 if (modbuildid) {
>                         if (IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID))
>                                 *modbuildid =3D mod->build_id;
>                         else
>                                 *modbuildid =3D empty_build_id;
>=20
> IMHO, this is primary a call for Jessica as the module code maintainer.
>=20
> Otherwise, I am fine with this patch. And it works as expected.
>=20

Does declaring mod->build_id as zero length work well enough?

----8<----
diff --git a/include/linux/module.h b/include/linux/module.h
index 4bf869f6c944..03b2f6af093a 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -359,6 +359,12 @@ struct klp_modinfo {
 };
 #endif
=20
+#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
+#define MODULE_BUILD_ID_LEN BUILD_ID_SIZE_MAX
+#else
+#define MODULE_BUILD_ID_LEN 0
+#endif
+
 struct module {
 	enum module_state state;
=20
@@ -369,7 +375,7 @@ struct module {
 	char name[MODULE_NAME_LEN];
=20
 	/* Module build ID */
-	unsigned char build_id[BUILD_ID_SIZE_MAX];
+	unsigned char build_id[MODULE_BUILD_ID_LEN];
=20
 	/* Sysfs stuff. */
 	struct module_kobject mkobj;
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index b835992e76c2..ebd5b30c3039 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -25,7 +25,10 @@
 #include <linux/filter.h>
 #include <linux/ftrace.h>
 #include <linux/kprobes.h>
+#include <linux/build_bug.h>
 #include <linux/compiler.h>
+#include <linux/module.h>
+#include <linux/kernel.h>
=20
 /*
  * These will be re-linked against their real values
@@ -393,10 +396,13 @@ static int __sprint_symbol(char *buffer, unsigned lon=
g address,
=20
 	if (modname) {
 		len +=3D sprintf(buffer + len, " [%s", modname);
-		/* build ID should match length of sprintf below */
-		BUILD_BUG_ON(BUILD_ID_SIZE_MAX !=3D 20);
-		if (IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID) && add_buildid && buildid)
+#if IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
+		if (add_buildid && buildid) {
+			/* build ID should match length of sprintf */
+			static_assert(MODULE_BUILD_ID_LEN =3D=3D 20);
 			len +=3D sprintf(buffer + len, " %20phN", buildid);
+		}
+#endif
 		len +=3D sprintf(buffer + len, "]");
 	}
=20
diff --git a/kernel/module.c b/kernel/module.c
index 6f5bc1b046a5..a0d222fbd281 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2771,7 +2771,17 @@ static void add_kallsyms(struct module *mod, const s=
truct load_info *info)
 	}
 	mod->core_kallsyms.num_symtab =3D ndst;
 }
+#else
+static inline void layout_symtab(struct module *mod, struct load_info *inf=
o)
+{
+}
+
+static void add_kallsyms(struct module *mod, const struct load_info *info)
+{
+}
+#endif /* CONFIG_KALLSYMS */
=20
+#if IS_ENABLED(CONFIG_KALLSYMS) && IS_ENABLED(CONFIG_STACKTRACE_BUILD_ID)
 static void init_build_id(struct module *mod, const struct load_info *info)
 {
 	const Elf_Shdr *sechdr;
@@ -2786,18 +2796,10 @@ static void init_build_id(struct module *mod, const=
 struct load_info *info)
 	}
 }
 #else
-static inline void layout_symtab(struct module *mod, struct load_info *inf=
o)
-{
-}
-
-static void add_kallsyms(struct module *mod, const struct load_info *info)
-{
-}
-
 static void init_build_id(struct module *mod, const struct load_info *info)
 {
 }
-#endif /* CONFIG_KALLSYMS */
+#endif
=20
 static void dynamic_debug_setup(struct module *mod, struct _ddebug *debug,=
 unsigned int num)
 {
