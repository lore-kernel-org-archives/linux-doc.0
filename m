Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E41BC74A5B
	for <linux-doc@archiver.kernel.org>; Wed, 29 Mar 2023 14:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229592AbjC2Ot2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 29 Mar 2023 10:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230160AbjC2OtT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Mar 2023 10:49:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C16B519D;
        Wed, 29 Mar 2023 07:49:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 583E0B820FE;
        Wed, 29 Mar 2023 14:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C3FC433EF;
        Wed, 29 Mar 2023 14:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680101353;
        bh=QuzV0WgZUW+Ce90V+f1GNE1s5sG5A2f8PEgj3MX3I2o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hILp44YByGwuSIDgnacysUdAkWzZyYTKTTwGUhg0utt48W1WGsXrQY50adiiTkCLH
         48RXVMoID+VOKaQFwsw5zDuxuPelYhNFqX09aBu67LAGSjG/eblbUkfYERZ0TTlaN1
         +CER1E1NekhXP2KJvBJbnx6DKQe+o99zV6MGKd0RiY0xzPHiiMhKqC8Iwwsjb3FaOs
         vHRmtGfrv62bcSJT/teg+Diyhd+j/uvDJgSzC5NvO4sYWJ1re+WpqDybVaUMlI8ABo
         eH+028WfqfvSI/5HTrbhS6w2yDLGPscoYW/YhxqWHVMKquR5tdUdOB3kSNms+vSZ/K
         AqAtWTC6/O9KA==
Date:   Wed, 29 Mar 2023 15:49:04 +0100
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
Subject: Re: [PATCH v3 2/4] mfd: tps6594: Add driver for TI TPS6594 PMIC
Message-ID: <20230329144904.GT2673958@google.com>
References: <20230321171020.74736-1-jpanis@baylibre.com>
 <20230321171020.74736-3-jpanis@baylibre.com>
 <2ea21982-485a-d052-2e25-84907e263743@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ea21982-485a-d052-2e25-84907e263743@baylibre.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 27 Mar 2023, Julien Panis wrote:

>
>
> On 3/21/23 18:10, Julien Panis wrote:
> > This patch adds support for TPS6594 PMIC MFD core. It provides
> > communication through the I2C and SPI interfaces, and supports
> > protocols with embedded CRC data fields for safety applications.
> >
> > Signed-off-by: Julien Panis <jpanis@baylibre.com>
> > Acked-for-MFD-by: Lee Jones <lee@kernel.org>
>
> Lee, I will have to drop your ack for next version (v4).
> A bug will be fixed in tps6594-core (a couple of lines
> will be added/moved in 2 functions, it will be explained
> in the coverletter changelog so that you can easily see
> the diff).
> Sorry for the disturbance.

No problem.

--
Lee Jones [李琼斯]
