Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9842C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  3 Mar 2022 06:47:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229771AbiCCGrw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Mar 2022 01:47:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbiCCGrv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Mar 2022 01:47:51 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F1E2CF
        for <linux-doc@vger.kernel.org>; Wed,  2 Mar 2022 22:47:07 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id r7so4727426iot.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Mar 2022 22:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=awOJT5ml/p/iN0KxyefzrE4LGX6n2gmPWGzJTQAAet8=;
        b=Z7xCW4mND+wy80Una/SWNauxNVOG2MeRjOVmgRuceJWQNh1cSBnbSY3ys7FM+GkcpH
         11ndhfuRDKCQvGwzM9qQtoV6GowdOm/Shi2alLhQeRbCGg36z9Z+LIpieBfrxXLSH1ne
         SlfSmB2AX9wExRzUSCvoXbPT6zI0aRsgrrrY5Kn0mcQUIJdy0s4K6+XBLVVCFPWIw6ON
         jmEwC11nVn9P5gw76AQOHv7yGrNIm5dy6Rz5k4M3A/YY2YQclDj1ZNSpPRZ7a0Sp239m
         sT5J4EZgesuQCTWpgbFWABXdsFjqwl81g4QsViKCrD5lsGQtD31SohEe5weVdg/yFfmt
         YRQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=awOJT5ml/p/iN0KxyefzrE4LGX6n2gmPWGzJTQAAet8=;
        b=rdk4Fipd97XQusdyXqa8YfecgOrSzoeLBwCx8gYlyHJ9MQMJ1VmB1YpICA5gMX9jea
         8WoT5MxbABK1HVW47N9Vt6TPxyUpr2H/xsgOKzJtqsqoZ8gLDAxaVIko5aaM5VNBecX2
         ZT1xxfts/rPciWHskapiXHfjmDi6hazccHVf0UuWHmDZYke75IepVB6Yw0IY0ddA269/
         SDo95WpBUm3Ps4udMuQWoGwtlFsLjO0P7zjVEcJSXfF6Qb6LNFR5ZYyXQP/d13cCxmyr
         Mfpuuy2NNUe5EPXGHB+kQwrbC4WnVMR53Ov9HeOWfdjAQHXDICeObWH3w8fvF2g8Dc2m
         lOLg==
X-Gm-Message-State: AOAM531yWIaAVQqrANz6Co7AqZxgv1WXQlRMm7pr4JnenjRLyU0/Xuet
        9pchpTtZ+LhuBEpq4LcXYPehoQ==
X-Google-Smtp-Source: ABdhPJyQoPuVVRCc89Y1QnkaBzULkzh6Atn4Xpkt02waxT59G145ji8tP+U8C/JfEGb3Zggs1qfu8w==
X-Received: by 2002:a02:93a3:0:b0:313:f1cd:2bde with SMTP id z32-20020a0293a3000000b00313f1cd2bdemr27667395jah.238.1646290026470;
        Wed, 02 Mar 2022 22:47:06 -0800 (PST)
Received: from google.com ([2620:15c:183:200:3c49:7c37:fbd6:d914])
        by smtp.gmail.com with ESMTPSA id e17-20020a5d8ad1000000b00644d51bbffcsm1075276iot.36.2022.03.02.22.47.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 22:47:05 -0800 (PST)
Date:   Wed, 2 Mar 2022 23:47:01 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Vaibhav Jain <vaibhav@linux.ibm.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
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
        page-reclaim@google.com, x86@kernel.org
Subject: Re: [PATCH v7 00/12] Multigenerational LRU Framework
Message-ID: <YiBkZaIpQjv0D2fC@google.com>
References: <20220208081902.3550911-1-yuzhao@google.com>
 <87czj3mux0.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87czj3mux0.fsf@vajain21.in.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 03, 2022 at 11:36:51AM +0530, Vaibhav Jain wrote:
> 
> In a synthetic MongoDB Benchmark (YCSB) seeing an average of ~19% throughput
> improvement on POWER10(Radix MMU + 64K Page Size) with MGLRU patches on
> top of v5.16 kernel for MongoDB + YCSB bench across three different
> request distriburions namely Exponential,Uniform and Zipfan

Thanks, Vaibhav. I'll post the next version in a few days and include
your tested-by tag.
