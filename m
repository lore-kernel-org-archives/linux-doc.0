Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65736C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  4 Oct 2022 16:38:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230163AbiJDQih (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Oct 2022 12:38:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230155AbiJDQia (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Oct 2022 12:38:30 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6DD75F23C
        for <linux-doc@vger.kernel.org>; Tue,  4 Oct 2022 09:38:29 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so7891637wmq.1
        for <linux-doc@vger.kernel.org>; Tue, 04 Oct 2022 09:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=DKQpac6G2JzOYLjAcZSv9Jgk1sUieQDvyNd9OPyxgCE=;
        b=oUGi9B2FR94igkLKdqC03JU59taigRLMG4dquNEZxHpynvoPNvc0Q8peRWwsu9V6nY
         2DthjusT0iRPf1geGpR1NJR+qIeBbKMTaDSllNC/vr8RgDHZv0DnBUrmxgcu+An5qGor
         +tz86VS51Q5XsalEQBBfEVGbDJViAWzZMkplhy/ter2PBm2CrOaw+S8sRll728qGBYEg
         qNf/ntQcd/yGGqZCYg1VfXTmWA3zX7V0cf7yX3tNBpBoKmSK3Vh2V15TfMvzQVmtaMvV
         TqYnYUktzvS/Odqmzdu09yJz4rh3FtzQkrxeFqHOX5v8T7qlxiJcmC0Zeo0NAZFbiM4Q
         HSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DKQpac6G2JzOYLjAcZSv9Jgk1sUieQDvyNd9OPyxgCE=;
        b=47bEiBTY26LpvuyeO76VMYk0/0J3ujgYPffz1ixeJYcI81QSbrKXmUPdzjqwd+iv+7
         +uztRwMHOsz5eDwPINdKCGrGOrAh7prFAchDeTKs7t5v3PxhM/CR17y+kKa7pPnewXSa
         eadK8RsZialTntW1MeGbMxp6Oi4LEPXGeoWXuZa5qnm/7gr1QI+iJc5Ul3toUg9kije2
         BKSJ5KaZh1w8eWBHlkWF/ZLTh8svyONSJOIzLsdEaULm9UGN7NZZEBDgzNVtBK049bUn
         uf/I5j4Jw2G55vrG0tnJQsFSMkeLXQOGWQZmdXDxuxPMRP4M+0aOdvNsHNF7x99XBOGI
         IObA==
X-Gm-Message-State: ACrzQf2PDKw75zyjZ6LgFfDK+AddLrTdF8BBQRTUDDNc/iS7PXEpFdFO
        f9O1rp0GVv3MIWFZW7gXZjWhsQ==
X-Google-Smtp-Source: AMsMyM7xO9a29DyAqwG9Py/WIBQk8fM/npfunmpjzeJJMIBnrGHO9dQM1uVrFhDamLp8Lhxm8Kz16g==
X-Received: by 2002:a05:600c:1c19:b0:3b4:c1cb:d46d with SMTP id j25-20020a05600c1c1900b003b4c1cbd46dmr451737wms.172.1664901508449;
        Tue, 04 Oct 2022 09:38:28 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id bt4-20020a056000080400b0022cd96b3ba6sm16785773wrb.90.2022.10.04.09.38.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 09:38:28 -0700 (PDT)
Message-ID: <8042912e-23a8-d32e-1aae-fb766ecb865a@linaro.org>
Date:   Tue, 4 Oct 2022 17:38:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 1/1] Documentation/process: Be more explicit about who
 to mail on patch submission
Content-Language: en-US
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     linux-kernel@vger.kernel.org, corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com
References: <20221004124858.640349-1-bryan.odonoghue@linaro.org>
 <20221004124858.640349-2-bryan.odonoghue@linaro.org>
 <0a154bd0-f380-19ae-00df-5d73c1dc7c8b@gmail.com>
 <42f15689-d1ad-2be8-5fed-8f72d82402dc@linaro.org>
In-Reply-To: <42f15689-d1ad-2be8-5fed-8f72d82402dc@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/10/2022 17:27, Bryan O'Donoghue wrote:
> You are not _required_ to run get_maintainer to submit a patch, it is 
> simply _suggested_ so in my view the output of get_maintainer doesn't 
> negate the statement that you must mail at least one public mailing list.

And similarly, saying in a subsequent paragraph that you should always 
mail at last one public mailing list is unnecessarily disregarding 
information returned by get_maintainer.

get_maintainer produces a list of text that is very helpful to a 
developer in deciding where to send a patch. Documenting that output 
directly is a help.

But unless/until get_maintainer is _required_ to be run on any given 
patch, then we should still have a standalone paragraph which explicitly 
states a public mailing list must receive the patch.

---
bod
