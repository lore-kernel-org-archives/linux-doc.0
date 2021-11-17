Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A96B5C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8F6C561284
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:39:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235482AbhKQJmt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:42:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235346AbhKQJl7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Nov 2021 04:41:59 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30AE2C061227
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 01:38:36 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id cq22-20020a17090af99600b001a9550a17a5so4784521pjb.2
        for <linux-doc@vger.kernel.org>; Wed, 17 Nov 2021 01:38:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p06wr/b9VeViK5RbDBA5PUJzTOvramSvm+dxu+M4rTE=;
        b=pJGIqKsu10BvKRKG5LtiH7UHz0X1hSFCiqUjPWpHUJt6M3NXtqXLX3w1K/XCaEbfeH
         tGZb/fYkxPOSnUN+cL89VU35pyfFzwzlTAoyXHIxOAvsvejjA8YZYZUhr52WdpLZ1/pQ
         z4Ba4NOBonROMMr5b/sI+2v6mDMArk9/YyngfrsYv6bU6f7RkLjFM4n7OZg9G74Ikann
         AKLqDY47KXHuvL8YlMz6dcnZ3WSawa1h5V4BEmqPN38nLhdd2pgLhXEvT5qrmwu/StrG
         +X8hKLuDb47CIIkBtb3EGYT1KpBtWngdUmYluyk7wRwVG+NQA+3WAqD9X1GlL8Tq/kkb
         DZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p06wr/b9VeViK5RbDBA5PUJzTOvramSvm+dxu+M4rTE=;
        b=q85srebv4EFlkller3c/i+nkRaLhy4MWaq3JoD+MsTFanO4p86njRrODiOOTnYGOQy
         rQlMJvYJ8KnC+mlZ7KqKpeLqSdKdAPSk/gQbYTaTTLImTxf6/kEyZyJ/DFg4+KVHUPjw
         P4MHL6G9EiLAEZYoEZ3WXCJ5/uKKVM08sQ4VVG8apNkmZNnfQCwvc6x+wyPJ5HRvuCE+
         +Ih7VSHj2dNcb4TvhdpVOnMPspVXILO7/7cMnHf5rmSJi2ln8mSsdJMRHIWdw7DTaRL6
         x/4b6vCp3W6vG+TkGE03lTreMQ+2IxpTbLZf2Vp+OgHh/yF8tB/bhCey5rfXuO/AmSHO
         lVAQ==
X-Gm-Message-State: AOAM532y9OYcAiJe61FgNr0YUUeUdurEtbFHQr1Ze3WBPwZManjzC8OX
        8vJJE6qXcldkDGaunhHyXy8fRQ==
X-Google-Smtp-Source: ABdhPJxPHQRyK4iq9ZP4EhzdB2xf9ry2tIJHPSDhqUSMZ/ugxhgyKB/rglfReIByiMgp7XdeUr8heA==
X-Received: by 2002:a17:90a:9f93:: with SMTP id o19mr7998523pjp.136.1637141915812;
        Wed, 17 Nov 2021 01:38:35 -0800 (PST)
Received: from [10.76.43.192] ([61.120.150.76])
        by smtp.gmail.com with ESMTPSA id w20sm23657053pfu.146.2021.11.17.01.38.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Nov 2021 01:38:35 -0800 (PST)
Message-ID: <816cb511-446d-11eb-ae4a-583c5a7102c4@bytedance.com>
Date:   Wed, 17 Nov 2021 17:38:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: Re: Re: Re: Re: Re: Re: [PATCH v1] sched/numa: add per-process
 numa_balancing
Content-Language: en-US
To:     Mel Gorman <mgorman@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        linux-api@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20211028153028.GP3891@suse.de>
 <b884ad7d-48d3-fcc8-d199-9e7643552a9a@bytedance.com>
 <20211029083751.GR3891@suse.de>
 <CAMx52ARF1fVH9=YLQMjE=8ckKJ=q3X2-ovtKuQcoTyo564mQnQ@mail.gmail.com>
 <20211109091951.GW3891@suse.de>
 <7de25e1b-e548-b8b5-dda5-6a2e001f3c1a@bytedance.com>
 <20211109121222.GX3891@suse.de>
 <117d5b88-b62b-f50b-32ff-1a9fe35b9e2e@bytedance.com>
 <20211109162647.GY3891@suse.de>
 <08e95d68-7ba9-44d0-da85-41dc244b4c99@bytedance.com>
 <20211117082952.GA3301@suse.de>
From:   Gang Li <ligang.bdlg@bytedance.com>
In-Reply-To: <20211117082952.GA3301@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 11/17/21 4:29 PM, Mel Gorman wrote:
> 
> It's a bit vague but if you wanted to put together the outline, I'd read
> over it. Note that this was all in the context of trying to introduce an

Sorry, maybe I shouldn't propose new feature in this context.

> API like
> 
> Disable/enable per-process numa balancing:
>          prctl(PR_NUMA_BALANCING, PR_SET_NUMA_BALANCING, 0/1);
> 
> i.e. one that controlled both enabling and disabling. You also have
> the option of introducing the NUMAB equivalent of PR_SET_THP_DISABLE --
> an API that is explicitly about disabling *only*.
> 

If those APIs are ok with you, I will send v2 soon.

1. prctl(PR_NUMA_BALANCING, PR_SET_THP_DISABLE);
2. prctl(PR_NUMA_BALANCING, PR_SET_THP_ENABLE);
3. prctl(PR_NUMA_BALANCING, PR_GET_THP);

IIUC, "THP" means "this process" or "the process".


