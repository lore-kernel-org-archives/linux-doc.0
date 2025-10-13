Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E071547D2
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 13:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760361588; cv=none; b=gE9LzhGYrZ7ZWlHjz0oYadvuH6c50fGpcTDbtkQJG64t+26Ozjh3fVAZOksmkH75V4D9YlMKEiQ6HGYsjjnQRye3cEOzc4yv6KbrKwxEKA/N2waj6DoyXI6gNf/hPEyAQLWuLqb5abIMfe8HeFRwLTNwkkrKjnvED2hyX0WqnPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760361588; c=relaxed/simple;
	bh=hmoG2D2uWmbK3ZnQ4PzumWQE5wxc1xo/v8u8S/CiP5Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qPbqeZcJ+k2UVV2gtzNRBFiDTHDt5E+YKYhHWZ1sKJNQBzPTetA4KhVsmk0yQyKgKLBcq4RjFP8V1o7p9/9Vr+B/flKFTH/W2+qkNIbZNkUE6jMW5nrSFFo6UejtT11sT8NWOIo5r0dTpbyKZ4XRZA7FSK5Khhhh2juJDxyBbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ctsMrDw9; arc=none smtp.client-ip=209.85.219.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ctsMrDw9"
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-87a092251eeso66797386d6.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 06:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760361585; x=1760966385; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/EEJZgh8MeXJ23MQLJxa+c7vgI4rPFQhWD8rPWK2IE=;
        b=ctsMrDw9k4jxOspfqa3fxXRNwRqmn6sO79lirzntFS1y11LD4ltzTneZOpxlRYSswM
         Adm5Wx8OZN6Vn4cSvK52hIYY0y34YogJHKZYd7UkNklEGsPTO/eD+WHw6JLjAZ1tfMt2
         r6jG0K6f3LQQ6bl/gpw+gu+V1xy6kuiWDfEoaHRi40n0LD8EouPM6++OT4buFv2IjVqL
         M9sNtUSgRWuKNPbb0apTSBJH5eryGqMLdVnRT/QW8JlvNb66pFImaDbb3fZc32JFmRwE
         5H4zE0JLSsTKY38KcC7Extf9CKJBLxdO7sdz+ZndpqGUD7kDnh4T7nbwetN1CTBJ4BSW
         toew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760361585; x=1760966385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/EEJZgh8MeXJ23MQLJxa+c7vgI4rPFQhWD8rPWK2IE=;
        b=gPkNwBEeScanM7HjnQ4q7hIEUFtcGV42lCN7wltqUl7X1sgs/Va9YY3Zryq4FqkM4B
         rOAJa8S4RrxGXnHFi2tVszFGhJeZIJgHWZpKQ2Co3jNxPmYX40J/yyudQz9fgyFNo1sb
         ce6jXyGqJ+Ekocvt3oiK4K2QmmuNYyIG82XYO9NsdQ0gXMbiX5YuZd4dNGj8fy6N8bR7
         XlZiyMOU7Z9nLpDgjaAGTYddBhsSIZ/O5t1sH0Qik6j7g0LGR8Z/iW01ThIzgKnNpxyg
         Oh8jId04kXGRYB2Bgfv+iABklY7ng+BPJWXMHDrRCeL5KQ/rZWEBPpOvqfT4KPXe/xeE
         9tIg==
X-Forwarded-Encrypted: i=1; AJvYcCVlCtDlL7Bev/Xpp9yECWewCzqRfWNYg/86iirNb9yRfLDET1xCV2Rirwb51kRyMiIsBZL9i1ijuRc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyCcHyU6mRNEplkrURQAWbS05+dlEwR3nWc2pXyrjysHD9mvxE
	OUySyCA9HOJqsmlEECs9A8mjklbvQY2imNGUKy6qm8jOCZqRvSlWAy+4qiA8BN9v4flLIPazSVq
	2lD2OZo6jpFcX1YAlc0CUGcPR6JdYiGHqDK1BoM1o
X-Gm-Gg: ASbGncsMsoM540AGxpinrlzqh5bq9NIf8bJQJtIxP0ryPncU+Q7Fl+W2ihAT5TP96KR
	ghPNl+JONo0Q/ZuGHqiOL1tzibQ+jINiAiG01kQVga4+8xz8SUZgZOTujiyi8OrOLLJISYQV/Nh
	ybtpfZ+a2qNSqocQbLrEwmCLHQHsnGvILPqqYPWDLLfDt3VbWCH/jA0avB5+M2+eW9PrDEJokH4
	OjUNbZUtQ0Yw0vv0TVlAvLD/ea9l4cYeHSSsCd+/SyugPwnh25Zumr1+trybaZXzKd+G/tc2ALD
