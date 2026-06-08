Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CBA2609C5
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902321; cv=pass; b=Jv6YX2eLQePYyvg4VmtarspAJF6E1VSqYJl2/93x0MMqSBb/+oqff7fUWvBhZ4YtNm8EM+YcyMM9aTa9McuNiFJxm6wvnl+7citUDijOWsMl9LAm0rUYjaMpYzZVs6wwSU/oVA99RxxLZnFioQrkm+z9de1bNDXoATycz12BxhA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902321; c=relaxed/simple;
	bh=J6Z2RHY/NCDFoPrX7lhs4FTKKwpaOxpIvJqta3A6z60=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BCCx4F8zhG36UlXirQ6n1bMDYXUp4YI5JcupistjhpkMy9BEJpibNa014OzH2rtXAkaTF3XHaEZ1BpQIewuc42cd9y0HcrPmwt8DU1Z+trSlZ2owQRLR3fjZfaekMPjpJasuwMFgBx2aDHI0wTyGPBYx2IJetzGRu2j6jQIJnoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gW64x+L9; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gW64x+L9"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-304d4e57d33so172858eec.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 00:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902319; cv=none;
        d=google.com; s=arc-20240605;
        b=EvhV/usmukx4d1wbdwf7euV/gZWqtEniDRLVdz2ZCLRqrxHqw9AgIa5LumVOKOxTL9
         ehPYVAY5JZ0dPeMMnh4qko5ivayJrjVtJlZHSeVQlgtaKAvfpWHcLYTGy+UmpCKFnkrg
         UMS84TQg3P4SuRDPjCF2tw9DoM9WvX/7DwzhTGlvjH2bn196Ch0GAQ9gFZGTX7P2Z48h
         g9mjtTkFM+aaPeP9lGGjJCFq2wRFR8uucCy8sz2J8MOo2OX1KT7klNOIoAnswHi4ztQq
         SBw0j5BOb6IEja6UzGUccac7jAQmNE9x/cXSPlGtq/Oj59NqURWfJ1jmjsuIC8ypgE1l
         P0EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        fh=3lHZb7yWbdw6fwZ9VxTMOJupqtAJ7Ku0EJY7vvSBj9Q=;
        b=hTWCk3fY0KqQ5Nax/nlqvLGMwPJsPuhHdiaVINCMKyewrACsxnXEICKBhkCjDC+OJB
         52MEReTrmZJw68EVwvqzqJc7J6tRnE2QDP3PWe3JE3IObYLlRkSqwTZ6O4bgNhqsfAvu
         6bgyiAE5xGUDv9ICo5W4R1QPnDNZ0XB6cbiaBxu/sOtVyUT7e80Jcsk5gnjcGq+9Dnb3
         RoLASBaYgmikLbU5kadns/9CmCKS2dMtV7fxDh/Yl0/HtAZRnsPK1NT87GMDdyFi+xE5
         T9AExOWwSS9OhsMLsaukHA3Y54xNtXcKA1hXJW8/xZ5r4DI87rpGV8uNK9vvMCtqfcz4
         eaGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902319; x=1781507119; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=gW64x+L92hygzkwVcHbOrih7mWyvRCP0fm9Q0guozA5Q6zxSZMmCnJYf4D7I1il/kC
         5Yf3Z4Gr9jopiuU/8IQsjlRp4Vsmn7dVGgwT5iEM1f94Zhlu6U51UWGov68DtwfXWbGi
         YcoV5pVAgDAdja4O+skFC+6g2ribkfBWF4wN9WmP98DzXzV6WC44w434DBgTOWhHJXgU
         SFpeLBErQdZSFjlqYsrQgDbXjozyVmrSqkOgkVe30hPpXrloEdxXleZMwyrs/blRNtTJ
         LfSazKDX1iDE87Fx6zm/6r9Wz/H2lyF3N7T8K292sGC/g79kPizEaVTGaYPvL1+tD5uF
         Ax5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902319; x=1781507119;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qXnP6T+INpylmBsxtscmRoES5uiMtsm/3pgjyt6Nko4=;
        b=feEQ2OD+xEtS2vPoowxixHe6uHA458nkWSYRAf/baRLl/I+ibWmlXqQenzGU59ZiHA
         sZJatS6G3Tr9wdKJ/eZbOuAvEOU+mmyavVCJvUBp2Vo1EbF/nR1yesOkFGEtxm4lBVJy
         in3150BDjSBgdkHlZWGOUYGMvneAHEFOyU6RB0ZZ4lFBYOC7TDsqQg/5Fynwjt06cje/
         +XpoqJy/4O3cM6Cgrt6uSKOzZiLvJnVDgSpp3OFOJ2oYyGTTXeuMBQf+6elJK3W6ZNC1
         ovFXV/gh5fB9YZtsrqQnB8e4GQAfocTHY7GM98LiGrUmQzJqPfR599CH8MrpMnDOzoaA
         c7rA==
