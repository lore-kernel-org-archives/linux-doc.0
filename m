Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B2C2313520
	for <linux-doc@vger.kernel.org>; Sun, 17 May 2026 06:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778999311; cv=pass; b=E+ZekUc+z9uSMcMN548g8Hwdf8KlKPzrHDd0YGtyu0ct0BAlhSAdtIFnQlObKUTzec2ZeWsbfEag3FTDGqjhcb0CemMXaDZoqh/2lTukLliv3i26h4nVfHdblueJV9/JC+VFT7DdFkf94IvF9he5a7OvTWcy+Q/TFmhLJZzcsNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778999311; c=relaxed/simple;
	bh=OPR2WUH08s75FRHvXlU/rcxu+thbh0/WLa+Aj8Mbla0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDGk8SynAHJTi7O4HvGYrwFXWCMaaxciuwzjA7SRkNPshJtUhopFKv4tfDeWpaJ5EEwWUV+rmdWc2YUsyrISc0EQSwwpbnG4JEdru1aAtC3yOk3mJfMR5ztmquGxP28DIY6xED5iLUENFXbCOJ6v3x+R9szokrq+WSv8gsU3qfM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YGTZQFai; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YGTZQFai"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so65304eec.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 23:28:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778999310; cv=none;
        d=google.com; s=arc-20240605;
        b=Vn860iTpAapPGBgSwUziTbh4mdUQL6i97zDbXkKpg/HdeBe8uDekAQjtwErxlol6xr
         UQvi8q3XCMOETO77xt7W/IdWfXmEAtUd/pnPWmdBODx04baQeAFsWmD2gg1UgICR4cyF
         eiqATGMEuLmAlzLRSe1QkNDQeZLPuZJix8n04qHgPdwFRbMK52m1Zo7QsZNe+HeEp0AL
         2+YSjYsthTGP2dXdQA/yRLR6H5Ue1nM4vmu9lJE+dnQI3suajInNaAog7Hq4vB1jwtmh
         evztbzRD0gTxp3Sc82fBGP7LbpRAAklRe6UYK+qd+NJXf7kt7134aM8YQ7rRZEngTtj+
         aGMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        fh=VzFr+Ed4+ZkvFBbNB2b/9C0DbgTvKlPDiWmRjw5mEo4=;
        b=Or2G2RQY2H8BJauecwm2ion8B8BJr/DU6ck9Mpqepd5b+WR5Ch7VQTYGJDfgIyJI7M
         kbh7cXLeIVZHmUNI4H+0ubmTQiTthFCfJ3SeGPbim/1BJFuV1F1kE9jInOV7FQ7z8geo
         PtVxY/BYlQaCWkEKFxry6+IJPwxp2v0VH/Whoz85WOg9Hv/WyjSX4rUQNHthlY2csDuI
         Vj9h0QtzVoE+bjxKqG/OPU9+vN3Onhy2eWjt7E43k4aYPK6txU3Z7nu+EB2TmW/NAlsM
         fOwKp6gX73w4QEKgXrqZPKnBuOaco/6bollj287bEQWhAVi420lBzSJo0ELNff9CuVZ8
         eA1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778999310; x=1779604110; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=YGTZQFaing4oMC2mITA0WdJFvtBI2Hjp6gzlQbUUETLlcDgE4kRB8nZ4B+OXwa9syU
         ZD8kz8CBtDMklZw2LOw4JtCSSPAw9GAqObXSWUV0M9SfGOF6SidYzrX2jr8VNW+rg08+
         2S6aQlt2DQ+LJhX00Z7+hYgI0NInjk0S5l1YN349fL92HCuHdMjWwTtk+nTz3DSy7yO5
         1ZX1LBkh4ROn2jLx2iRDMwLXME4aIIr/iY2+LaEtlr2u0WcpzP2D8o7O8B1b32UMsK3n
         A6sUsqTmY4tzMHqgfiiCwr5AQKRfX2aUGpbUt5Ol9E+MT/ZpHGWYG22Nu7wU67p1ORfo
         INwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778999310; x=1779604110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MlGs73OLRAgT31iPjKu3H4aS88H+LsbmLo/DH3+Lxm8=;
        b=hEMyOZwjveAB0E43nNZFda4Xuv3TUwnvx8mnYDiS+gx1TjaYBGVvp4B1fpVkk0zb3P
         R5XU7iMmTVBuWoANbVzZIWtzJMbIfij1onCW5l8NI5bksE1C1IBw6qgvqRXX2TtGdKIy
         I+ICsn58X8/6rMr/Qa6TXu4xj7cADyK2+8SmpbKJkntYGaZ5HsEM9a24ZOj1UlBghyB5
         3G52CX2mEa56ilVj6AjdQ7nue0cq9ZssRBK0hIzZ3ODBrfSOJZsRXrrOEpRBDjDmnrmY
         NqYlUz6wHydbFSuZ6UQWMWwXo8ZNMv85JQFuFoluBMtHJrVS6bGa4dRg++Gu8u+kN3eG
         qOEA==
