Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B1DD7D00B
	for <lwn-linux-doc@archive.lwn.net>; Tue, 28 Aug 2018 13:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728116AbeH1Qz1 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 28 Aug 2018 12:55:27 -0400
Received: from mail.bootlin.com ([62.4.15.54]:44977 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727212AbeH1Qz1 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 28 Aug 2018 12:55:27 -0400
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 87F6B207AD; Tue, 28 Aug 2018 15:03:51 +0200 (CEST)
Received: from bbrezillon (AAubervilliers-681-1-53-19.w90-88.abo.wanadoo.fr [90.88.170.19])
        by mail.bootlin.com (Postfix) with ESMTPSA id D86EF2072D;
        Tue, 28 Aug 2018 15:03:50 +0200 (CEST)
Date:   Tue, 28 Aug 2018 15:03:49 +0200
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Przemyslaw Gaj <pgaj@cadence.com>
Cc:     vitor <Vitor.Soares@synopsys.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>, Wolfram Sang <wsa@the-dreams.de>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
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
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        Peter Rosin <peda@axentia.se>
Subject: Re: [PATCH v6 01/10] i3c: Add core I3C infrastructure
Message-ID: <20180828150349.1971222b@bbrezillon>
In-Reply-To: <4DBE768F-3CDC-41BE-9CC8-E294E7277CB1@cadence.com>
References: <20180719152930.3715-1-boris.brezillon@bootlin.com>
        <20180719152930.3715-2-boris.brezillon@bootlin.com>
        <d2f40cc2-b344-69d1-4314-83524ad7b178@synopsys.com>
        <20180824143934.6d6b6487@bbrezillon>
        <bdb2924f-ecfa-1da3-41db-9ac77d4d933b@synopsys.com>
        <20180824201600.7d80bca9@bbrezillon>
        <fe839027-c4d7-4d6f-412b-5b315cbc7a39@synopsys.com>
        <20180828140209.29155d00@bbrezillon>
        <4DBE768F-3CDC-41BE-9CC8-E294E7277CB1@cadence.com>
X-Mailer: Claws Mail 3.15.0-dirty (GTK+ 2.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 28 Aug 2018 12:55:20 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> Hi Vitor,
> 
> I have already implemented Mastership request/handover but we are
> waiting for Boris’s patch to be accepted and merged.

My bad. I didn't have time to work on the bus/master rework suggested
by Arnd before going on vacation. I hope I'll be able to work on that
soon.
