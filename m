Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A44597DF8B
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 11:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751730AbeE3LfJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 07:35:09 -0400
Received: from mail-lf0-f65.google.com ([209.85.215.65]:40452 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753055AbeE3LfE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 07:35:04 -0400
Received: by mail-lf0-f65.google.com with SMTP id q11-v6so3748836lfc.7;
        Wed, 30 May 2018 04:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=qAdyZJLEq5iG5eT9pNcnr9600IdMpNeCG02pGIBWGiE=;
        b=a2tsIdJNsfKO1i5FFYQjimdz8tXxnnc0IEV7i4BhI+/nwS1XDAOuV7sa8PH5g7OY8v
         T05lx2C594NvCQTju7zy1+Y+BvYf09FwfAuL+AlOvCF5ADG4vVz2j0O+lOIuRS/ATXoD
         tMhGuw+8p3vT7FhE5DEN4eW61ne1oXmyyG2ilWBKxoUqBDDEWkb6Qy9gBGb+edZzSKDE
         zFjVWNoVFM4rJcrSpbmGiaK/WNEvWLytqIZC/iS+8jildP5J7TYYKWfKARkJc8sajWl7
         dfwVmXtZLWrM+5s2tBlLxzIqjhvsJtzQ77Fh4UmgW7Sk9nXHe6JuIqYz3R0jo0Rns/MH
         3pdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qAdyZJLEq5iG5eT9pNcnr9600IdMpNeCG02pGIBWGiE=;
        b=BueFEaga6vVGGxc73AkRvkl6l1/XB2chhH4jyykPT27NBxoFOO82okBxTIurbzrmES
         Rtoryb7uAOes6tBg5IwQfgU5CrC2p6CVWFx+u7nG0M1P33TVgFzT4+AMcfkuQPOjYqqx
         mT6ZOO/2u97FZ+IB82PvkuseBRPlzgqhCrfSHp2zp2bDST+i4XUyNd9cQ8nm++FErHdJ
         +ow9S9zWLymVmJdgXtnDXSe1sPoP/bzUJ1uohqj06OSro0x9Z6UHeA32CYviuXq96gAV
         INQgzJMZpHrNkqsVTgXybuqxRpFfX8TXSna0j3JQG6dVT9q2uBTd+QRlN20WwEGhtXAI
         ZmWw==
X-Gm-Message-State: ALKqPwfhjL7KIJOl/JFq+K4Qv4sQIgyOti8lwrRyUGcIqvThIHQxvpi6
        gTynQ26QoKdnoJ1sae4w3NU=
X-Google-Smtp-Source: ADUXVKJY+qEPIkfynzr2V8Rs65Vk+eMMAZRAelvIvl2rINH/9yU7+kuBOLsfRlHgprRv25Oep6rFGA==
X-Received: by 2002:a2e:6e10:: with SMTP id j16-v6mr1947473ljc.61.1527680102271;
        Wed, 30 May 2018 04:35:02 -0700 (PDT)
Received: from gmail.com ([81.236.84.183])
        by smtp.gmail.com with ESMTPSA id y12-v6sm7000028lji.34.2018.05.30.04.35.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 04:35:01 -0700 (PDT)
Date:   Wed, 30 May 2018 13:34:59 +0200
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>, davem@davemloft.net,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] Documentation: usb: add documentation for USB
 CCID Gadget Device
Message-ID: <20180530113459.GC2939@gmail.com>
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
 <20180529185021.13738-2-marcus.folkesson@gmail.com>
 <f4cdc62c-8bbe-28f9-0e7a-b4943d6f6a4f@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4cdc62c-8bbe-28f9-0e7a-b4943d6f6a4f@infradead.org>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Randy,

