Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45561C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 22 Dec 2020 16:22:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1986323103
	for <linux-doc@archiver.kernel.org>; Tue, 22 Dec 2020 16:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgLVQWu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Dec 2020 11:22:50 -0500
Received: from smtprelay0114.hostedemail.com ([216.40.44.114]:35312 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727254AbgLVQWu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Dec 2020 11:22:50 -0500
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay01.hostedemail.com (Postfix) with ESMTP id 48F1E100E7B46;
        Tue, 22 Dec 2020 16:22:09 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: shock82_5013a7b27461
X-Filterd-Recvd-Size: 3498
Received: from XPS-9350.home (unknown [47.151.137.21])
        (Authenticated sender: joe@perches.com)
        by omf03.hostedemail.com (Postfix) with ESMTPA;
        Tue, 22 Dec 2020 16:22:07 +0000 (UTC)
Message-ID: <983e6452a7f2af14ca7edfa56cd2e2997172a771.camel@perches.com>
Subject: Re: [PATCH] checkpatch: make the line length warnings match the
 coding style document
From:   Joe Perches <joe@perches.com>
To:     Christoph Hellwig <hch@lst.de>
Cc:     Matthew Wilcox <willy@infradead.org>, apw@canonical.com,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org,
        linux-doc <linux-doc@vger.kernel.org>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 22 Dec 2020 08:22:06 -0800
In-Reply-To: <20201222131234.GA29028@lst.de>
References: <20201210082251.2717564-1-hch@lst.de>
         <c3f1d9de2e5a61588f64e69a1309968d84a2dd12.camel@perches.com>
         <20201210200930.GB7338@casper.infradead.org>
         <4898c0c03d370a23b1b98ddabb72e70ec8d430fa.camel@perches.com>
         <93a470c7631d2607e7b2a12e9cc5d8e930911989.camel@perches.com>
         <20201222131234.GA29028@lst.de>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 2020-12-22 at 14:12 +0100, Christoph Hellwig wrote:
> On Mon, Dec 21, 2020 at 08:08:20PM -0800, Joe Perches wrote:
> > On Thu, 2020-12-10 at 13:27 -0800, Joe Perches wrote:
> > > On Thu, 2020-12-10 at 20:09 +0000, Matthew Wilcox wrote:
> > > > On Thu, Dec 10, 2020 at 12:05:04PM -0800, Joe Perches wrote:
> > > > > Also, given the ever increasing average identifier length, strict
> > > > > adherence to 80 columns is sometimes just not possible without silly
> > > > > visual gymnastics.  The kernel now has quite a lot of 30+ character
> > > > > length function names, constants, and structs.
> > > > 
> > > > maybe checkpatch should warn for identifiers that are 30+ characters
> > > > long?  address the problem at its source ..
> > > 
> > > Hard to know when to warn as patches could just add uses of already
> > > existing names and emitting warnings for those would just be annoying.
> > > 
> > > Maybe something that tests long identifier additions of
> > > defines/functions/macros/structs but not their uses and maybe only
> > > then in patches and not files.
> > > 
> > > Perhaps:
> > 
> > Anyone care that this should be added or not added to checkpatch?
> 
> It is pretty useless.

Maybe so, if only because I chose a high value for the max id length
to avoid controversy.  I would prefer something like 20.

> What we need is a patch that doesn't make people
> uselessly add overly long lines against the intent of the coding style
> document.  I have submitted a pretty reasonable one, and I'm open to
> alternatives, but we need to to stop people submitting code that does
> not fit the coding style all the time because checkpatch doesn't
> complain.

Having checkpatch complain about > 80 column lines didn't stop
patches before, likely it wouldn't stop patches now.

Emitting yet more messages for trivial lines > 80 columns is also
against the intent of the commit that changed the line length maximum.

commit bdc48fa11e46f867ea4d75fa59ee87a7f48be144
checkpatch/coding-style: deprecate 80-column warning

The effect of your patch might as well revert the checkpatch portion
of that commit.

I think that's not a great idea for the reason in the commit message.


