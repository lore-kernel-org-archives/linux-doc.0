Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FB4DC48BDF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 18:19:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA879611CE
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 18:19:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231579AbhFVSV3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 14:21:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbhFVSV2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 14:21:28 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11919C06175F
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 11:19:11 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id 21so233649pfp.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 11:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vHkhwZ3qyE8u/Wp9tD1mKmbxO9a75mKPe922mGmNuX0=;
        b=G3jEIXi56zPU55St8PRRGBMvj09eVkzxvRA4j3a1Za4m32F8oowfljy+MLrjkKMMOY
         gqCyhY+LaI3GsChNsKPysbVlP3uhepiq30BvlWZBsdYL/ga6P7P2Ql75RzMmVgX95CO5
         C8o41QTJPpFtZIvtVtKZ99d5hUQlvpZ6nyYkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vHkhwZ3qyE8u/Wp9tD1mKmbxO9a75mKPe922mGmNuX0=;
        b=IF5MUE8bo1eHeqzj142V6Ushm76uRUEhKfWhLo0Xonj7QIOuOTAEID11nZmW9XqeuW
         bCLonR1j2qoEjaOMdlQjaNmSKx8zYD2EeYYjKLdjguWDzQaJbbkJ1s7mQ22JLaMpdcZ3
         c4b7tSmvIGcObIYhGm1p8e0stwBo+HJ+a2h6wCsZTOtCaip8F2AcFUnQQ3OkGohU/On6
         ADKlYk7bLzBvZ3aPN+NK2ZOKSEAitbTuaWKwsESGf4AyElKUDkNL22G+kJGHWOrZ8Mcx
         yITlZNZl3F2nTx84nkf3lvL9NDY1cBt+89aBRdzQkql1vwJK+jkVWCqcfzWRo013bV9E
         ztdA==
X-Gm-Message-State: AOAM531Zp3s6ll5njTASIyRqW3eroGrT98aEmCNeOrLrBIS7eMPQVDAL
        chHfoxJSYO3N3ogiRqjN7N+Pxg==
X-Google-Smtp-Source: ABdhPJzRGvSboU8eph/ltxaJQHvbwX778zfYgQtOZGbY2hs/9WNU7B/bJjJmayoVyP+gq+Yk/M1xDA==
X-Received: by 2002:a63:a51e:: with SMTP id n30mr24200pgf.104.1624385950559;
        Tue, 22 Jun 2021 11:19:10 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w7sm2921928pjy.11.2021.06.22.11.19.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 11:19:09 -0700 (PDT)
Date:   Tue, 22 Jun 2021 11:19:08 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Bill Wendling <wcw@google.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Peter Oberparleiter <oberpar@linux.ibm.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Luc Van Oostenryck <luc.vanoostenryck@gmail.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
        x86@kernel.org, Borislav Petkov <bp@alien8.de>,
        Martin Liska <mliska@suse.cz>, Marco Elver <elver@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Fangrui Song <maskray@google.com>, linux-doc@vger.kernel.org,
        linux-kbuild@vger.kernel.org, Dmitry Vyukov <dvyukov@google.com>,
        johannes.berg@intel.com, linux-toolchains@vger.kernel.org,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v2 0/3] no_profile fn attr and Kconfig for GCOV+PGO
Message-ID: <202106221118.34BE990@keescook>
References: <20210621231822.2848305-1-ndesaulniers@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621231822.2848305-1-ndesaulniers@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 21, 2021 at 04:18:19PM -0700, Nick Desaulniers wrote:
> Add a new function annotation __no_profile that expands to
> __attribute__((__no_profile_instrument_function__)) and Kconfig values
> CC_HAS_NO_PROFILE_FN_ATTR and ARCH_WANTS_NO_INSTR. Make GCOV and PGO
> depend on either !ARCH_WANTS_NO_INSTR or CC_HAS_NO_PROFILE_FN_ATTR.

Awesome; thanks everyone! I'm doing a Clang rebuild now, and will do
kernel testing and push this to my for-next/clang/features tree shortly.

-- 
Kees Cook
