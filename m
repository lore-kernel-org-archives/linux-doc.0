Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11C9C4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 11:26:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 861E820776
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 11:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="JosLptL0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgJEL0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 07:26:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726002AbgJEL0D (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 07:26:03 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09D1C0613AB
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 04:25:57 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id b12so8855347edz.11
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 04:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dPmPVQgoIn6sm4yJEL6Gt5bZe3D8XUPMyhu5lemsH1w=;
        b=JosLptL0NIYq+WTt2D0GcnMU8aGMTGaKjauLfSJh/SVg8Fre3RjwOL+f/2Qg5zcYBt
         yycq3AmSW1jW+/cKoAFeJBtiQ2pPJYKD7TsXrW+AvAeW/VThIIijdDj3eD7cuBZOKPpE
         FEeXT4yrqri3+HgiZxDuKbeQZwMpctrogyfI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dPmPVQgoIn6sm4yJEL6Gt5bZe3D8XUPMyhu5lemsH1w=;
        b=gYDDboPEHUSUmpLoXr5tDInUCT3eogn8BDvdXd17hWLWOfjYMR0rFM4O2cYU4LQHPJ
         w/JsnYjN1+zP5/h8j0xRu+l1NGjCYhbtKkqtGK5wl5b4sRACVZxnX6CkqgO0IwOjyX2/
         0QQ3BQ13+RuwKlmFu+1FNrOWzo6oIRYYS0ysI8Jn5Bwsm/bhZvgM4KEkoOkLSjxpE3GA
         ey46uKB4vf+20JpMSyrlQS5IV2KGCvqgID7uAw8MxAvpx0BxLJ3DSvbhE+oVrERaTK3I
         HTJ9o5/vI2R1MUh6rB9rcg7h7Et4mCniNDodgNWtOKhxkNtBjW/J7onjsFsd6mrbuP2U
         WCdw==
X-Gm-Message-State: AOAM530KqRY4rPLu+azsNmTEaPXWNFM5tQWxl3LgpgR1oJF0diGailGg
        j1oFQqbCwE2AiNkJVVbypaqpcw==
X-Google-Smtp-Source: ABdhPJwEUfB3faVj/+aqL4T2iZayUJerxEobuZPlfEhjF4pUatcxjdChp6vol2nisp1EgAYCOwThVw==
X-Received: by 2002:a50:9a86:: with SMTP id p6mr16361020edb.96.1601897156284;
        Mon, 05 Oct 2020 04:25:56 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:b1f1])
        by smtp.gmail.com with ESMTPSA id p17sm8712908edw.10.2020.10.05.04.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 04:25:55 -0700 (PDT)
Date:   Mon, 5 Oct 2020 12:25:55 +0100
From:   Chris Down <chris@chrisdown.name>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Li Zefan <lizefan@huawei.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Luigi Semenzato <semenzato@google.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>, cgroups@vger.kernel.org,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC v2] Opportunistic memory reclaim
Message-ID: <20201005112555.GA108347@chrisdown.name>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201005081313.732745-1-andrea.righi@canonical.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Andrea Righi writes:
>This feature has been successfully used to improve hibernation time of
>cloud computing instances.
>
>Certain cloud providers allow to run "spot instances": low-priority
>instances that run when there are spare resources available and can be
>stopped at any time to prioritize other more privileged instances [2].
>
>Hibernation can be used to stop these low-priority instances nicely,
>rather than losing state when the instance is shut down. Being able to
>quickly stop low-priority instances can be critical to provide a better
>quality of service in the overall cloud infrastructure [1].
>
>The main bottleneck of hibernation is represented by the I/O generated
>to write all the main memory (hibernation image) to a persistent
>storage.
>
>Opportunistic memory reclaimed can be used to reduce the size of the
>hibernation image in advance, for example if the system is idle for a
>certain amount of time, so if an hibernation request happens, the kernel
>has already saved most of the memory to the swap device (caches have
>been dropped, etc.) and hibernation can complete quickly.

Hmm, why does this need to be implemented in kernelspace? We already have 
userspace shrinkers using memory pressure information as part of PID control 
already (eg. senpai). Using memory.high and pressure information looks a lot 
easier to reason about than having to choose an absolute number ahead of time 
and hoping it works.