X-Google-Smtp-Source: AGHT+IGFOFnbszcLV7TMKE9XA+0FyYK4F1vsUUOPmdJlwRqTEuUndJtsgO2G2uIU5eNIQtnZia+hsgk9/Kk1UcHHzcU=
X-Received: by 2002:ac8:758e:0:b0:4d6:c73f:de88 with SMTP id
 d75a77b69052e-4e6f396e281mr217487431cf.3.1760361584510; Mon, 13 Oct 2025
 06:19:44 -0700 (PDT)
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
 <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
In-Reply-To: <04df1bb8-8409-4ece-a21c-4c71592eb852@infradead.org>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 13 Oct 2025 08:19:33 -0500
X-Gm-Features: AS18NWDz6WOml_kDvWWGqpzSlWYyUNjuwuF6ooBTtjwnBUyDba4AkLfjodlq7AE
Message-ID: <CAMCVhVMO4y9P=Y3SWvY6BvA1sUK2o=Gn6Hk2UpaueNN=6CNHZQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/11] HID: haptic: introduce hid_haptic_device
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>, Jiri Kosina <jikos@kernel.org>, 
	Benjamin Tissoires <bentiss@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Angela Czubak <aczubak@google.com>, "Sean O'Brien" <seobrien@google.com>, 
	Lucas GISSOT <lucas.gissot.pro@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 5:52=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org=
> wrote:
>
>
>
> On 10/10/25 1:30 PM, Jonathan Denose wrote:
> > Hi all,
> >
> > Thanks for looking into this.
> >
> > On Fri, Oct 10, 2025 at 1:55=E2=80=AFPM Randy Dunlap <rdunlap@infradead=
.org> wrote:
> >>
> >> Hi,
> >>
> >> I think I found it... see below.
> >>
> >>
> >> On 10/9/25 11:48 PM, Thorsten Leemhuis wrote:
> >>> [Top-Posting for easier consumption]
> >>>
> >>> Mainly writing this mail to bring Lucas GISSOT in here, who reported =
the
> >>> same error yesterday here:
> >>> https://lore.kernel.org/all/aOgvA8Jiofcnk2xb@ARSENIURE.localdomain/
> >>>
> >>> Lucas there suggested:
> >>> """but it seems to me that the #if IS_ENABLED(CONFIG_HID_HAPTIC) in
> >>> hid-haptic.h should be replaced by IS_BUILTIN(CONFIG_HID_HAPTIC) and
> >>> Kconfig updated."""
> >>>
> >>> And Randy: Thx for the closer investigation! It explains some of the
> >>> "that feels odd, am I holding this wrong" feeling I had when reportin=
g this.
> >>>
> >>> Ciao, Thorsten
> >>>
> >>> On 10/10/25 06:50, Randy Dunlap wrote:
> >>>> On 10/9/25 7:43 AM, Thorsten Leemhuis wrote:
> >>>>> On 8/19/25 01:08, Jonathan Denose wrote:
> >>>>>> From: Angela Czubak <aczubak@google.com>
> >>>>>>
> >>>>>> Define a new structure that contains simple haptic device configur=
ation
> >>>>>> as well as current state.
> >>>>>> Add functions that recognize auto trigger and manual trigger repor=
ts
> >>>>>> as well as save their addresses.Hi,
> >>>>>> Verify that the pressure unit is either grams or newtons.
> >>>>>> Mark the input device as a haptic touchpad if the unit is correct =
and
> >>>>>> the reports are found.
> >>>>>>  [...]
> >>>>>> +config HID_HAPTIC
> >>>>>> +  tristate "Haptic touchpad support"
> >>>>>> +  default n
> >>>>>> +  help
> >>>>>> +  Support for touchpads with force sensors and haptic actuators i=
nstead of a
> >>>>>> +  traditional button.
> >>>>>> +  Adds extra parsing and FF device for the hid multitouch driver.
> >>>>>> +  It can be used for Elan 2703 haptic touchpad.
> >>>>>> +
> >>>>>> +  If unsure, say N.
> >>>>>> +
> >>>>>>  menu "Special HID drivers"
> >>>>>
> >>>>> I suspect this change is related to a build error I ran into today:
> >>>>>
> >>>>>   MODPOST Module.symvers
> >>>>> ERROR: modpost: "hid_haptic_init" [drivers/hid/hid-multitouch.ko] u=
ndefined!
> >>>>> ERROR: modpost: "hid_haptic_pressure_increase" [drivers/hid/hid-mul=
titouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_check_pressure_unit" [drivers/hid/hid-m=
ultitouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_input_configured" [drivers/hid/hid-mult=
itouch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_input_mapping" [drivers/hid/hid-multito=
uch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_feature_mapping" [drivers/hid/hid-multi=
touch.ko] undefined!
> >>>>> ERROR: modpost: "hid_haptic_pressure_reset" [drivers/hid/hid-multit=
ouch.ko] undefined!
> >>>>> make[3]: *** [/home/thl/var/linux.dev/scripts/Makefile.modpost:147:=
 Module.symvers] Error 1
