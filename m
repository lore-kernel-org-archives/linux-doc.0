Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1162C35A388
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 12:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779021343; cv=pass; b=nUv26+b+MoGbeKD9sa2IihCxe2XYktH3fo8ntNzplgu6LuIYXmZdf+D4O+7Nl2Yaew1Ut3BrdLbyZwOmPwr8PwgEeYdTEwDxVvVbuPLS2PQkNoqDCitYtZRm5nXKJ4Tk9af/bQuwTUmIG8KGbjX43h/e2GmuGSPgVkCsssAQZfo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779021343; c=relaxed/simple;
	bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZg48y1pK4sGRNdJQqb1NFHoWZjP/auZFRJLkqpDcBvmFoY6QtrLaMvuXE/n9p+GzBh33/r7Sgc0b6mHDC10Y+c1QaUp5HdGQbTUngw6+pRxgZRiRSDaTyCIgozgRU2Rl9hpvQdgmGGjt/0C87biIwvgDsUdKGiei4P7RXzFve8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjKGcA1d; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjKGcA1d"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f13ae64db1so44602eec.3
        for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 05:35:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779021341; cv=none;
        d=google.com; s=arc-20240605;
        b=V0Z5gMoI4dlyZxtOY8slDYU2dgJD4f27VRTNtueJA+Vfm4WYoIrda/tgnFsFCyLfu5
         hzEbqdjaqcDaR27vPioy712HwGAbWoMx+TfXLRW9F7gDCYltWp9vU24rj+avMikGMcbE
         6TgFHH+NAM9rGzVXbQuflDXkH7GatzCBSw7EUElR6REZas/2eIwhypUtT5ZQ1o2QEc1d
         BBndJd+Z+g1Uig7PG/tIL9dAR5NrsH2A6Zt4sqnk4Oj9Ex06DNFmPCjCzNO9O+S0MCl4
         M1g/D0XBFagcm3o4aKt+MQkubindp6PuAI/DRVlIDHQbi5cVQ1hZxsxDemEgnRijidm7
         +5Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        fh=tko7vhhcdcLn1YwHrR1BA+Ve4bLTpbI1zy5XxlzzVSk=;
        b=A+MPI94MafVFl8wi9xHhjeA4cCTOuO6EwRnxV61odZiMRiQBqJGmG4lmd1ba3EDLOe
         n0ZXjv7K95L0AUhEtu2RkctbNfdFe1eAvM2bZly17EIDxV+h6Je6BLzEtAyV9NFhuzs7
         M+uCXsR3ebj2OS/kfp57+DBRScXRfJScnPEFNDRVcXb2zvGvTC+UxRngVsjbLEZyC4I4
         94LU8nvql7eD1PnpvwOjRWBZGBRf1atbdfTBl4cQh43s8CJ5DVq4XSnFZT7cCVv6/BxU
         bqhWgMBhGM4pT/Qoa5T5OYDCi+DtMt+8f6oDdm2jxOM5J/NWiFx6B8sHChl7rfPhzC8H
         M1pA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779021341; x=1779626141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=ZjKGcA1dSL5wVUTKvrIzCjFDf2h01d2J7ChDnaeITFYcJLDQWYhmRoPXDxVS4eR68N
         f4CI+3SI5f0LpgkG2iZFGfM6dz2MxyktVDFrl1HxTLnDBl08IF+uGDe6S7o6Iugy8Tbh
         +WhaWOrnyP9BooFnYjLOERAgA9ttFatntyMRqi/fXiK+38pc1zNokRivepbOlXFmlV7x
         bJ/d5vFnJLN9WYEiNWEoaRM1Ll9YeC1I4/e61YFOVW9FxzLI4KD0xAfaap4ZFxzvgOCL
         Pe5iLiocZSuJ7q1qYLGZLWBiHZVAC8XL+7Q+eNaCMy3A7ZKkG18Od4uwxjH/+AqjlDAu
         4sFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779021341; x=1779626141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AGbyvD1A3j38Oj/KC8gvWB2798BTRZG+Gqsn6fkT65I=;
        b=BKd9+8RhY5+kZfdR3ZPFT+dEwxo/aa/y9y+GZpOvSoSQ8QHo1oUReW6mU91jzkBD9w
         t+5TY7NzGQruPf78ng1ukjv3RbAC3tAuE6oVEsWWUlbwxGMl04gcHqYe+X4u3u9SEutP
         Ic75io1w0fFtm12i0i5n4OIoT13H1kdEpeBF312UTf6VznO+x+bHiNexCSippBIjkBEg
         JJroJ6uPNnfO/lSO/nfmIUBx5CaOsArAjSPHrrvPHZRHkh1+C65K2uiYMauXzr3cyih+
         IB5EdI/hAixW34iww/W2uopsJHvF2oegOuuWHXpNVOT7DxGlX6IT8e8OZMUIh8WuHwTz
         fvBg==
