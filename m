Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E672CC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 19:54:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B29DD64F45
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 19:54:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236970AbhBDTxu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 14:53:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239412AbhBDTvi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 14:51:38 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB956C0617A7
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 11:50:11 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id o16so2866743pgg.5
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 11:50:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/xqrcr0spyydoAlLuc99uq3cskkQtgF/Uv01pgyq0ds=;
        b=Du7iFlDWFI6enawRDcehFsluT1W0OthyU+AXhyMr2mtTzw5vkuy1H9ceFkQ99qBJSj
         YRZMriPtX53oHb/EVc4MsIXCaJaAWcAnrhRVJuNdh31kUgip6KfbWaqBmyGFYUzIukx5
         G+L+T8Il52MlwCw8EchSrWSoJXEI9rmSN/3Nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/xqrcr0spyydoAlLuc99uq3cskkQtgF/Uv01pgyq0ds=;
        b=EDUV1K2a8Xea06s49eSfMmF02yl+ied8+XOKwHgqcqq2l6OP0XMc1W2joeBfEdZ2Gp
         +wxdJ2XDo9nJNXa5wdX7iI++rcF1sSN34SBc3bvTezCcX/PxsLy/N1jnEx+xajeJU2ZF
         MALxMYQBl45wB935EPpH9lzVZSgRuRBG872N6KHBhUbpgKXf8824QHKDiFtIuobiRvqu
         uoT/I95fhtNXzT3k1Ge55qr1Qflj/jZYDRYTS6yGvLxjK9nCuYgu7im8X991ts4pQ+SY
         niMTSxl3H8HsqsQl2VIKR6CZNvMpepXHiv4QUQyBN6b2JfLmtSf13QNLoOheu8Inz9nO
         szhw==
X-Gm-Message-State: AOAM532me+hPUnsWzFmJjzAblS0IP/V4fjBIbtDhOnaQAG7TEVUAFy+0
        j+JWH/7sB0xaR3n4RoeWDD4fLQ==
X-Google-Smtp-Source: ABdhPJxtHH5uZ1Z7iC4WZebLw2vn0Wmq76brvfnWdJDqyjrAJu644mdWx5Auq5N/jwzL0m0zXveDdg==
X-Received: by 2002:a62:ac06:0:b029:1cb:35bc:5e2c with SMTP id v6-20020a62ac060000b02901cb35bc5e2cmr894242pfe.42.1612468211577;
        Thu, 04 Feb 2021 11:50:11 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id z16sm7448343pgj.51.2021.02.04.11.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 11:50:10 -0800 (PST)
Date:   Thu, 4 Feb 2021 11:50:09 -0800
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
Subject: Re: [PATCH v19 3/7] x86/cet/ibt: Handle signals for Indirect Branch
 Tracking
Message-ID: <202102041150.3614663DA@keescook>
References: <20210203225902.479-1-yu-cheng.yu@intel.com>
 <20210203225902.479-4-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225902.479-4-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:58:58PM -0800, Yu-cheng Yu wrote:
> When an indirect CALL/JMP instruction is executed and before it reaches
> the target, it is in 'WAIT_ENDBR' status, which can be read from
> MSR_IA32_U_CET.  The status is part of a task's status before a signal is
> raised and preserved in the signal frame.  It is restored for sigreturn.
> 
> IBT state machine is described in Intel SDM Vol. 1, Sec. 18.3.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
