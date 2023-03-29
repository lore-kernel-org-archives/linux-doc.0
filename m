Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B229CC74A5B
	for <linux-doc@archiver.kernel.org>; Wed, 29 Mar 2023 14:50:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjC2Ouc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 10:50:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229493AbjC2Oub (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 10:50:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B578D8E;
        Wed, 29 Mar 2023 07:50:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 61542B82105;
        Wed, 29 Mar 2023 14:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 607CCC433D2;
        Wed, 29 Mar 2023 14:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680101428;
        bh=eYl93MUIVFF6BLBKgWr8lqbFVa1ntSPyCl9lEoHchcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C5czJaOJZhcF44+QDVhnXsDcOYQduzOs4tSkaL5cfs1gmL/YOadkgwpwqHvJ882dN
         RdkIO/sMlhAtQYsD2wLrFBj7eumSAP6RBGwjTMyjZcKWI0v8rPfWviJxyV9kJIQbT1
         uMebe+NYahzuRy54PyamPntuF2n6V4416w1YItkO1HPynWU66EtzoS11Za7kYKKf7k
         IGaG6KrX0HI2GFnt6HF2PzLJQl9pH1LeS9AyAgqS1dPr4ErGV203Dmsie7JVAYkIar
         5S9w0QRuLKar2xssmAFx58Au6tCI4BuYT41A+COsYiMLUxMtAmsaKNoytomWlAdfhx
         3j6OEgM5BtP0w==
Date:   Wed, 29 Mar 2023 15:50:20 +0100
From:   Lee Jones <lee@kernel.org>
To:     Julien Panis <jpanis@baylibre.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        corbet@lwn.net, arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
Subject: Re: [PATCH v4 2/4] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <20230329145020.GU2673958@google.com>
References: <20230327154101.211732-1-jpanis@baylibre.com>
 <20230327154101.211732-3-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230327154101.211732-3-jpanis@baylibre.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Mar 2023, Julien Panis wrote:

> This patch adds support for TPS6594 PMIC MFD core. It provides
> communication through the I2C and SPI interfaces, and supports
> protocols with embedded CRC data fields for safety applications.
>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  drivers/mfd/Kconfig         |   32 ++
>  drivers/mfd/Makefile        |    3 +
>  drivers/mfd/tps6594-core.c  |  462 ++++++++++++++++
>  drivers/mfd/tps6594-i2c.c   |  244 +++++++++
>  drivers/mfd/tps6594-spi.c   |  129 +++++
>  include/linux/mfd/tps6594.h | 1020 +++++++++++++++++++++++++++++++++++
>  6 files changed, 1890 insertions(+)
>  create mode 100644 drivers/mfd/tps6594-core.c
>  create mode 100644 drivers/mfd/tps6594-i2c.c
>  create mode 100644 drivers/mfd/tps6594-spi.c
>  create mode 100644 include/linux/mfd/tps6594.h

Note to self: I already Acked this once.

--
Lee Jones [李琼斯]
