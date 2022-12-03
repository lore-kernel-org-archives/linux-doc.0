Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883B7C47088
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 02:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235116AbiLCCm0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 21:42:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234993AbiLCCmZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:42:25 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A069DFA477
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:42:24 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id 140so6550588pfz.6
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=meefZluJRT8R1ZjwlCgxWmtfD4FhrgL7NrJdXoDBmDg=;
        b=MTgb8KAwPwhviwDCMgXJisTzBHivsq3T5iFl2j3sa72GQLKq316gETtxR6MxReMlP9
         OScIiVPvewVlAKwI9xxH1OoS70ozLjqj7rE3Yi6ELTKGwnUKk0manJYTzF7OpY/IWbYM
         YP28xqv0zglEeg8XLHPqcThJxDDXme/w/AILc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=meefZluJRT8R1ZjwlCgxWmtfD4FhrgL7NrJdXoDBmDg=;
        b=Wq2F/ZlQEoE43PJ7VMhd3OtdVR9X6OcZanGYuiqXe6ON0U13FZUIwJj9Ka3rgHhp26
         itdpcpif6ujFbr+2mNIx3QTKvzxkIbsooYNdsifiR+tghYYUXNlTYU0wdM/iJQQp3SLB
         9joib3EzDmnmEOahiofe+G0fjyRcqLNCVkftsrZ4Ofsp/oPPYj7COQF6cV0W2tgrTHpB
         8Zsb2Y4Ka17TJOpQmSGD5XGAJb8/55cYdZvkzkBYCH07YcQuIzflg2RWG+d4JeTcDkXa
         Hsk6PFa7/L8C39oJGBJQ+RMJOW/s3eVAxqLThB7mYWBDc6OG3d2E6IgRMjxpqDr/c03P
         D7bA==
X-Gm-Message-State: ANoB5pnKbkPooie0xKTW09kIMPeDH6OrppLOY4hufTELNM1KMe2w5eIw
        NYngJJ4jRp4EwbqDFiw2r02+mA==
X-Google-Smtp-Source: AA0mqf6nBAfJOSwwSZ437KK8J11H4vJ/7I2F5AOtpkwNBwwS77nrLl03wK13FIkg0xoppkHEZVitag==
X-Received: by 2002:a65:4c48:0:b0:478:24b4:1a7e with SMTP id l8-20020a654c48000000b0047824b41a7emr23581417pgr.516.1670035343071;
        Fri, 02 Dec 2022 18:42:23 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id o13-20020a17090a0a0d00b0021896fa945asm7230803pjo.15.2022.12.02.18.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:42:22 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:42:21 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc:     x86@kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
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
        "H . J . Lu" <hjl.tools@gmail.com>, Jann Horn <jannh@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Nadav Amit <nadav.amit@gmail.com>,
        Oleg Nesterov <oleg@redhat.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Weijiang Yang <weijiang.yang@intel.com>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        John Allen <john.allen@amd.com>, kcc@google.com,
        eranian@google.com, rppt@kernel.org, jamorris@linux.microsoft.com,
        dethoma@microsoft.com, akpm@linux-foundation.org,
        Andrew.Cooper3@citrix.com, christina.schimpe@intel.com
Subject: Re: [PATCH v4 25/39] x86: Introduce userspace API for shadow stack
Message-ID: <202212021842.28A81923A@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-26-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-26-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:52PM -0800, Rick Edgecombe wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Add three new arch_prctl() handles:
> 
>  - ARCH_SHSTK_ENABLE/DISABLE enables or disables the specified
>    feature. Returns 0 on success or an error.
> 
>  - ARCH_SHSTK_LOCK prevents future disabling or enabling of the
>    specified feature. Returns 0 on success or an error
> 
> The features are handled per-thread and inherited over fork(2)/clone(2),
> but reset on exec().
> 
> This is preparation patch. It does not implement any features.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
