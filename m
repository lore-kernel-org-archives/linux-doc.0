Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7980BC433ED
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 15:07:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 465B461056
	for <linux-doc@archiver.kernel.org>; Fri,  9 Apr 2021 15:07:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234039AbhDIPH4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 9 Apr 2021 11:07:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233777AbhDIPHz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 9 Apr 2021 11:07:55 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC42BC061761
        for <linux-doc@vger.kernel.org>; Fri,  9 Apr 2021 08:07:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id c6so6844565lji.8
        for <linux-doc@vger.kernel.org>; Fri, 09 Apr 2021 08:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=5R0fVCeHI02UlQLdapgLA7qXq0+kRyGBepCME8oAmkA=;
        b=rc6Z9d4IrUjZ4kexJ6ehZlP6IFxFELakXS9VnTdU1bv6iIntHvfsZUNsj7QkKlZwJB
         h9HN8ZYHKiwQdHk3IU5LT+e60cRaQ2qaK//ec5Gn4aibdvxcnL0AH5jbgC2IvJveUkTn
         0lJRkO8x3efs1EOYUtjTM/1tHAjaBbrprV6udKvD7ELb1TfCEQREsVVFAUa/N9+ZLYr6
         j2f04sXurWjLi5UsN8I71AgGLO1s8vXq2zEEcpXm6cuBK5tbL0hYS/8RAJZ01WTj8j7j
         87iblWwGwyWhmUfqgClFYrJyqKIWBySgwZIbx8QSCstd+Bl0Knj+sUtgVQv9E6G0+ull
         2tCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=5R0fVCeHI02UlQLdapgLA7qXq0+kRyGBepCME8oAmkA=;
        b=PJKHd48EtG5hLk19WkDboz28Pd5iIuxVUQ6VD76NFVrCL/MVRAT89ZNo5O061JW9fa
         PkQ2+EmA8r9xwhQyn2qAYIKczX32LZgPbAV0ZryTaJKx1YDBbNrd2+0g0RRFjz5yG1uI
         zFqCcaJu9AJ+H8fB23zxXOMBNK/jAxz2Rb5eUFPT/k9L+8XuxoUba/F1F270Of0ijuws
         os8/gcgA9Sbi2GJ80cvOFAg94ENJ1SUMBScKxhm8jiKmu5gpJeQmiJzoP5H7Xlg11fEb
         t4hQzVwM2Px2PfxXm3Jij6YK/gXUqC92QnaD9Xx864RgVWDddriydROz8PC6pR20rgP/
         pTvw==
X-Gm-Message-State: AOAM531h3IeABqgdC6Iq+e3V25KKGHzyFstSjg0yHs1MnXYYZjBd9uYa
        uFUa9gLlpnPi98Tl2VDbaMoLKQ==
X-Google-Smtp-Source: ABdhPJy7ldNuQTjwQekvob6ldP9BqT3S8xV53RsxLS7SF7QEPJ/vfYmt9l2XEIpgFi1qf8DmGODT/w==
X-Received: by 2002:a05:651c:2129:: with SMTP id a41mr9940174ljq.193.1617980861126;
        Fri, 09 Apr 2021 08:07:41 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id i4sm290997lfv.161.2021.04.09.08.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 08:07:40 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id C7AEF102498; Fri,  9 Apr 2021 18:07:39 +0300 (+03)
Date:   Fri, 9 Apr 2021 18:07:39 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
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
        Kees Cook <keescook@chromium.org>,
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
        Haitao Huang <haitao.huang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Subject: Re: [PATCH v24 12/30] x86/mm: Update ptep_set_wrprotect() and
 pmdp_set_wrprotect() for transition from _PAGE_DIRTY to _PAGE_COW
Message-ID: <20210409150739.y2ahsuoog6mivckq@box.shutemov.name>
References: <20210401221104.31584-1-yu-cheng.yu@intel.com>
 <20210401221104.31584-13-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210401221104.31584-13-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 01, 2021 at 03:10:46PM -0700, Yu-cheng Yu wrote:
> When Shadow Stack is introduced, [R/O + _PAGE_DIRTY] PTE is reserved for
> shadow stack.  Copy-on-write PTEs have [R/O + _PAGE_COW].
> 
> When a PTE goes from [R/W + _PAGE_DIRTY] to [R/O + _PAGE_COW], it could
> become a transient shadow stack PTE in two cases:
> 
> The first case is that some processors can start a write but end up seeing
> a read-only PTE by the time they get to the Dirty bit, creating a transient
> shadow stack PTE.  However, this will not occur on processors supporting
> Shadow Stack, and a TLB flush is not necessary.
> 
> The second case is that when _PAGE_DIRTY is replaced with _PAGE_COW non-
> atomically, a transient shadow stack PTE can be created as a result.
> Thus, prevent that with cmpxchg.
> 
> Dave Hansen, Jann Horn, Andy Lutomirski, and Peter Zijlstra provided many
> insights to the issue.  Jann Horn provided the cmpxchg solution.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
