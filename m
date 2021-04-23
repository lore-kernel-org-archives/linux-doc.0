Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CC73C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 10:27:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BD41611CA
	for <linux-doc@archiver.kernel.org>; Fri, 23 Apr 2021 10:27:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbhDWK1q (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Apr 2021 06:27:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbhDWK1p (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Apr 2021 06:27:45 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27598C061574
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 03:27:09 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id t14so19635695lfe.1
        for <linux-doc@vger.kernel.org>; Fri, 23 Apr 2021 03:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=eWgAF6RQPL0b2x8b0Xdx/qwinLYytBxZ3RTzqyQw9+Q=;
        b=bkGdRfNnfy85o3qJkLv102MyP7pn4K3UpxeWrw33RGLg+1RUrWeCkMjX7a68IASh9K
         9wzf55FBQ/p6M5U32HxtpUch5JfX6evOwg7Z9EC6S+zFI3bLvRcxDxDN+xAHOkxZwIq1
         M1WP3vo6Mo/Y1pPSdKy4PHh5fYoQ4resPWoj4tp2E4pjP/dVNRz1h65VD6B05djccUfO
         2lOkZhqMBNjGiW5iC46LLvNl55o4IncIgfWkrGVBknc7Nfgc7eGCc363QGxQ7SHI+l9A
         lBTuyeynaCQEmtR1SO96RcUMq7y9QlmpTK61k5yeSEN2Drmyluw3He+Nd9tbhI8o5PQW
         Gvbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=eWgAF6RQPL0b2x8b0Xdx/qwinLYytBxZ3RTzqyQw9+Q=;
        b=YBhXYRlSjssCz2yJRs4Kxcv8gfuSXMT2qvpftJu3SIqPSMJqBZnr7p4u6kHdi/tTwg
         7dlAqiCYuzJEcVkr0CVr7YDV1QhwmJlEnzsORjyrac+WlFFSAKoHSFIOiPpDzP1uqp44
         nCXTSOSjqQrOPwnc+Gy8mCJq50J9Ujje8cTCTIM87MNRTTjGul3QYxIUkrleBrFRi2c0
         jxyww6J+nNWn8V0FxC2zksIrGfllU2KMlfF4Qm+P1oZDSoabcht/g4oH28GxsfJvdy+p
         OrquoanVUSZuMI0moe+n6eSr2isO5sr072CBsSHD8IHpJIJB7QFUNtNiahLLZuc3kXXB
         y86A==
X-Gm-Message-State: AOAM532IAe9rPaQHPsMC4cyMy8LCPgmK+xhf85ew5pj1ckaz4z7dVGMJ
        X5xx/dOFdvM/oxRB4QX8GgfnYw==
X-Google-Smtp-Source: ABdhPJxVdMtHaH4N7qrL7rs/iFLid0SiR/0I34D5a7seDxpN0PPppOm4pkZaxAKafv5e87oh9CjIYQ==
X-Received: by 2002:a05:6512:3c96:: with SMTP id h22mr2178504lfv.574.1619173627715;
        Fri, 23 Apr 2021 03:27:07 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id z17sm511847lfd.87.2021.04.23.03.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 03:27:07 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id E050010257F; Fri, 23 Apr 2021 13:27:08 +0300 (+03)
Date:   Fri, 23 Apr 2021 13:27:08 +0300
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
Subject: Re: [PATCH v25 20/30] mm/mprotect: Exclude shadow stack from
 preserve_write
Message-ID: <20210423102708.bau7z4xmgvtubl5y@box.shutemov.name>
References: <20210415221419.31835-1-yu-cheng.yu@intel.com>
 <20210415221419.31835-21-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210415221419.31835-21-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 03:14:09PM -0700, Yu-cheng Yu wrote:
> In change_pte_range(), when a PTE is changed for prot_numa, _PAGE_RW is
> preserved to avoid the additional write fault after the NUMA hinting fault.
> However, pte_write() now includes both normal writable and shadow stack
> (RW=0, Dirty=1) PTEs, but the latter does not have _PAGE_RW and has no need
> to preserve it.
> 
> Exclude shadow stack from preserve_write test, and apply the same change to
> change_huge_pmd().
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
