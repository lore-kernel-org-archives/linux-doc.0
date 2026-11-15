Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794710649;
	b=GIDOtk+3zlbEFYM3yN9KAf6AzgE/MCHVP1AFKX7dDd822Gfacb44pCHuG+JFIdL3qTGe
	 7kG87X/3t3URipW7ODOZFepGJs2GHqchOkIT40B5pten+3N9N8mXguy/RBZyqPMlmwe+g
	 DbfO224SqC4T2bFOOZXCD91xy1qFNFQm8Vj94I3GR25bjq/hFPytLo3E+KUMl9V/dXJWt
	 +ejMFsjBj9tLULbHhQzOVlkIvYe/oK3/tRzSIOWaTgckIX/MC+8ZXi0PvK9F7+stlvnwt
	 mRIKV6Uql4Sx29Byf01iM0g5HjSclxwfYXFlvhZavIz7mF+HfD1lWBhfQcGqDtLgCIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794710649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
	b=3Tlxf5b/LivCxIYtmZp6txuWfCEt1y3/OXiONNtPApcdn3ykDRS7x0trStxEttlQtqmY
	 8QfeusE+Wkuts2JJDshsShUrf0r3pRPRQR7Wsh6DxAL9tV2D148mqr6qpbnT4Q1H0Dhxq
	 Wp5pXo8rJ5yxCWPR6H3xMZqNTbd6n5jlOF3YWVrcHqrEF6nMjwL/8XVK7ZLDLN9P73QhO
	 3yIwV4nzDEyI7sCV1C6KiQt31FAI+9D0OaoelvIYnAagLt6nt/BMq7jGXy6PkntR7QJla
	 FH2W1iwlqLPBWqyglvUnkz07EKJniB14IoOSyVO8cm06ZWQLsiPX7lnSVqQsoyO8nNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.180
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C17C606A327
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 02:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C17C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJnm5XLx
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3adfcafaabbso25613921fa.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:44:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794710647; cv=none;
        d=google.com; s=arc-20260327;
        b=BgZW8mgz/YJQV/RnhWw1CC68f1nFuoinG0lelV11B4LMDAYROjwMDvsn5IjFddotNy
         8P7jzpGQ4geGnW6zjxL5xEWIK/t9n6JwxgjBZSxy4eLfYbWiWNuaqn0R1+ZNfu34PQdB
         45aPie8gJWr4pwOKy3o/i3x8aQj+gBN4xdGP+keDSKOR1XIIWL7a5OMvn9f0PEHQ0hrN
         RxlnmFxIQAV6UGMJ7ndYJLtEUgUKcgnzd1+YGrCsENts3ntf9dxQTBKLi4S2q52dlj53
         WGqldgIrcJPClUvNANyVPEEF5RQ1OXImCQ4o4O3fyD0nXnsuVjJhag4T1kWojwuczWog
         Arhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        fh=i+60S52QKg0phtDOFCqjRbBkPxPl00Wl8CY1St6jOYI=;
        b=RVQKOkWfngnq+l918TRlN9JTq8hROcjMicezHEokz2HV/A2EjvcE1FhlBE1Xt+uPvF
         4SN6LmB3AxOIeANkpMAWHBy13QltMRen7grNHQENqWAgkXBS3XyLJh9iJkmsZ3L65MBr
         XYnglZNYp4A/O9VROXafykFNii4F4V5K6E16uM8OcGsB1P5hyfTtCyj18oat2AOPwsuy
         nCy0wcUIVC2QYy0C9Bd3ni22by271UpQ7CqScnLApTy/g4dk73KSF4F9KYmY9aTnQsH5
         3yr+1KMpNmdhlJ6FOvyLKK+wwX3JPN06uATcqDUNaGCymhP3n1FDdBbozsK4FHZ4o8ti
         hgaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794710647; x=1795315447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=RJnm5XLxoNK866TvF2CkdY9AW+tb0cJ1wYfWzlZZh4X3OnWmWeykxS1NvAKwM8nW4T
         R0GTMYqQAqdx2m+VPUhijNqDi8cWar7oJaJKzJJHy3fk2ZhupkgqBuEO2Dm1/9fLTVli
         B4TTFx8z1iautbvXT5v2AYyLPiC1D5IFu0cThMCSZq2yjUxVximJ9/eQK3h4Y8PNalZJ
         T0bhpinyLP3mCG8jD9SPRJAwIQG6O46nBkuNR5hDYOKD8kgPQNHFOx2jEmOVhY8xIlii
         X65pjY/kWAjU8ccru4oBjZFJoMbyWVKnyH3W5/nrAP0JqE/t4MtEabZ0HgYpG0dll8c1
         OYAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794710647; x=1795315447;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WImIugUvsCB3dULRzrcWqUtpzfjQNdC7aiK6me5zFHM=;
        b=xksKE+KfZ5gUqMd5E1NKhJpKVZIHpQkfaeoCthgFeGk6XBVq4kz0nnPdlslh4pW9Gk
         tPKS2SeUNJGmL+9UeVahKwZfsMwf56vEkqWczOdMhXp4fH1sBoaJ43JbHhyWXrnmso+d
         ZKnDkHNWd+AbZlVB5NCL5o7e5e9Lw/Er3RpQjKMD0xVsUzmpLdFNIHBKUALxu6r+SqRA
         x5qAtYRzOTVADW9rNvyghBrnynisWuQDf7xOL/HGypYH9YoRl/eVhZlxvlnUpTohgZTv
         Tqkc5yBkOmujq39IWWME7Glbu1omVCZOO+RGQbXj9udwP9pWmGR2Uhs/kN9uTgFermVa
         NOeg==
