Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC314A2E17
	for <linux-doc@vger.kernel.org>; Tue,  5 May 2026 18:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004140; cv=pass; b=ZGANV2COt29SA6cEG0ItYop3stGEFilsIyoxP1Q+l/l3i5nkMLoOtO9DHfFmy6HdPEySpfTzv8tzQmlN89s/6FfMADamPFs/cnGXidUnnTIdDDLuYKs5vBQ/9QZk9rQE27nnBGmbta1Agua524eNVHBsFApI54IvnK4BhEMYm7o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004140; c=relaxed/simple;
	bh=Y6s8035MnHOoZJp25aH4HKvP69znVRNLLF3Z+qvmjs0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBDBJMLhGeTSW85WthypfubjdCaiAZv3v0dEcD1CTwPWs+AP/N9H99ZTsrSD07o+E2k6LrRTRy1ccgrT2AepxyJYwdxArHLT7s2ro1vRCbs1npMgaHc1O7mQABf2Egu04C4kO79u+R38HNdu2CYISg79udw2Vcic7pIWPUNFnY4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UJxyhCik; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UJxyhCik"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2f1b00a75ffso221816eec.3
        for <linux-doc@vger.kernel.org>; Tue, 05 May 2026 11:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778004136; cv=none;
        d=google.com; s=arc-20240605;
        b=WqJX58OQFxSlkiB7lwZlX+1G6wVWRrTO+8reF+3S6thh097pxF/2jOeK3dfG1TYEoW
         m7eThwypglcyByWncpqbypm3CaW08uZIVp2BIN9+wdMNNVz/aeeAk5qL7fLPxo1aKUzZ
         Ic3b3Jfp6nPUl9FUZc4gKkySZ3tCCs0/hZkxajlEJmvNoCEXSqOWIG9Chj2M5+WMFYhM
         lJe8v0iHNcaX+AmuVXJwBlNizi1WL7+bRvwzSfkDpHUXmpRUduiQKtqrPZTv/51VnbO1
         KShZgiJ3U73jsSGQnB6liLuNhgg5tO1IW3gtBddosuSk3aEIAJf9Vhpg5pkAp+VvTS32
         nIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        fh=JEV0Hr0QDDEyRXemjD0tzl3yhDo+9/K+v1oaj6ycX1M=;
        b=dWfJE9YYHs72WLbMA8TSZRM0yYHlAN0O7uTHu99YAYrw4dzlt0BwfinKOPM6E42/0Y
         q73LbFm31dwRdiRHJ/akz+0ORzi/SDiXS/D7cyn+HWrQ374Ri7xwoWm+nOvpTmeVgpJG
         9tMPpZZXPJ/F8028QJn2Qp3MZjZlwJA4j4y8l6KcnAZTG6v7NeNJo/N6oKwqpAjaLkTs
         0NNkZxcS5WEN1No2wmh0QhFyHfFD6yUeVfynslbmv9AviAsn6bRssulU6dml4iMfkGpV
         wNrfScdFMKPW5i6opkh5GYH1O8Jyg1ChajyzD+lwCOtAaU1zzv+R2Z8SvnNVxllFeTuL
         pNWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778004136; x=1778608936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        b=UJxyhCikg/zitnG72e4pwDFe+7Hqlki0B/dIRh3QWXUagCdTV2Q6nxe4e0dAHhy+CS
         riDvt67IdqkzcpTojh2KOx/gRReJdIg+by5474N7Jn08Pk5C5ftiL0k8/zVexrbS364y
         kmgYzRc3Zn1nAElEfnuHJyGjkorSuXABtntDhyhvct2mnZpwn27Azef3jyQi4HrrwCii
         zyybvTJN+yvXBWwfFvGs2zyutxp0jiRTuWebB4NUmnexIzeCRXXF2XZKX5bPomTKXT6I
         ArBDA8putluhdzTDMuzFywd/eZCAuxb4ySUYS2R4ty7gkTuJm+FFE/S8GcXXgHnRJ6QQ
         WYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004136; x=1778608936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WtjqjpgGE4a0FLYJapYAkbo1Ih3ARD2vHl+aUPAHNhk=;
        b=E+HXZcCTnTyyYPNO95ODc4Pzp2y7tfchIC2JAMTcTZr1gXoFWjIFZd5NTXlSDUBVEo
         ZHeGQak5tI5ad7ouQ/hsSTUomoUHmVQ4OVVjX+xrf19XeUIV03rdt8Qkdbr/gkSVT58O
         vXivAuu6g5bytMNzXJUPlvVpuK6S9IMOQ4XwkNqP6ubHfMTuepaseWU6ct4crQ2sf0el
         Zj8h3VvzOn/ek31FTW0xoHV0pxotLEgxp+8efGTId6twUZMVpv0IPWQhMUzsNFkvKCqs
         adOD8y4QOL3r1wHSofY7H//zTzAVAb4NigD+UvyXMLeUvyxO8aeakpm7/NnZp8DKwN6V
         IAGA==
