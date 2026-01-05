Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDE333FE2E
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767638700; cv=none; b=FMA+rcYn3KycSo9MdO4zCH8j9aI1FRgNA+/OBlnkhYhVEo+Jh888oAOqv+Y3sRfderq1jiRVupHtYge4d2TuFfTrLGMtN+2lKP6FbmFwT5zawiEfHwhzwj/UYJnoQa4xi3lsk8CyI7da1dJzwN31GZrBp2Nob1fDwXS2banN4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767638700; c=relaxed/simple;
	bh=K+Rq+kOnuGk0SWArkQFkHIh9hfset1dkO41/vWoEj2M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uepj8DWz56rbd4U4wCZB31rFycnEgAitmIiDXXhBOhSmUBs/+40Zi6+UPuq7JhyW68s5l+c75PgegkSbiNqnybzKm2B3G4ySQwXnvb5vOBuWQRlMXkMIoDMIvs/P13ZCC5uhryiqZYAyIqYtk4FrC83hyIeCpAD3dYc69xg11oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DqFm3cFg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DqFm3cFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ADD0C19423
	for <linux-doc@vger.kernel.org>; Mon,  5 Jan 2026 18:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767638699;
	bh=K+Rq+kOnuGk0SWArkQFkHIh9hfset1dkO41/vWoEj2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DqFm3cFgXgeUStp5z92M9CHqoAE5cA8SjN/6FX5cWlA7WCYHoNLW4PRX9rdmBh+M3
	 Ebmx4UdGbRQR+S08eq79/+g0nRbwWQOEIZxguwuL5KCt6au/4A9ztBIqc+SfjWcCSW
	 73UGELuis5Lan3fBLH5RkZdS4IBxVWcaj4mNNtTi2fZOTIUtFu+toGksTEoFeeVnPN
	 /4bxQLKMGZs+hb3lc8UtM/E2zEgV3wR+H9SBXZOgxQPM8NkhMkODI1agAAKnuVEQ1q
	 ZQ+u9s828S4Ba71pEECgU/AwYbpUrxGCFx8ALCmLixeSEGf/1yDQ+AkyL0ZIHC9zTn
	 TlYGWvu4EVHcA==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-65cfb4beabcso106885eaf.3
        for <linux-doc@vger.kernel.org>; Mon, 05 Jan 2026 10:44:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7XoEHksNv3cdeCD72gbNvBo8m9IZbMUZraQksxUWVyHkteqXqkBDaiyzxq981iizBn3Iu4CFtsjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOvKAghHNWV38znRYz2taoyoOoPAUsPsgvxi0/6hub/u7MxDN
	aH2Yy5+w9v1CXrvZ/G/lt1ESttybtxa5Jyskl/uSUzwM6OgaCYld/QsAh/Y086IhMNKf9U5IEzH
	8AdkT89GKukI6ldN+68fctJ9QSpUSgKs=
X-Google-Smtp-Source: AGHT+IFGKAsiApfi5Y3OHCrLfbW8DVIVrd9S3QDGO8rvGXOEcYqlk5GluNXAT0jx9nZtWBc6/SlMyHrryWHoA7L8gC4=
X-Received: by 2002:a05:6820:601:b0:65b:34e8:baab with SMTP id
 006d021491bc7-65f47a32c1cmr188500eaf.72.1767638698685; Mon, 05 Jan 2026
 10:44:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5977355.DvuYhMxLoT@rafael.j.wysocki> <aVvcobLt9YUL1jws@smile.fi.intel.com>
