Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9561AC433E0
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:25:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 387A364E0A
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 20:25:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240041AbhBDUZn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Feb 2021 15:25:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240033AbhBDUZ0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Feb 2021 15:25:26 -0500
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7575C061786
        for <linux-doc@vger.kernel.org>; Thu,  4 Feb 2021 12:24:45 -0800 (PST)
Received: by mail-pg1-x536.google.com with SMTP id g15so2909724pgu.9
        for <linux-doc@vger.kernel.org>; Thu, 04 Feb 2021 12:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=v8ghTr9pbY/sls4eNB3Cpe47CdWbhMFVnLsnjhJ6vZc=;
        b=NfWYk55j/9pHR6ZwBz1BiHiQ0zm0oSAiebaqx41lmY8ATDui9uD4zOpvr1aLyvQ1N3
         cxj4/Lz8KdrMEVhUcrOSC+gPXJol6Oyi1FF2l+7sSp8oIhLsLo4n/2IIXR/XGMyByy9/
         f5USnJaT8vnRTsACtxnaMEBT0DQnYr74i4M/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=v8ghTr9pbY/sls4eNB3Cpe47CdWbhMFVnLsnjhJ6vZc=;
        b=rR/Awt121tuwZg1cDp45MmaqpbdOphXrLUR1ZFSvi8P4vVNLDDoevIaAnr8/MHxrZx
         5Yc+w8TbJVTVq+9k9Qczi1HcFO9SjXGHj0VS+fylGZXdV6nLYvrJ4C1kveg0AxXycAd/
         VOYHa4jUydCf6eKplsTapcLp2MPG47Z/b4tlAmoOCZwgXcQ7zc+03aqRLYZE2fqN2NrM
         SmVk+baBcxL3SOwaqamn8lXdRJcUEj/FdbPj3PXXS/LnNLc+GKtx/J08L56RDj/2qDrK
         rTfuEWszskIYf8SQPIvgDTIVyOAUfx7KLdf/DwRBxqXSBz8TwbFWxVYZxDyywkz4TcFg
         qaIg==
X-Gm-Message-State: AOAM533vCgQ0cJ+0tC1x3kitqxkj8hT6T5T5ZidW+G//tCzUOy6rr2Uh
        bSyPANrieNG/YiU/nvqQmfHTBA==
X-Google-Smtp-Source: ABdhPJwx/qC+502sdYByWHnbj542w1LMu6piAa6mgivDXuOnGvWTdAo7oGxK4C8n+Ttq1teH4i0atA==
X-Received: by 2002:a62:1c47:0:b029:1c8:81d2:b413 with SMTP id c68-20020a621c470000b02901c881d2b413mr889462pfc.56.1612470285277;
        Thu, 04 Feb 2021 12:24:45 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id p17sm3624550pgn.38.2021.02.04.12.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 12:24:44 -0800 (PST)
Date:   Thu, 4 Feb 2021 12:24:43 -0800
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
Subject: Re: [PATCH v19 17/25] mm/mmap: Add shadow stack pages to memory
 accounting
Message-ID: <202102041224.14CB1AA@keescook>
References: <20210203225547.32221-1-yu-cheng.yu@intel.com>
 <20210203225547.32221-18-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210203225547.32221-18-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 03, 2021 at 02:55:39PM -0800, Yu-cheng Yu wrote:
> Account shadow stack pages to stack memory.
> 
> Signed-off-by: Yu-cheng Yu <yu-cheng.yu@intel.com>

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
