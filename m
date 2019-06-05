Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CF247D981
	for <lwn-linux-doc@archive.lwn.net>; Wed,  5 Jun 2019 08:40:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726626AbfFEIkH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 5 Jun 2019 04:40:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43369 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726757AbfFEIkH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jun 2019 04:40:07 -0400
Received: by mail-wr1-f66.google.com with SMTP id r18so9540144wrm.10
        for <linux-doc@vger.kernel.org>; Wed, 05 Jun 2019 01:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=7sYE2J+nNG7NcVyj1SpqdIcPNhqdKRKxo+uFloEUcYA=;
        b=LCtqBMObpnEJUzXhUa2KBDhhGtP6Z0Je9IZDWPItajoEPZckstJr8HVAGpXh74zze7
         0U2lov6PpWF2ZgX4m9OiDIkaqFMXirtnwusgz3HFK2Po0H1w5ZbljIi/thGgvdmpWJnC
         dRANufgc3l16wDWa/fliGfphJD8xHnPpdS7D7k5zrj+LbYrowjiPFvm5n9YWjAqTShL7
         S4gVW0qZR6Sqce4NauGzvT70h7Xm7Tus3o91Ka/RDLAshZTBNtDYvOfUuadbqiHrNW8V
         Dc7cJFhnVjzkiLxR7XTBBGKldcYHajIdTpXj4fl1wC3ThKzZW0RekwieUFH+6/d8vBKN
         g/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=7sYE2J+nNG7NcVyj1SpqdIcPNhqdKRKxo+uFloEUcYA=;
        b=P9PvfbQC3TTt15KuSvsZFl/M6OkHBa2yF0F1u5OJoNUwOrxjT3QkYKLFe1BEf5IzBq
         10btCEwkRGgNqIsG/SxH2OEviJJC7WBUxKTWPzsTOA6eczW+m9Yh2eNpDMfHkO0S3hg7
         o3ddr11EzlFKXUT5d1lvd2mk9g3Otp/z76rOfqlcgcCygUrPEiN/x21Ca5LNFffig6NM
         vPiM9Qy+tcNdBVblw0DvotZVhpRWytYeAecjgVXdfSdRORJkjerR6TozRACGbcoRLgHB
         umXQ9L+DO4hbJ7a/MU0M1uc7Zg/dfbSaiNriIO+3jGmY0asJfG0izlFhKHRJc+lS7ggb
         uqhA==
X-Gm-Message-State: APjAAAXHDluALfPpN+akZ+dEA5GVGx7E2zZX4WpQV//JoJ7xdlHkJpid
        9ywfXgMP8v/QJy1DZFc6X3j6pw==
X-Google-Smtp-Source: APXvYqy94j6MN0e6x+n+ChvdKkGrhMwtb/gKXV7dL/W7PkJmOaG67CUKgq6B2PCEi6giA03uyBSxvg==
X-Received: by 2002:a5d:4e4d:: with SMTP id r13mr12760599wrt.295.1559724005609;
        Wed, 05 Jun 2019 01:40:05 -0700 (PDT)
Received: from dell ([2.27.167.43])
        by smtp.gmail.com with ESMTPSA id j66sm24368884wmb.24.2019.06.05.01.40.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Jun 2019 01:40:04 -0700 (PDT)
Date:   Wed, 5 Jun 2019 09:40:02 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <groeck@google.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Gwendal Grignou <gwendal@chromium.org>,
        Guenter Roeck <groeck@chromium.org>,
        Benson Leung <bleung@chromium.org>, kernel@collabora.com,
        Dmitry Torokhov <dtor@chromium.org>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-doc@vger.kernel.org, Enno Luebbers <enno.luebbers@intel.com>,
        Guido Kiener <guido@kiener-muenchen.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Jonathan Corbet <corbet@lwn.net>, Wu Hao <hao.wu@intel.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Tycho Andersen <tycho@tycho.ws>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Jilayne Lovejoy <opensource@jilayne.com>
Subject: Re: [PATCH 03/10] mfd / platform: cros_ec: Miscellaneous character
 device to talk with the EC
Message-ID: <20190605084002.GP4797@dell>
References: <20190604152019.16100-1-enric.balletbo@collabora.com>
 <20190604152019.16100-4-enric.balletbo@collabora.com>
 <20190604155228.GB9981@kroah.com>
 <beaf3554bb85974eb118d7722ca55f1823b1850c.camel@collabora.com>
 <20190604183527.GA20098@kroah.com>
 <CABXOdTfU9KaBDhQcwvBGWCmVfnd02_ZFmPGtJsCtGQ-iO9A3Qw@mail.gmail.com>
 <20190604185953.GA2061@kroah.com>
 <20190605064839.GH4797@dell>
 <20190605080241.GC9693@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190605080241.GC9693@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 05 Jun 2019, Greg Kroah-Hartman wrote:

> On Wed, Jun 05, 2019 at 07:48:39AM +0100, Lee Jones wrote:
> > On Tue, 04 Jun 2019, Greg Kroah-Hartman wrote:
> > > On Tue, Jun 04, 2019 at 11:39:21AM -0700, Guenter Roeck wrote:
> > > > On Tue, Jun 4, 2019 at 11:35 AM Greg Kroah-Hartman
> > > > <gregkh@linuxfoundation.org> wrote:
> > > > >
> > > > > On Tue, Jun 04, 2019 at 01:58:38PM -0300, Ezequiel Garcia wrote:
> > > > > > Hey Greg,
> > > > > >
> > > > > > > > + dev_info(&pdev->dev, "Created misc device /dev/%s\n",
> > > > > > > > +          data->misc.name);
> > > > > > >
> > > > > > > No need to be noisy, if all goes well, your code should be quiet.
> > > > > > >
> > > > > >
> > > > > > I sometimes wonder about this being noise or not, so I will slightly
> > > > > > hijack this thread for this discussion.
> > > > > >
> > > > > > >From a kernel developer point-of-view, or even from a platform
> > > > > > developer or user with a debugging hat point-of-view, having
> > > > > > a "device created" or "device registered" message is often very useful.
> > > > >
> > > > > For you, yes.  For someone with 30000 devices attached to their system,
> > > > > it is not, and causes booting to take longer than it should be.
> > 
> > Who has 30,000 devices attached to their systems?
> 
> More than you might imagine.
> 
> > I would argue that
> > in these special corner-cases, they should knock the log-level *down*
> > a notch.  For the rest of us who run normal platforms, an extra second
> > of boot time renders a more forthcoming/useful system than if each of
> > our devices initialised silently.
> > 
> > Personally I like to know what devices I have on my system, and the
> > kernel log is the first place I look.  As far as I'm concerned, for
> > the most part, if it's not in the kernel log, I don't have it.
> 
> Then you "do not have" lots of devices, as we have been removing these
> messages for a number of years now :)
> 
> >  "Oh wow, I didn't know I had XXX functionality on this platform."
> > 
> > In my real job, I am currently enabling some newly released AArch64
> > based laptops for booting with ACPI.  I must have wasted a day whilst
> > enabling some of the devices the system relies upon, just to find
> > out that 90% of them were actually probing semi-fine (at least probe()
> > was succeeding), just silently. *grumble*
> 
> Yup, that's normal.  If you want to see what devices are in the system,
> look in /sys/devices/ as that is what it is for, not the kernel log.

My guess is that less than 1% of Linux users use /sys/devices in this
way.  It's a very unfriendly interface.  Besides, when enabling a new
platform, access to sysfs comes too far down the line to be useful in
the majority of cases.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
