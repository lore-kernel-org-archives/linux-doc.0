Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FEC361658
	for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 17:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772212100; cv=pass; b=rX5/2CJiOFu0u+su9BPlZNts9NR/8795NLmgLIgJ7me+e0kyfbHRRcCYXKIbHW1NfoVxyT6unqOL69MIQIheuSgG9w/VXP7Yq47x/g9AVM8ZvJpm0c+Mfve47zj2nej4bF1sAzYxS6dCHVMa7oT/2vdWqydH9gJEx1brge1MBco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772212100; c=relaxed/simple;
	bh=hgtMP8VUtY9P76ez7WKUM8aE1sgvg9AP+19rjG+g6HA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKcMMW92lSEfB96jV7Fds29kafD+jg+zzdft937YZZTArRTP/BczCA2MLq553xqjomAoocXUwW+oTHk3gpuP2VPLdAMahxdm5/NZbhGxaPuxHCj1RfYDHmcXqzJKIRTVsLPaeemaGjnaaEIhhYpdlGsV5qyM1KzhjW5opjGTWn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PgPiHSvB; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PgPiHSvB"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-389f200c26eso25857391fa.0
        for <linux-doc@vger.kernel.org>; Fri, 27 Feb 2026 09:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772212097; cv=none;
        d=google.com; s=arc-20240605;
        b=Xly5tQZ2Bjus8zVLSjsp0zhjiHNTOrkrdH84t30Dp74zLE7MekzkG4z9ZP+83FOhCm
         RGKWH7yck1LEDHEPuPlrzXiLcMjJXQgmUHMq+x4tuk+xmy1KydG18DZEswEKRoeIxEf6
         oS8Fx2gshemzfFpL6Hn9Ueh9cPQTdwCe2oHjM/EXRvlgU75ODQGI7TzKR8roFsz6xbMn
         0XG/vThfgLQPETQqG4XBc5eAM3rx6rqFV9v5onD2L7tyyvSnstctUM93UJlWBjddjdvp
         ja6//jpWH5UgmzSDhy0gqXWoJ/lpgUpeFu6yArAtOvOmr8JP4DQburHoFo8HBz0VCDKw
         EGRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        fh=TNdS2C/VUzSAZpy1D+odF7/GUCXjVisVBBdoml8Xkeo=;
        b=cLBB2d+WSMZ6MRJt1z7AMAZDCO3gh+Lysk6fgQO7izL6Yw4KjB8gCDK6K15Fp2jlsI
         sMS3UmYAQoXYAyhFuhkb6XT7MSKzHhQ5dPwwcvKsMjkwoORFvfhE+3EgvwWruGoV271j
         pdfkJ2e1tnUxOriXzz4va4zJwXW0xx1LnB9iZCM8oIxfTw1xdQK6xZPwe+a1i+HkoUOZ
         85GL7Zsvg1XO+vkHV3Oi3aSGGD6R8zAAwyXERLjpKhbAC61kenbBancnaXh8ujb7BEpK
         FqHjYCtvSnSuIJV2VjpMQ/j3jtLSQKuPmjrfRaGNI932+k1CEQ49SGBqWaPsugx+1Q7I
         icYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772212097; x=1772816897; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        b=PgPiHSvBUI+6gG4LIWdV1P8tP+hFkKXk+TFFDvSHQY50WokDZVU56YMWiqXkadzDvF
         dmtlcfNCGrEBiqCje044yvDu+SRSRfiletzn5UHk6aDk5+045qCqDx9KZIhw/o27OQyt
         UCKQGipmAhUvcb93PWkufu6jfbdDWWfD7jV0cQTUEWeMstaBqGManjqzjqQYtybdqa4L
         pEO1bYIczqigj3PY5FSg2rMiDk5C7w1QRrnXsEnaAKPLDJTj6pp3XYC4Ydv2DCasxQxQ
         uDX642xnkksbRVZwr1quu0e2bw6oAYru6aoEG0ikwUHlNxPLSG690KLg3C8rSaGWmiey
         vDTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212097; x=1772816897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7MEfERrDZZYp0c3EO05mpNNZJ5XP1zAqLXvGoyft2Y=;
        b=eDypIUtrNdODsUrb/z7GgNRMq3Wn2ryyiw/sLh8/M2qU/JNxJeEhOFzgy3R8Rf3Kwy
         llgJCh1jcdKDrl2/i/F4JMHwLYP0U6Kg2zs5XRywpStZYfb+HiH0rhA5wvZTzp8Vt6ek
         BoRg5rqy1fne3CsHLGcxdBDPpEi6yoMvSQvCqHpiaNvRhxJlHDmpIEcziYzmdUm72BNU
         2bjeTluuyPFqXmF/1uxqMg65N7wCxZNBELxt5PSUXNYaTNEAZsxqCxpeX/pQoVMGNG/R
         urYTLO9blf7OtxWHj2onqCGa+6pRMjOWh3wGEEThq1XV3PGnWujY7yrEJV+uECctCyi/
         B5bw==
