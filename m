Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A93C433FE
	for <linux-doc@archiver.kernel.org>; Sun,  6 Nov 2022 01:50:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbiKFBu5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 5 Nov 2022 21:50:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229499AbiKFBu5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 5 Nov 2022 21:50:57 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCD37FD1C
        for <linux-doc@vger.kernel.org>; Sat,  5 Nov 2022 18:50:54 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id g24so8193756plq.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Nov 2022 18:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YY0e3UdWikcvEK4uqvNkDiv2KHeyGSl8v58H6M0DGDc=;
        b=Iyj2pwkBFFcuoF3wVMx7IDC51j+wMthMU/1uYESgyjItWQ/mTWkuuei4hcGgiEiWaq
         AquUAJ6FkEh69WTViwDNbmVqJV5qW2M9yThBCjM+8jn957QHgtsD9iiPeveElEEzp6qw
         hJokqJLUWS6F+cM0lBb+TToD/0vl83Q4tcw+rJL2NqwBFjstzAwcHyu57r5LPWdGQ9zN
         GxwFTBhZiGmcxt/ZcT/pNlJVcwpjT/YVD3Mw2CeT+QDibrG7mwRF2XA3r5kIu+Ic83gM
         oRMJTjjquAFmlHZn3g+zeFzYoLrrEBphEN2lvbmiRcSlw/MfZz1ktRUJt7KXAOioUIoJ
         Zodg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YY0e3UdWikcvEK4uqvNkDiv2KHeyGSl8v58H6M0DGDc=;
        b=1NfauDht/fzPqs0q51lwO9eUcrmERXO8KCFbMMes6jQcQPGCQUysYWP1+FM6PIS2rq
         MvadkqEGSlsVWtveGesOoKFqbpqiTeFbBJI6Qv+0jlEt/p7OFxmMqYrbmuNsC1wHkA3C
         SAb/6+1Jswcetyw13xcQIVHYur9vnFUu99jJFrbe9fNmOjLN8Kc8vISxO7BIcXlk3eDc
         ZPRGb45RKscx70AzboHQ9oIukxjAs8Z/5f2flxsKipNRENmx6+vJ5KMO9OdHEDCuvILO
         T6P6Do9kFVEynPrNoc+GyAHmN6iTb47Ey1ivoQuEY+WVs7R9rpRXd0LfbtKkYro01spa
         Atbw==
X-Gm-Message-State: ACrzQf2kXm+6KJuNMRIj2yfgxfC0VANvCYWvt9FyGk6MEBUfztjAen3R
        PTIdxdBAr40thRGZ3+dNzisNTDxtvvc=
X-Google-Smtp-Source: AMsMyM78vawk/8Bq3ehQGZoCI0NQWEMfs+ptGOIYBKTd9eDTvvgkg48MVNWHHuIJmZ5rqMUMcWJ0GA==
X-Received: by 2002:a17:902:db12:b0:187:4736:f780 with SMTP id m18-20020a170902db1200b001874736f780mr21709302plx.145.1667699454226;
        Sat, 05 Nov 2022 18:50:54 -0700 (PDT)
Received: from [192.168.43.80] (subs28-116-206-12-43.three.co.id. [116.206.12.43])
        by smtp.gmail.com with ESMTPSA id n12-20020a170902d2cc00b001767f6f04efsm2260205plc.242.2022.11.05.18.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Nov 2022 18:50:53 -0700 (PDT)
Message-ID: <e416742b-d3f5-c130-b15d-74cbef6e590a@gmail.com>
Date:   Sun, 6 Nov 2022 08:50:49 +0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] Documentation: eisa: Fix typo
To:     Albert Zhou <albert.zhou.50@gmail.com>, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org
References: <20221105080653.4741-1-albert.zhou.50@gmail.com>
Content-Language: en-US
From:   Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <20221105080653.4741-1-albert.zhou.50@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/5/22 15:06, Albert Zhou wrote:
> Fix a typo in the description of the kernel parameter
> eisa_bus.disable_dev within eisa.rst.
> 
> Signed-off-by: Albert Zhou <albert.zhou.50@gmail.com>
> ---
>  Documentation/driver-api/eisa.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/driver-api/eisa.rst b/Documentation/driver-api/eisa.rst
> index c07565ba57da..3eac11b7eb01 100644
> --- a/Documentation/driver-api/eisa.rst
> +++ b/Documentation/driver-api/eisa.rst
> @@ -189,7 +189,7 @@ eisa_bus.enable_dev
>  	initialize the device in such conditions.
>  
>  eisa_bus.disable_dev
> -	A comma-separated list of slots to be enabled, even if the firmware
> +	A comma-separated list of slots to be disabled, even if the firmware
>  	set the card as enabled. The driver won't be called to handle this
>  	device.
>  

That fix is actually misnomer fix (disable), right?

-- 
An old man doll... just what I always wanted! - Clara

