Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A0EC433FE
	for <linux-doc@archiver.kernel.org>; Wed,  9 Nov 2022 08:24:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229533AbiKIIYl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Nov 2022 03:24:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiKIIYk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Nov 2022 03:24:40 -0500
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CA813CF5
        for <linux-doc@vger.kernel.org>; Wed,  9 Nov 2022 00:24:40 -0800 (PST)
Received: by mail-pf1-x434.google.com with SMTP id b185so16037493pfb.9
        for <linux-doc@vger.kernel.org>; Wed, 09 Nov 2022 00:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tqaQqnxdKjnFF6ne4wNPkrJT7mFhybIlaEDh95M3qmM=;
        b=efMwMDSYRoG8AXEQMfb4n6BkmdO3ItUMzZt43mgDK5vtYcEEqEX579AaQqYuNed9Ol
         3eE2xo9YtiBkkjmIhDUPfBqE0R0/jJ7ZwBA002ThdqCLKwvjQiMOl+NNm0BgG7B1hHLO
         7Bq13wOtGkfJNJf577EDv8o/ll/QmSe3PAUrFtEvmAJt1QN1U1gCfqXIR3kU5IHz3Lae
         S2AnX+I/nj4U7FToByUkPq4Vq6LXRnMYFc6DGOzUYl4phFHueWVpxZbbIg8ZJqfvjUd7
         /59Qt+xWizkhV0lk68R6k+htg9y7bxfeL+NOzyRwktyuBCENjqmr+VtfSaeUbcID5SkK
         ukAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tqaQqnxdKjnFF6ne4wNPkrJT7mFhybIlaEDh95M3qmM=;
        b=uY3d4zduO60+PDUy82cosORGT5Wr9Ja25WssjjTKLpZlMrDjRVB7XxKnBvsNvBDk2Q
         r82NgpZd+MqwVvFRH/apyo1ISUMW+zXMMb7l6Cs74/M8dSLKFiNYzcIfOqishYvaGnuo
         EWNRjA7uXQV2Que50Z60X/rpnYwASpH5Bp/9HpOFUncVzVZAhLch9sfQSWqaUorzuHcT
         M2zrvteeckMvOVJvUDQ2j3l8JQHlgikdAvSHkIyoH5BP14/sdvUkdUF8afJ401b4DX7O
         D2/w39/f0rkfe9MrutlyKjOXafaEdbZDbkdQtAHWTfhVWbrui8wPpgVkUygQDIHe7VYr
         JBIg==
X-Gm-Message-State: ACrzQf2hMGSkZY57O3bdCtMzrR5mK7PgPnRlMPEBww3j5SEktj7QsPDV
        PanGT+qggGYxozaEZhWLr+g=
X-Google-Smtp-Source: AMsMyM5zsYK5poAgt508lI2vFrnx9pc8Szj8yFsLxINh2NFcEM1334mG1FfA1JFJOT+R+sZ8FSFDPg==
X-Received: by 2002:a63:124b:0:b0:470:3c0:7a57 with SMTP id 11-20020a63124b000000b0047003c07a57mr33332935pgs.142.1667982279535;
        Wed, 09 Nov 2022 00:24:39 -0800 (PST)
Received: from [192.168.43.80] (subs02-180-214-232-21.three.co.id. [180.214.232.21])
        by smtp.gmail.com with ESMTPSA id u12-20020a170902714c00b001888a46e2d0sm3134835plm.162.2022.11.09.00.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Nov 2022 00:24:39 -0800 (PST)
Message-ID: <8338c944-f1af-7c86-f50d-09a07dc2beb7@gmail.com>
Date:   Wed, 9 Nov 2022 15:24:28 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] scripts/kernel-doc: support EXPORT_SYMBOL_NS_GPL() with
 -export
To:     Jason Gunthorpe <jgg@nvidia.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
References: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <0-v1-c80e152ce63b+12-kdoc_export_ns_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/8/22 22:02, Jason Gunthorpe wrote:
>  Only output documentation for the symbols that have been exported using
> -EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() in any input FILE or -export-file FILE.
> +EXPORT_SYMBOL() and related macros in any input FILE or -export-file FILE.
>  
>  =item -internal
>  
>  Only output documentation for the symbols that have NOT been exported using
> -EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL() in any input FILE or -export-file FILE.
> +EXPORT_SYMBOL() and related macros in any input FILE or -export-file FILE.
>  
>  =item -function NAME
>  
> @@ -2451,8 +2456,7 @@ Do not output DOC: sections.
>  
>  =item -export-file FILE
>  
> -Specify an additional FILE in which to look for EXPORT_SYMBOL() and
> -EXPORT_SYMBOL_GPL().
> +Specify an additional FILE in which to look for EXPORT_SYMBOL information.
> 

For consistency, what about "Specify an additional FILE in which to look for
EXPORT_SYMBOL() and related macros."
 
Anyway, what are EXPORT_SYMBOL_NS{,_GPL}() macros?

-- 
An old man doll... just what I always wanted! - Clara

