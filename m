Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C982223BD08
	for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 11:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744803846; cv=none; b=BVwhO+q9lH9XXxycYlg/fMQGp7ZJFfXTlLuaBot2A7cc80neeh+u1bh7Hzlm1gKahTojSf4v6N0JoGL68vw5YnZRCHjwrOvN1SUOeT0D6M+BVOiwe3G3VqKCz6IoO6EkvtBtutMvcmRpUzz2vmQQoLQGpYIwXAAJtLk67m8xdds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744803846; c=relaxed/simple;
	bh=nzizKzo8Lxv6uOeq/gTFpe0rr/Kc7xMWsK4wkv91jbQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d5icdasaWZ0bXnaWc4pZ3deN5GTDVsvlVw/dMtGzHo73VVXRSMUAT0koEJH2g8OYM3MHbThY3JUH6Mn7jHfUB3NPbpZjsnzGKxtwLk7j6RJwQSlt2eixq7UbTTBTruSK+kA5s0B51PXbUqaM+GPi+GxFhlnROkThXnGrB/rlU30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2GbwSC+O; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2GbwSC+O"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43d22c304adso2797885e9.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 04:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744803842; x=1745408642; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=2GbwSC+O16ESoxOaJH6kp1bhKEsfD6AcpCa1MyAI7vc1b5/lsV1ZDd7/mg985q6oW4
         fJfMIu9wX3jCasVUicY769uo8whKZdJBvRrcWN1h8oCYL19/e1OWwfyFJp9ce7GsdXvg
         dRoeBOPa57uvhLTLpxAKWO4M/00vxFW+vvUtOWlE754ZuJHHm1vJH+FhWafHlVhszhcj
         iyTuBohWJ4bEiIONbAxMQt9YXTc9kCxXJMAe9tOLzCDIQ7ez2APOqdAfJETJcABEg9gH
         p8VrdXrXN3HAvy65cT7XB5J6G5QfUZQNdb+hTVjM7/cH3BaQ7hNG6gItO77plTQGsvye
         BcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744803842; x=1745408642;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IF1VZRpImns2dmxjUkl45LwCr5OCxkT/CnkwYELAXFU=;
        b=ZUoKYaiEjSnCrbfNjcV+XY2OeZr2cfkS3usqyyIhUD5jLJXLv/fgymM211/fAWotGc
         lRsFph5Ohed78vbKMjodipBjud9CObwjXk4ZRzzYQNPasjXIOZOpCreDoZ7aoDLH7ocp
         X0DR7YVLSkTx6mGM9qWSUdLZereCH8nFD0j7JD/1FSasxpgduFD8m0aq49r14gC1ekSB
         BGpOeRp83dKoUs5O8F5YR832dK1B3bq1luOkTMPZ1w3ajy/yHZsexmhrJw19J5cit5Ey
         0W69TNc8shHoPaqWQNtW6Zo0m+jC8vvtiTtDEMOxdpYp4fg+Afjwe2d4H822cdRKDGYt
         kHGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvB99lcXjHsiFbUQrIevOA8IUOAyg2Z2NFTf2PnLNYVCZ46k3HvbUYzg+usfKfl5ub3xHEAL+Xv6U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ8shLhclIYAG/N9pIH+wAPOhAhZB4htWJDTn4f/vfvHguBznm
	hwUIJc8HekzWM5xxTKiUxwY92uaWGpV+BHMC7SLs6B+8j1BRSiUVoFBnczkIJfyqG8SSVm47W/a
	nEOlUcBYMXD94Xg==
X-Google-Smtp-Source: AGHT+IGALYmOGR2cfumjQH5um+KLKgozzVHSRwGqMvv0DTT4qMGdsYU4qv0QGpbxElwdAz9dDJW4vlVIoSCEgsg=
X-Received: from wmcn28.prod.google.com ([2002:a05:600c:c0dc:b0:43c:fcfd:1ce5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5986:0:b0:39b:fa24:9523 with SMTP id ffacd0b85a97d-39ee5e9afedmr1224016f8f.7.1744803842192;
 Wed, 16 Apr 2025 04:44:02 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:44:00 +0000
In-Reply-To: <20250416112454.2503872-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416112454.2503872-1-ojeda@kernel.org>
Message-ID: <Z_-YAAzQVT8g4IY0@google.com>
Subject: Re: [PATCH] docs: rust: explain that `///` vs. `//` applies to
 private items too
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 16, 2025 at 01:24:54PM +0200, Miguel Ojeda wrote:
> Sometimes kernel developers use `//` for documenting private items,
> since those do not get rendered at the moment.
> 
> That is reasonable, but the intention behind `///` (and `//!`) vs. `//`
> is to convey the distinction between documentation and other kinds of
> comments, such as implementation details or TODOs.
> 
> It also increases consistency with the public items and thus e.g. allows
> to change visibility of an item with less changed involved.
> 
> It is not just useful for human readers, but also tooling. For instance,
> we may want to eventually generate documentation for private items
> (perhaps as a toggle in the HTML UI). On top of that, `rustdoc` lints
> as usual for those, too, so we may want to do it even if we do not use
> the result.
> 
> Thus document this explicitly.
> 
> Cc: Viresh Kumar <viresh.kumar@linaro.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n_C7exSOMe5yf-7jKKnhSCv+a9QcD=OE2B_Q2UFBL3Xg@mail.gmail.com/
> Link: https://github.com/Rust-for-Linux/linux/issues/1157
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
