Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 05CA77DE79
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 11:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751192AbeEBLcI (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 07:32:08 -0400
Received: from mail-vk0-f67.google.com ([209.85.213.67]:43458 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750939AbeEBLcG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 07:32:06 -0400
Received: by mail-vk0-f67.google.com with SMTP id v134-v6so8737593vkd.10;
        Wed, 02 May 2018 04:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=0QtBf/z/p5YVnQKaBxo68oDtlbHPqU8a4K0vtrzZxms=;
        b=ARRy4T8eSDdjaJcOxSKP4FMbVqMtuiV6gLKLqEtxY/dJb0bcV+/RXilR2RbkWlmYNx
         dX0WwmHGsbMvaITy43bomYxOXLbL2KrOTFimBusz/KJmCeegntsjmPcDWIPnxDU9zx0y
         36/TT3bSdnwP8bW77xzZWPnHhdzqDPGtq9y54PYh5ThcDXFWihlQ2OYhsqFFmftfkvEX
         NekUTIrBJXM0pwHYfzNMSnPIDuUiuhNy3LhZcdUyCl/y34S4z15KwgDU9Rtr3esxq9N3
         q3ZhUjP029JcxEzfRvhE1AVaPfnhiqOYqeNT86E8Iz1Eoz+R70z9xrpLw0qIO5m6UkWp
         ZXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=0QtBf/z/p5YVnQKaBxo68oDtlbHPqU8a4K0vtrzZxms=;
        b=JPR+NpBeCOqv2i2ktY4u1Jmzl7rmpSlfXI2DU8xBuOLylYDQqJCpnQ6elVLnVAIH3z
         g9IWUerJF00QKpDiyfpFy34NY5hYeT3OAxzZQy5ikpfnXHOG0FnUGe/9w7kW5aMJH5+b
         TOvss9VfJYZWwcXYuQvklqi1XVFWqyjAHXLa2OrJDLu2F3NVPpp5q4uyoIljSZR7Bpdc
         M+G6S+Qi6kxTbGBSpvNdDzlOhBh38w2S6oMTZwGoXgrooR6niftuQTzW/qSuEa5UtvRo
         5dD9Ozri1vvlIl1NJCEQVIlAtkfzj0Vz6A+KsMoFHKdZoft1RUvBCrGkmC6drU84n9+d
         YtlA==
X-Gm-Message-State: ALQs6tCzxB2AsATpVpTXUueLqEFhRgpXl72SYy4HRw3n6RAYgdq+4FMN
        I7uLZYeHPPVStY5XSDHLKU+kCiMqMkrIKMb8GFA=
X-Google-Smtp-Source: AB8JxZpvq9sTFjIfZthkq8grSogNL2sd3gaOPdGcVMANA55pFYcolsgQYafA8/dliT+nKrAFEmLmO+yQ9MEQKMAdx04=
X-Received: by 2002:a1f:8994:: with SMTP id l142-v6mr17118709vkd.50.1525260725175;
 Wed, 02 May 2018 04:32:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.10 with HTTP; Wed, 2 May 2018 04:32:04 -0700 (PDT)
In-Reply-To: <20180502111046.GA22091@kroah.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-4-boris.brezillon@bootlin.com> <20180429133700.GD28913@kroah.com>
 <CAMuHMdUe=zauTS7BQXyTvMbmc-AsEVdWN0gG_3Ejg3E4T-xFXQ@mail.gmail.com> <20180502111046.GA22091@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 May 2018 13:32:04 +0200
X-Google-Sender-Auth: L3G-yGQUB46lnldvHyT9mji8ujM
Message-ID: <CAMuHMdWgmPOntSQH0artOgBf4GrxOHJmHX8gyw1gmAW0ichPyg@mail.gmail.com>
Subject: Re: [PATCH v4 03/10] i3c: Add sysfs ABI spec
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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

Hi Greg,

On Wed, May 2, 2018 at 1:10 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Wed, May 02, 2018 at 11:47:49AM +0200, Geert Uytterhoeven wrote:
>> On Sun, Apr 29, 2018 at 3:37 PM, Greg Kroah-Hartman
>> <gregkh@linuxfoundation.org> wrote:
>> > On Fri, Mar 30, 2018 at 09:47:44AM +0200, Boris Brezillon wrote:
>> >> Document sysfs files/directories/symlinks exposed by the I3C subsystem.
>> >>
>> >> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> >> ---
>> >> Changes in v2:
>> >> - new patch
>> >> ---
>> >>  Documentation/ABI/testing/sysfs-bus-i3c | 95 +++++++++++++++++++++++++++++++++
>> >>  1 file changed, 95 insertions(+)
>> >>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i3c
>> >>
>> >> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
>> >> new file mode 100644
>> >> index 000000000000..5e88cc093e0e
>> >> --- /dev/null
>> >> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
>> >> @@ -0,0 +1,95 @@
>> >> +What:                /sys/bus/i3c/devices/i3c-<bus-id>
>> >> +KernelVersion:  4.16
>> >
>> > Wrong kernel versions :)
>>
>> Do you update these when backporting to stable? ;-)
>
> I'm not adding new features/subsystems to stable :)

True. So let's leave that for the LTSI patch monkey ;-)

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
