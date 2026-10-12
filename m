Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956EF48FF9A
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 15:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818488; cv=pass; b=snGRgHiPQ6zvZkDTkc+nw8jMN+Ntz8S06aWEJPw+BofxeT2OwmxPph4VSfP0FnujXN1BqHv/BQZT9VuyZ+3qJ7wCsPNdsERvjT0nQa7I+Pi/GnL7LJnrTFSGoEV+70iXZv3ELEcYrpSEzlW90ptNKWt0uaSOOdSZrGuEFzD9xsU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818488; c=relaxed/simple;
	bh=acXxdYNI6vj4GN6tEYHBYlbXzhzxGLnqPGYWn+EXNdM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PsEteM8OV/mjYEAmFKJl9/beSMtwifypBlOQtIAJmCnSHPNGoGXuLonW4Z4tNhjIEgM6+aswEHFUoF34UZbJ54lCmcDXYRU8YIxyC5aPD6jFlyXS6Z/ly5Sds+BohCQK3xTLbU0PkYduyxvck3KgQHz0Wrk//M3AWCK1K/f8IAI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9UVbICO; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9UVbICO"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c30fcf33fso265248eec.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 08:21:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818487; cv=none;
        d=google.com; s=arc-20260327;
        b=NYZs7JImddj8zAndndNH1VbUbIxaO9wrEEvG9LnMKUPzhy6GaYe1wzHeom0MjRNQb0
         7JKNwix8otZ1YjlJ9ue8mfS098xQobSLzDGsJIr0zbXcSKuke6kMIg60MsS1NXwbJYUo
         SmKWG+OP4GEFrXrzA36Fa+fLWJpOtcHr8jUYyVLpv80gDREtk0oRplmmBVyCF2lZ9CMJ
         6O8Fh8jrbFy44DDL/QJj2mBgELeLyAGtJFzv2yM6cDQk+Jd4yZVqh9OkS8tqoAgnDaG2
         S8+MF//X7KwUyiU6PGbImfv1xusyeCsm3bm3uv/KuLcfcKC5UInS0yuepGhvIUYnLlqs
         7jDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        fh=0ChQbOWQ8dzDbx89l3sAphYiDD3aq/isR0CPE+hYl/0=;
        b=fTsbwjI7C4jiqZfux7gjRVbakMu7kJV6oxrZYsYzQKzgxp52cBGAKWg4d7hJCqwfN+
         xrmOTfTrItSlPQlWD7swKQqIVYPCHMqZbIlsAkeXWc3zbgGABJXdHP8iyDHs31xrzORi
         uY7aV4rPdHCNuS8xIcSO4kuobTzL4W93+0tH3Warzoz0J88GpDk6wNeIT+NrF35XDZ4i
         R9wT3CpOS41FkGfB94aOmtknDTOK0o/lFGzlw2dggM1YgQnQl0P1/Xoi8fW7DZ4Zwkjw
         kHLrsUrkrinDEDGbdNM4lVGD548kEnnXkNllrZQtLyBjwfcXHz5YDtuWJczOxKRHJ9Sv
         GEXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791818487; x=1792423287; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=V9UVbICO9Vb3G0dHVTiGb8S4WVniQxs6wmTmPNcXznYmsWz8kd1y+k31MFrHAf8vSr
         F/xu3g2v5JkYjvBeTbKIBSPdbOMtozVeZwNJe/sneeG+41EP6qmE4OlR8ZAft5Aw3GY8
         5QKTN1uz326YnQuvFOv/Dh4E5k3sn+Hyqa94/cPE5CWDlxlTTKSV8V6mLrRTozIwWcOH
         sqHovpjY6+6o70mawD+5zf6vV7GcNVQJpS1asU3zptVn8fG5vEtRCymo5tXcTJVdT/dg
         aOQpLbB7ySZzkjVQwzGgtzrtANP0OAgkCKgoS8RaZIK8+EPmpQgit/8WHVOlQr2kiIk8
         S0Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818487; x=1792423287;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iLgJ65oJxZVZBoTJpBXKaV00tw4eO5li3Mv5JTtGud0=;
        b=zHqdWKydKjzIYiJw+xXU9/ar6ZpF5r9No6M/e79EfoujXURb+CRD8E05FmaszeYWKk
         s8sMlca8Hp4NrkxzrisKPjrAeSH6mAAV0kZc14ZN3nDvMUJm+u8KxvTNxbE0J53vxoVC
         Mo3AKLgVi18RXzkzaMm7gAMEKZS/OnMc5+6iM9x9AKJHn4mQ1KG+NZfvBBpAV53RDCNb
         aqnfW9dvVU60Kr/v+dxffcQZ+t5uNCpksMOAeTzDG6ODjl2LTzhJd/o6NZFdfZAGz1bG
         82LJv5yoL8vcsmgRC5ISxf/YoC/V4LrrIHMQyk1Ul8aC5ge404YSxGScz/jt97wrWiPy
         pOkA==
