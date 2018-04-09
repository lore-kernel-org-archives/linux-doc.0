Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0F47B7E22E
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Apr 2018 20:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754105AbeDIUZ0 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Apr 2018 16:25:26 -0400
Received: from mail-oi0-f43.google.com ([209.85.218.43]:42038 "EHLO
        mail-oi0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752369AbeDIUZY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Apr 2018 16:25:24 -0400
Received: by mail-oi0-f43.google.com with SMTP id l190-v6so8946597oig.9;
        Mon, 09 Apr 2018 13:25:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=75LEPbVu5ri5dixdUFcrqokMMTlWbKwNBAa/U5hLSJ8=;
        b=h/DsYTsvVCHm+E/XaEN+FDM59Qt7sWMk/AWmo83Juz5P2COSxnoiwDFs7sZH0l5AgC
         dvSANfZIL4Vn2GFCOb8ZHDQM2SkRbzOplDoaEBNA+TFB1C5uz5kbJRiqRfrsuuBeUQCx
         hW6PWTeq8yBF48PZ/8o0u3gwjXZw2jMbRh+TnvMgKzl4bnox0fTDl8I0gvl/xXvpG0bt
         25zUt2VRncndOmZagaJ2tBSwEEa1G785TLmg5PKS51yBJdj7Ojo9wRCqG4iHRI3VkjoY
         NXvjPH2NpVI+BrwwegQOhEgK5tTVIFqVC6TzERoITytRjTKGMnwrd+TwAHuZI8u07a+g
         aMAg==
X-Gm-Message-State: ALQs6tD3I/RyxKn/8I8DKbSqe7Rql/nVpXEI/kK3otVAotHBM1YnYfEY
        M2pzJ5G7PxKYWGnUHlD5JQ==
X-Google-Smtp-Source: AIpwx48FomVXSlJ734jW+1ELhDK0fFC3SLRr4Kp8HCPpaxmXxSg8pPdbWZjao/BQCREUXymoWLFlrw==
X-Received: by 2002:aca:3c04:: with SMTP id j4-v6mr300673oia.54.1523305523936;
        Mon, 09 Apr 2018 13:25:23 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id m65-v6sm820015oik.11.2018.04.09.13.25.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Apr 2018 13:25:23 -0700 (PDT)
Date:   Mon, 9 Apr 2018 15:25:22 -0500
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
Subject: Re: [PATCH v4 08/10] dt-bindings: i3c: Document Cadence I3C master
 bindings
Message-ID: <20180409202522.x7pooixnfgz572jn@rob-hp-laptop>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-9-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180330074751.25987-9-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 09:47:49AM +0200, Boris Brezillon wrote:
> Document Cadence I3C master DT bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v4:
> - Fix example to match the new representation
> ---
>  .../devicetree/bindings/i3c/cdns,i3c-master.txt    | 44 ++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/cdns,i3c-master.txt

Reviewed-by: Rob Herring <robh@kernel.org>

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
