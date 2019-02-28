Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F18E7D04D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Feb 2019 17:56:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388270AbfB1R4u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Feb 2019 12:56:50 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:37700 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726214AbfB1R4u (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Feb 2019 12:56:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mAezheR5Ts58PLPCR6fzktl3Y7U/H/Na9KcQGEBTSbg=; b=TexdUqPIudUzLoK2q5Z60Hn77
        bv/JGELmEVTuHUEQpn0Z4qTIwltpNXHJeJRn/e4nQlJ2CN9HOzPphF870wJPHlZ+R1LEHNvr22rIM
        eF566F35a/AUMs5IdO3IgAeGSxzxrWAw9GjD3bo2QpES6XqjoIv2KpCsXdfupZ2lOv5Bn+4NDtOP3
        xivAiqDXe1h51DnvFkGd2458ryFYqYt8S63wDjwe8FRgEAxQBCHcDSjyj/cnH0AFCuHTvZNs/NQL/
        hkH4nTXHXlMyKg5xRhkwigcyaUhregZW7h/H5+QF2MD2X3NT1sF3p/WBpY+AYth61gLUh9hGvD6t3
        fAFluEurA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gzPvM-0008Gb-TG; Thu, 28 Feb 2019 17:56:49 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 42581202C2DA7; Thu, 28 Feb 2019 18:56:47 +0100 (CET)
Date:   Thu, 28 Feb 2019 18:56:47 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Len Brown <lenb@kernel.org>
Cc:     X86 ML <x86@kernel.org>, linux-kernel@vger.kernel.org,
        Len Brown <len.brown@intel.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH 03/11] x86 topology: Add CPUID.1F multi-die/package
 support
Message-ID: <20190228175647.GH32494@hirez.programming.kicks-ass.net>
References: <635b2bf8b1151a191cd9299276b75791a818c0c2.1550545163.git.len.brown@intel.com>
 <07d2908dc72bf964b27380999e1c826587d69136.1550545163.git.len.brown@intel.com>
 <20190220105542.GB17969@hirez.programming.kicks-ass.net>
 <CAJvTdK=+Lw1_WFE4_aGqxtRPK_JafmmzcmGSqScMOB4EK-xH5g@mail.gmail.com>
 <20190226135426.GU32477@hirez.programming.kicks-ass.net>
 <CAJvTdKk6B0rWMukNv3OKimSvbDqP+c83dTQpO4kFvbL7ETGPvg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJvTdKk6B0rWMukNv3OKimSvbDqP+c83dTQpO4kFvbL7ETGPvg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 28, 2019 at 10:59:19AM -0500, Len Brown wrote:

> The SDM is like software -- usually (but not always) you are better
> off with the latest version:-)

If only it existed as a .tex file in a git repo. It has been very useful
to have older versions around a number of times.
