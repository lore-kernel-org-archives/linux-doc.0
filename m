Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2645DC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:50:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3C86613C5
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 10:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238640AbhD1Kve (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 06:51:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229811AbhD1Kvd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 06:51:33 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5C7C061574
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 03:50:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id m9so49779126wrx.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dFlrZNwewzJjjzd4Q3foni0JHdVNBMcKnh6aPt1+A68=;
        b=Vx0zC10HAWNZtl1sFotO4aplomYeqGuymbDIKRjYBfg9PaUs2BBSUa6WzHKwzrxnX9
         8LqMHPlczsofq9PvMtndv5XuBEvhWC8XST+srJ/3wLLnX1G9mh2aMj6nKUCoaKcORXTi
         kJXAi2O75XvmAK1KlVI17Ii2/Z4CqjFlMXeaJ/STl5S7hIIUIgJKzCf9J8rSBBk8GGSv
         1M98f/XCXHNY1Byyy53S4mXXaqGMya0Xi/VSNvsSqYAUZfBDtlYQ8p8pAtoHSM90avxF
         Cemg5m64+46kBAwBu82Ao/Mdj4NrlxDFgu3z9U0ipyj/VGuThoNDnceCa66A6jw3eKwa
         TZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dFlrZNwewzJjjzd4Q3foni0JHdVNBMcKnh6aPt1+A68=;
        b=UW4HUz24/74KHcj+rU3SEaGIca1sEsc0g7tz/iegXLPeShALc0cd272hLd2sFAgPHJ
         eR9MvTx0f8dDPNco3srOue7mSMVJpiEzSYaYFAatbhvBfGujwVRSjSmhhozKzLaiLs9I
         KECcd7D1qnVy2y/NtKBymWldX9Os4zDF/zkLa0GM4i05Jg3QaIMnX3qZqcCstE57lmrx
         WZql+RMN41PO7bHu9F25LKSO4/hHTAoynpqEznY6Nzuu6Fmmf/idK8fMaEksFwBxmaOR
         oUgEUIC7PcAth480+vp4kvS1a88AfpVSzQdSJTmTXaw0Tdq7MMyR+SOrn0lREiOBjKBf
         UglQ==
X-Gm-Message-State: AOAM533mtLiC6pkycvBssyRFgX1znTGb330uSQZWWXDhzKshd214agqw
        GAl3coAILSDayTCErS9ma5ejAy54Vl7mFg==
X-Google-Smtp-Source: ABdhPJzQeRE82S377/tNYKWOwvtZORQAU8YHKTWHgdf0we8Asm93G7iMvssrWLEENNxUzsXTnDkERA==
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr34773624wrw.172.1619607047463;
        Wed, 28 Apr 2021 03:50:47 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:2487:1bd4:1f2b:61f5])
        by smtp.gmail.com with ESMTPSA id a15sm7448349wrr.53.2021.04.28.03.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 03:50:46 -0700 (PDT)
Date:   Wed, 28 Apr 2021 11:50:46 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, bobwxc@email.cn,
        chenhuacai@kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH] docs/core-api: Consistent code style
