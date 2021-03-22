Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47DEDC433E0
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 11:34:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FBB661998
	for <linux-doc@archiver.kernel.org>; Mon, 22 Mar 2021 11:34:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229979AbhCVLdv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 22 Mar 2021 07:33:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbhCVLdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Mar 2021 07:33:39 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03553C061762
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 04:33:38 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id q29so20581508lfb.4
        for <linux-doc@vger.kernel.org>; Mon, 22 Mar 2021 04:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=aC2zWxKh8h9yHiD2xeuwLXX1xV0ZgyBrKCIhHDY5H2o=;
        b=ZSGptlNY3TV6osXspfB6Yn0ZJO3GuxZfOL/Fu0isJaoYmVcMpPSQbVTSBn9c5mTSEA
         LTMelrPjHBm5crPLQkr9bPUQQYhynmbUipldWsBGQW2vnGJepKZ/QXFFhvUMRTACUhuw
         s9S/jbqIKXf2Vey3tdRYq6C15FpKTEc0pIR5uFfDmGz6QRdKhz9JMkd5bKgXenraMCQ8
         sX2QV60eMpa3rEE/iRF4PdvRdUdcorAtjcYY/ZdFAVPtSa0puiPKeYXNL3i5bwe+lcna
         occ6hoU7QY/zFYyxuEn9nExU2MqpMwJMmI6TKwxtodNgA0dSGLCyL8cyS3GfjnFdo4RS
         nMYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aC2zWxKh8h9yHiD2xeuwLXX1xV0ZgyBrKCIhHDY5H2o=;
        b=k3iq9MoRoCMvfn3btjqiFBGV0g2+6NaQtlLTAS3CnV8f/7s/WsdsLmnDQxr2Am2KUC
         lUyyNsQ1xhQXkpPjNMYd8PxEeouqPDpSDLzQUl3amDWA4istr/cnAvs4J7hqd0j99bF1
         JVCJ2McEeXLGKAHmqZxKTLoSS6k58clnZncGTK+BcWTRMuC59WxjBQ4eWkQ2tLoq3X58
         joo2RFmy9MuYb7xFJp7XIg6PUBjOREuVvOCLu+mVmJ+GVxjoY6/W7vm7tmOUE6YnsYLr
         EYXzvzND70FjYF44lNy56+mz1f9Hhcoh9j3Dpk3l2rO1Sfq7YT8Ewyk9kUDHGY7haUcE
         C8YA==
X-Gm-Message-State: AOAM531CPgwsMktZGAq4B7CuWDiHXat7GiUeJ8KmotLVZPkeffsKOVXC
        3CIcjiCwdH15+LxQV1gcTACXhA==
X-Google-Smtp-Source: ABdhPJxMnipHkRpXAneqmErx/D3g0D2rkXq/Hs50ihFqlwye/4wxG9jeysmcs7uX5nhojYOuLACxOw==
X-Received: by 2002:a19:712:: with SMTP id 18mr8623697lfh.591.1616412817450;
        Mon, 22 Mar 2021 04:33:37 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id w13sm1918639ljw.2.2021.03.22.04.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 04:33:36 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 5440A101DEB; Mon, 22 Mar 2021 14:33:44 +0300 (+03)
Date:   Mon, 22 Mar 2021 14:33:44 +0300
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
Subject: Re: [PATCH v23 13/28] mm: Introduce VM_SHSTK for shadow stack memory
Message-ID: <20210322113344.vf55cya7frr5hvoo@box>
References: <20210316151054.5405-1-yu-cheng.yu@intel.com>
 <20210316151054.5405-14-yu-cheng.yu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210316151054.5405-14-yu-cheng.yu@intel.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 16, 2021 at 08:10:39AM -0700, Yu-cheng Yu wrote:
> +#ifdef CONFIG_X86_CET
> +# define VM_SHSTK	VM_HIGH_ARCH_5
> +#else
> +# define VM_SHSTK	VM_NONE
> +#endif
> +

Why not VM_SHADOW_STACK? Random reader may think SH stands for SHARED or
something.

-- 
 Kirill A. Shutemov
