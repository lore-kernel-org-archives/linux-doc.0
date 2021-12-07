Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA22EC433F5
	for <linux-doc@archiver.kernel.org>; Tue,  7 Dec 2021 16:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238729AbhLGQrz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Dec 2021 11:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238722AbhLGQrz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Dec 2021 11:47:55 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567C6C061748
        for <linux-doc@vger.kernel.org>; Tue,  7 Dec 2021 08:44:24 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id j140-20020a1c2392000000b003399ae48f58so2179124wmj.5
        for <linux-doc@vger.kernel.org>; Tue, 07 Dec 2021 08:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Evtwdp0F9CASt8s98IiNqsHnMJqbM0dH0j742Zmjcgs=;
        b=QcY/o/w1adog/4VwTjHK+e+xcsur2NL0TkmoVhLdYf2dtij241TiNUyCMyNjaWNH8m
         2MZzhgX0qRWGIELKj91clucc8g3YsBw86gXyS1TKG2ajPJxZFzIobEnwCE1stUQniy/q
         +Z3gyoIPtr8ijXRKkyz8B11PoR/vUOfJbv2f65SyT1BiUyIeHRMULGt8al3f6dDvcmle
         ID44FVG10fmCM/5jkq5S6wOtzVWZuR4fAROko5qeH4FUqyU1dOpInscGp3vS9Tx7qvCo
         yHCr3XntZd+fU3oMukBaovWt3dAy7RLlx2GPVnV3ORjpjQxstCTTiX2SX1+W3Apmu0CS
         tONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Evtwdp0F9CASt8s98IiNqsHnMJqbM0dH0j742Zmjcgs=;
        b=KA61O0J4Yv6RQuQK5WdO5Q5APr6gt6huKug4Vwk6n2UCVAd/XeRIFjwXdsnAWKVe9P
         zyLTsSOqvmTrtgfUDhDKti2z/dMx6MBTtrCQdtpYjkLyc+mzQElPIptTzvO12+wK8dXJ
         6gI2iP5NogGasEWpo4i6GuMJOwWe/X1VDJrMSOKEAydzQ/Af+qKqyAx8M57TToFlyZgu
         gutcy+G5p0OWguyn0trLwUca+MTOfBXZleIeSWfsNGqUDQaA8aFntK/Q5J3IU35xYxZA
         eFRk8KMnwaM/4sjznTFhskZHasJk7DHB8W1ze6vHmp8fBTE4ei9QKVNh6jsIX9qmE/G8
         7SQQ==
X-Gm-Message-State: AOAM530sxxzjUND+1241U6MpT3XAKL+fxDRsAZabGojy2s3OCQAZqMAa
        7WKXJ+/Bjwvp/ZVV+1+p+xzlDg==
X-Google-Smtp-Source: ABdhPJyJxH1wEpFMJ2iJ8B3H7fwk5UFk46IyfHNTSGcmnwxnz1fR7flpDgHrqJfGkPsvrVwJ2i2syQ==
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr8407723wmh.170.1638895462695;
        Tue, 07 Dec 2021 08:44:22 -0800 (PST)
Received: from google.com ([2a00:79e0:d:209:cb8b:b013:316d:b2f1])
        by smtp.gmail.com with ESMTPSA id z14sm191565wrp.70.2021.12.07.08.44.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Dec 2021 08:44:22 -0800 (PST)
Date:   Tue, 7 Dec 2021 16:44:18 +0000
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
Subject: Re: [PATCH 2/2] misc: dice: Add driver to forward secrets to
 userspace
Message-ID: <Ya+PYiP43YxfLS4x@google.com>
References: <20211207123617.3040177-1-dbrazdil@google.com>
 <20211207123617.3040177-3-dbrazdil@google.com>
 <Ya9cwZ94QatewwIc@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Ya9cwZ94QatewwIc@kroah.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Greg,

On Tue, Dec 07, 2021 at 02:08:17PM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 07, 2021 at 12:36:17PM +0000, David Brazdil wrote:
> > Open Profile for DICE is a protocol for deriving unique secrets at boot,
> > used by some Android devices. The firmware/bootloader hands over secrets
> > in a reserved memory region, this driver takes ownership of the memory
> > region and exposes it to userspace via a character device that
> > lets userspace mmap the memory region into its process.
> > 
> > The character device can only be opened once at any given time.
> 
> Why?  That should not matter.  And your code (correctly), does not check
> for that.  So why say that here?

It does check - open() returns -EBUSY if cmpxchg of the state from READY
to BUSY fails. I agree this is a bit unconventional but it makes things
easier to reason about. With multiple open FDs the driver would have to
wait for all of them to get released before wiping, so one user could
block the wiping requested by others by holding the FD indefinitely.
And wiping despite other open FDs seems wrong, too. Is there a better
way of doing this?

> > +#include <linux/cdev.h>
> > +#include <linux/dice.h>
> > +#include <linux/io.h>
> > +#include <linux/mm.h>
> > +#include <linux/module.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/platform_device.h>
> > +
> > +#define DICE_MKDEV		MKDEV(MAJOR(dice_devt), 0)
> > +#define DICE_MINOR_COUNT	1
> 
> Please just use the misc_device api, no need to try to claim a major
> number for just one device node.  That will simplify your code a lot as
> well.

Ok, I'll look into it.

> > +static int dice_open(struct inode *inode, struct file *filp)
> > +{
> > +	struct dice_data *data;
> > +
> > +	data = container_of(inode->i_cdev, struct dice_data, cdev);
> > +
> > +	/* Never allow write access. */
> > +	if (filp->f_mode & FMODE_WRITE)
> > +		return -EROFS;
> 
> Why do you care?  Writes just will not work anyway, right?

There is nothing else preventing writes, the reserved memory is just plain
old RAM.

Thanks,
David
