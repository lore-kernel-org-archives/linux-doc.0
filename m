Return-Path: <SRS0=tMRj=B4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FDD6C433E1
	for <linux-doc@archiver.kernel.org>; Tue, 18 Aug 2020 09:27:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB02820639
	for <linux-doc@archiver.kernel.org>; Tue, 18 Aug 2020 09:27:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="aXZCsxwp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726466AbgHRJ1t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Aug 2020 05:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726435AbgHRJ1k (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Aug 2020 05:27:40 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 662EEC061344
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 02:27:40 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id i20so3383734qkk.8
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=l1uRMktfRV5crgPVmS/xcdDcOHzetxlDlwwdgtJx5JA=;
        b=aXZCsxwprTxASQu2DNMwoUtCZ6t+hAn/5sw5abMV4tonMk0SgnkIntg7cbyYTZWblV
         6aEwV7fV6oFYpxM4V71CUTNFU+ySLfcQw6a2IuXnzfyCU985kgho/mfmw+W4V4KlsDoV
         HACh+ZAEE3ZN9fLfhWnARV3NpdrsfiULbLeio=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=l1uRMktfRV5crgPVmS/xcdDcOHzetxlDlwwdgtJx5JA=;
        b=Avg0+evkKNYNumrR2wOAAFpUcJHAH8Uw2zrk7ApbS45mdAayg2+B1J+YCJhYeSTttU
         w05nzkpcsLD+CdM688TJ3nMRzO0ZClqy3QliG6UasJX9OvQG0MYxdAeQxnC4D3daGnKv
         SIAPRrlc3bkCM4y/7Bb3xqa5HGfxGdZLnL1q2AomY9y4vK7epMsnXtmjTjYpD9lGxSbt
         VviJVS2EL/qxBDPYhvKviGOnlDAVn1aojk1+x3X2bXVtA1sgHZHHo8Zc0Z2tHB8Hn7Ux
         4C36PCi1uCFc022xT72c0fEzr1xTnzE818lQHV1fkbva6FkYBLCcUC66zVjLZzbAbiG8
         k9oQ==
X-Gm-Message-State: AOAM53089Xm0TG0KG8Wv6TxEafoNs+9EBZYnPBZVipBIkg7/mM2JunZi
        lVlrCIKTcI7PHB7f+6ZaK7LJPg==
X-Google-Smtp-Source: ABdhPJyjRbj82qo14ynmuKZgINBcTQu1SV2ro8jRAdmhpvPscAYrmOepaS8i23X7ke5WKJ6U1bhfGg==
X-Received: by 2002:a37:a104:: with SMTP id k4mr16018682qke.384.1597742859405;
        Tue, 18 Aug 2020 02:27:39 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:179c])
        by smtp.gmail.com with ESMTPSA id d16sm19784856qkk.106.2020.08.18.02.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2020 02:27:39 -0700 (PDT)
Date:   Tue, 18 Aug 2020 10:27:37 +0100
From:   Chris Down <chris@chrisdown.name>
To:     peterz@infradead.org
Cc:     Waiman Long <longman@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [RFC PATCH 0/8] memcg: Enable fine-grained per process memory
 control
Message-ID: <20200818092737.GA148695@chrisdown.name>
References: <20200817140831.30260-1-longman@redhat.com>
 <20200818091453.GL2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20200818091453.GL2674@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.14.6 (2020-07-11)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

peterz@infradead.org writes:
>On Mon, Aug 17, 2020 at 10:08:23AM -0400, Waiman Long wrote:
>> Memory controller can be used to control and limit the amount of
>> physical memory used by a task. When a limit is set in "memory.high" in
>> a v2 non-root memory cgroup, the memory controller will try to reclaim
>> memory if the limit has been exceeded. Normally, that will be enough
>> to keep the physical memory consumption of tasks in the memory cgroup
>> to be around or below the "memory.high" limit.
>>
>> Sometimes, memory reclaim may not be able to recover memory in a rate
>> that can catch up to the physical memory allocation rate. In this case,
>> the physical memory consumption will keep on increasing.
>
>Then slow down the allocator? That's what we do for dirty pages too, we
>slow down the dirtier when we run against the limits.

We already do that since v5.4. I'm wondering whether Waiman's customer is just 
running with a too-old kernel without 0e4b01df865 ("mm, memcg: throttle 
allocators when failing reclaim over memory.high") backported.
