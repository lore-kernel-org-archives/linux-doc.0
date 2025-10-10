Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5308C2ED860
	for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 21:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760130587; cv=none; b=rD9WRMPFKvWaZQRykpAtCYvIc5N/dXbPgFLv5gVA01FIMPVeBZRNqB+d1885UV9sxyVJHzJNDggXz5Iqk7PVtMpgwRMON5k1QRf1wJghhKXH8NpnF0weIagoD3KNmf0RDAIb40Qo2x87WARJvDlZzqenCg/UKqNwlX4hbMAlD6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760130587; c=relaxed/simple;
	bh=hgyCFWAvyhgvatIU/K0unb+MfKo3mrh42mP8FTzGTPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i5NvaT5FpA1QJa5qTLDjfneqG2JZlBBkPOROkK4UJey5wiPcgkm1kCpcQ+ixuFH2/t7WmRg0nVxaZgJ/4+rmkZZBv2Go7CzN6X7C7zf1zBKwFC2vx19xwhQteAmrwR1m65duh9eLrfafXhXNcAto1A5+cd1mUZVPxOEjnjFWGd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DxdqAXmt; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DxdqAXmt"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e3a50bc0fso19220875e9.3
        for <linux-doc@vger.kernel.org>; Fri, 10 Oct 2025 14:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760130583; x=1760735383; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YL9Lfr4K4sqYkwAFmLjCmYw/FX8K54aol5jtmBg3r+U=;
        b=DxdqAXmtcHNMWwewyW+k1taGaAShtO0P2C+yfsjFOkZTZtpDtzkzZ5l3iGi/5DvowN
         0wvOQJnPkuUJbc6dw5huK87ykQlpIld3BkWelKRpOC9b2Gb2SV9faHety9OCu9CKHXNL
         bnHsbbpWFCh5UAXfL1YgutpOhbZEIE0okVWwlzzlCw0UPTiPlfBR8monmq7gbtf9+f+U
         lnc3g7Lm0qPbKULzR8GKxj8ABqMo3b0xjUlXRJRHdZMvI6rgsX5ycFBqIFJvJi07tOvv
         aTG9qc4FHKAMg5pI/l5OgjaMLFH0KJTagMtE+EN2oe3SZ8f83KO9ushWvmeNjrGVTM88
         /ABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760130583; x=1760735383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YL9Lfr4K4sqYkwAFmLjCmYw/FX8K54aol5jtmBg3r+U=;
        b=UYVXkqK1qcSadKpO9gE2qqRM1ZXDYKiiy+RKcu25PTse/03iGklV3/FJV3tYMpRAb5
         jdojzUSoaufEZQlwCfUHOCjz3/1oQnflLQOvxzU+nxaqJ5C7OjXx5/TQZukEyk8Q7hTG
         GAVUi1aLkvxodMntV19xgSSbCkmDHvWNd8MydsmjxgPKYd/fKI/ncUEZAq1jHUv0x2DO
         FReh8VfcGIXjTXIp6hAD7j2SctqDcbUWYbfhqOVORT20ZuChwMta7GN9EzUOqmI6rkIC
         S3kM9BQ9Ij8EWLeaQyVSZZ/ff1dU6eJXwscB5kJvNr5sTIzHu6/tPC0pBBcUp2nqQ4ss
         7zww==
X-Forwarded-Encrypted: i=1; AJvYcCUaWmGGNdKXXLUNSN5WjWvBLdpX9ZmGOlTyeSJ3vsFSdrNgz61wMF7UNFxl/7kBmFomLFaPpOFOSJI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTzeei9FdifXuXk5MEehWde/BjVsqAEiC4YeF9p8rOrnqMtL1g
	DghYOCGXr0v9+nXhiO4pGhLn06M2cVPprnDWfpwddpIfudgDtYF3rEGn
