Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EFD297DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon,  2 Apr 2018 07:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754210AbeDBHMu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 2 Apr 2018 03:12:50 -0400
Received: from mail-pl0-f65.google.com ([209.85.160.65]:33272 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754174AbeDBHMt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 2 Apr 2018 03:12:49 -0400
Received: by mail-pl0-f65.google.com with SMTP id s10-v6so1647658plp.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Apr 2018 00:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=AL1yfmUXGnSFjgtNOA4dE3C54P/sDMBVPhC4mYtKu0M=;
        b=Mnulzx3mViAFv0mtOiqKRM+v8bpry6IB3R0xJ85RA6J59dYTmntDPTJ0s5NRg4qrSc
         2grecYLlYW+unRzn9bBf9fR6YffLhGvi8nQjIivdseSHerJDYLhuWBu8BHuPrhZaIaX/
         FzeS5c/ROVHnDaD4FV4webXsG+FsgZZ9NiSBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=AL1yfmUXGnSFjgtNOA4dE3C54P/sDMBVPhC4mYtKu0M=;
        b=USsSiuhVdgxMPOPbYPXo7hS/ti6Rb+T0mv/rA3kR36FLfuV+q3Vb5RdBBtm2PzSXgX
         j27UYehtyiFe485QBEDO7Ock+4EqUtUPNq16R2S3BbYktDcTjUiYhv/X77OGZfEyqw6I
         RFopQQRZwP122u7Gqq1pkW/MoJYfURK9/EAYakEzPrdlIeixOljUUHlyuTZBv2U/Y4cQ
         2Nsm3Nq4ksM0aswWeCFHlRHdNMhoQb1lQMPsPEXOZ49ZFV8mToH885OYkd/K7pUC/sIW
         JRdOBsR3zxc6fZnPqylWWaRjPd1Z0mu97s2j4qlwGvm3EAPb7AtOazKKSjBxpB8Fezal
         cfqA==
X-Gm-Message-State: AElRT7HAD/WDb5u8czRRDEnNT7n2uxANwTtuE7Kfc1dTeEHsrNvyr9OF
        o/Ctw3MeLeZPhAwKBAIxdhT9Xw==
X-Google-Smtp-Source: AIpwx48xc3saM7ZUPza1btV+dBcPYgJLtsmQABKeYiCOPDWeyUhisqoBWpDu7RWPEvm6Fl+IpPf3bg==
X-Received: by 2002:a17:902:bb81:: with SMTP id m1-v6mr8598433pls.71.1522653168848;
        Mon, 02 Apr 2018 00:12:48 -0700 (PDT)
Received: from localhost ([122.171.228.188])
        by smtp.gmail.com with ESMTPSA id t137sm16799866pgc.16.2018.04.02.00.12.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Apr 2018 00:12:48 -0700 (PDT)
Date:   Mon, 2 Apr 2018 12:42:46 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Sanjeev Gupta <ghane0@gmail.com>
Cc:     corbet@lwn.net, linux-pm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation/thermal: Check links and convert to https
Message-ID: <20180402071246.GF4714@vireshk-i7>
References: <20180328145913.14026-1-ghane0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180328145913.14026-1-ghane0@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28-03-18, 22:59, Sanjeev Gupta wrote:
> All links working.

And why is it important to convert them to https ?

> Signed-off-by: Sanjeev Gupta <ghane0@gmail.com>
> ---
>  Documentation/thermal/cpu-cooling-api.txt | 2 +-
>  Documentation/thermal/nouveau_thermal     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/thermal/cpu-cooling-api.txt b/Documentation/thermal/cpu-cooling-api.txt
> index 7df567eaea1a..32917d178c51 100644
> --- a/Documentation/thermal/cpu-cooling-api.txt
> +++ b/Documentation/thermal/cpu-cooling-api.txt
> @@ -5,7 +5,7 @@ Written by Amit Daniel Kachhap <amit.kachhap@linaro.org>
>  
>  Updated: 6 Jan 2015
>  
> -Copyright (c)  2012 Samsung Electronics Co., Ltd(http://www.samsung.com)
> +Copyright (c)  2012 Samsung Electronics Co., Ltd (https://www.samsung.com)
>  
>  0. Introduction
>  
> diff --git a/Documentation/thermal/nouveau_thermal b/Documentation/thermal/nouveau_thermal
> index 6e17a11efcb0..502b0b95c2e2 100644
> --- a/Documentation/thermal/nouveau_thermal
> +++ b/Documentation/thermal/nouveau_thermal
> @@ -79,4 +79,4 @@ Thermal management on Nouveau is new and may not work on all cards. If you have
>  inquiries, please ping mupuf on IRC (#nouveau, freenode).
>  
>  Bug reports should be filled on Freedesktop's bug tracker. Please follow
> -http://nouveau.freedesktop.org/wiki/Bugs
> +https://nouveau.freedesktop.org/wiki/Bugs
> -- 
> 2.15.1

-- 
viresh
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
