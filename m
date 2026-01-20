Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3444F3D6686
	for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 11:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768908306; cv=pass; b=buSKFRN6xKoYdkXud5FbCoRTwW/3HSzTJy87nT2a4uO/qvzxH4Ag7b+TUwuCP5ykSIKrsRKP53nw/mc/d9Pi7qBP2p3FdAzR9itmfms5ftgD1tha2hXQ4MoJPp3S5h4q9n4sKw8ruGOn69YdEnTq4KKED/B059MPPzEcYuPG1Qo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768908306; c=relaxed/simple;
	bh=NRnrSD0zAFPtVaS5sTi5Ar8t18WLmEhSZ6lKcGsCMmg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mGWsye2AyPmreflxSALseMI3qM0ocYtF4wMvjbNc8BdqDLWuBwjFXnAagTB7Piz/s1/qMIQbqg7QH19XImu0ZBM8OqsWf4hCDluUXZ4hkOCnXCxhGiUFpMfwagQPW1XvN9EgjqK08y1cUcP0qruY8ph7cDqutCKZkp7rcqJXGDA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fF4bTY6c; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fF4bTY6c"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b879d5c1526so778456866b.1
        for <linux-doc@vger.kernel.org>; Tue, 20 Jan 2026 03:25:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768908303; cv=none;
        d=google.com; s=arc-20240605;
        b=RgOs95YHGF1PPrQv6eJ8gsLLzeo7Zk5HnaAYrn2ZtpSmjb1ZxbdEghRvWMuGFWyaKI
         si4L9EvDkBE3Cg6GL5qxM0N8rMhBFvgrY5OyEwi9BzWlFQuvieJ3tYMSK4jp29eTyAye
         iaEOIZqsrR2HEZ8JoeGey1C2p58j16kzbmTW0/9J3hohDiuom5EJ1xnDOCIW4+WEujC8
         tjvMgPACVuDVkY1wr2VCm+fMlNyK0agHJcvs+/S1op8bsMroixtEeiRN2Q+WQDxkcTaU
         nVi+3NpCkPBAwlZEOaWjbFTXNYsP+t4aMNs9V0lfi6lg4OYDULW3pONp33WgDsB+n0mE
         xVgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NRnrSD0zAFPtVaS5sTi5Ar8t18WLmEhSZ6lKcGsCMmg=;
        fh=KoBg1WxZoccz58rasrxdcD1QcaxU2taKFre5AipziCk=;
        b=WjoBMtpWTqFxGlB/kVWBp2OJnZW7dINh4Txf/5HgNXUStaDsts5eew/qnKDl+MODwK
         v9/9f3iFFE+dPLAnMFQxNlidn6UOPfYlOP4xQwdW71+s7rcFVH7l8csHQCihsPb5HO+n
         9HCrWD6jcKsQKrNnlLzB/hVdk7LLkQqZg0jl6r/AiLK102m7iEjk4v6a/UeCMwuLhn3B
         V+g57T1BH8CZ8d+Ex/4WEgM3/5pNAt45ruEH9ip+9h3vGc7HLRPuLGFE5ZXvzOVOEQcG
         Y7ZXxeZc+wAQhnLV9r0fSlZf4YjU3lRR8rRck/aTU++6x+DGflYxA8n84vNQPAbMVvmQ
         o5wA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768908303; x=1769513103; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NRnrSD0zAFPtVaS5sTi5Ar8t18WLmEhSZ6lKcGsCMmg=;
        b=fF4bTY6c3MbHOeQ/jKWah88aHsRPIwdCzy1n+76DzcN+krplIKkOg8JnbBr8qdeUMZ
         XLIHNPiSeBkYa0qAKsaCHGaHVzrIhEMeJh+CtaPE/t4PRy+y8+f10o2y5z5IB8oZ78Jm
         JfNzahHCQWQ5Wjo46/bNmVjJ4An2XmEnHbQAK/Pyautkqw47mw1dDp8Du70Dl9ZAtgz+
         GXkVYjbaTWJer0qL0flmGqRtOOSfxPWvaDOCAxRX+9AMmZqdfK58u+x3BAq7h4a+p44p
         0P/vp3R/Tmit/BIC5wkN7p274WeglzgE8vqaTCoKUXeRXwRo69w1TYzn4JVu2Ak1V6Ck
         Z/pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768908303; x=1769513103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NRnrSD0zAFPtVaS5sTi5Ar8t18WLmEhSZ6lKcGsCMmg=;
        b=BEAx4t1ygT2L/kQ5ceSwx1FYhGfdK6uwd50QzwhELxrab71B5SsM49gP+3FFjjqVud
         z67fwlYnCt3lJdYhxihhVKSIjKgAOEpRbmteOpJbXvdBy9gHBST1ylOmqYiAr0srH8uC
         WuQApxvylD2tEC/ew/i2dD3M+4gbpG3mD4g/9V6Cp6lCULEOFNCzdbeVUjSZ1kBIXhyG
         F/o1p3GbbSUZvoLJ50RVuK9FVy/dPllPXhbYwdblnMuaCN9wOFWvydvpA/g64ZMHadIn
         T1VXTXjSMPhIvHPkYr9dK8TKeJjHMtQDKP8+LUySnJNU2v8CwAN6wwR/NEzv3y4Yq9oD
         WhRw==
