Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40316EB64D7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 19:05:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230335AbjFTTFV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Jun 2023 15:05:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230364AbjFTTFT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Jun 2023 15:05:19 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C083172B
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 12:05:10 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-3094910b150so5086074f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Jun 2023 12:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687287909; x=1689879909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/x5qK0JZg5lh7rsy4InWDjLtme8s/Ys8njFfDN5MMo0=;
        b=RGsFwD7lYdd63uR6B4oIifnq780QcXAQQ3iRbMWCAm21RMd28pCE+5e7YYvpWcQU6A
         RcFLqkOqVYfbRGOYjiyBz3TgvZ+hNuaMLwzoDt6CmY0q7GSYyhmf+1KSp+KdeYlad+/n
         HYTFlxUxvPvMhiflguPOkvHb97Uw0FeVFrRUoqioKvEbKwzST4194kM0xBOMbDv9pyRm
         GAmmcAzKzaoHtKwYIXI8eoL6pFR8qdH3wnpbVIxhcc+OOYF9l/nnwHN+D7xWG1OhhHVH
         4LYL6Mx8fDGB1iqzj29zP439GC+cbGDa9r7UwL8TX2H25xs4VekxzjHeIdVqBw0fw6e+
         vqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687287909; x=1689879909;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x5qK0JZg5lh7rsy4InWDjLtme8s/Ys8njFfDN5MMo0=;
        b=hc3/kbSnDeU9L2uWymttigjHnPoJbe6a+ssSFOnugf4p+pY9jymgBm7rLT3Rss9bvF
         K6J8d044KEwuTr1VzHLJJhH52fsZy9pRcqftsMiA379/fExQMiREe5hx4HKSiAm4trlO
         AAk9rF+TB5o327Yse++PCAA7d8kTbrz/S94cH1x0/V6jUGSV131szuGPCQwPaLoaCi0m
         aJOwzIlPAnIP5H2OvLPoWbyRQ4gtzls/Q170nPwUYKcpWblw99Irq6/fjJH3kbbKaaHP
         7Ib7MyO3jLaUDcvqlO8MUPBAyVEUGxwr4nh/e0opNkNugGJmIj+TKyzcwlta9gXbCjQh
         2jYw==
X-Gm-Message-State: AC+VfDzv5BucvFE3qlBWQIi3pvEQ/yyYpj1Va3JN+1hwGPNUhYtSdRfn
        uPtZpk+LPbtVhWbTg70RaMe3vQ==
X-Google-Smtp-Source: ACHHUZ7RuSXEbFUBjQoO0NzolYYNuaEjzPWPGewLg1lD6fGwsVUakTyQ6ba1Hdujm1n5eYaQ5dpzEQ==
X-Received: by 2002:adf:ea8b:0:b0:2f8:3225:2bc2 with SMTP id s11-20020adfea8b000000b002f832252bc2mr10313053wrm.41.1687287908640;
        Tue, 20 Jun 2023 12:05:08 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:fae4:142d:36ed:5151? ([2a05:6e02:1041:c10:fae4:142d:36ed:5151])
        by smtp.googlemail.com with ESMTPSA id f7-20020adff8c7000000b0030e6096afb6sm2606283wrq.12.2023.06.20.12.05.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 12:05:08 -0700 (PDT)
Message-ID: <b2eea9c9-e74b-b28e-f6af-244801e726b8@linaro.org>
Date:   Tue, 20 Jun 2023 21:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 0/7] thermal: enhancements on thermal stats
Content-Language: en-US
To:     Eduardo Valentin <evalenti@kernel.org>, eduval@amazon.com,
        linux-pm@vger.kernel.org
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230519032719.2581689-1-evalenti@kernel.org>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230519032719.2581689-1-evalenti@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Hi Eduardo,

On 19/05/2023 05:27, Eduardo Valentin wrote:
> Hello Rafael and Daniel
> 
> After a long hiatus, I am returning to more frequent contributions
> to the thermal subsystems, as least until I drain some of the
> commits I have in my trees.
> 
> This is a first series of several that will come as improvements
> on the thermal subsystem that will enable using this subsystem
> in the Baseboard Management Controller (BMC) space, as part
> of the Nitro BMC project. To do so, there were a few improvements
> and new features wrote.
> 
> In this series in particular, I present a set of enhancements
> on how we are handling statistics. The cooling device stats
> are awesome, but I added a few new entries there. I also
> introduce stats per thermal zone here too.

 From my POV, that kind of information belongs to debugfs. sysfs is not 
suitable for that.

The cdev stats are a total mess because of the page size limitation of 
sysfs and the explosion of the combination when there are a large number 
of states (eg. display is 1024 cooling device states resulting in a 
matrix of 1024 x 1024, so more than 4MB of memory).

For the record, I'm working on such of statistics [1][2], and optimized 
this cooling device statistics in order to get ride of the existing 
sysfs cdev stats.

Actually, all the stats rely on the mitigation episodes. However, for 
that we need to correctly identify when they begin and when they end. We 
can have mitigation episode inside mitigation episode (eg. passive 
mitigation@trip0 and active mitigation@trip1).

This is not working today because the trip point detection is incorrect, 
thus the mitigation episodes are also incorrect, consequently the stats 
are de facto incorrect.

There is more details at [3] but the change assumes the trip points are 
ordered in the ascending order which is wrong, that is why it was not 
merged.

The mitigation works but the detection is fuzzy, so the math is 
inaccurate and as we are in the boundaries of a temperature limit, the 
resulting statistics do not show us the interesting information to 
optimize the governors when they are not totally inconsistent.

All the work around the generic trip points is to fix that.

There is a proposal at LPC to add statistic/debug information for 
thermal, may be you can participate so we join our efforts?

   -- Daniel

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/trip-crossed%2bdebugfs

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/log/?h=thermal/debugfs-v2

[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git/commit/?h=thermal/trip-crossed%2bdebugfs&id=7d713a9128ad9a153de9c3f5b854c6f1acfb3064



-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