X-Forwarded-Encrypted: i=1; AFNElJ+g8ICUnMYyiPGRKbKON4Le1nQ3Fie5LfwhUyuQNS9qyYhm+mm/paHf+j9VHnakbO46v/xweloZ6DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiiTdY/zzwmF/Y2tsXbqkSLcgK0Qe2EpUuaIL7agXGZxSg6CIT
	P6Q58DX2nqQXuAtT6z1NQy0ZhEPHir9pmgnBJ8PvOCYQts68j7AR+TAIWhELwTF6fE/A3eXQ8EY
	Y647IPosXGPZX0Agor3GUlDY9Cco/D9A=
X-Gm-Gg: AeBDietlKtUhBoCilk7h540I5DoAfAOIL/pKSdsHf7w7BQLwNdivGgI6qVWY4sd5VCZ
	deVZKpqJ/y5BaGYwtTlQ1l1ep+Id7AyOdEKTvdaAQf9EkyZvXkco6OSNwJcv33hpkniLcRicENR
	naCJWdjJ14gxs6mekHRg3vK9Xc6WWxpTYtB6AWrQbdy21e7sDaTOUFj4JcUCH5yJ4WRyupmytbG
	QalSBfmjmzBi94XzMS4nFMwd7xzUqPl9MWMJxDs5QmJ4MXcNGHKlJyeEZp66xCfnmLgU1kahy9o
	FEq8VKv+bmIXT6fWJqkWj8ldqLrUgO2m/NYLPjqh68Sxddb4YbOPAzjRl0wPFchBQjUPQXydGHB
	SzDjNvwWNyfdTuSeeOEMXFu+SXQBX6HVNGQ==
X-Received: by 2002:a05:7301:6784:b0:2f5:2154:c7b with SMTP id
 5a478bee46e88-2f548a8c16fmr72370eec.1.1778004135943; Tue, 05 May 2026
 11:02:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777987027.git.mchehab+huawei@kernel.org> <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
In-Reply-To: <921e5e6a074f9d8cf77483d73e6801f49254bbb8.1777987027.git.mchehab+huawei@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:02:03 +0200
X-Gm-Features: AVHnY4LHZHy1lm3OKzcJY8KmXCJf6ikQmw3SViGMY2r54h91fcetCb2RjR_TECs
Message-ID: <CANiq72m_+CR1BikHHuAR2c-srGOtx0WPOF6wfDD9ASkbE5L8oQ@mail.gmail.com>
Subject: Re: [PATCH v2 10/11] MAINTAINERS: make clearer about what's expected
 for "P" field
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 3:32=E2=80=AFPM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> extenal site. Make it clearer.

Typo.

> +          patches to the given subsystem. This is either an in-tree .rst=
 file,

Should this mention that the file should be within `Doc/`, due to the
requirement of the current system?

By the way, are we keeping the parser change to avoid breakage in case
someone does not follow this? Or should this be

    ideally, an in-tree .rst file within Documentation/ for best rendering

or similar?

(Also, if the parser is changed, then I am ambivalent about changing
the `P:` to GitHub, since the local file is available by definition,
but GitHub may not... But it is fine either way!)

Thanks!

Cheers,
Miguel
