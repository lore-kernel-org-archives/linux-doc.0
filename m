Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ADF987D0F4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 11:35:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751074AbeCZLf4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 07:35:56 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:34940 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751024AbeCZLfz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 07:35:55 -0400
Received: by mail-qt0-f194.google.com with SMTP id s2so19144066qti.2;
        Mon, 26 Mar 2018 04:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=v8GShf95lIyZmSlxKnaNrhtQzlN7re/MNslzHk+2rFs=;
        b=E/8fWj7yUizrSDU/1qecp+MxQD9OS2jLGdxou6RGWnaW7daNgPYt5BLkdYS9+OaP8l
         6dALtMm47wN3vb+8hUDgdtqfWfx3ObUSlu0Aqcxuz+FlxhpITEqadFUN61jmNATK8HCm
         L0Vjvy3ut4fqh/uZElo25UaiiZQUo/kKckJgUxaf5WDLXQ8NxeWkrVYzYV/bkVmELnxZ
         1qyJrtyZif+6DwPSdvrGMX9cA59iLhjOKN5aQPMqIiBqgVcmFnsjnf5jG13mIsIb4DG5
         H+caAOUv2MbJCZseuj+91T1la1d1RYSbmRhLgEBSFvGg89wgkKFfjv1F98YwG24fkLV6
         Zqhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=v8GShf95lIyZmSlxKnaNrhtQzlN7re/MNslzHk+2rFs=;
        b=E4HZLG2pgYKMvkB9J52vRUBGcSyh5blEhu7lD78fk02SSRoCcYryjeWOSGb4bDVRME
         BeWiGej6IkXPBMHKxzZKYJoUS6EC0uvMNGH+evD4X6xjcCNC9xrsI7q0dQcCQpbi22ei
         Umw+L4PKoBybRExClxwth1Xjmfu3xm05lwN77gi9qs4Y33Ai95MVvTz7UJg9AOvah6ry
         FTM2T+F5J280nGanjF4K2XptB7cq3wIRZmKdjwlW0cYEB+IY6Pv4LbQiS+jvx8thwx0p
         6OagA5Td7HXzz3uTxWEdsn0Dy4duKmUp94/cUhyisIcKEt9OYayQimrXKBjigG0B2giD
         4Xmw==
X-Gm-Message-State: AElRT7HP+GbjKvAPjva64STFG0NmF4s4i9q31z3hzhVc+VJH9ZD7YAI0
        8ueQ0t2dQzwSDL9sOUUy+RNFJBa79RGn56BSxYk=
X-Google-Smtp-Source: AG47ELu9NubfToUboXrzk6Djcrby/dxCGlYx5DL6qUIrxgat2mxtQ6S1y21Yd9HVanlFe40ayPVOOJVOo83u25cBBgo=
X-Received: by 10.200.28.61 with SMTP id a58mr58742695qtk.280.1522064153973;
 Mon, 26 Mar 2018 04:35:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Mon, 26 Mar 2018 04:35:53 -0700 (PDT)
In-Reply-To: <20180326132526.1634946e@bbrezillon>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
 <20180323110020.19080-12-boris.brezillon@bootlin.com> <CAMuHMdX3TLmaN14gM4fTgzXwy1dgsMxCFBs_3wCFWM8rX=+8vA@mail.gmail.com>
 <20180326132526.1634946e@bbrezillon>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Mar 2018 13:35:53 +0200
X-Google-Sender-Auth: VDRmG6Gx97o6jUwHOELIMIJfY_4
Message-ID: <CAMuHMdWXb+eSTG28eKRzfP3mq=KLXikOt94MGNaS+MYeiVdr3w@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] dt-bindings: gpio: Add bindings for Cadence I3C
 gpio expander
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
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
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

On Mon, Mar 26, 2018 at 1:25 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Mon, 26 Mar 2018 12:12:54 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>> On Fri, Mar 23, 2018 at 12:00 PM, Boris Brezillon
>> <boris.brezillon@bootlin.com> wrote:
>> > Document the Cadence I3C gpio expander bindings.
>> >
>> > Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>>
>> Thanks for your patch!
>>
>> > --- /dev/null
>> > +++ b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
>>
>> > +- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
>> > +  The second cell bits[3:0] is used to specify trigger type and level flags:
>> > +      1 = low-to-high edge triggered.
>> > +      2 = high-to-low edge triggered.
>> > +      3 = triggered on both edges.
>> > +      4 = active high level-sensitive.
>> > +      8 = active low level-sensitive.
>>
>> These are identical to the values in <dt-bindings/interrupt-controller/irq.h>.
>> Perhaps you can refer to those definitions?
>
> Well, I'm not sure this is allowed since DT bindings docs are
> supposed to be OS-agnostic and macros defined in
> <dt-bindings/interrupt-controller/irq.h> are, AFAIK, only available to
> Linux.

If they're under include/dt-bindings/, they're part of the DT bindings.

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