X-Forwarded-Encrypted: i=1; AFNElJ/GhuergmQk517DOHlI8tvik08ThUNI4pBHljon2DpcDHqzC93dds/hhO4EdJuJ+BzVKrRmpp0IbRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzD+iwjOSZ0KsQypaJHyTb3wDubCQA0AyjJ9x8HSgycVUOAXzNr
	D4W4TCeVbmJXAeZRx4Cah0CpBYGjvdeDgxe4ONRJTrXyA4T8Diqyzk/I9hn1n5oyNN0+F3NUKOg
	+4i2ANaM10HJhsHz3gUFwJ0xHVl70L1M=
X-Gm-Gg: Acq92OGQVzj0He9h2KWXDigpgIkewWdytfJWsEDG9c1Hawcz0ayefOMzj5mIP5+H0WX
	2GpDLJ2b7spiYGQlkqt33V38/PpszToKTY22ecDmSk5Oi115gl4iDHEtknzdYgHiZ6hflh2yGiP
	w4XVl7lP69bb8+xJ+s3efEnknx7orXyfQh54hYGXw/9r4u7UUSiD98AIESEj+j2icXUZ803QiYI
	3ibozhSwGHyR2bmViTI8MiojJ1TcDODAEuZ77UWe5OgZu1aJTZFkfO38IAwNglAoMU6su0Eqs/g
	b3oo0cXBDO0YbAbS3nS15xDYEBy/iRl2sAhGdZbztwBaReNQIdC6OHewHG48RKnMQPyXv+4+yWG
	Q8y8/Du00wlTK9O6PKk0zI3rRDRvRoC0Acw==
X-Received: by 2002:a05:7300:134a:b0:304:4f23:4823 with SMTP id
 5a478bee46e88-3077b326a5dmr3445647eec.7.1780902319255; Mon, 08 Jun 2026
 00:05:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417031531.315281-1-ynorov@nvidia.com>
In-Reply-To: <20260417031531.315281-1-ynorov@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:06 +0200
X-Gm-Features: AVVi8CdioJIDDz_cRAY1RuWSS0KDIb_lefz9KIF5grkUbE8JNDNatMTjZg__w7E
Message-ID: <CANiq72kAmcLa6AJy_-Z7HOQHuQeDtd3aUNZUJ9q98FWF88knVA@mail.gmail.com>
Subject: Re: [PATCH 0/3] rust: add Kconfig.test
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
> unconditionally now, which adds ~200 kB to the kernel image on my
> x86_64 buld. As Rust matures, this bloating will inevitably grow.
>
> Add Kconfig.test, which provides a RUST_KUNIT_TESTS menu, and all
> individual tests under it.

Applied to `rust-next` -- thanks everyone!

    [ Fixed capitalization. Used singular for "API" for consistency.
      Reworded to clarify these are suites and that there exists
      the doctests one (which is the biggest at the moment by
      far). - Miguel ]

    [ Fixed the paragraph by moving the new sentence above. Added gate
      in the other example as well. Applied proper formatting. Reworded
      slightly. - Miguel ]

Cheers,
Miguel
