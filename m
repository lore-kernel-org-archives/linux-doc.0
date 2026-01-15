Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D5273C199F
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 17:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768497953; cv=none; b=j4kTG5qLdb35KDTGl5yukkrWX5DPMu7ihVTIufVWyRl8pvMBnwmSylUTmTSCuIL5FaAC64PWJRdWWMpIPLk1TRAPf2znwBZUmnFFYdGR2MYCeixJLvwNi7iFhq0Ee6y3ib0ZsZevtNCewGauSEfl1AKM/F840zQI5q8ozgg0bek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768497953; c=relaxed/simple;
	bh=oSBFNW2mTecRGoM6XA9w2Awj3F5k7y7FE24BbFg4xTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GBrExKIrLnhvojg+V5BtchTUxUgk1tSWvSIrFMiBsDZ34yFHkM4A08unfAAni6gCOxEtQg4CepVRx1OkLJt89ximS7FKphEo8+1VfWtAizqxM52h7VQmQk2f0wFezWcB3iXxW0PvsFrmvXjiqyYECCk2g48s025OulvCOEEDZGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BMo4E/8r; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=kLi09DsE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BMo4E/8r";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="kLi09DsE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768497951;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHSZznzjMl1NMOULsgdEoAOMKAaAnonqU4bzQ6AGE0A=;
	b=BMo4E/8rpqxsdk/W+opgA/RFcCFwsQnAVuDW4oAJCoQkJlrfQCQaLzxyV1zKw7hFQKldo4
	WxK1Z57tNu5xGKq4YuWRb9y0OyACsDPOmbNWAOToQVGaH0k6WkLJHn9gxTXHiyR0aTPkuI
	rI0i/2cgvTCR2JPLmIW/IOgvivbeiG8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-K7PIb_FIMAyfO003rWit8g-1; Thu, 15 Jan 2026 12:25:48 -0500
X-MC-Unique: K7PIb_FIMAyfO003rWit8g-1
X-Mimecast-MFC-AGG-ID: K7PIb_FIMAyfO003rWit8g_1768497946
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-45c98783535so718943b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 09:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768497946; x=1769102746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHSZznzjMl1NMOULsgdEoAOMKAaAnonqU4bzQ6AGE0A=;
        b=kLi09DsEqY6ZrovUk3p4FbuODyNatAr3Cc3sBJqlWnYa9DYd4nTYoLEqmMQxX4wms1
         hzEM64V0HEjAnLaw2XaH3JbLi6THObkIn2bS5HVghqqL4vJd0MliyihKXooUYdtlsCt+
         8IHuv/0p7RryifoCuekCFWJY/FZ8IFdMzV7IQaL4BAExif9KHoJ59rh3gdfc1whWHOSd
         pSII9S8IYK3m35yPaOpGSkwQUllzj6Qqb0V0eh10XAEn7a1eqRxp2WoiW7aYheHGeHXa
         bk4r1H3eS+kfOaTm08/Kf4cMC2oJ3974IMlkhqhTmJ9KHUAdV8oNNAp0A9ciDsx+lud5
         WG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768497946; x=1769102746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lHSZznzjMl1NMOULsgdEoAOMKAaAnonqU4bzQ6AGE0A=;
        b=nCoaOMw0yGOTWOh5VWMc8MzLIkA2sEpuWuUNKfGBrFaKJz3GXnwvUfYNbRZchjF6qX
         Y/up49FWdlwJBtd/SD1ySs3KiDfCpF1LBmaWuD8YZNArBT7qtl6E6+fJulhB5ytd8A81
         arHs49xjH/j4VNgRHpEW4/Fv5nKYmE9+2ZvfkmxuQlqUx+tHPgwTjuG00RGd95zR2sT7
         4LQszagYRkALAvVitWIa3OP/YuRPl0menOY64Kf645dn/SteJcqyh47T9Wlco666rnwC
         Cgh9DfUkkdan96BGPQuY/9y5aVZRBQSo9lD8VjOz+/kh5UhOgGssFbJDNBQn3qpcUoYy
         Whhg==