X-Forwarded-Encrypted: i=1; AJvYcCWkvjMoTosDBrRK+GPW6cnx+nYo9GCendbR4MQiNSXiMZJhr07RWjrdfzUPKDQrRXs4EoHxbCe0RQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNOlsGhZA+WmkzsbNQZ/3fuhXdqLPvjUbOmsx4i2eRlX3x63RB
	Jaa1LA42W3aOVcDD6c2/16TkLwCnjZdS+oTnCqdwJAU6abBfge69oCF3SgKnQ6gIXztmg8DZcRf
	r5WhS78x3HAV2n0TLf8wry6Z4O/zdayVvYJGkw923
X-Gm-Gg: ATEYQzxONEtGUG4vfBi87cIyCUDQZWuom4d1FRKlnej2bXin5uRor/0xZkxgNUjJj+8
	/EAfoMVEZXfYGqHvZTfB3GeL9SZgUDhAnHiI/WjTfXoeXvy7b7XxglK/O2jyriVagINiCQsTPpG
	L1ZAgjNAz6F0+9wB7WrPTOn1tlAnhkMjETgohkZmxJGP/lsVww/tPCdRLzqox9k4G+KuGyW0Ca2
	T/9XZEMNJmOfKmsVCibylPv04FDHlJj6sh5gYOrN6Xl6hKvzU/CuT8QsyaYA0mh6X+j5hJ0PBe7
	KcYbgZPu4NnTpvCKIQ==
X-Received: by 2002:a05:651c:50f:b0:385:f7ce:f321 with SMTP id
 38308e7fff4ca-389ff15f271mr19911451fa.26.1772212096622; Fri, 27 Feb 2026
 09:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com> <20260129212510.967611-11-dmatlack@google.com>
 <20260226170030.5a938c74@shazbot.org> <aaDqhjdLyf1qSTSh@google.com> <20260227084658.3767d801@shazbot.org>
In-Reply-To: <20260227084658.3767d801@shazbot.org>
From: David Matlack <dmatlack@google.com>
Date: Fri, 27 Feb 2026 09:07:48 -0800
X-Gm-Features: AaiRm519T9RurPcNiWyO80VEVhcFvT0_H9lBfATMd1KVW4QtGFBpubzCvVI4oqQ
Message-ID: <CALzav=fHy23RAzhgkdaL+JA5T2tL9FT6aPgRfXUh7i9zvYCGPA@mail.gmail.com>
Subject: Re: [PATCH v2 10/22] vfio/pci: Skip reset of preserved device after
 Live Update
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Rientjes <rientjes@google.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, 
	kvm@vger.kernel.org, Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	=?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, 
	Mike Rapoport <rppt@kernel.org>, Parav Pandit <parav@nvidia.com>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Tomita Moeko <tomitamoeko@gmail.com>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 7:47=E2=80=AFAM Alex Williamson <alex@shazbot.org> =
wrote:
>
> On Fri, 27 Feb 2026 00:51:18 +0000
> David Matlack <dmatlack@google.com> wrote:
>
> > On 2026-02-26 05:00 PM, Alex Williamson wrote:
> > > On Thu, 29 Jan 2026 21:24:57 +0000
> > > David Matlack <dmatlack@google.com> wrote:
> > > >
> > > > - vdev->reset_works =3D !ret;
> > > >   pci_save_state(pdev);
> > > >   vdev->pci_saved_state =3D pci_store_saved_state(pdev);
> > >
> > > Isn't this a problem too?  In the first kernel we store the initial,
> > > post reset state of the device, now we're storing some arbitrary stat=
e.
> > > This is the state we're restore when the device is closed.
> >
> > The previous kernel resets the device and restores it back to its
> > post reset state in vfio_pci_liveupdate_freeze() before handing off
> > control to the next kernel. So my intention here is that VFIO will
> > receive the device in that state, allowing it to call
> > pci_store_saved_state() here to capture the post reset state of the
> > device again.
> >
> > Eventually we want to drop the reset in vfio_pci_liveupdate_freeze() an=
d
> > preserve vdev->pci_saved_state across the Live Update. But I was hoping
> > to add that in a follow up series to avoid this one getting too long.
>
> I appreciate reviewing this in smaller chunks, but how does userspace
> know whether the kernel contains a stub implementation of liveupdate or
> behaves according to the end goal?

Would a new VFIO_DEVICE_INFO_CAP be a good way to communicate this
information to userspace?

> Also, didn't we violate our own contract in this patch by adding the
> reset_works field to the serialization data without updating the
> compatibility string?  Thanks,

Yes, I will fix that in v3.
