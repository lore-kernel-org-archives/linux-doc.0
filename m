Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CE67D7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Mon, 20 May 2019 15:37:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391797AbfETPh2 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 20 May 2019 11:37:28 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:50827 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732280AbfETPh2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 May 2019 11:37:28 -0400
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 569C11C000B;
        Mon, 20 May 2019 15:37:12 +0000 (UTC)
Date:   Mon, 20 May 2019 17:37:04 +0200
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Liang Yang <liang.yang@amlogic.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Brian Norris <computersforpeace@gmail.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Mans Rullgard <mans@mansr.com>, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org
Subject: Re: [PATCH 09/10] dt: fix broken references to nand.txt
Message-ID: <20190520173704.202cd65d@xps13>
In-Reply-To: <ce7602ba4d42e094a8b7fcf1dc2a01d25192a602.1558362030.git.mchehab+samsung@kernel.org>
References: <cover.1558362030.git.mchehab+samsung@kernel.org>
        <ce7602ba4d42e094a8b7fcf1dc2a01d25192a602.1558362030.git.mchehab+samsung@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Mauro,

Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote on Mon, 20 May
2019 11:47:38 -0300:

> The Documentation/devicetree/bindings/mtd/nand.txt were both renamed
> and converted to YAML on a single patch, without updating references
> to it. That caused several cross-references to break.
> 
> Fixes: 212e49693592 ("dt-bindings: mtd: Add YAML schemas for the generic NAND options")
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>

Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for fixing it,
Miquèl
