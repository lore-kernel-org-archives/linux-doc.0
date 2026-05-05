Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA10392C4F
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 12:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983451; cv=pass; b=fxeeg286NGZpkULAD4lq5ZvYeRY0vIR/SC7MUrJOsIo/JStzzCmrPlnFZqnRRjNGgB8H0DyBMcbF7/pvfaXexmDCzlC+xjuBhGW0iSU3xLum695zveniIR1/w48GJh74FVkykW1rOytmpuIlf8U7PpypGKau510CtS+zYf0lNkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983451; c=relaxed/simple;
	bh=4ydJKBzXl8vGu/qhevLAEpZeV8I3Agpri6WPhn0p5Zg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ue6i4FMiFKrzLtpob27Bzo1c+KE2l71/LVJYGLpjQtLXf4zUT5XlNTY3aHCXV+saoOjGITqiskqRUU2/MuCvfteiSlaJJ1blcWxyZWlgtbzb8Zu2DaWh/MO0B8RTWgWQVdmT3ip4M/fvqOsvMRuO5YPGYZsNaSO7k7/DfXG6Jvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E5tTs+jZ; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E5tTs+jZ"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12dc1c0b724so472604c88.1
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 05:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777983449; cv=none;
        d=google.com; s=arc-20240605;
        b=TGbcHeUfO6XKpK3g36QNbIEKtRGJirsaBpBibWz94/SW9quYg0JH1QL0rLSD64FWVD
         JaqiCdvhDEkPbXmkS+VB8h483LgPP/6tTi5vULxgu5x2tJdKMqFgWVmUyqZ3/Ck4kpMq
         6r0n5urfvBJ3vFMHaJWZSB24kmlZ5e+KCII+AJwu4Ckuy0m4hEgJpcCmGiKhA62NOx/3
         smWnZzrM14qKztdPWzFXmgM3lm6qd5TD5XZDL5ssjMbCbY+itXLDc1y23mxvq/4n76Iv
         1yHAOHR/ADkw5vgHSBnJqN3CoWi8GiqKguxJNci7wX1HCfqUkKC23wfuHTa+I+wVVMaq
         /a+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        fh=ZUJOACOa7d5ORXSoF0lYuLhRbRth7gpgXYcmGUrulMM=;
        b=CsvzL571MW/xJiY/CZzMe5k2by5iVwcYMITePSC9Lw8NK3i9dKS960NJ4oAu+NF7tE
         f1w/0KRcyHQivz/Oss2+q3vicNw8JDFPRvJ5Rpr70dUKZ/UKY9iKhb9xgYIjpEaUdbV3
         A+wBYe1V+VqBiHlVUsvoGbGt9kD1KIS05kuy61QGBFfyf0PSXV8vtxS5F+eK7MwL3FP8
         gfYH6ngR7Udc6vDuRNXCHYZvOH68MfWQR30xXciQwIxMxCqqYDZlXf4gqVWVhSXVQ9UC
         Xn3Ag1Dia9T+k6R+uwi4hodKIE1TjXEeOjyL1WzS8OdrCmUySr6+2rpaMHetzr7VU2ce
         wh2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777983449; x=1778588249; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=E5tTs+jZMVO3FGq/nQKWoHooKTeVhj0VV05okaMc3Iv/Hl4qs4KIeOjITpB2n0HT5C
         ofA5qRrB5dVLPWQ/T02kaZP7/S7OyhaWNhATfmZO9+LwpGHqc7wR2tgSaz++qr4JuAUn
         jL1EWImb+tNowkpUS66BgtengZjIY0BTPClPBli8ebzqbcRmgBF4Oib8BzStOrC/VSd9
         +VbRD1mXYE1jF4hd52Obph42jHKU3l8MyhaAJ/lZCyO1JJqPhcFBbX1y3CzPmuoJ6ImU
         6nhpxu2IMTxkUHDaKTl7Xm14NvJg4T9KvrMNvcZo97+1qm8fMUbs9oIjJEBmEZhMcaSH
         LbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777983449; x=1778588249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rh4nSzvUJ2lYZMblJZlYGda5GtEsMiN9Q4Lz0K9myNo=;
        b=WzUexv9PRTjhHPv/ntV9cDwCsCXwx++eun5IB3xSae1kYUpEniauLls3hXEDnGcDKx
         9X0CtwNZaczsCh7qQm8bvQi7T3mqpxx00pVUAsZ9RfHEf65QkyU4pQpWm6oCQz2KVkLH
         A/2k1CCNgsFDh+W7fb69O4abTFZClEZ+BjxluVBEjbBzNG/I57sXNfKDXCUVqgnL4v/+
         71LYm25NERwhINulr0tjy25Vh+yMWlOpWNMq+C95qk1Bi2nzG1rLllQRIdPHhrKIE5gK
         W9Diflm6wgVNhTcn0OBiUz+6kCTBepOKz6xCcU8xdWiVbOb1PxAfv/IgLPgjnLo6G2jj
         qTQQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/QE96s9+VL93YWd8HWeJNQtf9d8E81T4ETYvUZ9Sw/2aOa604Za25eTtrEc1w2BkDWFK/SzLRiGM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaNNAyUJ+ocz57mXHzTvupCnFgq6EnfBg9nBt8zFeBHvxYmWM2
	ULOOTKzICjLWfgrEfPmCbnACHjw/MH5hnrrrs+cFsTeu0rfBz3GKBDSOhBjD3EAfe8U2uEjYIj8
	e6kii5IysASelfJ5Nze6UesEL0ctfUFM=
