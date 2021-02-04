Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E762C4332B
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:18:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2835A64DF2
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:18:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238777AbhBDTyU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:54:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239512AbhBDTwg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:52:36 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17CCC0611BC
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:50:32 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id z9so2427250pjl.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:50:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XEd3fj8C4Ej+cJekaWRpKIX0Ali26hPYu3xkyPp+pQI=;
        b=V5fnl7iYb3ZfPR+qNCY00qtPY4Zo5HYT4FKsFoDpMe4St8xT2WymhYRfA9fonj0t3N
         Ry2p+pd8ObmedFtbRyxsyqpdCtPiUnK/CB8gzC4Rin9XIv5zwglllzt9qQtP3qrZnaNn
         Kw0ZealDwP8Jmc0Ncx2MO/2X5U9uN8ETdkHt0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XEd3fj8C4Ej+cJekaWRpKIX0Ali26hPYu3xkyPp+pQI=;
        b=gRjgsOSE+NGQagZgAqSD4tRza3aqBRfkkYdDg0UgRs/88kQw2eVD1Z6j5MofV9B/sb
         bc4qGlMgnTjWyn0FStP7aM4yndfcGBuhVYqFOxpaBQGFdaXgUdi6/hseSS4IDybkcoMn
         fNNhuDhaw7nayvTEhnWyzqF+r5NZLVCmUc9ePGLveeNrkNqV537JdzcFL8BQF5DNx6YA
         9Q0OocDsrYJa/Bl6w64Jj4AjTUS//iZwNDqaTlZgfkZzaAa0ttouWS7eU05FAioZoRqm
         vU8bG1ZQbEEAx7VS0x0uBPEj6cSbnoccx9ow9Q/1wUoPuYGfO4sk7PSAvJ+iU6pHZOF4
         NuWg==
X-Gm-Message-State: AOAM533OrBK9VSnXcqT0G9Gn912WQ1Q7n01/0NL8Y/rO1RgeRB3I7T3G
        hOCJDcJoLcLB1fDY41UQUwqkPgzApOObWQ==
X-Google-Smtp-Source: ABdhPJwfpfyghfmT/Ru4dywPKebiyk1pC42NUyPTKH7Ad7iGmSNe6CUYVTXcosUzU4cQj9KWOzUFPg==
X-Received: by 2002:a17:902:8604:b029:e2:a249:4474 with SMTP id f4-20020a1709028604b02900e2a2494474mr651325plo.15.1612468232240;
        Thu, 04 Feb 2021 11:50:32 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id w13sm7059295pfc.7.2021.02.04.11.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:50:31 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:50:30 -0800
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
Subject: Re: [PATCH v19 7/7] x86/vdso: Insert endbr32/endbr64 to vDSO
Message-ID: <202102041150.20388FEF25@keescook>
References: <20210203225902.479-1-yu-cheng.yu@intel.com>
 <20210203225902.479-8-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225902.479-8-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:59:02PM -0800, Yu-cheng Yu wrote:
> From: "H.J. Lu" <hjl.tools@gmail.com>
> 
> When Indirect Branch Tracking (IBT) is enabled, vDSO functions may be
> called indirectly, and must have ENDBR32 or ENDBR64 as the first
> instruction.  The compiler must support -fcf-protection=branch so that it
> can be used to compile vDSO.
> 
> Signed-off-by: H.J. Lu <hjl.tools@gmail.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
