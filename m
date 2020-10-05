Return-Path: <SRS0=vG9z=DM=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11A4EC4363A
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 14:46:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D61B02085B
	for <linux-doc@archiver.kernel.org>; Mon,  5 Oct 2020 14:46:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.b="hl2motqv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgJEOq2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:46:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726841AbgJEOqP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Oct 2020 10:46:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9380AC0613A7
        for <linux-doc@vger.kernel.org>; Mon,  5 Oct 2020 07:46:14 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id g4so9662596edk.0
        for <linux-doc@vger.kernel.org>; Mon, 05 Oct 2020 07:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=bJDWLFQK3NHbczue04Ad/oGIga5mw5RnC9F1EX3+XdE=;
        b=hl2motqvUtv+mvTksLda5r+AFkPsIl17oAkAoCpovuZwVAOmI4uF6k4X0hrbeu5UIV
         4L63H25KQUKF8MNUkLWt/WneZgSx81pfLMMNxbhsI9ViwK7Q3zswPYsHmCMJd7yWREPt
         5ZNnY8RT6kVH5ja7Img8nnNnLSz+y+pOeFYeo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bJDWLFQK3NHbczue04Ad/oGIga5mw5RnC9F1EX3+XdE=;
        b=j1eqYE1yDbPbMGPydPBy4rySHYaK/8b8tnkwvMkvNkHick34PVl1O9pdAo//Me5C5t
         jfdw39KUkjzvO0NSdh0oM5r+X+63vOwWCTx8x5GoOedXOggdtQTvLAaSLPgDYrkeopFH
         xD0p5tplp4fo+dN9G5yKSsyj/eLxJgDy8lzy5tmJ4dB9C6cMo5BUB/FQAw1VA6DukcCc
         GNSXNAVSbK9ErNlNDaJipaMh7E7xrNQLtipwC96vLqYwnseT1W33egTqxQOPP0WuLlle
         iObsaHnR0iVX2t/lHDppYIWLpDD42dYRrSd1oMDTdhjhU21/2kAmE/xmT03fDws3y2JA
         Jk9g==
X-Gm-Message-State: AOAM531mPg/lv3g1EQOzn4jty4foLdFRq0ROAh+4UkW2RecvZqh/l7/O
        vJmMLzUdEAMEHjwBTRYL+qjO/w==
X-Google-Smtp-Source: ABdhPJx3qUGwmmpBOZFS45fQE04+dVbMCBwt75MdVDrLzDmAkcFM+DYTDIcRGfMI2aS/KZIlZn93kw==
X-Received: by 2002:aa7:dd49:: with SMTP id o9mr16283240edw.331.1601909173219;
        Mon, 05 Oct 2020 07:46:13 -0700 (PDT)
Received: from localhost ([2620:10d:c093:400::5:b1f1])
        by smtp.gmail.com with ESMTPSA id a5sm36220edl.6.2020.10.05.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 07:46:12 -0700 (PDT)
Date:   Mon, 5 Oct 2020 15:46:12 +0100
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
Message-ID: <20201005144612.GB108347@chrisdown.name>
References: <20201005081313.732745-1-andrea.righi@canonical.com>
 <20201005112555.GA108347@chrisdown.name>
 <20201005135130.GA850459@xps-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20201005135130.GA850459@xps-13-7390>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Andrea Righi writes:
>senpai is focused at estimating the ideal memory requirements without
>affecting performance. And this covers the use case about reducing
>memory footprint.
>
>In my specific use-case (hibernation) I would let the system use as much
>memory as possible if it's doing any activity (reclaiming memory only
>when the kernel decides that it needs to reclaim memory) and apply a
>more aggressive memory reclaiming policy when the system is mostly idle.

 From this description, I don't see any reason why it needs to be implemented in 
kernel space. All of that information is available to userspace, and all of the 
knobs are there.

As it is I'm afraid of the "only when the system is mostly idle" comment, 
because it's usually after such periods that applications need to do large 
retrievals, and now they're going to be in slowpath (eg. periodic jobs).

Such tradeoffs for a specific situation might be fine in userspace as a 
distribution maintainer, but codifying them in the kernel seems premature to 
me, especially for a knob which we will have to maintain forever onwards.

>I could probably implement this behavior adjusting memory.high
>dynamically, like senpai, but I'm worried about potential sudden large
>allocations that may require to respond faster at increasing
>memory.high. I think the user-space triggered memory reclaim approach is
>a safer solution from this perspective.

Have you seen Shakeel's recent "per-memcg reclaim interface" patches? I suspect 
they may help you there.
