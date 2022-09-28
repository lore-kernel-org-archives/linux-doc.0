Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C820C04A95
	for <linux-doc@archiver.kernel.org>; Wed, 28 Sep 2022 11:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233301AbiI1LWz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Sep 2022 07:22:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233277AbiI1LWy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Sep 2022 07:22:54 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632BEDCEA6
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 04:22:53 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id r3-20020a05600c35c300b003b4b5f6c6bdso831173wmq.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Sep 2022 04:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=5r/R/zTIA+UHBL8+NNIn1gm9HIoK0uBpWfJYbDlV8fM=;
        b=rmOlj0O5Gox6voSOmmA5cQZt7ZLl8o7m7KKbOWy5gB6tBqU24bcTnPGTVioXvCwgMu
         gN/ULWyC5rDIEma3ZK+xu239v4SzOq6Hrv6UQxsvLaWFHpSs2PCB1pSQPzKwb3dnG9zz
         Hk2yKnyOvKSI4pbHBVkFXOgF8ReOk5vCmiMMYPpw5KK1XUYARXXKiRelifdisViWSNaT
         onUnmIHDgpFrRTZz+WSYJa5vHO5JT4dae4EU/j9rHvNpp+hhc5ZRcHOpdOqD8gAJbJ+9
         3gRIbMFm7nFXchiK9vGMZOVoqunMdm4x9oRiUj38toeOAm7J/6gTvL9UE/pARnrTQmZz
         IMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=5r/R/zTIA+UHBL8+NNIn1gm9HIoK0uBpWfJYbDlV8fM=;
        b=wlwJC0T8yl0uEWLhifghd1uGB68ubynMHKF1MAUw4tPMr+YnM58V3+6J7Y91IPA4Rx
         x2SX5sSnVLNo72zvopbkXYJ5H4jjuZdXjPynNEcFYz5kWpwRtJeI1hQ9I/7MAuEo954B
         4FKEb+3f+jcL8oOStsCeLH2hxvOn1CxKhn0HGq57NyBQFUWkf0CC6OQwcyagd/Uzj2/K
         3hQiVtUPSx6Q8fYDxDWnNQY5RZK5wPGPUZVpt30kwhoUHPl4hztwfueTBAZ0JtaJ/8eH
         +b3y/ONe+1h1RIC1/kc+xk9G+Hd96t9313Le/Z88De7CjzpIHGmoiGb9mmb/blmyc+h+
         Jrhg==
X-Gm-Message-State: ACrzQf3e0rnuB2ZANbEGYdd1g1W/U83TW8+yJINRnCs0tItP5W848yzg
        FXa18Ryt0A4bxNw/KAZLO2lM/w==
X-Google-Smtp-Source: AMsMyM4IRzJUnjS5cjxciVMnT5ISSlNEu4XDbmDM2yNgF1XqotFEavzESCfNxM5yFS42yWqqKYYQ5Q==
X-Received: by 2002:a05:600c:1da8:b0:3b4:8fd6:5132 with SMTP id p40-20020a05600c1da800b003b48fd65132mr6326840wms.99.1664364171921;
        Wed, 28 Sep 2022 04:22:51 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id q17-20020adff511000000b002253fd19a6asm5093793wro.18.2022.09.28.04.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 04:22:51 -0700 (PDT)
Message-ID: <c9d2b6b2-6f67-fccd-6e57-844ad1455cdd@linaro.org>
Date:   Wed, 28 Sep 2022 12:22:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] Documentation/process: Add text to indicate supporters
 should be mailed
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
References: <20220928003006.230103-1-bryan.odonoghue@linaro.org>
 <f74a9883-3a9b-8606-b20d-f046835fb827@linaro.org>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <f74a9883-3a9b-8606-b20d-f046835fb827@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 28/09/2022 07:53, Krzysztof Kozlowski wrote:
> That's still a bit misleading, because you should also send the patch to
> reviewers and mailing lists. 😄

I can add something along the lines of "and whatever subsystem mailing 
list is called returned by the script"

and leave it to the discretion of the patch sender to determine if they 
want to include LKML or just go straight to the subsystem.

---
bod

