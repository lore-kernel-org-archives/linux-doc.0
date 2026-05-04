Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA6583E2770
	for <linux-doc@vger.kernel.org>; Mon,  4 May 2026 16:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777910901; cv=pass; b=noMWEanzhpH4lIswRvNzrH1vBvI1h9976NJqEKnjcuMQi5FYg7Ke5vOdHxufDoTEvNuH6DXvL6c/TwbPOGxQiZY54+JKuPzGrWT4CLwZ5eHawInOfIMo34RB4Y1GLH9sdKysvjqPDhI2peaS/xVOJPJLCgkKl/1HN1yBsxniOVU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777910901; c=relaxed/simple;
	bh=ef5tKPM5IfhcdqWy2kyiuJK0jTEY69jCU5pmQ0Pz2z4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjLO6o66EMR86G8T2V0LcF0fFbP1S7lgBhIQuU1NhzfKsKoVv7xrGhuWS338BqA3W1edqTvwv+25qBAwLthQfsFo1DYmwg4xjbFd8ua0Kfu0G7Ij+n5H7e5a9+hi06skmOWtMdezl+gTa1ZcBKV+RIgJjy2sN8MzADkHYtKcbcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l+/Iwx6K; arc=pass smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l+/Iwx6K"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso103502eec.3
        for <linux-doc@vger.kernel.org>; Mon, 04 May 2026 09:08:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777910899; cv=none;
        d=google.com; s=arc-20240605;
        b=e/45qUbrm/Jmmva8al1wHaLonteIMxrVoRKA7RaJf7/rtlmzsvn3TTk6fJs0U9OIm+
         P7el2aJduxCUwMM/yF3uZCHvryrsjPFqiI/jbajlq02bvfYHEERy4mbp6TG/OC765Gud
         1GEUN3d9c9KDZwwJZ/6FRM+KR8zmZCEAJDMNZDpSEitiBp98tsVOxHNuJGvB4s8Haihu
         g5Dmr9cHjEluhBUbkH7IH8RGOQDhZmGEMXESXlywoy7W69c7S7ipUOLATkHGcwiwO2Oy
         hOsFKXLjxIRcozSVb50c11LoIxa0acOeakMru73uG7YRlYDQAF3pwFjn5fs6QtLJ8zPx
         Hl8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        fh=wE2nI014YZBcT5uJ60NYL3b2RoNaYoUFLDyKj4Ujs5k=;
        b=FshSq0ZlrJsuVK92M9sygIlKPm2PZwCN4P2k5qPXrcd7nZsbd9J2hyvzuRYu9124lg
         qTIMy2Ec0+uR4OaAIImNBMjJAdexiuaJQQG4dq6LKyJbqAk3OZRJ8Paq8CN9Hvlwf/bf
         5rxh1biM4RFhWTwCD43ZefdOShAqpn/m7MPZy5vUzOQFujIFxfz7UO5Ed2TR1neaN0jG
         /7/VS6pjWwnrBOx/g1DmH/Pg37ZSGElwcctmsxf/J3a3l97RqXoVWDbYda4Lnu2Z/SxK
         7aut1OYZB8W/sOhgTXvRNPteTBffgq5jqYfKZSwxxzOSBF6rWpb0sTK+tlrcn2LTaAoX
         qN7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777910899; x=1778515699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        b=l+/Iwx6KXSIbo2zdrXuJpYOmT4v/emwmD6K41t5JCZt1j3lBOY+CpuD92VEu1WwYTw
         NgncSU588QsJ0H5xYqgv/P4I3wDk61+sQkHmeLixW8/XDkspCnRqDDjjDqGbigHH0/Sc
         y6tNwF+MHg4nqVCXK07KQT/N2EbJTudpXEOUqJCp/nlyZDu24j6P6jBzIhiijz3Ilh9X
         bR6EVR/618RJev/A+aoOrwlmYS3KJvi/AuWyk1gbzi5FZ582YUkcNYAOoHsirnOY+KeG
         bSias/mjm8Pb57jm9qmSif99OQVUfpNIcQHg/N4mk70SDqtJXikK1jyWSRiCV+5Q5IMt
         H9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777910899; x=1778515699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0nNZrt61r3aoHY7uvFYEzXGLx4Snsy5tjVPxAnA1s7U=;
        b=icStT5gRTXtSnKU5DCt7I4PlvnzFYvH5QOoSi/WKypSGZ8cta5KD2ukEqGT5gsNb9E
         xNVAV5hvroVQK8r3mMo56gS1rtzgMEr4Js2KtaQ7uAqpKHqIwrSOafqmCoZ2WUUI8Fv7
         lXzfFM2BdPGvMi3LK1dczG7phDpb3Sk1a8ExR/MARTpp/pe92eop9/3FVmQwrxugn7rU
         QZmnxpW0a70pF5ezFSA22p77+uMC+DFv8/F27gxSCr21XunZIPU+/cn4zGcCrsSerYlt
         rA4+vQEbpWbaxWnH9jT5pFgWGlFyD4R2tFeHJYgkwggVVciebKWMS0qJN/Rf1+YFdZDW
         Zp0g==
