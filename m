Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28372F3617
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 21:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760389209; cv=none; b=CTppKRV4iua8bnLfWOx01IxY7nGTqMt8DA+1xrdh34d29MVQS02GR23MrpUHm2h1V6FG0k555Y4KOEXJGEbO4ieKkru6U3xrz3TBQN2WL+3VfvKY1bWsA7+/KTxVW7T+Pu9dIbpuvk/rBevRNXEJnPnWJ9B3og0/TnGTsmdEtos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760389209; c=relaxed/simple;
	bh=8N6pwMqMsjrBwemxDeBq9pxa/WTqSwlwsriOBiG5ao8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oYv605natoGHrxCitXF15GNJTnEzo00iy5E2E37nei31etIbTRYiy5bPgrAdX00GXY3EFpT04j63dy4/wmI52KD+cpTaqscMqQUPUkiOM6jdgDSLi5HQKI9N/qJnI0cvOfggRfaekju+uuiYUfCxZlYbCXFWiSa77NvPT5fJ+xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wDg2C98J; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wDg2C98J"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-7946137e7a2so71469906d6.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760389207; x=1760994007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv6/dQLvNjxW4PYw4AxPNUEOY29ORTs/lWjIuQAewSc=;
        b=wDg2C98Ju6cI6hdLrs/qbNGp7PG0unv9xi1FGvbORHdbcDUTYYAQwU0cSo1PSeK7iM
         D987F+KJkny2kn4RgciX5kLj2RLD8DnX4wwFRgTmsa+SLDplsWHfJ5M5IZcIy6Ac9drn
         AnjamGf0lp3rc4FFS06fwXP4ug9rPueFRnmKW+yx5R+fgzzbxdsqO5tnrTylRtADykeR
         Y2iXOQQ8LyEscU6nUZrmGIx5bNFZsWFaJG5GdO8oiyrHlwRf8IU+60MW25Y4nOUbiKGB
         ze6RvXaNMYZD5L3JGIXtGJ3Ef/v8hyVHgPYhKwmIhFBqfQRoG+puw4riEfSlr1TYo/yB
         qJNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760389207; x=1760994007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fv6/dQLvNjxW4PYw4AxPNUEOY29ORTs/lWjIuQAewSc=;
        b=c55SodD/tTbdLDuEXrXrqho6tVBbiwb25s1w+moOC/oye9LbgKeFJyVwa4rNQHjfPT
         /O5x2tOCBWAToNJ251eC4UQkltIvEL38e4cRc3A2reofarzKNd7P8EJ1R+zFra2JvUlV
         DDvATq7Z2sWPeX1mgpxSgbty/L1dHiYFzTbb2ZFfgivSeNsDf1vaJ6NMuY29lE9W6Ul0
         Tiw2iI4TXkWIZmqE2kjSyFtLeYdY21+D+DW723tNFxZAETaDIuhHkp0qiBcKeJI5ev0H
         VMBhp/uJ13q7DFIg5IZVBEMmcfpRo+MO05NJnrjw8sLQFgKrimzHS+WzoqtTiurdf/W3
         HhoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVs+8DrQ8oxYPCNXUVwVAJs4Jkwwmy2qxKNVg6jQadGMTCnFcp/dImK/XlpslFgFY40m7h+TD1gqgU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1Fjb9mFofYW4qf/8LjZwTs71vlrMiQHg59V6AXzndIT+lI0bv
	xK1ZhKbVwQMZPAVJOb5NNK7nwEcglid/J599IfHc//cZWHqtDB9L0JygzuugznOpTwqx2IYpXV8
	oTUnHtOUAZ/vH6dF+sm1Aj3i+bgIGhuRDvh08YRg4
X-Gm-Gg: ASbGncuqFrH323oUzFpMEtkZNMm9H2q25gEvqgMPHMOcfXrVq8TR/rOGEBoOcSHUfEs
	qWJKYN3IPTh2VpJGoMmi/Wo+6f1vRadEnCCKaLnSFhCoG7oR4tMGRTIv0UbEO0Eyy+j4wWk+/OO
	0N7glhOe7vssAkgxRTbnz3B7/jY1Yjc5aUqVjJpv6LyN9cJFWV6f7h+yY2ihfkA/5oA90FJB4sp
	6hJ2HQIigtiOxvHMedXEy+vQrk3VpIVk6+/jnIUcTwvDUF/0e+KDuj+SCDUpTuTDQ==
