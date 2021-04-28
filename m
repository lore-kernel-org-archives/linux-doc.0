Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6939FC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:39:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 26D276101C
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242009AbhD1Uj4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 16:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242005AbhD1Ujy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:39:54 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC70C06138C
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:39:08 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id i14so1093390pgk.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Z3WAVPi6tsHxDYkM4thG7PqVeXUU++9bnDuXCoKXmi4=;
        b=ZmnkDIBH98NF1kICfHfEsAXDmL81P1i5sho5DoEipnWM1JRdebMvTIFIB3EZrdbxZn
         y8ClFZHg8i8gUYF0PnrIs3G4b/r+BytJNDQ4uhlC+MiMF0Kec0BZ7gn7keoVd6VL500d
         WrrbVntXIXFqljgruoN87fy+qSt9FsFRYjSW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Z3WAVPi6tsHxDYkM4thG7PqVeXUU++9bnDuXCoKXmi4=;
        b=E5/laamsdf/YwVKPPB4HijQKUE10FL9M0zRFiyxbu7HgvSYrDchJqVvGL6UiQ94W/2
         LjABHGyDY/6MzH2bpuamWNL2g5VYagEe7K5d7rO3OA1jjqFOc+CKQ1p7S6e8J2EfWNf1
         y5rd9yBbfIrv8KqwfTV1uMpVgrY/7YPqEIGtEvmQoax4SizIxivoPNdQFwYFA4Et/0x0
         52AAOrzmccQyUfj5ckYv1LOEFgPLKPbSjRxyJvSSJbwdaBS+j2ReBSjcq2Nwpl+WC6Nk
         m2YfBtpA4/oLoPCJ48x6lfumImyeZzANBp6llIGiUik8AS7wOjOlr6SP/0Z+A1msyenF
         ahoA==
X-Gm-Message-State: AOAM530VAkkZIFHwepu4+yVM31vZHwQy4Xi+e1mP+VpN+SJOZZSF2xDs
        XwfmyCaQQSxI+CGiLVCdOEuQ+g==
X-Google-Smtp-Source: ABdhPJz5qNc4ZUSIrp+d0WTSSyiaj2Rw5P4r2NUtbl4ssPsBN5WfJR8zNykqUu9f6aJ+oaWb6HqSaA==
X-Received: by 2002:a05:6a00:170c:b029:225:8851:5b3c with SMTP id h12-20020a056a00170cb029022588515b3cmr29728717pfc.0.1619642348454;
        Wed, 28 Apr 2021 13:39:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id e10sm493387pfc.40.2021.04.28.13.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:39:07 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:39:07 -0700
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
Subject: Re: [PATCH v26 8/9] x86/vdso/32: Add ENDBR to __kernel_vsyscall
 entry point
Message-ID: <202104281339.F0CA6CA3E@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-9-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-9-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:19PM -0700, Yu-cheng Yu wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> ENDBR is a special new instruction for the Indirect Branch Tracking (IBT)
> component of CET.  IBT prevents attacks by ensuring that (most) indirect
> branches and function calls may only land at ENDBR instructions.  Branches
> that don't follow the rules will result in control flow (#CF) exceptions.
> 
> ENDBR is a noop when IBT is unsupported or disabled.  Most ENDBR
> instructions are inserted automatically by the compiler, but branch
> targets written in assembly must have ENDBR added manually.
> 
> Add that to __kernel_vsyscall entry point.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
