Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A0DDF7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 20:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754569AbeDIU0N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 16:26:13 -0400
Received: from mail-ot0-f181.google.com ([74.125.82.181]:36347 "EHLO
        mail-ot0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754270AbeDIU0M (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 16:26:12 -0400
Received: by mail-ot0-f181.google.com with SMTP id n40-v6so10172837otd.3;
        Mon, 09 Apr 2018 13:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=0amWzqW/FHLqypWUnlrt3ApmERgAEnTe+kwFOUB3XJU=;
        b=Q5kLYT1EGEJK44mUpr+y0jI4WDNyncwaa4Q8Nejjta+bxVkna/5aS6U2txIIw3ArRP
         OtqXcgVzCXBA9FBckYUF/thry3xM1FhCw8qX9fClNuGwvtEinO6dJdr2ySZshJ1oeGRA
         95HS/iIRKFyZKX+wLFPHTl6ReYYPfGXsKVc6nkaLw7w8T8zEQu+MlYrU1fihEC8GG13d
         HfWQBAFUXSuEiHrQt2O2YTNDO9iaM1iGA1cXekAHwg8q4AvPsdOAyL5L1rZKrNQu0Io9
         aORzXgjtIwcwEWQd/HgfqZhhfKy7277/US8UwHOXs7HquTNp2P/WXyujlyNRTGUBWhSS
         JnhQ==
X-Gm-Message-State: ALQs6tBIl+5eyN/qZFATx3wJB3oH8X8xhxqqBt+07uS3jMlFYwjSHVu4
        pT9GHzsf5z8H8rcOaMCcsRycNUldFQ==
X-Google-Smtp-Source: AIpwx48bDr0J9frlFbCMmH5AsfW2uvFyCUHQ5x0aFXHELwZEDlbHNZfShQ8lcubdlUSWmOx5NPu8TQ==
X-Received: by 2002:a9d:5389:: with SMTP id w9-v6mr12346232otg.213.1523305571289;
        Mon, 09 Apr 2018 13:26:11 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id v55-v6sm769896otf.10.2018.04.09.13.26.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Apr 2018 13:26:10 -0700 (PDT)
Date:   Mon, 9 Apr 2018 15:26:10 -0500
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
Subject: Re: [PATCH v4 10/10] dt-bindings: gpio: Add bindings for Cadence I3C
 gpio expander
Message-ID: <20180409202610.2ckwi4ekswiaumym@rob-hp-laptop>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-11-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180330074751.25987-11-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 09:47:51AM +0200, Boris Brezillon wrote:
> Document the Cadence I3C gpio expander bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v4:
> - Use GPIO_ and IRQ_TYPE_ macros instead of raw numbers
> - Fix the unit-address in the example
> ---
>  .../devicetree/bindings/gpio/gpio-cdns-i3c.txt     | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt

Reviewed-by: Rob Herring <robh@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