X-Forwarded-Encrypted: i=1; AFNElJ9Gj0pwKZkox1hRcG6unzy3sp6lblGG/lvVSi8CEeIibkaLU3kyAWhYXXY+ZTULNIHHclupA9mKtv0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XjsE2m9NcrdTskDNK08lXSpdf8bpDdCSVt0Ql4prNibzV8mG
	WD/gHQrrj2t0NelQ10g6p400bd86v718/iQUEMMrRJe7LSxmaR4rDhTOwzDCoPhfrGjRbu6Ykr8
	/Cwq+f/zxuRB5T610lSOCku0qVpv15lM=
X-Gm-Gg: Acq92OFyP1M54cSvoEr+C8CbAMdShWE47Jeab0m8gT64Ficqe6PAtKxt6SItUAHOSoQ
	9l0RbudhXGFcQeMKIAcVIEmVFjTBsfTSbI+wXNjg5BAawDiQjKnkc6ik3g5teG0aqaW6n3bEOTH
	EBa6XQamUERx39O783qgXzvEN0XBtKDt82G53oNafmykSexXtN1aw7u/i8KAjNP2z0N3uNAjd7H
	nAfegflBtdmQWL/4ZwiG2aqytGd8Bb0yalevwyW+Hkja+YVzjdJJ0KYHnDYxRYzdVhgpjQS39yR
	GCRBsOZa4AG0PdyneiXfqBkZ88ZFZFdg4j0EurXFbItZcLZAkCq+0Wjh5N9HJZ2VrDLwmXLu0DM
	F5EJiLa8PwlRUvtuOrSzJJTA=
X-Received: by 2002:a05:7301:644b:b0:2d1:9b35:4f03 with SMTP id
 5a478bee46e88-30398652434mr2296228eec.5.1778999309791; Sat, 16 May 2026
 23:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com> <20260516215354.449807-2-julianbraha@gmail.com>
In-Reply-To: <20260516215354.449807-2-julianbraha@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 08:28:16 +0200
X-Gm-Features: AVHnY4Ifc1Hb7OMmaBPhAaR2oSj-1JLh4DvcZKwastPdAt-HWTIyTG-2JU6Fszc
Message-ID: <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Julian Braha <julianbraha@gmail.com>
Cc: nathan@kernel.org, nsc@kernel.org, jani.nikula@linux.intel.com, 
	akpm@linux-foundation.org, gary@garyguo.net, ljs@kernel.org, arnd@arndb.de, 
	gregkh@linuxfoundation.org, masahiroy@kernel.org, ojeda@kernel.org, 
	corbet@lwn.net, qingfang.deng@linux.dev, yann.prono@telecomnancy.net, 
	demiobenour@gmail.com, ej@inai.de, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 16, 2026 at 11:54=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:
>
> +CARGO          =3D cargo

Question to Kbuild: would it hurt to hardcore `--offline` here?

If someone within Make actually ever needs Cargo to fetch something,
then they should be very explicit about it (in which case we could
have another variable etc.).

> -                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib
> +                 rust/libpin_init_internal.so rust/libpin_init_internal.=
dylib \

Spurious change?

> +$(TARGET):
> +       $(CARGO) run --release --offline -p kconfirm-linux -- --linux-pat=
h $(srctree) --enable-arch $(SRCARCH) $(KCONFIRM_ARGS)

This probably does not work in `O=3D` builds or in cases where the
`srctree` is read-only (please see my other reply on the docs patch).

> +// SPDX-License-Identifier: GPL-2.0-only
> +use crate::AnalysisArgs;

This appears to use a quite different, custom Rust style. If this is
going to be developed in-tree, then we should do our best to follow
the guidelines:

  https://docs.kernel.org/rust/coding-guidelines.html

For instance, a few key points are not followed here:

  - Public items are not documented. When they are, they seem to use
comments instead of actual docs. Markdown is not used either.

  - No examples, doctests or tests.

  - No `// SAFETY` comments for unsafe code.

> +unsafe extern "C" {
> +    fn curl_global_init(flags: c_long) -> CURLcode;
> +
> +    fn curl_easy_init() -> *mut CURL;
> +
> +    fn curl_easy_cleanup(handle: *mut CURL);
> +
> +    fn curl_easy_perform(handle: *mut CURL) -> CURLcode;
> +
> +    fn curl_easy_strerror(code: CURLcode) -> *const c_char;
> +
> +    fn curl_easy_setopt(handle: *mut CURL, option: CURLoption, ...) -> C=
URLcode;
> +
> +    fn curl_easy_getinfo(handle: *mut CURL, info: CURLINFO, ...) -> CURL=
code;
> +}

I like minimizing dependencies, but since we require vendored
dependencies anyway, then it may be simpler to use a common
("standard") Rust dependency for these things. Then we can all agree
on a particular one and use that when the same need arises.

In fact, it seems like FFI here and in the other file is the only
source of `unsafe` code, no? We could perhaps even `forbid` it
otherwise.

If we truly want to minimize dependencies even if we have vendored
ones, then we could call into the `curl` CLI instead, just like we
e.g. call into `bindgen` instead of using its library.

Thanks!

Cheers,
Miguel
