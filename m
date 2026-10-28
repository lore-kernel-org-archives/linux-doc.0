Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180935;
	b=vmrLnrIQwJ3tJAiki+q/Lt6XKt/epy3DtPkD6LEquzuatJ7DTwR0zaY9UabrQta0+Ytf
	 Vn2PlxM8evqvTUwX+Lx6s8LzD8vnKwwh7FN+o1vbcAf1gWe4LykcZIZyBEZ+7OMQFBIcS
	 WFXusvdpQz6OcKvU4kIsWt19mLIMawCDn01L7ZD38GknepSVPuTBe2JFYu67bVgumUVSW
	 nO98rUKML7DpxX5makXRocxZy1IeA8OKWt0T/whxQ1nygyz7AeQaM8kb2Ez6c6O9UKFxq
	 Vg4Iaj0yOt/VweoQ9nKASM778Ubi21DsDCeCFG6I/eZDf6SHP8cVj7qdRe56NDoDekg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180935;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
	b=vzmZAa6+EAHlHIUR+Y9s2eV/0FOg5AmBtnV7zb/y6AmznU8gzpS+OXxijNidLZwQI7x1
	 qsyqctifhoq7/niK7qgli2zSK8ELx7b0VK6FkEb4w/BfxsLvvLBwkJRYSO+jOwCiUC+I9
	 /X+liqrzx7vpoUoysQEbpNNS/X+T46X84jkLwBxGUvDkXJdz32czLBp0EfItyBTrI4KE0
	 77zNhtIKo7czczVB9eaKg35q7Vc1vFoEAI+B4lB2mP0wEdq5GpmKt+hiaMUwQp6wPGRiY
	 0jGcbIKVKcyGPAYTc4q9EkC4audPYkz/TL5QSpV/y9/J25suM1GnlGj78+RgTzRSlJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C81E1606A32A
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:48:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C81E1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vui6KWrO
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b21cf1a580so1066284a12.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:48:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180933; cv=none;
        d=google.com; s=arc-20260327;
        b=DjFLLT5BpZWgrw3UAAZBAKaPxmsHFaTt/JrKBlAJPykpl3MMsB8AatpPYt82YwtFKQ
         rSFqHHYvi8Cpakda0/tbYPkdxEU1eNJVom5JyL79NqAh+sSkVdEgKElG6zB2tdCWwnmR
         RLNPagyMX9Lh8p94lXtBa2PGeh79+n+jlbgrJjP2AmOEP4ZSTOJpSkADOX7s/BW5qjh4
         NY0yif+ANwd0yxqzx6CiaTn5XlqPYBTBUWp+oYB9ttquspBNriw5yWyPgbBBbLY5GVyh
         oOqyqNJwu8gPsOTQ0RX5KWodvQC1snrzEuQ17vF9YKrExr01MfK7vJdAQWM5LLzaoL79
         hpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        fh=h556EhBlCpOlJ30TLZUVIx5xwKyvLozSBblPPYh7nMQ=;
        b=GQikhvaB0VxdoGDT4mCPWDZ24gQf9DPzwR61WA/hEWS7z8b8/rskPEwsSy9FTdx6F7
         adLWOqQIj7+4Jy7RQ6qdM1cW2aNMt+1ciT5wxs0U6Xe2TAO9kj1QNtFAdyQqzzFD2uvh
         XMZcX3fiGbNqAKfz7YMx5MTvZXvQdwIWVv0sYQKv8dKGvv7iZZ4PuL6JPvBXNzXa02iG
         pdjqQPgyTuf+H3c5kP4K+kgC+Cdh9rbMxgKV5Xoab4xhpwBXkyObYL0BJw3Rw/UhLA4P
         vwV6xJi1Ia3C1wEJwKsknB9FsOG7eSV8yPdXAc4Rr3e8ADYkIt04z+uGzhW+1/rx0DLl
         IY/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180933; x=1793785733; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=Vui6KWrO4M0VRNK72Uu/n41uCoswnoTt+s/4QwFSHl7/x7Wwr/LrY3N3cJToCeeoXM
         gjMWLp2yO7pfatfowW3ZvCHPPtkx/53S/09OAgySOYQqlj1GHNRXmPOsjzGdOwkPRw08
         1/E93mARaaQYA60m0E0r3++wEApoTDg4hisWLVZFMzjrGhx6r5bLTJP/d/9noXhRolUh
         YG+kLrJQW9QXS0gd34x62/dM+7wa+NmCevHYC/qS7YEKyxS+fAE1T4fKnUnN/erff9tG
         OvbCtkvj0vDFGT0GdrFXaN8Mc+wQG9Gu3QDE89h3/4MLK25Lx6K4CEO1axqBDwDqaSmX
         AW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180933; x=1793785733;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcY0Gi4dcvyxZkHDA78yGLoz9GDb1HPFjbtFx6GpqEs=;
        b=O9C6ZnUdhwLxBlhIvtMyzX4LcBVKBTH9jcokt8fFxVY/Vs4BiAEPXQUedcGu6Am+X+
         VeKxGHSAroBvnvinF778KI8MGLYVhLAWvBmmuwz4q1fLCNoXxzY4bSdIJAOk73pUEGWJ
         IRZGg8ah94F3sJwukorMjYApsNOCrj4wYrPw2mtlYq7BqZAR3LGzI6DOnSxHUIElcj34
         dsNnJNLuWaEo/v7Vei6lOY9bQHPFoULR8oirA7gNOVNUk6rTWSWJbyKjFaly1hrqvG16
         j2QPEL8NJcBC/HDq6OFvbf9YNfU1A+EtU7LGG/s1deOGtXR5hHeEYGLAJlnSDcGLa+Xk
         n/EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYQPLDdfT3RHNPevbWg1ZcFF4coCXCHF61vzmDYCtLp2yvp+ifgF2ln6RNhYJz5Yn7vP99pbSfgp0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFeph1oB2LlhM9I5NiZ3tQVeF+Gqn8M9DU2hpho2QwKsaIm3Ik
	Rcm66u4crMNu9u6u5XIervthAFCiu7ltFUE/kd8r1kjPonbrKdR2tin9etxkcDWUJ9q2JjhNsVA
	9Wq0IGlLvYX8xCMuX0BMppBYbmWtgr50=
