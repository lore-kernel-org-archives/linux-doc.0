Return-Path: <SRS0=MgSu=DW=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0D12C4363A
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 01:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96B9E22257
	for <linux-doc@archiver.kernel.org>; Thu, 15 Oct 2020 01:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602725099;
	bh=4GK2AcxAoybORLB+vHy+WW700H/huJz57VEgUBjvK1g=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:List-ID:From;
	b=irNBJTXmQraAwdxwHZkaJ9jafaZLumr5qiSUBsjhvL0oTtvF0dseUaAt+O35lIFUx
	 EcCmlbrdZwW+2kBEZS38CSozpxAVm07jPxfiA/GdfCICTrTxiitJl/syVCHFSm2ysw
	 XzSpKFpt1fOuM+S0hHXSH2R6UqKcD4RGGDHYslAQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388578AbgJOBY6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Oct 2020 21:24:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732044AbgJOBYi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Oct 2020 21:24:38 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C64B5C0F26F7
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 18:06:54 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id y20so2218202iod.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2020 18:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=nuoA4nhqaT2r5Q46oH6MDqZrYkcrLiu5o7waToPeU4U=;
        b=ZfM2dR1TVM9711DQqLS1u7B81AJpL280LQQTwlJw+3/gMKiDTmwBAI85Q+aCbOog6r
         xyaCpCPr5oP/gIjJF4y8l7sZYHvPdjj6tGZuEZud6PFI7d6Gw154k4gtiTvQvaQho3TP
         8LSCyi4Xajhw1knanNXpifLBMBtJd4S2L1MdM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=nuoA4nhqaT2r5Q46oH6MDqZrYkcrLiu5o7waToPeU4U=;
        b=k2ke49a0O3ufqyMJSMDqOf9adhQdZ6M7TgJ0y6I/oEwu/Lu85QGjnMU6PBUPxyzfGs
         6C4Z4YsWE8hge7egUHtCWDD80C71e5TYqCXiEOOEvKix3IrmQ3eACjabau5JxtJ6PEo0
         vzyddVo7uK01HVz6Zzt1b4DDo+WEWlaOO68YpuLSYEhHpH0tYj5vy6zu6gU2JJFTdjmd
         v0UlO/cVG873Dl6Fl3GjSmllwVuil/arN6Y7ZTfev0CQ9xKtg9S3Y+o4AAUDIM/yMqmf
         Gi30edcXs/Yq6mEN8O12vpAWTdsCoNSAiHIkIYx9mmQi5gd2EH5yLuhoJu+f9qoOfaNW
         YfGw==
X-Gm-Message-State: AOAM530fhaXnRSDXiN2XASBCgqg9mSJL464qFPGxPBDncRLA7vB2FaxZ
        x6KF3Fy4eKY6oL5tNrTr7w5n7g==
X-Google-Smtp-Source: ABdhPJwZ8n+nuyRdHP5Sff3yx8mk/bObtC07yQCShDgVe4UfTBPTIBPbPI99IitZ3cn80JwKdFFEQg==
X-Received: by 2002:a02:380c:: with SMTP id b12mr1734863jaa.9.1602724014000;
        Wed, 14 Oct 2020 18:06:54 -0700 (PDT)
Received: from [192.168.1.112] (c-24-9-64-241.hsd1.co.comcast.net. [24.9.64.241])
        by smtp.gmail.com with ESMTPSA id b2sm1042048ila.62.2020.10.14.18.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2020 18:06:53 -0700 (PDT)
Subject: Re: [PATCH v2 24/24] counters: docs: add a missing include
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        =?UTF-8?Q?Ricardo_Ca=c3=b1uelo?= <ricardo.canuelo@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Daniel Jordan <daniel.m.jordan@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <cover.1602590106.git.mchehab+huawei@kernel.org>
 <74814cc3d2b2ac3fe7c10ff2045c77691bacf64b.1602590106.git.mchehab+huawei@kernel.org>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <982ecabd-330d-7ef9-9287-0eda5ba399b3@linuxfoundation.org>
Date:   Wed, 14 Oct 2020 19:06:52 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <74814cc3d2b2ac3fe7c10ff2045c77691bacf64b.1602590106.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/13/20 6:14 AM, Mauro Carvalho Chehab wrote:
> Changeset 37a0dbf631f6 ("counters: Introduce counter_atomic* counters")
> 
> Is causing two new warnings:
> 
> 	.../Documentation/core-api/counters.rst:8: WARNING: Undefined substitution referenced: "copy".
> 	.../Documentation/core-api/counters.rst:9: WARNING: Undefined substitution referenced: "copy".
> 
> Because it forgot to include isonum.txt, which defines |copy|
> macro.
> 
> While here, also add it to core-api index file, in order to
> solve this warning:
> 
> 	.../Documentation/core-api/counters.rst: WARNING: document isn't included in any toctree
> 
> Fixes: 37a0dbf631f6 ("counters: Introduce counter_atomic* counters")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   Documentation/core-api/counters.rst | 1 +
>   Documentation/core-api/index.rst    | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/Documentation/core-api/counters.rst b/Documentation/core-api/counters.rst
> index 642d907f4d3a..2821aebf3f45 100644
> --- a/Documentation/core-api/counters.rst
> +++ b/Documentation/core-api/counters.rst
> @@ -1,4 +1,5 @@
>   .. SPDX-License-Identifier: GPL-2.0
> +.. include:: <isonum.txt>
>   
>   ======================
>   Simple atomic counters
> diff --git a/Documentation/core-api/index.rst b/Documentation/core-api/index.rst
> index 69171b1799f2..cf9cd44c1191 100644
> --- a/Documentation/core-api/index.rst
> +++ b/Documentation/core-api/index.rst
> @@ -43,6 +43,7 @@ Library functionality that is used throughout the kernel.
>      this_cpu_ops
>      timekeeping
>      errseq
> +   counters
>   
>   Concurrency primitives
>   ======================
> 

Thank you for the patch. I will add this to my patch series.

thanks,
-- Shuah
