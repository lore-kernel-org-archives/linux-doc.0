Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B518C433C1
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 11:32:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4423F619A3
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 11:32:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbhCVLbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbhCVLbP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 07:31:15 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2D2C061763
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 04:31:14 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id a198so20689026lfd.7
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=W1w9xIW1N250EUFGaucw8NiWDfeMcMLKF9xerDg59Sg=;
        b=c8J6d+uJpziOInuiIgF76cKwKfjWpAdkplio0YS0yU0VhpyjuGkexA0TobTPHyIjJr
         trsjfvWByIY/pi+0UcM2oqIF7zijUwZs0dfE3o5z9zzGgEnuG0pzidW8HOSfnDZHaMX1
         Bb32BHW+e7ySRAd8v8+mq/XRcXflQxECYQ/6xQsXU2cjXPiQ8eypqlS/m0VaH+YfL0+M
         4pl/aE7uJGtdjjy2pjq7drs/mHGYw1XxrFx+diLJRzr3olG9nyezX7top3qh2FK/Px9Z
         PDWIgxpHu++lZV7p0y83RURtTNJifTURhS11QivpmZYQeWNxVhlB6Mg4D9wVuNNDilSw
         P5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=W1w9xIW1N250EUFGaucw8NiWDfeMcMLKF9xerDg59Sg=;
        b=p0r+fl8OLxX6Hw1BreS7Jh9AUIGV2HgQQ9boW96Zy8yv3UGO8wYtcRin49G+ZXKk6e
         LGQvdrIlh7/4l7U4XHPdgLbwAqNm5LqfpKt1i+HgADIqA8AYaNMhPX4n/elNNvRGbiOa
         76kHXWx/kDVqv3RJmvmTU7j1KGAc0/LoIDcwWTOEMaXLhIBTGLxEcwKmcYSkAcVbO8VR
         tRzScwMgdMaHxX2PS4hwHzTocn+Z+wjr7rPPHHLLaozq+ULaMb3a6d40RWVW22Eb9pzq
         oUgSVXVTGXPwOMIj5LXqzO4hGEo+uZMUeM2qypa+dn7wFxNWzQGL1wsO+YWIDTmjM9VA
         AAKg==
X-Gm-Message-State: AOAM532PeXzPRaRNcY6iS5xWXrleZ+bdw4IJ7siBev6qmROF86WBoXLk
        h0UIg1Ic8ZDR+T9uiI08/DV7dg==
X-Google-Smtp-Source: ABdhPJxx6w/IrkyzNZNe9wJX93bhPJOm2+KsH61p1K12gRn3V/V44NNZfa5MrvxW018BX205rCWNNw==
X-Received: by 2002:ac2:41c5:: with SMTP id d5mr8760075lfi.459.1616412673497;
        Mon, 22 Mar 2021 04:31:13 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id p22sm1546237lfh.113.2021.03.22.04.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 04:31:13 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 87326101DEB; Mon, 22 Mar 2021 14:31:20 +0300 (+03)
Date:   Mon, 22 Mar 2021 14:31:20 +0300
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
        Haitao Huang <haitao.huang@intel.com>
Subject: Re: [PATCH v23 11/28] x86/mm: Update pte_modify for _PAGE_COW
Message-ID: <20210322113120.4qloiyj4ojmiis6n@box>
References: <20210316151054.5405-1-yu-cheng.yu@intel.com>
 <20210316151054.5405-12-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316151054.5405-12-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 16, 2021 at 08:10:37AM -0700, Yu-cheng Yu wrote:
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

Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

-- 
 Kirill A. Shutemov
