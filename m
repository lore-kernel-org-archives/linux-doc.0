Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4E8C6FD1F
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 16:21:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230299AbjCPQVL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 16 Mar 2023 12:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbjCPQVH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 16 Mar 2023 12:21:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FE6D4FF10;
        Thu, 16 Mar 2023 09:20:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B8CC2B82280;
        Thu, 16 Mar 2023 16:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C718C433EF;
        Thu, 16 Mar 2023 16:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678983645;
        bh=h71BjMhOZMMG4djc5Zr7EDNKJL2J78Ensp7aau93MzA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=A9XUQLp0wzDffjwD32BGHTpw79X8+J5ZHHIAYgidV4YNaKm4DVaqXe6P8KGJZ8HCY
         wZZdWAuLDEkHyS39o+iCixyCUylRhULb6s0aiVeZ0O9tIlxCcU5WrepnJxuc5x18JA
         3zVePxd90KnGCKYhITEa2CaivoQN8BR3uu3BOGla8ZumAhgGEPV7HfHuUmCYIvbfWy
         laTDGQMJBF8rOkugU8o/Yy0BkC4O3bq0nrsAkFbj0mns8eSefBRqxX9wjq3i5+jQXB
         8+UTItjt4yy4Lm7tuT9yztoAeQ5vZa4GSn5taKUmiKJQXqQTvQq8GBNkBAcc+j3i0Y
         B0q2AEeTpoYzA==
Date:   Thu, 16 Mar 2023 16:20:37 +0000
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
Subject: Re: [PATCH v2 2/4] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <20230316162037.GW9667@google.com>
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-3-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315110736.35506-3-jpanis@baylibre.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 15 Mar 2023, Julien Panis wrote:

> This patch adds support for TPS6594 PMIC MFD core. It provides
> communication through the I2C and SPI interfaces, and supports
> protocols with embedded CRC data fields for safety applications.
>
> Signed-off-by: Julien Panis <jpanis@baylibre.com>
> ---
>  drivers/mfd/Kconfig         |   32 ++
>  drivers/mfd/Makefile        |    3 +
>  drivers/mfd/tps6594-core.c  |  453 ++++++++++++++++
>  drivers/mfd/tps6594-i2c.c   |  244 +++++++++
>  drivers/mfd/tps6594-spi.c   |  129 +++++
>  include/linux/mfd/tps6594.h | 1020 +++++++++++++++++++++++++++++++++++
>  6 files changed, 1881 insertions(+)
>  create mode 100644 drivers/mfd/tps6594-core.c
>  create mode 100644 drivers/mfd/tps6594-i2c.c
>  create mode 100644 drivers/mfd/tps6594-spi.c
>  create mode 100644 include/linux/mfd/tps6594.h

Once you have the misc Acks, I plan to take this via MFD:

For my own reference (apply this as-is to your sign-off block):

Acked-for-MFD-by: Lee Jones <lee@kernel.org>

--
Lee Jones [李琼斯]
