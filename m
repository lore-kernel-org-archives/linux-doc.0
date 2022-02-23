Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00A1C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 23 Feb 2022 07:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238574AbiBWHLV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 02:11:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236537AbiBWHLU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 02:11:20 -0500
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FC203C48C
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 23:10:51 -0800 (PST)
Received: by mail-pf1-x42f.google.com with SMTP id g1so14508956pfv.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Feb 2022 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ajou.ac.kr; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=UnYuBTBC02IDGurVKWqCwwD4Ax807V8FS59cBIjeBnY=;
        b=At6K6BI+UF/OMrPo98IMklq3SWpmsBJNoRWsWKAu5Jpp+/UP2hOMGp8L9AglQfH4Qm
         tSmQg6OZ1o0LN9fYsMtjh3qe9ZrbGCO7t3ga00b1brLIyiMttVxjjsMVYMivbV9HccSV
         OtbL25h8lgVttNJPI1kHi9lvvf8EAb2b6nPT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UnYuBTBC02IDGurVKWqCwwD4Ax807V8FS59cBIjeBnY=;
        b=dmPYwMXafuS23oDDrxotzIEDLlAZ3QOgeglH+O2NS8fPPPBsa3GFQswiYHsT8NDK8J
         LbbvGOf7Ij5r4DDG+KgloUd+lO5nrs/WFFKkxWciK7FWpBFuwoGMucutgmdJsWpUqZqc
         Oi+n2L0/GIK7zZvmB345RNAYucHNJoaEoRnbS0hJLEOW2UWfJp60k6MZHj0/NpEbw2oT
         dFDPfkz+Jb1+k6nL0X21LjrH1i2fDxOj8+pN/Ge6YYLc1eHDO7ReAieaMxkgUQrdnWih
         Dd2RJBO52sP5Ivx/fHrq91uqDcWnns6q4YwWEtS/oCdTLOqoSbtraQT8w7bgOiOOr0Xk
         nYeg==
X-Gm-Message-State: AOAM532AYebErcT5UgmE1mqzAvF2wVvzo3IZLZv4oeuovh2p6dTw2i0a
        l6mQAd9/iwznbzz914k0ALu2AA==
X-Google-Smtp-Source: ABdhPJwS4HzcM9ielkNYjkNr8cWrE1EwP3XXS77aCdUlc2GDm25FusYvMuDRgHDodOEPN88+cxH0dQ==
X-Received: by 2002:a63:e604:0:b0:373:8aca:846e with SMTP id g4-20020a63e604000000b003738aca846emr22474459pgh.406.1645600250601;
        Tue, 22 Feb 2022 23:10:50 -0800 (PST)
Received: from swarm08 ([210.107.197.32])
        by smtp.gmail.com with ESMTPSA id g1sm18107670pfu.32.2022.02.22.23.10.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Feb 2022 23:10:50 -0800 (PST)
Date:   Wed, 23 Feb 2022 16:10:44 +0900
From:   Jonghyeon Kim <tome01@ajou.ac.kr>
To:     SeongJae Park <sj@kernel.org>
Cc:     Jonghyeon Kim <tome01@ajou.ac.kr>, Jonathan.Cameron@Huawei.com,
        amit@kernel.org, benh@kernel.crashing.org, corbet@lwn.net,
        david@redhat.com, dwmw@amazon.com, elver@google.com,
        foersleo@amazon.de, gthelen@google.com, markubo@amazon.de,
        rientjes@google.com, shakeelb@google.com, shuah@kernel.org,
        linux-damon@amazon.com, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 1/3] mm/damon: Rebase damos watermarks for NUMA
 systems
Message-ID: <20220223071044.GA6270@swarm08>
References: <20220218102611.31895-2-tome01@ajou.ac.kr>
 <20220222095317.7911-1-sj@kernel.org>
 <20220223051056.GA3502@swarm08>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223051056.GA3502@swarm08>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 23, 2022 at 02:10:56PM +0900, Jonghyeon Kim wrote:
> On Tue, Feb 22, 2022 at 09:53:17AM +0000, SeongJae Park wrote:
> > Hello Jonghyeon,
> > 
> 
> Hello SeongJae,
> 
> > On Fri, 18 Feb 2022 19:26:09 +0900 Jonghyeon Kim <tome01@ajou.ac.kr> wrote:
> > 
> > > For NUMA systems, there is a need to allow damos to select watermark
> > > options for monitoring each NUMA node or whole system free memory. Even
> > > if we do not use NUMA, since the default NUMA node number is 0, we can
> > > monitor the whole system memory without any configuration.
> > 
> > Some users using NUMA machines but don't do NUMA-specific memory allocations
> > and therefore assume memory free rate in each NUMA node will be similar might
> > want to monitor only global free memory ratio, to limit number of kdamonds for
> > reducing CPU overhead.  In the case, this patch would make them monitor only
> > the first node.
> 
> I think that the purpose of DAMON_RECALIM is proactively reclaiming memory
> before waking up kswapd. But I missed that case you mentioned. In that case,
> they might not want to monitor each NUMA node. I agree with this.
> 
> > 
> > How about leaving DAMOS_WMARK_FREE_MEM_RATE to work as is, and adding a new
> > metric type, say, DAMOS_WMARK_NODE_FREE_MEM_RATE?
> > 
> 
> Yes, it looks good to me.
> 
> 
> Thanks,
> Jonghyeon
