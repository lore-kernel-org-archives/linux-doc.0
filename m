Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8F928CF5F
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 16:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759939303; cv=none; b=czrjh9FV7jxblKEI1mMOo6/zULbJ1QX8NRqiAF16Ua3S+FoNVwMSL12IRIDs9XTizRmPQH254O9HZRXOk3eqnqii6SEr12j0R2d2FGvIcqz/y+gl7Bo7tHmyBjdz1T+AWvxLgHF+qR2EOvoiexQ50MN/X4hOMMeZndR67NfLPAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759939303; c=relaxed/simple;
	bh=xYh4PhxzbTcEyrXy1Mkkh6Pa1QxZgkilHtvq3B/2VFU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WqCH9GJVJigSxEbWMj+/NPGU5tUMEWRU+Pz5AKKi1KASOVzC2UgEmArI0QfKA2pL33CEjoNQxXqxeTla+Eg9kFBZ9DBNonNGNlvw9PdgG/v6AtdhmidXiddjN01swt8qmCKCGY3dTt3D12CSc6LgQt8mRw0fFaOjpwxrPSVrtaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yv++MPdZ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yv++MPdZ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e38957979so29355885e9.3
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 09:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759939300; x=1760544100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYh4PhxzbTcEyrXy1Mkkh6Pa1QxZgkilHtvq3B/2VFU=;
        b=yv++MPdZcHITuQbQ6i0mJIg0YXkTl7I6bqCnmxOHzTdymZZITsES8fHTmDtyd52tYP
         xco8aitOPootqW6tS2kruev9vwe0mXor9t3OJ7B8C6iUGipO6Hy9muJThnkc2mXj6lOc
         8inqIoN9iQJuXl2UAP49xjd8YGDFpsySnRPPJChvKqtxxMRSoap9oo+CeJpxRmz6j/eX
         5gzAmuuSR50NBuV1DwFuIZWuNGmUkprHFohYeCBruo8FP+wLmnn9Ls7MkRzNuJuNnM9Z
         3i9iwSzKU9F2gLzAHHFgd0BCrFu6JsJNh8QYJsALBtvvntjTHRAsdiuY8HabXhfr0vtb
         BXMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759939300; x=1760544100;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xYh4PhxzbTcEyrXy1Mkkh6Pa1QxZgkilHtvq3B/2VFU=;
        b=K3RWluuLFrm60+pSScbkzCagO1S1R+tdR4QxeA6LRRokPpMnXwW8+hi5mXPiNb1nzH
         T4E5vEn3uwzF4i/ylaoXfUm4a6eSjwxloq7pcDwUbbQNP5Am6p+ZwYQxEJ+Q4j5IbBTI
         9kCZs4pjX3xU+xKT6ILbJpJRbaTh8yY/vMvWX02IZYObND/e84xGFuPkaHytfJM4uLvo
         pWFonAHRxMRujwbWQe2O1PDD67G/BXbjWRn+mddNblaD8A8lvnGwsIyvl7Tdn4gEpZkI
         VDMnLXFbXyrTdESyjINJCSzY7KrjQT+oWdMM2qT8g0jvP2KknoqsLS8UFhKmJHPsZ1rr
         Qweg==
X-Forwarded-Encrypted: i=1; AJvYcCWfyrVqj/9JqwD6Bj9fV1mK5rzHVrqfVo9F3BQyykHITb8Z6lsbVe8jvl9HwokzXXW2HkwntIdp+00=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5dxXgGRYHkOqxYiCIrowuK+yNsIr3DKpZibXI6vdzWL2+zYO5
	8tX4zfLlX/IKi95Zhl8TYFwUwAvW1Pf6owB69liXJRw9Z2zTiMjevVmpoiVW1+JL8oQb+im62VC
	1o8hW4qCDPmHxAEM1jw==
X-Google-Smtp-Source: AGHT+IG0br1+bgUuaMaUnq0S2Elir4XOEyWa+b5sYyNn+cxnkAq5WDjWumGgOW6VKTnYScj4dr68tdDpcOI/pds=
X-Received: from wmmi15.prod.google.com ([2002:a05:600c:400f:b0:46e:1f26:9212])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8593:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-46fab89b7a0mr10906725e9.22.1759939300423;
 Wed, 08 Oct 2025 09:01:40 -0700 (PDT)
Date: Wed, 8 Oct 2025 16:01:39 +0000
In-Reply-To: <20251008162201.79e76046@nimda.home>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev> <20251006163024.18473-2-work@onurozkan.dev>
 <DDBHMNEIU9HJ.68MGF28IF58I@kernel.org> <aOTyVzpJNDOaxxs6@google.com>
 <DDCV43KW9OGL.27I8HP4TSTQ6N@kernel.org> <aOZgrhsNrKpxM_PW@google.com> <20251008162201.79e76046@nimda.home>
Message-ID: <aOaK44WhBTZcnUfU@google.com>
Subject: Re: [PATCH 1/3] rust: xarray: abstract `xa_alloc`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: Benno Lossin <lossin@kernel.org>, rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 08, 2025 at 04:22:01PM +0300, Onur =C3=96zkan wrote:
> On Wed, 8 Oct 2025 13:01:34 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
>=20
> > On Wed, Oct 08, 2025 at 12:18:24PM +0200, Benno Lossin wrote:
> > > On Tue Oct 7, 2025 at 12:58 PM CEST, Alice Ryhl wrote:
> > > The documentation says "allocated id", so I assumed that it was some
> > > internal, implementation-dependent thing, not an index. In that
> > > case we should change the docs instead.
> >=20
> > An xarray is a map from integer to pointer. The allocated id the key
> > in this map. The alloc method picks the smallest unused key in a given
> > range.
> >=20
> > Alice
>=20
> Perhaps we should document it as "allocated key" or "allocated id (key)"
> ?

I think 'allocated key' makes sense.

Alice
