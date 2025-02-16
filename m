Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879C9454
	for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739736369; cv=none; b=CkOOTbHUxvfmxWccYF1yUCon5C0FSwnDXPYQqZL2nQ70bWkfd5YihQNWbB6R3fvPYu0ggqtyZanRew7qwGhm1VOHdbizYE6pCCQn51iOQ75zqIVwiCb9DkyrgWm/R9Wu4y0AjcFHR9sesr/A1uwgZp+pCnMPaPC/EqOIvj9Luyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739736369; c=relaxed/simple;
	bh=4rRb0s9I0b2SOLT/SYo9wgeXlV2XY6V+k9haqlrm5YQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ixylaacko3OPwO7NjvjqQoE8wXVRoVgxOyGoitsBXi7pIHGml+aC0iKKTNBHXukMEOrON13Maeunfq78Aor5QbdykhVLKvMJsbGnIEzucvNkIP8NhEXoE46DOMoC5xsx64Mt+S/uSmxE3xPsDI7EYkSE5aEPCRv3/J8fNXOAnAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=POwq6qL8; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="POwq6qL8"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-471ede4b8e5so2080741cf.2
        for <linux-doc@vger.kernel.org>; Sun, 16 Feb 2025 12:06:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739736367; x=1740341167; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAP1KD1zZ0LDFgrnzNE0CA0YlB1kpZiKhEpfx68P448=;
        b=POwq6qL8u8qTkPBmXLlm5JlCC3xefaiWzw0DVJwvtpcc3h8N8sRkZz5bulUv2U6Rbx
         dhbPV0pLW8qYrCLzlzTXQsZEEuMpei8lZ4X9682CovRpDFWxDI/YZ7eOrxCBKsvPEroX
         0VAJ8+JUi24Plbw4wBezXfI1407rvKghGGXk13BqRTY7UfnQIaNv79JKCNS74laeklwP
         z8b4vZe1Q+ngyhy7CbaTk18K5MD4VZdXYq48tpTk8Zg8uZJzQPmDMLX+L7OBHXLvC2vy
         sMcHaKdFjghFyNmqJb8WWHU6LXAw0XehRek8y+xEsauPZmqxUqR/WH+JpDNcnbPwusGR
         2fCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739736367; x=1740341167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EAP1KD1zZ0LDFgrnzNE0CA0YlB1kpZiKhEpfx68P448=;
        b=ntmasqA1d6P1Ov7zPiFHPpSoR0K/U5aeTFg5p3QB3YtA/G9cPXXDVNC5bWHb0T1yjQ
         /mGwB0NJx779pg7DR4PBSyHaj8KF1ty80Q7x8UbJ2KNnC0jRKPKD1Rfx/zwtvHek3alc
         a1MnvxOHSTaE4BqxIYTtV5q2CTNd7UI31ZE6VXxB4ZVXfC/mVdPJ0ix7vZrC1Xmhu3nX
         LQ2mtykC4Pi9GD0oTroW35zFkCbXPVqrOzRaTpyTzihFiCbUci8lni3s0ygkiF4y5d4k
         yckrTuOZIWnJiY7Ylt+C4vrRw/Z6SIq5gDqBOw9bJX6O8I7L8THjgZjwlncRohqXHzLo
         KmtA==
X-Forwarded-Encrypted: i=1; AJvYcCUQhNGWM6dZYhXNWD7JclDimj7kdmnwUbwC3BUV8ObKcBVOqEelws50/Q6+oA+USpGI+4bzryvalWQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZmtjEmgQ1O7axa/6q14OzuqQ0yAwJo9IlP46ESKNbUxF1KoJi
	AxcsH/Xe8nsfbHdzssah3XKkqVYpRSTmow7bweXydJRk/k2CP9+0T6v+GKY8swnemTC0O64+UzR
	duBDowVQI2FN7cUConZ7PhZ8S7FA=
X-Gm-Gg: ASbGncvL3R3WQi3uu37x7DISBWiJkn1djmg/rSDIyWmuoMjlR/sNkWwkXduI9s3HKIY
	PMgdurScpgPlWcy/qjhdfU94fyn0Rv7T3dlsWTx7w3xwr8J7pXtliMmHnTr8j6mpXG53Z+eOlfk
	Q=
X-Google-Smtp-Source: AGHT+IGMJnTzbXTh9ELT1cBFq6Q+uf6saBfPcbkuFGKb+pRYe6Suqup61hJzj18QOo4GbFyv7cGrTTg73jw91ibrb4E=
X-Received: by 2002:ac8:590a:0:b0:471:ba98:a1d3 with SMTP id
 d75a77b69052e-471dbcc8a65mr96701251cf.11.1739736366922; Sun, 16 Feb 2025
 12:06:06 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250216160644.18924-1-andres.emb.sys@gmail.com> <874j0tvm43.fsf@trenco.lwn.net>
In-Reply-To: <874j0tvm43.fsf@trenco.lwn.net>
From: Andres Urian <andres.emb.sys@gmail.com>
Date: Sun, 16 Feb 2025 15:05:56 -0500
X-Gm-Features: AWEUYZmokXvRusmiPvx8MGUmZQXRVUqlYmqkeNqcXe7mK7iCJHEMh-ENyudH4L8
Message-ID: <CAMihqu_uw-51wXMTxo9YLHF8VGcdywzMZukePvbL5m=C37jfBQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation:gpu: fixed spelling mistake
To: Jonathan Corbet <corbet@lwn.net>, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 16, 2025 at 12:24=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Andres Urian Florez <andres.emb.sys@gmail.com> writes:
>
> > Fixed spelling mistake identified by codespell in the drm-uapi
> > documentation
> >
> > Signed-off-by: Andres Urian Florez <andres.emb.sys@gmail.com>
> > ---
> >  Documentation/gpu/drm-uapi.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uap=
i.rst
> > index 69f72e71a96e..64e002c6383c 100644
> > --- a/Documentation/gpu/drm-uapi.rst
> > +++ b/Documentation/gpu/drm-uapi.rst
> > @@ -518,7 +518,7 @@ ENOSPC:
> >  EPERM/EACCES:
> >          Returned for an operation that is valid, but needs more privil=
eges.
> >          E.g. root-only or much more common, DRM master-only operations=
 return
> > -        this when called by unpriviledged clients. There's no clear
> > +        this when called by unprivileged clients. There's no clear
> >          difference between EACCES and EPERM.
>
> This is a fine patch, but it should really have been copied to the DRM
> maintainers; I think scripts/get_maintainer.pl should have told you
> that?
>
> Thanks,
>
> jon

Sorry, including missing maintainers.

Thanks,
Andres
