Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE6BFC64991
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 14:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242317AbiHYOoS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 10:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242556AbiHYOns (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 10:43:48 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4C21B56C4
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 07:43:14 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id bq23so19486886lfb.7
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 07:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=QezGck2Rnt9aXrRomj4tCk+MjHbkRY5eeAf7b3CgndQ=;
        b=VMcrbXFG2tzap8vdSh9E6djrYwmTahWltw0gYbaq4/0anFEQMdSXsLofME6bs35t5y
         BGdJJOpYHqDHXk3gkCPHxnQUJqWu9BDdOLc9tNo5bgakhRoTZHJ7Pd/wml9weNBrO2F4
         bkz7DnE/rH8Hylbkgv60V3wkinVk9dsCKKN9Z1K503v66HzU41lXebf3+d+19Fj+s06Q
         USNXqChq35jKliC8fQqADqAVyJSzjp6Bb/IxCoAYaaKpLhgE46FpbVH1VdEfOzBFONdu
         tURKnw5E7Vo83TTc9C0kRFUcWDoIfRMzQwx6LZ/1JCQRF6xd4j5YYCeM8sC4mZOvvwXH
         rXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=QezGck2Rnt9aXrRomj4tCk+MjHbkRY5eeAf7b3CgndQ=;
        b=7U98e3joDQfVqG0Z+B23ktI1YrzxC0xPWHWKW9TnvHE7+CQDbJcJfm0uFdUX2vPwQx
         IcSvLO16qBmxxww7Wfnim/r6aSnNMdY16issQbaOUvCJ+8H0aqYhpSOFPvJT9okATN4A
         G9DBbHkLhgsRxBdesNUy12YwQbnemu78gdpL81jQOMONGffMXS08ghen1/XlxDqD0heP
         N1+AaBABxIb338fk7LBTJB9Cq8AM4s2UVZwRlFoCDHYZcnVbXAB+9RbNDx73/Hu0UaH4
         sCw/3WUHsHMFl9Igi5gOEd7c3xZpLdbWd51fH9jqAe35cW/lEyx+UnAG+XywfPmNW6fH
         Ow3w==
X-Gm-Message-State: ACgBeo0m5vKXFwJ+4e89+901UR/mMyg2fKDMPGEY0svb+GTwxj6eYnjT
        McEguAE+++PDnkKIB7oQvWoTVQ==
X-Google-Smtp-Source: AA6agR7lt6cQDb/JenKwqvFlrkshRUfjJ/CgGHNtlopSR4xN9kuquWmQ6UX8k806tVa5ooIw9b/7ew==
X-Received: by 2002:a05:6512:1045:b0:492:c1f8:898e with SMTP id c5-20020a056512104500b00492c1f8898emr1386233lfb.619.1661438593317;
        Thu, 25 Aug 2022 07:43:13 -0700 (PDT)
Received: from [192.168.0.71] (82.131.98.15.cable.starman.ee. [82.131.98.15])
        by smtp.gmail.com with ESMTPSA id z4-20020a05651c11c400b0025dfd2f66d6sm601026ljo.95.2022.08.25.07.43.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Aug 2022 07:43:12 -0700 (PDT)
Message-ID: <1ff8ca51-cd20-8066-6ca4-f6359bb89dd8@linaro.org>
Date:   Thu, 25 Aug 2022 17:43:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3] hwmon: Add driver for the TEXAS TPS546D24 Buck
 Converter.
Content-Language: en-US
To:     Duke Du <dukedu83@gmail.com>, jdelvare@suse.com,
        linux@roeck-us.net, corbet@lwn.net, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     fran.hsu@quantatw.com, charles.hsu@quantatw.com,
        george.hung@quantatw.com, duke.du@quantatw.com
References: <1660878283-9512-1-git-send-email-Duke.Du@quantatw.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1660878283-9512-1-git-send-email-Duke.Du@quantatw.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 19/08/2022 06:04, Duke Du wrote:

Thank you for your patch. There is something to discuss/improve.

> +static int tps546d24_probe(struct i2c_client *client)
> +{
> +	return pmbus_do_probe(client, &tps546d24_info);
> +}
> +
> +static const struct i2c_device_id tps546d24_id[] = {
> +	{"tps546d24", 0},
> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, tps546d24_id);
> +
> +static const struct of_device_id __maybe_unused tps546d24_of_match[] = {
> +	{.compatible = "tps546d24"},

Except missing vendor prefix, you need to document the compatible in
bindings.


> +	{}
> +};
> +

Missing MODULE_DEVICE_TABLE

> +MODULE_IMPORT_NS(PMBUS);


Best regards,
Krzysztof
