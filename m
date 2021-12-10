Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A966EC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 10 Dec 2021 15:50:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229619AbhLJPxx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:53:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238452AbhLJPxd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Dec 2021 10:53:33 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F1DDC07E5C1
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 07:48:13 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id t9so15618311wrx.7
        for <linux-doc@vger.kernel.org>; Fri, 10 Dec 2021 07:48:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rwKnwNTYIF1JbBVusqDVQtVgO8XRANKpUbejxrmEDZA=;
        b=RHzNvV4nHto+KIjYOV1bIo9TcQKpGwssv6Ls7bqOZd4gqrQ0+Db/mCzkNu9zRM+hW/
         MAp+dcVplm28rY/2JFyIUNo/51RiM2pmBb7hFyhQBpLhvxJA9iawDBpqVTQKL5I/S/Rw
         Fwk5nS2OgCxyZKLL3jTA+i5oF+md+WjJCpdJ+9gZnyz4/nA1/NQjB5+JtkuNOZFg3CDi
         UlDJSqMm+Vz9voFby9QBrlGihGwveGaIyUJmylzA8TXelBoRAuBccviLVrSfS2OcZXBh
         Qad9fbcKoXoXBgzF3AVxJvehzRFzy6TyRuo9DwKMUZiU7mJ9Xzh0kbBJSKwbt8Vpv0iS
         z9Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rwKnwNTYIF1JbBVusqDVQtVgO8XRANKpUbejxrmEDZA=;
        b=AjHXbWCzwAAboHS5Qd6+fgW5eXcWqedGt3zRdpePaSZLVLHHh82S6wz19xqAZlKXu9
         XyRxRcxCgjCdosQd/Pwahzn3q57k1w8CrSEohDRLCi40tGGyZ+sg6XsAPhHOc1JqBCa1
         AF45xw0qduajIruC8IHsRcI6swQ//pnCEjz80HOrOArHrQsVcgznT2c1Zpu4kLaSKb7H
         l5xAHoCDL1uPStb97X4uUjtqIUMAYauZolPj4h+UJ58U6UGPs/7uhTQrEmBxpWsxANpS
         C8P7/WdCOESwT1HaDqpi4+miK/Bf17MMlgRxVUzxb9ETlUtARujUFDVdxePebgGHhRre
         WIGg==
X-Gm-Message-State: AOAM533ivs7/mQePSwGXdmWfTva7LYZqBgvsL41NfGp4uGCrqKJkvJm0
        hNRTnOxakN2ciCkhhl7H+j4Kwg==
X-Google-Smtp-Source: ABdhPJydUvzDch6tNNqZfS4+8/8qTto3mxXcsiqmKEzjowF7DWFUqlggeCHwK7XjA21Meq7g9+frWQ==
X-Received: by 2002:a5d:47ab:: with SMTP id 11mr15028095wrb.148.1639151291972;
        Fri, 10 Dec 2021 07:48:11 -0800 (PST)
Received: from google.com ([2a00:79e0:d:209:57bd:f79b:724a:8b02])
        by smtp.gmail.com with ESMTPSA id o4sm14592309wmq.31.2021.12.10.07.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Dec 2021 07:48:11 -0800 (PST)
Date:   Fri, 10 Dec 2021 15:48:05 +0000
From:   David Brazdil <dbrazdil@google.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Rob Herring <robh+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Hans de Goede <hdegoede@redhat.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Andrew Scull <ascull@google.com>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v2 2/2] misc: dice: Add driver to forward secrets to
 userspace
Message-ID: <YbN2tbYZyLBdyEfS@google.com>
References: <20211209151123.3759999-1-dbrazdil@google.com>
 <20211209151123.3759999-3-dbrazdil@google.com>
 <YbIhaWC8b2DV5C7Y@kroah.com>
 <YbM29thQ7U4oUmhi@google.com>
 <YbNmsFAYDVUYopFO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YbNmsFAYDVUYopFO@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In your first email you also mentioned removing the check in dice_probe()
that only allows a single instance. On a second thought, I think it's
simpler to keep it there for now, even if the memory is dynamically
allocated, which I agree makes the code cleaner.
The reason being that if we allowed multiple instances, we'd also need
some static unique identifier that ties the cdev filename to the DT entry,
same as /dev/disk/by-uuid/. Just adding an index number to the misc
device nodename based on DT probe order sounds very fragile, and
anything more sophisticated sounds like too much trouble for something
we don't have a clear use case for right now.

On Fri, Dec 10, 2021 at 03:39:44PM +0100, Greg Kroah-Hartman wrote:
> On Fri, Dec 10, 2021 at 11:16:06AM +0000, David Brazdil wrote:
> > On Thu, Dec 09, 2021 at 04:31:53PM +0100, Greg Kroah-Hartman wrote:
> > > What is the module name, please add that here.
> > > 
> > > And "dice" is a very generic name.  I don't mind, but if you want to
> > > name it a bit more specific, that might be better.
> > Does "open-dice" sound good? I think that's the shorthand used on the
> > official website.
> 
> That might be better.
> 
> Naming is hard.
> 
> > > > +static long dice_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
> > > > +{
> > > > +	switch (cmd) {
> > > > +	case DICE_GET_SIZE:
> > > > +		/* Checked against INT_MAX in dice_probe(). */
> > > > +		return dice_rmem->size;
> > > > +	case DICE_WIPE:
> > > > +		return dice_wipe();
> > > > +	}
> > > > +
> > > > +	return -ENOIOCTLCMD;
> > > 
> > > -ENOTTY please.
> > I have no personal attachment to ENOIOCTLCMD, but it is documented as
> > "no ioctl command" and converted to ENOTTY before returning to userspace.
> > That made me think this was the right thing to do.
> 
> ENOTTY is better please.
>
> 
> > > As you only have 2 ioctls, why not just use read/write for this?  Write
> > > would cause dice_wipe() to happen, and read would return the size in the
> > > buffer provided.  Then no ioctl is needed at all.
> > Fine by me but does feel like a bit of a hack. Is that a common pattern?
> 
> ioctls are hacks too :)
> 
> read/write like this is fine to do, might make the code simpler, and
> allow the code to be used by scripts easier.  At the very least, wipe
> can be done by any language instead of only those that allow ioctls.

Alright, read/write it is. And that gets rid of ioctls altogether.

-David
