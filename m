Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4CB17DE78
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 19:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S964944AbeEITbv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 15:31:51 -0400
Received: from merlin.infradead.org ([205.233.59.134]:36136 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964850AbeEITbu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 15:31:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=1fUaM4LDHHOawoYSoIwzOCcCsW9ZxQWw4muxzEoF6F4=; b=1xhOv9JNtlic9sTezvj2JbFFy
        S8a9fkPszGHkh0BmOxD0z7RnMAA+1KesDghHvVRhqPwl1DkiuzbABNe92SBIIqJk7ZhCzN7MA+6IJ
        wJNwr5XabPy8pqnrIQJBBHWg7fcEu3ecSnA8I/e4njVZkzQ+QJXL13GC4NedQiE3J3yNSbF36S4b1
        Apt+KCPS9yX2+3nws/lVt9Ya5Rx0PADjb4Jgn5Ze5tK/WFnNVAbI23H8QwIoeBik8LcuKVAXnr6AZ
        ZGv0sVHOFokn8mVWHmB+Aoyz8AR1hrJ7p1uwVOUw46LZgtZx//F6mvR/CdJaynys5Cs7i5SVH8yh+
        DmCj7jL8g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGUoR-00035H-5T; Wed, 09 May 2018 19:31:43 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 48EDF2029FA13; Wed,  9 May 2018 21:31:38 +0200 (CEST)
Date:   Wed, 9 May 2018 21:31:38 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>
Subject: Re: [PATCH 13/18] wait: wait.h: Get rid of a kernel-doc/Sphinx
 warnings
Message-ID: <20180509193138.GW12217@hirez.programming.kicks-ass.net>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <6b9b3184cbfabab1ad89c974ddf1c61631e8f1bf.1525684985.git.mchehab+samsung@kernel.org>
 <20180509084120.GF12217@hirez.programming.kicks-ass.net>
 <20180509084518.247650e2@lwn.net>
 <20180509152026.GA12198@hirez.programming.kicks-ass.net>
 <20180509123540.083b61d2@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180509123540.083b61d2@lwn.net>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 09, 2018 at 12:35:40PM -0600, Jonathan Corbet wrote:
> On Wed, 9 May 2018 17:20:26 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > The whole rst wankery is detrimental to that interface in order to
> > pander to something else.. I don't see the value. I've objected before,
> > and I suppose I'll object again.
> 
> One person's wankery is another's integrated, browsable, and searchable
> documentation that shows some signs of having actually been thought about,
> I guess.

Browsable is what we have ctags/cscope for and searchable is git-grep, right?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
