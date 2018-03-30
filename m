Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1349E7DD32
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 07:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751216AbeC3Hz1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Mar 2018 03:55:27 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:42898 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751198AbeC3HzX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Mar 2018 03:55:23 -0400
Received: by mail-qt0-f195.google.com with SMTP id j3so8745209qtn.9;
        Fri, 30 Mar 2018 00:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=NgPkZTc8EoLB7dtNGzLHY3q6bgIElIYHJ/aIoORdA1s=;
        b=TxZDpNrHJwft1GNy7zcP6q9bfB8hvmaiSEJps0TSdAakyYFgzQRxE/ba9oY7++9hVX
         Sl2CHmclmd2XF1hBMdQYhOIBFpysyhv2HRAgktQ/8gKdUhH299HBhqrQc5OXtv6UeX4t
         3EWjaTNECqwXOwjThvdLv3WeOxnYClVsDN3MAbxARhFKK/S1g2EhoHfgSrJFkL8oupoE
         U5PPZws0ckNy/uvxtrFwHD+3C5bjGGhcf4UMc6J5zF0j7Fi2+rtfpVbqUD5uiYRB4Uuv
         Z7DPtkl5tmXD/igiHzbZKx+6prziU7Nrl6dtO7rYlDtMcPl0xgHpg02dTWsdC/5iiesI
         8x9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=NgPkZTc8EoLB7dtNGzLHY3q6bgIElIYHJ/aIoORdA1s=;
        b=h3qJ1ghvWRSrwAmI7JpqMNQzh9CD+pULKfJetXXV+GOj5aeZxjhLFLDCyArl+wJj2H
         1vzD35Y0kl1SzN6GzKp3QuNbGodBw+9rAq561irHJqpkcLmxVplgs9YDHy9JyyKl67zk
         gN9ryzb/T2bGLEyxIS/Mkc351fi6IBRj2j5nd+NALPDbBmMwcJ3tIrn7ATZCTldbWtW8
         WQQVATSnhhC3qQzpNPUwgJJq8ixsaENzJemVmoKxZeTlf51bOw9a0miby+YgTdoVcxgj
         EQHnDBuLMD9RMxeKWUm4qNajn9lZV6C/NOVTsTmZr+lUYPR48Ydi/D5qzw3xsNuMM1WT
         W4Hg==
X-Gm-Message-State: ALQs6tBmycx9YacII2qjgklf/737wtgQDQ8o8X04siGZ8Ci0avvgPJaZ
        POfqf2PDweKtVtk0J/XN8FK/4uX1iiSu5hhWnaw=
X-Google-Smtp-Source: AIpwx49omFZqhUFGx0K0OcS4G+5pXSjQ7VF4YN7bT+6rFwYlMM5Qh1wssClOijFOJV81EcMUlCVH1Ynk08zvRxfin5I=
X-Received: by 10.200.44.164 with SMTP id 33mr16600790qtw.160.1522396522642;
 Fri, 30 Mar 2018 00:55:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Fri, 30 Mar 2018 00:55:22 -0700 (PDT)
In-Reply-To: <20180330074751.25987-5-boris.brezillon@bootlin.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com> <20180330074751.25987-5-boris.brezillon@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 30 Mar 2018 09:55:22 +0200
X-Google-Sender-Auth: gLUpy2HHb04rvKAfBmAsfUidLYc
Message-ID: <CAMuHMdW-MhzaW-bWL25Y+--UHxLB+Mm5+SmhwA+PiezUEg0Ycw@mail.gmail.com>
Subject: Re: [PATCH v4 04/10] dt-bindings: i3c: Document core bindings
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
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
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

On Fri, Mar 30, 2018 at 9:47 AM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> A new I3C subsystem has been added and a generic description has been
> created to represent the I3C bus and the devices connected on it.
>
> Document this generic representation.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
> Changes in v4:
> - Clarify the fact that static address == I3C address and dynamic

static address == I2C address?

>   address == I3C address

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
