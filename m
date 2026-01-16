Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1815E298CAF
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 13:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768571675; cv=pass; b=cPvxWcdtTsWMZY+S0XlXK0ZLfXbST0rfVYYvHWi295GTtShdtmQ/EHEjE4HCrlRKeVB0e8Mg1Ukiawr+pKhOwuacRhKJNJ9HTid9RtVidugG94JyK0i9mwWAzS5XykLuWKQD1d2WZ2Z6/9AaZZJH7tva4sLqHhb/L9d/1hDBWyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768571675; c=relaxed/simple;
	bh=R8kBBE34ZNMYFTudNvOv2beFXalia1gR/fPFdf8uKYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pbe6cw5pp4kOFF/uyDWxvHauEbojWKDSPCGeYHyQDYjORiWzCl8c/G2juC0skfl0bpNC2JjAW1J9NOo7hMhmN6552aceKXSgIGCwu88/VTLyJsWZNS8o6SmPtuksqPwCIMD2Ovsh76IZ2fTel8oQDmy3NGs+6Zlj9oW1PaCMuGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eM2rntib; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eM2rntib"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-64b5ed53d0aso2903847a12.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 05:54:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768571671; cv=none;
        d=google.com; s=arc-20240605;
        b=cUgCQ2NAncWO5AsoDT1c2GYUFFKG7ruekTp66Mbnamj1mp6wa1fO9qE3ZVCauUbNWC
         XsRgd//w3k/mnq39SEApIzfsClFZTRb8kGOJWuigW3iwiN2KJFoEjkZ61wQG6Ay24l37
         FSJXsmw7jn3XkIaiqQS/8DZ66qjswfxV9gJyScogAHqI9Kj+VXhm0moJwr4lh/hnHnTF
         hQ5iOnrPiOW6dWTf11SKkhNfLUbgqD6wq2UDJKsLHVTxYCOaT4XajtUNu3Ari4he9Vny
         dbkBbmEWewh12yCDsqKfSRJq1bDnulZ0sHRSkDmcd9EtUUbukfd2gy22YEIIcsAM06pp
         sAgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RotkfXlDeAeLy5OveUiI64+KfXV2VpL9+J6GoWK/2KY=;
        fh=QgLtbbb2JQCSqVcbZ5VtiDEmUspNS0iP1ZrZoqU4vTw=;
        b=WD+I3ESlhw0lmWxv/OTzjg8Y01mQ9iBTl3Wx8GDXkmFAP+87rP8hW4MtNVnFKMnIAp
         x40w9ioe37GxiLTUsgbRRo6It+Kx5f5p8yJzz+RQYASOtnD+p+fDMQV4ZvyIaEQdUitZ
         /lHgcUBmqn1otYULnHM3oI+GBfZTshDq1kg6fn+jsWLLqXIbYiIm8fyDna3NF4cWjFLn
         0qfFqi4pJ0oPb9gArfyJkD0t0u78Y0Bd4XoPQhyDGUnWFjrCO7+I+KBVy3N/Pj0+oEHJ
         hlqMcTNGwEDrlTiCoRCVrRY8xnpGc0y+dFUCOdYjBVoyLHQVFfdrMLhdGobQopWO/kve
         qIsw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768571671; x=1769176471; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RotkfXlDeAeLy5OveUiI64+KfXV2VpL9+J6GoWK/2KY=;
        b=eM2rntibBC6HsCk0aSXkFVNCs0lA8sodjRpwnc1dDdpuuHe9SJH3zyGlKhGLeXLHZ+
         JwpVJIUOplR8xgkEwG7MNk8eLJ0e8xqR2gSGvmpQxP3C/KhPzKc4ZfAo0ghmBsUrg3Ay
         0blZfPjFikCZoFXcI7PD/LzOw+EX0Cv2CSMAit5VmWq1zKyDr/ysYqK6NVuujzNqKsxr
         8N7xJJoRz8YvNamSsB2KhwI4hIei46KHaygqIeTLVfXk34O4MBm/5589wzvRS3jP5t+b
         hbPSG+f66w+KYwR+BKZ5h0Mwh+c2FAZKu75iNahMIEfQm/0ob6VeMHYUDZ0n9ql8rPAY
         t8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768571671; x=1769176471;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RotkfXlDeAeLy5OveUiI64+KfXV2VpL9+J6GoWK/2KY=;
        b=FfhIykPTPSVzc3fP4gxTkHCbtkiT1mA8zsDr1rbzjEOlqbSnPy/bQFLQMLUAijAvH1
         I16pvRXZMFx17Rego1kEDw93gqBh0L71Nh2Q6eospOfmFrlVftfYFpxN6D2IDh6SrV0a
         xINskjWqchKoQUDtR37/eWWfb66F0Kt8s1r8w8HKbcG84At/ev1q607xBYSFDwUfV0PI
         hw8HPLRXMIPfYwFDXZnN7rMJKiVMa0QEjY5JofT/XGH7QWz+3JE8zZDNzSl6LTqLrhH6
         zAXLRVp6CkvcKSUTb9elZOqifuqnC7OkH95pb/PpHim1bE95stLZ6sAIWprIIBi6DTOM
         9aFA==
