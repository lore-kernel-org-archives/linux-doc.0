Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E47C9C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 16:29:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA7B2610A2
	for <linux-doc@archiver.kernel.org>; Tue, 12 Oct 2021 16:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230394AbhJLQba (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Oct 2021 12:31:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbhJLQba (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Oct 2021 12:31:30 -0400
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65FC0C061745
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 09:29:28 -0700 (PDT)
Received: by mail-wr1-x42a.google.com with SMTP id u18so68826628wrg.5
        for <linux-doc@vger.kernel.org>; Tue, 12 Oct 2021 09:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google;
        h=reply-to:subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WoI+RIYPtTHHEGdSwuorNq+48h1lI38S5XMbUzci1do=;
        b=IXnGkACIv8ATP6Rg+2IOmXepCL9y3vwvei56jej9pA2dn5ZGDyaixPeJaPEI3uby1y
         Hr9e0UN5sFQlev6+W+k7RzkQNF1NZeX3p8ox3nucq6xMUHyOIkiWkCUpj2QGe/r9evuE
         0+9pce8I5+0Da9ZDGxt/eAGDFuRmXasghtIlP/gDlRyfsh4EZP0K9uH+Qme+YarXosb5
         5zT3IzvsQl62fzHEfSIBDXFRrezqj/75a6nuZ3KbS1egtb8NU9Wzc4noOWPXO8ZveJ3Z
         4cHRUBorP1aqAr166LpyNMvn2pfPUk70LqYkfxJ4Nlxeu38PE8MIQIBdlilyvzYWAKHo
         iA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=WoI+RIYPtTHHEGdSwuorNq+48h1lI38S5XMbUzci1do=;
        b=ymwPlXxKMW5+s1j4wcNLnNesmV5W3BGhAH/GNmgFYzOTU5A3U2ZSVxZzlosjn/rY0h
         WovS74LEzVYStFIj30WY33RwUPdTAtgCSGk69swT1bmenpquXf97fNbpJ4DgAC6B247p
         q4q1kgVtIp6BpRb7SPO1DSHa7M/rDganria43yiyDn/q97nPRxWdgkiRIxMIeBf9Yjbp
         M6Oa/91iwtgf5f7BcvoRPdw0wATR2QWQUnwKr41jNkbF0zXRsvp3gnLTuX+pOklIJWT7
         dvYaLV3OS19DJ2vdtnpUPDOTfqaPxfLfQEr11odw/7deIFVuKHEmNmQ9rHaWvyxl2pVN
         VaOg==
X-Gm-Message-State: AOAM5302y5JFLTQmO26IPb/4rjikmTpcJ3DZUv9Vbwk5EIc/l3qDV1Gh
        eqeKDMUpcCVGF5o1Mkl2sM39gQ==
X-Google-Smtp-Source: ABdhPJyOvOpRNu4YETAcMkAxjvEJmxG7khGK/O+O0wVECw82ef9aelrGdQva2GQHQ48aAFfflyUy1Q==
X-Received: by 2002:adf:bc14:: with SMTP id s20mr33111077wrg.8.1634056167015;
        Tue, 12 Oct 2021 09:29:27 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:410:bb00:5564:458a:9373:f0e4? ([2a01:e0a:410:bb00:5564:458a:9373:f0e4])
        by smtp.gmail.com with ESMTPSA id p19sm2886484wmg.29.2021.10.12.09.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Oct 2021 09:29:26 -0700 (PDT)
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v2 4/4] bpf: export bpf_jit_current
To:     Lorenz Bauer <lmb@cloudflare.com>, luke.r.nels@gmail.com,
        Jonathan Corbet <corbet@lwn.net>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     kernel-team@cloudflare.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        bpf@vger.kernel.org
References: <20211012135935.37054-1-lmb@cloudflare.com>
 <20211012135935.37054-5-lmb@cloudflare.com>
From:   Nicolas Dichtel <nicolas.dichtel@6wind.com>
Organization: 6WIND
Message-ID: <836d9371-7d51-b01f-eefd-cc3bf6f5f68e@6wind.com>
Date:   Tue, 12 Oct 2021 18:29:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211012135935.37054-5-lmb@cloudflare.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Le 12/10/2021 à 15:59, Lorenz Bauer a écrit :
> Expose bpf_jit_current as a read only value via sysctl.
> 
> Signed-off-by: Lorenz Bauer <lmb@cloudflare.com>
> ---

[snip]

> +	{
> +		.procname	= "bpf_jit_current",
> +		.data		= &bpf_jit_current,
> +		.maxlen		= sizeof(long),
> +		.mode		= 0400,
Why not 0444 ?


Regards,
Nicolas