X-Google-Smtp-Source: AGHT+IFM33ESsm5lhyo6VnuXSCz5AkIXAv1UbDTCjh5Aqjgddh5uijyZeARZuSDyhdd7zIOozKZl+NvEm6kpAWG8p/w=
X-Received: by 2002:a05:622a:988:b0:4dc:4828:b7a6 with SMTP id
 d75a77b69052e-4e6ead85a00mr315262301cf.59.1760389206324; Mon, 13 Oct 2025
 14:00:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-support-forcepads-v3-0-e4f9ab0add84@google.com>
 <20250818-support-forcepads-v3-4-e4f9ab0add84@google.com> <2b377001-7ee8-449c-b107-1c0164fa54f0@leemhuis.info>
 <3184c648-661b-4cf4-b7cf-bd44c381611d@infradead.org> <1cd7fb11-0569-4032-905c-f887f3e0dd4c@leemhuis.info>
 <f2243a9b-e032-416b-aef8-958198ff3955@infradead.org> <CAMCVhVOm5xzN6pkX5cKMSHrMqvdCD_14+XuunAuJLENgLO1NqA@mail.gmail.com>
 <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org> <CAMCVhVMO4y9P=Y3SWvY6BvA1sUK2o=Gn6Hk2UpaueNN=6CNHZQ@mail.gmail.com>
 <auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto>
In-Reply-To: <auypydfkhx2eg7vp764way4batdilzc35inqda3exwzs3tk3ff@oagat6g46zto>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 13 Oct 2025 15:59:55 -0500
X-Gm-Features: AS18NWA_664lvnWFFFKyoM3gwJmlLilerT2LhBP871R2c6e1_-WnlemNKjRgEw0
Message-ID: <CAMCVhVPJR0LvZF0nzn5QOK-STbPoaHmv4qKw+ibteW79Svr8FQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Benjamin Tissoires <bentiss@kernel.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Thorsten Leemhuis <linux@leemhuis.info>, 
	Jiri Kosina <jikos@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Angela Czubak <aczubak@google.com>, "Sean O'Brien" <seobrien@google.com>, 
	Lucas GISSOT <lucas.gissot.pro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 9:29=E2=80=AFAM Benjamin Tissoires <bentiss@kernel.=