Message-ID: <YIk+Bp4M4zVAXjpo@google.com>
References: <20210428100720.1076276-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20210428100720.1076276-1-siyanteng@loongson.cn>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Apr 28, 2021 at 06:07:20PM +0800, Yanteng Si wrote:
>all `example` in this file should be replaced with ``example``.
>
>Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>---
> Documentation/core-api/symbol-namespaces.rst | 26 ++++++++++----------
> 1 file changed, 13 insertions(+), 13 deletions(-)
>
>diff --git a/Documentation/core-api/symbol-namespaces.rst b/Documentation/core-api/symbol-namespaces.rst
>index 9b76337f6756..5ad9e0abe42c 100644
>--- a/Documentation/core-api/symbol-namespaces.rst
>+++ b/Documentation/core-api/symbol-namespaces.rst
>@@ -43,14 +43,14 @@ exporting of kernel symbols to the kernel symbol table, variants of these are
> available to export symbols into a certain namespace: EXPORT_SYMBOL_NS() and
> EXPORT_SYMBOL_NS_GPL(). They take one additional argument: the namespace.
> Please note that due to macro expansion that argument needs to be a
>-preprocessor symbol. E.g. to export the symbol `usb_stor_suspend` into the
>-namespace `USB_STORAGE`, use::
>+preprocessor symbol. E.g. to export the symbol ``usb_stor_suspend`` into the
>+namespace ``USB_STORAGE``, use::
>
> 	EXPORT_SYMBOL_NS(usb_stor_suspend, USB_STORAGE);
>
>-The corresponding ksymtab entry struct `kernel_symbol` will have the member
>-`namespace` set accordingly. A symbol that is exported without a namespace will
>-refer to `NULL`. There is no default namespace if none is defined. `modpost`
>+The corresponding ksymtab entry struct ``kernel_symbol`` will have the member
>+``namespace`` set accordingly. A symbol that is exported without a namespace will
>+refer to ``NULL``. There is no default namespace if none is defined. ``modpost``
> and kernel/module.c make use the namespace at build time or module load time,
> respectively.
>
>@@ -64,7 +64,7 @@ and EXPORT_SYMBOL_GPL() macro expansions that do not specify a namespace.
>
> There are multiple ways of specifying this define and it depends on the
> subsystem and the maintainer's preference, which one to use. The first option
>-is to define the default namespace in the `Makefile` of the subsystem. E.g. to
>+is to define the default namespace in the ``Makefile`` of the subsystem. E.g. to
> export all symbols defined in usb-common into the namespace USB_COMMON, add a
> line like this to drivers/usb/common/Makefile::
>
>@@ -96,7 +96,7 @@ using a statement like::
>
> 	MODULE_IMPORT_NS(USB_STORAGE);
>
>-This will create a `modinfo` tag in the module for each imported namespace.
>+This will create a ``modinfo`` tag in the module for each imported namespace.
> This has the side effect, that the imported namespaces of a module can be
> inspected with modinfo::
>
>@@ -113,7 +113,7 @@ metadata definitions like MODULE_AUTHOR() or MODULE_LICENSE(). Refer to section
> 4. Loading Modules that use namespaced Symbols
> ==============================================
>
>-At module loading time (e.g. `insmod`), the kernel will check each symbol
>+At module loading time (e.g. ``insmod``), the kernel will check each symbol
> referenced from the module for its availability and whether the namespace it
> might be exported to has been imported by the module. The default behaviour of
> the kernel is to reject loading modules that don't specify sufficient imports.
>@@ -138,19 +138,19 @@ missing imports. Fixing missing imports can be done with::
> A typical scenario for module authors would be::
>
> 	- write code that depends on a symbol from a not imported namespace
>-	- `make`
>+	- ``make``
> 	- notice the warning of modpost telling about a missing import
>-	- run `make nsdeps` to add the import to the correct code location
>+	- run ``make nsdeps`` to add the import to the correct code location
>
> For subsystem maintainers introducing a namespace, the steps are very similar.
>-Again, `make nsdeps` will eventually add the missing namespace imports for
>+Again, ``make nsdeps`` will eventually add the missing namespace imports for
> in-tree modules::
>
> 	- move or add symbols to a namespace (e.g. with EXPORT_SYMBOL_NS())

Actually, that could also be made ``EXPORT_SYMBOL_NS()``. Similarly,
MODULE_IMPORT_NS, DEFAULT_SYMBOL_NAMESPACE and other occurrences or
EXPORT_SYMBOL* variants could be adjusted as well.

Nevertheless, thanks for the change!

Acked-by: Matthias Maennich <maennich@google.com>

Cheers,
Matthias

>-	- `make` (preferably with an allmodconfig to cover all in-kernel
>+	- ``make`` (preferably with an allmodconfig to cover all in-kernel
> 	  modules)
> 	- notice the warning of modpost telling about a missing import
>-	- run `make nsdeps` to add the import to the correct code location
>+	- run ``make nsdeps`` to add the import to the correct code location
>
> You can also run nsdeps for external module builds. A typical usage is::
>
>-- 
>2.27.0
>
