Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0874B7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932875AbeEIMWY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:22:24 -0400
Received: from mail.bootlin.com ([62.4.15.54]:55370 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932318AbeEIMWX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 08:22:23 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 218B22072B; Wed,  9 May 2018 14:22:21 +0200 (CEST)
Received: from bbrezillon (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id CF36E20376;
        Wed,  9 May 2018 14:22:20 +0200 (CEST)
Date:   Wed, 9 May 2018 14:22:21 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH 16/18] mtd: rawnand.h: use nested union kernel-doc
 markups
Message-ID: <20180509142221.0fef7d1f@bbrezillon>
In-Reply-To: <20180509091034.58dadd12@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
        <20180507114650.171edcc2@bbrezillon>
        <20180507083232.5a084ba7@vento.lan>
        <20180509091034.58dadd12@vento.lan>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 9 May 2018 09:10:34 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Hi Boris,
> 
> Em Mon, 7 May 2018 08:32:32 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> 
> > Hi Boris,
> > 
> > Em Mon, 7 May 2018 11:46:50 +0200
> > Boris Brezillon <boris.brezillon@bootlin.com> escreveu:  
> 
> > > Is there a simple
> > > way we can get rid of the warning we have when not describing timings
> > > but all of its fields?    
> > 
> > There's no direct way. It won't be hard to add a way to do it,
> > like applying the enclosed patch with ends by declaring timings as:
> > 
> > 	* @timings:	 -- undescribed --
> > 
> > IMHO, this is uglier.  
> 
> Didn't hear from you.

I replied just a few minutes ago ;).

> What do you prefer for me to do with regards to
> this patch? 

Will queue the initial patch to nand/next (I can also queue it to the
fixes branch if you prefer).


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
