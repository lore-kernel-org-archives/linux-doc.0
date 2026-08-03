Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41234334CA
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 19:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785783770; cv=pass; b=k0TmFlaIOTCr/VFJ1Db6d4XR+FjypeBtkgBHOmujW0vwN4ImTisyOOZtO1NjchoL9QxMtJkaBh5hLqux1jbRyfdYKukGAJz8isOCWOGt5GG0u1POsKV3e9cloyuQGVJrwkAGse70MIURlrOkr+y1ZwXIyd0S2MoJHLQgi2uov9E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785783770; c=relaxed/simple;
	bh=ZPc110GH2lVPR3QVvH4kut4ZD+2dlr+I0bCsq3f4oFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VWu0Et56bPu/aU9wpSTreueaRYEKku7bnhuwhV+8Xh0Sb64aoEZe1ruznlWTwbSHMwY0Q1BoZG0F3l9QcBJeMrrbrQesCtjmflr4FNUiblZ/HYSe+I4j44JSszSBKbg+WaQB+qQTAZvIzfpg/NzUEpB59EYLtLwJEN0y3hsAG9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGm6/WgR; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGm6/WgR"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8f186025973so37764276d6.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 12:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785783767; cv=none;
        d=google.com; s=arc-20260327;
        b=fvptj1F8cqY5WFTQrmTk4Q6BLp2Xsqn7XE7mjBGjFcJpM1jYxXROkAvH7HAyOIDcLp
         cXT8rAk/sZJDC8GSNOAIiREvKScwTvNb/N7IbeBvp7T6D0ktnB+eOyeqKFP0UVCEZQ97
         UkHArcb8OUffLGdiNY2EJS09i/00/euyakeFIivS+0xksvVgH3OOuCoZlW5UrwMdeU63
         e7jLEJ6Qi2nknrts3nCWjGk0U0JVNsM5cK1Nimmd2IBiUf9yWGP8v6U/bIh6fYULTgus
         rpKDzex8wYlzaOO0XHMK4+VXRrrlk5wbdSH30qNkrfC0jHtPaasIxwar/4eJpX9iuPVU
         nIxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZPc110GH2lVPR3QVvH4kut4ZD+2dlr+I0bCsq3f4oFI=;
        fh=MwM/ibIM5CqoA0CYmYNey+nKQGz3x85+tcO5XyP/Ie8=;
        b=WlVX0YpzSZZXZOi62JBrIf6mX10ECvXJC/3Va8Mbo0uCh6KxMu7MOoCAUIAJUQLyQ6
         MaZxpo7/NlSDyGpE5jm9IstyeYkLreEPLOhdMR5fzEsHvC12HhKJ/qsNfgLT+oQ2lqIy
         IdhAFfbNjImXreof8Os5ANG48RGBz+anQ16muRb6Z52xrd3eyQWL1e92P/Ueft2URC08
         TTqsK+rTkQv+912/tJb/gitApVnJSoCO0rEL2bmhS2+bEGaD3KQNTilYaGaUtm9Y8BO9
         shUR3EQnuHaTuwEg9GDxa876eKHiGSU7CrLP2xK7BqrICDAdUiuho9RaZJUc2J4npz0N
         t6MQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785783767; x=1786388567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZPc110GH2lVPR3QVvH4kut4ZD+2dlr+I0bCsq3f4oFI=;
        b=tGm6/WgR7HOsIJlxyxj/udUH2werBsP0lVrWdn8ofrrOTNQKnOlLE4QMwhJF8ztSyM
         RhRuYUvmu5ebjw6wC0HiaFefD+x+XG2C/V8MYZ+xc/zErCEey8XIfGFSBm2dLgpHW09Y
         0gTA2bHZNYmfLb1a4qt9rTF1K61q3X41i4TUoYqAy5PyfP/W+tntn4TZmj/iVaRzHOLe
         Ouhey9kBkEfJFWXwtlHsTqEBJeSfJj7c+W6Xul2PCbTSvVi4MRrpbilMQxm1b1O5gjOO
         f5zG2riPtf9WfmBkCbs9VTzKps0bawx3m+U4Wk6PfK+vxImsiSZ0SRCr7YUiqdHIk2XC
         BoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785783767; x=1786388567;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZPc110GH2lVPR3QVvH4kut4ZD+2dlr+I0bCsq3f4oFI=;
        b=OYEO6fUEEnt8u6ndr3+p+XdxG9PTomx7wlQ47mZxqdPeK2u7pPAuJcWyKUE4EPZFho
         3E0Mo7BynkYKb3WEn8sBh9lMjpQaozov+/HIbbkYDnEU2sxkJbUbVRb4Vjq1hdZCykYm
         NzeQdOBNg4sR8PIC7vhdb7CBh6FsSg/jD6IKJhlIjbwwyfrB09sfLrKvzeR27RqLY3tA
         MkJ7cFg9xcbCBtQoHlTwYlVHO88WX+DP4h+L+DVs0EYEMgLNjrtgythzf1qStvSVDwGl
         TV3VMqgAkwHe5X49JJgV6T5srMDfS8w9EqtCzNKKrLX1f/DsIhFu3Syd8AuVgm6al15J
         9SIQ==
