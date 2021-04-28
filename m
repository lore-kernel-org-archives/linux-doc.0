Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99B6EC433ED
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:31:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5912F613F1
	for <linux-doc@archiver.kernel.org>; Wed, 28 Apr 2021 20:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240748AbhD1Ubz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Apr 2021 16:31:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240590AbhD1Uby (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Apr 2021 16:31:54 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06073C06138D
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:31:09 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id j7so36168891pgi.3
        for <linux-doc@vger.kernel.org>; Wed, 28 Apr 2021 13:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=3hSpg15pn1DIdYpOUvqCiqtWYItHFsCiBWHhgVzIduI=;
        b=BkbeBwVw+8kNECD6Fty+KhB2F/UCVh05XwhcmlkxtMeFxAnK7zGdWcsac/9xp0+LIX
         QhDKeE0HJgN1UAjMxq9aw9nfBPmpRThrwcnkH4T+puZNHQ/z+cvGTjixSvIDru7sf04s
         rh4FBCLuTD4dbIHz7KjZ6We84KXuMRxzFeZgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3hSpg15pn1DIdYpOUvqCiqtWYItHFsCiBWHhgVzIduI=;
        b=glqaoJbd4BRpQ9Q9wfIkj2/g/m0KFAL77goBFSKzxFyOHEnv0DOUB+8RP3NIwx+7wc
         EuexTGtm7MfCodaTrIOUAdgyx+oQKfiQ6wMJekmYYkD3SUEwqmo1QRtwkOkyL2GgHpTm
         FAsKOKIUPKUkUDnkx2J8nGxZPhtmyvWHFwdI0NlZIYJ/GEs8GVjzJJRWSMM3qKjeC0ym
         IINsQenNj+kXTpPmq2l2ytRSDyyqpOLMIha3fZd3eeO3Krisy2z8jqZDXuSFHLLXt++6
         AtzKdzH4DK/UQ84qqXfPIHfFM55LwgEOdvfLmAIqDV/T+ezoN20fl2Nwcr+E9+qVWV12
         ghuw==
X-Gm-Message-State: AOAM533y0zm5H7pSArd/DzcsDMCmN/6UoQOY+weMEexA3aQMgear3Z39
        lTU78XKrXmDzRJLb/82FPhSt7w==
X-Google-Smtp-Source: ABdhPJwCKd2mYh14iAXFwA+maLNCPvFw4QLlsMbajfD2OFtjkT8lLbxJACSI1jhHg7cX9+DygGbR1w==
X-Received: by 2002:a63:6486:: with SMTP id y128mr10004830pgb.414.1619641868603;
        Wed, 28 Apr 2021 13:31:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id oj6sm5513649pjb.5.2021.04.28.13.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 13:31:08 -0700 (PDT)
Date:   Wed, 28 Apr 2021 13:31:07 -0700
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
Subject: Re: [PATCH v26 3/9] x86/cet/ibt: Handle signals for Indirect Branch
 Tracking
Message-ID: <202104281331.C09D5479E@keescook>
References: <20210427204720.25007-1-yu-cheng.yu@intel.com>
 <20210427204720.25007-4-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210427204720.25007-4-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 27, 2021 at 01:47:14PM -0700, Yu-cheng Yu wrote:
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
