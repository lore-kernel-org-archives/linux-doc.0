Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70A74C43460
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 11:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54500616E9
	for <linux-doc@archiver.kernel.org>; Tue, 11 May 2021 11:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhEKLgp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 May 2021 07:36:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231459AbhEKLgp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 May 2021 07:36:45 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC534C06174A
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 04:35:38 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i9so21585411lfe.13
        for <linux-doc@vger.kernel.org>; Tue, 11 May 2021 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Le0Ew1Hg9KvgF6la0IVI4c8P/UYPK3oIC8S0v1P/CXY=;
        b=UV4F7xsUhFUHbA1Rt4aUC+TkWj2LsXA90mQqrzmQetnGSqhTWOhlHIdRmNkriRRdHG
         En11f5rwNkzEopt/p81S0ZLB7JqTWk3Sg+oDmy7bKDWwpRgIuABxB4hVFpzKq5lQkyQO
         lzWzvMvCcV+3cC+u3Af/IXNj83qwkghjYLpXRnB67s4FXmUFZz1q4RcJM5RuHFudut0n
         QKcimK7Iulxv3/gPkMwastZrAozSuyOcanocRWiE2RJhRS2bA8TVetZRUglbLOjCv3JR
         nGZFENVvZKIrLb88wJVbs5XExg8wbyn5/YK+ESrw0NQAmJco0W2ZGHjhx4P9IUEH3cBv
         nLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Le0Ew1Hg9KvgF6la0IVI4c8P/UYPK3oIC8S0v1P/CXY=;
        b=EWxVRAfgT0qL0wzQHWAz1p4CMAHjh4Judu63t6V23IfNe4Q4EBC8aLgb7pCk6LhEty
         1LUEz8nslFg6RohLQZoTxkYj2b4pVEmQoA/uZ+wQDQh2R0bYeN33DTCp8oDj1USRwTJq
         f85JWoxpEMP5Hr0DaLeAoVQ5q3XVX17gabCuv4UIZLLZXQpDtq+fJuJiiQ6rxa2FVHe4
         CRW5v9hlF7URBkTe6PTvTByi47NnXTBPIrikt01sdv+aVqzPuGzMJ5Ct81kOkjFrs7Oo
         vj9Kmh1fpJqQS/HOh2g5hu8luVIPyAxguJxNU2CbWk6lbktqG/bo5NEHK9KVGR96aGIo
         P7aA==
X-Gm-Message-State: AOAM530b382GmE4MwgeCJ1jlZfWG8i85c6Et5Jtateqa0IR94MZbF1EL
        KMPOUWa7WfjpfF52g4gvUcpCPQ==
X-Google-Smtp-Source: ABdhPJxDAf43hUbtVcN3je+p5bV1NnAEkVOyB91N3WfTapOVx8IiLDHDsJqmKf0Ko6pqzpOzMNntKA==
X-Received: by 2002:a05:6512:374b:: with SMTP id a11mr20151995lfs.377.1620732937423;
        Tue, 11 May 2021 04:35:37 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id u27sm2578687lfm.239.2021.05.11.04.35.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 04:35:36 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 0E4C5102615; Tue, 11 May 2021 14:35:37 +0300 (+03)
Date:   Tue, 11 May 2021 14:35:37 +0300
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
        Catalin Marinas <catalin.marinas@arm.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v26 29/30] mm: Update arch_validate_flags() to test vma
 anonymous
Message-ID: <20210511113537.d2uqen4pyh6xx53o@box>
References: <20210427204315.24153-1-yu-cheng.yu@intel.com>
 <20210427204315.24153-30-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204315.24153-30-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:43:14PM -0700, Yu-cheng Yu wrote:
> When newer VM flags are being created, such as VM_MTE, it becomes necessary
> for mmap/mprotect to verify if certain flags are being applied to an
> anonymous VMA.
> 
> To solve this, one approach is adding a VM flag to track that MAP_ANONYMOUS
> is specified [1], and then using the flag in arch_validate_flags().
> 
> Another approach is passing the VMA to arch_validate_flags(), and check
> vma_is_anonymous().
> 
> To prepare the introduction of PROT_SHADOW_STACK, which creates a shadow
> stack mapping and can be applied only to an anonymous VMA, update
> arch_validate_flags() to pass in the VMA.
> 
> [1] commit 9f3419315f3c ("arm64: mte: Add PROT_MTE support to mmap() and mprotect()"),
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
