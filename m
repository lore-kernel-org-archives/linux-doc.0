Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7D03C433FE
	for <linux-doc@archiver.kernel.org>; Mon,  4 Oct 2021 11:09:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6699613A8
	for <linux-doc@archiver.kernel.org>; Mon,  4 Oct 2021 11:09:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhJDLK4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Oct 2021 07:10:56 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:56927 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229929AbhJDLKz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Oct 2021 07:10:55 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B381D2000F;
        Mon,  4 Oct 2021 11:09:01 +0000 (UTC)
Date:   Mon, 4 Oct 2021 13:09:01 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Cc:     nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        robh+dt@kernel.org, corbet@lwn.net, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        UNGLinuxDriver@microchip.com, Manohar.Puri@microchip.com
Subject: Re: [PATCH 0/4] Add lan966 documentation and remove lan966x.c file
Message-ID: <YVrgzWLReFS5FgWd@piout.net>
References: <20211004105926.5696-1-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004105926.5696-1-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/10/2021 16:29:22+0530, Kavyasree Kotagiri wrote:
> This patch series modifies Kconfig entry, adds documentation for
> lan966 family and removes lan966x setup code file as it is not 
> required. 
> 
> These patches are generated from at91/linux.git
> I had agreement with Nicolas Ferre that he will merge these changes
> into existing patch.
> 

Seems good to me, for the whole series:
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>


> Kavyasree Kotagiri (4):
>   ARM: at91: Kconfig: use only one name SOC_LAN966 and merge options
>   ARM: at91: Documentation: add lan966 family
>   dt-bindings: arm: at91: Document lan966 pcb8291 and pcb8290 boards
>   ARM: at91: remove lan966x file
> 
>  Documentation/arm/microchip.rst               |  6 +++++
>  .../devicetree/bindings/arm/atmel-at91.yaml   | 12 +++++++++
>  arch/arm/mach-at91/Kconfig                    | 12 ++++-----
>  arch/arm/mach-at91/Makefile                   |  1 -
>  arch/arm/mach-at91/lan966x.c                  | 25 -------------------
>  5 files changed, 23 insertions(+), 33 deletions(-)
>  delete mode 100644 arch/arm/mach-at91/lan966x.c
> 
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
