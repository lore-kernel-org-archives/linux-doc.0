Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C851A38F92F
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 07:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902256; cv=pass; b=HPR1oEeHrAMfRa3YKzUblRsuVCs8I+LnxksMXLsaKJEL6+kKoJpWVUPN6xT5flUwytoz1j2cfiUBeLuNmcoh5REhvk19vRHYyPP8TpdF9VOKne3y+SGGyLQLHXUnXOSTKP1xJABohUjBkVgNzrQSiaTRkDxdFgUngQudIYor4Wc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902256; c=relaxed/simple;
	bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=s5BZtoA0yDfZZxn+82OLeSgvpkq8wdDHUsk7dXOhcqmvUKNCNbzEsNehx7LZPkNNy4+NkH0CoCtg9jFE0V9rKwQ5rOZAWlGeUP24To0N5nGVWfhNRqZuAwF+VSQu7G9eyewjcaukDP+9nNJQXtPLbIeZZDVcQBTbc75rNffqRzI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=StPljPRz; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="StPljPRz"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304da3b4508so388513eec.2
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 00:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902254; cv=none;
        d=google.com; s=arc-20240605;
        b=PozLl2EEBRmiidTrreIy2z8ze+4SDv92DtNfkmOlEr4jCztj8BQOwn5zqRNzXsGcv3
         hdyTvIkCXwg5qExD8G/iwKLIDdUc2W7R3dJxf8t4hIK6uJLpWMc3jSv9E6qrERWbIQy/
         +Kj+w7esCQtXVE92wH3gP+3YDR0ufocPxPhyM1WcXOrZTiaIOGcmBwYOqeotllUy+5r3
         1DRy7HpcemJCEw5sAh4wrSOpuAvHxa1ntaYTDj+8rVHomrpYKXYD057t5UMkGl+UPTUh
         K+rDoVmQ0bjyKgForPjoqv8/EYJ/g6fL4iYhcJpEEOJIRMi3tADi5Q9bEZVpvxJhnfPS
         y3HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        fh=uaPgKBuci6mQW3XZ7GAElMRk74Li7wkJ6P1HB0BmrXM=;
        b=IuGlkKi++IT2Cu9r45quWif/PlOphNbWHmKAEmc/T3F4crkplK9mx4emRSqQr/84nP
         VVzsQciTrbLK5LnjWGI6RgMDpUvKJfU3YlapYvssZeA4Ap6IySAdee9vxXxP46rE89fy
         lKUfSATKJ682NsYcSfjtzJ7yNyBrzrgumLKL1nXrxfPUwIRdvSM1vHkvDrKXoXSlL3OI
         en6gNHiq7PtNDvhSSpUKwht5X8MduVohmImxVZYseCO67HaiJl+uC8GODRwK7k7d6b66
         EJfHcmrdLUhGMn3iOsmvLLKAex4YMSDp8bRK7VUDM+eVS4B6FMY+XDZW4iFKb4WeB2tJ
         a+ug==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902254; x=1781507054; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=StPljPRzyriQ6ljrCi232UNhcq1V3Wcmqkp/oL8cuDcgTOBmSHsK+4j9fRTDTWPfJj
         8ukgjBQXg204HZgDLgxfi8JG1Oqf64puKlXFJNPMZ9vdQqK6SRC/xk84JJ6ieUZ9jLUO
         NGvrTxumlJalIuKlE5WQ7hpg7pZtMdQiw7tW9z3vm2+j+oL1flljq2TZkaiWbAvw0zjf
         x3MZVEoFT2LiYatCnFg3ARwEO3RPiT0U5S0NNC9NNn0LYZVTPj0Jdf2DO1pfWNq3hGfF
         I01WmYeaoI8y1qnb87C8lUomtZFLYjbgoLlJOc/XR657cPkGKZmfnnhjxuUjJaBW02NI
         Nxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902254; x=1781507054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3hGf5H3nnzoC7ybJv4mmiJ6ITlnTZEvjcyvoKNqyjE=;
        b=HuLvszQblbHR8jj7mx1W04ypN3cHCBx7sVYDimd3EvZq0sSLBlE0PNM2TH2LCuD93P
         09hSPaxSNQN+FNDuJ2nimPn7fbjGY/oUUTGIV+/Khr0PVhgo9tOGR1hCNPFQbekLbANS
         ooEOH8WPJ7oKsC6Rus9snnUBr/ES36jrGwNuzjxT2YSjTst7PC7yaCCUGPuPG4lfT48R
         Ved4MrtyuoJp/0kDKzd7SVKEtC2Ny1iGTSFM3teDl6rDvD5nkOTF4dfM89I4z/S0juo7
         lhc173lxBDXNJwny68Qbyk0nYhYQJ+El91UxL5qmBIESWXFFK+njuKl4Sphur4DP5evc
         1USA==
