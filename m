Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FD49C433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:39:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1535C64F43
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:39:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbhBDUji (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:39:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240094AbhBDUXg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 15:23:36 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 786CAC061788
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 12:22:56 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id d26so1587269pfn.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 12:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=388dygswvemg3Mj3TiR7mQNJ/V6JIsMVBitRKVSrLsY=;
        b=YBxlqh3o4VbdvCSD8fiFV07eUilq+0xn80cMGEG4eVl46Gc/k3lWSMs/5g7fP5iXe1
         MHCEVDlZsBWs6S/5TBVbdo/n3Twj70ulawIUmo04ahBphIU6j6i7QJqqkR6EQp9e/h2D
         vytPtTBr/gks7MTZzAPC5ap2f0bLl9MipDB0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=388dygswvemg3Mj3TiR7mQNJ/V6JIsMVBitRKVSrLsY=;
        b=GRIGZIfOqhqXfCxlTuggD2yA7stvnBQIQwLSjsmhMubUq+Q6IPoOJ7iuGfWG27FvKr
         qfjbbVwqKM0R+sBk9O3SO/ADLkNNVlrAEFWqDU2IiGEX3S4xZ7ZQVaa2x79yZw4GDzAM
         90lOg8WKi7XQ9/8iXfzrnXP6sJa7j9zhRLBXvz+0JCLI0Obt4kqHQvO5YTgSuhgdYFPY
         GjvJnG9w+adYx70kQlyfpQ82s6Fn/CZCKmXXJom5JMDObYjy68IDTdO+cwOtkk7U4BsH
         4g1pOrWPl7mGm5e8ggA1V6WJpPqDvACmYDYJA1W2J73ZFpj6XGGcL5PCqv55bioHi7pp
         DTnw==
X-Gm-Message-State: AOAM532aKpajFrzX5+VURfi3b4Fcq3j64GSZkzEb0KSlY5pvTDpiZXG3
        GCVBpSspH9E7BbDNGBFXr7MqHg==
X-Google-Smtp-Source: ABdhPJwWgksGDBlRqYjE9XMhgf8NQ8Q9/HDu4uVh6JKJ+AthAtLYo5N1j7SLRKfmihKDYNlkwLJYqQ==
X-Received: by 2002:a63:1865:: with SMTP id 37mr738085pgy.206.1612470176112;
        Thu, 04 Feb 2021 12:22:56 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r194sm6560531pfr.168.2021.02.04.12.22.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:22:54 -0800 (PST)
Date:   Thu, 4 Feb 2021 12:22:54 -0800
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
        Pengfei Xu <pengfei.xu@intel.com>
Subject: Re: [PATCH v19 15/25] mm: Fixup places that call pte_mkwrite()
 directly
Message-ID: <202102041222.C53C9A462@keescook>
References: <20210203225547.32221-1-yu-cheng.yu@intel.com>
 <20210203225547.32221-16-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225547.32221-16-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:55:37PM -0800, Yu-cheng Yu wrote:
> When serving a page fault, maybe_mkwrite() makes a PTE writable if it is in
> a writable vma.  A shadow stack vma is writable, but its PTEs need
> _PAGE_DIRTY to be set to become writable.  For this reason, maybe_mkwrite()
> has been updated.
> 
> There are a few places that call pte_mkwrite() directly, but effect the
> same result as from maybe_mkwrite().  These sites need to be updated for
> shadow stack as well.  Thus, change them to maybe_mkwrite():
> 
> - do_anonymous_page() and migrate_vma_insert_page() check VM_WRITE directly
>   and call pte_mkwrite(), which is the same as maybe_mkwrite().  Change
>   them to maybe_mkwrite().
> 
> - In do_numa_page(), if the numa entry 'was-writable', then pte_mkwrite()
>   is called directly.  Fix it by doing maybe_mkwrite().
> 
> - In change_pte_range(), pte_mkwrite() is called directly.  Replace it with
>   maybe_mkwrite().
> 
>   A shadow stack vma is writable but has different vma
> flags, and handled accordingly in maybe_mkwrite().
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
