Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D27907D048
	for <lwn-linux-doc@archive.lwn.net>; Mon, 28 May 2018 08:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754069AbeE1Iiq (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 28 May 2018 04:38:46 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:53264 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753986AbeE1Iil (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 May 2018 04:38:41 -0400
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so29892130wmf.3;
        Mon, 28 May 2018 01:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=PelMXdusff+/pzS8PyzODwGurV+w+77Lgxs/Est17S8=;
        b=UO3sVKyKZnSt+B3TRyW24cRnHeqgtM7N2canD4AEKZnRlczTHN0oMcm4IXHNaGemux
         kaELG14V1rBzh5w8UpW6SQMhNgw6zaAVrWvExGCxkVqUurdPNRZ2htIhBCEu8Q802Kdw
         GrJAw3xH+XSPyyrESK13k89NPxLOQBzpSLj+ns38B65C6+wkzrf9pmxzkbTRhlu5co5a
         Yd8xjYT7s/BqEaAfKYv2kOPFduuzJbB9zrHWEq8sspIf7TnCmVTJ3PaoSJ5/RwVCEPGV
         q05k4CjKdzpPzY6xO/zCsNGWanv+ZMIqeDjEUoU7Slh5AQ6OgLUFrBamPAkQ6yUwpuHt
         mFEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=PelMXdusff+/pzS8PyzODwGurV+w+77Lgxs/Est17S8=;
        b=Gql8RBvrMy81MX1eMqXRt+nsM8Hu7k6Y3pO4X5WcKXOKgZupqT6fN7CwTmOCgzycJB
         i901AkQj+cP/M0gMXLA0bWbx40ZGUqH3pEsEhmidga+Zsn44Kbd3bnF4x3+9a1ObUXzI
         iHOOX0jw56cZeQjI12GxqyeTPCPDy2wIlMxpvUOyNbUtl6sYy6gTx6Rkp5vo/nVWXHqa
         bSioho61lFel9ga41c7xBCtUQIp7NkDVSqHztvjg/49myTUnzKmNS0vum8VXLRm9FWyN
         cOPDhmiV9p2aMDfHZY4aIc6aprT3XqXpnDTzfY91RcU9GZA1IAufSEfNR+uHX7HcE8Rb
         5vJg==
X-Gm-Message-State: ALKqPweEB1NgVzVnaBYj6DoH33/+tuMHwd5DEvgQXfN8kfv5vpe1KRyp
        gcAcXXrz3vSdkWwQEpaXcl8=
X-Google-Smtp-Source: AB8JxZqICmGTz5BovShF0ap0wWgIeAA0DgHavJs6BGl9z6mt0lx1OYLKbK5N+Er7KKp3BGJUDv1Rvw==
X-Received: by 2002:a2e:7c02:: with SMTP id x2-v6mr7883089ljc.96.1527496720076;
        Mon, 28 May 2018 01:38:40 -0700 (PDT)
Received: from gmail.com (c-5eea3441-74736162.cust.telenor.se. [94.234.52.65])
        by smtp.gmail.com with ESMTPSA id r15-v6sm5814071ljh.6.2018.05.28.01.38.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 28 May 2018 01:38:39 -0700 (PDT)
Date:   Mon, 28 May 2018 10:38:34 +0200
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
Message-ID: <20180528083834.GB4651@gmail.com>
References: <CGME20180526212048epcas2p1510fd6c92f20e8f6d0059742ab5fb3f7@epcas2p1.samsung.com>
 <20180526211940.25474-1-marcus.folkesson@gmail.com>
 <20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k@eucas1p2.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180528070453eucas1p294be19abd2cab7d112404d15710edfde~yvQ5mevbz2769227692eucas1p2k@eucas1p2.samsung.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Andrzej,

On Mon, May 28, 2018 at 09:04:51AM +0200, Andrzej Pietrasiewicz wrote:
> Mi Marcus,
> 
> W dniu 26.05.2018 o 23:19, Marcus Folkesson pisze:
> > Chip Card Interface Device (CCID) protocol is a USB protocol that
> > allows a smartcard device to be connected to a computer via a card
> > reader using a standard USB interface, without the need for each manufacturer
> > of smartcards to provide its own reader or protocol.
> > 
> > This gadget driver makes Linux show up as a CCID device to the host and let a
> > userspace daemon act as the smartcard.
> > 
> > This is useful when the Linux gadget itself should act as a cryptographic
> > device or forward APDUs to an embedded smartcard device.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> 
> >   
> > +config USB_CONFIGFS_CCID
> > +	bool "Chip Card Interface Device (CCID)"
> > +	depends on USB_CONFIGFS
> > +	select USB_F_CCID
> > +	help
> > +	  The CCID function driver provides generic emulation of a
> > +	  Chip Card Interface Device (CCID).
> > +
> > +	  You will need a user space server talking to /dev/ccidg*,
> > +	  since the kernel itself does not implement CCID/TPDU/APDU
> > +	  protocol.
> 
> Your function needs a userspace daemon to work.
> It seems you want to use FunctionFS for such a purpose
> instead of creating a new function.
> 
> Andrzej

> > +	  since the kernel itself does not implement CCID/TPDU/APDU
Oops, the driver does handle CCID.

Well, yes, It needs an application that perform the "smartcard operations", such as
generate keys or sign data, as this depends on how it should be used.

The actual smartcard operations could for example be in software,
use a crypto engine in SoC or external HSM (Hardware Security Module).

Without the application, the gadget shows up as a smart card reader
with an unconnected smartcard.

I guess it could be accomplished with FunctionFS as well.

Best regards
Marcus Folkesson

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
