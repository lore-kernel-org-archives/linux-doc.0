Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1EB1E5205
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 22:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755555475; cv=none; b=OJQ2WsdfJGwdIB5MplxenQ2Er0+rYpEui6AUS8AImRNuOAPL3/YfMKRq19KTpkEFefXeZq2O3ktgEHn9q2ONRkN1WUblBkOmr479avymLn02YW5kaH/Q3RQolD7dr6ZJk46ztvYoIuhbua3flCIsl94hd/Pgf/7EhVZdbDEUP2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755555475; c=relaxed/simple;
	bh=b3wto87559qCyCbHfNALoFTxwk6XuiYHW/a4ecGD82c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y31JHhNdxhEcekzc2c6sE4znHex22pDsxChDRbHb39f189kqIoFTKr3WxPids/QTMB33Yuar/YKV8rd7Vc83dd0acm8JYcDz/VCZZlWIxMBJUCSrPftLP1W5eNm7RdL1IhF2PQ+8003XclcBzouklutDlRluuCuJ/YnnyI/HDvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dzDE4ofv; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dzDE4ofv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4b109bd8b09so60874461cf.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755555472; x=1756160272; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WK2onUg6okxUGIEB+Fm9UB5v//+YiPnv+xyAcxFLXfc=;
        b=dzDE4ofvUmxIUy6Be3iRlY6mhEOwdfAMdRdeIr9RAZGEGZuJLjU8NH6Ddkuk2Xmi/9
         tzDQXaC98xU7hXm2MWjv9iYXPJCRBk7ax9J0y7BNiroJeelhWR9O6rPW6AMFE06wUgaf
         imdI1/obfk2Gr2z1ydlP7HtJBiN61CXpf56gudNdIHDd7/fk0wTm40HQTwG6VXzP8DZy
         3RoYbXFOBZ9VzBqg+h+y0rSSWP+qKOISxiS0jKl8ARWGKwrh3qr/tVrSpl9IsgDwNAJy
         cza7kG3l4hXkrnArXOcPnAqi+bozxnx/GhckIKild9zHANKkVdNWJFeU1ZwxoWv+Y8v/
         v3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755555472; x=1756160272;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WK2onUg6okxUGIEB+Fm9UB5v//+YiPnv+xyAcxFLXfc=;
        b=AxfcGz9DOmrL8QN9EGQRHWtfIp9Mlisxsx3WmBZP8pkkdaYC+POPyZ9zbXLewU18ou
         uGOdq6x6evT29X5UxOCNnSG9rF9dyfuZwKnMn1WTNERsI0UhKZUBQOUQYota0Y4wLwJc
         j5mHMMZacEr+SHN8yeF7DG3OTX2tIsrjYVYufA/nTFqhGH6b5gpMZluC4/gdRd4zj4yN
         Ztw4DjqdyNNmAJ/q+mad8nI/iJIUG6k9ZzoE4TBaDf27MOiDH6TCwOF1WT5gmK03FxIZ
         2SPf4Rl8RlKXITOOSAgjLWSfnrPitAgV3KHfVM2SF7+aZbakJ0wBnmFUkccvdykCmJn+
         Lk5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC16rAqqI5dijqC+KxYHo+K9i7djLOwfTdZV0tt+3ineHP+K1LxP3Fe7jWVRXFPvneHQs3W+xGSoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwPCdfC/kFDlpil6MCRy6f8rAqqpzgODy0/pCZsjj1r4mbIyRuN
	J1TZ9C7nerAoXeO07ik2pkjCvq1UIutjdvzIu4LgZs4rbse379EBPtFY+W/X5yroCqXLX4qB4xQ
	cUsOuOsH/5SWP4sMDAsjDV35W0d0T8gGWuU47Otqg
X-Gm-Gg: ASbGncvReY3jUSv0JYgJR/+VsxXksYtyKHdQZm+WfofFa21SPbOH1grDr3WC3wiJ7uZ
	i4GSwNVFkAZ6Lh1+RV3t5zxug7KzZxNbOslnrciUfvMXL7twrlnjp2PKoVxuSySxXax/M983AjW
	IMpRJUmvmbwZXr8QRUvMB4wafdeUlYljV7Rn2RdL8Wnv25Izt/ycaUptYzZ5ObcTn4JUH1NN1m0
	37H+AuhujaGMEb80nx49DrbEKXZ1H4uqyG0qaL+EXWHBAI=
