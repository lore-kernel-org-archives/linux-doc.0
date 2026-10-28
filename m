Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793180883;
	b=N10dE7CL3AtTzlnzdpVjBlT15SaG7usrXiIEHPtga4mn9Ku06eWWzeiMcJNXMgxm/AfB
	 2HlLlqKf8D6/1owk0PpYV3g2hENTkbc2bY8WdrB5mXBx02pMPfVNRCN0oP3O3NC33+PGZ
	 jDC64g1EwkrNRgKACYiPAjR/vMEcYYITnL4iOesyJKrk3ub3BoHZpjrPLhkADfXnZMQlh
	 ZXygfDEERLaSX4CKBRtWOumsUrj9ofkxJqdbQ5bdC9ch95fCovczav9QPIrWdVmhNujZb
	 wBUzaHoVJ1wNxMe3JAkPaPbO1xbaXT3NL/H4i0xQyypCH+Qit/67ZvpZxn9q7sRvPLQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180883;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
	b=lKptyg+OdMs5cKuot9uQ2mqTFJKrbfJbsR8k3nDOnEoKJkEBn7q4DKCYIWHbp5z5XgwR
	 F1+q+MGXhKXJ6F2KQjq3gtjcPd6EITXCyOUtCgwZWICEOSYR3lWpGglcaAUfUXVXH0hdK
	 1Dj4ez96wCVaZlHx3RXVF0MSO4GZ2l70Z0w3CUQV8uyGDPfRGvvHOF4JXoO7aGpvuJ7te
	 GnkJpmMPchlI6TaYlhRSvB50U39w+R2ha8TQDG02Sk8t7nwkGZdh113+P4V09GhOeRmk8
	 98wnmrKZKxZGTnStrDyr/bw6tONONPxIsrZeQjrFOfSTGV6An+8xOCyBLE/UUGsJOFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FF606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C72FF606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zJw6mAzl
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1f31c63ebso3102727a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:48:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793180881; cv=none;
        d=google.com; s=arc-20260327;
        b=kStv9yW+pNFZURAw/Mvs7Wn5erXcnXflUlMbLDYx1gKvnhPlxHmgkBhtNWOBN7RUSW
         etqeUMpP81g617ovDE98Q9afxh4LlzKfNqbmCduZiMLInJjJeBayBOT+rIjJNqmB4Ynq
         mS+KspAzJsLjxQirJzyFo/UUtwObrX/cLn5dlRWhCvpUtX0r/o59ykvXSZiSykm+W+cu
         RTixt3oJJYuVF051gexIEFYtSPlWWQTXBkDHhUWEhfp2bzza4leyKSjYsRYmkzfDvg7U
         rvLRApoYded1tTdkLBdXNy2V1Wog23970QrYh4MvSNRPiZJWkL9jFCD+VvVG+0T9bYoK
         iVsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        fh=dAg+DHWGOqD/+FmWyYqJexguKhHdcfFDWxF51WdWSJY=;
        b=ix3jfycLahimN661U98eysJFfzmW4jnr6bULvXNpWG9Ohu+qGMuYoDNUryzCwuBOB5
         meDYzmHW6z59kWBGu/SxVUY04MOuefLja1khfsxhQIhWTeOWRDldExIQ3ypyqx5zcnFs
         o4cLSq8mFeLmSo0QMdSfh2toWXGeffB19/zPxllhctCA4ptoynbAaISuXJXPF3H0ocCo
         0vKV8v68foa9PjFnc42TD22p/qf027aKs1E7Qk3ZmHwhqGaEB0hSCUIezNx1PJxsy/8+
         6xfnfKwUs7Fbi550Hii9FAGZ271ho2rRoLai2PFLjF6JH+jCKz2H9G9NQCcS/BhvcYfM
         mT7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793180881; x=1793785681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=zJw6mAzldYFqYZzdqrK5sVCjCWQPQmTep1dLeDCOodLgldWlrkclOGlwaZnjuK1Oum
         TPJIIs//JWN7qNyOHlCsUAdJNutM2b52i0HJOialjxTrWs4keZvZmw3BRcoJU4Awqzjr
         WT7ZIhJrd4c9JQzrTY2yU8wr3bsllD1F4CAiDQBfntXs5r47SzlK8X0ezxzisTf0fyLH
         V2m79FTBz5/Q8KkYGms7kGw/9UPrH+YveHnhAh0ujkqjlAJ55dCcMHh8t8hYyve2EZ4W
         CPhdOdeH9FP4wI1+y2tqcuYKKYhDPN/HKsHrz7f0EKP2g/ydwoE9hgBJKjkE88fNdPU0
         JRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180881; x=1793785681;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gl/4Yc6JnTMakWEbHOettwInvSk+aSwCfPGu2bGV6uw=;
        b=SDvG7PMIB5cvJhAU/u4GxiG7zd77hmlqdGdnvnuIm+j1OEtdd+UPJj6wgIKLXWTL8I
         Ltj8KKD+QLVdDfVuYD0pLn2CLHr2g94qobzU83Zh9AUv+XhROCDZkLuPnRWRg8hLYpxq
         yfzyRE/8Xj60L5XgRRJaRfjGupNnq4cjzQxdbX3SLfN1x03uhB3NviLDoiGkxJMjIPcA
         pnBFVqy9oqIgoCIQfZ2rl4cdaBHz1r74Ngzrzb16LfgkeyNP9BFBlKoEdV4MiJaDvmBm
         G0OHXv5EacqpbWEw9a+gmn+gF98Pds6riC5ywL3x6OEXLBBnAn6q5lvkt/2KUgbs0QWB
         wIyw==
