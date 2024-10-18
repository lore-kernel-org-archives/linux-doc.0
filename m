Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2734A5466B
	for <linux-doc@vger.kernel.org>; Fri, 18 Oct 2024 01:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729215486; cv=none; b=rP6F7lqClqCN4tmvCbC0bnGGBggNYlcel4t25hAQquWxjRiVx5ZUH66F6eBlnh6K6AyoG4PCqDX5Js8tbLQTPctaAKTsCrAcgufc1SuvGOphI7CaLKU9UUmpR3NToXcDBJYTHq497bcTSnoIhYeclPF0T8P/sGwpOE0CMxlbfG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729215486; c=relaxed/simple;
	bh=hFbZjd2aasfJ0VgdpsatZ5AYfQ+hJNW5fkury0muUsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aaN2JIOu/e+iFeGzIR1b5n4wRLzlemKXu7bwrpERb2Sr7lGSt9vLX3DpbwHvJVusDjS1mZikZw/gIR9QQsmBqdNm9L2SpURKUDN/KT6Uzr/V+yDGamtwc9KnxA1Pak8I6csv4777T7/zhAzOL0w9xtKz4HHWvqcTvjLRLKhBngo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLfO+vYY; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLfO+vYY"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5eb5214d83dso579003eaf.2
        for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 18:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729215484; x=1729820284; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+CecGFS/vM6MtvXQlOa+pZjBQAmqA1nBYsi+XelgG8U=;
        b=XLfO+vYYUmEuX6dc3j18mGuPZqlJaIXmM5SGSriqXCGj9AqQJjc+Lyd7nvElxuiubi
         Bcm+nK7GSh79WeUCB3qpn7icPPebRKXRH7oqM04NmVnZTPWNRE7UeTfdjhdNJJ5p3z90
         qyKd1scLu2lzzluzdOidVFCViSTad4+tUv75bZB0nSGDp/0A35UkbDy2CfoaoCwyO1oL
         333wvU0NTYc4plJsETSzqT9MOoahdeTyy78BOi4m3BbUr50F1oM4hnDJ6yj0xNeqe0tj
         ml+mcSRiQSBwm8KP+lDmriv8v9XdU/QTWMZrvlcck7vJ8vH/cNQ0MpMrKlP5sTaLWcY8
         JQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729215484; x=1729820284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+CecGFS/vM6MtvXQlOa+pZjBQAmqA1nBYsi+XelgG8U=;
        b=C82zacqxyqlf2sXGqalxUfjd94Dl3CUenqT8dCp/38Y4GtqE28mwg7dUgfNQltrARf
         me65D3UYzB/pbJ29OmUth1Xmupul/+ye6tysXdyLQqHc1Ezk0LREsiNWzJjV2xnB8LjU
         S04xI/n1r3eZowBeGxicZ0Xh1jmR+46pQiSE1RHo/kg+/kDl2ss6XQ6dTYYCwwR2POOW
         5ua6TDn3Txlr/Qim74IX2jnxVnXT0EJbjIXgc//FV8DCypn5rqw7IDE0px8PWDHB3Rgl
         hHm7EtK1AgVNHf/oabrzyW06uc3bTEWvMgHhxmECsSH1CzPmow/XjHdU86GBRv+eipbs
         3m4w==
X-Gm-Message-State: AOJu0YxNjFOiRLB0SVEalY+5XjYplSwc9KlOixflpc9fhaQskhlK8k/8
	5u5Cter1dOF3NBgKroS7mXHr9tmqLewzNTmTFq2AtMpKsbcj4dRP0iC8b4DTJtjXIFzQJvzUr82
	KD50JKe/YSHZhiYjCzQB0NaLm3qI=
X-Google-Smtp-Source: AGHT+IEImdVCas0F0sjXbE/1i9ASysWM7DFTYXFjPhNPIjld7jTVzPfVUKhS7SCRXgyBzn3VBkoFJ2P9zNjxcoAdc3I=
X-Received: by 2002:a05:6870:c113:b0:287:cb2:c0e with SMTP id
 586e51a60fabf-2892c2dee9amr737501fac.12.1729215484149; Thu, 17 Oct 2024
 18:38:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <87plny1zam.fsf@trenco.lwn.net>
In-Reply-To: <87plny1zam.fsf@trenco.lwn.net>
From: Dongliang Mu <mudongliangabcd@gmail.com>
Date: Fri, 18 Oct 2024 09:37:38 +0800
Message-ID: <CAD-N9QWc1JH5NArjtej_SwOk5YdUYTNccMwwb1WHOO44x_DwsQ@mail.gmail.com>
Subject: Re: [PATCH] Add Yanteng Si to .mailmap
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, Yanteng Si <si.yanteng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 18, 2024 at 12:15=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> w=
rote:
>
> Yanteng Si's old address bounces, creating a lot of noise in conversation=
s
> about patches.  Add a .mailmap entry so scripts/get_maintainer.pl will
> return a working address.

Thank you very much, jon. This is really helpful.
Dongliang Mu

>
> Cc: Yanteng Si <si.yanteng@linux.dev>
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>
> ---
>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.mailmap b/.mailmap
> index 0374777cc662..f2a4e48ad81a 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -717,6 +717,7 @@ Will Deacon <will@kernel.org> <will.deacon@arm.com>
>  Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
>  Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
>  Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
> +Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
>  Yusuke Goda <goda.yusuke@renesas.com>
>  Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
>  Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
> --
> 2.47.0
>
>