X-Gm-Gg: ASbGnctRL20rWuoJ23sMO3jrWF/WFfz+UA0zqk1nhvG6ZgeG0kw2A0jEOUTU8snCZet
	VDuDF5zJ2Wo277kKB4LASLIr9KovuOZTKRbuE52FFIcIhoEgEfrEarWpSwK94MuWxToYugmt2cP
	rZgCnFA7uEnq7bYYZkutxU6s4SJu9LXQStgGXzRiWwG+FPIQeIG6pDT9DpFZKT5H38hvVlo0+eZ
	4Ma/vyqLi5+eJ7HkJyOosZuLDaXfCfmpDRnLzUERPpHQ74+vV0lFIMTCxO2U5xI8TKxmFDnVWbJ
	SCD9LgKycABzGge8ATSXHb+K9zuoH0MgllIyq32nSec/7qNAUW8s5ugFwm/ixq2rmRq0elr5gwg
	9bkiXDHtG6lkqM8Pb+rtLXRsZe7ae+WyFWg3hq+/A8A1uvKYX2r84ld6VFLVrW+fN0kiCg2IYnJ
	on9VvJnRlXL1mcYv2jNBb0XmRCRfVYJikYLHz8vWvslw0tMOknhu3IDg==
X-Google-Smtp-Source: AGHT+IGO8jgeWqNOOxRgUfgzCS0O4EYngbpmbTcHl8ghsaUEWelooW8Epj+R+0pCYLOszI7amA9a+w==
X-Received: by 2002:a05:6000:2509:b0:3ee:147a:9df with SMTP id ffacd0b85a97d-4266e7df9d1mr8719807f8f.39.1760130583273;
        Fri, 10 Oct 2025 14:09:43 -0700 (PDT)
