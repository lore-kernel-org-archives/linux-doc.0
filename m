Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8816723A9BD
	for <linux-doc@vger.kernel.org>; Wed,  6 May 2026 08:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778056702; cv=pass; b=l15i9Wmv5I7PKENHlqmOXeruSPC04smp/NPtkNcfMcL8nB97AUhTyFPtn9/ZVz1kmaa/95rDenawUXNWoiL3ngsU5UhAymytSNYc6inAwu5kZC9WL7+5n0OiyvkMIlPs/iO3OKmfGi9wjGpYJax+wp5TH4Wqc1m0thHXV69QhKw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778056702; c=relaxed/simple;
	bh=9nVWNeTeG3ZRxhZzd3nwBLx+qelPCKU8ekJq89YrS+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=usjlq/6xP5btIEO+bf8luSgTjnU0TPixEb8+gQhqwtuvmV2UerPDAdH3JCOr+JQhIdsKvC0LeKykHoYgRFMLrcq4+KCNAjRJxJYgH+T1m3Yb4zDHflhbNGc7F1rjqxqxZMqqDNZwBi4xd6yf0ZqcUGhM7UDE5ORyaYe5YpMs5uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M+oSqrr7; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M+oSqrr7"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ef397ad64dso257896eec.3
        for <linux-doc@vger.kernel.org>; Wed, 06 May 2026 01:38:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778056700; cv=none;
        d=google.com; s=arc-20240605;
        b=E+YyXfJ4Qhd43sliintDIXY794wlmI+lMpewWEIw3O+KvsGRUCcQpXpO9g+pwJFFj+
         OwVM2n3nq7hUJdoglMiNDlZaF7944MMTqs1wiL5ls8RauCmJK+NdcEMgi2+il9cWAnRA
         6Oa8wxcAqgPux+UrxXRgyh+o3qv2tzWrPy2u3vqEpXpvbOn4l5uKLBz8QVOpA70WD63U
         ILkVfptohbEB960ZdrxjHP7WUtSKZpfoBo3n0zKA1e9B1L1M8J6dELUNb0EIlYE3JcO3
         lUtbV7sAYu/ncQhcrIKb6gc1r83k6STvH3FlafQRfr72h/R6nhm0lJlYaGV25XUF88Tw
         P0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        fh=DV+EyHDJC1hvjOaIUxdm3mGe0PGzWUXaxNpNnwJGbwY=;
        b=P4ZXxyjAQaiNIcsgNgRb3I9vzabIpssn1r+csZl4rFj60U2QgRfu9lFwzlC7jccS+B
         RI71m2Jjn9zSfQBzS670l9JoveJOBYGWoHY/p0jSC3++rP74RT4KQnbVdNlZpCTQPeHO
         XGpPHR2krjQbM+2rKhtyvyjeu0W0fAI7S5FTOFFWPbu7pdj8VQlpofTUK/3BybjjCTJd
         yNpuXu6OJHsBYXJa98dnOPBRlRjdGCa2frZqDTiQWAm21I5Df7gNKD/ejBQcAyLLjusg
         /8zrtZ9Xfz5gszFXDt9TdryLXPsXX+/lWB6NRM4uqlTj7ztj5f9i8QDRhxf5y9CQ0/lV
         PA3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778056700; x=1778661500; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        b=M+oSqrr7ATlLSDWBSacNHlQqSP6S8t4csJphptB1y4CcsnaXzqeL+iNTaoKoW9Hl4T
         cdQhzTzHUrwEkAE9L4Eh1aD0C0sY3weJnMaJGoJTi/z4i8sljw9PKjaE7tSoS2KhnZDL
         CChA/4eR3oQdh0KA7kpTMvJlt1mcLs8tUK/fpIT0N2fJsdnO9LyazDbOJQ7vYM0+lxUs
         //wkTv8FPRpPH63l14lrZd+ClQUcqM9zkbgF/kA0z6LSClAHWb1Y+8yk/fKUOQ89Vld3
         3XmXYSGxL+GNxd3JyI05HfSZHwpsC+tgA6W8Y7JmbbWJa56A5h7xSCF17dEKX6bArPHh
         g+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778056700; x=1778661500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjJ3M5hqlIjwjVLxyicNRFnGTiIibcbqWXMBe2L4fRE=;
        b=L7JIJaLgfs+zB2O091F/Cqw4U8B7b6rV9imQBuDCxi5+5BycPcNh+S3E7WTafxPsNh
         QYm43NUHsxEDI4H/s1AJW+N3S4cs6fZ1b8eFxsbTbepVzvea0vTiI12av0fD02WJH04R
         6f3QJbNi5hvxenvel4kRb3M/LN3agssycm+H6f/ilvZbyStCts6THN65rRBNi/FjX3Rf
         fTfUcJPgpS5FlA73NpKvcFUjdxKvdKiyWha38sykByCzerunND4Xa3eym7WcchgPRQcn
         bvX600sdeJ4HHNc5fbE1oY+hseUk91bKJLKgqD1chOhNq44EEviqrUBlE9wHy2MLI5LP
         Rj8g==
