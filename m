Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8327DEEB572
	for <linux-doc@archiver.kernel.org>; Sat,  9 Sep 2023 13:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236824AbjIINjO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 9 Sep 2023 09:39:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbjIINjO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 9 Sep 2023 09:39:14 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E45712B;
        Sat,  9 Sep 2023 06:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=HEzpc/wFNtRlWx6dkkmtUTFN1AjVgvA0xk6/OPsxd3c=; b=BpA4xifNkYPuvrRG3hyTzjeRul
        5VAmhZmyO6AWr1/WrivFYeu/c/Pi5jFyJA7HOj6WWeAcAUAw56YjblNLVDnUoIP8vKW7dxTYwv3Sk
        V9ajccPPDpG4F3weWsBTFt7xthiSiF0/6FyUvVe7fZpuQvgLMliZ99oVHfiVAKMgMz/g=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1qeyAu-0063u2-4W; Sat, 09 Sep 2023 15:39:00 +0200
Date:   Sat, 9 Sep 2023 15:39:00 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>
Cc:     davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
        pabeni@redhat.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        corbet@lwn.net, steen.hegelund@microchip.com,
        rdunlap@infradead.org, horms@kernel.org, casper.casan@gmail.com,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        horatiu.vultur@microchip.com, Woojung.Huh@microchip.com,
        Nicolas.Ferre@microchip.com, UNGLinuxDriver@microchip.com,
        Thorsten.Kummermehr@microchip.com
Subject: Re: [RFC PATCH net-next 2/6] net: ethernet: add mac-phy interrupt
 support with reset complete handling
Message-ID: <28dce908-3a87-48c8-b181-d859697c0152@lunn.ch>
References: <20230908142919.14849-1-Parthiban.Veerasooran@microchip.com>
 <20230908142919.14849-3-Parthiban.Veerasooran@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230908142919.14849-3-Parthiban.Veerasooran@microchip.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +	/* Register MAC-PHY interrupt service routine */
> +	ret = devm_request_irq(&spi->dev, spi->irq, macphy_irq, 0, "macphy int",
> +			       tc6);

It looks like using threaded interrupts could save a lot of
complexity. Let the IRQ core handle all the tasklet stuff for you.

	Andrew
