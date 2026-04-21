Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF752DECA3
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 17:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776793690; cv=pass; b=C7IscqyZyplLwqDMoRBlIZP1bIELHwMr49OvyVqjoSJx/N4TULhWyNL7nI7nfsYjW08RJqFMDCZozll0hurndkQ2+dMzUJaqkHFryQ+D/7PzBnwbu2ozH5SX/QH9Gru03BhSPv31YyXdYgEYO/zTrZoW2vz76gvjpx7AgnH9QFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776793690; c=relaxed/simple;
	bh=hcx0YvejmS56JerzIhSsVfjd9XdxU+3Ujo+jeia083Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyBFFfDKXPKi+FXb1gb4JpZTfMzRV2l6FbA5oCehy7euHc/k/NTKPVo0klaR0Z39/+SLMKF/rAFuN6PIlN1PDfBMOZ/GKL8vlO0JF1GciJRRfOBG4xTKaMdh7dh3uQCDIRzziDYvtcciCBHf75RBiJH/wkCmHa2c6FsT+QRNMCA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k4DnlMn0; arc=pass smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k4DnlMn0"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79a535e7c00so51932527b3.3
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 10:48:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776793688; cv=none;
        d=google.com; s=arc-20240605;
        b=V44frFxmjMb6a7CORRTmi+HPXXicygW0J0X0tTOhHJ/3J1RxW1Oxl/ABt5LE2MP43O
         mh+JYwDkPK2gWPKqUct1UU/73O2G0Xp0duI5ksKLiHvCrXlJLb0U3fj7mPfmxxqTQv6a
         X0cBBciJmWLKF8qiiIKBhyNasDhDQnGcBPGj/YF5y+1mRrsrUkNcVzRmuefAGZzdXiEA
         zEwFC4a+FXktRhoLn+riOkF8ufXXvuLG+tmiZrdlVsSyc5tC0zAaaWVkVjQMA3qNGB6Z
         suTK+cj2dRzw2UJsa04hrvVNsYWUuuqcVL/WGJCrbOR3PSXjr6Us8DBzp/RvRqULjyN8
         IiIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        fh=IAe7ftxIWB6MxXQwbELnDORb0snOrbvW+c5Oepdb5P0=;
        b=g3d76hZGYXvD5Y5i1CirKm+aOsITfhWeHRNapcH+xSkJn+nhmMSgJtIiQcSkl4am/W
         u+XVKUzebOCQQFWJOXlshLkDTN6nGKMILVWbcNWKxuwwXvbaKdakBTl7z/J8oxxJ2t/0
         M5hlCtkkl/n260LmEjrapQR9AL2eqZpowHK+IiCnnVbS/XMt3bVqyau5Ba4z/gtjuT5V
         wlZOoe1iWGDNmg2INbLQhRWUKDQzTIhe/Uxk1jFWDYu2oeJuCJKjAQXF5n9l5T8bTxrT
         NSbujDvrgERHlWrSPsvTgqiZc+kcz8STBrEOG2UIlQzdh1e53YYnJiF5P2NlBd4CXHjE
         0GEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793688; x=1777398488; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        b=k4DnlMn0nwgZvsc3wFfEyq/BVj360bYBk69WcMHVTbu3DEAuyv+f8FIZHYgX4iAh4H
         PhG0Ryp78+MdHcAeqt7wlRIlPlwCP9NP1swyf8ba04db/pM5OPiltOIZo4Ue2g98uy6I
         cpQt5nzPvenThYtc6/+oKpvwg1ZS6Pkz+7GkZVVZCcvhcJHWm9IgqmHS214DDUk4PiG/
         C+2Iv7PNbf7ciGC/4xX2nlSOH8RPlYS628+qZR5391POGk3zncYWcOxAHBm4midKJyl7
         kldlLHrQK1GueLPrku0zK3JY8c6HPe2D70Nt9KmgW4ePdaUCxnQpm2NGi2m44FfQfSRZ
         kM0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793688; x=1777398488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R03tCF/ZHiy8KuP/YlPNlHYbG1HQ0Gao1w4hpVeTgxA=;
        b=BIOxB2d3Pzv4mThsxl2A8wnyhWbCL28lQIy3krQUu89hVTkNJoIGJGIbln6Xy671gj
         Z1CVz8VJ0yLTQ6e+aNPN9TPT2s5InJedDTM8oji9USDFz6bfd7D8LTw3vQi5sTqXolg4
         LPvWPAOnWzLBoGkAxbEpswS/zpg6UbE4zYvAha5i3jVUN/77LtcrjFzQU5x7oxEwigTV
         Cnu+i5H0QIC/ZFaacNw7BWR4nGO4QsTDnqoSymCDRs8sPGjyi2wtqoAGo8AUvKwnr4cu
         wCD8KbU8DJnFsBRWXYBQXhCRNmJXXiUsyejG9SrZuNDPoW0aCFr19wGdjIWNwLoHPzhJ
         NQlA==