X-Forwarded-Encrypted: i=1; AFNElJ+QOLccJz9/FqJyIHI78QmaJjElqobhUkfQDdXkhPXvDa9PwEpm7F/Bo6ZC8+q/fVwLsVgzY/14fPg=@vger.kernel.org
X-Gm-Message-State: AOJu0YynHPdXhWySfWyxdqWqbvLS+443uPZPEyhnK3FS3yowZLCmAdP2
	GkZWO0k+Jn93yzIiaQ1KKb3Renv3GwZBOu/Ht88r2crCHkZqUsQZ8+N3MgaY4PxQDnZIBgkXsFw
	5rKwKKAJVpwa8VCvUbLDCAqLSYz+DIRI=
X-Gm-Gg: AeBDiesGCx50/W4m6YbfI9isJUPZ34fcM6lGE53B9rhjU3VaPoy4CaLvtcfsGW5kTYl
	yEac2j2f1cBAUf/EUzenhqVu/kor2dIvz8mi0EK2anvOkfcpVgsNtLsMRqbigRPtTQTLfPULiwl
	9wuqHyxpCZUNCTvSD4DBpkhdjvP+zBrti+MAu2TRlfCOP+xGCY3ZaosWL9QN2LrclJuWkxEB36W
	2tDKe9pCf5OpdgvU9RzfajAOeY2Lal8uPmZV4Udb3HQ6fbqNVk75Bt8fX3+7j26/Dg00OY8pIWB
	njOXLaN+i9VBUrqq5qrRBfbSVogeGu9VaoIZbztFCTbqFl+7S35io9m+H/b84Vtg8ZyenLb62KF
	b+6Kf/maPBdOxAPyP9XnptYD8XPBqgveElg==
X-Received: by 2002:a05:7300:cd8f:b0:2e6:b55a:76ca with SMTP id
 5a478bee46e88-2efb4d405e9mr2513742eec.0.1777910898694; Mon, 04 May 2026
 09:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org> <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
In-Reply-To: <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 4 May 2026 18:08:06 +0200
X-Gm-Features: AVHnY4Ipj2td3lDPcisK9Oy4r7A3v6-c04Xe-ovcQ91rWKS4uDVm6C_HRMmRODo
Message-ID: <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2026 at 5:51=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Currently, there is a "P" entry for Rust pin-point that is
> neither a valid ReST file nor an hyperlink. While the real

I guess you mean pin-init above, i.e. this entry:

    P: rust/pin-init/CONTRIBUTING.md

It would be nice to clarify it in the commit message that it refers to
a file (which is allowed for `P:` entries according to the docs).

And, yeah, ideally we could make it a hyperlink to the raw file.

Thanks!

Cheers,
Miguel
