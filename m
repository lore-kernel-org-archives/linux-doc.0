Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B45EC6FA82
	for <linux-doc@archiver.kernel.org>; Tue, 13 Sep 2022 14:24:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232448AbiIMOYX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Sep 2022 10:24:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbiIMOXv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Sep 2022 10:23:51 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2A326611A
        for <linux-doc@vger.kernel.org>; Tue, 13 Sep 2022 07:15:49 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h8so14041076wrf.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Sep 2022 07:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=6nsFmLg7g9YsbtCPZSgBySib0lGrAO6qTsg2zwTfO+s=;
        b=BfdyTA4mOxqx1rh39T/VtbAJ/bIq3+Z0rmL6H5tU3SRiMzwD1WbfMTeBQ8XyfXmg4r
         E/4uZEx49ZGdm7jPYGEy3cW466dhfMJtG1D6LIopDPFNjfNIkNk++MGZQ/nNgfEuCqZQ
         G6IDYW0gysjKZE8JuMcbrLZOlHbhCCoqyp5uJx26te2dlzc8IXTGYIlhfgxwxU94YgIF
         F5Dh4OZQmjUn0nuFiLUagS675FSLe+lNPo2O9+1yhzUBKE1jje6LmmpxK1B53JeX8k3j
         QUEmOiwCYGXeCTF+AfEmDoYQQVyyNeNAOuXYNnxgw9Fj1SPyGvx8lNTxhGtp5VVFtgIp
         VI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6nsFmLg7g9YsbtCPZSgBySib0lGrAO6qTsg2zwTfO+s=;
        b=SPinHPJeXNM9hwUK8W9FArdMwm7XWirX7fHyHA0BRouLoIB3VTXk9KV9TJS3dhEJ1l
         oTUsyI69m2Hc74lkRmzWsoXhZ0aladJXYz8JVbVmBmQI2E4NR4sIF560zq03Wlm14u8F
         Q2FaJbU9GqpFuCDW6US4jiye10JaB/ZII+d4LqHaNNE3htJfvd5Tk9V8Iv5mjg8/K/2p
         hmWhNysm36CG6AQIgoGEnMT3Tu6TEY5z1PtKSO5Ims7UzXTotnu6/rFPpc+Upm84D9Xg
         xuNPS0TNfoeVeyz1rssymLodx3QwdzUDpSs3l+v4EyvrXSMSRCbYB17f+kQaVCldfsTK
         sHYQ==
X-Gm-Message-State: ACgBeo3b6vV4gC5pgAZzq7Ul1TqgiR5hV/+zFIDrKNAPI9aPKY/LOfsN
        gT2s1J2J0JJbwiELxMDovPapyQ==
X-Google-Smtp-Source: AA6agR6+HzIAG6FR/aycTWCe6kk6TLnu4qKS9LdSgIHsdUoa+Iyz0USBz4xF0llFjpDIInXCjYzkiQ==
X-Received: by 2002:a5d:6581:0:b0:228:e143:ddd7 with SMTP id q1-20020a5d6581000000b00228e143ddd7mr18534314wru.329.1663078455288;
        Tue, 13 Sep 2022 07:14:15 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.67])
        by smtp.gmail.com with ESMTPSA id j13-20020adff54d000000b00229d55994e0sm10377533wrp.59.2022.09.13.07.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 07:14:14 -0700 (PDT)
Message-ID: <2e4c52b5-85e8-6951-8248-961c2cdb13e7@linaro.org>
Date:   Tue, 13 Sep 2022 16:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: lkp report WARNING: Title underline too short.
Content-Language: en-US
To:     Rong Tao <rtoax@foxmail.com>
Cc:     corbet@lwn.net, erik@kryo.se, jkosina@suse.cz,
        konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@leemhuis.info, lkp@intel.com,
        ojeda@kernel.org, rdunlap@infradead.org, tglx@linutronix.de,
        Rong Tao <rongtao@cestc.cn>
References: <cc102d14-77a8-f97d-60c1-f0918656905f@linaro.org>
 <tencent_43596D97142AB4AFFDA36A8813061442FF08@qq.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <tencent_43596D97142AB4AFFDA36A8813061442FF08@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 13/09/2022 15:55, Rong Tao wrote:
> From: Rong Tao <rongtao@cestc.cn>
> 
> Hi, thanks for your reply!
> 
> https://lore.kernel.org/lkml/202209100436.Ud19XNGq-lkp@intel.com/
> 
> The doc submitting-patches.rst has a WARNING 'Title underline too short'
> 
> before:
> 
>  Backtraces in commit messages
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> after fix the warning:
> 
>  Backtraces in commit messages
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> add a '^' in the end.
> 


Don't top-post. I don't know what did you reply to...

If about reported-by tag, the link there did not report original issue,
so skip the tag.

Best regards,
Krzysztof