org> wrote:
>
> On Oct 13 2025, Jonathan Denose wrote:
> > On Fri, Oct 10, 2025 at 5:52=E2=80=AFPM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> > >
> > >
> > >
> > > On 10/10/25 1:30 PM, Jonathan Denose wrote:
> > > > Hi all,
> > > >
> > > > Thanks for looking into this.
> > > >
> > > > On Fri, Oct 10, 2025 at 1:55=E2=80=AFPM Randy Dunlap <rdunlap@infra=
dead.org> wrote:
> > > >>
> > > >> Hi,
> > > >>
> > > >> I think I found it... see below.
> > > >>
> > > >>
> > > >> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> > > >>> [Top-Posting for easier consumption]
> > > >>>
> > > >>> Mainly writing this mail to bring Lucas GISSOT in here, who repor=
ted the
> > > >>> same error yesterday here:
> > > >>> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomai=
n/
> > > >>>
> > > >>> Lucas there suggested:
> > > >>> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) =
in
> > > >>> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) =
and
> > > >>> Kconfig updated."""
> > > >>>
> > > >>> And Randy: Thx for the closer investigation! It explains some of =
the
> > > >>> "that feels odd, am I holding this wrong" feeling I had when repo=
rting this.
> > > >>>
> > > >>> Ciao, Thorsten
> > > >>>
> > > >>> On 10/10/25 06:50, Randy Dunlap wrote:
> > > >>>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> > > >>>>> On 8/19/25 01:08, Jonathan Denose wrote:
> > > >>>>>> From: Angela Czubak <aczubak@google.com>
> > > >>>>>>
> > > >>>>>> Define a new structure that contains simple haptic device conf=
iguration
> > > >>>>>> as well as current state.
> > > >>>>>> Add functions that recognize auto trigger and manual trigger r=
eports
> > > >>>>>> as well as save their addresses.Hi,
> > > >>>>>> Verify that the pressure unit is either grams or newtons.
> > > >>>>>> Mark the input device as a haptic touchpad if the unit is corr=
ect and
> > > >>>>>> the reports are found.
> > > >>>>>>  [...]
> > > >>>>>> +config HID_HAPTIC
> > > >>>>>> +  tristate "Haptic touchpad support"
> > > >>>>>> +  default n
> > > >>>>>> +  help
> > > >>>>>> +  Support for touchpads with force sensors and haptic actuato=
rs instead of a
> > > >>>>>> +  traditional button.
> > > >>>>>> +  Adds extra parsing and FF device for the hid multitouch dri=
ver.
> > > >>>>>> +  It can be used for Elan 2703 haptic touchpad.
> > > >>>>>> +
> > > >>>>>> +  If unsure, say N.
> > > >>>>>> +
> > > >>>>>>  menu "Special HID drivers"
> > > >>>>>
> > > >>>>> I suspect this change is related to a build error I ran into to=
day:
> > > >>>>>
> > > >>>>>   MODPOST Module.symvers
> > > >>>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.k=
o] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid=
-multitouch.ko] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/h=
id-multitouch.ko] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-=
multitouch.ko] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-mul=
titouch.ko] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-m=
ultitouch.ko] undefined!
> > > >>>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-mu=
ltitouch.ko] undefined!
> > > >>>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:=
147: Module.symvers] Error 1
> > > >>>>>
> > > >>>>> The config where this occurred had this:
> > > >>>>>
> > > >>>>> CONFIG_HID=3Dy
> > > >>>>> CONFIG_HID_MULTITOUCH=3Dm
> > > >>>>> CONFIG_HID_HAPTIC=3Dm
> > > >>>>>
> > > >>>>> Changing the latter to "CONFIG_HID_HAPTIC=3Dy" fixed the proble=
m for me.
> > > >>>>
> > > >>>> Sure, but that's just covering up the problem.
> > > >>>>> First, I get this build error:
> > > >>>>
> > > >>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-hapt=
ic.o
> > > >>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hi=
d-haptic.o
> > > >>>>
> > > >>
> > > >> ISTM that tristate is incompatible with this newly added Makefile
> > > >> line:
> > > >>
> > > >> +hid-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
> > > >>
> > > >> hid-* lists files that should be builtin, not loadable modules.
> > > >> These should all be hid-y.  AFAIK, hid-m is not useful.
> > > >> (A maintainer can correct me as needed.)
> > >
> > > More correctly, any .o that is listed as being built as part of
> > > hid.o should is going to be controlled by CONFIG_HID and should
> > > not its own have a Kconfig symbol at all.
> > >
> > > E.g. here:
> > >  hid-y                  :=3D hid-core.o hid-input.o hid-quirks.o
> > > hid-core, hid-input, and hid-quirks don't have their own
> > > Kconfig symbols.
> > >
> > >
> > >
> > > >> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> > > >> hid-haptic.c and changing drivers/hid/Makefile to use
> > > >> obj-$(CONFIG_HID_HAPTIC_        +=3D hid-haptic.o
> > > >>
> > > >> fixes the build errors for me.
> > > >>
> > > >> Angela, Jonathan D., is there any reason that
> > > >> hid-haptic needs to be builtin instead of a loadable
> > > >> module?  It's no problem for hid-multitouch.ko to call
> > > >> into hid-haptic.ko (both as loadable modules) as long as
> > > >> hid-haptic.ko is loaded first.
> > > >>
> > > > As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> > > > don't see any issues, but is there a way to enforce that when
> > > > CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> > > > hid-multitouch.ko?
> > >
> > > I only know of two possibilities though there may be more.
> > >
> > > a. use request_module(true, "hid-haptic");
> > >
> > > This would probably be used in the hid core somewhere, afterthe devic=
e matching is done.
> > >
> > > b. use udev. When a device that needs hid-multitouch is
> > > discovered, have udev load both hid-haptic and hid-multitouch.
> > >
> > >
> > > I see that hid-haptic.h is written so that it has stubs for
> > > when CONFIG_HID_HAPTIC is not enabled. Can hid-multitouch
> > > operate (in a reduced capacity) when HID_HAPTIC is not enabled?
> > > So that they are separate modules and hid-multitouch is not
> > > dependent on hid-haptic?
> > >
> > > There is probably a use case for hid-multitouch without having
> > > hid-haptic loaded since hid-multitouch existed without having
> > > hid-haptic around at all.
> > >
> > > It seems that you want both of them loaded. And then Lucas
> > > has reported a build error when HID_HAPTIC=3Dm and
> > > HID_MULTITOUCH=3Dy, so either (like Lucas said) HID_HAPTIC
> > > should be bool, not tristate; or in Kconfig,
> > > HID_MULTITOUCH should depend on HID_HAPTIC, which would not
> > > allow the problem config that Lucas reported.
> > > But that forces devices that want HID_MULTITOUCH to also
> > > have HID_HAPTIC loaded, even though they may not need it.
>
> One way around it is to declare a stub struct haptic_operations and let
> hid-haptic.ko fill in the function pointers when it loads and remove
> them when it unloads. But it can be a little bit tedious, especially
> because making it properly working involves RCUs (we don't want to have
> mutexes everywhere).
>
> > >
> > The idea behind these patches was that hid-haptic would depend on
> > hid-multitouch but not the other way around. I am fine changing
> > HID_HAPTIC to bool. That's what I had it as initially, but I was asked
> > to change it.
> >
> > If everyone else is fine with that, I can send out a patch.
>
> I'd still prefer hid-haptic to be tristate, just because
> input_ff_memless is tristate as well. Right now distributions don't
> support the FF bits, so enforcing this into the kernel seems a little
> bit harsh on them and difficult to debug for early adopters.
>
> That being said, that build failure is pretty bad. So please send a
> (temporary) fix ASAP. If making it boolean solves the issue, then yes,
> send a boolean fix and then we can revisit it. But right now the urgency
> is to fix that.
>
> And if making it proper tristate is too hard, then we can leave with
> bool.
>
> Cheers,
> Benjamin

Changing to bool instead of tristate resolved the build error.

Submitted the patch:
https://lore.kernel.org/linux-input/20251013-hid-haptic-kconfig-fix-v1-1-b1=
ad90732625@google.com/
--=20
Jonathan
