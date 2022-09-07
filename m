Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F743ECAAD5
	for <linux-doc@archiver.kernel.org>; Wed,  7 Sep 2022 01:55:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiIGBzQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Sep 2022 21:55:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229502AbiIGBzP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Sep 2022 21:55:15 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3607F10547
        for <linux-doc@vger.kernel.org>; Tue,  6 Sep 2022 18:55:14 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id p1-20020a17090a2d8100b0020040a3f75eso8331036pjd.4
        for <linux-doc@vger.kernel.org>; Tue, 06 Sep 2022 18:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=xyD4Pb2btMZ+ktk/ltP1p8JWsLx2B7oKf49IB7a3hmw=;
        b=s3UYPk0Ct+f4DGBqXw94s4gfbvQOJzYetBO/7uEBLrzkQYgmjrZFhZYfFuuFVSg4RJ
         4m242WFFh3Rh9XzSI4nfxcVJsRwB+1dnA9Qn8rjnyUb6L/6oikLS1XP/QoSrMGIgis/j
         ZqHXIiLsjL+XYncZn0mcNZjCsxMrdMH2G8B1oiPBRtPQBEDzmGSnKfr8RVISEnSq/MGb
         I51ZIKIWki5K+9nENzI3tP0HMLtrsjlkRDqb01/9P1XEdTBLpytUoIwOVVd1rSrmimzA
         tkmpu+guejoPlmp2WTMCZSA8o5Ypk51i0GiSJRl9VC4n1fD2MRP4cyewoBbvTe8aDEf9
         38YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=xyD4Pb2btMZ+ktk/ltP1p8JWsLx2B7oKf49IB7a3hmw=;
        b=QpWQDkxkNlhe1eV/FdwXYnXe3jYbniEubp6YJxcbe713ze3fFeCbsj9HerUkqsCc5W
         3cv5IQvXQc61bTMTtO2l/kq3i7geJU5oiAphDgQiPSfCZEDtV5dj8oqm2ecvlE7d8bZh
         5FJFtpoC5D8WbjUO0QokxiETarn1MW7qHynbBP6Iri+z77cbxpoV9sdOsxBk7cxmrmbP
         knamV7se6Mu8sdR4TZkXEzkrY9SC1i67xs7xxYsI1HcjXsC7OeE22fqlQNgLRJH21Z59
         gnvuGgVQ32N3PqZSTupwPC7FGIRPypsyTMIGHekzP7vP0IwRU5IosVfoJbAlR/W4Kjnx
         BCDw==
X-Gm-Message-State: ACgBeo0U9n4fdNxwoCP8+EKEHSOrvLo3g4tEMfPEN+rkw1U2hgPhs8Ei
        +2dTZxeVtUm4WsTY/m0Ae8l7mc0ZH8W+iw==
X-Google-Smtp-Source: AA6agR6U6Soqe91ZpUakEjIcaAAttNetAgOL4T8q91JW56/DmqIf1u7BQWolTUcIGF0pC4zlgE3Frg==
X-Received: by 2002:a17:902:e545:b0:174:d8df:7303 with SMTP id n5-20020a170902e54500b00174d8df7303mr1584088plf.66.1662515713778;
        Tue, 06 Sep 2022 18:55:13 -0700 (PDT)
Received: from [10.254.68.181] ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id e7-20020a63db07000000b0041a67913d5bsm9291330pgg.71.2022.09.06.18.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 18:55:13 -0700 (PDT)
Message-ID: <94fdf793-a568-704e-b6f8-093b8b7fe24a@bytedance.com>
Date:   Wed, 7 Sep 2022 09:55:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 00/10] sched/psi: some optimizations and extensions
Content-Language: en-US
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     hannes@cmpxchg.org, tj@kernel.org, surenb@google.com,
        mkoutny@suse.com, mingo@redhat.com, gregkh@linuxfoundation.org,
        corbet@lwn.net, cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, songmuchun@bytedance.com
References: <20220825164111.29534-1-zhouchengming@bytedance.com>
 <be071d5a-ff2d-d06e-2f89-f2ca247dd19e@bytedance.com>
 <YxdcfX4Ss/9k8qA9@hirez.programming.kicks-ass.net>
From:   Chengming Zhou <zhouchengming@bytedance.com>
In-Reply-To: <YxdcfX4Ss/9k8qA9@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2022/9/6 22:43, Peter Zijlstra wrote:
> On Tue, Sep 06, 2022 at 09:13:27PM +0800, Chengming Zhou wrote:
> 
> Ah, I see Johannes has acked them all, I missed that.
> 
>>> Chengming Zhou (9):
>>>   sched/psi: fix periodic aggregation shut off
>>>   sched/psi: don't create cgroup PSI files when psi_disabled
>>>   sched/psi: save percpu memory when !psi_cgroups_enabled
>>>   sched/psi: move private helpers to sched/stats.h
>>>   sched/psi: optimize task switch inside shared cgroups again
>>>   sched/psi: add PSI_IRQ to track IRQ/SOFTIRQ pressure
>>>   sched/psi: consolidate cgroup_psi()
>>>   sched/psi: cache parent psi_group to speed up groups iterate
>>>   sched/psi: per-cgroup PSI accounting disable/re-enable interface
>>>
>>> Johannes Weiner (1):
>>>   sched/psi: remove NR_ONCPU task accounting
> 
> For future reference:
> 
>   https://www.kernel.org/doc/html/latest/process/maintainer-tip.html
> 
> Note all patches violate 1.2.2 for not starting the patch description
> with a uppercase letter. I'll go manually fix up this time.

Sorry about that, thanks for the reference and your manual fix up!

