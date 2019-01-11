Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B4EEE7D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Jan 2019 18:13:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387866AbfAKSNr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 11 Jan 2019 13:13:47 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:46448 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730386AbfAKSNr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jan 2019 13:13:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=mw+D8yN9ePbWzEz0AkKvXkXq2TBZSYVDCbbvbqNTCOc=; b=RuSLs/iJakUr0v/uSWecaBjSz
        7NrTMF+UfQ0ndEMfGgByFy++Cqb66IxsV/LA9pJw6XgubpjBj6z8uEkaVhEMnl1Fxjrlsionraazn
        jptzrqJzrs07G3rmibGuIu3pDO8JDLd/MAhLLETIjO/eU63kHFJJdFuv3rWnKrKGIdR8k9C4jSDm8
        3PtpZJmdWWn0b/DIBwAAJjNdQZZlbXfq+/wJVpf2P4savfd+DE71AqwG+8yYhk8rsMTEHpUgi+sCh
        gRy731cku2JGTz1wHKvZAy681c5zAPEGggna6cVxBgWnb7xYz7kqoNyl5KnAZLlCW2fvXLvraP+wk
        lMbRj1/JQ==;
Received: from willy by bombadil.infradead.org with local (Exim 4.90_1 #2 (Red Hat Linux))
        id 1gi1JQ-0007uV-Lt; Fri, 11 Jan 2019 18:13:44 +0000
Date:   Fri, 11 Jan 2019 10:13:44 -0800
From:   Matthew Wilcox <willy@infradead.org>
To:     Liviu Dudau <Liviu.Dudau@arm.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Brian Starkey <brian.starkey@arm.com>,
        Ayan Halder <ayan.halder@arm.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-doc@vger.kernel.org
Subject: Re: [GIT PULL] Documentation: Add AFBC modifier usage documentation
Message-ID: <20190111181344.GI6310@bombadil.infradead.org>
References: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190111180749.GJ20661@e110455-lin.cambridge.arm.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 11, 2019 at 06:07:49PM +0000, Liviu Dudau wrote:
> Hi Jonathan,
> 
> I have a patch adding documentation for the AFBC modifiers supported
> by the DRM framework with an upcoming patch series. Patch has been
> out for review for a while, please pull.

Nowhere in this email do you say what "AFBC" stands for or is.  Intel are
awful for acronyms.  ARM are rapidly getting as bad, or worse.  Nobody
else cares as deeply about your project as you do.  Provide some kind
of clue about what you're doing and why anybody else should care.