On Tue, May 29, 2018 at 01:27:23PM -0700, Randy Dunlap wrote:
> On 05/29/2018 11:50 AM, Marcus Folkesson wrote:
> > Add documentation to give a brief description on how to use the
> > CCID Gadget Device.
> > This includes a description for all attributes followed by an example on
> > how to setup the device with ConfigFS.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> > 
> > Notes:
> >     v3:
> >     	- correct the grammer (thanks Randy)
> >     v2:
> >     	- add the missing changelog text
> > 
> >  Documentation/usb/gadget_ccid.rst | 267 ++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 267 insertions(+)
> >  create mode 100644 Documentation/usb/gadget_ccid.rst
> > 
> > diff --git a/Documentation/usb/gadget_ccid.rst b/Documentation/usb/gadget_ccid.rst
> > new file mode 100644
> > index 000000000000..524fe9e6ac19
> > --- /dev/null
> > +++ b/Documentation/usb/gadget_ccid.rst
> > @@ -0,0 +1,267 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +============
> > +CCID Gadget
> > +============
> > +
> > +:Author: Marcus Folkesson <marcus.folkesson@gmail.com>
> > +
> > +Introduction
> > +============
> > +
> > +The CCID Gadget will present itself as a CCID device to the host system.
> > +The device supports two endpoints for now; BULK IN and BULK OUT.
> > +These endpoints are exposed to userspace via /dev/ccidg*.
> > +
> > +All CCID commands are sent on the BULK-OUT endpoint. Each command sent to the CCID
> > +has an associated ending response. Some commands can also have intermediate
> > +responses. The response is sent on the BULK-IN endpoint.
> > +See Figure 3-3 in the CCID Specification [1]_ for more details.
> > +
> > +The CCID commands must be handled in userspace since the driver is only working
> > +as a transport layer for the TPDUs.
> 
> I think that it would be helpful to tell us what the naming of the /dev/ccidg*
> endpoints looks like.  Also, how to distinguish the BULK-IN from the BULK-OUT
> endpoint.

You are right, it is not clear.

The devices are named as /dev/ccidg[0-4] and is per device.
Writing/reading to the device is using BULK-IN/BULK-OUT, the /dev/ccidg*
device is not bound to a particular endpoint.

I will come up with something that make it more clear.

Thank you!


> 
> > +
> > +
> > +CCID Commands
> > +--------------
> > +
> > +All CCID commands begins with a 10-byte header followed by an optional
> > +data field depending on message type.
> > +
> > ++--------+--------------+-------+----------------------------------+
> > +| Offset | Field        | Size  | Description                      |
> > ++========+==============+=======+==================================+
> > +| 0      | bMessageType | 1     | Type of message                  |
> > ++--------+--------------+-------+----------------------------------+
> > +| 1      | dwLength     | 4     | Message specific data length     |
> > +|        |              |       |                                  |
> > ++--------+--------------+-------+----------------------------------+
> > +| 5      | bSlot        | 1     | Identifies the slot number       |
> > +|        |              |       | for this command                 |
> > ++--------+--------------+-------+----------------------------------+
> > +| 6      | bSeq         | 1     | Sequence number for command      |
> > ++--------+--------------+-------+----------------------------------+
> > +| 7      | ...          | 3     | Fields depends on message type   |
> > ++--------+--------------+-------+----------------------------------+
> > +| 10     | abData       | array | Message specific data (OPTIONAL) |
> > ++--------+--------------+-------+----------------------------------+
> > +
> > +
> > +Multiple CCID gadgets
> > +----------------------
> > +
> > +It is possible to create multiple instances of the CCID gadget, however,
> > +a much more flexible way is to create one gadget and set the `nslots` attribute
> > +to the number of desired CCID devices.
> > +
> > +All CCID commands specify which slot is the receiver in the `bSlot` field
> > +of the CCID header.
> > +
> > +Usage
> > +=====
> > +
> > +Access from userspace
> > +----------------------
> > +All communication is by read(2) and write(2) to the corresponding /dev/ccidg* device.
> > +Only one file descriptor is allowed to be open to the device at a time.
> 
> 
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> 
> 
> thanks,
> -- 
> ~Randy

Best regards,
Marcus Folkesson
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