X-Forwarded-Encrypted: i=1; AJvYcCXRaeygNGCVwLyLz98gV8xpjioad6NS2azpXJr2aJu6Eju9lG7IbOIrINegDcZOR63G8DOpLFEKoxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCwdzvMV0Rflz+tYs7FrriJgy2Nn/20zBA/RiOYnyiR/R9hg3a
	L6Hmdl291GmE1fpuRtzQcb+/EXkVsWUcTJYrpmqhcw1cfPovfYhYnDfuUPaTWRIRYdd04UvDYuf
	9HhEioxMydClQZ/UH2zBWeCVqW8PABTE1snL4rqW7BQE7gBO1xmlu1IX02EeWNaX6yi8VtSAQNS
	yiCuB7k/NpC5WkUuODG7yOLbxEy9xZedcLhvvu
X-Gm-Gg: AY/fxX6ZXW4pS6NhgUbYJ95QXLx6gpLaB47SJb8EH3/g0GGOHy5vrfQ6YTIEWhjIMM+
	JLx7rTjL1J+IrfGvrIx63jropK1UgzJpWYKfld5Ouk2U9YbcjsufHoQyiDVu3n0dKU7jwX+d1Z8
	+UY3ZWuj/9plUIc9QhJtiGMlbDG8PTpJuVT0mt7EYIs+P1jS0CYkwHWE4fI/NvAYsv
X-Received: by 2002:a05:6808:4fcc:b0:450:b92c:aaa2 with SMTP id 5614622812f47-45c880ffcdcmr2381772b6e.18.1768497946458;
        Thu, 15 Jan 2026 09:25:46 -0800 (PST)
X-Received: by 2002:a05:6808:4fcc:b0:450:b92c:aaa2 with SMTP id
 5614622812f47-45c880ffcdcmr2381749b6e.18.1768497946072; Thu, 15 Jan 2026
 09:25:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251120105208.2291441-1-grzegorz.nitka@intel.com>
 <20251216144154.15172-1-vgrinber@redhat.com> <IA1PR11MB621913F389165EE4D7CCFF2D9284A@IA1PR11MB6219.namprd11.prod.outlook.com>
 <CACLnSDikAToGRvfZAhTcT0NCtMj+N9z-GGzRQ5qmpHsvCr2QSA@mail.gmail.com>
 <LV4PR11MB9491EB644FC83676522107669B8FA@LV4PR11MB9491.namprd11.prod.outlook.com>
 <CACLnSDhEQVJ5piUKp6bddxvOff88qj5X6Y8zbqAH8Kf5a7a_Zg@mail.gmail.com>
 <LV4PR11MB9491B0E591D66E4AEDE9B1329B8FA@LV4PR11MB9491.namprd11.prod.outlook.com>
 <CACLnSDggQLQMFdT3VLxm+GNNad6xy43nh6D+UzbW-u9Wwg+WOw@mail.gmail.com> <LV4PR11MB9491C8288A84379A1199DC409B8CA@LV4PR11MB9491.namprd11.prod.outlook.com>
In-Reply-To: <LV4PR11MB9491C8288A84379A1199DC409B8CA@LV4PR11MB9491.namprd11.prod.outlook.com>
From: Vitaly Grinberg <vgrinber@redhat.com>
Date: Thu, 15 Jan 2026 19:25:30 +0200
X-Gm-Features: AZwV_QiR68c78dzt7Vs78QLCFnBcBYytsRuzF6J0pDE4rljbQKo80nDKshRpZkg
Message-ID: <CACLnSDgy+mxqgy+fShC1kre05zF54tCfttqQTzzFkBt4f9UYog@mail.gmail.com>
Subject: Re: Re:[Intel-wired-lan] [PATCH v5 iwl-next] ice: add support for
 unmanaged DPLL on E830 NIC
