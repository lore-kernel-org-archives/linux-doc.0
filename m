Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BE3344D82
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 16:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776788282; cv=pass; b=KWA2AA/dT5acqnti/tP4OMxolH00C16sb0VwCqCFGSxlNYduxyHQMcnPanDUYHtOHQ1mYLPzIXm0tyzlLMGEPwjyO0MtUGPP1q8lUyCLlWrmXypy5KQlePzzcyULjibL26escr1TWSpBNT/OLhiPiFw4InBLtgx8Vut/2QHh2F0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776788282; c=relaxed/simple;
	bh=bpNWPmQUmtbAf0gai0ctu6DBVgpxv6rlo0i3uJ04sWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiqZq7WgTLSnOINStTsyFSmR2IXQWcMUb5nvxL2ZUjODcWmz1FajqRt8a9taJe3Me/DxwtYu2Tlz04MmujLw2Z0pBhw/SxC05pJZJETKDFY9MvfBriGNykaAgB+F4SfkIia+YA24/LKHQMIlNcevM7hZK8uffL9D7Re/Rtz6WtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhtOqGe7; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhtOqGe7"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a46260385so43630627b3.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 09:18:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776788279; cv=none;
        d=google.com; s=arc-20240605;
        b=ip3n5E1Tc8H9sQOCWnGnYzRIN8yaj6IqCt3Fo54Wvb+NIo5QZn6Ebjap+8SK3+NQji
         DLnmxiDgFLfBI9y8A5Z3RvGE5/j/BP5d9P4KWfda/KlB2IBhl7vgZjWCUGBQuDWhMMEC
         ffihbKk0D3tKtLiR7ErSYccsldOq2hcEHYR0tDoAi4ou0Sjso+Y/QUZiw3F/mtj+sV/O
         G/NxWWenyu9kQuu62ov/58sffxDmVr4yzIhlNDYVREiDJQb1AvxUV7C2zO0jWo07SVEQ
         ifN2UON9+Cx8Bfu9Nhn4ikOBNnUtFgK/pQ+17vAYok6dcwt4vBoAY4bV95Wov7wObuGo
         ZLXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        fh=R9Ent+QnsbW8x0/fTB9h1L74PHVspwt8FatPoHcp4fQ=;
        b=KrnDQmexC8wA70IN4+pmaYUitax9GRKYEAHWxr/zolSqRW2z3cc+TS0I4vUPAHrw/Z
         0w9RzCya9nQRxHJpwnnkBZLtrN/+iOQDFs/nD8Y0UbxIfqScYqtPeTvFdYU7YNiBPr17
         gutfKWmFE6DLq7bRgI8ZvA2lxaMYAEHxLpcBZjelINzQKAbxSis/zExk3+gkkqVl5arc
         ukQ5rS2O8iMvSZEC/gDSOIa6+oc4JT/9Zszy91ONTA/L8ZufLGzOhR9YmxpmdVQSnRMv
         DZgO5Vsp3JVLZ6hknHN09JK3FRtB54HiRWJ0lz9duzJ6TT23kLFPyrSoHKkZyd8iw77y
         E1Zw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776788279; x=1777393079; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        b=BhtOqGe7RRiIumgDU5cmNdklvcPueg50lKI4WWG2/cDxTXZQlGpSViHfQ9efN+5Z8m
         EAyLwYe5saHRlKuBwhm/6CyS7NTsTr5fsc4wzlS8p26QcC7X+PGNgtHaCIqEkW6WItdK
         170UggOhkbPuef5armjmTEHwX6L76lT4T7pcbdJOGn5I3CEuKP0PlXUWEVGSRKUp27Bt
         NSKsBfmVSz7FIV4650sZtzBIWN67QdJ4yaUNTx+g2itL5c3EXIukyEO5O0rXDNO9+gT4
         CUHca599zSnFtZDldiQdna7j4annw/YRubSH4Ij4/3ppVf92s7h0rM5Cz5GKlBbBisva
         nZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776788279; x=1777393079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlejQ2Tpf6EuBEgAofXCiHYBLX5AECYqklHU2vA9qDI=;
        b=ItRyc22migH7v4oTnkPsL/n7Ssxu/nQTu9XorpumUB4PeDKZ6ibLjYApJHlBA42Okh
         7g6ZWSB1KPYD7TivD1PMyeVQVre56UzNuDn5YL+/82HGP++g9oCzq8JW2ir2jgYWHKAy
         E7ykD3HWQUiLrRV89I9nrjk6HjZ3Qf0AbzcxKP+De2Gsj6qvnsm4kngKXsLUBH646232
         gKw/nLMZPaRpuJTIFwwROJanoTYU4AHl3kCSawpv1PIfIzF44jsIklyxpPCEhwr1ZuUN
         qJ0dphLD9y5UaXj6qt9DuKXZVN5RKqvKNoxa4MGoJMWN4eRJgfja/01m1I+IsVSs28r0
         E1EQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vGByRipstIQWBNpMboFrCr3NPKTF11wSdiH8KscY+3fGCYX+qd/xsjo6AMTbGQZmEqUNODEys9V0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yywhcnl6JBI/q5qup3dPkZ0CsXBo4vTLmsRz+7INRbLe/bt+LI2
	XUh7cmElFCn1bNP/AemoOel6B8lB1wzAd0CEX7XbGMao7jY6rNGd4rHD2QcjGAcj3bDD2hm6Li2
	3ZewOWlkJP8dq292NJo2D4IoAN5AZqnc=
