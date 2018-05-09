Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 866B07DE74
	for <lwn-linux-doc@archive.lwn.net>; Wed,  9 May 2018 12:10:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932875AbeEIMKs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 9 May 2018 08:10:48 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:47302 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932318AbeEIMKr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 May 2018 08:10:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=e1ZFidlp1AxlqCxznlBxw2Z1EOSKsL1/ay2/4k9vi6Q=; b=Peo2qYrS2ZU9O+4ie4BPr4Hbr
        RGJbPYIUq40PiaAqBFI2fuuRPCMlBwr9onSgQzp/QzcqnGWXoRvq/61yNy67SdJ9ocXf2MpDdZ+7e
        NM/cHQo06z6eyXI+pxMXsSMaXb1A7yN4PTf5iTy+WUsfexUFBOG2iZ9yzhfaSSCfsrrDJ3XUMPCXc
        I2v9YfrvSlklal/AR9N9KVnVRlEVx+7KL4Za2sUx4dryoLscYG/iRCwor+tEvMeYD1zNWatZPwRt1
        XB/Y4NBQqjhwiZ4t5o4/f+TxEre1jJEqIJJGKaF5OpNSgalj8VNPWQMgYLha3qi3To7V4yzrySJYh
        lQOglUllQ==;
Received: from 177.41.96.165.dynamic.adsl.gvt.net.br ([177.41.96.165] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fGNva-0006Ki-HA; Wed, 09 May 2018 12:10:38 +0000
Date:   Wed, 9 May 2018 09:10:34 -0300
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
Message-ID: <20180509091034.58dadd12@vento.lan>
In-Reply-To: <20180507083232.5a084ba7@vento.lan>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
        <20180507114650.171edcc2@bbrezillon>
        <20180507083232.5a084ba7@vento.lan>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

Em Mon, 7 May 2018 08:32:32 -0300
Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:

> Hi Boris,
> 
> Em Mon, 7 May 2018 11:46:50 +0200
> Boris Brezillon <boris.brezillon@bootlin.com> escreveu:

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

Didn't hear from you. What do you prefer for me to do with regards to
this patch? 

Thanks,
Mauro
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
