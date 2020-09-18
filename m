Return-Path: <SRS0=bpCa=C3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA336C43463
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 11:44:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AADFA207D3
	for <linux-doc@archiver.kernel.org>; Fri, 18 Sep 2020 11:44:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sFh/HHTO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgIRLoA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Sep 2020 07:44:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726121AbgIRLn7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Sep 2020 07:43:59 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7A77C061756
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2020 04:43:59 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so2844996plt.9
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2020 04:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z+Ama2Gn35NOMvXg+GDJdwPlC6h7Yc/5hgNBNtL9jUY=;
        b=sFh/HHTOb26PpO+ksRIrJCdmApW1t5VywnOdPyUzGIrw5Rbwj3WMJL40NtTIEFL6AS
         /lx2uK4Ykc/3gzLN9LEzeNwb43AzA5+LpUbw11A3p7pF2vSsdF1oFOmS0qEp4LPRh67f
         mcOc75W8mSvx8mBa0OvstLr0qk9JsPiUHvMWC9mVnjlIr/TOTToZoncnx7GsabThWYmc
         z0Hv+BcPS0Tbym+ibXXN2ck4SCHKjgsMTmsO3TXlwDN+yjWVuvp0Doo0Pls9cufQjkqv
         zaUjpORJE12lyCrcY36729qZQzyW6h48J9jJj1hq+GnbrPQo8wbuyyXUv2baq0C0G9WQ
         acrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z+Ama2Gn35NOMvXg+GDJdwPlC6h7Yc/5hgNBNtL9jUY=;
        b=nm6aFQBWIclW/LaplSH/VUQqINyc1pGQaA3amx/WjAGFlBFwz4gXV9ru/ip/PmvH/g
         m1trSZ6MgV/rmKl6nHtcl61JLcS+xihNvJ5wdyYkuU2Z07U82YDEG4b9ly69wCd/tNaa
         RuyNSWg/FZOE+5c92xNhJ1aDMO1MiTpTJnw+A4LtsDcWl3ai3Rypx/Lugv+I4jh7ZqL0
         mKhlQ/uE2Xh3IfeQQAnMBbmJde/BXfTROHOjrW/tcEOxuQGaaoTgOOLjEs76Rb4n77+T
         WGZZthLmMHjcEseC0Tk+v8iEfQD/cniE81k9jmSlIASHk6TRnB20QuKK7Ph03eVgHUAk
         M2ZA==
X-Gm-Message-State: AOAM530dxR2Ujc9EzowYsu9im8QKCMcY4b+NeNY8qqtWBFP0BlIrtJpd
        PcVeOe7q2qOd1Eo3ciELZ6Boyl0ZfJ7Ze9NYcQViJw==
X-Google-Smtp-Source: ABdhPJyKXFnzPYcYunpF9Uq+vq4TWzzKJynH7m2jTv2e+g7vCM0/LcoGLE6fnd5HeX/rpgzwoYJKnWY7Jm9IFnnE3Xk=
X-Received: by 2002:a17:90b:140c:: with SMTP id jo12mr12638805pjb.41.1600429438957;
 Fri, 18 Sep 2020 04:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200917134407.63487-1-standby24x7@gmail.com>
In-Reply-To: <20200917134407.63487-1-standby24x7@gmail.com>
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Fri, 18 Sep 2020 13:43:48 +0200
Message-ID: <CAAeHK+x=X=m0yGCu-vsfvHRDY_6kPpiHWtktiun4yF2MxgFffg@mail.gmail.com>
Subject: Re: [PATCH linux-next] docs:dev-tools: Fix typo in Documentation/dev-tools
To:     Masanari Iida <standby24x7@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 17, 2020 at 3:44 PM Masanari Iida <standby24x7@gmail.com> wrote:
>
> This patch fixes some spelling typos found in
> Documentation/dev-tools.
>
> Signed-off-by: Masanari Iida <standby24x7@gmail.com>
> ---
>  Documentation/dev-tools/kasan.rst    | 4 ++--
>  Documentation/dev-tools/kcov.rst     | 2 +-
>  Documentation/dev-tools/kmemleak.rst | 2 +-
>  3 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/dev-tools/kasan.rst b/Documentation/dev-tools/kasan.rst
> index c09c9ca2ff1c..49ec0ab6cfc7 100644
> --- a/Documentation/dev-tools/kasan.rst
> +++ b/Documentation/dev-tools/kasan.rst
> @@ -328,7 +328,7 @@ using something like insmod or modprobe. The module is called ``test_kasan``.
>  ~~~~~~~~~~~~~
>
>  With ``CONFIG_KUNIT`` built-in, ``CONFIG_KASAN_KUNIT_TEST`` can be built-in
> -on any architecure that supports KASAN. These and any other KUnit
> +on any architecture that supports KASAN. These and any other KUnit
>  tests enabled will run and print the results at boot as a late-init
>  call.
>
> @@ -349,5 +349,5 @@ converted to KUnit. These tests can be run only as a module with
>  ``CONFIG_KASAN`` built-in. The type of error expected and the
>  function being run is printed before the expression expected to give
>  an error. Then the error is printed, if found, and that test
> -should be interpretted to pass only if the error was the one expected
> +should be interpreted to pass only if the error was the one expected
>  by the test.
> diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
> index 8548b0b04e43..d2c4c27e1702 100644
> --- a/Documentation/dev-tools/kcov.rst
> +++ b/Documentation/dev-tools/kcov.rst
> @@ -243,7 +243,7 @@ handles as they don't belong to a particular subsystem. The bytes 4-7 are
>  currently reserved and must be zero. In the future the number of bytes
>  used for the subsystem or handle ids might be increased.
>
> -When a particular userspace proccess collects coverage via a common
> +When a particular userspace process collects coverage via a common
>  handle, kcov will collect coverage for each code section that is annotated
>  to use the common handle obtained as kcov_handle from the current
>  task_struct. However non common handles allow to collect coverage
> diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
> index a41a2d238af2..1c935f41cd3a 100644
> --- a/Documentation/dev-tools/kmemleak.rst
> +++ b/Documentation/dev-tools/kmemleak.rst
> @@ -229,7 +229,7 @@ Testing with kmemleak-test
>
>  To check if you have all set up to use kmemleak, you can use the kmemleak-test
>  module, a module that deliberately leaks memory. Set CONFIG_DEBUG_KMEMLEAK_TEST
> -as module (it can't be used as bult-in) and boot the kernel with kmemleak
> +as module (it can't be used as built-in) and boot the kernel with kmemleak
>  enabled. Load the module and perform a scan with::
>
>          # modprobe kmemleak-test

Reviewed-by: Andrey Konovalov <andreyknvl@google.com>
