Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74229C47088
	for <linux-doc@archiver.kernel.org>; Sat,  3 Dec 2022 02:25:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235129AbiLCCZ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Dec 2022 21:25:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235077AbiLCCZ1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Dec 2022 21:25:27 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5F5CDCBF7
        for <linux-doc@vger.kernel.org>; Fri,  2 Dec 2022 18:25:26 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id f3so5836346pgc.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Dec 2022 18:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qe3Kot75P0ehlOAWJ+W2KaYDqgt2hyWIV3bO0GRxNwM=;
        b=QWQVuu2sfyBztLQQwqQPFN02JvATwjtE5qID6YEDN+72UodsQlyHEPyGRaWgZFRTTR
         uRnWK+9DpdqcQ25oen3icozFeCSxWxy6xZiD+z7PSYoGKo04INcqhg2+kviq+7In2pJR
         YEAqcsASnvC7DF9yDgA3BOfeKmOiA1tv+CaRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qe3Kot75P0ehlOAWJ+W2KaYDqgt2hyWIV3bO0GRxNwM=;
        b=G7xU4A40IA4irlQCL3fJT+Rc02QkL4dLRL+JuGSHJPyt7nYIR1UtG1EVUyKuOFuK9x
         myFnvu62U7/NtolMlZ37AEzXr+o5pKVpeE1WG5t23zh9NCmZSlG2BCQF3Yr2chfVbT/h
         S9FtrZC4nTb2ymFcfL9yNNYy15568ddAM2Z06iVsxQaE5VXICIKa9nyTlfGiGufMtqtp
         dRKJzTKU4mC98dP2iS12IbS+2mMt2KejtggdAvmnW0L9pX1GVZU2Yt/UQ6W9swGoI3rx
         j/g3TB+kUvxQrjzcvJZ4mNObbUk3ZsaBKh+O/VqPpjeTwlrHUhhPOfHIK1p+D4YdQLPZ
         ct9g==
X-Gm-Message-State: ANoB5plJSFitNM3D8NyPYGeM+z9rOEhFV/NgVAQqOk+N71M/uVg8YL5d
        +cOgk5YvZewQxh8DsQc/inc4nw==
X-Google-Smtp-Source: AA0mqf4jgpifGJAXMClGoBCX78UAFNY/rPQyAwu9YUGBBvgEisZM5G6+77aK1xBoA4eCWNPz1o8blQ==
X-Received: by 2002:a63:d946:0:b0:477:af25:38c8 with SMTP id e6-20020a63d946000000b00477af2538c8mr45480936pgj.392.1670034326231;
        Fri, 02 Dec 2022 18:25:26 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 127-20020a620485000000b00576670cc16dsm1843999pfe.197.2022.12.02.18.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 18:25:25 -0800 (PST)
Date:   Fri, 2 Dec 2022 18:25:25 -0800
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
Subject: Re: [PATCH v4 06/39] x86/fpu: Add helper for modifying xstate
Message-ID: <202212021825.4A1B632FD@keescook>
References: <20221203003606.6838-1-rick.p.edgecombe@intel.com>
 <20221203003606.6838-7-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221203003606.6838-7-rick.p.edgecombe@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 02, 2022 at 04:35:33PM -0800, Rick Edgecombe wrote:
> Just like user xfeatures, supervisor xfeatures can be active in the
> registers or present in the task FPU buffer. If the registers are
> active, the registers can be modified directly. If the registers are
> not active, the modification must be performed on the task FPU buffer.
> 
> When the state is not active, the kernel could perform modifications
> directly to the buffer. But in order for it to do that, it needs
> to know where in the buffer the specific state it wants to modify is
> located. Doing this is not robust against optimizations that compact
> the FPU buffer, as each access would require computing where in the
> buffer it is.
> 
> The easiest way to modify supervisor xfeature data is to force restore
> the registers and write directly to the MSRs. Often times this is just fine
> anyway as the registers need to be restored before returning to userspace.
> Do this for now, leaving buffer writing optimizations for the future.
> 
> Add a new function fpregs_lock_and_load() that can simultaneously call
> fpregs_lock() and do this restore. Also perform some extra sanity
> checks in this function since this will be used in non-fpu focused code.
> 
> Tested-by: Pengfei Xu <pengfei.xu@intel.com>
> Tested-by: John Allen <john.allen@amd.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Rick Edgecombe <rick.p.edgecombe@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
