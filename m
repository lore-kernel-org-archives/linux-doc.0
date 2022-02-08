Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4FD9C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  8 Feb 2022 08:44:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351197AbiBHIo4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 03:44:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351253AbiBHIoZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 03:44:25 -0500
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com [IPv6:2607:f8b0:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52CD8C03FEC3
        for <linux-doc@vger.kernel.org>; Tue,  8 Feb 2022 00:44:22 -0800 (PST)
Received: by mail-il1-x133.google.com with SMTP id f13so1107494ilq.5
        for <linux-doc@vger.kernel.org>; Tue, 08 Feb 2022 00:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Lker2+Uo8UhianHSMBGKA4jgSJ53TnoXXawYMAybIpQ=;
        b=inNoanZN2Rt09wIpOdvGFFnihAY0clMiz0/jcty75GOYZgZPC4gcvH9kBYSKBfD88y
         s+DnKZK8oJ9Hlymo5Ef8YFhQ7WZ1LjWUhS2h+yWzgHW6K5YFjDAlOTSSWa/lCRJdXFk+
         obvXcQucOJwyDODiBADQfccHr1CHabOzg8XD2akiAv86jz2POoL9eVCdIOqmWQleCmWg
         CKImx2dy4UvYJe7KvmME9K12wSZZtvsOowZoGN09g2iR+rZL9mgl5C7o1ULHuU3hwxPe
         v3gVcatYK6Iavvn11SM34ScpS8PAwNE5kyv7lHpgPZMn3ILADORD3ot6QuxchDDst/SJ
         SG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Lker2+Uo8UhianHSMBGKA4jgSJ53TnoXXawYMAybIpQ=;
        b=2PRlaiDWO9plhsC2Bvw5yQhi813sykPgXZ4Hme8molmE9JAa3hTmjP8sGfbMO8/wj/
         cJj/1BKutSDufJIfoJFkbzdGLI7wRlysKqstz63tF15MjR3IlGJwYJirh/xvTrawvGrT
         JNClAb6/JfZL+YN1u7/OrPN3ic1mFHbYolT7hIFK4IogVZl9Xt+y4MABPrIhabOGXTzZ
         Vy/Ivpr1lrXHdOnUt5KvlbUaTTmg+HhkVNaV/G6aw/SeNbP28FMVetFiNWtvAZWPeKBg
         U/8sm2iI2j7wrn3uzUJcECCEiOUF1nSOOJIohaqpwjalaUnpfpz8OT8/aqX/xfkE+1ir
         RnPA==
X-Gm-Message-State: AOAM531bQAJVbKysLLJ+AZuhNg9hKIfVdoUQD50mnQJQjZtTMMd9zGuy
        vJ7hI5FuI6xaiMr/pw1siZRXpA==
X-Google-Smtp-Source: ABdhPJzy4PN1v9Ym56RqiLYKvfIGSfRqZ6U0AFJo4Ax8JsSXHMSyO+uLmPwv+PMfAgagxvT0qsNs+g==
X-Received: by 2002:a92:ca0c:: with SMTP id j12mr1599235ils.176.1644309861600;
        Tue, 08 Feb 2022 00:44:21 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5f31:19c3:21f5:7300])
        by smtp.gmail.com with ESMTPSA id c13sm3355533ilr.55.2022.02.08.00.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 00:44:21 -0800 (PST)
Date:   Tue, 8 Feb 2022 01:44:16 -0700
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
Subject: Re: [PATCH v7 12/12] mm: multigenerational LRU: documentation
Message-ID: <YgItYKpxJRRQj3RD@google.com>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <20220208081902.3550911-13-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208081902.3550911-13-yuzhao@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 08, 2022 at 01:19:02AM -0700, Yu Zhao wrote:
> Add a design doc and an admin guide.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> Acked-by: Brian Geffon <bgeffon@google.com>
> Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> Acked-by: Steven Barrett <steven@liquorix.net>
> Acked-by: Suleiman Souhlal <suleiman@google.com>
> Tested-by: Daniel Byrne <djbyrne@mtu.edu>
> Tested-by: Donald Carr <d@chaos-reins.com>
> Tested-by: Holger Hoffstätte <holger@applied-asynchrony.com>
> Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
> Tested-by: Sofia Trinh <sofia.trinh@edi.works>
> ---
>  Documentation/admin-guide/mm/index.rst        |   1 +
>  Documentation/admin-guide/mm/multigen_lru.rst | 121 ++++++++++++++
>  Documentation/vm/index.rst                    |   1 +
>  Documentation/vm/multigen_lru.rst             | 152 ++++++++++++++++++
>  4 files changed, 275 insertions(+)
>  create mode 100644 Documentation/admin-guide/mm/multigen_lru.rst
>  create mode 100644 Documentation/vm/multigen_lru.rst

Refactored the doc into a separate patch as requested here:
https://lore.kernel.org/linux-mm/Yd73pDkMOMVHhXzu@kernel.org/

Reworked the doc as requested here:
https://lore.kernel.org/linux-mm/YdwKB3SfF7hkB9Xv@kernel.org/

<snipped>
