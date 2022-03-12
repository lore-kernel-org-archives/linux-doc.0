Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F9AC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 12 Mar 2022 11:40:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbiCLLls (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 12 Mar 2022 06:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbiCLLlr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 12 Mar 2022 06:41:47 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C6B121EB97
        for <linux-doc@vger.kernel.org>; Sat, 12 Mar 2022 03:40:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=AK9rS7g42J6WvuMM45CwDm11zP0nFYUAK2iji7Qoe0Y=; b=nZoFAD7KGWxLTCZhgXae029Xmh
        weDGohbWWhmwGe/NmZdISFpWR3s12bol32aeV08PgONi3ZfHhfZN5kVL8NGMuvNC68ngynwMAjQDH
        ngm2ZPPAnRQdeK05GujreZMH/QTpfVR2G57TU2m9HTLrtiPIsKuzrQMZJadgmxalIvGElqh2trB+6
        Fq7MaHBcsIynMUeQttao/bcMF4GRYZwt4Fb7NS13/M9dj+/b7UN/ljAstRXPSCx+ePqydu8m4x4wx
        ZkUGfRNUnYOqKs1T0auYkFj4Xd1K3VbzPhtGGEJMp7DiuB0t7PpHuThuVdrCy8pPRmLzNBSBlZtrR
        U9bgCd/g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=worktop.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nT06e-002NmD-6g; Sat, 12 Mar 2022 11:40:20 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
        id BC0D3986857; Sat, 12 Mar 2022 12:40:17 +0100 (CET)
Date:   Sat, 12 Mar 2022 12:40:17 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Tang Yizhou <tangyizhou@huawei.com>, mingo@redhat.com,
        linux-doc@vger.kernel.org, zhengbin13@huawei.com,
        siyanteng@loongson.cn, siyanteng01@gmail.com, tangyeechou@gmail.com
Subject: Re: [PATCH] docs: scheduler: Convert schedutil.txt to ReST
Message-ID: <20220312114017.GA6235@worktop.programming.kicks-ass.net>
References: <20220311030400.32320-1-tangyizhou@huawei.com>
 <87v8wk2ozc.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8wk2ozc.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 11, 2022 at 01:50:15PM -0700, Jonathan Corbet wrote:
> Tang Yizhou <tangyizhou@huawei.com> writes:
> 
> > All other scheduler documents have been converted to *.rst. Let's do
> > the same for schedutil.txt.
> >
> > Signed-off-by: Tang Yizhou <tangyizhou@huawei.com>
> > ---
> >  Documentation/scheduler/index.rst             |  1 +
> >  .../{schedutil.txt => schedutil.rst}          | 50 ++++++++++---------
> >  2 files changed, 28 insertions(+), 23 deletions(-)
> >  rename Documentation/scheduler/{schedutil.txt => schedutil.rst} (85%)
> 
> I would like to see this change made so that this document can be built
> with the rest of the kernel docs.  I will, however, defer to Peter and
> will not accept this change over his objections.

As I'm sure you're aware, I'd *love* to convert the whole lot to plain
text again :-)

People, throughout the ages, have been able to read plain text, I don't
see why it should be made more difficult than that.