X-Forwarded-Encrypted: i=1; AL+hErHYLkGBsvQg+9Ax6276NTlFos5zlaQlDZ3UrtpnZVw5EFHxsdcSm60Wm1zzC7ZTOsWEqEEYIhCvHRk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P0rkOLW/WQuJX2taMBkLQ+4KLKewiRPuB+U4H5FcE956/K3fD
	1ilYv3m+qHpLwQQrP5l04UooD7dhEk51jiw3NgvK9ENL5Z+H2Pp1ZsUL7eUFYX1K05fNwLBoeq4
	ccD8pOxQx6vPStER6iubqsnQx69dbzk4=
X-Gm-Gg: AYBFou3HQn+7YinI+pcZtOB9240+YPGJqzRYnHPr2n93X/I9sbQ9Y+sbTcSzKEn3p50
	fMuD18pg3KtgYo5TZrHevlw/csRh996R1A9akxRbS3aB8gU6ejQAE4x5GVnOamY4PlIbSnTamZn
	uEX/exVMn2vRPT4rFesm/WH37IQvK8agWqEv+reULaKSJDMQTT67k8G3af/PJZcUNFVrxlYOPQK
	liT+IokTm7nXVksu94E27zxM7ScyTBaAxLWOQKx67C/wsV3AwlHTNIRgeEWzO9ryxk6uZZQBYeU
	2tKJYmSQiZGBFH8RyAat8F8LAxDhgXoNYzkKFEUF0O8A2V6QAcjNAt+VOfA15CrUtFK3zhcAq+M
	G9hFKB2KvAZgUykkrGswrB8WEVLuCQGgUsg2fi65DSm+DQYwMyDAXTASKMXlf6UGzwCwHyt+TTX
	pJwOTSl8k1fiVgPiByEvcO
X-Received: by 2002:a2e:bc90:0:b0:3aa:ee7a:5466 with SMTP id
 38308e7fff4ca-3ae2b4f52f0mr22163651fa.16.1794710647252; Sat, 14 Nov 2026
 18:44:07 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261114-marvel-env-v1-0-890328e4b7e5@gmail.com>
 <20261114-marvel-env-v1-1-890328e4b7e5@gmail.com> <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
In-Reply-To: <4d69d3e9-9e05-485d-87e2-428616cd5d9d@roeck-us.net>
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 14 Nov 2026 21:43:55 -0500
X-Gm-Features: AclHuK-rDAmxPKOpteTkagDnbYP3PTwmOyt-Q5uXcex0poBTc5yw5ifEj6zGwJs
Message-ID: <CAEdQ38E=+Yb2hJs3L1KHgR1Kbe796NDD2z=n=7YytQ+uiJJWEg@mail.gmail.com>
Subject: Re: [PATCH 1/7] alpha: marvel: report environmental events without VERBOSE_MCHECK
To: Guenter Roeck <linux@roeck-us.net>
Cc: Richard Henderson <richard.henderson@linaro.org>, Magnus Lindholm <linmag7@gmail.com>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 6:01=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 11/14/26 09:39, Matt Turner wrote:
> > The service processors report temperature, fan, voltage and power suppl=
y
> > alarms as system event (0x680) logout frames. The frame is already
> > classified as reportable, but without CONFIG_VERBOSE_MCHECK only the
> > header line reaches the log, which does not say which sensor or what
> > happened. Print the subpackets unconditionally.
> >
> > Assisted-by: Claude:claude-opus-5-5
>
> For all patches: This is obsolete. Please base your patches on the latest
> kernel and ask the agent to follow AGENTS.md.

Sorry about that. The series is on v7.4-rc1, which already has the
removal, so the trailer was my mistake rather than a stale base. In v2
I've dropped it from every patch and mentioned the tool use in the
cover letter instead.