X-Forwarded-Encrypted: i=1; AFNElJ/C9UP6nPMrCHux/g35ndJ/v+chFk8u3Qmy2axKujNSvTFspUskmQyPnCU24c3VUD2K6q/3IIcWjAg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+Q8H5vFe93NoCxP4CV3fqNXt0BaIufHfpAwb2rmftK/ao9SKS
	yeM/UYGyPQSY9GIl3mct3p0TOmOR/tAEUNEU6uTGMXR6lWEfp53DDd4mYvUYfqVDs3POR482LGU
	JcRxGYKzPCoTtLjeXGuq3G65kzmYfUBw=
X-Gm-Gg: Acq92OEW6uhIiGSbIu5RJcUFABuRdNFjZhY0rp+9Iw2Y8oSdwRToaEsvjcQfFttwGjE
	/1jXuPJPdh5z/3cCN+Y/QrPSRbdFTyrGR9qQtMV16c00eH2lbX2UU1/Hfatq5mDkFXNckFm1XJP
	bfJnPok8RLLZ6AfYpM6s9qvlChFHj+Hh0ZiAv/d1dCnPuKSg7k7YkysLNwBGLTsnf+ASSGKOull
	3a6qjq3Wbm3KWYQL/CPKBXzuoGBF0OBEK9wv+NpTCl7ONNor7YupDoGJ2GFzYJp5TFV3/0m1XyB
	1fiVkb+Joh4KBH0Vj/fZU54WAXP4w71yaSpFifMGA/iaBGkmyHvCnK1GcxEG7ENArfU+tVy9qXZ
	ClmAHpctU78gW9K/QtVnNg34=
X-Received: by 2002:a05:7300:e6c4:b0:2d9:2896:2794 with SMTP id
 5a478bee46e88-30398737cbemr2263699eec.7.1779021341133; Sun, 17 May 2026
 05:35:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-3-julianbraha@gmail.com> <CANiq72=dKOhoLUoWRmzG9Kyv0jWY97Nx_O4rWV-UHjRtULz-jg@mail.gmail.com>
 <20260517094041.GC3773662@ax162>
In-Reply-To: <20260517094041.GC3773662@ax162>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 14:35:27 +0200
X-Gm-Features: AVHnY4IZSFNRtOREQTvbcPWlzfBHcED3UQFBqTP6EdleEX439u6RoJ3RvvnKjFg
Message-ID: <CANiq72n3Lz4QeNnEOWfEwXHc1+UdnsbsD-9wvR2OnhLsYBsnqw@mail.gmail.com>
Subject: Re: [RFC PATCH v3 2/3] Documentation: add kconfirm
To: Nathan Chancellor <nathan@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:40=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> I guess this is kind of a weird/unique situation. I agree that the files
> generated by 'cargo run' should absolutely be contained within the build
> folder; at that point, $(srctree) could be read only and I would
> consider it rude not to respect the user's choice of build directory.
> For 'cargo vendor' however, I am not sure. They are source files and I
> would expect that running 'cargo vendor' would be more considered part
> of preparing the source tree, rather than the build one (so it should
> not be read only).

That would simplify things, yeah. We could always start there and see
if someone needs it.

> At the same time, it might be safer for dependency updates and internal
> consistency that they are confined to the build folder. I guess we would
> only want to remove them with a 'distclean', rather than 'mrproper' or
> 'clean', in that case, to avoid requiring users to constantly run
> 'cargo vendor'. It might be more ergonomic for this to be a Kbuild
> target ('kconfirmvendor'?) so that this could be handled automatically
> based on the user's build command.

Yeah, it is a bit painful to not have the usual Kbuild
variables/infrastructure around... On the other hand, it is a nice
property to know that nothing called via `make` will ever connect (or
need to connect) to the Internet.

Hmm... Perhaps a good middle ground would be having something in the
name that makes it obvious it will connect, e.g. `fetch` like Git? Or,
if people feel strongly about the property mentioned, then something
like an environment variable that needs to be set to allow it (with a
message printed about it if it is not set).

If this were allowed, i.e. if we are OK having things in `make` that
fetch stuff and put it in the build folder (only in certain targets,
of course), then we could actually think about doing more things that
we didn't so far, such as other setup-like targets, e.g. preparing
kernel.org toolchains, setting up a Rust toolchain via `rustup`
(including `bindgen` etc.), and so on and so forth.

> Additionally, can we detect explicitly when dependencies are not
> properly vendored and error with a more helpful error message? The build
> command in patch 1 just throws up its hands when the build fails and
> asks if the dependencies have been set up but if we provided our own
> vendoring build target, we could add some canary that says we vendored
> successfully and if that is not present, error before even running the
> build and say "hey, you need to explicitly run this target before you
> build".

+1, good error messages help a lot. Something like `rustavailable`
that prints which particular thing is missing is great (that one even
tries to warn about some problematic versions testing for bugs --
hopefully we don't need `autoconf`... :).

Cheers,
Miguel
