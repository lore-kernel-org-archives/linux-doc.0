Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793181021;
	b=yJ6X2z/GAc4U5sRXJKtvnj4n+YCSPNDmPGzXQeuzCxcuuly/h/LegXjjMnJv8EpoUdO4
	 FBkgodI+k0QAYiUfyNOAwiFf25ccNyi71+Sj6eSoF7SD6ao8HdIyn+pPFrkdpANfDWBwO
	 q63JegKlrXckFsuFG1OXo/yICt4u3cYbfSUM3Za3WaA1xGscxhq/K+pZwxssxjLQI5M/p
	 QIBZeR3Lpvj9SP9L8hiqDrUBRi+ckBuiD7B4gp4Vg23i8asAA/hKbJ3RiDZdNHvV6Fo7g
	 VUwAUGom+tPBT1yFsm7WmvtrA4ynZc+VnKI0871roWqlalIs2Wzkm3MDgorKT78Vueg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793181021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
	b=DJz6mOLIYeh1D0OpeKUcmoiBha2sZrsZYOLr/Kz86WSYZe8YOtMa0jYIou3InYZWt3Yr
	 jlGBochj7p/r1W8KBJiBc8NlOHJPojzirVgiV6yNVffSviC00vYKPfvcSQ/kdn09lyQr2
	 hEN6byKGlEI10PtoxQIfCqhXs8ouN2WePv7U5n+9gpi7H9ACKrKhSOZaty1batHU5kOEc
	 M6/KFnIufbVX3PjWcLrWqVb6ivge31ErttYA7rr/FSGVbz9MlJ6hWas8BOIQ+TDnfSe+0
	 tLWE0F3xDv2s3YwUmwZDvIZro1sFscQbR0cBb8hLxp9B0kDjq103OXToqtU5nFUWYPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE693606A334
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 09:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE693606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Po+tkBhH
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c169ae1cb26so286993066b.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 02:50:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793181019; cv=none;
        d=google.com; s=arc-20260327;
        b=NLvA7tf24I5AQaXLhThujD37kAuxzEgo0Iw43J+VYD8X8gM1xHrUsgire2QRKFTJqT
         iWsLVyPDZNqLjyv0ksbC0lzZmUAirae+y7J0rqRid7UoTLntum9bjUe943Bt/ZLhtbYZ
         2wjXgzpSAcgFCXPJnKh/q2VmXf6/f+IMcEZY7IbOcudyz+9ro0GXLNXxkh5oHQnV1adI
         xi/3LdV4dIBH7EJVpvebkeXYjCKktPs2PHAsjDDEEpJQ3giuwXB5PyDkR/jUmi+onMWN
         7bhbjwKTDk/bTydZDp46u8WNqxaYFHQ1V5E/ImYi16H7xTe8U+NDmgQbP078/FkvvW8p
         wgYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        fh=PNhfl+vSKDnFVIJCVqjcrpBTAMKIh+jAtxZoP4h88Xw=;
        b=iiVvEMn5Sdopy5VqAIzQ4sHhk6hTSKzAxfJKM/n20LcPPuwxmobB+sdbFH02SAL6Zb
         7JtaByWceptNVdfs+guopuEha6P6ZwE/DOpm566RoQaSKBbuL611WRlFC0B6vfFdAJ4m
         aCnIwLieHAu3GmNZiy5mOsAKQUMDWy/sv6aXNOb7p4miXUGkiHpNxifnpl7azZ/UbPKt
         3gcQBOf/OCVI4HIZuy6OP9gvSNJ2289JBLFjbvSPOu0pgftJp+bZfQ22Gqsh8kyWckj9
         UwvMa6vzbHgpqYEXOnVof20MmQTuDihveKhHoNPq+cVp6BH/ojHSsFJmfyrxenTvd/6s
         e7yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793181019; x=1793785819; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=Po+tkBhHSAxqEHwLFlZ/dUO+MJX4kBmJcMJ72/CBTwKDm72BzNBiMEteALPgfbyNoP
         EzBjYCRyohCnJfUhTv7oF1MACYHopGGCSjOQ6AazrqyebZD9uRI6Ayr5dej4TDUM4dlt
         SXymOqJpD4azna2aSzuZrbEp4Lwg6lVAvMmnKhE8Jgl/LQsXxfn1L3AWnI0S+lFXopYE
         GOgNNvE45nthasHpbdgbf74OgLbSrrfaJWK7r2jXh+PEfaeIx1GrmaA8Q6XsabUHVALV
         5xyPXXcFo+JPCjrfzKLTnwjN4I5ZzTw08NB2P3kl8K8jQ2pAiA05GHlZledigQ/6uRPm
         L8TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793181019; x=1793785819;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OncitmhmKPxQRhu8FlY/GIP5U4Gt08ht3PeyL8T2LDg=;
        b=rhZwInOyZgbz2/VIc4QydVYxiAYtKGNljQQMtVaQZMImF4uOQU+cWBUBIrSirhL2Wh
         iah7tLvPp82SH6jN+7c/jvjU/FbME6nA+vtxtwG30UT7oY8TlnxzcBnh2k9+4t2+4/Kf
         OXX5ZQUiEea/bF22R/2TIkiqUdoORV5k1Olyu1ha63jTXvpySMvv/PqY1ydGlcxW0eyi
         61QydXRsNOp939zwXEda59HZBCWmKQ+qtjrImKZvK9zlEWJECHc5bj4eceKHWSiniT9d
         zSnt75zUiqpoBeTS08jJ3fwL7naW9GrEn2lCzuqeWLRwkta5d0QLglmYgg5F7kc8ZJlE
         dgBQ==