X-Forwarded-Encrypted: i=1; AKwUvBzAYCLS9yji7xtfcfsFRIxeCkW4GTVH0h0GXa5c+uM0ur+OVGZPaW8aiJSUMjAAwA0sL7h5pnPlc+M=@vger.kernel.org
X-Gm-Message-State: AFq9FYLx6UDlsc3i0rIn5ArdE2uXxPZBDYMD4k/dQ9RQPHoV0tlcl5Tj
	qyllBboDwpxT2sHI9uOxIVa6oE9knO5qzyoysisIS5sDQA6ul4tkYxosjkMh8iDaWqgAJCqsB9f
	DjGdL9/ODHnPC4TxIlmu0LDvyIE0IUoM=
X-Gm-Gg: AYBFou0sjBem5/5KC1GpLC3f8iDaU/bc1/4YCnFPW0zQNeD7UjtxNeeRXQyNZlqkxaH
	KYsEsB7WCQF5QL2KU38sEQuMvksol7T2RFDvpg6FDGpUFo2wcHDGbfj7HsEpEIlLeVz8D/yJ4jm
	5fWWofpuLOcBlSPG/cmphO19t6M2qbUqMAdSyYOVffKv50qVPlRKa6+iK3B+83ocHJDSatD/BL0
	HqBQE+rx+aDSiMVRowrTaovYMYlzAj0gOTnbcDHWVOjcxFXtY8T1POlKP6me6q163frGd3Gqv/a
	NeCMO8M2//nmKOFj1U6dOVMBxUabsl9w7KHr1DzNu7NhaWKpFOLuRIFFs33RRmt7m2Q7V9dASw7
	l6s0yMD0QMfD0/Gia/7IejESCM4l1jRaQAT/tGNiLPRzsg5fuPaczbImO3gWy13lso/VdseDEMS
	oknC0hZfdIywzy2UKzcp/M8Pz/l4FCx64ugqwKKZPS2DlYOYutRLtW1x0Xbgu6HsW/2vDHiI5zv
	LaqF+zTumRSn+Ling2wx9SBZg==
X-Received: by 2002:a17:907:86a5:b0:c25:f7db:4bec with SMTP id
 a640c23a62f3a-c49c6357d34mr69949566b.18.1793180881026; Wed, 28 Oct 2026
 02:48:01 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
In-Reply-To: <580fdfbe2eb6694438cbd8f5337bd2f1edac564b.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:47:24 +0200
X-Gm-Features: AclHuK-8N84O0Y9k-BLOPVpeywTja7886uZe3ugxN4eM-96m__IvC7bzZgS0MkU
Message-ID: <CAHp75Vedr5J1WJMrAkBjRSLKA_zf1kt3GD6UhjzLcy9vowxnaA@mail.gmail.com>
Subject: Re: [PATCH 03/10] lib/list_sort: Switch to __nonnull_args() macro
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
>
> Add spaces after the commas in the __nonnull_args() argument list to
> follow the usual coding style (according to checkpatch).

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
