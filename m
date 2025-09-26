Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A0626D4EA
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 05:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758866134; cv=none; b=rXMKm8qNpy3rMQCzv0JLibOQpQiv860V+d3w/vwymfxiPpSUwUJA2y/PvdtScspW656gfsqos2lf0vqmJ1pVckggaEzxQLtQHFF50GzdTCi4p3da4G7rvx4Lxv7VkV9l+zNPw8rVTUAxwKTLqezEVqcI0g3iqdk0gXWE02PfirM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758866134; c=relaxed/simple;
	bh=/wA2r4CmUl/rFwImkk6HbLdkQUDtQ5ZFtBbrhQSUMDs=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FJ33LwhDkR55vUDKXUSx1bNexxEheVn3pL7zTWuAr92OZkyN7ZIslcDd/gi7yeXRlfrAKdNPdy3nR7eQjPIekHW2ZLuzwppANYBhTWabC+eqPhyT3ZiS/LljfvNXCzl5XP1Xl+X2U89cc21vLj0/5ZPJSBnI4VzJuOnLAHITmnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=NP8h0Uyz; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="NP8h0Uyz"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-afcb78ead12so303387666b.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 22:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758866129; x=1759470929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/wA2r4CmUl/rFwImkk6HbLdkQUDtQ5ZFtBbrhQSUMDs=;
        b=NP8h0Uyzx5lYnUrvzOrnWHKXuzQkqvCmarJkSnQoTxLz6QoHxQhK1IYTKlmQbxtsxs
         DrtGD1ctyC/WkoXKlKHg4IH2iKdV5B9XgXyPwSaNKKjqju/yaD9CyVVbKE5rmp2Rs+2b
         7kTEypgw0/+Kea0iJAz/HvZj40lnqf+GRS27VvFrLFD8uEaH4459cHxLSWRh4wxUuKLz
         FlyjDa1885FzjMhEgM8Zr9KqCXeYrwHm5Fwz1DAukHFiFWkmPh6l/hleRxjQU9gF9iPg
         KfjlCd++Jml20KekNuoBCGXs7YXmKiX7JgxOHfHslaRzkLcflyDORkn13ezIFU+KkbYN
         T+5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758866129; x=1759470929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/wA2r4CmUl/rFwImkk6HbLdkQUDtQ5ZFtBbrhQSUMDs=;
        b=G70yL6i11qeXlCqvHsB9BZitbrPwZ3Fs+Mf+jiK3smB5Ej8ucXmUKYgcG9x30QF2vO
         +6CAVDX/qadfcGN0ZNcd6UUMjoSIsPY6dWX5Dts9J5d8Uix3ssQH0sGaTY7L16G3CZSP
         G0vrN3DSIrDXND6WsR1v1qU5QZy/6vWF5JKBqsgLzCWRdsjeT15vUwxwxSeN6/3KuWmg
         N70S1+7cWigO93eHUDuSfnbWDHABoCurx8CC8fQUBa/WqRXfRIvBQHpukZujFMW/cMcZ
         Wn/V/v7WZPVIFKR0UlQ5JBqG2ZDL8qsvLr/QagZ3VHzkGxMRibBeSxRbiMwvpuD195oV
         qNPw==
X-Forwarded-Encrypted: i=1; AJvYcCViQkrY/IwTlTDuEu4iix85VclXietT9Bu2oTelM/E9Np2Vw+rrIGoz/2sLbiIFEx1xGJYa2TTBA30=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMqJjm4rPE12GsGCyDHGds9zym0YeBSNC6qYgsKxazHRsWtkX
	YkLkrjawW/9SOtzy7qvoUSty/5Y1Fgb6lISmser18bfpBfWZQ+i2tr/WkEOD1LDKBQA=
