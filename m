Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C566FC4741F
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:30:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C43720867
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 15:30:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Vrnyo+Pg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731089AbgKEPad (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 10:30:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730906AbgKEPad (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 10:30:33 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6481DC0613CF;
        Thu,  5 Nov 2020 07:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=m3WII96Ziy0R6sHVNIdEKyHksxaiePFatxdsCYPA4NE=; b=Vrnyo+PgqEIJnHjeytUo37zCmD
        ZAXRaLIUhB29c6HILDlmnnvFVxA5zq/eJk1s8Mc7mWThMnvW5hf2l97O2yyFnrQtvnx1VvAwjXJKL
        JMwLCuh3q7ySG49b+XfcyysVKwE6fpS/m8l5iO1oJYGyrjUFWyp5gE/DlrWltmDECk6w2IZ3/+wHF
        AGjy/5M2XyKUYANkUVeX9IyV0iCc1HjvHJvlghegMPGUkBKFavsGRecoSgOa4wuKoxJAz3nFy9KhN
        NXbyFiszfVM+7mT+h8cA+3c6G3RHDUQEhJVn9G11i/jDDZFRi6/n6ywgSpcAwkgBzhY9L8s63dLJY
        4YIHkvCA==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kahDZ-0000w2-PI; Thu, 05 Nov 2020 15:30:30 +0000
Date:   Thu, 5 Nov 2020 15:30:29 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 56/56] scrpits: kernel-doc: validate kernel-doc markup
 with the actual names
Message-ID: <20201105153029.GM17076@casper.infradead.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <a21343a7012c87391c4850bf3151ebd82add8d1c.1603469755.git.mchehab+huawei@kernel.org>
 <20201105150017.GL17076@casper.infradead.org>
 <20201105081526.1f9c7f4a@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105081526.1f9c7f4a@lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 05, 2020 at 08:15:26AM -0700, Jonathan Corbet wrote:
> On Thu, 5 Nov 2020 15:00:17 +0000
> Matthew Wilcox <willy@infradead.org> wrote:
> 
> > I wonder if we could change kernel-doc to be (optionally) less verbose.
> > If we allowed people to write:
> > 
> > /**
> >  * Add a value to a refcount.
> >  * @i: The value to add to the refcount
> >  * @r: The refcount
> >  */
> > 
> > and had the kernel-doc script pick up the name of the following function
> > automatically, would that be an improvement we could all agree on?
> 
> Given the number of issues Mauro just fixed where the comments had become
> separated from the functions they documented, this seems potentially
> hazardous...  It seems especially likely to fail with the "change foo() to
> __foo() and add a new foo() down below" pattern that is fairly common.

Sort of, yes.  The usual case for doing that is where one adds a new
parameter, and kernel-doc will warn about that.  But if the parameters
stay the same (eg refcount_add takes a lock and __refcount_add assumes
the lock is already held), then you've got documentation of __refcount_add
and no documentation of refcount_add() ... and it's probably still _true_
documentation, just not as useful.
