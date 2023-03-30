Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8494DC6FD1D
	for <linux-doc@archiver.kernel.org>; Thu, 30 Mar 2023 17:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjC3RLI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Mar 2023 13:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232178AbjC3RLA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Mar 2023 13:11:00 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEC7AEB63;
        Thu, 30 Mar 2023 10:10:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A6F8D6212C;
        Thu, 30 Mar 2023 17:10:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49867C433EF;
        Thu, 30 Mar 2023 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1680196212;
        bh=Ff05YU+OXdwBxx5FHkJBKPbVv/qmWBEzp2lfTR+HLwo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d7FDU4Sq0GIHZNVN99MPeicNFv/d31zDuq4G5810smpAgLUMmZqbPaVTxB24xFeoJ
         IdY+5S+50BnN0Wzh1okRUFWMh/GbPmLGdBlFelETeSi5lcaOPYJXGI4VlO2VshKH2j
         iu2fYntuUC3ddBrDdK2s9J7sdJN7xSsnCwIbUpDmSwPgAJs2lewKcTZ5zJPSqeKTLX
         W4m/3euvqupWyoHljsVualAh22OupGaA886CviwtSp42+XBE2fWCG9Qe4D7FMyvrxo
         nlQW/qks3dTFp/45nJLxRSb8QxacRiVeEQY0u6t1snX4rvWyqdDtrDJMhyRDYIDL7H
         wzLrjdNocZ0TQ==
Date:   Thu, 30 Mar 2023 18:10:05 +0100
From:   Lee Jones <lee@kernel.org>
To:     Julien Panis <jpanis@baylibre.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        corbet@lwn.net, arnd@arndb.de, gregkh@linuxfoundation.org,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        yi.l.liu@intel.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, prabhakar.csengg@gmail.com,
        contact@emersion.fr, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        sterzik@ti.com, u-kumar1@ti.com, eblanc@baylibre.com,
        jneanne@baylibre.com
Subject: Re: [PATCH v5 0/4] TI TPS6594 PMIC support (Core, ESM, PFSM)
Message-ID: <20230330171005.GC548901@google.com>
References: <20230330082006.11216-1-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230330082006.11216-1-jpanis@baylibre.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 30 Mar 2023, Julien Panis wrote:

> TPS6594 is a Power Management IC which provides regulators and others
> features like GPIOs, RTC, watchdog, ESMs (Error Signal Monitor), and
> PFSM (Pre-configurable Finite State Machine). The SoC and the PMIC can
> communicate through the I2C or SPI interfaces.
> TPS6594 is the super-set device while TPS6593 and LP8764 are derivatives.

Note to future me: once the misc drivers are good to go, route through MFD.

--
Lee Jones [李琼斯]