> >>>>>
> >>>>> The config where this occurred had this:
> >>>>>
> >>>>> CONFIG_HID=3Dy
> >>>>> CONFIG_HID_MULTITOUCH=3Dm
> >>>>> CONFIG_HID_HAPTIC=3Dm
> >>>>>
> >>>>> Changing the latter to "CONFIG_HID_HAPTIC=3Dy" fixed the problem fo=
r me.
> >>>>
> >>>> Sure, but that's just covering up the problem.
> >>>>> First, I get this build error:
> >>>>
> >>>> ERROR: modpost: missing MODULE_LICENSE() in drivers/hid/hid-haptic.o
> >>>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hid/hid-ha=
ptic.o
> >>>>
> >>
> >> ISTM that tristate is incompatible with this newly added Makefile
> >> line:
> >>
> >> +hid-$(CONFIG_HID_HAPTIC)       +=3D hid-haptic.o
> >>
> >> hid-* lists files that should be builtin, not loadable modules.
> >> These should all be hid-y.  AFAIK, hid-m is not useful.
> >> (A maintainer can correct me as needed.)
>
> More correctly, any .o that is listed as being built as part of
> hid.o should is going to be controlled by CONFIG_HID and should
> not its own have a Kconfig symbol at all.
>
> E.g. here:
>  hid-y                  :=3D hid-core.o hid-input.o hid-quirks.o
> hid-core, hid-input, and hid-quirks don't have their own
> Kconfig symbols.
>
>
>
> >> So adding a MODULE_LICENSE() and MODULE_DESCRIPTION() to
> >> hid-haptic.c and changing drivers/hid/Makefile to use
> >> obj-$(CONFIG_HID_HAPTIC_        +=3D hid-haptic.o
> >>
> >> fixes the build errors for me.
> >>
> >> Angela, Jonathan D., is there any reason that
> >> hid-haptic needs to be builtin instead of a loadable
> >> module?  It's no problem for hid-multitouch.ko to call
> >> into hid-haptic.ko (both as loadable modules) as long as
> >> hid-haptic.ko is loaded first.
> >>
> > As long as hid-multitouch.ko is able to call into hid-haptic.ko I
> > don't see any issues, but is there a way to enforce that when
> > CONFIG_HID_HAPTIC is enabled, hid-haptic.ko will be loaded before
> > hid-multitouch.ko?
>
> I only know of two possibilities though there may be more.
>
> a. use request_module(true, "hid-haptic");
>
> This would probably be used in the hid core somewhere, afterthe device ma=
tching is done.
>
> b. use udev. When a device that needs hid-multitouch is
> discovered, have udev load both hid-haptic and hid-multitouch.
>
>
> I see that hid-haptic.h is written so that it has stubs for
> when CONFIG_HID_HAPTIC is not enabled. Can hid-multitouch
> operate (in a reduced capacity) when HID_HAPTIC is not enabled?
> So that they are separate modules and hid-multitouch is not
> dependent on hid-haptic?
>
> There is probably a use case for hid-multitouch without having
> hid-haptic loaded since hid-multitouch existed without having
> hid-haptic around at all.
>
> It seems that you want both of them loaded. And then Lucas
> has reported a build error when HID_HAPTIC=3Dm and
> HID_MULTITOUCH=3Dy, so either (like Lucas said) HID_HAPTIC
> should be bool, not tristate; or in Kconfig,
> HID_MULTITOUCH should depend on HID_HAPTIC, which would not
> allow the problem config that Lucas reported.
> But that forces devices that want HID_MULTITOUCH to also
> have HID_HAPTIC loaded, even though they may not need it.
>
The idea behind these patches was that hid-haptic would depend on
hid-multitouch but not the other way around. I am fine changing
HID_HAPTIC to bool. That's what I had it as initially, but I was asked
to change it.

If everyone else is fine with that, I can send out a patch.
> --
> ~Randy
>
--=20
Jonathan
