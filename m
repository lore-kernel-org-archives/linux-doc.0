Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6C3D57DE76
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 22:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752548AbeCZW1n (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 18:27:43 -0400
Received: from mail-ot0-f176.google.com ([74.125.82.176]:40340 "EHLO
        mail-ot0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752775AbeCZWZC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 18:25:02 -0400
Received: by mail-ot0-f176.google.com with SMTP id w12-v6so463238otj.7;
        Mon, 26 Mar 2018 15:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ki5JWEUO1PeHaflqJIQJzHx5yi7Gg/xw8iI1dNIDeq8=;
        b=g44ziQDI9AfSwBuVi0JZtxizVPLSewIl1PFY/k7DY0VokstR3o+9+laCPT9eEryhwp
         ECGGLiiajGud2NDpE/yg6Vix6K9/EZooOBTXslu0+Nr4aKRTEK5w4XMEYnq735A7GHEh
         cp5mXKRdygMaK6w98n7ROCXwav10OKuoka0isoQ7cs3D1Te7SXQ6nZt64DdLrqqILLaa
         ianu6UD565xYtpAaL5Y3k0EVAPLx5m6bWzqypGl8JFQfunb8MBhb/2VTIx98eE3QNNHW
         49fv1K55ypShXRS2yXswcI/fQEwXvNF3+NlSEmVO0yFi13xssZMF/mkGtsqkA1cy25Lu
         6nDA==
X-Gm-Message-State: AElRT7E8ZmyQmB35eiJigahzc62LKh8/Ct+YiNp1do/iVkr7hwt34+f3
        lKqIKcRkqP9w0FpVp812+A==
X-Google-Smtp-Source: AG47ELsS0CewchKtidaLzagMEsCPvPdQVX4evTzYp6DelJQoCSUb1wWGRirYvXgEO6bwsERgHTbW+w==
X-Received: by 2002:a9d:72d0:: with SMTP id d16-v6mr13313712otk.83.1522103101433;
        Mon, 26 Mar 2018 15:25:01 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id s129sm8860275oia.26.2018.03.26.15.25.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Mar 2018 15:25:00 -0700 (PDT)
Date:   Mon, 26 Mar 2018 17:25:00 -0500
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
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 06/11] dt-bindings: i3c: Add macros to help fill
 I3C/I2C device's reg property
Message-ID: <20180326222500.muhqsfy5oetk5ahk@rob-hp-laptop>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
 <20180323110020.19080-7-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323110020.19080-7-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 23, 2018 at 12:00:15PM +0100, Boris Brezillon wrote:
> The reg property of devices connected to an I3C bus have 3 cells, and
> filling them manually is not trivial. Provides macros to help doing
> that.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  include/dt-bindings/i3c/i3c.h | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/i3c/i3c.h

Reviewed-by: Rob Herring <robh@kernel.org>
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