X-Gm-Gg: ASbGnct2h+5f9cQ0QTiG9FgniDrESre7M0QyJ2rVfFgz0tSa+NuBmeZqfISjo9cJPpr
	TuJj13heZ0CwicnKJZaW4S4ikuFHDE81v8lTt4toAY2iyhYYrb84LRuJNVOoDPNaVnENpMcVcbY
	v9qLUZ5aH553gH+7CP2UmdVjxqOquBCXscQM+Bqq17H6ArCx2adV+/B8RyX7486QMaxP+jGe8BU
	5iNOh6HQ1w2ZDeA2CmeQg+p8xMOCeRnl8E0WXa+91hR2UP/a+21OAVF8rjs+NWzgO9edNeL4hYD
	+XxFUgA5mZi9QbgMrNBmSAj/6blVqKCJqqnTWb5Zis47OkSXPGC2djKZhkq6ML6YxQzy4FnytQa
	Yf6tjPUl1qarzHGnkj5V5uTquu6Z0rvc=
X-Google-Smtp-Source: AGHT+IHJwAfYlHTzwCkck3tps+kV3hQ3V6HtcsJ1+abQ2GeYYPkJ2z0LMndqBZ2ps8+rtwhtc3EqkQ==
X-Received: by 2002:a17:906:f599:b0:b21:cb6c:76c5 with SMTP id a640c23a62f3a-b34b909e8c9mr671524966b.27.1758866129486;
        Thu, 25 Sep 2025 22:55:29 -0700 (PDT)
Received: from [192.168.0.102] ([47.63.113.151])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-634a3ae3227sm2353194a12.28.2025.09.25.22.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 22:55:29 -0700 (PDT)
Message-ID: <0a8ced1ad245b337181a7a29476beec3f1183987.camel@suse.com>
Subject: Re: [PATCH] docs: extensions: don't use deprecated ErrorString,
 SafeString
From: daniel.garcia@suse.com
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Date: Fri, 26 Sep 2025 07:55:27 +0200
In-Reply-To: <874isq4hmj.fsf@trenco.lwn.net>
References: <20250925094508.43174-1-daniel.garcia@suse.com>
	 <874isq4hmj.fsf@trenco.lwn.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On jue, 2025-09-25 at 10:33 -0600, Jonathan Corbet wrote:
> Daniel Garcia Moreno <daniel.garcia@suse.com> writes:
>=20
> > This patch replaces the usage of deprecated docutils ErrorString and
> > SafeString.
> >=20
> > docutils.utils.error_reporting module was removed in the lastest
> > release
> > 0.22. In the previous release the usage of ErrorString and SafeString
> > was deprecated and the recomendation is to replace the usage with:
> >=20
> > =C2=A0=C2=A0 Replacements:
> > =C2=A0=C2=A0=C2=A0=C2=A0 | SafeString=C2=A0 -> str
> > =C2=A0=C2=A0=C2=A0=C2=A0 | ErrorString -> docutils.io.error_string()
> > =C2=A0=C2=A0=C2=A0=C2=A0 | ErrorOutput -> docutils.io.ErrorOutput
> >=20
> > https://sourceforge.net/p/docutils/code/HEAD/tree/tags/docutils-0.21.2/=
docutils/utils/error_reporting.py
> >=20
> > Signed-off-by: Daniel Garcia Moreno <daniel.garcia@suse.com>
> > ---
> > =C2=A0Documentation/sphinx/kernel_feat.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 1 -
> > =C2=A0Documentation/sphinx/kernel_include.py=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 8 ++++----
> > =C2=A0Documentation/sphinx/maintainers_include.py | 4 ++--
> > =C2=A03 files changed, 6 insertions(+), 7 deletions(-)
>=20
> A couple of things that are good to do when sending kernel patches:
>=20
> - Check linux-next first
> - CC the maintainer
>=20
> This one has already been dealt with:
>=20
> =C2=A0 https://lore.kernel.org/all/87ldmnv2pi.fsf@trenco.lwn.net/
>=20

Okay, sorry for the noise. I looked for this patch in the mailing list
archive but looks like I didn't look too far.

And of course, I should have checked the linux-next repo. I will check more
carefully next time to do not spent time trying to solve something already
fixed.

Regards.
