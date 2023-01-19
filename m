Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F18C004D4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 11:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230489AbjASLnj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:43:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbjASLnS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 06:43:18 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1245A75A1A
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 03:42:49 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so1050918wms.2
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 03:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aGOCUa90Q6GecXZlyktaQMT3FaJcTaKaXef4xUwVlsI=;
        b=mQJdRPQT/G925muxm5y5X5xxGvrzo9HRieViv3UPDfZ0YnByak959w8xB5xBRvW691
         +pvsFhbbf0sKaRSDu744jxUU2O/kZyH3j4plKgd2/4caZ2b0yfAybXtbjNWL3vhjGVDS
         SWFzsbuIrnhhJoFFP62F1nfIFAk5oAdkEMElKmbHx8Efk2rCMQ59pNNnfxWh/NQUYEdx
         wHWaK4yeFhFPPVSZpzOpOpjYuW3iqKQIAnTM2BH1yu8LD48ni1sgvqK5rSAL8G3tUlgy
         gz9LUuxC4fcLDeQkOUzFnK46bF97fyHhhDw5rqYjSFNRJutq1oHNNyRdFoptOcd3yhrR
         AunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aGOCUa90Q6GecXZlyktaQMT3FaJcTaKaXef4xUwVlsI=;
        b=oihv3dCzsbkU+vNyYIbf1yLKTS+KjyT6+J39mbk55nvkupye8ZfgWnHgjz1BtORTWj
         SoegJ9MSJD/7o4sqsxOyKQM+XqheFsJaHf2R6zzrNjuIB0fgKDMgHiJ07v4we9kMrbwI
         OmVXrXSeazhdb3fge/KTtuk67UO8CBOUC9Fsnmg+bTtfwvxR10zDlTBw95X71g7GRsw5
         6WNvaPXLV3HkI7zRpofVO8JWM0YkVA8x4ayl37EmFptzPHIopRy8BwmV//pU+UQcpsNK
         VGdzSR1GpUsI7y6gLKnEl3PGT7V34/wyrISoGiMtj1mlkWPHWf+rdNc3x+aXOUvtk01N
         edbg==
X-Gm-Message-State: AFqh2kqkd28+yt2dugknbTxHwpt519XQQif0wbJ4As88c0MpzzVj/Y1z
        +9/3V6fZ1btWNYnvnZfsUzj45A==
X-Google-Smtp-Source: AMrXdXssEIeVpk3X1FIFFciJq51Cu5AreREsl/mdQ1un6vSac+sLtqMVI3HE4pbO8c7AuMUXfQ38Qw==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr18469160wmb.14.1674128565881;
        Thu, 19 Jan 2023 03:42:45 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p18-20020a05600c359200b003db040f0d5esm4959764wmq.33.2023.01.19.03.42.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 03:42:45 -0800 (PST)
Message-ID: <5e504304-9130-1662-c048-a5863ba9ddb2@linaro.org>
Date:   Thu, 19 Jan 2023 12:42:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: add nxp,mc34vr500
Content-Language: en-US
To:     Mario Kicherer <dev@kicherer.org>, linux-hwmon@vger.kernel.org
Cc:     jdelvare@suse.com, linux@roeck-us.net, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230118123019.3041303-1-dev@kicherer.org>
 <20230118123019.3041303-2-dev@kicherer.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118123019.3041303-2-dev@kicherer.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 18/01/2023 13:30, Mario Kicherer wrote:
> Add dt-bindings for the NXP MC34VR500 PMIC.
> 
> Signed-off-by: Mario Kicherer <dev@kicherer.org>
> ---
>  .../bindings/hwmon/nxp,mc34vr500.yaml         | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/nxp,mc34vr500.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

