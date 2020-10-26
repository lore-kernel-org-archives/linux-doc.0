Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391A6C2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0011522263
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:53:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GbcCABbn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782148AbgJZOw4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:52:56 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:44846 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782147AbgJZOw4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:52:56 -0400
Received: by mail-wr1-f67.google.com with SMTP id t9so12920471wrq.11
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p1ATpOW7fjmmAl8xtmCr7FlKnqWcx/tsWTiaC0juAts=;
        b=GbcCABbn1MZFMyY8cJ/56fcj0+99V3U20gVd6W+DTtpqeh2pRBDHXc2kPz3NECc09R
         SFP5KXC7nzZ4pSDHJ//lx3ABs34GR8mF22hsFPkOBHNHwua1ZmE3Ynpiu6ZfIuBcZ62T
         et2Q84Pi+O672GcidITbxefBnFxMNBxiTbrHioJSoF5dEDws5lISknG0QmiQja3ga9Ii
         u2PpyKc4BSOagB2n1WiDiDOZCs4kAZ9nZRuTuXs1OU+Bjz66ll7uoBXfY3V/QJf4l9g6
         TItcw6UVuXLjA6W6bqHSIrlQDJnFMfnPh9QLhKDGfiH/AafJOirtwKmNyzkPbhnmghl9
         R/vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p1ATpOW7fjmmAl8xtmCr7FlKnqWcx/tsWTiaC0juAts=;
        b=Bm6+GicDWnmO44OwgytnJWKv6nM9wtnzfMjt2sO4EkxYv8oShUHme7EZ4J9+neyE7T
         u2NIy5wRMlOsUuLryJKLt+xctHALA3faGWKs585+WK5zPJLeGYngXGNmf8GarQ4rChpI
         im8yvxtddo75OOIQzKonFIgyqtRTV54BBLLscay1l9359SrdHxrkxlm2IQGIg2wrJav9
         RFQyAZdScQ9ipcizhmg/oqKCa9zN18pR98vymlecJxluQLznQdAziZbVHgFS9HZ5a+5F
         xW4dKm1pZBcgYY01pj48sE8dcdAkeh0GEB9Yf72TVblPEVvz6oXf/6eBpIHoYvoJ9Ppj
         mdLg==
X-Gm-Message-State: AOAM532RzNykbtB8B9YJEmi5+TN2Zdhvphf7ubpNldRuRJOeLi4W3sWw
        VNg6TmlFxSSU3iyiBfQ33JIsNg==
X-Google-Smtp-Source: ABdhPJxdpFTwysYkqbRSmVcQK0EOy70eZY5M5Qd3me5h/gpBQEZ0sPw8BPz+c1sg2SluLFkLJ2uflg==
X-Received: by 2002:adf:9dd1:: with SMTP id q17mr18548114wre.317.1603723973333;
        Mon, 26 Oct 2020 07:52:53 -0700 (PDT)
Received: from [192.168.86.34] (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
        by smtp.googlemail.com with ESMTPSA id j9sm23341810wrp.59.2020.10.26.07.52.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:52:52 -0700 (PDT)
Subject: Re: [PATCH v3 28/56] slimbus: fix a kernel-doc markup
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
From:   Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <7b37a351-9f11-e639-66d6-4ca251bcfeab@linaro.org>
Date:   Mon, 26 Oct 2020 14:52:51 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <7a581d05aec5ebbd02be27513de1c5e5a25b7922.1603469755.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 23/10/2020 17:33, Mauro Carvalho Chehab wrote:
> Fix the name of the enum on its kernel-doc markup:
> 	enum slim_ch_aux_fmt -> enum slim_ch_aux_bit_fmt
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>   drivers/slimbus/slimbus.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/slimbus/slimbus.h b/drivers/slimbus/slimbus.h
> index c73035915f1d..00a7f112574b 100644
> --- a/drivers/slimbus/slimbus.h
> +++ b/drivers/slimbus/slimbus.h
> @@ -244,7 +244,7 @@ enum slim_ch_data_fmt {
>   };
>   
>   /**
> - * enum slim_ch_aux_fmt: SLIMbus channel Aux Field format IDs according to
> + * enum slim_ch_aux_bit_fmt: SLIMbus channel Aux Field format IDs according to
>    *	Table 63 of SLIMbus Spec 2.0
>    * @SLIM_CH_AUX_FMT_NOT_APPLICABLE: Undefined
>    * @SLIM_CH_AUX_FMT_ZCUV_TUNNEL_IEC60958: ZCUV for tunneling IEC60958
> 

Applied thanks!

srini