X-Gm-Gg: AeBDiesov06KgK8yUOsiHlYkNsuGUY2UOv9mYM5mcqV+lQ5wmrPLSOD/TBLget1YUeI
	Bkjpn1mT1ceToYBUdnXI+H+tDA/7TxOSqV05LQJa6qn7FJperfA6bfbKHkarJu/6RKupcBEF8Dz
	TatgFn2Xw580pyvEj8Jcj5FWdGGgj5COjDsxNNLnbfZ4UysR85MoELbhscSmfASb0F5zlBibC8d
	HQmjJV+oJNrJ8MLHnevLmom05cEt5w3Bmk2hS2FoPVdByBXmCSbdTL4CO7F4KaviGKDJ/hkwUTy
	G6FXlLFMral2ijulyHiX6hXrYXqfd5A54lyqWBxHzrqPBN1Ts51IWfkGSlMwMaa6N6SwL97NqL1
	wAT0zHnhDyworliD5Ij6Y1IXu4/VwdmkVVg==
X-Received: by 2002:a05:7300:dc04:b0:2c0:c55c:156f with SMTP id
 5a478bee46e88-2f41ddff527mr617567eec.4.1777983449127; Tue, 05 May 2026
 05:17:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260501205825.73614-1-joelagnelf@nvidia.com> <20260501205825.73614-2-joelagnelf@nvidia.com>
In-Reply-To: <20260501205825.73614-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 14:17:16 +0200
X-Gm-Features: AVHnY4IRsrOm00S5Cjdrtaixtaeoy2G18CIkU94qlj-QCX6kz6PrDy_aREt3VvQ
Message-ID: <CANiq72nW4ibDKYySiLo14B2W-PWbZv58d0a604cGQ_+A+ftBog@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] rust: sync: completion: add wait_for_completion_timeout()
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alice Ryhl <aliceryhl@google.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 1, 2026 at 10:58=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> +        // SAFETY: `self.as_raw()` is a pointer to a valid `struct compl=
etion`.

This is fine since it follows the other ones in the file, but we
should say why this is the case (in another series, possibly a good
first issue), rather than just asserting it.

e.g. a type invariant?

Cheers,
Miguel