X-Forwarded-Encrypted: i=1; AJvYcCVR7Vu340m73AZreAAJeyPU/gYpwOwY0mgnG6gb9P5hCaXDMCgYtahhApNGjptE7LffyLIIz98BEXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwrXTyGuJx/oHdL2otNkGJWWoTO1ECfsLIFQLUSUZecGGjfxPI
	1NibyYg1P/rB2JaOMd+PuRtrN7OXRqeXW2XipJR/Uv7IP4hGZuMT+uYIlOwyQ1sxYSFLk4CRiWw
	U9H9Fp2eB+Y6Cbn0YvuAAxDurfU9Ckqc=
X-Gm-Gg: AY/fxX4ByYsHcbbJnuvOwWFT9XntX8+XhNCCO8kPkhARRNA5x2BSiVOjfPZJ0NaSVe6
	QliujWSP3kJZdoYpKCd7T+r8+zovLmcpkZnkI9VhFZ+xFIh/jdXY5Uz8YQSbClj36KyThAF2omi
	sPz0P5QLNKvwHgFL93+Aor3YddA7xTZ3Y5O9qNpwTMNmVBl6zl0o5BBVjddhPP8RdFXVKDxofp8
	pDNCFcQRO81iDVIdGdgGA7oym31NWLGKS+5oBMB2nnKkuxu1Qm2OVSzhI1iOMv/nHSGQHyR61AC
	rGIaA5C2UBetyNvDxuijXuziq2b/+IV8QdQY2De510YeQmnL8CZI5xXxnwsJHO4bTSQXzGI=
X-Received: by 2002:a17:907:7212:b0:b86:edaf:5553 with SMTP id
 a640c23a62f3a-b8796bb20f6mr1347007566b.59.1768908303287; Tue, 20 Jan 2026
 03:25:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260116-adf41513-iio-driver-v4-0-dbb7d6782217@analog.com>
 <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
 <aW3dxuelYDM67pqZ@smile.fi.intel.com> <texwv5s2tvcy34bwr4iruj5xofmea663pwletmpqpuh66zulmv@m7qvjgqbhalv>
 <aW40ylvMwVhqNQMw@smile.fi.intel.com> <hgy3bcrqqsvt7pobhnzuvwzhb2taetpxltkaxpigmmlvmlirod@v6anhmrsvv2r>
 <aW5kk6K30Izckvg5@smile.fi.intel.com> <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
In-Reply-To: <e5lcg5kkey3c6u2l4rlzzpolp7qkudhcofyzcx5s2tjbh2iwkg@js3fisv23zyj>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 20 Jan 2026 13:24:26 +0200
X-Gm-Features: AZwV_QiT_7RWmWfYlrbsFcBlA4d2Dt_jON90l4jrfax3VAFOpLzCvwj49Sjh5L4
Message-ID: <CAHp75VepcSZo_E4_UxhKRfHrMFDd7huJg14m8=6zVo4ENKFXkA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
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

On Tue, Jan 20, 2026 at 12:43=E2=80=AFPM Rodrigo Alencar
<455.rodrigo.alencar@gmail.com> wrote:
> On 26/01/19 07:07PM, Andy Shevchenko wrote:
> > On Mon, Jan 19, 2026 at 04:37:09PM +0000, Rodrigo Alencar wrote:
> > > On 26/01/19 03:42PM, Andy Shevchenko wrote:
> > > > On Mon, Jan 19, 2026 at 11:21:59AM +0000, Rodrigo Alencar wrote:
> > > > > On 26/01/19 09:31AM, Andy Shevchenko wrote:
> > > > > > On Fri, Jan 16, 2026 at 02:32:22PM +0000, Rodrigo Alencar via B=
4 Relay wrote:

...

> > > > > The current implementation is kind of a stripped version of
> > > > > __iio_str_to_fixpoint(). Would you prefer something like this, th=
en?:
> > > >
> > > > Do they have most of the parts in common? If so, why can't we use
> > > > __iio_str_to_fixpoint() directly? Or why can't we slightly refactor
> > > > that to give us the results we need here?
> > >
> > > __iio_str_to_fixpoint() only parses "int" chunks, adf41513_parse_uhz
> > > was modified to accomodate the u64 parsing removing unnecessary stuff=
.
> >
> > But why? The fractional part most likely will be kept int (it's up to 1=
0=E2=81=BB=E2=81=B9).
> > The integer can be bigger than 10=E2=81=B9?
> >
>
> Correct, integer part of the frequency value goes up to 26.5 GHz
> (uint_max is approx 4.3 GHz). Also, with the dual modulus, the PLL can
> achieve micro Hz resolution.

=C2=B5Hz is not a problem since it's up to nHz.
So, the difference so far is the integer part that can be 64-bit.
Again, can we factor out something to be used for this and for the
__iio_str_to_fixpoint() cases?


--=20
With Best Regards,
Andy Shevchenko
