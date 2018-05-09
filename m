Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E2A6D7DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:02:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934870AbeEIMCl (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:02:41 -0400
Received: from mail.bootlin.com ([62.4.15.54]:54898 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934721AbeEIMCi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 9 May 2018 08:02:38 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 404472072B; Wed,  9 May 2018 14:02:36 +0200 (CEST)
Received: from bbrezillon (LStLambert-657-1-97-87.w90-63.abo.wanadoo.fr [90.63.216.87])
        by mail.bootlin.com (Postfix) with ESMTPSA id DF59620376;
        Wed,  9 May 2018 14:02:35 +0200 (CEST)
Date:   Wed, 9 May 2018 14:02:36 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Richard Weinberger <richard@nod.at>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH 16/18] mtd: rawnand.h: use nested union kernel-doc
 markups
Message-ID: <20180509140236.17d437f8@bbrezillon>
In-Reply-To: <20180507083232.5a084ba7@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
        <20180507114650.171edcc2@bbrezillon>
        <20180507083232.5a084ba7@vento.lan>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 7 May 2018 08:32:32 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:

> Hi Boris,
> 
> Em Mon, 7 May 2018 11:46:50 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> escreveu:
> 
> > Hi Mauro,  
> 
> > > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > > index 5dad59b31244..b986f94906df 100644
> > > --- a/include/linux/mtd/rawnand.h
> > > +++ b/include/linux/mtd/rawnand.h
> > > @@ -740,8 +740,9 @@ enum nand_data_interface_type {
> > >  
> > >  /**
> > >   * struct nand_data_interface - NAND interface timing
> > > - * @type:	type of the timing
> > > - * @timings:	The timing, type according to @type
> > > + * @type:	 type of the timing
> > > + * @timings:	 The timing, type according to @type
> > > + * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.    
> > 
> > Hm, really feels weird to do that. I mean, either we describe
> > timings.sdr or timings, but not both. I this case, I agree that
> > describing timings.sdr would make more sense than generically
> > describing any possible entries in the timings union.  
> 
> This struct is funny, as the union has just one item. I assume
> that the original intend is to be ready to have more timing
> types (or you had it in the past). By the time you have a
> second value there, describing the union would make more
> sense.
> 
> > Is there a simple
> > way we can get rid of the warning we have when not describing timings
> > but all of its fields?  
> 
> There's no direct way. It won't be hard to add a way to do it,
> like applying the enclosed patch with ends by declaring timings as:
> 
> 	* @timings:	 -- undescribed --
> 
> IMHO, this is uglier.

Yep, don't like it either. I'll just take your initial patch.

Thanks,

Boris
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
