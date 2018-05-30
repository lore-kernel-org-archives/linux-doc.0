Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,FSL_HELO_FAKE,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 659857D072
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 12:14:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752240AbeE3MOD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 08:14:03 -0400
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41429 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751012AbeE3MOC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 May 2018 08:14:02 -0400
Received: by mail-lf0-f66.google.com with SMTP id d24-v6so3926459lfa.8;
        Wed, 30 May 2018 05:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=PClWcTbJGKSUbTOpVnMtp5zHm6lPne5Ia/4sn4tM7/o=;
        b=l/2li2TMpAcI0YmJw4Lkq4R8Khhqlv/OC8jDNdayI3b9GMeLMtM4HeU3e+mz1zkV8V
         VksE+duov1PGVAjLtna6vcLSGs/nNGVP0ne1jr3rHRzFs63HjXH8xFJAcSBhM9LGDuIi
         74LE6zJuwtV7t+uHjcUxAKi1bIZ8VH66kXLOGDLZIen4nVwm2i9/FQtRq1QAaI704eBy
         lusMz0X30mOeMW92Pdg1Jd94yVIr4He7TucjkvJmcFZ9+1qlRALz6zouQWevk8l7U/MR
         xTtgCqsc+o0vZygIgVYkezryunBsJV/7rIVR9Bm4EzL9QYHMagk8ZODtBTFw8BKe8arC
         6cyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PClWcTbJGKSUbTOpVnMtp5zHm6lPne5Ia/4sn4tM7/o=;
        b=odpr8CgGurA3HR/DY8bNJosug38iu8uqnKlqP6Zw1a7dc0s+dmwBwz3AFi7APJLaSj
         T2/5EPp+UvO1sRvmqU5qjUF80DkOt0S9mFUpvvn7I3ZLSnI//jJVz23RVaUp6LtLFqMO
         PAZxffuf49u49oEMbRfAaHhNJxNxwjcLSgJYB17e9+FfYhO1txlrUVk26ECtrwE0oRWK
         npnWY2QchRWiB3dwVGDD+delf6BxKrDuhqcDNAxZ+Vjfu/6SyUNEyS5uCqBscjALa0Ft
         gxsgNAapx21EmSutQjPS3TrYAnc0STCS2mnn8tpTT02iJIPMABUBV5HLAabPds94bjK3
         oGZg==
X-Gm-Message-State: ALKqPwe8S4oVbnnI5DeCTa7g2RoVPLW4VV4yA/hcTKOEIjEGXLPyxtjL
        ZOvtD5gdl0f5TaGfvCkq6KE=
X-Google-Smtp-Source: ADUXVKK+hP9cgD1bhmnjVxwR2vSOiQ9ekRjIk2Jnr/pD1NlEtwtRHJCf6Dk0aTZKbWc0/f6kFauMkg==
X-Received: by 2002:a2e:4082:: with SMTP id r2-v6mr2056234lje.48.1527682440286;
        Wed, 30 May 2018 05:14:00 -0700 (PDT)
Received: from gmail.com ([81.236.84.183])
        by smtp.gmail.com with ESMTPSA id t9-v6sm6999896ljh.66.2018.05.30.05.13.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 May 2018 05:13:59 -0700 (PDT)
Date:   Wed, 30 May 2018 14:13:57 +0200
From:   Marcus Folkesson <marcus.folkesson@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Felipe Balbi <balbi@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Ruslan Bilovol <ruslan.bilovol@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        USB <linux-usb@vger.kernel.org>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] usb: gadget: ccid: add support for USB CCID
 Gadget Device
Message-ID: <20180530121357.GD2939@gmail.com>
References: <20180529185021.13738-1-marcus.folkesson@gmail.com>
 <CAHp75VeSbC3QBswCxZpoVpT4cL4pXC5eouCc9YtvBtXG3YddTg@mail.gmail.com>
 <20180530112459.GB2939@gmail.com>
 <20180530113026.GA20775@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180530113026.GA20775@kroah.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

On Wed, May 30, 2018 at 01:30:26PM +0200, Greg Kroah-Hartman wrote:
> On Wed, May 30, 2018 at 01:24:59PM +0200, Marcus Folkesson wrote:
> > Hi Andy,
> > 
> > Thank you for your comments!
> > Many good catches here!
> > 
> > On Wed, May 30, 2018 at 03:55:39AM +0300, Andy Shevchenko wrote:
> > > On Tue, May 29, 2018 at 9:50 PM, Marcus Folkesson
> > > <marcus.folkesson@gmail.com> wrote:
> > > > Chip Card Interface Device (CCID) protocol is a USB protocol that
> > > > allows a smartcard device to be connected to a computer via a card
> > > > reader using a standard USB interface, without the need for each manufacturer
> > > > of smartcards to provide its own reader or protocol.
> > > >
> > > > This gadget driver makes Linux show up as a CCID device to the host and let a
> > > > userspace daemon act as the smartcard.
> > > >
> > > > This is useful when the Linux gadget itself should act as a cryptographic
> > > > device or forward APDUs to an embedded smartcard device.
> > > 
> > > > + * Copyright (C) 2018 Marcus Folkesson <marcus.folkesson@gmail.com>
> > > 
> > > > + *
> > > 
> > > Redundant line
> > > 
> > 
> > Yep
> > 
> > > > +static DEFINE_IDA(ccidg_ida);
> > > 
> > > Where is it destroyed?
> > 
> > Hm, I'm not sure it needs to be destroyed. From lib/idr.c:
> > 
> >  * You can also use ida_get_new_above() if you need an ID to be allocated
> >  * above a particular number.  ida_destroy() can be used to dispose of an
> >  * IDA without needing to free the individual IDs in it.  You can use
> >  * ida_is_empty() to find out whether the IDA has any IDs currently allocated.
> > 
> > 
> > An empty ccidg_ida is the indication that we should clean up our
> > mess:
> > 
> > static void ccidg_free_inst(struct usb_function_instance *f)
> > ...
> > 	if (ida_is_empty(&ccidg_ida))
> > 		ccidg_cleanup();
> > 
> > If the IDA is empty, should I call ida_destroy() anyway?
> > Other similiar drivers does not seems to do that.
> > 
> > I must say that I'm not very familiar with the IDA API.
> 
> When your module is removed, you need to clean up any remaining memory
> that the ida used.  It's not obvious at all, and is a pain as you would
> think that if you statically allocate one, like you have here, it would
> not be needed.  You need to just call:
> 	ida_destroy(&ccidg_ida);
> in your module exit function.
> 
> Hope this helps,

Thank you for making it clear.

Maybe I should use
#define DECLARE_USB_FUNCTION(_name, _inst_alloc, _func_alloc)		\

instead of 
#define DECLARE_USB_FUNCTION_INIT(_name, _inst_alloc, _func_alloc)	\

and provide my own module_init/module_exit functions then?

Just give me a hint and I will do the same for
f_printer.c and
f_hid.c

as those use IDAs in a similiar way.

> 
> greg k-h

Best regards,
Marcus Folkesson
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
