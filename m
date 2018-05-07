Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,T_DKIM_INVALID autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 325EA7DE74
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 11:32:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752120AbeEGLck (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 07:32:40 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:59842 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752049AbeEGLcj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 07:32:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
        From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=WWk71Wva51AHX30uzcIfTiFjfCSCIzqvclxC2mXb6wU=; b=eMYYWlzJdeEdfIdMNbNsyY47T
        ofISnFyfqsFSump7jXY+8EzN9SdB7xexmnFdGlPyfqUASvMpgfc1cUpMIOaHh8S+z6B4H2TIAqFQV
        HuWtzFFIHJxlfGr0XmmMoBcrKgKSoS5sn5+2DQ+w6LR2yy/RB+ByrBx2jFRyP+/SmDqQ86yfayBOH
        1UJLGZhlZR0nw0II9fyYnjIgNgU2/FEmeKKwRcC8iH4EumAlzqMWGqWOValqzEiG4euQTNo8X/xi0
        T0M3JuPnyJgzD7BjUVuvekeRhmQEcnwSWkBtJY9l8gNNrrNqE0KcCGb3sPAAATZZLJcuCVGr+dPGA
        zhELDuKzQ==;
Received: from 177.41.109.86.dynamic.adsl.gvt.net.br ([177.41.109.86] helo=vento.lan)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fFeNg-0007DD-NA; Mon, 07 May 2018 11:32:37 +0000
Date:   Mon, 7 May 2018 08:32:32 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
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
Message-ID: <20180507083232.5a084ba7@vento.lan>
In-Reply-To: <20180507114650.171edcc2@bbrezillon>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
        <39d8d4f0e0ff5a06be0303f7f4f2eac5fb45b9ca.1525684985.git.mchehab+samsung@kernel.org>
        <20180507114650.171edcc2@bbrezillon>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

Em Mon, 7 May 2018 11:46:50 +0200
Boris Brezillon <boris.brezillon@bootlin.com> escreveu:

> Hi Mauro,

> > diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
> > index 5dad59b31244..b986f94906df 100644
> > --- a/include/linux/mtd/rawnand.h
> > +++ b/include/linux/mtd/rawnand.h
> > @@ -740,8 +740,9 @@ enum nand_data_interface_type {
> >  
> >  /**
> >   * struct nand_data_interface - NAND interface timing
> > - * @type:	type of the timing
> > - * @timings:	The timing, type according to @type
> > + * @type:	 type of the timing
> > + * @timings:	 The timing, type according to @type
> > + * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.  
> 
> Hm, really feels weird to do that. I mean, either we describe
> timings.sdr or timings, but not both. I this case, I agree that
> describing timings.sdr would make more sense than generically
> describing any possible entries in the timings union.

This struct is funny, as the union has just one item. I assume
that the original intend is to be ready to have more timing
types (or you had it in the past). By the time you have a
second value there, describing the union would make more
sense.

> Is there a simple
> way we can get rid of the warning we have when not describing timings
> but all of its fields?

There's no direct way. It won't be hard to add a way to do it,
like applying the enclosed patch with ends by declaring timings as:

	* @timings:	 -- undescribed --

IMHO, this is uglier.

The way I see is that, if the embed struct/union is not interesting
enough to be described, the best would be to use an anonymous one like:

	struct nand_data_interface {
		enum nand_data_interface_type type;
		union {
			struct nand_sdr_timings sdr;
		};
	};

With the above, kernel-doc will expect a description just for @sdr.

Btw, if you want to see how nested struct/union is parsed, the
scripts/kernel_doc logic is at dump_struct() function.

When it finds an struct, it first handles private/public by simply
removing everything that it is not public from the struct, by a
very simple parser. Then, it converts nested struct/union into
un-nested ones. E. g. it converts:

	struct {
		union {
			int foo1;
		};
		union {
			int foo2;
		} bar;
	} foobar;

into this internal representation:

	struct {
		int foo1;
		union;
		int bar.foo2;
		union bar;
	};

Then it runs the normal un-nested struct parser.


Thanks,
Mauro

[PATCH] don't describe nested struct timings

IMHO, this is an ugly hack, but it allows having nested
structs (or fields) undescribed by purpose.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

diff --git a/include/linux/mtd/rawnand.h b/include/linux/mtd/rawnand.h
index b986f94906df..b724c7edf532 100644
--- a/include/linux/mtd/rawnand.h
+++ b/include/linux/mtd/rawnand.h
@@ -741,7 +741,7 @@ enum nand_data_interface_type {
 /**
  * struct nand_data_interface - NAND interface timing
  * @type:	 type of the timing
- * @timings:	 The timing, type according to @type
+ * @timings:	 -- undescribed --
  * @timings.sdr: Use it when @type is %NAND_SDR_IFACE.
  */
 struct nand_data_interface {
diff --git a/scripts/kernel-doc b/scripts/kernel-doc
index 0057d8eafcc1..196a2107c8c1 100755
--- a/scripts/kernel-doc
+++ b/scripts/kernel-doc
@@ -390,7 +390,7 @@ my $section = $section_default;
 my $section_context = "Context";
 my $section_return = "Return";
 
-my $undescribed = "-- undescribed --";
+my $undescribed = "-- undescribed --\n";
 
 reset_state();
 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
