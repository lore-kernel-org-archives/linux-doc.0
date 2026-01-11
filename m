Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E72234CFD3
	for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768158879; cv=pass; b=MFeXRT3ixoQO/NYL+RCyXi+zpXQx5DjtEA2SpSRHoy2HoT43QGV80KfvzpN0GWEyp5WKEDzPLEfvFCoKqTwhiHUcIGs0FgGB6+jKqeaMbEp2UAmhC+pd4U24L+cRenFkJ56JKPb+qQMgozpOpqivooN9yVpZFwJTgTQ8m4j55do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768158879; c=relaxed/simple;
	bh=k6AlMVy9ciJTJpdV8gMWZ1nSB+n2ZPly1UT3btHq6go=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AmidWeDXiLLWhuZ9EtBt4zVeMR4YZt1cn9ubsxMtVU3HTcnvMHkKJqKVDvfxxnI2FWGYYIgROr2Vb3xkxj73qvEeOY2jB+kC8krvpOu1yWkZRj/oGeQe3l+AFF84qUV+qNLkdStH78NyZIFUtcxlu2VjV8tOCkhAaoBpXbGl6bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YwZEnLcV; arc=pass smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YwZEnLcV"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-59b30269328so4757e87.0
        for <linux-doc@vger.kernel.org>; Sun, 11 Jan 2026 11:14:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768158875; cv=none;
        d=google.com; s=arc-20240605;
        b=YEtT+W6795uI5hwZjj+8r0AfSyav/IGwzrv1rjEKAGmnrmLFgVN8eTxzHOK7A+fH7k
         Biv2HcTHRqrN2BN9oE11a0A/3xbYeB2lTHoCw7ld7yq2pLuo2+W4Fn6vNPRiBWe0KR2v
         Z4hYnfJ/jFhNOpWvGK6YpVq7Nz2xkQ1yEiQt9r7zagbEswGLFt04bq174Jvc3hRxK6Qb
         RY/bZUXZjvp8BcurLYhBsdw1M1zSL5GOEv2lK/i6Hs4j7BcIDjFFXFxIhpo8rtUFR3cs
         hRNztlp4psyi0jf5WpOoUoeNiVrImzHhGkJPJ9dWXUyaQMFyAsKLOtAlQ5KOgjL/wNI8
         XbyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k6AlMVy9ciJTJpdV8gMWZ1nSB+n2ZPly1UT3btHq6go=;
        fh=EGEMbbKhIs52eA+5Kc5iuCMdQXuEZfUCV4cjh68FgCE=;
        b=AqwA4u4vOw/iGG3rUj9+CrXc2cYHYhDUPMh/F47g3MeYde4APOGtnBv54pcV7AFMQ1
         vqj5mRilrAY2OQ4du1YSuEoe6MDI3t27NBNS8NBjX7moBPdQgolKAaNxEU0cFlGDadBJ
         aw1L9P6nkILYXrLXHYhj+WpOfR0lw0pCuemkGJMriSsYYhuH9rnV04I+IXD4VuXHS1vc
         EWwaZaT7pYsMB5icColyYQXQHnP6Jf9RpOSFdA75l7igWJEXcYo6GFEugytLfZYoLAvS
         kMtmKcx9pSYWKtmWgJTTKJiAW/z19kn54AFrYSvnAENGQlpVHyb4DNnBrcHesH24HbNJ
         KwGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768158875; x=1768763675; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6AlMVy9ciJTJpdV8gMWZ1nSB+n2ZPly1UT3btHq6go=;
        b=YwZEnLcVqIzSeKspGBMgiQsamdY9J47OeszZkd17u2WGJZ2R3NDdnM1klKlKJ2hXCE
         dPl6Ja0ECKfJjKRjJCffz3Elfr1InkHly4OLGUNy5JQZoFDnHx5dqyDZckTk6S5co+tJ
         KunFm1p6UejfZGc/Mo+sXI8QO7UFESS9QVbkBgn0PsfnHG7vSWMjSpdTm/yuTPv1S22q
         yAOaG46N94oZrqFUPi8G41iiyr98rN5EDw7/sMKzBdWb3lhV4xOv/N4nTm3QEBg1T96B
         hkbOF+ukA7Lpg2ISpyXm9zR/eM2RqZIzhDy6r6UhK9ONN5oRQbW+RXDgZvZFelre5jve
         0fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768158875; x=1768763675;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k6AlMVy9ciJTJpdV8gMWZ1nSB+n2ZPly1UT3btHq6go=;
        b=U0lv7WSpQeQGctFIuT6qxiTpW7aI3m0pPo4v/A+aqHJrEBtrZWpPMGBOdSfS0xpV+A
         pyyudneaF96cEse0jvSx/UtHvM/bdr5WqAbGAQBMamIoKpRM4rA9GxN8JhAJ3UgXfLSv
         OQ6YM1e83+Ee2DQNA/qSCuUdyNTR0RNIVKQb3FpHiRGkrATDk0T5S8AV6u3GolWXlzsY
         TN47kir4OLewdlV2yXPHX5JiWRxAEeIUunQ0BB/wr7MnCk6x/7RB/aVz/MUmT3ltMsos
         To6RPsolvUrLLe1TNWNRhixIwa8GJQE/28ZmF4h/V5Uy+fhbqJHVP1o7iInV5pfuAEdG
         m2Sg==
