Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB941BD51B
	for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 18:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729620368; cv=none; b=dvHsARjXek6UYSpxCMw5P5YEKrw9Kbjn9RRHmtslWcLXZ3sIDDRmxVyW3JjTzqI9ij1EaO0hapUw99e5SIypkO6oLgGmgut9r4ny2oaxOgqKciKsgbNbS7k4WP8IYFGBM1B5BVENWqH4hJu/+1UH3fmIbi+U4Hg83Vx9x2KdWpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729620368; c=relaxed/simple;
	bh=YF9SAvtg72qz5VeDGp1dSDVf83WUSfxDx46MjbAP9vg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ha395k3RarQTDhWROWVoBOPzHVIXoXWi6ouPJ13SAZnPrzsPgij1quRrEn1/VhtABzlHrFlH8h5WRBpF/5oyKHjnDRIBmCDLWjPIMxHh+rhZfVlce2M4XsaqST1Fm3Ab8M3AOaSbWfCxERGnskJ0a3e3+H5x6JcDO8ttDlEhmVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XWUDTHoD; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XWUDTHoD"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fb599aac99so59386001fa.1
        for <linux-doc@vger.kernel.org>; Tue, 22 Oct 2024 11:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729620365; x=1730225165; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YF9SAvtg72qz5VeDGp1dSDVf83WUSfxDx46MjbAP9vg=;
        b=XWUDTHoDFdoyUKU5i418X40Moc+15WIlsctof0GW2un5JuCbQNh8HG4ULMaHajsOWK
         ca2m0tckqGnP6ZXK/5qtQCEZyUdl/HG4rGYjWVPO9id6hpSg9ew9oaB1WuvUAvTJU9kv
         nlhFv4TM/9HVf/mQTegW2LRmaWMNC47/Eoxpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729620365; x=1730225165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YF9SAvtg72qz5VeDGp1dSDVf83WUSfxDx46MjbAP9vg=;
        b=aZWd4YNFLbgB3mtwcsn3DqFU90+echIOsa/hRc+Ncfnnu+4oQuclaNQV52C+GVnWXC
         2776Vt8uUpD3ZcJarxlWEgp/qGPy80Yao/MR2VxpmpX0jbdmMNMxYKXt/Gv6xVP2sbHf
         0kA/vfCwstuXA9aeNJcV5LhLD+Rm02F4bOb4gnV05cJel+vPvxDW7dC6Hg2gfUqhuUcH
         qCfaflhstqzB7lBnZukoeS/KC18qT9J24aLPZsFMd52jZcUwDXrQnUa8mfa7S1cKxdij
         t6O+6f45UBMvFEz7qAB57iOHiXPb6F0Jlx3nqOLHRj6BRo2Y96tkE5iBp+X5HCCW/qpH
         xvog==
X-Forwarded-Encrypted: i=1; AJvYcCWbDKGfYN3QrYXlkVfdWoVSv+UBpXKzs6Asjf2jJS5mXkik446i+qnbzZoQHTu5xqRA2SQ8nXkE/Ak=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKzDIemJ3vQeP3BlFey3NbA8pQT9t+O+RzMMaDFwbnZVAPoDtY
	Q/uWjQQ7Rnb9QzgtwqH323leowSd7PJLOGnmfkfBh941EXE0BjC6XE7MIGi1Jbcm3sSuPrBow1L
	fJAGjTCD8CKPTXIFyQbMfNMX6EnkKK4iBLRVy
X-Google-Smtp-Source: AGHT+IGD767gQQeV0tE11uRaEsrIc2mwmO00WhEo/Zz1UezZblPCSEvXaOlL6Ubx/nHPqBiL9e86v5ATJdjlx5EznPw=
X-Received: by 2002:a05:651c:2211:b0:2fa:d534:3ee7 with SMTP id
 38308e7fff4ca-2fc9bc35e2fmr2513681fa.35.1729620364754; Tue, 22 Oct 2024
 11:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241021191233.1334897-1-dualli@chromium.org> <20241021191233.1334897-2-dualli@chromium.org>
 <ZxcFxFfQM8gc5EEz@archie.me>
In-Reply-To: <ZxcFxFfQM8gc5EEz@archie.me>
From: Li Li <dualli@chromium.org>
Date: Tue, 22 Oct 2024 11:05:53 -0700
Message-ID: <CANBPYPgz4z-0gteo9YmQ+5g6tE3m3d3qc_siCvQqFo-ty5KvZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/1] binder: report txn errors via generic netlink (genl)
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: dualli@google.com, corbet@lwn.net, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	donald.hunter@gmail.com, gregkh@linuxfoundation.org, arve@android.com, 
	tkjos@android.com, maco@android.com, joel@joelfernandes.org, 
	brauner@kernel.org, cmllamas@google.com, surenb@google.com, arnd@arndb.de, 
	masahiroy@kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, hridya@google.com, smoreland@google.com, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2024 at 6:54=E2=80=AFPM Bagas Sanjaya <bagasdotme@gmail.com=
> wrote:
>
> On Mon, Oct 21, 2024 at 12:12:33PM -0700, Li Li wrote:

> > +NOTE: if the user applications that talks to the Binder Genl driver ex=
its,
> "Note that if ..." or .. note:: block? I lean towards the latter, though.
> > +the kernel driver will automatically reset the configuration to the de=
fault
> > +and stop sending more reports to prevent leaking memory.

Thank you for reviewing it! I'll incorporate your fix in the next revision.
