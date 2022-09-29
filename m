Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9486CC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 29 Sep 2022 10:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbiI2KdO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Sep 2022 06:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbiI2KdN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Sep 2022 06:33:13 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03B0898D39
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 03:33:12 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 130-20020a1c0288000000b003b494ffc00bso2415511wmc.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Sep 2022 03:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0jUTfFIgKk/2yeo2BJNDMeJhuO1PB3sjcqaadJwgKho=;
        b=hpmTeMR/CKDwh+ce3mVXd4Qf37umw+QQYOURtg0a6TuyYWWRJi63eCiK/8AK8dJW8t
         q6cB+YFZt3sUUEZA+A4Za2mA/sbs7P6T1rmO1ptBJKKQD9+pYP346ar2uaxUWLLB+FiB
         nWHy+Np06JX6m8ScNAWQcGHkN4dJBj+CxS/NBnYHUkNHwx3SSmpC4+yTNF5c/eugY3w4
         KEQFosCOrVNbcT8v6vN7u6bmjN9sZLTeOETE8G3Tz34xlrHYewOoBVKgfG0r6/4VB607
         gu6yVC58JsNdd5EFwKhTHN2hcvVP/QvpdXTZKZYsFVRz+hxu6JytgY1LNTehQrUwxBf5
         fM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0jUTfFIgKk/2yeo2BJNDMeJhuO1PB3sjcqaadJwgKho=;
        b=D1paNxU2OJJXPWchYQ0brR94vj+11Edlc1zFeJPS1hVG3u6mj+NSEM+X0KJQ9rxu0p
         lBRsobIkdgvbTd2COSRniluf6+J5VtHBiZHsmmXcj1CJnBAqBE1NMVv64JkHzhFD3Ru8
         ljT05vI9nGSwpKZ+HtMZPou5w+upL2ZqFKruseTBA/golqCpnBLs2460EfA4l62pp2ix
         Q3Zz035QyaqnPSf5hwyh9Uezi6LRwAtWH454a2FHQZnFzu7aKNpwsYMh1Ctx9f0udDFk
         2dAYUsONqQYRci+dNmPXmN+uFELxCCaV0MfjEdUsx2Ojo8fRguKGzPsk/bs8MFIJjwed
         LNHg==
X-Gm-Message-State: ACrzQf2kaG6H7YuOMjJ17ORVaAP2F1Y6DccFHzuAYITXqNF/xKn0qxrQ
        NAPwQQiNEk18gTTqRlti0UIpKRvRATSp0Q==
X-Google-Smtp-Source: AMsMyM7MLU2KgC9V6qnhrTEYTwAuXkAO8U/+9DVEppc6EoPIiQucMB88PC0ET3pAluuAo6vV/dCDug==
X-Received: by 2002:a05:600c:3595:b0:3b4:8378:98d2 with SMTP id p21-20020a05600c359500b003b4837898d2mr1840165wmq.64.1664447590345;
        Thu, 29 Sep 2022 03:33:10 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id u16-20020a5d5150000000b0021f131de6aesm6085202wrt.34.2022.09.29.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 03:33:09 -0700 (PDT)
Message-ID: <b36887f5-ffb8-1665-f959-be1e632e5206@linaro.org>
Date:   Thu, 29 Sep 2022 11:33:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 2/2] Documentation/process: Add text to indicate
 supporters should be mailed
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220929002500.283481-1-bryan.odonoghue@linaro.org>
 <20220929002500.283481-3-bryan.odonoghue@linaro.org>
 <54a19490-aa0d-2dcd-8407-319d6167add4@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <54a19490-aa0d-2dcd-8407-319d6167add4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 29/09/2022 08:29, Krzysztof Kozlowski wrote:
> As I said before, this still ignores reviewers. I don't think it is
> going to good direction. The submitter is expected to CC
> everyone/everything which is pointed by get_maintainers.pl except the
> Git-fallback entries.

Isn't LKML considered optional at this point though ?

---
bod
