Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 324C91F3D56
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 18:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588230; cv=pass; b=a706YCO7pMXsG5q95/FAbKUlVOpcvdA8VtSZnNK4hREl6cQCfgRrlsOGrVBwZaOXtL1YIIPtZL6J8W1oVYwPIsvvWH8up9BrblafarO+hO20q8hE0YpW0I591khehiQX1LCnKzkIA0Nqy3QndaNpm0pFaACgd8JZGgq9YedeS7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588230; c=relaxed/simple;
	bh=gIA9cnkunWjSA6aBsAeXZeJQx2q9RSEgvOoE0mcOzHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=poivbJ4au2yOR7kq8G1laKFg3/JIHEH/3BJJtD+TxN0Wk2uYFzMMG6+M6R9SlBRiO9Fg5BsuhwAvwxKj0i765aOzxE+pBHUdekicXonr//R3WVnkiTsWk9fAeUrcVTp1JWTd8QoOU0UW2muBvNONNcjXnm9NRwEUKHIG382vHIs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FNSYgp3E; arc=pass smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FNSYgp3E"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50299648ae9so9861cf.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 10:30:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768588227; cv=none;
        d=google.com; s=arc-20240605;
        b=a+MexK3iFHAucw8kwb5ARU1NA+H+Phd9G+fjTXlHYL+EWvpTnmBIujdwuPrFyRgPGf
         qFDTl/ErxDdo09+OEWY4PXz6unQHPciWuCEXXTPl2f9ew2W84o2NeHNLyCib8IH9cWQA
         kdhByMtsHn7w8Tvx3GrziNztQd67MEs8+wrrtszkL9YNI4dWE117/kbc+5jn8JFGh2JC
         Ph80XUN2E+HjKrfg4CJIZHpF5ydULm1TRW3ptyiAiQZOh6Q/Q2wPJHNqfPCPH2m/26O5
         9J/Sr97CUbteufCnFU7qWbqZA5FEaxMcCBL1FG36M+VPFfCq4qFUXgYhItRBGej9AfMJ
         R2BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=78gXhgLyIFLLpASS5oKJ8Lx5Grl+s0Di0xH8SDZDXS4=;
        fh=Cyp8T9aHBq1igPSilAJ1tTp+FF59Lx31/ORLq0kW328=;
        b=XTvi1h9PViL9N/HuFER/u74nP3iEHlo7hzdWv0WxDzI9lS4JfOF/IvSI2NixPBdLIh
         auPt1E0Ng/tV7EAqXZ5R1mc7EFD8l1VW2ipcYoeP97WthRY861stGJahklxatrneoErC
         XWPuDVoOA7ykbYhTGA/2aSAqx5BkdQFNt6mwmc3dEJAMMotayrwsc+Reqi29xGnKeB0N
         t8iztg9mwTpX9qt09SJ7MLl6vz3FIfGL7Q/HAuRsZQB9ydRyChoByzJ0PYpebUaPlMLB
         NW8wSAsqXm3wjPuIDiMGbkDZaTDnDJda8Eisu/2+SklfWBpV0WG0RtYDdeTFgh/G1YuJ
         QXgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768588227; x=1769193027; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=78gXhgLyIFLLpASS5oKJ8Lx5Grl+s0Di0xH8SDZDXS4=;
        b=FNSYgp3EPnyCnvQy2fzGWc1q7nFzQMQR4pk8MZfkIZyWCeulmhsnIOGU+39PVa4/k4
         2dM3APrNRfCi70ABSeDpuKA464G07F1jRd3GlS7kyTHRPM2fwlh+rPPxvY4aeVx3bVOO
         d9aZ0/uDe+FZZaKgT5heNfiUVrJ0mPO7VF78wP7Nnd8pU3QU/2PdAp+gOQDLcwgVihP/
         VrSrD1wd/NWwH07W57Ug3TLF2wd/TyXuzkXgNFd51tGdtoBVsEPTyr40YdnUgDtIxz++
         UI1l53YWqZrz37UbDHGKsVQhK3KtM4vcrsE4bNet/474p5EciDittjhVd1uNOeTx5bRR
         GsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768588227; x=1769193027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=78gXhgLyIFLLpASS5oKJ8Lx5Grl+s0Di0xH8SDZDXS4=;
        b=uAdk3gY6Zta4mcQwJxBElfp5mOvifYcy+LfLelPepVCnk6+cHjPJkE5jqcPGWdccsv
         DW+LbUPwF94C0wrJ7/8EKMd7JUksRgw8vGQZ7uTf9c4X4WeFy4IXkfDvGguXP043DG7O
         WQ1M7/6HSv3br4sfU9jlbh04P7AgNYcmWYC65+6WsV7A/qpMMyh24Sa1TDe5yYvng6pH
         8k8lnBULMeBPDxHeQ9FXYmKFxh7VZAIJ3ecKGaWQXtOE1uBIXUFEi8yO1DEk2xkKb+ud
         v8nS/5R+kEg62FQAvCxqLSU/iYoLMkxqa9dAsXLT9Zb9WwAvSgbUSS7lpEFY+gKaKRba
         TyBw==