To: "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc: "Nitka, Grzegorz" <grzegorz.nitka@intel.com>, 
	"Loktionov, Aleksandr" <aleksandr.loktionov@intel.com>, 
	"Nguyen, Anthony L" <anthony.l.nguyen@intel.com>, "horms@kernel.org" <horms@kernel.org>, 
	"intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>, 
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, "pmenzel@molgen.mpg.de" <pmenzel@molgen.mpg.de>, 
	"Kitszel, Przemyslaw" <przemyslaw.kitszel@intel.com>, "Fodor, Zoltan" <zoltan.fodor@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 5:30=E2=80=AFPM Kubalewski, Arkadiusz
<arkadiusz.kubalewski@intel.com> wrote:
>
> >From: Vitaly Grinberg <vgrinber@redhat.com>
> >Sent: Thursday, January 15, 2026 9:58 AM
> >
> >, the ea
> >
> >On Wed, Jan 14, 2026 at 3:32=E2=80=AFPM Kubalewski, Arkadiusz
> ><arkadiusz.kubalewski@intel.com> wrote:
> >>
> >> >From: Vitaly Grinberg <vgrinber@redhat.com>
> >> >Sent: Wednesday, January 14, 2026 12:39 PM
> >> >
> >>
> >> [..]
> >>
> >> >> >
> >> >> >I see a few challenges for the user here. The biggest one is that
> >> >> >the
> >> >> >application can't tell the difference between a device that will
> >> >> >report
> >> >> >phase offsets and this unmanaged device that never will.
> >> >> >A possible way forward would be adding a capability flag to the DP=
LL
> >> >> >API
> >> >> >so
> >> >> >users don't have to guess.
> >> >>
> >> >> There is no phase-offset field as pointed in the above example.
> >> >> No 'phase-offset' attribute -> no such capability.
> >> >> Why isn=E2=80=99t that enough?
> >> >
> >> >Pin reply does not contain phase offset, so no change notifications
> >> >are expected?
> >> >Could there be devices that don't report phase offset, but report sta=
te
> >> >changes?
> >> >Is this the intended use of the phase offset API to be interpreted as
> >> >a general pin
> >> >notification capability flag?
> >> >
> >>
> >> Sorry, this is not what I meant.
> >>
> >> The E810 produces notifications not only for the pin's phase offset bu=
t
> >> also for other pin attribute changes. When it comes to the E810 pins,
> >> notifications generated by phase offset changes are quite frequent.
> >> However, it wasn't intention to produce them every second; this is
> >simply
> >> the result of frequent phase offset changes.
> >>
> >> Typically, the pin state changes for the pin, but for E830, the
> >> unmanaged
> >> mode means that the state of the pin never changes, resulting in no pi=
n
> >> notifications being produced in the end.
> >>
> >> Hope that clears things up.
> >
> >Will the reported pin state remain "connected" even if I disconnect
> >the input signal?
> >Is there any information in DPLL or pin replies that can tell the user
> >"this DPLL is unmanaged type, it behaves differently"?
>
> You really cannot disconnect anything there, it is always connected,
> and no one can change it. It only shows the user actual physical
> connections hardwired into the NIC/dpll. There is no SW handled config
> possible on those. As provided in the commit message, the pins have empty
> capabilities set: 'capabilities': set(), thus not possible to change stat=
e
> by the user.
>

Got it, thanks for clarification!

