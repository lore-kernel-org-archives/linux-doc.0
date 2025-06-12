Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B530246BC9
	for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749739111; cv=none; b=UJvUeNq8Ji5PtTL+W1ID2cjiAzVaKVec47lUaa4uTcxG8nvDKR2SUOnmizpXCpbBAaOWcwElSmAFHK3DgyVuRj0YfTw8ZtbkdPz9kgoyIbdDwry5K6I09E+OTLT7eQE6+s8+pSdAv8RoyJR3kRw+6AvYhHDZXlVcO/pKo1FapBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749739111; c=relaxed/simple;
	bh=xHgeGD9KGMzf8/XRz90W9cuDsQ/55h7IeMVoyMASh0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bU8H0EmBQ/EUWSAqgLeEJtk9hXpGQ6s0kNBhzltjGpdWkearwjoe9nDNU2dmBgKehLatNu7ZEjdWExaIYJef6OYe2ZcbN8W8B/8KiIU0ikwvfWTepgm4yWgLr0Ea12Z/evjRqtDbH6HEzCeCcQ2jckWoG/IjubV1L++3rDcQA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DNyaqc8f; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DNyaqc8f"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso1862624a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Jun 2025 07:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739108; x=1750343908; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE+vLMxCa/4xOqAYJ5GXaea7FGk7WAyuiVVFCmrIZRY=;
        b=DNyaqc8f1hCTBmT8B7pNEgBsRucRJq0DXReLhfHLRD7leboJYyHKmfNE5CloD0QbIN
         Bc8fviNb0MjBqXzAtVfYwfWsMPTqM+jdbQGpDvMZLuq4HKh1y9EmFMa1nrauBBntod2c
         yMaCa3i7KUsCUswGQDSTSOZAlN8i3p/TO8dqTWSCxUjpFvHDwAaQd5FO8MTz1zdwVS6O
         DNfzftV8ZA5dGfPIONPvCvdmaDyBifnSTSp5IVdwDHBju1q2gn1yp4gG3sEHFZpRqAr/
         z8XyXlAyzYl8tqY3mXHhkP3FjLuU8gVDTorpB86dtJilVG1lByy25Bxq5nQ+xZpxR8gm
         jXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739108; x=1750343908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jE+vLMxCa/4xOqAYJ5GXaea7FGk7WAyuiVVFCmrIZRY=;
        b=lOBu3pQAKPksiuKVZI0PGGp98n9RYQkVNYD7kLFY8TNYCYUNu1dBBGy1001h32zQpo
         2V3kO1nIqoceSzuDbSaS/uOJpV+GHoO3mpUFSPKifkgCJ9q+o0fvCCmnJ0LTuHv3VwRG
         GK9jV8fN7EwJHsZnr7ZVIeoum683r5V454+y9BDd2gPxpAoHLkh5ybepK+cgUD4sBeol
         ZpBJ+gFvNLwKIm+strGLvCrOVAi89275gz8BYqY1/8aIWJG8Zo3RxamszvkxjWw9mBm2
         OuWRUiZpYsfMkmjm4oPza/Btf5qjF3RPCRZCdS8Xilsh0MduOUDMYCo7dlhuA9kw9M6v
         da1w==
X-Forwarded-Encrypted: i=1; AJvYcCVRa7NN0b1ACZ8I7zZKwnpViNaEfZIsfn0xNT8YazneysSFlhrqtSFqkKDiot4tLfvfjslk8QRSX0k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx32ug6EMWKogucdfzbPW9WV56IJvMF4jBULj0Cc6rbyJyk2zWQ
	gzEXx3PVL6phWKlhWYNYcDE6I0MsLR4not5eMQQ3skmSFWXOod/qk0ja6AjGxO687LHY6PmSoAH
	/vvKSbJXmjtxbtNK+z058LB3/9CSp2zM=
X-Gm-Gg: ASbGncu3j0mVU/eEUUe57ITyueQ61c3hN7UmVXQNCNa79Axbylwo49/RnUIIxKD6uGb
	UNKKoqlL2yePwdzjoXnIl+hD1Alqm6NZFSJ/iKBdXH3rULsdMdhkSVtfv7yTNzQdqtXfDkMr3qO
	OpVbpVpPAoKlzvfDhhZrVCtCXiqilDVpjCoOdrbPgdfFo=
X-Google-Smtp-Source: AGHT+IHW3ELGp9+3vYbtC+Yt10f3KF3FLNuy9vdamacdaG3a1DIwxPcIsDy1htjfRVm8/wVCCTIeXaSHfS/+R2RSVFE=
X-Received: by 2002:a05:6402:5c8:b0:607:690f:b74e with SMTP id
 4fb4d7f45d1cf-60863af0b15mr3417491a12.29.1749739108220; Thu, 12 Jun 2025
 07:38:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749557444.git.dzm91@hust.edu.cn>
In-Reply-To: <cover.1749557444.git.dzm91@hust.edu.cn>
From: Alex Shi <seakeel@gmail.com>
Date: Thu, 12 Jun 2025 22:37:49 +0800
X-Gm-Features: AX0GCFvka-GcEidm8Xm8fVbxfCbG3eVW-Xb4N2MRiJV3Zn_XLOWuS2aH0nZNrmU
Message-ID: <CAJy-Amn6+A8fTm2=tCv=MnSkcGz2_E4=y=Ror9F-w_jTy8Mmag@mail.gmail.com>
Subject: Re: [PATCH 0/5] update the translation of files in the process
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: alexs@kernel.org, si.yanteng@linux.dev, corbet@lwn.net, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied on https://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git/=
,
Thanks!

Dongliang Mu <dzm91@hust.edu.cn> =E4=BA=8E2025=E5=B9=B46=E6=9C=8810=E6=97=
=A5=E5=91=A8=E4=BA=8C 20:31=E5=86=99=E9=81=93=EF=BC=9A
>
> Update the Chinese translation of process/1-7.*.rst.
>
> Dongliang Mu (5):
>   docs/zh_CN: update the translation of process/1.Intro.rst
>   docs/zh_CN: update the translation of process/6.Followthrough.rst
>   docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
>   docs/zh_CN: update the translation of process/2.Process.rst
>   docs/zh_CN: update the translation of process/5.Posting.rst
>
>  .../translations/zh_CN/process/1.Intro.rst         | 10 +++++-----
>  .../translations/zh_CN/process/2.Process.rst       |  7 +++----
>  .../translations/zh_CN/process/5.Posting.rst       | 11 +++++++++++
>  .../translations/zh_CN/process/6.Followthrough.rst |  5 +++++
>  .../zh_CN/process/7.AdvancedTopics.rst             | 14 ++++++++++++++
>  5 files changed, 38 insertions(+), 9 deletions(-)
>
> --
> 2.43.0
>
