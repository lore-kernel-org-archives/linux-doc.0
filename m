Return-Path: <SRS0=6mJA=DA=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B2F2C2D0A8
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 09:57:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C99B123600
	for <linux-doc@archiver.kernel.org>; Wed, 23 Sep 2020 09:57:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="MD1ytn3x"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIWJ5Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Sep 2020 05:57:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726444AbgIWJ5X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Sep 2020 05:57:23 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB81CC0613CE
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 02:57:22 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id u4so846449plr.4
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2020 02:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding;
        bh=ewCx0XKQ1ju6wfyj3Pz3K+HET98S+3k20JpX1ePN7aQ=;
        b=MD1ytn3xzFQiWdnsMkQCBk2hz87iEDkmmNejgl1t5v6oTcnCs3th4hp/TnrsiKBqmR
         9NDXScVlMBTL6o7guiemcfft7wumzcfUV1pppS+K/eAQnVb7mn7ffvhkJvU9TLdFlCEU
         ZpUYlgHJPiw4VLODvjkMA6m9IFhAD2KHrgxTlPqVTxSC6ud2gm6c4K+VjdnPgfZSARPx
         h4XY+rRc7UB05Jiixoj0yiTh6z51VIEtzxfCkFGQm6mp8tgdd3o9hOCoOGhwanyYXnSi
         DL3ACAV+TXF3FKUzSlkoXu/vJ5SKuoPlg911HSRmnKPQALxl/uAJbocVIP8lmu1Fo9EQ
         xJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding;
        bh=ewCx0XKQ1ju6wfyj3Pz3K+HET98S+3k20JpX1ePN7aQ=;
        b=EFEKiFo7AcfyH6EW3mHMlXMKalC30PJZW7pW9alO1EqJCPzITjH+zjzC6/4/wuj2XP
         B8PXv0vGdPb49Cxoh9zAaC35sTf3zXtyrP3rKABTQmHMdhwaeicv7cZIxbQzx6tkP82V
         hUU0WEixm7tMOKJitsS6cvb3JP/s96SbXDF2BX3NQGLtr4OVpPrj62wjr/yOMPfts4d3
         sEj1yjoXwwvCceyIo2LPFN/9c/V7NfqkOxFPS3RHahHZ1/2vF67U1YaDxT0x3STi0yqh
         uSaOgOHjPuQInjrazyqwg0r462mT+e/zvQCcO++9AbQq3jGn4FRtW/fHsUeJRx5hcZyq
         sQ3w==
X-Gm-Message-State: AOAM533fB1mPZoU0Trx+aOGMvCOxwhky2CEFmTWcKaWJYXT5yzuEZYyO
        IM5la20VF+UnPCLtDaswBfkCDg==
X-Google-Smtp-Source: ABdhPJwFBoRQCMl8tXH9096UvZruQsORHyb2yHiM470xg1qcA1IvENGbCebmXFoi0b1E+FpVI7pgsA==
X-Received: by 2002:a17:90a:fb52:: with SMTP id iq18mr7463985pjb.207.1600855042276;
        Wed, 23 Sep 2020 02:57:22 -0700 (PDT)
Received: from [10.86.118.224] ([103.136.221.71])
        by smtp.gmail.com with ESMTPSA id n125sm13588449pfn.185.2020.09.23.02.57.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 02:57:21 -0700 (PDT)
Subject: Re: [Phishing Risk] [External] Re: [PATCH] cgroup: Add cgroupstats
 numbers to cgroup.stat file
To:     Tejun Heo <tj@kernel.org>
Cc:     lizefan@huawei.com, hannes@cmpxchg.org, corbet@lwn.net,
        cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, luodaowen.backend@bytedance.com,
        songmuchun@bytedance.com
References: <20200915155349.15181-1-zhouchengming@bytedance.com>
 <20200921145009.GD4268@mtj.duckdns.org>
From:   Chengming Zhou <zhouchengming@bytedance.com>
Message-ID: <b2fda7f4-e7d1-9e2c-6de6-c1a8ead23568@bytedance.com>
Date:   Wed, 23 Sep 2020 17:57:16 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200921145009.GD4268@mtj.duckdns.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2020/9/21 下午10:50, Tejun Heo 写道:
> Hello,
>
> On Tue, Sep 15, 2020 at 11:53:49PM +0800, Chengming Zhou wrote:
>> In the cgroup v1, we can use netlink interface to get cgroupstats for
>> a cgroup. But it has been excluded from cgroup v2 interface intentionally
>> due to the duplication and inconsistencies with other statistics.
>> To make container monitor tool like "cadvisor" continue to work, we add
>> these cgroupstats numbers to the cgroup.stat file, and change the
>> admin-guide doc accordingly.
> So, we can't add O(nr_threads) operations to cgroup.stat reads. There are
> two ways forward that I can see.
>
> * Investigate how these counters are being used. If it's used for congestion
>   detection, pressure metrics are likely better indicators to use anyway. If
>   the usage frequency is low enough, maybe querying from userspace should
>   work?
>
> * If the need for these per-cgroup task state counters is really
>   justifiable, the counters should be maintained from scheduling event
>   directly and summed up using rstat like other statistics.
>
> Thanks.
>
Well, I see. These counters are being used for load monitor and debug,
pressure metrics

is good for congestion detection, but more details needed for debug when
problem happened.

And I noticed PSI has maintained these taskstats from scheduler event
already. I think we can

just export these counters gracefully.

Thanks.

