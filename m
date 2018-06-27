Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 018737D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Jun 2018 23:04:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751980AbeF0XEV (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 19:04:21 -0400
Received: from smtprelay0237.hostedemail.com ([216.40.44.237]:58455 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1751891AbeF0XEV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jun 2018 19:04:21 -0400
X-Greylist: delayed 592 seconds by postgrey-1.27 at vger.kernel.org; Wed, 27 Jun 2018 19:04:20 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave03.hostedemail.com (Postfix) with ESMTP id 80809181CBC3A
        for <linux-doc@vger.kernel.org>; Wed, 27 Jun 2018 22:54:29 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay08.hostedemail.com (Postfix) with ESMTP id E7AD3182CED34;
        Wed, 27 Jun 2018 22:54:27 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: table68_92b5c436ce36
X-Filterd-Recvd-Size: 3213
Received: from XPS-9350.home (unknown [47.151.153.53])
        (Authenticated sender: joe@perches.com)
        by omf07.hostedemail.com (Postfix) with ESMTPA;
        Wed, 27 Jun 2018 22:54:22 +0000 (UTC)
Message-ID: <8bf36e4025b6ec5198a668edda6bcbef3b06e97b.camel@perches.com>
Subject: Re: [PATCH v5 09/10] gpio: Add a driver for Cadence I3C GPIO
 expander
From:   Joe Perches <joe@perches.com>
To:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Marc Zyngier <marc.zyngier@arm.com>
Date:   Wed, 27 Jun 2018 15:54:21 -0700
In-Reply-To: <20180627213617.51e10712@bbrezillon>
References: <20180622104930.32050-1-boris.brezillon@bootlin.com>
         <20180622104930.32050-10-boris.brezillon@bootlin.com>
         <CAHp75Vdxg49q6aQj0dDpzM4q2WnQbGoCECWR1roda7aMR+u4gg@mail.gmail.com>
         <20180626215648.1472b96e@bbrezillon>
         <CAHp75VcVvOzgOM87rSrwsCxh+WAK-z+zVCJifnY+Xeeu=cPFiA@mail.gmail.com>
         <20180626234638.076fb816@bbrezillon>
         <CAHp75VdBXj66Yd6sQHOWz19R9MUtYMSeq4j-+UidLedpfkB6mA@mail.gmail.com>
         <20180627213617.51e10712@bbrezillon>
Content-Type: text/plain; charset="ISO-8859-1"
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2018-06-27 at 21:36 +0200, Boris Brezillon wrote:
> I mean, kzalloc() is not deprecated AFAIK and I don't really see the
> benefit of using kmalloc_array(), but if that makes you happy, let's go
> for kmalloc_array().

kcalloc

> I do run checkpatch --strict and fix most of the thing reported except
> those hurting readability. I don't remember seeing checkpatch complain
> about kzalloc() usage, and I guess it's not smart enough to detect that
> for_each_bit_set() can be used to replace the "for() if (BIT(x) & val)"
> pattern.

That would not an appropriate conversion suggestion in any case.
coccinelle could at least look at whether or not x is allocated
as a bitmap via DECLARE_BITMAP or bitmap_alloc


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
