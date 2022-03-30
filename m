Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C440C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 30 Mar 2022 00:25:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231516AbiC3A1Y (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 29 Mar 2022 20:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbiC3A1Y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 29 Mar 2022 20:27:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C1AAB6E76
        for <linux-doc@vger.kernel.org>; Tue, 29 Mar 2022 17:25:40 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF5CD6062B
        for <linux-doc@vger.kernel.org>; Wed, 30 Mar 2022 00:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 280A3C340ED;
        Wed, 30 Mar 2022 00:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648599939;
        bh=R7P+nzFf0s9I0Gqw7eDFcD1W2WgUXG/7wBedWpiVoms=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=WGlNwx4i0mqUPRSiJncM7+tPmW1f8OPto6LVAxwULWzKA2jkpgAiCB2hfejCKew4j
         fxs2yvvp/QNu5tJxmw76lzQi8NxiKOzHMRaVsbgImBD2+a6z2KqOmp/MDvKLA4uvty
         j5wiix3jYmQCJcOJ3uw7V8ZeAeuOBUWmemWmeogsQMrV1s0PUHU9j7UlfV2Gkl0LtY
         RhMhpFsR1ZFQXGXrD8GDBCLLFxvwnN+5/hJ5G4heqgWYV+HiDqZzMDxHf42WZ+mUta
         2pOnHKMdC5OwCeGPNfLpvvaDtgSBd0qFpJJjvPbaeX05Ep57Yu3/KS+liTUdxS2ZCi
         UukVV1b5v/6Ng==
Date:   Wed, 30 Mar 2022 02:25:34 +0200
From:   Mauro Carvalho Chehab <mchehab@kernel.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Akira Yokosawa <akiyks@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: sphinx/requirements: Limit jinja2<3.1
Message-ID: <20220330022534.10ac0a50@coco.lan>
In-Reply-To: <871qyk7p28.fsf@meer.lwn.net>
References: <7dbff8a0-f4ff-34a0-71c7-1987baf471f9@gmail.com>
        <871qyk7p28.fsf@meer.lwn.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Jon,

Em Tue, 29 Mar 2022 09:31:43 -0600
Jonathan Corbet <corbet@lwn.net> escreveu:

> Akira Yokosawa <akiyks@gmail.com> writes:
> 
> > jinja2 release 3.1.0 (March 24, 2022) broke Sphinx<4.0.
> > This looks like the result of deprecating Python 3.6.
> > It has been tested against Sphinx 4.3.0 and later later.  
> 
> *Sigh*.  I wish this stuff didn't feel like such a house of cards
> sometimes... 
> 
> > Setting an upper limit of <3.1 to junja2 can unbreak Sphinx<4.0
> > including Sphinx 2.4.4.
> >
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> > Cc: linux-doc@vger.kernel.org
> > ---
> > Or we can bump the requirement to Sphinx>=4.0.
> > Thoughts?  
> 
> It's probably time to consider a bump there, but that is a bigger one
> than I would want to do at this point. 

Doing a bump at Documentation/sphinx/requirements.txt doesn't mean that people 
using have older versions would need to upgrade, as we don't need to bump the
minimal requirement at Documentation/conf.py, nor the versions suggested by 
scripts/sphinx-pre-install.

So, I don't see a problem on setting it to use sphinx==4.3.2 (or some other 
version).

Yet, I would keep using a known-to-be-good version, instead of letting
pip to just get the latest one.

We need to verify both PDF and html generation, though, as I remember
that some 4.x versions had/(have?) issues with the C domain and duplicate
symbols detection.

Also, it could be worth to check the build time with 2.4.4 and with
whatever newer version we stick.

> So I'll just fast-track this
> patch in; dropping it into the stable updates probably makes sense too.

Agreed.

Thanks,
Mauro