X-Forwarded-Encrypted: i=1; AFNElJ9yDSGBv4R2sMYkFgIt2N30EwMmzwkFd+sUNdtNW2ZnpcNzpMjcM8MkHgLIe0bCDvAbSLgk77r8BJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGTeRUbir8GHpTXWgtL5kXB6AWXEKjIaBUAt28V114RRQUHeIX
	RtRKvuaPcfgp51D/KNlUvzzbKls2PuyiwlmrZe8WiMAa9pj/HpFhk5VZ5pnDLaQLzhQd9/w5s7H
	xyXNM0bdWZG1zjXbMpwaLkGMAtrLxN+k=
X-Gm-Gg: Acq92OEaWvoglWCzFQYYY0zKIiGbbs3eTDTCaPuRrH6q+0G0ooASt9L8xJPSR11ghl1
	yiDEUcOpvRlwnIqXrLzcGRfhhnOa31BAjmuTPR5Yra8nkyPR8+u9S9Zfnsdg8xlXWWkJlfkZYGa
	zO0wC5kOIdMKbx0V6OFs6S0i1VrGVYlJanzNlxy6I7gI1e/ooqT2srDOVIzdMlkeJl3lZOp+L2S
	+EHuombiLAKGsgzYVOEyvepJ3ml5M6alDzz98r3u3SSF+uVnDUJQOgGuXw4yhGBPQO9gEDLtEAR
	d9C/5HcTbxBSFOlA0WlKt/V/wB2eRtpzxJ07Hy7vYqQGgHZNCIiD3DLiEZvnNigp7PDu9Sxub0Z
	q/IN4i93yn48o5Yp9WH4MGV34a8f/hxssjg==
X-Received: by 2002:a05:7300:fb91:b0:2e5:faa9:ca76 with SMTP id
 5a478bee46e88-3077b437db7mr3385783eec.7.1780902253819; Mon, 08 Jun 2026
 00:04:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com> <20260417031531.315281-3-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-3-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:03:59 +0200
X-Gm-Features: AVVi8CfkctqwQ1afnp5vGSX4F85MzXwCNBMwN2jWnjjuq3Ql_RpXAPCbCeRJJMk
Message-ID: <CANiq72msu_mByr9DjW8kU9DWQg-0q5XqrboxRK1gOTwKs6QTjg@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: testing: add Kconfig for KUnit test
To: Yury Norov <ynorov@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, Burak Emir <bqe@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@kernel.org>, Douglas Anderson <dianders@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Christian Brauner <brauner@kernel.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 17, 2026 at 5:15=E2=80=AFAM Yury Norov <ynorov@nvidia.com> wrot=
e:
>
> There are 6 individual Rust KUnit tests. All the tests are compiled

I think here you mean "test suite", i.e. there are many more
individual KUnit tests than that -- hundreds at the moment (mostly
doctests).

> unconditionally now, which adds ~200 kB to the kernel image for me
> on x86_64. As Rust matures, this bloating will inevitably grow.

Yeah, options for major/relevant sets sound good, even after we split
the crate. Not sure about granularity, i.e. whether we will want a
Kconfig for every single test suite, though... Especially because we
can end up with a ton of Kconfig symbols; but I see there are a bunch
of those already in the tree in the C side, so I guess this is
expected/fine, especially given David's review.

(By the way, KUnit is not intended for production kernels, so I am not
sure it really counts as bloat in that sense.)

Thanks!

Cheers,
Miguel
