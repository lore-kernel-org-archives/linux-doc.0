Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7336C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 14 Apr 2022 20:53:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234532AbiDNU4G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 14 Apr 2022 16:56:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229922AbiDNU4F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 14 Apr 2022 16:56:05 -0400
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C33D5BBE01
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 13:53:39 -0700 (PDT)
Received: by mail-il1-x131.google.com with SMTP id b5so3891347ile.0
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 13:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=pa6LgTwJKoCyDm1ouvnQaXSj0XUnafk1B7DnI+4ds5E=;
        b=YOLOl3QdEGf0HeVT/Gn6X9mQ4SlNVFfW1B2wWZPnauNvYBjdx92phALVWtyhmtOUiy
         /YckdceI2rkicz7tfSi3vOI586pm3t2iq/JoeQOCht91JmDq4gRXbBayAilFIiGC/9oc
         EyOw2zrv9r2uvnPxtAk+pi2ObkQUJqxEqPdSVks5sFBB/TP7HwujPSZT6cOxUxKxNNh5
         stc1Q2d7THmA3eb9ZUjFDh4AWcUNjj7PGCngcv/EpLd9vhEniIpbuZYm8GxfJNTvD8Wd
         Ka64OYy+PHR3cj3VeNKrERCvIj3UTCgN6YDX5zWT0DYYbnMNw/s1rsBDQnv17C9gsDg/
         ZZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=pa6LgTwJKoCyDm1ouvnQaXSj0XUnafk1B7DnI+4ds5E=;
        b=B+IOIN3ax01a6K7hFJzsWmDy5uXAPrFdpmg25NopvcHRT7fEa4QQrf+bJ0EpQ0vdZr
         oOOtNi3bTVijkxKt2pRE0ve5G57/rACMqmWVS5KmGdeIO9ttBj5Z5ehNmVK5lref8513
         8rGar4dhUc0tWlM1WlsZ+q4wwtIwigQG+4Oe1YJsxq/TiyjViFecP7PBtRc/8dTMBuoD
         JtxgC3kOTYW0PwLG75hZo4Ejd8uz4IRYVCwm8jqM+m/7x6DqsuJ8NngMLR4SmREv2HwN
         ozenr8y0y4wyb37CxQZGzyQj3n/OCG0aQ6b5Ny8eZDn5vCt+Yl52D9itKrliAsKcijaZ
         7QrA==
X-Gm-Message-State: AOAM532sMg44t3sEgGKytMci6fc4SDJERPopEJRalePwdvyEYeVwMEfT
        afk8BPgfayY6+NuO6lBBSVxQ1Q==
X-Google-Smtp-Source: ABdhPJyyDgmPB1FgemJ0ZnKu90qzgVNnbgA76O0ajimJW0cemV0EzujLhLiFOctL5zYuKP5jxsTu8g==
X-Received: by 2002:a92:d18b:0:b0:2c6:675:807c with SMTP id z11-20020a92d18b000000b002c60675807cmr1744365ilz.33.1649969618981;
        Thu, 14 Apr 2022 13:53:38 -0700 (PDT)
Received: from google.com ([2620:15c:183:200:e02:decc:64d3:b1d3])
        by smtp.gmail.com with ESMTPSA id v18-20020a6b5b12000000b00645bd8bd288sm1764416ioh.47.2022.04.14.13.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 13:53:38 -0700 (PDT)
Date:   Thu, 14 Apr 2022 14:53:34 -0600
From:   Yu Zhao <yuzhao@google.com>
To:     Chen Wandun <chenwandun@huawei.com>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>, linux-mm@kvack.org,
        Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, page-reclaim@google.com,
        x86@kernel.org, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        Holger =?iso-8859-1?Q?Hoffst=E4tte?= 
        <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [PATCH v10 06/14] mm: multi-gen LRU: minimal implementation
Message-ID: <YliJzrfXzwwxiCId@google.com>
References: <20220407031525.2368067-1-yuzhao@google.com>
 <20220407031525.2368067-7-yuzhao@google.com>
 <71af92d2-0777-c318-67fb-8f7d52c800bb@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71af92d2-0777-c318-67fb-8f7d52c800bb@huawei.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 14, 2022 at 07:47:54PM +0800, Chen Wandun wrote:
> 
> On 2022/4/7 11:15, Yu Zhao wrote:
> > +static void inc_min_seq(struct lruvec *lruvec)
> > +{
> > +	int type;
> > +	struct lru_gen_struct *lrugen = &lruvec->lrugen;
> > +
> > +	VM_BUG_ON(!seq_is_valid(lruvec));
> > +
> > +	for (type = 0; type < ANON_AND_FILE; type++) {
> > +		if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
> > +			continue;
> I'm confused about relation between aging and LRU list operation.
> 
> In function inc_max_seq,  both min_seq and max_seq will increase，
> the lrugen->lists[] indexed by lru_gen_from_seq(max_seq + 1) may
> be non-empty?

Yes.

> for example,
> before inc_max_seq:
> min_seq == 0, lrugen->lists[0][type][zone]
> max_seq ==3, lrugen->lists[3][type][zone]
> 
> after inc_max_seq:
> min_seq ==1, lrugen->lists[1][type][zone]
> max_seq ==4, lrugen->lists[0][type][zone]
> 
> If lrugen->lists[0][type][zone] is not empty before inc_max_seq and it is
> the most inactive list，however lurgen->lists[0][type][zone] will become
> the most active list after inc_max_seq.

Correct.

> So,  in this place,
> 
> if (get_nr_gens(lruvec, type) != MAX_NR_GENS)
> 	continue;
> 
> should change to
> 
> if (get_nr_gens(lruvec, type) == MAX_NR_GENS)
> 	continue;

No, because max/min_seq will overlap if we do so.

lrugen->lists[max_seq+1] can only be non-empty for anon LRU, for a
couple of reasons:
1. We can't swap at all.
2. Swapping is constrained, e.g., swapfile is full.

Both cases are similar to a producer (the aging) overrunning a
consumer (the eviction). We used to handle them, but I simplified the
code because I don't feel they are worth handling [1].

[1] https://lore.kernel.org/r/CAOUHufbDfwgm8PgCGkhCjbhMbm=fekfjgRR56NL-j+5iUGfVuw@mail.gmail.com/