X-Gm-Message-State: AOJu0YzGdRn5aJfwEycNFOmL93rOXxUPiwJslfwisME7G0PLoH5el+Iz
	T3uwjpHBIByEEkFzQ9yLbguX9yvQqv4Qwgbw8Msahf+tZjyN01Rqdz7qG7lST9SH9+/vKYTb/Cw
	ICIyFsdccb+4Rk+57l/ivJQywduJwxKk=
X-Gm-Gg: AR+sD122xv+gNAxOdpEWcHtoOxlLg6QNjGr40KzLVkWO7KIAjTgjVJzd4kisJQS2geo
	f3kTHRGsZi30zvZKqnx7XQ0m7Yw/y+qmwrH/Nfrt3KOK1ruvlC5Rir7Lth3GfIXhvRc2J+7ky/6
	3hjtoWwwLbIcDWgZxCi3GQjrH4UoKmxGiaJ8yvVH+CYrL8Dhq1NmglX++ZbrnHvhLSNMs29jL9W
	fbPZQL3OnjXkB3MOt8yEG0tHJYdRwLlJZF6wx2h0NpfrgJywuy2o34+ZnTNkV7GhDTfKXwlF4gz
	SEb0Ku/2yAK4Lc9bOUi07e6ItCC8VFwv+5keQcouPM72xytoEB1RHsHZlT2uzqH7/pNOVhaORrT
	sj5fWg6NtsFs9GNbZmZTNVyfaZ+hppqz5H+X3j674T6Y0d3OvSaJ1mt6qog==
X-Received: by 2002:a05:6214:2c0a:b0:8f2:940e:2406 with SMTP id
 6a1803df08f44-9084954d12dmr257890816d6.2.1785783767350; Mon, 03 Aug 2026
 12:02:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803185919.921073-1-le590616@gmail.com>
In-Reply-To: <20260803185919.921073-1-le590616@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 3 Aug 2026 16:02:35 -0300
X-Gm-Features: AUfX_my3E-FFLOQU8QuURaPJMGInDe-0B0CSXr6t-l3AbOg-lwoJns7yISWHpFM
Message-ID: <CAMAsx6cCKNetvajbm=qr+PCMmKThLBJ1wFwn9uwXXYOWyb2ZgQ@mail.gmail.com>
Subject: Re: [PATCH v4] docs: pt_BR: process: Translate programming-language
To: Abel Philippe <le590616@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 3 de ago. de 2026 =C3=A0s 15:59, Abel Philippe
<le590616@gmail.com> escreveu:
>
> Translate the programming language documentation into Brazilian Portugues=
e.
>
> Changes in v2:
> - addition of SPDX-License-Identifier: GPL-2.0
> - addition of the missing half of the file
>
> Changes in v3:
> - change "linguagem de progama=C3=A7=C3=A3o" to "linguagem de programa=C3=
=A7=C3=A3o"
> - removing duplicate "``rustc`` [rustc]_" from programming_language.rst
>
> Changes in v4:
> - remove zero-width characters
>
> Signed-off-by: Abel Philippe <le590616@gmail.com>


Hi Jon,

Just to clarify, there were no grammatical changes in the patch
between v3 and v4; the only update was the removal of the zero-width
characters. My Acked-by stands.

acked-by: <danielmaraboo@gmail.com>

Best regards,

Daniel Pereira
