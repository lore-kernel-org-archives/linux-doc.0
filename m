Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B491F949
	for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 14:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741789987; cv=none; b=oPF6DbgoybWvR28OT8fEx9dwDpomwZG26m2ccLYCvPohtdLVf56NOKYS++L7nwvcK9r4qvFiTO13XX3MxDIufc+6Cr4jjFnTYdsZ3QDwwY4YXJgB/Lkng1fkr6Dux0xff17kC4U3P4KHns6FRQ93MLmF2O4SeswjIvGieqZkob8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741789987; c=relaxed/simple;
	bh=AixPktbXyhYgNZLL/XJCQek2JdSsnYFd9qTxfsG+zwM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fHdesKNwTh+6BONqRkdSqF8pBJOpVPxKQZ09Tpp3vseu36OJ3IvOPwd90nzysOTBiyMb90hXk4q9Q16xT56xOa1GVuhNkDjK9SqgsPfujWkUba8NIjZCbVGYwx3Lo2oJ+ARho/DmgqhZpcf+Izx0WK7iAk3dqdjPY9DA/E6fyyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lLBEz6zr; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lLBEz6zr"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c5675dec99so162311085a.0
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 07:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1741789985; x=1742394785; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BxLGV/gTabQc22y8Dfo+hpafOImuUut6Nenup2mQyaY=;
        b=lLBEz6zrekSPYEoWuANzrY+WhNxqI+VKMWYWHM2ZSzfdeYMafuAMDabGC6sls33RRz
         YpXUrkQOenLBPSm2XcR/n84oGLS9hRJP4RmpNzXdGVJXIXkV+A//CPYGxuhirXOM8YYl
         S5aOU+PiA+0TlOSt9zJqob4pUtUpfRprp1sSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741789985; x=1742394785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxLGV/gTabQc22y8Dfo+hpafOImuUut6Nenup2mQyaY=;
        b=C9Yp3+CLeZwZHk8HtgoFGQKI57v1mx98Pv/HT/UigxiNQpq7bktaSVxYSrPwlMvN7v
         aLAJCnmZWwwpqhhxweehG3TP6eMepDge3bPmLV48rkTTPgpBzXa15orj2olLpjuv84Em
         TooGLz6ILbW5g8i3RhYZ6KexoSsS2qZ1A3I64rKMNYu0KgUlgurGqkCQr2o4N5k6TZSA
         EFNmtn3T8XcDwEGtm8YBY9szs/8vP9XNtEK8sY9neBBm4PSBAjrx9BLz8IhTHpNkBzLO
         UBGVLkJKz6NrWh8MSM34/sERDD3ZzX0aVDDgyZ/bjkJgOa9qwxhoy/I3Eciho/VXAb7a
         d0Rw==
X-Forwarded-Encrypted: i=1; AJvYcCUd3dpYT7Y9BRuDzXHAOX/aWfIJfA5X16WLfVJD6oaUJZuaaJkgLShThEZ8rRhd1CrDtZFkVdN6O1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxayifdkUu4XTYqilmfh4m6csbCHacygFmjHyjuOmqEHaLDRHnj
	mB9PEFFK4Ej2gUS9iqo2sRVXKCyWY2WZEwh5iDscobbtkhLMsa4YVoPvUflTN9J9j4UyK3UBBJr
	nRw==
X-Gm-Gg: ASbGncuQPs931uIejae8F7KYKCv1e2L0vvsCydHniBUHoURNDxpxhayIUaOkr1IvA/8
	NSPuSkc4NDOMORfetFqoIxiGEoGm9Edh0IRqJzav59riasThYB5EyB9CyQhN2Q9/hY5PLdnYAyC
	yAJRnurUUgSAPGwTOMUA0KriAC0q0n20xWbjbA6uGxyR+RMuV9ZMc5LKUt0RHunBrAEEU8jkJZ8
	501BfuPM3Gog76XBhbB4JlfGsy+bbsXKVsi0+PEXKZ8CG/2UMPnWLFXCDLu4+fWwm9Qlu+4LNJe
	ymAyOdrnBD8zhuyZkCyuW2LDoI5mR0KAdw5Qm3VTcQcHN/IcFYEU9pmmBqUgBTcXqoHliDPwtB0
	d9tG90Ep3nNpL
