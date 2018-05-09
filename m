Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B22A07DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 13:28:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935093AbeEIN2p (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 09:28:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:41076 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935166AbeEIN2d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 09:28:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=nxwrV8Skm47Dk9yv4IC8MqGBlRUdn8hpMya19i7qk3Q=; b=gbGtJCnVlm+N4pFXW7YiRmL/r
        w+YitfvrgwMz7eLd8ATU9EffQgBJNHjGfD8hnXHuZNV8eBxRFUGLQ/J3ngOF4ed5uvNoE1+0Gn0Zq
        3tVEDnhQOTAsrvTjqieytVBcL7h5c7ANmT2CkUXVwXaeJpJcUzGxRiYQK5G7RD+cqP99O261hdi62
        HGOMgrhMkxEDIJD3VQ6ex5hoT50P39luPDZZjmz4/9N1POzOMBt3Kan9VHwuT1xVsPqxRNuARdIbf
        17U85gZBYY5q/c4QoP6rfMDTCJXHIS6Z8B7wN+t2BntsXLT58e+1VsGavxWFaG+mqlTKqCTbbfnJs
        57gUiGE2w==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGP8w-0002N1-D1; Wed, 09 May 2018 13:28:30 +0000
Date:   Wed, 9 May 2018 10:28:26 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH 16/18] mtd: rawnand.h: use nested union kernel-doc
 markups
Message-ID: <20180509102826.26d38719@vento.lan>
In-Reply-To: <20180509142221.0fef7d1f@bbrezillon>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
        <20180507114650.171edcc2@bbrezillon>
        <20180507083232.5a084ba7@vento.lan>
        <20180509091034.58dadd12@vento.lan>
        <20180509142221.0fef7d1f@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Em Wed, 9 May 2018 14:22:21 +0200
Boris Brezillon <boris.brezillon@bootlin.com> escreveu:

> On Wed, 9 May 2018 09:10:34 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > Hi Boris,
> > 
> > Em Mon, 7 May 2018 08:32:32 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >   
> > > Hi Boris,
> > > 
> > > Em Mon, 7 May 2018 11:46:50 +0200
> > > Boris Brezillon <boris.brezillon@bootlin.com> escreveu:    
> >   
> > > > Is there a simple
> > > > way we can get rid of the warning we have when not describing timings
> > > > but all of its fields?      
> > > 
> > > There's no direct way. It won't be hard to add a way to do it,
> > > like applying the enclosed patch with ends by declaring timings as:
> > > 
> > > 	* @timings:	 -- undescribed --
> > > 
> > > IMHO, this is uglier.    
> > 
> > Didn't hear from you.  
> 
> I replied just a few minutes ago ;).

OK!

> > What do you prefer for me to do with regards to
> > this patch?   
> 
> Will queue the initial patch to nand/next (I can also queue it to the
> fixes branch if you prefer).

No need. it can follow the usual workflow.

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
