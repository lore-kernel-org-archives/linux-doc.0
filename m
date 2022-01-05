Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCBF9C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jan 2022 21:06:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244313AbiAEVGa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jan 2022 16:06:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbiAEVG3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jan 2022 16:06:29 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0D26C061201
        for <linux-doc@vger.kernel.org>; Wed,  5 Jan 2022 13:06:29 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id h23so626585iol.11
        for <linux-doc@vger.kernel.org>; Wed, 05 Jan 2022 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EolGbdgsNcnhwpXhAEL04icCDLJTUPTjvI9j2SgExNc=;
        b=hjEtr3Wm65nDdvFeBKPgdi6ecGQx2AMgYvAL1GIG2JFvfaR8bvZfXlr+3C4UNqtgCY
         tGt3ZR+DCES7x1oweqv+V/SjgIyUD3XBY51D+qf75Jsp5ToIn5bKz+rb8akGq8GGCtM1
         7/s4sRtkED0EZ1tg3lSmLccqe9B+JYGumPgJnNSSlCUirczEknhsSFuBlBTHRsdJhneo
         4UgUt5FMJDlj2rRm5gQVs814iwNGWTfWnfpoKGZfgk1DcIsnwyTH9WP1mZbR4IuWEzAR
         uO9IasOlN41P1Yuaf1EzsVl1R0piiDZ99wNbzK7chG/GzLlkDdVEprhucf9ThCq5c326
         Pj1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EolGbdgsNcnhwpXhAEL04icCDLJTUPTjvI9j2SgExNc=;
        b=sff+Q+hDXDvd4u1gD+QdP0rtul4/E+ZNt7tG2f04Vt9gYREhxT+3UEI9LffF4F2GNb
         gAHk1HQ2KNqeDzalHGDuhcvXgW81R5kcvewOQAAAnGecw8IUnlvJ8nw4DZyTsRV+3Obd
         EOJRvjuw6kxv0aWp+tA5OPEHpz6QWt31BojAImdFIYTT/VYnkM4n8oDedHQHQMVxaYUS
         KK9626yzcl4ROYJ2EYtWYNulH29zGDqdZ/fV98eZkk6CIm7logCvlHKXXCYO0eTvwdaR
         AhJjsoeWRUq9VpwzzarjHYuDgjio1jT2A0GzoX/upV6G0LV4jmMH4PaxfJ47WJBA2Xp2
         J2tQ==
X-Gm-Message-State: AOAM530IGGFv79ncr1YAmEmmpSPpR6sXOMGroEX6CurU+kIX4cax9suf
        hSHoOGfEFEu2JJL2R152yel6GA==
X-Google-Smtp-Source: ABdhPJzylreqnU7T8VfsIRP9gdym6+PSAMgz3s5D6kp+H/7MxNiBwyiVi2f3QxuAuHm3sb7CQnNMDg==
X-Received: by 2002:a02:a40a:: with SMTP id c10mr23211642jal.18.1641416788894;
        Wed, 05 Jan 2022 13:06:28 -0800 (PST)
Received: from google.com ([2620:15c:183:200:5b02:855e:267d:5b0])
        by smtp.gmail.com with ESMTPSA id f2sm22517868iow.33.2022.01.05.13.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 13:06:28 -0800 (PST)
Date:   Wed, 5 Jan 2022 14:06:24 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     SeongJae Park <sj@kernel.org>, Borislav Petkov <bp@alien8.de>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <YdYIUAC0gopuy8r/@google.com>
References: <YdV4k1+zEbtzmUkK@google.com>
 <20220105112527.23399-1-sj@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220105112527.23399-1-sj@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jan 05, 2022 at 11:25:27AM +0000, SeongJae Park wrote:
> On Wed, 5 Jan 2022 03:53:07 -0700 Yu Zhao <yuzhao@google.com> wrote:
> 
> > On Wed, Jan 05, 2022 at 08:55:34AM +0000, SeongJae Park wrote:
> > > Hi Yu,
> > > 
> > > On Tue, 4 Jan 2022 13:22:19 -0700 Yu Zhao <yuzhao@google.com> wrote:
> [...]
> > > I think similar works are already available out of the box with the latest
> > > mainline tree, though it might be suboptimal in some cases.
> > 
> > Ok, I will sound harsh because I hate it when people challenge facts
> > while having no idea what they are talking about.
> > 
> > Our jobs are help the leadership make best decisions by providing them
> > with facts, not feeding them crap.
> 
> I was using the word "similar", to represent this is only for a rough concept
> level similarity, rather than detailed facts.  But, seems it was not enough,
> sorry.  Anyway, I will not talk more and thus disturb you having the important
> discussion with leaders here, as you are asking.

First of all, I want to apologize.

I detested what I read, and I still don't like "a rough concept level
similarity" sitting next to a factual statement. But as Borislav has
reminded me, my tone did cross the line. I should have had used an
objective approach to express my (very) different views.

I hope that's all water under the bridge now. And I do plan to carry
on with what I should have had done.
