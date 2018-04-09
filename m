Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 936C27E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 20:24:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754452AbeDIUYa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 16:24:30 -0400
Received: from mail-oi0-f66.google.com ([209.85.218.66]:45711 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754273AbeDIUY2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 16:24:28 -0400
Received: by mail-oi0-f66.google.com with SMTP id 71-v6so8950466oie.12;
        Mon, 09 Apr 2018 13:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=nD9lyAXOzwIy9aA8xzn/IhttWXwLhCwGD1MqNbmEHpA=;
        b=cPBVaFG4mMV616l0CVYRLNp37n0dm+WgAqO1xC+Ip7Exa+YwaMSqiczrFx/q1ccTvS
         L5arFCDVZrqnyhC3yykslwV8pxfpgO5ffeie/Z9e5skF7AYvvNfUT7OKj8bG5kIOVFZh
         QZ1seCb/fFGMvjlwXvUstxXkQkz4imm0qbgddjR29AZMHthqaF5Auy9IwvFu98QrVLui
         9EZeFybFGOiR89ixfID6S4LYmTCVCubXWza5+DvhggaZQDGeB2H8/N/KykwZr3KbLgJB
         HpSxVFK+IGbP0W9IKiUKR/lweH/jd4gSYpuiveiXvTMfPrAcle45NbaiVelm6ddvvQCC
         9rKw==
X-Gm-Message-State: ALQs6tCK/afc7FOZmACYNJBgM8aUInbKP8sqNsgphfPzsMGp52AbKaGU
        cFeUBR4yLP/WMNUyZoTOVw==
X-Google-Smtp-Source: AIpwx4+oueKdVErriKAf4VRM8xWNmbFB8VBhqanPb5QW9xnQJ2yJidSyz/S4sx0yiQLuMa4wQ37p4Q==
X-Received: by 2002:aca:b5c2:: with SMTP id e185-v6mr294488oif.166.1523305467893;
        Mon, 09 Apr 2018 13:24:27 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id a26-v6sm622461otf.46.2018.04.09.13.24.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Apr 2018 13:24:27 -0700 (PDT)
Date:   Mon, 9 Apr 2018 15:24:26 -0500
From:   Rob Herring <robh@kernel.org>
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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
        Nishanth Menon <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 04/10] dt-bindings: i3c: Document core bindings
Message-ID: <20180409202426.grl62ydysfse27ly@rob-hp-laptop>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-5-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180330074751.25987-5-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 09:47:45AM +0200, Boris Brezillon wrote:
> A new I3C subsystem has been added and a generic description has been
> created to represent the I3C bus and the devices connected on it.
> 
> Document this generic representation.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v4:
> - Clarify the fact that static address == I3C address and dynamic
>   address == I3C address
> - Use i2c-scl-hz in the example
> 
> Changes in v3:
> - Rename {i2c,i3c}-scl-frequency DT prop into {i2c,i3c}-scl-hz
> - Rework the way we expose the provisional ID and LVR information
> - Rename dynamic-address into assigned-address
> - Enforce the I3C master node name
> 
> Changes in v2:
> - Define how to describe I3C devices in the DT and when it should be
>   used. Note that the parsing of I3C devices is not yet implemented in
>   the framework. Will be added when someone really needs it.
> ---
>  Documentation/devicetree/bindings/i3c/i3c.txt | 140 ++++++++++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/i3c.txt

Reviewed-by: Rob Herring <robh@kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
