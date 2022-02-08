Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16220C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 08:43:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351268AbiBHIng (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351415AbiBHInW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:43:22 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6443C03FED5
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:43:08 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id n17so20212934iod.4
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Co3BUFT9beNFmBZeCDmBd4UzULJVNB7vW9mGtuUcPnM=;
        b=ohrEubPZBSY43eIQ5NQCK0B4O7CFbJ/HpKhbez278dzMobVWnfF2oOF3sOrc74B4QQ
         U41143EltG56aXzdjjzZm/GU4cXZGtH83mvjb2qCX+F563MQ3fpmYtycdSu5kzshBVG8
         DqWBAyQynUJHXWlGwhPQOK9if98mUmdwJ8Ir1N0avBzJ6forpYNFs3XqdV58s5cnDsMU
         W4bwCOSsmJHJTrTl6UvTk9gc5iIIE+0JWF2n38A2tLyC+ff1QK0lTH4UBYtz+UVESmVG
         gAIT3JizZEMLq6e110ENj51HMCyTWq0cX5c1QvY5BLrH4EK1/TJW9WkstrnYoO1NG7hG
         geNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Co3BUFT9beNFmBZeCDmBd4UzULJVNB7vW9mGtuUcPnM=;
        b=UQnQZM5CwAJ25pzo2iCCTj9rfaBU3CAeBd8JnUDg19RP9d2vcWqBZZrOFZWlA/cTDr
         aQ+v7kwfIGLFqe2kj/G4LD7h/v3UmEnjUSXTx24oGj3DU5aewfvffhXBCpaJe5akVHm/
         md0ipDU3Z7Vxu/Yxgl4Qmg0Lpo6yXsVH6KsWhsH2/tfKKM5EVnFkFo9d1liypDsHo+Ug
         dOIqaA/+abugCEbI2NSN0Kurgw/s5gwEWN8LNOd+s4u+LY92nOUNTi91/upewmbHWwnN
         Mi7vNIaj2DR0d3DCyrsAQULkNZAcBParV1QLI8L7nSsWr12J5ls8ghJs/gWJ6w4tmRKo
         dKJg==
X-Gm-Message-State: AOAM531V3kwPYXWZp7V5CixSU/X/KhwqHbS2R0e7/TPZWpoGgVtc+hzb
        Q2YO7TXcnx3lBfzdXVGzZMBUgQ==
X-Google-Smtp-Source: ABdhPJzBcDi7EsMql8HPyIUlcRBl/OsFwSyoeS5mkLvsu+udWvl2GtuObFdyWK2J++yBEFuvf+uvKg==
X-Received: by 2002:a05:6638:1501:: with SMTP id b1mr1620304jat.251.1644309787998;
        Tue, 08 Feb 2022 00:43:07 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
        by smtp.gmail.com with ESMTPSA id x7sm3011504ilp.88.2022.02.08.00.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:43:07 -0800 (PST)
Date:   Tue, 8 Feb 2022 01:43:03 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Brian Geffon <bgeffon@google.com>,
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
        Sofia Trinh <sofia.trinh@edi.works>
Subject: Re: [PATCH v7 10/12] mm: multigenerational LRU: thrashing prevention
Message-ID: <YgItF/LcaTC6mpLN@google.com>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <20220208081902.3550911-11-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220208081902.3550911-11-yuzhao@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 08, 2022 at 01:19:00AM -0700, Yu Zhao wrote:
> Add /sys/kernel/mm/lru_gen/min_ttl_ms for thrashing prevention, as
> requested by many desktop users [1].
> 
> When set to value N, it prevents the working set of N milliseconds
> from getting evicted. The OOM killer is triggered if this working set
> can't be kept in memory. Based on the average human detectable lag
> (~100ms), N=1000 usually eliminates intolerable lags due to thrashing.
> Larger values like N=3000 make lags less noticeable at the risk of
> premature OOM kills.

Refactored min_ttl into a separate patch as requested here:
https://lore.kernel.org/linux-mm/YdxSUuDc3OC4pe+f@dhcp22.suse.cz/

<snipped>
