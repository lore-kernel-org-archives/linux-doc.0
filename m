Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D379C433E9
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 01:23:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8F8564F45
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 01:23:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229949AbhCRBWu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Mar 2021 21:22:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbhCRBWe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Mar 2021 21:22:34 -0400
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D8C2C061760
        for <linux-doc@vger.kernel.org>; Wed, 17 Mar 2021 18:22:34 -0700 (PDT)
Received: by mail-pg1-x52e.google.com with SMTP id n11so363077pgm.12
        for <linux-doc@vger.kernel.org>; Wed, 17 Mar 2021 18:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EalAswFOAcFp0mMFCKv9AaiQ3ouyPCG+tDog26PGvcI=;
        b=TSffuJwrnV2vab8/yGoahUmuVCMDXKwUtsys3/bDoxiRWc2F+tAbiwWP2aKGYHhGV8
         gzbjPnRuubA6uxOalwf/Z67un8+OC/fwBeJ8Upsa2Pv1pu1E+PVITOIEVPFFO+PQW43A
         yV0DB8OU4s1DHxtjiTSy0K6Yf3Xh0c37cc+7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EalAswFOAcFp0mMFCKv9AaiQ3ouyPCG+tDog26PGvcI=;
        b=o4m+O5CBCqRvpop/LBnLRx7sQnov7LKXF1swJIiMsp+1gXKPoc5Vv4rZu4zMcI9f0M
         ZB/aQzTkfJFCJ3f22EtjmBzVyPRaLKlKjA9vAu3O3YiZxdVS/qq1EBg6arqthJtBrUVK
         CvNBhNwpqMPI8HMhRDofbt4orQDhEDeP7moBkwS9qQxsOS2XKhwVjCaS+i47PLosbSMH
         wpyUhnVUFMLHvwTenAp22BQAX+55jSu/h8L8SK0DiCDRb/erse3Wd1GlfyDj1MxLIizI
         LfQwFiR4VRpHM9wpLWrypCr77RC7fZMBYUXO7fvUWSdKP8f+dLYkM6I0JfghPbIRPTK7
         buiw==
X-Gm-Message-State: AOAM531PKcl7AxcT4ORf4AxvwL02kTLY4HCqLFftdkEnrETy7Kx4EZHw
        qMC4behF+sYW1Sn388mDqhsfIg==
X-Google-Smtp-Source: ABdhPJyrmCLmGW63fx9n1OC+yYNO5rjvfb0Ce9xQhK2RMb98xMDnfa90K4TsbnB5zAo7scdsUzAUcw==
X-Received: by 2002:aa7:81cb:0:b029:1ee:5346:8f1d with SMTP id c11-20020aa781cb0000b02901ee53468f1dmr1683154pfn.4.1616030553695;
        Wed, 17 Mar 2021 18:22:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c1sm272445pfn.131.2021.03.17.18.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Mar 2021 18:22:33 -0700 (PDT)
Date:   Wed, 17 Mar 2021 18:22:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     John Wood <john.wood@gmx.com>
Cc:     Jann Horn <jannh@google.com>, Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        James Morris <jmorris@namei.org>,
        Shuah Khan <shuah@kernel.org>,
        "Serge E. Hallyn" <serge@hallyn.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        kernel test robot <oliver.sang@intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        kernel-hardening@lists.openwall.com
Subject: Re: [PATCH v6 1/8] security: Add LSM hook at the point where a task
 gets a fatal signal
Message-ID: <202103171821.C851A2D189@keescook>
References: <20210307113031.11671-1-john.wood@gmx.com>
 <20210307113031.11671-2-john.wood@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210307113031.11671-2-john.wood@gmx.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 07, 2021 at 12:30:24PM +0100, John Wood wrote:
> Add a security hook that allows a LSM to be notified when a task gets a
> fatal signal. This patch is a previous step on the way to compute the
> task crash period by the "brute" LSM (linux security module to detect
> and mitigate fork brute force attack against vulnerable userspace
> processes).
> 
> Signed-off-by: John Wood <john.wood@gmx.com>

I continue to really like that this entire thing can be done from an LSM
with just this one extra hook. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