X-Forwarded-Encrypted: i=1; AFNElJ9Zoxi/YrJ3d4O4H6MuWIKzXdj+3bfMXm3k3++F5NbBoiqubFlvG0wCsze8+JZ/+h0yZZqDNVpR0kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQqJwk3hPb/FZs9rTAiz7PzbN6XzOADl0f7zrbrhBnrrE13wKM
	vCajASo6KvM6ud14KQtnizn05KInrSp192Qnr+5DMd5dSZoz1JidWfVNUniHqoTDHPqnajcOtSI
	s7pu5DIjX17laJl5IXSnmcB29dUX7Tnk=
X-Gm-Gg: AeBDiesbMXXB/oUnm2cvM6rMpMhgKDCpk1fsmhGry6ll074Ea4t6LyEkl+/7VEnYpKM
	oZZOuCXKww0bshOqDMjMkM3Vliz8OjfNQyVNJMcb+x+eBVYC3Ppm9z4aiuOip0zvF3cN9YdAYgM
	aZKVNOtBJADAlkdYnKbd9JtghmR+xwr6HElqz/Os5b2N+PGE6GiTGR8Ju1/L2nrEtnMVAUGSpZ4
	ttwxd78/IZ+D+wV5oX5aKfG+X8f4lHN5pPyXDH36StXICYIhV0e5BiAeMIER0srWd8zIuzw69zw
	08Ta2VY8m3++hX9m6yGgC9TZaUPeJjdSeuh277D+gHxXFIFdIhs1MNKJPPcHVxf5jIyhoS77JUY
	HkOy2B23l9YZOLbB/meoSTd9e8LgzUQJNCxtp
X-Received: by 2002:a05:690c:385:b0:7b4:2bbb:441e with SMTP id
 00721157ae682-7b9ecefc3e9mr204444267b3.22.1776793687897; Tue, 21 Apr 2026
 10:48:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260421021824.1293976-1-kuba@kernel.org> <20260421065507.2c5e3ba7@phoenix.local>
 <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com> <20260421101400.67545b20@phoenix.local>
In-Reply-To: <20260421101400.67545b20@phoenix.local>
From: Dan Cross <crossd@gmail.com>
Date: Tue, 21 Apr 2026 13:47:31 -0400
X-Gm-Features: AQROBzCKdVzPerkFTjJ54Zrsr1a5zXRmBIrK9mgKPR_CiQnkbs5x85ZT4lxTKvU
Message-ID: <CAEoi9W5OWmme-cwH2qiwN6JaFbvyWSUHdJemk4UaRG7zQehuCg@mail.gmail.com>
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
To: Stephen Hemminger <stephen@networkplumber.org>
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

On Tue, Apr 21, 2026 at 1:14=E2=80=AFPM Stephen Hemminger
<stephen@networkplumber.org> wrote:
> On Tue, 21 Apr 2026 12:17:23 -0400
> Dan Cross <crossd@gmail.com> wrote:
>
> > On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
> > <stephen@networkplumber.org> wrote:
> > > On Mon, 20 Apr 2026 19:18:23 -0700
> > > Jakub Kicinski <kuba@kernel.org> wrote:
> > > > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementa=
tion
> > > > and all associated hamradio device drivers from the kernel tree.
> > > > This set of protocols has long been a huge bug/syzbot magnet,
> > > > and since nobody stepped up to help us deal with the influx
> > > > of the AI-generated bug reports we need to move it out of tree
> > > > to protect our sanity.
> > > >
> > > > The code is moved to an out-of-tree repo:
> > > > https://github.com/linux-netdev/mod-orphan
> > > > if it's cleaned up and reworked there we can accept it back.
> > >
> > > It would be good if these protocols could be done in userspace
> > > or with BPF?
> >
> > Consensus for a userspace implementation is what folks on linux-hams
> > seem to be converging on.
> >
> > The amateur radio protocols are more or less specific to low-speed
> > links, they are not particularly coupled to anything else that
> > requires running in the kernel, and the main coupling point (IP over
> > AX.25) can be implemented via TAP/TUN.
> >
> > There are several popular packages that already implement AX.25 and
> > NET/ROM in user-space (for the interested, LinBPQ seems to be the
> > canonical example).  The main missing piece is ROSE, but it is likely
> > easier to add that to an existing package, or potentially something
> > brand new, than keep it in the kernel.
> >
> > There's no compelling reason to keep these protocols in the kernel,
> > whether in-tree or out-of-tree; at least, one has not been
> > articulated.
>
> Thanks, my other concern is carrying support for these in ip commands.
> If not kernel based, then iproute2 doesn't need to worry.

Agreed.

If someone really wants mimic the existing output of those commands in
the context of a userspace implementation, they could write a wrapper
program that invokes the real thing, and extracts relevant information
from the ham protocol implementation, and interpolates it into the
output. It may be an imperfect simulation, but it's probably close
enough for most users.

        - Dan C.