X-Gm-Gg: AYBFou2XSctg86lL0uFy6FrnkvZGm0Ib32gbwlaQiUplRvNh/xNn9Oxh275XkXdBRrd
	k7Cu5V//91EPTMo8qNw3itUG5yrCszqRoNlFbnnlfA7gDYBuVRohMZtjDSFIXH8E742+l33lJTN
	cKw6bBcKgZhbKU24cimr37zG2gmbELValQn54sDY7bLr5csKMIbnDF+1Hw97/HLp3DkEaIEeDG8
	Tavrb6Zk0L1/AW/E4Rnd7CgpuBfuXMedxCkc5WADY5nPzvYiDl0EJnLSzOGZOO/SUuLmAcApJ2R
	bxmmFaNlpdQvkmQ/tmzBjDwwoUYPfEKHRokguuJg6SgXoTf5VKLzxD/sTUa28HiPIYpPtX1GjRk
	KqHnTFMRVS51Z1lXqTp2swB75EVGsR4+IEBGS22gV91emRFy4eIDwbUNSU4vQE1rviN91sae00R
	gZCwVUZMTiKGYhCweXew4VTI0x/XT7pTu49Mdv/iXjnNxGRf7Dme6Y2diGzsNJr5nyXRyK7nzYB
	DOEqYfuiUe4wHZEm6dyQHDURg==
X-Received: by 2002:a17:907:a893:b0:c46:8b51:c17c with SMTP id
 a640c23a62f3a-c49bdf394e6mr156034066b.17.1793180933042; Wed, 28 Oct 2026
 02:48:53 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
In-Reply-To: <f0d7b2f0dce916f4cde3dd466a5b51a4b88fbdd8.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:48:16 +0200
X-Gm-Features: AclHuK9bqVSr5ebQZT2ja4gGk1wmv0GUJ0T7y7aJfJNVsg1OI_1bv2lVUKDS3Hk
Message-ID: <CAHp75VfJ-L5ELAttN+Fz_Co2E1KHumwLZAEMXFMhRubzgVLqug@mail.gmail.com>
Subject: Re: [PATCH 02/10] string: Switch to __nonnull_args() macro
To: Dmitry Ilvokhin <d@ilvokhin.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-hardening@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:20=E2=80=AFAM Dmitry Ilvokhin <d@ilvokhin.com> w=
rote:
>
> Commit 22302af28d3f ("cleanup: Annotate guard constructors with
> nonnull") added the macro __nonnull_args() to wrap raw compiler
> attribute.
>
> Replace __attribute__((nonnull)) with __nonnull_args() to
> standardize nonnull attribute usage across the tree and keep the
> attribute's quirks in one place rather than open-coded at every call
> site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
