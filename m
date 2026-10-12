Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF5E49B1EC
	for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 15:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818167; cv=pass; b=sg9gFdkNK6oq54S8PQCE++mXQ2jzXKMG4JVBD62Ga0yEX6tkMr/sTuPDhJmEeHNqcFlyZDxbsrlbLJoiViKWsWKYcRlao/Ilg+AfsHm9ttnUOkeMR9CtTaDlkEer4NTwdF6UVLWt+wAL3BGe3aPmk4PjZdjBnpLowS0tur1NYs4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818167; c=relaxed/simple;
	bh=Qh8/jPpdQb1uoYLtiV+P2F0fMSrInIfSg+J+6byfOcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W7DMq1vO/UtWakIz+r2n0s3KOOzl/wynjKSfzNZhU87G6FJKv1uwtttvpSao7iuTXAsGe6pmzd4NGwszWn1h/N2thtCd4mSyyjy6JJC4wCHQXFwzzETyaum9eyne95C5gazv2+rJEDlLS/loMtyQgUP8DiQ0eyJ4Qivj9YQk8rI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H0BgTGEn; arc=pass smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H0BgTGEn"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8ab432273c5so14971257b3.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 08:16:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791818164; cv=none;
        d=google.com; s=arc-20260327;
        b=ZOd1Ni9ooQaqu2hAYCVTif/6gezsJePXclnECRxnXaKqB7hLKCjBPdd6Cd/QyTe5gU
         Fj4L78Urn5VIePjnAmkbVnD4HdEs75esbG8big4YWb6w/1IzEnEjUyVVoeIha1inQ2sz
         CaCFLjbx935JvNVv8oFDbjFl4vsDlWBFfnP2Bks+EZHeLsW/uQAKdOhOYu4jBjJ2krv8
         yYNJRmkNMo++huXd/5qOBmRsVXZtsXYQOn44QvQUtdGRIrcOR9pH4IP/GChvAVLPsXHD
         b3BxwIsFseiM7hjmhxspj/V9agT9u9lcAojA6/7syDE2eYqJ4qA2rdh+5VIDcnWo4qTX
         66yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        fh=6xxDP0jKyqf5jpFmxqxCcJSX4CR46aFm3LtY4CQp2mY=;
        b=Jk9Vqzi3WfiuFcqFkPmsPta1o47T4bGG7qvrRT1gIy0kFA+lWm4TjJAz9i1O6ytHXt
         0N5I+3zG3aTvICP2E3D+F6/3AhMMknOCqoWKT/Hrp3OiPZgmttjdbajHcoYgD7WT++8p
         +jNQFdFuKHg7y4eSRuRYgA7NZAJ8ueh0ag65/lSZhBcEPLQwdr/OTTXQylx7q3qZ/RkM
         3IFKhE6GjrOcYa1ggO3Uk1nHiZ5f0VF0mPZy08H77verko3iV+eWjnXPWPhcOU7du0JG
         G7eit0sLCxDpb+kg+3Oo8r4QDnX3vkm8NlsP7Nk+yOoK39rnbq0VmKAdlzowf8gT/KIm
         iI8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791818164; x=1792422964; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=H0BgTGEnjHPsOpry8zM372M3cPbee1W5JIY+k1KGqv8WNzGyYlMWruUcNGXNpqKqHv
         qAht/Fg1XEZo8JjFRoEHFhUiRD8Q5cYqy8MKiZYc5LQtEbtjmhvyhG/D2J4elSaSnKUV
         ZM8MXqxhRXUvbFnlIr9rEEaR8zAMYY5wS09xL9mUt1dlIaceViENwfpBgQUtW3eVOGlU
         pDKwvkrYloE/6nhq3HRdIEjN85hfMhGmgpxKiemxr8Ipgmoo4uHaSrLyQls+oGGVrOtN
         wPBentZQM0axYBEPhSU6pemvJTTbrMwGD/WXXj/XHgW/LcIPOfUMxG79B8fdKd97k9XK
         U3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818164; x=1792422964;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cioAlEV1QQbacYFfypcvEatBdbBuNNB06BtQiQCYi0c=;
        b=ya+PgKdI67bfg4WJh2l1jOXmX3ur3lzT8mvKBLMm1eKymPZEh8OaSMMR3I8uYw+7is
         uOfQMx+8jgETgzemG3fbo5DpQjVaoiM0FlJ7BGSq3q72QfAxEN/gjigarMYc+TN0o87U
         LhlJw6JOOlFySKd480Su86wF3AOIhuMwAi+eV7/n/+e8ajSZ7EAZJVHS3e06ynhvfC6U
         18d9byl4o7gE80OXNtl/Ws1g0fxvs+KD/vrAWsQbi4MnaXCL8uYpLd7mViXt+frjpeNW
         6zjZWZNM2f3DaP0NURYLuE8REwbMWj6jYCLs1J54JT4Qamz8WZ+/JV7nlKDmK444+ITq
         rSfA==