X-Forwarded-Encrypted: i=1; AFNElJ/cM+Rcz7K95MRDfvHr4o5+f1KY3Jtqk2A2MavWffLc2F2/kW10MstH/YBdQ1oL2m2ccDjPxrCIF9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB8322Vk1VlFJXNGGlcMPsgpKBfipMmIqJI/vcdvfb0U/Ub+Ac
	MHTnNMJGDLRB4tXYkRauh9nYmvcx9pFmUbGW6NHNqLGWhE78LpnDo4u4+NUlc11xXTOA/b0aABB
	ac+uEEtiBLJmkhNVFA1HBQLVHQ33BO+s=
X-Gm-Gg: AeBDietiZTb7eXCbk7tsnG34C5OMiU4u5ARic1Q/omRMb84y5DAfi4jdblrzWjZSvAC
	uXj19zfZPjLf9PuiU1nVlDRoFUHEZ8gPbmDYIS84HM9XBSmxq7x8FzxGQdpna86qgijtjnvaMZX
	0JS3X64MqLVcFbaCChajfNuu30S5r2AqryM+P/FgekiTP9Nd3hY3nIsVgmR76xFa6kxDIeAQwAK
	b1WCa1Lvmyb+4tTz5Bbzyoiq5CymQPAbcGseCZwzGaazI8ECzrXX6X1mFPiWuNRI72lWkjd38SI
	2wXqon8sdYmq0e8w4Z3gEWockMOQ2+KycADkh2RVyOW5Po/Tbt10JuHD4VywOSvlUk55XWJYQqA
	a1BbRVSo5UR8KG1Lw1YIVDjZut0KDLuGwKyVytGPSdCUD
X-Received: by 2002:a05:7300:a988:b0:2da:a813:a629 with SMTP id
 5a478bee46e88-2f5676c1477mr458743eec.2.1778056699517; Wed, 06 May 2026
 01:38:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org>
 <1bceee886b9027d66bbb48d9d6c8d1250ce8dbcb.1777987028.git.mchehab+huawei@kernel.org>
 <DIASHBBEIHQW.3EQSDUML6G3SB@garyguo.net> <20260506084935.1cd4b794@foz.lan>
In-Reply-To: <20260506084935.1cd4b794@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 6 May 2026 10:38:07 +0200
X-Gm-Features: AVHnY4J-4Wx0cKoZWw7hIQ4U4xAoj3JLXdrdEzm3q17ndVYjPejJZ9W_3tXEkz4
Message-ID: <CANiq72kN=2RsE0Wm_489Sc-VKO40A0uYinCj1McT=YMu=cM4aQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] MAINTAINERS: use a URL for pin-init maintainer's
 profile entry
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 6, 2026 at 8:49=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Maybe it is just me, but placing doc files in the crowd together with cod=
e
> on a project where documentation has its own directory sounds weird(*).
>
> (*) except for userspace tools and staging drivers where we want
>     everything, including documentation, contained on a single place.

It is a similar case -- they are vendored libraries developed and used
elsewhere (e.g. in userspace too).

> As you're already using some scripting to do a bidirectional sync,
> you could add there some logic to convert rust pin-init documentation
> to rst and place it at Documentation/rust/.

Most of the pin-init documentation is elsewhere (embedded in the Rust
source code) and already rendered at rust.docs.kernel.org.

(Using Sphinx for Rust has been discussed in the list a few times in
the past too, and that has its own set of constraints).

> Btw, on a quick check, only Rust has markdown files:
>
>         $ git ls-files|grep ".md$"|grep -v tools/
>         rust/pin-init/CONTRIBUTING.md
>         rust/pin-init/README.md
>         rust/proc-macro2/README.md
>         rust/quote/README.md
>         rust/syn/README.md
>
> As one of the people who spent years helping improving the Kernel
> documentation and doing lots of conversions from markdown
> and other non-structured text formats to RST, I have to say that I'm
> concerned with any trends that would add doc files that aren't
> properly integrated with the Kernel documentation system like those.

All those are vendored libraries, and most of those `README.md` files
are about clarifying where they are taken from and their licensing,
e.g.

    # `quote`

    These source files come from the Rust `quote` crate, version 1.0.40
    (released 2025-03-12), hosted in the <https://github.com/dtolnay/quote>
    repository, licensed under "Apache-2.0 OR MIT" and only modified to add
    the SPDX license identifiers.

    For copyright details, please see:

        https://github.com/dtolnay/quote/blob/1.0.40/README.md#license
        https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-APACHE
        https://github.com/dtolnay/quote/blob/1.0.40/LICENSE-MIT

i.e. they are not intended to be kernel documentation, and moving them
away from the source files doesn't sound like an improvement,
especially since we were explicitly requested to make the provenance
very clear.

We could perhaps have a list of vendored libraries in
Documentation/rust/vendored-libraries.rst` -- that could perhaps be
useful for some folks.

In any case, I understand your desire to keep things integrated in the
kernel documentation, and I appreciate that (I also like to have
everything neatly integrated), but please do not assume we have been
randomly adding Markdown for no reason or that we are not trying to
keep things properly integrated... :(

Cheers,
Miguel