X-Forwarded-Encrypted: i=1; AJvYcCWysK71XhBK1qx9v4MiTWkHKsKsBIsyO6SBi9zKV9UnQJGnTxuWRQmw8dtCREezhdNk7RVzLN5hGqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUdAUVYxgG52bi0Y+AM7mbYUngdYWquTgc5fSH1CiKK0ab1tVY
	pSz5QgJYVxv6tC0UJLOxGG3L4GBEkzDyNGq63WbWGxk79WK8/UkVul+vQTbFTo4JjJPUF7Gnp+I
	tFkiXuoYT9stf1qVoXxB82WkMwWxsdYt/vR94rnTs
X-Gm-Gg: AY/fxX6/83WYKR2t0sJ2yAq4pRiL/a89cqnAdsGFgZnSBST/UbH3bXaEqvzfMWoAYwU
	xSjzCAagFPStA4cdtJhlvgpi7EuSomIkidr0qAEjBSG1p6K2n0CQPRdcUY3PX1fuu7ubxLulofk
	DnH+2McLEXBW0eAQ6YJMrebICb8pLKE+Cd+eD4ATZbdg4w0cSEMtA3357et2NddkLAjAPqF7mm0
	dyN9VFf27/MCkJ8yFrZaUsHSspXv9UXq7U2OmEz52Hc12dKJx/k73bgQL65+QCHmBRziA==
X-Received: by 2002:a05:622a:1999:b0:4ff:c109:6a4 with SMTP id
 d75a77b69052e-502af961d0emr427261cf.4.1768588226665; Fri, 16 Jan 2026
 10:30:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpEQZMVCz0WUQ9SOP6TBKxaT3ajpHi24Aqdd73RCsmi8rg@mail.gmail.com>
 <20260116021835.71770-1-sj@kernel.org>
In-Reply-To: <20260116021835.71770-1-sj@kernel.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 16 Jan 2026 10:30:14 -0800
X-Gm-Features: AZwV_Qijfm4QX7A8EtjaARaEPudSI5DCWWeSwN_9u_yVlGn-gJw7kPfo1GWvE2U
Message-ID: <CAJuCfpFevUwXxwOrpH3+VOibjJw0rBw3=QL-nqeKreNEky7_Gg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Docs/mm/allocation-profiling: describe sysctrl
 limitations in debug mode
To: SeongJae Park <sj@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, akpm@linux-foundation.org, 
	kent.overstreet@linux.dev, corbet@lwn.net, ranxiaokai627@163.com, 
	ran.xiaokai@zte.com.cn, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 15, 2026 at 6:18=E2=80=AFPM SeongJae Park <sj@kernel.org> wrote=
:
>
> On Thu, 15 Jan 2026 09:05:25 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > On Wed, Jan 14, 2026 at 9:57=E2=80=AFPM Matthew Wilcox <willy@infradead=
.org> wrote:
> > >
> > > On Wed, Jan 14, 2026 at 09:45:57PM -0800, Suren Baghdasaryan wrote:
> > > > +  warnings produces by allocations made while profiling is disable=
d and freed
> > >
> > > "produced"
> >
> > Thanks! I'll wait for a day and if there are no other objections, I
> > will post a fixed version.
>
> Assuming Matthiew's good finding will be fixed,
>
> Acked-by: SeongJae Park <sj@kernel.org>

Thanks!

>
> Fwiw, the typo is also on the .../sysctl/vm.rst part.

Correct, I'll fix in both places.

> And from the finding, I
> was wondering if it is better to put the description only one of two docu=
ments
> rather than having the duplication, and further if the 'Usage:' part of
> allocation-profiling.rst is better to be moved to
> 'Documentation/admin-guide/mm/'.  But I ended up thinking those are too t=
rivial
> and small things.

Yes, I didn't want to complicate reader's life by adding a reference
for a couple of sentences.

>
>
> Thanks,
> SJ