X-Forwarded-Encrypted: i=1; AKwUvByrXCoMacGVWSONNqEsjw3lSbxPTZUH/DmIorHbVdcIiXxxzTcYP5afVed3JrAqkyNzNDxjIteDRAE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpTGpxa1yNkQWLTdGE8+Ymtp9d6CmQfcsQct6FCxWHYNPA7lcr
	d4nydczKcNaHeYZsqQBeZppjgdOqBgMCVwW7vdpFW4IK9AkD3waIel5xSsQRGc8cFTVvwFXEOyE
	vvaLJEXVaGY6OdB8zEAV/HZ6AunqTJPM=
X-Gm-Gg: AYBFou2d/sNwCxOZ1xEGxIzEFGLSjQ5M0t765yh/at47Sx6s2+7EmEjTs2sfwhA1KMV
	+4Tk5SWPRkDSWIDSFLN7xKjSL7+H/fROc3xpP5r1z0Ien7lrAZxHRMkHDePGi430A9z/hUlMkH9
	QE0c5ezXXjKbDnu5KVuDYqWuhhehPqrcSN0mvqZU+QWLBIz1H2tvD/KOzH32XtNfShK+EG2OSLC
	hxofNO3f/FjPH74PdpjFPt2TWwZC/kypJODtoADIqHWVMPWDY1QyzgxpNdkGcdrvVObRsV+Rdrp
	e06vlYJIMAHOsQXnO7VQqb8N2EXV2YL7nZvyAloit08ynfU4rOG39Ibee2OoB+ALIGdGQrmiruJ
	uZ8ft2goxpuoaPwAOEqBWuLuWwZRn4HCZu2VMZ3jK1p3QJlegZ/W60HCRGMoTGto2kPaWPgKPlv
	14it88I8ECob5L5Ctu3QSD51yXbyFrt3/6ArJrxRZYdpnp7Ru6mcg=
X-Received: by 2002:a05:7300:f3c8:b0:351:7883:bf47 with SMTP id
 5a478bee46e88-3537dc8e9c0mr22095379eec.0.1791818486595; Mon, 12 Oct 2026
 08:21:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com> <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
In-Reply-To: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 17:21:12 +0200
X-Gm-Features: AclHuK8qicd0EkbAG2tR809BSGa88U6FRkGTx1gJTbJF14aEuOf_oW-ieXqq320
Message-ID: <CANiq72=p6a=4K+8jhbm8=y8i_4yMszacK-fu91s3-Eg69ACejg@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Marco Elver <elver@google.com>
Cc: Alexander Potapenko <glider@google.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Yury Norov <ynorov@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 5:16=E2=80=AFPM Marco Elver <elver@google.com> wrot=
e:
>
> Oops. I guess we'll make a v2.

Please also take the chance to use the kernel vertical imports style:

  https://docs.kernel.org/rust/coding-guidelines.html#imports

Thanks!

Cheers,
Miguel
