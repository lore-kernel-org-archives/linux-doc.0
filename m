Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E740C43460
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:29:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 023E561445
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240971AbhD1UaJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 16:30:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbhD1UaI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:30:08 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C447C06138A
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:29:23 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gc22-20020a17090b3116b02901558435aec1so6023181pjb.4
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=UeII31CqNuFlE2BoTtr+fZN9wyzsy3hprcPYll4covw=;
        b=jylj96Rw3QUQm4doFDBK0kop0iQgCV6NfySkOr5T98cqbEgl0duruUVIG5KC7g1OvD
         XbTL/oRiSQ9ur3CZJRvyYbHIxY99dg3xegs4Ok2C8JzBM74t3TX7EC/VLwhZfoPz+u4/
         RcByLq8jJDIgsj0tknp3coppc77n13njbPFO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UeII31CqNuFlE2BoTtr+fZN9wyzsy3hprcPYll4covw=;
        b=OR3C/woHxUzqeqpi02o0i1Diwz1AHKRc5kSLYHpsn99jcIEDhC96YF0yEjrn42Z9ZL
         7ANd9OpdxV8VCj7dd2NKneykJtSRCbFUoUi3tqgQoyAWBO9MOLBe4NXsyq1nW+j8XDbR
         MpULVslM3PUgJGL4csS+QsGrQYd7YljL+vLY/+BHA/IBlauJ6OcxJwkwHj+f9GzWIxB3
         n/2OvCNgof63eVbxENa0y/A8Tl1BY1Je9UOB4CY8CrvPp5MPZmPcALKvyK1yQuXTYyyC
         tHcAQMpbr8ahwnRL+wcl6EhxQhW81Dt4/XH6HUx8lS6OdoUDJvIlkFd6xBM/Td0ECvHm
         3qNA==
X-Gm-Message-State: AOAM530GnmRbmdDPXNoRGLRvpHYmap2RSHf6xPQ+PsIwio37xJwFwa1z
        31Sp7kjy/rIzM9ubkZSUA+iytA==
X-Google-Smtp-Source: ABdhPJwYkEDNlOuREptaQ5l3kQMV3gSjH3e1SrIdJIlzfjRSlDOr3aN5Uamkiddf+M4fmetyZadajQ==
X-Received: by 2002:a17:90a:8c8c:: with SMTP id b12mr36346748pjo.35.1619641762540;
        Wed, 28 Apr 2021 13:29:22 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k15sm516116pfi.0.2021.04.28.13.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:29:21 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:29:20 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Yu-cheng Yu <yu-cheng.yu@intel.com>
Cc:     x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-arch@vger.kernel.org, linux-api@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        Andy Lutomirski <luto@kernel.org>,
        Balbir Singh <bsingharora@gmail.com>,
        Borislav Petkov <bp@alien8.de>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Eugene Syromiatnikov <esyr@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        "H.J. Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
        Vedvyas Shanbhogue <vedvyas.shanbhogue@intel.com>,
        Dave Martin <Dave.Martin@arm.com>,
        Weijiang Yang <weijiang.yang@intel.com>,
        Pengfei Xu <pengfei.xu@intel.com>,
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v26 1/9] x86/cet/ibt: Add Kconfig option for Indirect
 Branch Tracking
Message-ID: <202104281329.564AACB@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-2-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-2-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:12PM -0700, Yu-cheng Yu wrote:
> Indirect Branch Tracking (IBT) provides protection against CALL-/JMP-
> oriented programming attacks.  It is active when the kernel has this
> feature enabled, and the processor and the application support it.
> When this feature is enabled, legacy non-IBT applications continue to
> work, but without IBT protection.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
