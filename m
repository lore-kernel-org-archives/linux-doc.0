Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E67C7D04D
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 Jan 2019 09:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfA1JuY convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 Jan 2019 04:50:24 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:42313 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726521AbfA1JuY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Jan 2019 04:50:24 -0500
X-Originating-IP: 90.88.29.206
Received: from xps13 (aaubervilliers-681-1-87-206.w90-88.abo.wanadoo.fr [90.88.29.206])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id A8EA860017;
        Mon, 28 Jan 2019 09:50:20 +0000 (UTC)
Date:   Mon, 28 Jan 2019 10:50:19 +0100
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Boris Brezillon <bbrezillon@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-mtd@lists.infradead.org,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: fix kernel-doc warnings
Message-ID: <20190128105019.5aa8edeb@xps13>
In-Reply-To: <20190128104319.7a9effde@bbrezillon>
References: <21d5edd7-1335-2731-6d53-5b15d053462c@infradead.org>
        <20190128104319.7a9effde@bbrezillon>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

Boris Brezillon <bbrezillon@kernel.org> wrote on Mon, 28 Jan 2019
10:43:38 +0100:

> On Sun, 27 Jan 2019 18:21:42 -0800
> Randy Dunlap <rdunlap@infradead.org> wrote:
> 
> > From: Randy Dunlap <rdunlap@infradead.org>
> > 
> > Fix kernel-doc warnings in drivers/mtd/nand/raw:

With the prefix changed to "mtd: rawnand:"

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>


Thanks,
Miquèl
