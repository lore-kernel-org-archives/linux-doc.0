Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.8 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA7D6C07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:44:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90A48611CC
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:44:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233658AbhGLQrB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 12:47:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232710AbhGLQrB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jul 2021 12:47:01 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D94FC0613DD
        for <linux-doc@vger.kernel.org>; Mon, 12 Jul 2021 09:44:12 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id p8so26527951wrr.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Jul 2021 09:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qv3Vo5xsbAOEJgLGiYQjQnACJg9fyGkdPANxzyRJ0u0=;
        b=YxBBHmI3ihh3rUAZ/HpfxdYI/ND6OwEcRE87eHmz6vpJk0+eabbOKTLzjPAHhaPmZk
         w32aSCR6KLnikoJXR6BtzDh90JoGuS28RKqIIjENeZZmUYEJbwP8Mrqu2BnPsUkY6leN
         mlEGsZM2OSF1zTCti5cuAFklbPzZbbkIXnuCMAn4Inb/Yki03iwTSTwuisyOIqeAKTE7
         QKASs/Hu4FEREVrYg4reYBvWwaJFvJVrj4KE8PiPEYUzXxveOwK7dY2fS5PtuTd6sNzp
         aA44ScWsNdRd6mTHuz1xxlWdPTrQHl8oxnscIvCCbhC8KmermcAzaNyALgsZ3A/HUTSi
         cg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qv3Vo5xsbAOEJgLGiYQjQnACJg9fyGkdPANxzyRJ0u0=;
        b=Ay119wISV2sfeWJdIs8Bo1BzVjFnPFkd3moaz1Ne9WFsCu0eYUQPVuV9OH5tn94bP9
         B5pzmPBJQZ0y8PYaoHCAcCrEOA53nBXHDjCIYr8y6q7+VbYeJZwXG7NA2/8FVyVCEFm+
         pVQ3cCjM9nFZP7OntXqSeFbtz6+/JwPETp8vJVIk9wSzagkEdqf7qjGGFKo5tB0onKrB
         /jYJ9N/sAanPE2JSxVoG63YtM4vLy1vkXVPHc/ENcA2AoT3OPdU4RRhOfjGkBBD2HzGE
         VPUFqk7NkFkOQiAPo/fdbIjcF0ru90f5+vItW1p8Lum0Fix0WlXhCO07El7WHvdZdtCA
         YBtw==
X-Gm-Message-State: AOAM532R2HjBthyGpTtXeDZZreOc1eyZ4QtzbzQRHZODKl3+xOzqSxYk
        //QWSQKEvFnmzSllOK/QyunX2Q==
X-Google-Smtp-Source: ABdhPJwK3VzhGWa3A0Cjl11xE5bb+9d9dgWz6yHyUkbAZ6XWnHp3BGzBwKSF+UhXsDpR3C0/w/Rt9g==
X-Received: by 2002:a5d:530c:: with SMTP id e12mr28211287wrv.130.1626108251006;
        Mon, 12 Jul 2021 09:44:11 -0700 (PDT)
Received: from elver.google.com ([2a00:79e0:15:13:30c:6a5f:a6ae:eba0])
        by smtp.gmail.com with ESMTPSA id f2sm14920362wrq.69.2021.07.12.09.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 09:44:09 -0700 (PDT)
Date:   Mon, 12 Jul 2021 18:44:04 +0200
From:   Marco Elver <elver@google.com>
To:     Woody Lin <woodylin@google.com>
Cc:     Andrey Ryabinin <ryabinin.a.a@gmail.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Alexander Potapenko <glider@google.com>,
        Andrey Konovalov <andreyknvl@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH] mm/kasan: move kasan.fault to mm/kasan/report.c
Message-ID: <YOxxVKvJxVfQxLv7@elver.google.com>
References: <20210712151618.1549371-1-woodylin@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210712151618.1549371-1-woodylin@google.com>
User-Agent: Mutt/2.0.5 (2021-01-21)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 12, 2021 at 11:16PM +0800, 'Woody Lin' via kasan-dev wrote:
> Move the boot parameter 'kasan.fault' from hw_tags.c to report.c, so it
> can support all KASAN modes - generic, and both tag-based.
> 
> Signed-off-by: Woody Lin <woodylin@google.com>
> ---
>  Documentation/dev-tools/kasan.rst |  2 ++
>  mm/kasan/hw_tags.c                | 43 -------------------------------
>  mm/kasan/report.c                 | 29 ++++++++++++++++++---
>  3 files changed, 28 insertions(+), 46 deletions(-)
> 
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index 83ec4a556c19..ab8e27d45632 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -203,6 +203,8 @@ boot parameters that allow disabling KASAN or controlling its features.
>    report or also panic the kernel (default: ``report``). The panic happens even
>    if ``kasan_multi_shot`` is enabled.
>  
> +  Note: The boot parameter 'kasan.fault' is supported by all KASAN modes.

This documentation change seems hacked on. Could we change it like this:

diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
index 83ec4a556c19..21dc03bc10a4 100644
--- a/Documentation/dev-tools/kasan.rst
+++ b/Documentation/dev-tools/kasan.rst
@@ -181,9 +181,16 @@ By default, KASAN prints a bug report only for the first invalid memory access.
 With ``kasan_multi_shot``, KASAN prints a report on every invalid access. This
 effectively disables ``panic_on_warn`` for KASAN reports.
 
+Alternatively, independent of ``panic_on_warn`` the ``kasan.fault=`` boot
+parameter can be used to control panic and reporting behaviour:
+
+- ``kasan.fault=report`` or ``=panic`` controls whether to only print a KASAN
+  report or also panic the kernel (default: ``report``). The panic happens even
+  if ``kasan_multi_shot`` is enabled.
+
 Hardware tag-based KASAN mode (see the section about various modes below) is
 intended for use in production as a security mitigation. Therefore, it supports
-boot parameters that allow disabling KASAN or controlling its features.
+additional boot parameters that allow disabling KASAN or controlling features:
 
 - ``kasan=off`` or ``=on`` controls whether KASAN is enabled (default: ``on``).
 
@@ -199,10 +206,6 @@ boot parameters that allow disabling KASAN or controlling its features.
 - ``kasan.stacktrace=off`` or ``=on`` disables or enables alloc and free stack
   traces collection (default: ``on``).
 
-- ``kasan.fault=report`` or ``=panic`` controls whether to only print a KASAN
-  report or also panic the kernel (default: ``report``). The panic happens even
-  if ``kasan_multi_shot`` is enabled.
-
 Implementation details
 ----------------------
 

[...]
> -/* Whether to panic or print a report and disable tag checking on fault. */
> -bool kasan_flag_panic __ro_after_init;

There's also an extern declaration in kasan.h, which should be removed.

Thanks,
-- Marco
