Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8D6267D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 27 Jun 2018 22:14:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966279AbeF0WOe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 27 Jun 2018 18:14:34 -0400
Received: from mail-it0-f65.google.com ([209.85.214.65]:34268 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966231AbeF0WOc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 27 Jun 2018 18:14:32 -0400
Received: by mail-it0-f65.google.com with SMTP id y127-v6so19671647itd.1
        for <linux-doc@vger.kernel.org>; Wed, 27 Jun 2018 15:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=t48og73NKn5S6WkcprbXY6M/vbxx9+9GCvEp/10uwMk=;
        b=iuCDudpiczVFI+Iv29ghMDABU9t4FDV1YfbP7IUllNGShF3TH+NBvwjQgQ+FNf0Jtj
         Dsy6QUGoTAIr4/bZaQx6OJzoklsUyyZQJNJyDDu5gB7U+aw64vaSOibwQ5rUAjeq8fCE
         Jrb2QjrF7vMyXKm2RvDtazNANH3UzB910rQTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t48og73NKn5S6WkcprbXY6M/vbxx9+9GCvEp/10uwMk=;
        b=FkJdwKpNVS1l1w9+jqY2gDqjGAbzPyOV++uX7fJ4ttzvcCrVVFqoduYRNUeGCnhc65
         oXB2xl9Z2DLIadWeajbBf8wn4je64KiV73UTOFyxOU4hxvzAXGJwbYsceyZ9MyDcTtap
         xgGVQFlSU6GzJ3UMhenzIPKL8lxy9yFEaXOI0prIB0glA8bZDFG0u8wEkfsA9DJ5Mp/z
         aREwz/Z1nP9Qw8IU7blu/5JYIO1K21iI6TMfeCfufBYnz1m2bKyVSlr3j1da/bnsDQWi
         Bl3U+BsTFTINc5c0X+itYJX4lqN6jFu2LCy+/boPEBUtKyWE9bqKNVNXgkc6albfmVT/
         ow7g==
X-Gm-Message-State: APt69E3oegZhDxALmh2RsMDqO/JGBIIUz2SVGQni3vOEam/GfDSmreCP
        h3eCmEJg6NZA496Avwzc59aOJ0PY1YZZ8VsDtJYDIA==
X-Google-Smtp-Source: AAOMgpd98xuZ4lQN/P+TyQBgU5aNfPVP9bPNawwYEEMXNdlXn8cKwI/jgdUdyr5aA7lb8Jzm1xSl3/sgxFPfIYKIrNU=
X-Received: by 2002:a24:5746:: with SMTP id u67-v6mr6432912ita.38.1530137672129;
 Wed, 27 Jun 2018 15:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20180622104930.32050-1-boris.brezillon@bootlin.com> <20180622104930.32050-10-boris.brezillon@bootlin.com>
In-Reply-To: <20180622104930.32050-10-boris.brezillon@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 28 Jun 2018 00:14:20 +0200
Message-ID: <CACRpkdYmR3+urDk6StG7s=W3=oYHB6eqs7ORdMV=-S31QtOAqQ@mail.gmail.com>
Subject: Re: [PATCH v5 09/10] gpio: Add a driver for Cadence I3C GPIO expander
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Greg KH <gregkh@linuxfoundation.org>,
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
        ext Nishanth Menon <nm@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "Nori, Sekhar" <nsekhar@ti.com>, pgaj@cadence.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 22, 2018 at 12:49 PM Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Add a driver for Cadence I3C GPIO expander.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

If you need to merge this through the subsystem merge.

I see there was some heat in this discussion between you
and Andy, and it seems to be resolved. Which is good
because you are both senior contributors that I value
a lot.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
