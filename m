Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9DB0C433FE
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 18:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229815AbiJCSBP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229660AbiJCSBO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 14:01:14 -0400
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A092237E9;
        Mon,  3 Oct 2022 11:01:13 -0700 (PDT)
Received: by mail-oi1-f181.google.com with SMTP id n83so12072218oif.11;
        Mon, 03 Oct 2022 11:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=m1zFXN2JJGvZeq/8qjss/E/W9fw3IBmQxvPNQVYVDx4=;
        b=6nmFJwpl67cRyrsCYlW1eIBgZkXoXzuEiXBT4m3U4fEneN+HPGgLNTiAv6XDyvhx2Q
         s8H4xcHI1aFFhvLZ3O4zGi+GuVCQeANlSRccEyJ2cSmNE+ABITiRNlybA8Mb2ZnUhIcw
         Me3qLfrRZce0ZFwi97M2hI4Oxl1km34JzX4u1DB+paudc01Dm7WIBAbNbh4f5u2yHmrI
         kPwwu7W206Hxjb4q51E0nJhWZlP+T1nHp+q7jyK04QlgqtdYeOZIa8jGRLmHbB81bcFX
         5vmu36R6EVKHO3mT95t62LqpF46hmxzf6yKycMpMn0Bf92DeQLwJqnSKg9mhZveveVM6
         xzsA==
X-Gm-Message-State: ACrzQf0Y1F6EQuK+UPCp0lGCYZ0TSaNLvTPFxbNsmliGgzRwoZc5fpwP
        DSBYJutEJEZBPSBbyqfIfw==
X-Google-Smtp-Source: AMsMyM4PAICfXmmI1z1IcWuhxgQ56/ikvQR6/qr9KoVdamltyOh1R2hTtCH5TioIaOMy2uO2qhegbw==
X-Received: by 2002:a05:6808:bca:b0:350:b366:157 with SMTP id o10-20020a0568080bca00b00350b3660157mr4592151oik.3.1664820072465;
        Mon, 03 Oct 2022 11:01:12 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id z10-20020a05683010ca00b0065742df07e2sm2550027oto.26.2022.10.03.11.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 11:01:11 -0700 (PDT)
Received: (nullmailer pid 2514797 invoked by uid 1000);
        Mon, 03 Oct 2022 18:01:10 -0000
Date:   Mon, 3 Oct 2022 13:01:10 -0500
From:   Rob Herring <robh@kernel.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Paolo Abeni <pabeni@redhat.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        Robert Marko <robert.marko@sartura.hr>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        David Jander <david@protonic.nl>,
        Luka Perkov <luka.perkov@sartura.hr>,
        Andrew Lunn <andrew@lunn.ch>, linux-kernel@vger.kernel.org,
        Jakub Kicinski <kuba@kernel.org>,
        Russell King <linux@armlinux.org.uk>, kernel@pengutronix.de,
        "David S. Miller" <davem@davemloft.net>,
        devicetree@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH net-next v8 1/7] dt-bindings: net: phy: add PoDL PSE
 property
Message-ID: <166482007034.2514738.15249257928598328667.robh@kernel.org>
References: <20221003065202.3889095-1-o.rempel@pengutronix.de>
 <20221003065202.3889095-2-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221003065202.3889095-2-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 03 Oct 2022 08:51:56 +0200, Oleksij Rempel wrote:
> Add property to reference node representing a PoDL Power Sourcing Equipment.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> changes v5:
> - rename ieee802.3-pse to pses
> - rename phandle-array to phandle
> - add maxItems: 1
> ---
>  Documentation/devicetree/bindings/net/ethernet-phy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
