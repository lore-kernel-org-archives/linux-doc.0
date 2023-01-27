Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9617C38142
	for <linux-doc@archiver.kernel.org>; Fri, 27 Jan 2023 12:52:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234427AbjA0Mw6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Jan 2023 07:52:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232968AbjA0Mw5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Jan 2023 07:52:57 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2699DC646
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 04:52:55 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so3411193wmq.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Jan 2023 04:52:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a9WkdjJUtSWAW7q9hMDY+3mWPKLqhqnxsndeOx1lm8g=;
        b=au4sRJNKmGv4X4Errswe6Bvl7pPfWKzE7I33BGdwXhn5Yr637vGfLM2tNqhtWWaGzk
         xxA7NDT90MPaBFyDELEAAjZikgA1LvNRlGV5mvogJ3iFMdLeUzPsn41fNKrJ8NlPT0e1
         SXVdrzetE1rhDj33QkoSljHl6QnHcXHSHchT3z1PetkJAhSe1eJbvSPqHICI2zFO4yAj
         0UVYVzaVPxIqETB3/zeSIkPKglZWXUgW6DGjPTy9o3KtPs1UheAsEVvxPa94m/trOihA
         FYmr99PgosnStr2oyPu+Kg1z/sO0AX5KoUf3OMBiD6UFpVfxyXuwtrKZDnCJW7Kfb0Ek
         vX0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9WkdjJUtSWAW7q9hMDY+3mWPKLqhqnxsndeOx1lm8g=;
        b=JuzJFonO56/hwBdLl/pdC7Y6TdKH25cVrtrCfTeLhhq1yqVpIjC2Fq961iHz/ek3cn
         Z6ChIT2A9r4y/rKaW7ly/yknQleKMY3gDHoo0V+eICi6MjORgCEt5cis2Z4nT+C2XQuX
         k4r+CI1008i2VShmfAT62BdPd1R9DeL0PaF6alICbTmggBgHrBtQr7t1w0UaQHtzzlw1
         AJn0GJhWZR2SEf6npMoJ+Yf3qGFP6N1DpL2og5RjMblBiLelfUuThBtkVAGLgNghRYjM
         DTM8Jkqs/2PQJLp+YmhtPsHYTf4yioHyrWkaJvvsHlw+hSUWoDM0/Q18SiKMEr5Lq78t
         yNcA==
X-Gm-Message-State: AFqh2kp41pljQzSvIUgKyS0OoHxm5IyhJH2TCg+0aJNGSMrikPJa/J5t
        ygThFCy8mBWsn+B/BsKQ5gu1hA==
X-Google-Smtp-Source: AMrXdXusHYAkFqVSWZOeCX2kB00qq6sKQRQnRIO95SWnimDBnCeHDdsnNIQtdrd11fwtvjRrfJ75vA==
X-Received: by 2002:a05:600c:47cf:b0:3da:fa3d:cf5e with SMTP id l15-20020a05600c47cf00b003dafa3dcf5emr38621123wmo.28.1674823973760;
        Fri, 27 Jan 2023 04:52:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x10-20020a05600c420a00b003c6b70a4d69sm4081369wmh.42.2023.01.27.04.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 04:52:53 -0800 (PST)
Message-ID: <2958ec74-cc28-0bf4-36f8-19089487dd48@linaro.org>
Date:   Fri, 27 Jan 2023 13:52:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/3] dt-bindings: reserved-memory: ramoops: Update the
 binding
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, keescook@chromium.org,
        gpiccoli@igalia.com, corbet@lwn.net, tony.luck@intel.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <1673611126-13803-1-git-send-email-quic_mojha@quicinc.com>
 <7cb96551-094c-1a68-cc3f-31e4e2e94518@linaro.org>
 <9610a38e-9f39-c514-f535-73434ae8f51a@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9610a38e-9f39-c514-f535-73434ae8f51a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 27/01/2023 13:29, Mukesh Ojha wrote:
>>> +oneOf:
>>> +  - required:
>>> +      - reg
>>> +
>>> +  - required:
>>> +      - size
>>
>> There is no such property. You cannot require it.
> 
> I was thinking, since this size is part reserved-memory.yaml and
> we have
> 
> allOf:
>    - $ref: "reserved-memory.yaml"
> 
> Is your comment still applies?

Ah, you are right. It's ok.


Best regards,
Krzysztof

