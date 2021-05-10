Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D813DC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 19:28:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 96C8661584
	for <linux-doc@archiver.kernel.org>; Mon, 10 May 2021 19:28:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhEJT3l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 May 2021 15:29:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231214AbhEJT3k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 May 2021 15:29:40 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C3AC061574
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 12:28:34 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id fa21-20020a17090af0d5b0290157eb6b590fso10954191pjb.5
        for <linux-doc@vger.kernel.org>; Mon, 10 May 2021 12:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=M6r3DxlNPkhf3OhaNDcaTGeOLH6RJOY6MQ8JuEMMRNM=;
        b=YVcybWWsu7oECIEqY0eEpQTKr6s6lwa3FSiHPeDPAK2x9lqLcMQHbkxX4J2SYORT5L
         4qFl61PaPMXY5VNonjTPU0olAfYur8XLRxytz2Enww7aHEdpvtfhot62LymVipbXRQev
         QBdD+TxtQXT+wgwxwWLwDpdORhRskJfZxT7gqRbfSXGNDsDIpwR3H+ySgHdcMcpPMsPR
         OlMlIGxZ1GqNwptG16p+mp5AN9XJp/1AF0fFYWwiMVN7SjXtJqMj2n6la/8Irw4XSK0y
         JugyKoO1onEPUsm1K4rqswIse+jtB4TzSzdwbyaxzbcCE3sM1hjJQXYZLpvII1xdrFrn
         l+nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=M6r3DxlNPkhf3OhaNDcaTGeOLH6RJOY6MQ8JuEMMRNM=;
        b=Tm59RnJcEWklbBvYIfJjfQ6hlfV3W0OKQWHkNlNvHQ77QBz1LZJcmTpCUyPir0C0eT
         o0kSdnmqcftg9BQ+cpMXQvwXq/ZpRMgn1nbvos30GtKQPTOOwSuz9Dlkaiy6XxdVBURe
         F6ujAz1JtrM3RuTKFn5rPVcAi4kdCJfvHBE4F67jmQnIFz4cex3Q/UW/RZdMv9y/uAyJ
         kVyDNXWd3epQfJwb+NCVsxkuNeNFhjUB+S6KO+Zvos+gOiHFI89//zTbe96GAj5waZuZ
         mH0hPJhprCAKGXF0kgqehlqloNPwJw8OcagG17LlGS17N1MNiFAwlHM59tWMK2q7d4gi
         UONA==
X-Gm-Message-State: AOAM533JZMu75d3FnIKauM17RY9yCfE7bzxpPq76muZp4mBvdkqln5xY
        5DDrVv8kqf3JugJkLy4Dvaft8Q==
X-Google-Smtp-Source: ABdhPJyOAvl6ZVZvajZL73lLVLm5p37MJ4skw/vdQnrqNxMUbXsiz/M2+1a8utNEdtgKFYrdN8UrVg==
X-Received: by 2002:a17:90a:d246:: with SMTP id o6mr29771057pjw.57.1620674913422;
        Mon, 10 May 2021 12:28:33 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id n8sm11649402pgm.7.2021.05.10.12.28.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 12:28:32 -0700 (PDT)
Date:   Mon, 10 May 2021 13:28:30 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@linaro.org>,
        Mike Leach <mike.leach@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 11/53] docs: trace: coresight:
 coresight-etm4x-reference.rst: avoid using UTF-8 chars
Message-ID: <20210510192830.GA7232@xps15>
References: <cover.1620641727.git.mchehab+huawei@kernel.org>
 <859218d35d495d5d2c2893bf8e6e087394a107a7.1620641727.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <859218d35d495d5d2c2893bf8e6e087394a107a7.1620641727.git.mchehab+huawei@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 10, 2021 at 12:26:23PM +0200, Mauro Carvalho Chehab wrote:
> While UTF-8 characters can be used at the Linux documentation,
> the best is to use them only when ASCII doesn't offer a good replacement.
> So, replace the occurences of the following UTF-8 characters:
> 
> 	- U+00a0 (' '): NO-BREAK SPACE
> 	- U+2018 ('‘'): LEFT SINGLE QUOTATION MARK
> 	- U+2019 ('’'): RIGHT SINGLE QUOTATION MARK
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>

> ---
>  .../coresight/coresight-etm4x-reference.rst      | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/trace/coresight/coresight-etm4x-reference.rst b/Documentation/trace/coresight/coresight-etm4x-reference.rst
> index b64d9a9c79df..e8ddfc144d9a 100644
> --- a/Documentation/trace/coresight/coresight-etm4x-reference.rst
> +++ b/Documentation/trace/coresight/coresight-etm4x-reference.rst
> @@ -15,14 +15,14 @@ Root: ``/sys/bus/coresight/devices/etm<N>``
>  
>  The following paragraphs explain the association between sysfs files and the
>  ETMv4 registers that they effect. Note the register names are given without
> -the ‘TRC’ prefix.
> +the 'TRC' prefix.
>  
>  ----
>  
>  :File:            ``mode`` (rw)
>  :Trace Registers: {CONFIGR + others}
>  :Notes:
> -    Bit select trace features. See ‘mode’ section below. Bits
> +    Bit select trace features. See 'mode' section below. Bits
>      in this will cause equivalent programming of trace config and
>      other registers to enable the features requested.
>  
> @@ -89,7 +89,7 @@ the ‘TRC’ prefix.
>  :Notes:
>      Pair of addresses for a range selected by addr_idx. Include
>      / exclude according to the optional parameter, or if omitted
> -    uses the current ‘mode’ setting. Select comparator range in
> +    uses the current 'mode' setting. Select comparator range in
>      control register. Error if index is odd value.
>  
>  :Depends: ``mode, addr_idx``
> @@ -277,7 +277,7 @@ the ‘TRC’ prefix.
>  :Trace Registers: VICTLR{23:20}
>  :Notes:
>      Program non-secure exception level filters. Set / clear NS
> -    exception filter bits. Setting ‘1’ excludes trace from the
> +    exception filter bits. Setting '1' excludes trace from the
>      exception level.
>  
>  :Syntax:
> @@ -427,7 +427,7 @@ the ‘TRC’ prefix.
>  :Syntax:
>      ``echo idx > vmid_idx``
>  
> -    Where idx <  numvmidc
> +    Where idx <  numvmidc
>  
>  ----
>  
> @@ -628,7 +628,7 @@ the reset parameter::
>  
>  
>  
> -The ‘mode’ sysfs parameter.
> +The 'mode' sysfs parameter.
>  ---------------------------
>  
>  This is a bitfield selection parameter that sets the overall trace mode for the
> @@ -696,7 +696,7 @@ Bit assignments shown below:-
>      ETM_MODE_QELEM(val)
>  
>  **description:**
> -    ‘val’ determines level of Q element support enabled if
> +    'val' determines level of Q element support enabled if
>      implemented by the ETM [IDR0]
>  
>  
> @@ -780,7 +780,7 @@ Bit assignments shown below:-
>  ----
>  
>  *Note a)* On startup the ETM is programmed to trace the complete address space
> -using address range comparator 0. ‘mode’ bits 30 / 31 modify this setting to
> +using address range comparator 0. 'mode' bits 30 / 31 modify this setting to
>  set EL exclude bits for NS state in either user space (EL0) or kernel space
>  (EL1) in the address range comparator. (the default setting excludes all
>  secure EL, and NS EL2)
> -- 
> 2.30.2
> 
