Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFDB17D089
	for <lwn-linux-doc@archive.lwn.net>; Mon, 12 Nov 2018 09:13:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbeKLTFX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 12 Nov 2018 14:05:23 -0500
Received: from mail.bootlin.com ([62.4.15.54]:41161 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727036AbeKLTFX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 12 Nov 2018 14:05:23 -0500
Received: by mail.bootlin.com (Postfix, from userid 110)
        id 62B6420798; Mon, 12 Nov 2018 10:13:03 +0100 (CET)
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
        by mail.bootlin.com (Postfix) with ESMTPSA id 83DBD20711;
        Mon, 12 Nov 2018 10:12:52 +0100 (CET)
Date:   Mon, 12 Nov 2018 10:12:52 +0100
From:   Boris Brezillon <boris.brezillon@bootlin.com>
To:     Vitor soares <vitor.soares@synopsys.com>
Cc:     wsa@the-dreams.de, linux-i2c@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
        arnd@arndb.de, psroka@cadence.com, agolec@cadence.com,
        adouglas@cadence.com, bfolta@cadence.com, dkos@cadence.com,
        alicja@cadence.com, cwronka@cadence.com, sureshp@cadence.com,
        rafalc@cadence.com, thomas.petazzoni@bootlin.com, nm@ti.com,
        robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
        ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        geert@linux-m68k.org, linus.walleij@linaro.org,
        Xiang.Lin@synaptics.com, linux-gpio@vger.kernel.org,
        nsekhar@ti.com, pgaj@cadence.com, peda@axentia.se,
        mshettel@codeaurora.org, swboyd@chromium.org,
        joao.pinto@synopsys.com
Subject: Re: [PATCH v3 0/3] Add driver for Synopsys DesignWare I3C master IP
Message-ID: <20181112101252.51435335@bbrezillon>
In-Reply-To: <1541697251-20392-1-git-send-email-soares@synopsys.com>
References: <1541697251-20392-1-git-send-email-soares@synopsys.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu,  8 Nov 2018 17:14:08 +0000
Vitor soares <vitor.soares@synopsys.com> wrote:

> This patch series is a proposal for the I3C master driver for Synopsys IP.
> This patch is to be applied on top of I3C subsystem RFC V10 submitted by
> Boris Brezillon.

The patch series looks to me. I'm just waiting an ack from Rob on the
bindings to queue it to the i3c/next branch.

Thanks,

Boris

> 
> Supported features:
>   Regular CCC commands.
>   I3C private transfers.
>   I2C transfers.
> 
> Missing functionalities:
>   Support DMA interface.
>   Support for I3C_BUS_MODE_MIXED_SLOW.
>   Hot-join.
>   IBI.
> 
> Main change between v2 and v3:
> - Minor fixes. They are described in each patch
> 
> Main change between v1 and v2:
> - Add controller version on dt-binding
> - The driver now calls writesl/readsl() instead readl/writel
> - Rename some variables in the driver
> 
> Vitor soares (3):
>   i3c: master: Add driver for Synopsys DesignWare IP
>   dt-bindings: i3c: Document Synopsys DesignWare I3C master bindings
>   MAINTAINERS: Add myself as the dw-i3c-master module maintainer
> 
>  .../devicetree/bindings/i3c/snps,dw-i3c-master.txt |   42 +
>  MAINTAINERS                                        |    6 +
>  drivers/i3c/master/Kconfig                         |   15 +
>  drivers/i3c/master/Makefile                        |    1 +
>  drivers/i3c/master/dw-i3c-master.c                 | 1216 ++++++++++++++++++++
>  5 files changed, 1280 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.txt
>  create mode 100644 drivers/i3c/master/dw-i3c-master.c
> 

