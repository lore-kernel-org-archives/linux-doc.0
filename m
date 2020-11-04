Return-Path: <SRS0=J8tN=EK=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB99C2D0A3
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 22:40:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF8D820870
	for <linux-doc@archiver.kernel.org>; Wed,  4 Nov 2020 22:40:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729897AbgKDWkc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 4 Nov 2020 17:40:32 -0500
Received: from ms.lwn.net ([45.79.88.28]:52412 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728565AbgKDWkc (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 4 Nov 2020 17:40:32 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id B8AA22E7;
        Wed,  4 Nov 2020 22:40:31 +0000 (UTC)
Date:   Wed, 4 Nov 2020 15:40:30 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [GIT PULL] Docs-build warning fixes for 5.10-rc3
Message-ID: <20201104154030.5d107c6c@lwn.net>
In-Reply-To: <20201105090652.003eb7bf@canb.auug.org.au>
References: <20201103124420.46bf5a37@lwn.net>
        <CAHk-=wghhw0SpqSKKUqt5eum=UfLD3Qa0suoRxLy_cJc4hChug@mail.gmail.com>
        <20201105090652.003eb7bf@canb.auug.org.au>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 5 Nov 2020 09:06:52 +1100
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> There is currently one message produced in your tree (after I add all
> the "pending fixes") and I have reported that this morning.  So things
> are looking pretty good now - a lot of good work over the past couple
> of releases.

The credit for that really belongs to Mauro.  Much appreciated!

jon
