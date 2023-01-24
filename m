Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17FE0C38142
	for <linux-doc@archiver.kernel.org>; Tue, 24 Jan 2023 14:27:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbjAXO1S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Jan 2023 09:27:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234857AbjAXO1R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Jan 2023 09:27:17 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 787A85BA7
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 06:27:16 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id d14so10370103wrr.9
        for <linux-doc@vger.kernel.org>; Tue, 24 Jan 2023 06:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83ylCl/7imBVz3B8ZOzg+0qRgMLvJMRlFiKPHboLlxk=;
        b=MPXhllcNYY9b3gb+8OWFbAz6PZAmG5olDb7v7cFbSDAv6IwaYP5r1ajWxqqAcJTWRE
         kv0aj0tN9/TLxX2C07tXUA4T+tY9fJDb2/QglaKVJBF2/D7sbVLoz6sbMTS0v7gAZMuS
         MYj+dHDvQFFpLMA7UwCs9Sxm2e/estStI2h9lq43kj5blR9fw7REwxLAoLApCwsbfUJi
         lWicTdTu5OI6gTe1zV/Ka2C286XKTSvWQVqXSpJD1OHjuMhwmGKF8h63ESyu67sPQ4tO
         Z5zvyc1unTIeZNGNnoSTjkZH5pUaPbagmQflF1JqyXrRU1msMP203UZceEzYUCOoCWYA
         jzng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83ylCl/7imBVz3B8ZOzg+0qRgMLvJMRlFiKPHboLlxk=;
        b=he98jbyBZ/qb8T29al/2lmnCdED5Uw+k3/buPzuc5n7MCO1XAq2JWATl/b43tQ7B8d
         WImuEfsHtl5K3pZH7SV12NBe+oVmv6UlqZEqqHYsYGPmCKOxKpoNQeOivDfbRSsZx9KG
         LnwMvfjAlhr9PHf7JOJ0nb4xvL/brbcAMuCjHyTBCyZTblTHsEiYSWq7aV4Q+yT/1fb3
         l8YIA6J+dlIwzPdBENw5LyhTwq8OrcVfb1pj05u7qiJ0yhvYGUnOhIxVp+AzSDx6ViW6
         iPwYoAGexZl23Z9MEViJ+b3D8bPZ9ffd+kxl2Tj34WgMY58Rxkr59gJ8zPNYw+n5/QyZ
         oh0g==
X-Gm-Message-State: AFqh2kp131HqGq6emiarcHciaRDQe0kkP+qXclCVkOEjr2/Xwslkte9W
        QoAQlYWWEfqwI0bgYOHdLIAhhg==
X-Google-Smtp-Source: AMrXdXvMAViaj+SgLZBHJD3XBfKynm+jGHWqx/r/lR4qtu9h2VNuT7hG8p9SQKXEEJx9GAShpDsPrg==
X-Received: by 2002:a05:6000:1b85:b0:2be:f21:6af6 with SMTP id r5-20020a0560001b8500b002be0f216af6mr24625431wru.23.1674570434971;
        Tue, 24 Jan 2023 06:27:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v4-20020adfedc4000000b002bf94527b9esm2002227wro.85.2023.01.24.06.27.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 06:27:14 -0800 (PST)
Message-ID: <d2efeff9-1fb9-222c-2d21-1811d8237326@linaro.org>
Date:   Tue, 24 Jan 2023 15:27:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: Add Infineon
 TDA38640 Voltage Regulator
To:     Naresh Solanki <naresh.solanki@9elements.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-hwmon@vger.kernel.org, Rob Herring <robh@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
References: <20230124141436.1687397-1-Naresh.Solanki@9elements.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230124141436.1687397-1-Naresh.Solanki@9elements.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/01/2023 15:14, Naresh Solanki wrote:
> Infineon TDA38640 is PMBUS compliant voltage regulator.
> 
> Signed-off-by: Naresh Solanki <Naresh.Solanki@9elements.com>
> ---
>  .../devicetree/bindings/trivial-devices.yaml  |  2 +

Where is the second patch?

>  Documentation/hwmon/tda38640.rst              | 66 +++++++++++++++++++

These are not bindings. You can keep them with the driver.

Best regards,
Krzysztof

