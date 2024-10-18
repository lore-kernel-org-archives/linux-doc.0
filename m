Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA09E188CD8
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 08:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729240715; cv=none; b=euH064lbUyeDJRZXfeRdR6sL9/4WFC7Zpb4pLJDavvJrjrDWESeD9luEkRakU6RPMCCYHU7wrh5T/5ygHwy62k7Jq8KskkMkmL+iXLgXcRKQDXn4oo7aS1+s8zem9ML9m+Xd9eHOOFEuCOE36vj8pbD5hzMqhdp1lprwQicuM/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729240715; c=relaxed/simple;
	bh=5rsysGuJqIPx87mh5cgfnJY0IcxVmSN/yeZOhX991mg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fFydXA2IwB0IWn7W6Wo7cf+Bjo6Sihskzg1osicXhmvdQF3wf7bRFRGAYFgSFFEHBDUA1pv2as24UF7GmuI9T66F4lHshG4Zngxtf/5d1zNwlW3ieT1R2KDQ9RUDYoa2Piu9xtvAvTe1Jczw2f279hzQu4yaMPeBi4/uyf7u1q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o+dt1qMx; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o+dt1qMx"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d58377339so1957579f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 01:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729240712; x=1729845512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rsysGuJqIPx87mh5cgfnJY0IcxVmSN/yeZOhX991mg=;
        b=o+dt1qMx8alKUWaR9VakV/MIw7IqgtEZQNYyIqk+HPKZ24rNOPweKxuJuK3nmFjyhH
         1AZaMAsMsPh3fNNkvI4MN5luMANYGXpvPYxnZ67kXMJBzzAh6aOm90+yQSSKj/BC4dO2
         ugaHK892g3p0g6coQX0TUqjtsIv2QA1iH3FwIkdExC3vgXh03l1QtliVc9gVI98w2xHw
         2Rz+edEUyHeGKV6Vi+c/y1//u/3H+vHxzz6+ybynReWNh8Ydr0msGEtfafWIPuW7uTe+
         u0cZsCZ/rXlUYvJ94Rf4mGVXaUrEFFy98SOql9180/fRftxCylxx5RivE6HYBalJq3oV
         c4xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729240712; x=1729845512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5rsysGuJqIPx87mh5cgfnJY0IcxVmSN/yeZOhX991mg=;
        b=cMeKKXNIQy2K0S66QBtmbHYRfL1wnIWP9y+HGo6VSPR9TM3R4VfAwfIrRLH2gDpLpe
         PaUal0v5Y3+3YR0X0cZVmqXBkMckLCKLt1J/DU9KMoxYy3uqbmKfIwLqZPySZBJ1dy/b
         3ThHOZIOqbJC4e5SBmGyQlEk+DST6eSHzvdxdSJtRP/L0FKQ7nMbFG4knyWGrOGX9BiU
         NXAw3aa1zFl3K8I1ST7NErw6xdkmTK3Me6qvg7wzy2nMrzyJCwmhLbv1lOhKL7j0GxqI
         pF4SkQwxLQDG+QuDKAGFtwm864uHsrXHtiV1cqM0eBrvYBmj7G7Qse/R8fB74vx+0adO
         bAng==
X-Forwarded-Encrypted: i=1; AJvYcCUT0t0Pb9WiNlBLrySUhSQKb496f8TWqJkZ0rZwEY/2ZgLt6baEvxr99PLzTX/y6g9mlTXydtYlzQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2DK+9QEObBBFMP8Tvw/4GJHwtkp4rOzXTsaGU0j9oIDKy7UKp
	FFLEpTuDFuuDjwMXwVz7VOpx3YPBCkMjbCNSZp1fqB3f3k+8C0VvEF8wD/efH0g3IV3nVUdAn/Y
	Mz7T0V95H2H0CxgF9jL2tQ3ckSEDC9ETAwZY9
X-Google-Smtp-Source: AGHT+IEMpABvANAQwaiBdpAUNXgOV+TAluVstbFQL613PUpCigYL4zr3qY0/T+iv7zpvIq0gQsB6fiqggsI3J2pJwcw=
X-Received: by 2002:a05:6000:124a:b0:37d:9508:1947 with SMTP id
 ffacd0b85a97d-37eb476876amr1372031f8f.51.1729240711872; Fri, 18 Oct 2024
 01:38:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLgh3JyY9L6Fg+LXVguyx8iPRbHVHqTyXSfM9gq6jdWRdtw@mail.gmail.com>
 <20241017210430.2401398-2-elsk@google.com>
In-Reply-To: <20241017210430.2401398-2-elsk@google.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 18 Oct 2024 10:38:19 +0200
Message-ID: <CAH5fLgjv1AcSspv=-owxrsKaJcAGpxdG3g6r10imcOR1Yarr6Q@mail.gmail.com>
Subject: Re: [PATCH v2] rust: add PROCMACROLDFLAGS
To: HONG Yifan <elsk@google.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Jonathan Corbet <corbet@lwn.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, mmaurer@google.com, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2024 at 11:05=E2=80=AFPM HONG Yifan <elsk@google.com> wrote=
:
>
> These are additional flags to be passed when linking proc macros for the
> Rust toolchain. If unset, it defaults to $(HOSTLDFLAGS).
>
> This is needed because the list of flags to link hostprogs is not
> necessarily the same as the list of flags used to link libmacros.so.
> When we build proc macros, we need the latter, not the
> former. To distinguish between the two, introduce this new variable
> to stand out from HOSTLDFLAGS used to link other host progs.
>
> Signed-off-by: HONG Yifan <elsk@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