X-Google-Smtp-Source: AGHT+IGhYztxrXzH6eEInZgw2LPB+xjG6JouOLBThwkZP0g9AMiU1/wcJDz42XUHukbUjy5ECoVs/z+YDAa9+ysMqno=
X-Received: by 2002:a05:622a:1a0c:b0:4ab:41a7:847 with SMTP id
 d75a77b69052e-4b286d6f665mr3236841cf.31.1755555472039; Mon, 18 Aug 2025
 15:17:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
 <20250818-support-forcepads-v2-4-ca2546e319d5@google.com> <67156238-7915-4725-a030-d0b422a2aedc@infradead.org>
In-Reply-To: <67156238-7915-4725-a030-d0b422a2aedc@infradead.org>
From: Jonathan Denose <jdenose@google.com>
Date: Mon, 18 Aug 2025 17:17:41 -0500
X-Gm-Features: Ac12FXxcfgAu-vW8zWRK9vSDx2xF861qdRiRkxuBPBNzlYiGSzEwPIfH3ui8Mqo
Message-ID: <CAMCVhVMm7p8cB-2SxYg2Q29vDg=b-N=_Cg72uv4qdAzZyQjBMA@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] HID: haptic: introduce hid_haptic_device
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Angela Czubak <aczubak@google.com>, "Sean O'Brien" <seobrien@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 11:36=E2=80=AFAM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Hi,
>
> On 8/18/25 7:28 AM, Jonathan Denose wrote:
> > From: Angela Czubak <aczubak@google.com>
> >
> > Define a new structure that contains simple haptic device configuration
> > as well as current state.
> > Add functions that recognize auto trigger and manual trigger reports
> > as well as save their addresses.
> > Verify that the pressure unit is either grams or newtons.
> > Mark the input device as a haptic touchpad if the unit is correct and
> > the reports are found.
> >
> > Signed-off-by: Angela Czubak <aczubak@google.com>
> > Co-developed-by: Jonathan Denose <jdenose@google.com>
> > Signed-off-by: Jonathan Denose <jdenose@google.com>
> > ---
> >  drivers/hid/Kconfig      |  11 +++++
> >  drivers/hid/Makefile     |   1 +
> >  drivers/hid/hid-haptic.c |  72 ++++++++++++++++++++++++++++++++
> >  drivers/hid/hid-haptic.h | 105 +++++++++++++++++++++++++++++++++++++++=
++++++++
> >  4 files changed, 189 insertions(+)
> >
> > diff --git a/drivers/hid/Kconfig b/drivers/hid/Kconfig
> > index 43859fc757470caf6ad43bd5f72f119e9c36aea7..cbbe82a0a2ba257e45f77ca=
014fb5f08b71fc62f 100644
> > --- a/drivers/hid/Kconfig
> > +++ b/drivers/hid/Kconfig
> > @@ -92,6 +92,17 @@ config HID_GENERIC
> >
> >       If unsure, say Y.
> >
> > +config HID_HAPTIC
> > +     bool "Haptic touchpad support"
>
> Why bool instead of tristate?
No particular reason, I can change it to tristate.
>
> > +     default n
> > +     help
> > +     Support for touchpads with force sensors and haptic actuators ins=
tead of a
> > +     traditional button.
> > +     Adds extra parsing and FF device for the hid multitouch driver.
> > +     It can be used for Elan 2703 haptic touchpad.
> > +
> > +     If unsure, say N.
> > +
>
> I do wish that hid/Kconfig indentation didn't vary so much from coding-st=
yle.rst.
>
> >  menu "Special HID drivers"
> >
> >  config HID_A4TECH
>
>
>
> > diff --git a/drivers/hid/hid-haptic.h b/drivers/hid/hid-haptic.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..b729f8245aa60c3d06b79b1=
1846dccf6fcc0c08b
> > --- /dev/null
> > +++ b/drivers/hid/hid-haptic.h
> > @@ -0,0 +1,105 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + *  HID Haptic support for Linux
> > + *
> > + *  Copyright (c) 2021 Angela Czubak <acz@semihalf.com>
> > + */
> > +
> > +/*
> > + */
> eh?
I can clean this up as well.
>
> > +
> > +
> > +#include <linux/hid.h>
> ?
>
> --
> ~Randy
>
I'll also fix the grammatical error you noted on the patch before this
one and resubmit. Thanks for your review!
--
Jonathan
