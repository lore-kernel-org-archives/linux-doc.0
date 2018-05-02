Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1231E7E27C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 09:47:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750907AbeEBJrx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 05:47:53 -0400
Received: from mail-vk0-f65.google.com ([209.85.213.65]:38640 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750897AbeEBJrv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 May 2018 05:47:51 -0400
Received: by mail-vk0-f65.google.com with SMTP id 10-v6so8577761vkh.5;
        Wed, 02 May 2018 02:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=o3yWDWi4vxeuwm2Nc0GxyKU/keqI3bQeq2MC388JJfo=;
        b=W5H0sX3b8W8VUBkgsubDAkwR6MNbPhcTvn4n6nR4PfHBhBNu4hn/ytCnh/TGm1eIjh
         tYW2cN5DqFe7N2icEelDjfazdopBict6gnUJI5PZw/+UvYEpelRrNRAL4ZIs224wB8le
         VkTs+YfDOe8WBImcT8pW72/HFVZ1rozOHhzCmky8GFzd1kSzYcan1IWgq88cW3kXt79o
         YMX6t6VpO40tSYpBN9O+jmrMu5XyR+7TsfuGIROkV+cSyQARcGzPQQ3isNiveOLFQvMX
         LmTJxvgC48xMaYbg1usGQU7rWoU1dR17RxDFm1yCoM8BcApr93ean5qFSXhtP7M9q/Yx
         PWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=o3yWDWi4vxeuwm2Nc0GxyKU/keqI3bQeq2MC388JJfo=;
        b=p9WuEe20kbhebLKljVZxR4UdncD7gIL5I0SXx0PPthk2GIkwioWMF01i/l3SRbenGu
         +QZj+0YeqRt37E6m6wjsnJG7+J6uX/XqJ/NgfAa3k+vjDzT2KGMrmhCjjQF6GBux2Lyu
         Vq1e5l2AonQPTCD0lFzg/kmzZxCCDs2XN0CRFmDLXyWL2/uicIDqBHH87+2Sh2mW/TR5
         xvnAsEk0JTWRRqSYOduon0TCE9EEVH/rntfpghx9cUtiVqwVjkn9qx87vzkKsqBbOfCh
         wbOHFjKP8jGJn3LZPQtIKgTEAFy9RA/vxtVSB4sAw4c4xzAg77j7AfD/IIF6y+7zDogE
         I/HA==
X-Gm-Message-State: ALQs6tBavks531EJ6Be1rFINnzxnlaGiHFZKDV4Td6oYJMNgs1HyV1pV
        QZP2udDTeADVFYby1vTbBxhWz4vMq8WmmBjkYZo=
X-Google-Smtp-Source: AB8JxZqh1/fTCqt/xMc1oI3koGehWDSZ9gWDfYOrNz1bNtlfFSUnxvoKWvBZNLPW7jGMnz/YIMClDIOTWR0JNmq2TQE=
X-Received: by 2002:a1f:214b:: with SMTP id h72-v6mr17427755vkh.176.1525254470052;
 Wed, 02 May 2018 02:47:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.10 with HTTP; Wed, 2 May 2018 02:47:49 -0700 (PDT)
In-Reply-To: <20180429133700.GD28913@kroah.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com>
 <20180330074751.25987-4-boris.brezillon@bootlin.com> <20180429133700.GD28913@kroah.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 2 May 2018 11:47:49 +0200
X-Google-Sender-Auth: BvWgmjA3aGbIGWgCVyjhfAPpTm8
Message-ID: <CAMuHMdUe=zauTS7BQXyTvMbmc-AsEVdWN0gG_3Ejg3E4T-xFXQ@mail.gmail.com>
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

On Sun, Apr 29, 2018 at 3:37 PM, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
> On Fri, Mar 30, 2018 at 09:47:44AM +0200, Boris Brezillon wrote:
>> Document sysfs files/directories/symlinks exposed by the I3C subsystem.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> ---
>> Changes in v2:
>> - new patch
>> ---
>>  Documentation/ABI/testing/sysfs-bus-i3c | 95 +++++++++++++++++++++++++++++++++
>>  1 file changed, 95 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-bus-i3c
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-i3c b/Documentation/ABI/testing/sysfs-bus-i3c
>> new file mode 100644
>> index 000000000000..5e88cc093e0e
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-bus-i3c
>> @@ -0,0 +1,95 @@
>> +What:                /sys/bus/i3c/devices/i3c-<bus-id>
>> +KernelVersion:  4.16
>
> Wrong kernel versions :)

Do you update these when backporting to stable? ;-)

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
