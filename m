Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A09767D917
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Apr 2019 08:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbfDWI3o (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Apr 2019 04:29:44 -0400
Received: from merlin.infradead.org ([205.233.59.134]:46164 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726710AbfDWI3n (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 23 Apr 2019 04:29:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=z0XpA2nyONdcK57DS6WK5Os5eZ9ApHZug9VkdqItTn4=; b=nOrrWkaCdrmscQbdIuQedMp8d
        q1NMAnZ2nwBalZJXGKIHmPinnqlEJnXpiEILp3k7/gsohoxrDseumOwcqf7f5vE7WTPxbRiBOkNCd
        34X+mFUVL3fAKy1+R/bPbPC4v1xSD7f0txwgrHzJ2GTHRcwQZINFniCBZ9CbSWh0OZfeEhkXNGTDm
        rgmsyuykcKwWhc4h93BerBflD7RSPRTnQww0a23/4TepNb5sjbrIfMfX7XvVWu13RNUh3HDHnDGya
        4Hjitm//t6Ncf7SWHYQiNfHszucImdSc+Oo5783QqXXviFSo/sk2EYal5/AO5RRTuz45tfTC/qKM7
        w2p2np7DQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIqo6-00010Q-Sj; Tue, 23 Apr 2019 08:29:39 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 7726729B47DC5; Tue, 23 Apr 2019 10:29:37 +0200 (CEST)
Date:   Tue, 23 Apr 2019 10:29:37 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH v2 38/79] docs: scheduler: convert docs to ReST and
 rename to *.rst
Message-ID: <20190423082937.GZ11158@hirez.programming.kicks-ass.net>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
 <2a3b2b06459e0134a3af4fbf3e6f62e6d42c4d26.1555938376.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2a3b2b06459e0134a3af4fbf3e6f62e6d42c4d26.1555938376.git.mchehab+samsung@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 22, 2019 at 10:27:27AM -0300, Mauro Carvalho Chehab wrote:
> In order to prepare to add them to the Kernel API book,
> convert the files to ReST format.
> 
> The conversion is actually:
>   - add blank lines and identation in order to identify paragraphs;
>   - fix tables markups;
>   - add some lists markups;
>   - mark literal blocks;
>   - adjust title markups.
> 
> At its new index.rst, let's add a :orphan: while this is not linked to
> the main index.rst file, in order to avoid build warnings.

Well, just don't expect me to ever touch these files again.