X-Gm-Gg: AeBDietXhhPaPsymuFrubDH/FJ8sZvhhYlWYh7eZWustMycfZlEK3WthOAKXD5LCiUi
	+68AlNlN/3cMQj2qUY8owVh+nXXpsuys731R+/RoSG1su0eRwp4VFKwXczo3nHU3purGN6ogU0z
	B9rkSjsX69AW88S9oxYNaR+aIffRBazJInqHUTiAU+hHo9ewWPE47ZeEqaMy08R0fh3VhC63VtR
	bwbM7CspUw9ZRPZg4U9sn4jqRS5hQRfOVaAfyJu5RHavKzdWepc+j/aJirPkGpWQufNn36fpmTz
	6K9b0dFeumDyEEMwqKuDzpSg4/8iIAkEcjM1okEmz9sblXqfJbK2p/xnXvNMolybuGunSkWgYJf
	z+P+mKixKgnWOG9llpnzTqGwBH6D2J30VXtMO
X-Received: by 2002:a05:690c:60c1:b0:7ba:f129:3770 with SMTP id
 00721157ae682-7baf129489fmr85282657b3.5.1776788279397; Tue, 21 Apr 2026
 09:17:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260421065507.2c5e3ba7@phoenix.local>
In-Reply-To: <20260421065507.2c5e3ba7@phoenix.local>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 12:17:23 -0400
X-Gm-Features: AQROBzBxInpXswvKS4PlaD90HmpltOzEo3_9ivTaP46UHDxuQQ1dPVwgB3AoVnI
Message-ID: <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: stephen@networkplumber.org
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net, netdev@vger.kernel.org, 
	edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	horms@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	federico.vaga@vaga.pv.it, carlos.bilbao@kernel.org, avadhut.naik@amd.com, 
	alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, 
	2023002089@link.tyut.edu.cn, tsbogend@alpha.franken.de, dsahern@kernel.org, 
	jani.nikula@intel.com, mchehab+huawei@kernel.org, gregkh@linuxfoundation.org, 
	jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au, 
	ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org, 
	pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org, 
	mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me, 
	pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de, toke@toke.dk, 
	kees@kernel.org, jlayton@kernel.org, wangliang74@huawei.com, 
	aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com, 
	linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Mon, 20 Apr 2026 19:18:23 -0700
> Jakub Kicinski <kuba@kernel.org> wrote:
> > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementation
> > and all associated hamradio device drivers from the kernel tree.
> > This set of protocols has long been a huge bug/syzbot magnet,
> > and since nobody stepped up to help us deal with the influx
> > of the AI-generated bug reports we need to move it out of tree
> > to protect our sanity.
> >
> > The code is moved to an out-of-tree repo:
> > https://github.com/linux-netdev/mod-orphan
> > if it's cleaned up and reworked there we can accept it back.
>
> It would be good if these protocols could be done in userspace
> or with BPF?

Consensus for a userspace implementation is what folks on linux-hams
seem to be converging on.

The amateur radio protocols are more or less specific to low-speed
links, they are not particularly coupled to anything else that
requires running in the kernel, and the main coupling point (IP over
AX.25) can be implemented via TAP/TUN.

There are several popular packages that already implement AX.25 and
NET/ROM in user-space (for the interested, LinBPQ seems to be the
canonical example).  The main missing piece is ROSE, but it is likely
easier to add that to an existing package, or potentially something
brand new, than keep it in the kernel.

There's no compelling reason to keep these protocols in the kernel,
whether in-tree or out-of-tree; at least, one has not been
articulated.

        - Dan C.