X-Forwarded-Encrypted: i=1; AKwUvByoODbHV0Eti6GdXJp9vxGv0fmH7irf3lPcALidqwosw63apacjjLiqPSSVqExCSwqVHH/h64EfnFo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfJYK53Qisk0/JkMuW3wbKWDT/DYBOT+FVsej5BAEEzBnOKgjB
	NdgkhXIOy7aEr7Ai4jy82cP0XbO3CCBULFPnTBUq83GcNfGD/pXQs/NEru/2H2G/4VgZtb5wyrI
	UZmduILIoN0rK4AyttmrLRXf8CXpWzrWWMToiRXcH
X-Gm-Gg: AYBFou3YMLgFpY701DB+6/9XYCUHsZXtSicAvWlNhSLZUf5fBLgQKtK/J+OdVQV7E9m
	6655K6oT3j1YOe3mpCDgWTk0+fthMZI3h1YalAX8DN158Az8lzS8OGHWhXLf4AvXKiVjOcaWiao
	m2Yw4EsgSIi4fa0YZLnGpLdJeEY9bvqzOd4AR7p/uPiUwuo3y1+jQjmtAYXk6uKtjAoref1LjQT
	PAK1TeKN1oaNkffJu7TtqHwwujlYBs1QbJpDvuhG++Zyn2nybo9VR/+Qs731kOp/VY7EwM2QXEl
	tV4AQ+USRdOo8dGLU6UPvmXm9y61Rzf2hSRcnkOJ3mKALiLXT/QftWON5IpGnwLu6JHUPtc2Qao
	yHbYPke+RcZZSNXrTG4aE
X-Received: by 2002:a05:690c:f04:b0:8ae:b617:713d with SMTP id
 00721157ae682-8b07edfaf6amr35969547b3.19.1791818163556; Mon, 12 Oct 2026
 08:16:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012134159.912183-1-elver@google.com> <20261012134159.912183-2-elver@google.com>
 <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
In-Reply-To: <CAG_fn=Umb8c1yjp-wEPPFSNXfNdr5UHb5BBd4tV=iwNSehCxxQ@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Mon, 12 Oct 2026 17:15:25 +0200
X-Gm-Features: AclHuK-ngdayfpaG9DdBIWGDrVoRKwhiuwWtMtaRRkzMdsYW60BnSKb-GUjELAE
Message-ID: <CANpmjNPBoS7SUTMVboZPGdgXbhY_sz2LhzZqEU=EPojVWkqWHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: kcsan: add KUnit test for data race detection
To: Alexander Potapenko <glider@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	kasan-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Mon, 12 Oct 2026 at 17:04, Alexander Potapenko <glider@google.com> wrote:
>
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/kernel/Kconfig.test        |  11 +++
> >  rust/kernel/kcsan_test.rs       | 120 ++++++++++++++++++++++++++++++++
> >  rust/kernel/lib.rs              |   2 +
> >  5 files changed, 135 insertions(+)
> >  create mode 100644 rust/kernel/kcsan_test.rs
>
> FWIW `make rustfmtcheck` fails for me on kcsan_test.rs

Oops. I guess we'll make a v2.