X-Forwarded-Encrypted: i=1; AKwUvBzu1EvxbFF3En9dV1AWt7AO064KuP2nBi4nHqhzq3Wh1T8SHOT/VwztimkZUi7HUh7VUs3NLDe2OUg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJAQgtWXWw8/RD2GXqcPVDdcomtzyDaVrFHSFso6TuO1u9sraUa
	16rVrj0YQRJFvs1Ty77EUxNsRsbT7alvVd+mTK7T099Tg9eYyJdKvll7IRpwkJoOcrzoNEr5dtn
	3CsUUOMuQG/WZIDK/umDDZ5yyz7tlcdI=
X-Gm-Gg: AYBFou1d5mHNTY23QX2KAI/pjxFSNtwhiK5rFszavD44/ImY1X1nRo+95fKlHaL/NEK
	s/2u3Aw3P1tCOiuOepSPuWIZAaJFHkrYclo+WYTBjh8g5V4OyEs3AUg06DgAblAWvd3LQ+ze6hw
	qpbtLPcIrvAY79+TFO37Q6j26kYi6Cw1o7OQqulECewPBy+9ADXzdWOF06Hz5afANUG8CqAyXPo
	HOiXtBYa1Sn/uBM3s4yws4s0YKKu2D4ts9dYbrJL9ue/VIjHYV8RhGQWm6SSUdKFOxQmOZxDs2W
	oshE1wo4R3+4Dy/0FjmxmZr4rhdmvfAmMsTww+65fi0mKoBBH6n51rQxaI7SaacmOUiAju+SanD
	oCIvQeFiKCsJ+4cRSJzIp0bmznSux2CSEjOLm1hEZhbNv/ap7CdKOveyIGqHoJl4QmstWuxz8k0
	+dZhxuNhdnqloz1Rwjm/fax+yAuW6TYccuPEHXuyqu0vvoOKQsn4WSFrraECJ2PVNdC5BcJGKaU
	a5J3tNy2WWPi+uChe1JxsDPdVq1phNW+kdRUYXIJmR8XsQ=
X-Received: by 2002:a17:907:86a9:b0:c48:a838:c17e with SMTP id
 a640c23a62f3a-c49a739f8dfmr484567766b.14.1793181019107; Wed, 28 Oct 2026
 02:50:19 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1793027261.git.d@ilvokhin.com> <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
In-Reply-To: <33ec8080594f9f4ef1d50e36497339c9a6897393.1793027261.git.d@ilvokhin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 28 Oct 2026 11:49:43 +0200
X-Gm-Features: AclHuK92we6zl1A1tCfKfYVeuXltUG4Bsfa-fRzr4orRkDVhJuYkTUAxt0MOtcM
Message-ID: <CAHp75VfR2i_PPZwSG2UPaxShU5L=FsSdEAT+0iUMDKAfugbRsQ@mail.gmail.com>
Subject: Re: [PATCH 05/10] drm/i915: switch to __nonnull_args() macro
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
> Replace __attribute__((nonnull)) with __nonnull_args() to standardize
> nonnull attribute usage across the tree and keep the attribute's quirks
> in one place rather than open-coded at every call site.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko
