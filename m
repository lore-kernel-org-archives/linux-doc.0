Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B524DC61DA4
	for <linux-doc@archiver.kernel.org>; Wed, 15 Mar 2023 11:35:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjCOLfr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 07:35:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231504AbjCOLf1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 07:35:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62D691E9DF;
        Wed, 15 Mar 2023 04:34:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6BA81B818E7;
        Wed, 15 Mar 2023 11:34:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAF2EC433D2;
        Wed, 15 Mar 2023 11:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1678880089;
        bh=DkN8+5TAyEZUWL+rBe778x9Ih1mzAhT3eM0Oe0+aTXM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KH+101ZMTqJgfpFD12xDL+3dY8j3RGXchEriC91Rd2CoVCcIrTnBKqyFvsKfckuLN
         DM20LGsFMwiuwazW8rNdWc/A2JHLAAlFQ7KUzKe3p+QNQ+oaHkh1dC8HD3LLLFvL0S
         C5bzIT9xOon46lCrkkzLVL+eX0i6aVbPxzsKyLFU=
Date:   Wed, 15 Mar 2023 12:34:46 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Julien Panis <jpanis@baylibre.com>
Cc:     lee@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, corbet@lwn.net, arnd@arndb.de,
        derek.kiernan@xilinx.com, dragan.cvetic@xilinx.com,
        eric.auger@redhat.com, jgg@ziepe.ca, razor@blackwall.org,
        stephen@networkplumber.org, davem@davemloft.net,
        christian.koenig@amd.com, contact@emersion.fr,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, sterzik@ti.com, u-kumar1@ti.com,
        eblanc@baylibre.com, jneanne@baylibre.com
Subject: Re: [PATCH v2 4/4] misc: tps6594-pfsm: Add driver for TI TPS6594 PFSM
Message-ID: <ZBGtVuI6YTfENUNr@kroah.com>
References: <20230315110736.35506-1-jpanis@baylibre.com>
 <20230315110736.35506-5-jpanis@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230315110736.35506-5-jpanis@baylibre.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 15, 2023 at 12:07:36PM +0100, Julien Panis wrote:
> +// SPDX-License-Identifier: GPL-2.0-or-later

Are you sure about "or-later"?  (I have to ask.)

> +/*
> + * PFSM (Pre-configurable Finite State Machine) driver for TI TPS6594/TPS6593/LP8764X PMICs
> + *
> + * Copyright (C) 2022 BayLibre Incorporated - https://www.baylibre.com/

It's 2023 now :)