X-Forwarded-Encrypted: i=1; AJvYcCXPLjLLZqdL/Zmf6X0RXVXQw5geymengVtPk02YKYK9yJo6RiY6K/QF5uQ7H+zjsRsphT5PdrRWDyk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIobLEZRlz9u0AQ1Nevf7iZ2FRUPNgt74j6crTLcZt/LWI54tV
	1VMmj5s+4Bigvhxi6+H+mj+5kDEq6a/W59e2yFEJfTmfqKJSwor3dctpXW7PzGjvMl6gsUbf3Df
	PQHXUZ5VEH1vgI2wX87bnM/GCBcqVwAz5wGkx9PY=
X-Gm-Gg: AY/fxX7bmLM2d+ZK59rVPUNmgYVynAMIRa39QENtXOCDfHzATnvtWaHIBJckJlxzuG1
	Q2q0pLoUWgSDQkGB6MDm0Ve2o3qvuBZA4kJFmaFbi1YbyooXCmrMi0T+24ARLN/59yMZRAsyfAi
	DgvixqSYAMoon7X2KFgxHHC1GSigMSXEJJWjRac+Zp42pUJAAKM5Ftuh2cR8rZmfc9Dw5aAdGYW
	oWqh49H9rkCJhFW8112y2v9fMOIRIepQhOToBt+jCvR8kdrVknrDCw4PGeUXmLEdA5b0mRqkw5/
	7mJ1UYHDvY69UZxHfQQyscylpXHnkZ4Wkh4cq2KUcTl4WmbKntTasusKOvmUaqvXDKbsixOqk77
	RsRybZg==
X-Received: by 2002:a17:907:3cc4:b0:b87:2b1a:3c55 with SMTP id
 a640c23a62f3a-b8792fc438cmr299318466b.39.1768571670823; Fri, 16 Jan 2026
 05:54:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-adf41513-iio-driver-v3-0-23d1371aef48@analog.com>
 <20260108-adf41513-iio-driver-v3-2-23d1371aef48@analog.com>
 <aWFPEa9HI4wmYLpn@smile.fi.intel.com> <6hcqrcy3meskddrklb3jtlpca2snrs4upwms56lhq7mkes7krm@vdiaqkfc6lgg>
 <aWTTs1n_N0dVjpbV@smile.fi.intel.com> <lwqhf3pm5xewtx4hhq7ei2yil4skmtkstqfifif74u4e5jmtzh@wedhpibvjepw>
 <zgz6g7pvzijrt77lwdi6q23lgkscm33imcdfbnu7mxvzarygst@ve3wi5l6dv3d> <CAHp75VccDF6QfkZ729qCTQcd5bbnTO2SX+FG8QNPRSC9=LneMg@mail.gmail.com>
In-Reply-To: <CAHp75VccDF6QfkZ729qCTQcd5bbnTO2SX+FG8QNPRSC9=LneMg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 16 Jan 2026 15:53:54 +0200
X-Gm-Features: AZwV_Qhnb5ASdJPz3Ird7Y1KuJggzpYW4SdF5HLUhFubm0H1G0jhHHLVxjuzeXs
Message-ID: <CAHp75VfMFF4-NPtuAENc9YRx7xrhiNAs6x2VoafUJbOzH=_SFQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] iio: frequency: adf41513: driver implementation
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, rodrigo.alencar@analog.com, 
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 16, 2026 at 3:50=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Jan 16, 2026 at 1:32=E2=80=AFPM Rodrigo Alencar
> <455.rodrigo.alencar@gmail.com> wrote:
> > On 26/01/13 09:32AM, Rodrigo Alencar wrote:
> > > On 26/01/12 12:57PM, Andy Shevchenko wrote:
> > > > On Mon, Jan 12, 2026 at 09:56:25AM +0000, Rodrigo Alencar wrote:
> > > > > On 26/01/09 08:55PM, Andy Shevchenko wrote:
> > > > > > On Thu, Jan 08, 2026 at 12:14:51PM +0000, Rodrigo Alencar via B=
4 Relay wrote:

...

> > > > > > > +#define ADF41513_MAX_PHASE_MICRORAD          6283185UL
> > > > > >
> > > > > > Basically I'm replying to this just for this line. 180=C2=B0 is=
 PI radians, which is
> > > > > > something like 31415926... Can we use here (2 * 314...) where P=
I is provided in
> > > > > > one of the used form? This will help to grep and replace in cas=
e we will have a
> > > > > > common PI constant defined in the kernel (units.h).
> > > >
> > > > Any comment on this?
> > >
> > > will adjust as suggested.
> >
> > I am finishing putting the V4 together and I decided to leave as is.
> > doing (2 * 314...) might lose precision, by not much (maybe negligible)
> > but it does, as (2 * 3141592) !=3D 6283185.
> > And that it is part of the reasons why PI is already multiplied by a
> > power of 10. I suppose there would be multiple constants defined:
> > - pi in micro radians and nano radians
> > - 2*pi in micro radians and nano radians
>
> The problem is that we will have off-by-one errors in plenty of
> drivers. Depending on the driver the PI may be floor()ed or ceil()ed.
> That's why I think it is best to use 2*PI with the precision you like.
> In this case it can be as simple as
>
> ((2 * 31415926) / 10)
> But you might actually want to have the maximum 32-bit PI, as
> 314159265 for the same reason.

That said, the preferable way for 32-bit arithmetics is to have

((2 * 314159265) / 100)

In this case we can use that PI as a reference in many drivers.

--=20
With Best Regards,
Andy Shevchenko
