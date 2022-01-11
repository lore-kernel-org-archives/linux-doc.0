Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC3EBC433FE
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 22:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229798AbiAKW1P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Jan 2022 17:27:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346361AbiAKW1O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jan 2022 17:27:14 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C262C06173F
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 14:27:14 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id p7so970931iod.2
        for <linux-doc@vger.kernel.org>; Tue, 11 Jan 2022 14:27:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=G7kQRCx+rRS1N/ks+4JmHn5SA2pt7BzAGTmmbfnv5ts=;
        b=gPYtqtvf+eYY9BhoIWPwtWcE4D+PQcGEuLiDhxEx796A+wHUvAqmtKJzjWDOd4rKLt
         +yP4SsCO4HpUFlvZzpAld2uVc31X4PMHsb3FY8WHpMiDr0LyGkwEcUh+8FqwG5yT4G+T
         v0b0HXe3SmNblndHNvfVDl1WtNYY0F8DUCHwLwmWXXTzb8vHUrKX2rTQYlHrRNp8RZtN
         xXoN9G9kiaigiau+5+tzRFeBeUyJc6hhfNTlb22iUeMmAoTPeF0VLOtIbxQbgIXT8F7c
         NaX8v15Z3znmBWZFLAi8gpD8xfaP7zk7WbtwVueEasGQDZ7zkOsBi9mj6/AYF8BEICLj
         OMzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=G7kQRCx+rRS1N/ks+4JmHn5SA2pt7BzAGTmmbfnv5ts=;
        b=fysAv0xoOuKIydh/TbZRWNM5o3miEb+LRMWAmXDAUoA5RmieUKp6ucXdOKrs792tCY
         UDwIf7j5jnfS4muIk6h3gb82I6hlMyq0vl9plYuOIixL9cbQX1eLPNrhmG+KtDuqhy00
         wbdjuxm8MthxSJtixuE5FZQBdtR3xIIM+jQtfgmlvaKErC51QPYznVZQVzvZoFRj2Mye
         QHVi0r1eD6L0YwyIR+4aavdSonWeKcvsSLW44qGQ+f+RYLrK/ssN0nyf0OZ31FQU1lKw
         d5C7IvNE/f73YKv7rF/afrRcbL/cjeAlMK5jSSvRkdAbK1i6sQH3Odb33guIeTLyVLtB
         h2sQ==
X-Gm-Message-State: AOAM53380wjyE6Ni2iMcimQDDBTuya60TE1J18sLL1nQgI+DzqMt+n0H
        BFmzNYNiHPf0w5vopmHChQVHgg==
X-Google-Smtp-Source: ABdhPJwaED08tpKVv8YnCW9+h1IUk9ODwurVhXkI1Pbnd0sp/azcAnHAB9iLm4zRrQoDNua+0u+ayw==
X-Received: by 2002:a02:81c3:: with SMTP id r3mr3168591jag.53.1641940032582;
        Tue, 11 Jan 2022 14:27:12 -0800 (PST)
Received: from google.com ([2620:15c:183:200:b6b6:70f4:b540:6383])
        by smtp.gmail.com with ESMTPSA id v23sm6654664ioj.4.2022.01.11.14.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 14:27:12 -0800 (PST)
Date:   Tue, 11 Jan 2022 15:27:08 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Will Deacon <will@kernel.org>
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
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>
Subject: Re: [PATCH v6 1/9] mm: x86, arm64: add arch_has_hw_pte_young()
Message-ID: <Yd4EPGM+Uj6iDu1l@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
 <20220104202227.2903605-2-yuzhao@google.com>
 <20220105104526.GA3015@willie-the-truck>
 <YdYDzKvYbBwjfU3W@google.com>
 <20220106103009.GA4420@willie-the-truck>
 <Ydfq051mnCeZjG3G@google.com>
 <20220111141901.GA10338@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111141901.GA10338@willie-the-truck>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 11, 2022 at 02:19:02PM +0000, Will Deacon wrote:
> On Fri, Jan 07, 2022 at 12:25:07AM -0700, Yu Zhao wrote:
> > On Thu, Jan 06, 2022 at 10:30:09AM +0000, Will Deacon wrote:
> > > On Wed, Jan 05, 2022 at 01:47:08PM -0700, Yu Zhao wrote:
> > > > On Wed, Jan 05, 2022 at 10:45:26AM +0000, Will Deacon wrote:
> > > > > On Tue, Jan 04, 2022 at 01:22:20PM -0700, Yu Zhao wrote:
> > > > > > diff --git a/arch/arm64/tools/cpucaps b/arch/arm64/tools/cpucaps
> > > > > > index 870c39537dd0..56e4ef5d95fa 100644
> > > > > > --- a/arch/arm64/tools/cpucaps
> > > > > > +++ b/arch/arm64/tools/cpucaps
> > > > > > @@ -36,6 +36,7 @@ HAS_STAGE2_FWB
> > > > > >  HAS_SYSREG_GIC_CPUIF
> > > > > >  HAS_TLB_RANGE
> > > > > >  HAS_VIRT_HOST_EXTN
> > > > > > +HW_AF
> > > > > >  HW_DBM
> > > > > >  KVM_PROTECTED_MODE
> > > > > >  MISMATCHED_CACHE_TYPE
> > > > > 
> > > > > As discussed in the previous threads, we really don't need the complexity
> > > > > of the additional cap for the arm64 part. Please can you just use the
> > > > > existing code instead? It's both simpler and, as you say, it's equivalent
> > > > > for existing hardware.
> > > > > 
> > > > > That way, this patch just ends up being a renaming exercise and we're all
> > > > > good.
> > > > 
> > > > No, renaming alone isn't enough. A caller needs to disable preemption
> > > > before calling system_has_hw_af(), and I don't think it's reasonable
> > > > to ask this caller to do it on x86 as well.
> > > > 
> > > > It seems you really prefer not to have HW_AF. So the best I can
> > > > accommodate, considering other potential archs, e.g., risc-v (I do
> > > > plan to provide benchmark results on risc-v, btw), is:
> > > > 
> > > >   static inline bool arch_has_hw_pte_young(bool local)
> > > >   {
> > > > 	bool hw_af;
> > > > 
> > > >   	if (local) {
> > > >   		WARN_ON(preemptible());
> > > >   		return cpu_has_hw_af();
> > > >   	}
> > > >   
> > > > 	preempt_disable();
> > > >   	hw_af = system_has_hw_af();
> > > > 	preempt_enable();
> > > > 
> > > > 	return hw_af;
> > > >   }
> > > > 
> > > > Or please give me something else I can call without disabling
> > > > preemption, sounds good?
> > > 
> > > Sure thing, let me take a look. Do you have your series on a public git
> > > tree someplace?
> > 
> > Thanks!
> > 
> > This patch (updated) on Gerrit:
> > https://linux-mm-review.googlesource.com/c/page-reclaim/+/1500/1
> 
> How about folding in something like the diff below? I've basically removed
> that 'bool local' argument and dropped the preemptible() check from the
> arm64 code.

This looks great, thanks.