In-Reply-To: <aVvcobLt9YUL1jws@smile.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 5 Jan 2026 19:44:47 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0idtXwyQHEEL=NhJyDTa3m0pUuZgmVaHEOcGo_pGqeJOw@mail.gmail.com>
X-Gm-Features: AQt7F2pZZyGhhjbMjl6v8E7akHjCEJBD3cU70x71NJBgDuiVfPzHgk58b4HpKdA
Message-ID: <CAJZ5v0idtXwyQHEEL=NhJyDTa3m0pUuZgmVaHEOcGo_pGqeJOw@mail.gmail.com>
Subject: Re: [PATCH v1] ACPI: Documentation: driver-api: Disapprove of using
 ACPI drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans de Goede <hansg@kernel.org>, 
	Linux Documentation <linux-doc@vger.kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Zhang Rui <rui.zhang@intel.com>, 
	Armin Wolf <w_armin@gmx.de>, Danilo Krummrich <dakr@kernel.org>, 
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 4:45=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Jan 05, 2026 at 12:25:04PM +0100, Rafael J. Wysocki wrote:
>
> > Sadly, there is quite a bit of technical debt related to the
> > kernel's ACPI support subsystem and one of the most significant
> > pieces of it is the existence and use of ACPI drivers represented
> > by struct acpi_driver objects.
> >
> > Those drivers are bound directly to struct acpi_device objects, also
> > referred to as "ACPI device nodes", representing device objects in the
> > ACPI namespace defined as:
> >
> >  A hierarchical tree structure in OS-controlled memory that contains
> >  named objects. These objects may be data objects, control method
> >  objects, bus/device package objects, and so on.
> >
> > according to the ACPI specification [1].
> >
> > The above definition implies, although rather indirectly, that the
> > objects in question don't really represent hardware.  They are just
> > "device package objects" containing some information on the devices
> > present in the given platform that is known to the platform firmware.
> >
> > Although the platform firmware can be the only source of information on
> > some devices, the information provided by it alone may be insufficient
> > for device enumeration in general.  If that is the case, bindig a drive=
r
>
> binding

Fixed, thanks!

> > directly to a given ACPI device node clearly doesn't make sense.  If
> > the device in question is enumerated through a hardware interface, it
> > will be represented by a device object matching that interface, like
> > a struct pci_dev, and the ACPI device node corresponding to it will be
> > treated as its "ACPI companions" whose role is to amend the "native"
> > enumeration mechanism.
> >
> > For the sake of consistency and confusion avoidance, it is better to
> > treat ACPI device nodes in general as ACPI companions of other device
> > objects representing hardware.  In some cases though it appeared easier
> > to take a shortcut and use an ACPI driver binding directly to an ACPI
> > device node.  Moreover, there were corner cases in which that was the
> > only choice, but they all have been addressed now.
> >
> > In all cases in which an ACPI driver might be used, the ACPI device
> > node it might bind to is an ACPI companion of another device object
> > representing a piece of hardware.  It is thus better to use a driver
> > binding to the latter than to use an ACPI driver and leave the other
> > device object alone, not just because doing so is more consistent and
> > less confusing, but also because using ACPI drivers may lead to
> > potential functional deficiencies, like possible ordering issues
> > related to power management.
> >
> > Unfortunately, there are quite a few ACPI drivers in use and, as a rule=
,
> > they bind to ACPI device nodes that are ACPI companions of platform
> > devices, so in fact they play the role of platform drivers although in
> > a kind of convoluted way.  An effort has been under way to replace them
> > with platform drivers, which is relatively straightforward in the vast
> > majority of cases, but it has not been pursued very aggressively so far=
,
> > mostly due to the existence of the corner cases mentioned above.
> > However, since those corner cases are gone now, it makes sense to spend
> > more time on driver conversions with the ultimate goal to get rid of
> > struct acpi_driver and the related code from the kernel.
> >
> > To that end, add a document explaining why using ACPI drivers is not
> > a good idea, so it need not be explained from scratch on every attempt
> > to convert an ACPI driver to a platform one.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> I have read it in full and found quite useful. Also it would be probably =
good
> to have a pointer somewhere on the example how to convert the driver from=
 ACPI
> driver to a platform one. Maybe in a form of the existing commit(s), dunn=
o...

I'm going to post a few of these in the near future, so there should
be examples readily available going forward.
