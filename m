Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 113227DF8B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 09:34:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754194AbeE1JdB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 05:33:01 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:39657 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754199AbeE1JdA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 05:33:00 -0400
Received: by mail-wm0-f65.google.com with SMTP id f8-v6so30388250wmc.4;
        Mon, 28 May 2018 02:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=kBkiyhb9dfK8gJ2qf9jhtR/rcMSLKCzZ3XFsC8EUxuw=;
        b=ik4Qi2G8lOT4nUwe+Y4aWCa7zRGE0w3Ssq1McNZ/Fd9PkyL/ZZHGO2S2tVjY4tiizt
         w8X9DReohQALFOm1hlbq/N06sHgMMblt85dtPnmW7Df/aa1gNxCynP7iA+kX99gu4p4E
         5CURP5p9/5rfGgmupoEhJfe0WeKNCnaX6StAvLEs6LacG3LPp10jdHk4OQQaWuPyoSG7
         WngiRHf++GHOXrYiHZyRN5d2CwTlk7f6lP8h10mJ5awUfzYW+Za99UiQUQhki+SYBhfS
         3X5bQaAHTnZQgaMYnCxVyj1RDkwDFQN6cI6rzJ3OS0v4Yc8wtAnhzXOOdSlhxssfh+a1
         kdjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=kBkiyhb9dfK8gJ2qf9jhtR/rcMSLKCzZ3XFsC8EUxuw=;
        b=n0RzKazFsDuEbzG+4RKKIxg00RTqI1sng5r33AN8j5LMic4QH5wPsTFrR7EJQhhvuN
         n2YpLGcaKzmg7wSkEZ9fBRYi9BLlloD/xf2fhYkK5bmtBLLRT+0TRq+yhAFOSsEVlIuH
         vt/39ZMY8vhY8lOMHRU+OFd0fRXBd9eFiJyEW+8s6j7FL3AkJUlRU3NQLndk9hgjMNP1
         2FMzs1amjgz18XrvO6hBRR6J/h1v8VAAh3YTi2dTtbDaTcIFS13z2FLBRhLUHWBDoCdN
         OI0zM9r2vuA7ERZPHsxI1AEeS9GH7eUkFVJ+OgT1HdjKajHNNedWe+oOveSHvGs0DJui
         pFbA==
X-Gm-Message-State: ALKqPweDYJOsYBT/QkpK3iY5GOe1tmLapYE4df1sq4bILYz6ValeDexK
        okl8ApJRwoJW9s6GrHMgaPU=
X-Google-Smtp-Source: ADUXVKLwo0emEJMKhp1gd/8stzzfQn6Y+HTAD8UgOvitz7zcfluxDTNR/d1CcHGnlHl47GIKxof81A==
X-Received: by 2002:a2e:9b89:: with SMTP id z9-v6mr7900388lji.121.1527499978944;
        Mon, 28 May 2018 02:32:58 -0700 (PDT)
Received: from gmail.com (c-5eea3441-74736162.cust.telenor.se. [94.234.52.65])
        by smtp.gmail.com with ESMTPSA id b20-v6sm5732862ljf.51.2018.05.28.02.32.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 May 2018 02:32:58 -0700 (PDT)
Date:   Mon, 28 May 2018 11:32:54 +0200
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: gadget: ccid: add support for USB CCID
 Gadget Device
Message-ID: <20180528093254.GC4651@gmail.com>
References: <CGME20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7@epcas2p1.samsung.com>
 <20180526211940.25474-1-marcus.folkesson@gmail.com>
 <20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k@eucas1p2.samsung.com>
 <20180528083834.GB4651@gmail.com>
 <20180528091229eucas1p20cfbb68cdfaa6de2cf5b5a7e2bdac72c~yxAUSF7e61070710707eucas1p2j@eucas1p2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180528091229eucas1p20cfbb68cdfaa6de2cf5b5a7e2bdac72c~yxAUSF7e61070710707eucas1p2j@eucas1p2.samsung.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrzej,

Thank you for reviewing.

On Mon, May 28, 2018 at 11:12:27AM +0200, Andrzej Pietrasiewicz wrote:
> W dniu 28.05.2018 o 10:38, Marcus Folkesson pisze:
> > Hi Andrzej,
> > 
> > On Mon, May 28, 2018 at 09:04:51AM +0200, Andrzej Pietrasiewicz wrote:
> >> Mi Marcus,
> >>
> >> W dniu 26.05.2018 o 23:19, Marcus Folkesson pisze:
> >>> Chip Card Interface Device (CCID) protocol is a USB protocol that
> >>> allows a smartcard device to be connected to a computer via a card
> >>> reader using a standard USB interface, without the need for each manufacturer
> >>> of smartcards to provide its own reader or protocol.
> >>>
> >>> This gadget driver makes Linux show up as a CCID device to the host and let a
> >>> userspace daemon act as the smartcard.
> >>>
> >>> This is useful when the Linux gadget itself should act as a cryptographic
> >>> device or forward APDUs to an embedded smartcard device.
> >>>
> >>> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> >>> ---
> >>
> >>>    
> >>> +config USB_CONFIGFS_CCID
> >>> +	bool "Chip Card Interface Device (CCID)"
> >>> +	depends on USB_CONFIGFS
> >>> +	select USB_F_CCID
> >>> +	help
> >>> +	  The CCID function driver provides generic emulation of a
> >>> +	  Chip Card Interface Device (CCID).
> >>> +
> >>> +	  You will need a user space server talking to /dev/ccidg*,
> >>> +	  since the kernel itself does not implement CCID/TPDU/APDU
> >>> +	  protocol.
> >>
> >> Your function needs a userspace daemon to work.
> >> It seems you want to use FunctionFS for such a purpose
> >> instead of creating a new function.
> >>
> >> Andrzej
> > 
> >>> +	  since the kernel itself does not implement CCID/TPDU/APDU
> > Oops, the driver does handle CCID.
> 
> Which parts of code do this handling?

My bad, I was thinking about the USB descriptors and endpoints setup.
That is of cause not part of the CCID protocol.

> 
> Is there any kind of state machine usual for protocols?
> If the protocol is stateless then isn't it just a data format then?

The protocol is stateless.

> 
> Which part of this handling must be done in kernel and why?
> 
> Does the said handling do anything other than forwarding the
> traffic between USB and a character device?

No, it forward the CCID messages to the character device to be handled
by the application.

> 
> What is the character device used for? I know: read, write and poll.
> But why? To do what?

It is used for the application to fetch, interpret and then perform actions depending on
commands.

> 
> > 
> > Well, yes, It needs an application that perform the "smartcard operations", such as
> > generate keys or sign data, as this depends on how it should be used.
> > 
> > The actual smartcard operations could for example be in software,
> > use a crypto engine in SoC or external HSM (Hardware Security Module).
> > 
> > Without the application, the gadget shows up as a smart card reader
> > with an unconnected smartcard.
> > 
> 
> Does showing up as anything require anything other than merely
> providing USB descriptors?

I guess.

> 
> Andrzej

Thank you,
Marcus
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
