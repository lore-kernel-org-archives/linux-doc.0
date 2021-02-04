Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA093C43381
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:21:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8BF8864F7E
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:21:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239969AbhBDUVB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:21:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239547AbhBDUU7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 15:20:59 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE936C061797
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 12:20:19 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id u15so2382069plf.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 12:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=F9VJiSBsSJrC2jYFpinGxml1C+FEA2FI359p7GFWxRk=;
        b=c/5NkgLk9f8BEYqE56ET8+WzEVofqlfPRO+MbMbE//bUeWJRI02oNDJzpV0SLJhIc5
         6D9RH/prXQsmSQGf9ZgZnJtulSPKZgpfDnA7ktC3nrpRtv+lWuTHekSo3NZ/Nie2Hyb3
         SJOnCJ5RfkMbhhOvVcpnRaN4WpUpxHytY/BYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=F9VJiSBsSJrC2jYFpinGxml1C+FEA2FI359p7GFWxRk=;
        b=VvdTDaCmWOsm+wAMjR4U0AIPrYMSOHy2DfT0+QwVC627lJNB9lrWyhzJbt0piKRwlp
         RlHmSdtEV1wFr2wjORZAclPdGg3FJDOaRKQWdSfiDs8wgzEK1OkqvbGQZj1W2hzMc5+V
         0ZorKUD8uYogsbzRkzG/vSLl68LvnhGKsF0X3gas5DcSKklPDU4lER/M5J5F+4txsJyY
         iuDdwxMKI6rbnZCb1knm1XqRgh+Tdc8vrOS8EA7xSEhk35u5hdEFs7lfS1yyGhweL5Hh
         wpm8uMYO3kZYbU3vONOCHqDc6bfLNdtzfC6L+gmyH83MweYeBCdVNgkmIjGL6iDSp+x9
         pHEg==
X-Gm-Message-State: AOAM532dMkNxmBZ0195puLz01NBbJhWtOAnxwac9YVx47qQWbdQED96o
        TBQsDEQe44WD5uxAXHI6kkG+3g==
X-Google-Smtp-Source: ABdhPJzAoT/duN3/3cQeFbJsfsFNnEoob6e0vNs7paRZBNrsjtPhY9hV5JE0VMUySldPrJ1O+2IAhg==
X-Received: by 2002:a17:902:a517:b029:de:79a7:48d9 with SMTP id s23-20020a170902a517b02900de79a748d9mr794632plq.45.1612470019288;
        Thu, 04 Feb 2021 12:20:19 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id u12sm7319901pgi.91.2021.02.04.12.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:20:18 -0800 (PST)
Date:   Thu, 4 Feb 2021 12:20:17 -0800
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
Subject: Re: [PATCH v19 10/25] x86/mm: Update pte_modify for _PAGE_COW
Message-ID: <202102041220.17A5BFD5BB@keescook>
References: <20210203225547.32221-1-yu-cheng.yu@intel.com>
 <20210203225547.32221-11-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225547.32221-11-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:55:32PM -0800, Yu-cheng Yu wrote:
> The read-only and Dirty PTE has been used to indicate copy-on-write pages.
> However, newer x86 processors also regard a read-only and Dirty PTE as a
> shadow stack page.  In order to separate the two, the software-defined
> _PAGE_COW is created to replace _PAGE_DIRTY for the copy-on-write case, and
> pte_*() are updated.
> 
> Pte_modify() changes a PTE to 'newprot', but it doesn't use the pte_*().
> Introduce fixup_dirty_pte(), which sets a dirty PTE, based on _PAGE_RW,
> to either _PAGE_DIRTY or _PAGE_COW.
> 
> Apply the same changes to pmd_modify().
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