Received: from ARSENIURE.localdomain (lfbn-tou-1-1184-225.w90-76.abo.wanadoo.fr. [90.76.241.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-426ce5e13b6sm5870804f8f.44.2025.10.10.14.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 14:09:42 -0700 (PDT)
Date: Fri, 10 Oct 2025 23:09:39 +0200
From: Lucas GISSOT <lucas.gissot.pro@gmail.com>
To: Jonathan Denose <jdenose@google.com>
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Angela Czubak <aczubak@google.com>,
	Sean O'Brien <seobrien@google.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
Message-ID: <aOl2E75q9L1rCyzd@ARSENIURE.localdomain>
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com>
 <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org>
 <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org>
 <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>

Hi,
I applied Randy's patch and built with CONFIG_HID_MULTITOUCH=m and
CONFIG_HID_HAPTIC=m, it builts; but there is an ld error on hid_haptic_*
functions as soon as CONFIG_HID_MULTITOUCH is changed to yes.

Is this .config not something desired, and then HID_HAPTIC should not be
a tristate (if I understood correctly), or is there another problem?

Thanks,

Lucas

On Fri, Oct 10, 2025 at 03:30:05PM -0500, Jonathan Denose wrote:
> Hi all,
> 
> Thanks for looking into this.
> 
> On Fri, Oct 10, 2025 at 1:55 PM Randy Dunlap <rdunlap@infradead.org> wrote:
> >
> > Hi,
> >
> > I think I found it... see below.
> >
> >
> > On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> > > [Top-Posting for easier consumption]
> > >
> > > Mainly writing this mail to bring Lucas GISSOT in here, who reported the
> > > same error yesterday here:
> > > https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> > >
> > > Lucas there suggested:
> > > """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> > > hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> > > Kconfig updated."""
> > >
> > > And Randy: Thx for the closer investigation! It explains some of the
> > > "that feels odd, am I holding this wrong" feeling I had when reporting this.
> > >
> > > Ciao, Thorsten
> > >
> > > On 10/10/25 06:50, Randy Dunlap wrote:
> > >> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> > >>> On 8/19/25 01:08, Jonathan Denose wrote:
> > >>>> From: Angela Czubak <aczubak@google.com>
> > >>>>
> > >>>> Define a new structure that contains simple haptic device configuration
> > >>>> as well as current state.
> > >>>> Add functions that recognize auto trigger and manual trigger reports
> > >>>> as well as save their addresses.Hi,
> > >>>> Verify that the pressure unit is either grams or newtons.
> > >>>> Mark the input device as a haptic touchpad if the unit is correct and
> > >>>> the reports are found.
> > >>>>  [...]
> > >>>> +config HID_HAPTIC
> > >>>> +  tristate "Haptic touchpad support"
> > >>>> +  default n
> > >>>> +  help
> > >>>> +  Support for touchpads with force sensors and haptic actuators instead of a
> > >>>> +  traditional button.
> > >>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> > >>>> +  It can be used for Elan 2703 haptic touchpad.
> > >>>> +
> > >>>> +  If unsure, say N.
> > >>>> +
> > >>>>  menu "Special HID drivers"
> > >>>
> > >>> I suspect this change is related to a build error I ran into today:
> > >>>
> > >>>   MODPOST Module.symvers
> > >>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multitouch.ko] undefined!
> > >>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147: Module.symvers] Error 1
> > >>>
> > >>> The config where this occurred had this:
> > >>>
> > >>> CONFIG_HID=y
> > >>> CONFIG_HID_MULTITOUCH=m
> > >>> CONFIG_HID_HAPTIC=m
> > >>>
> > >>> Changing the latter to "CONFIG_HID_HAPTIC=y" fixed the problem for me.
> > >>
> > >> Sure, but that's just covering up the problem.
> > >>> First, I get this build error:
> > >>
> > >> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> > >> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-haptic.o
> > >>
> >
> > ISTM that tristate is incompatible with this newly added Makefile
> > line:
> >
> > +hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> >
> > hid-* lists files that should be builtin, not loadable modules.
> > These should all be hid-y.  AFAIK, hid-m is not useful.
> > (A maintainer can correct me as needed.)
> >
> > So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> > hid-haptic.c and changing drivers/hid/Makefile to use
> > obj-$(CONFIG_HID_HAPTIC_        += hid-haptic.o
> >
> > fixes the build errors for me.
> >
> > Angela, Jonathan D., is there any reason that
> > hid-haptic needs to be builtin instead of a loadable
> > module?  It's no problem for hid-multitouch.ko to call
> > into hid-haptic.ko (both as loadable modules) as long as
> > hid-haptic.ko is loaded first.
> >
> As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> don't see any issues, but is there a way to enforce that when
> CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> hid-multitouch.ko?
> >
> > Thanks.
> >
> > ~Randy
> > ---
> > ---
> >  drivers/hid/hid-haptic.c |    3 +++
> >  1 file changed, 3 insertions(+)
> >
> > --- linux.orig/drivers/hid/hid-haptic.c
> > +++ linux/drivers/hid/hid-haptic.c
> > @@ -10,6 +10,9 @@
> >
> >  #include "hid-haptic.h"
> >
> > +MODULE_DESCRIPTION("HID haptic touchpad support");
> > +MODULE_LICENSE("GPL");
> > +
> >  void hid_haptic_feature_mapping(struct hid_device *hdev,
> >                                 struct hid_haptic_device *haptic,
> >                                 struct hid_field *field, struct hid_usage *usage)
> > ---
> >  drivers/hid/Makefile |    3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > --- linux.orig/drivers/hid/Makefile
> > +++ linux/drivers/hid/Makefile
> > @@ -4,7 +4,8 @@
> >  #
> >  hid-y                  := hid-core.o hid-input.o hid-quirks.o
> >  hid-$(CONFIG_DEBUG_FS)         += hid-debug.o
> > -hid-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> > +
> > +obj-$(CONFIG_HID_HAPTIC)       += hid-haptic.o
> >
> >  obj-$(CONFIG_HID_BPF)          += bpf/
> >
> >
> --
> Jonathan