X-Forwarded-Encrypted: i=1; AJvYcCXjZqGWLPMsWYFdaMxNhmcP3a6yS5zxs433ukf3Td2BoI/setzFOiS1BOvW8gvWQPsz+NJvyqEWrdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMFfsa89FklQ94VE6ViUqUb53nHjkFNeQEbYYG9DKCIrKxzxaS
	Sd/cSc9Dj8g5wfy7mkkiXpWqqxHR8o0VLR3VG1+OR8mRMdtjXRiA0YnrTX8xfocXFwQCZRNxuoU
	QwPYUqEbQUV9I0NG9p6q4hZz1tzPfpjGnmim5Dj3g
X-Gm-Gg: AY/fxX6UQV0nXWsfKqvw7M/PHKBt5J+ybTFt6gPqoHB8s39E2r6eRJVoq07x1Q5SXUK
	bnwO+BMrHS1gqtNyRcRGS7L4Z/R3xzh6It0HTn/hHegOCCZL0BudPZ94yqqYRfKkBJWiB4DDCaK
	IDIb30iX8L4Krr5JceiS3n9NFB7qS2slLwE8L0wM4cdJr9yv5Ps48hHW4dUluJ6PfFkvPMs1+eL
	wnMc5YVRl226/n4sYvGYwb39FWZsekSn0cEmJmWfnWmZRMCkBUROVj2iVSV7AWyE6Stud0Fvc+R
	kfkSlw==
X-Received: by 2002:ac2:5392:0:b0:59b:9403:c67f with SMTP id
 2adb3069b0e04-59b9403c7fdmr1298e87.14.1768158874137; Sun, 11 Jan 2026
 11:14:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-0-8042930d00d7@meta.com>
 <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-4-8042930d00d7@meta.com>
In-Reply-To: <20260109-scratch-bobbyeshleman-devmem-tcp-token-upstream-v9-4-8042930d00d7@meta.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Jan 2026 11:14:21 -0800
X-Gm-Features: AZwV_Qjc9N7obQhSR7tfjDnibSqsWsISSF4YswjnxYBiVBax_pCtfSgtAahmfw0
Message-ID: <CAHS8izP=udLS2E2ZCvY4dGu3=L+SnPVQePsh=hNaM=3gy=YtHw@mail.gmail.com>
Subject: Re: [PATCH net-next v9 4/5] net: devmem: document NETDEV_A_DMABUF_AUTORELEASE
 netlink attribute
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Willem de Bruijn <willemb@google.com>, 
	Neal Cardwell <ncardwell@google.com>, David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	asml.silence@gmail.com, matttbe@kernel.org, skhawaja@google.com, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 9, 2026 at 6:19=E2=80=AFPM Bobby Eshleman <bobbyeshleman@gmail.=
com> wrote:
>
> From: Bobby Eshleman <bobbyeshleman@meta.com>
>
> Update devmem.rst documentation to describe the autorelease netlink
> attribute used during RX dmabuf binding.
>
> The autorelease attribute is specified at bind-time via the netlink API
> (NETDEV_CMD_BIND_RX) and controls what happens to outstanding tokens
> when the socket closes.
>
> Document the two token release modes (automatic vs manual), how to
> configure the binding for autorelease, the perf benefits, new caveats
> and restrictions, and the way the mode is enforced system-wide.
>
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Reviewed-by: Mina Almasry <almasrymina@google.com>

--=20
Thanks,
Mina