> >
> >>
> >> >>
> >> >> >However, the preferred solution would be to simply mirror the E810
> >> >> >behavior
> >> >> >(sending phase offset). This preserves the existing API contract a=
nd
> >> >> >prevents users, who have already built applications for this
> >> >> >interface,
> >> >> >from needing to implement special handling for a new hardware
> >> >> >variant
> >> >> >that
> >> >> >behaves differently.
> >> >>
> >> >> This is not currently possible from driver perspective.
> >> >> We miss the FW API for it.
> >> >>
> >> >> >There are additional inconsistencies in the existing structure I
> >> >> >wanted
> >> >> >to
> >> >> >bring to your attention.
> >> >> >1. I'm not entirely sure how a 1588-TIME_SYNC pin can have a paren=
t
> >> >> >device
> >> >> >of type "eec". EEC is all about frequency synchronization, and yet
> >> >> >the
> >> >> >pin
> >> >> >named 1588-TIME_SYNC is clearly a phase pin. This also doesn't pla=
y
> >> >> >well
> >> >> >with existing implementations, where EEC circuits deal with
> >> >> >frequency,
> >> >> >PPS
> >> >> >circuits deal with phase, and there is clear distinction between t=
he
> >> >> >two
> >> >> >with regard to the meaning of "being locked".
> >> >>
> >> >> This dpll device type was established based on the main purpose of
> >> >> >dpll
> >> >> device which is to drive the network ports phy clocks with it.
> >> >
> >> >What is the physical meaning of this indication (lock-status':
> >> >'locked')? Locked on what?
> >>
> >> Lock status is dpll device property.
> >>
> >> But full picture has to be determined from the list of pins, for this
> >> particular case, one input provided from host through pci-e pin, 10MHz
> >> bandwidth frequency and 1 PPS sync pulses.
> >>
> >> As already pointed the type of dpll shall let user know the purpose of
> >> the dpll existence instead of particular input properties.
> >> Input properties are determined with the pin's attributes.
> >>
> >> >As a user of this circuit I want to know that the device is locked on
> >> >the phase of the input signal with a certain precision.
> >> >Is this the meaning of "locked" here? Can an EEC device be locked on
> >> >the Phase of the input signal?
> >>
> >> Well I don't have any data on the precision of such, but AFAIK it can.
> >> EEC dpll shall be producing stable signal, the input it uses is only
> >> part of the full dpll device picture.
> >>
> >> >Users of other devices (e810, zl3073x) may have implemented logic to
> >> >determine the phase lock by
> >> >enforcing the pin parent device type as PPS. How should they change i=
t
> >> >to determine phase lock (and why)?
> >> >
> >>
> >> I am Sorry, I don't understand the example above, could you please
> >> Elaborate on details of such setup?
> >
> >Yep, gladly!
> >Telco customers rely on the Phase being locked on the reference with a
> >certain precision. In E810 and zl3073x the equation is simple:
> >1. "eec locked" means synTonization achieved - frequency locked
> >2. "pps locked" means synChronization achieved - phase locked
> >The T-BC application checks the reported device type. If the device
> >type is "pps", the report is processed by the synchronization state
> >decision logic. Otherwise, the report doesn't have any meaning within
> >"T-BC without SyncE" context and is discarded.
> >
> >Since this patch is going to create eec reports only, they are all
> >going to be discarded, and this is a compatibility issue I'm trying to
> >address.
> >
>
> I see. From this angle the PPS type looks like a superset of EEC.
> It makes sense to me. We had also some discussion and agreed to propose
> new patch with the PPS type, as we don't want the underlying SW to be
> troubled with such issue.

Thanks very much for considering this!

> >Could you please answer my question above:
> >What is the physical meaning of this indication
> >(lock-status':'locked') in this report?
> >
>
> It means that dpll is locked/synchronized with the esync 10MHz/1PPS,
> a signal provided through pcie pin.
>
> Thank you!
> Arkadiusz
>
> >Thanks!
> >VG
> >
> >> Thank you!
> >> Arkadiusz
> >>
> >> >>
> >> >> >2. Since it is also an external embedded sync input pin, could it =
be
> >> >> >possible to expose this information and include `esync-frequency`
> >> >> >and
> >> >> >`esync-pulse`? That could be useful for configuring the leading DP=
LL
> >> >> >that
> >> >> >drives the unmanaged one.
> >> >>
> >> >> Sure, esync caps should be provided, as the commit message example
> >> >> >shown:
> >> >> +    'esync-frequency': 1,
> >> >> +    'esync-frequency-supported': [{'frequency-max': 1, 'frequency-
> >> >> >min':
> >> >>1}],
> >> >> +    'esync-pulse': 25,
> >> >>
> >> >
> >> >Oh, I must have missed that.
> >> >Thanks!
> >> >Vitaly
> >> >
> >> >> Thank you!
> >> >> Arkadiusz
> >>
>