X-Google-Smtp-Source: AGHT+IH0z5ugQvmOUUAU34IG+p2CdYElZR/q3UoJm709wD/UMxC9UcJ7nvGKKYSPgn5Ac6TYqu/Bzg==
X-Received: by 2002:a05:6214:e49:b0:6e8:fabd:ddd with SMTP id 6a1803df08f44-6e9005bc7b6mr302966586d6.1.1741789984738;
        Wed, 12 Mar 2025 07:33:04 -0700 (PDT)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com. [209.85.160.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e8f7090cc1sm85307666d6.32.2025.03.12.07.33.04
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 07:33:04 -0700 (PDT)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4769e30af66so249271cf.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Mar 2025 07:33:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcLlU38S3M8wtFM8sv+AQKoJJmKmVj4J5zfl7WoQ3BMt2oOI4t/PW9VmaVA7w1x33FE0RBiXhxct0=@vger.kernel.org
X-Received: by 2002:ac8:7d8a:0:b0:474:b44f:bb88 with SMTP id
 d75a77b69052e-476adf0e170mr3551051cf.27.1741789983956; Wed, 12 Mar 2025
 07:33:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311-dead_site-v1-1-7ab3cea374f2@chromium.org> <b3df5e8178107b2a133126e1daf111d10f1b0333.camel@linux.ibm.com>
In-Reply-To: <b3df5e8178107b2a133126e1daf111d10f1b0333.camel@linux.ibm.com>
From: Fritz Koenig <frkoenig@chromium.org>
Date: Wed, 12 Mar 2025 07:32:52 -0700
X-Gmail-Original-Message-ID: <CAMfZQbxoO0QX=r6ECcVHBToR7jaqAz3HD6ZaOf-Z3nP2RuYFdw@mail.gmail.com>
X-Gm-Features: AQ5f1JqjD2DWXGYq02-0yYL-x2rBYXh6GczZW-B2jC0-D-TCZJLFB5aqywzcsmw
Message-ID: <CAMfZQbxoO0QX=r6ECcVHBToR7jaqAz3HD6ZaOf-Z3nP2RuYFdw@mail.gmail.com>
Subject: Re: [PATCH] Documentation: ocxl.rst: Update consortium site
To: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Fritz Koenig <frkoenig@chromium.org>, Frederic Barrat <fbarrat@linux.ibm.com>, 
	Jonathan Corbet <corbet@lwn.net>, linuxppc-dev@lists.ozlabs.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 11, 2025 at 9:20=E2=80=AFPM Andrew Donnellan <ajd@linux.ibm.com=
> wrote:
>
> On Tue, 2025-03-11 at 11:24 -0700, Fritz Koenig wrote:
> > Old site no longer associated with consortium.
>
> Thanks for catching this!
>
> >
> > Signed-off-by: Fritz Koenig <frkoenig@chromium.org>
> > ---
> > After mergers the OpenCAPI Consortium does not seem to exist.
> > The github page is the only seemingly relevant site, but it
> > has not been updated in 4 years.
> > ---
> >  Documentation/userspace-api/accelerators/ocxl.rst | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/userspace-api/accelerators/ocxl.rst
> > b/Documentation/userspace-api/accelerators/ocxl.rst
> > index db7570d5e50d..5fc86ead39f4 100644
> > --- a/Documentation/userspace-api/accelerators/ocxl.rst
> > +++ b/Documentation/userspace-api/accelerators/ocxl.rst
> > @@ -3,8 +3,8 @@ OpenCAPI (Open Coherent Accelerator Processor
> > Interface)
> >  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> >
> >  OpenCAPI is an interface between processors and accelerators. It
> > aims
> > -at being low-latency and high-bandwidth. The specification is
> > -developed by the `OpenCAPI Consortium <http://opencapi.org/>`_.
> > +at being low-latency and high-bandwidth. The specification is
> > developed
> > +by the `OpenCAPI Consortium
> > <https://opencapi.github.io/oc-accel-doc/>`_.
>
> This link is to the OC-Accel framework documentation, which isn't the
> core set of OpenCAPI specifications. Those specs are now hosted by CXL,
> post-merger.
>
> I think I'd update this to say:
>
> The specification was developed by the OpenCAPI Consortium, and is now
> available from the `Compute Express Link Consortium
> <https://computeexpresslink.org/resource/opencapi-specification-archive/>=
_.
>
Thanks for the feedback, V2 posted.

-Fritz

> Thanks,
> Andrew
>
> --
> Andrew Donnellan    OzLabs, ADL Canberra
> ajd@linux.ibm.com   IBM Australia Limited
