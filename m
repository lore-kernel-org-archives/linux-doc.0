Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5BC364931
	for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 17:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776791656; cv=none; b=Cd6SEoBId5S6IOkVDVoEqIVq6ythzH2mMlmm89Xim9ZJZizkorVnc7NRVgpJxdk3bnDgzPIIdlfgucEdSXmHS50GyW8hrTkoMzKTNpwl/2spAa8Nxzu1jUbcaGsapu3xStEYqo8XOlaXaJSjcVGXxMtpWHxajYDjMv0fC6XoIZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776791656; c=relaxed/simple;
	bh=zQnL2fW68Yjh3nCOMT6xZ/h8HA0NEQszG//OMuJePKA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=srj5D4VkZvEVOEss56Wg+gquP6PlPQoWWXaJV1Sf0B1POxuRhXZF92xBxvob4EmDUBFSMRZGIz5TRRTPbTgI8mA2hGwJsUSLlIDgB0L7eBD33EyBrN7h9Oc+8lycW81QyRQCo5lHw/X+zWOU01H+aT+7GADuLlXnQlcqe9zT3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org; spf=pass smtp.mailfrom=networkplumber.org; dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b=NvW7V6zz; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20251104.gappssmtp.com header.i=@networkplumber-org.20251104.gappssmtp.com header.b="NvW7V6zz"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d7f92bde91so2491135a34.1
        for <linux-doc@vger.kernel.org>; Tue, 21 Apr 2026 10:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20251104.gappssmtp.com; s=20251104; t=1776791652; x=1777396452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lMUefLi5WLFFDpzONKvGSaE+pHGV5IKQnKH5bOuejr8=;
        b=NvW7V6zzd1x+UE43BMBfEQa9F0nUc/TYYexl0y1qR+9U6vuaV+T7OJJRxDHft63EqR
         L4naPKQ3Z+8FRDE/eROQdVGGNrM9Haq2RwSNTe7ysNfrf5RwfkBhPC05bLZ3LinnGRUG
         NsuYfz0sa57kHPfD4ZqhRuw9wZAnyKmptAmstA5DxACpfAk1yTRVfnAIrpmerIpX7jx6
         ZOMCnjk39X74xmZtEFDFY7W9o7jVSLr9yHa8R1idEw9LZDlGQV+14D/wcyPYE2h8eAPt
         LSPAv8HtYN/JhlHqcEurDEmISmb/V+jqFelSsJWP8ldW1aJLdJXFI9M0GetP6iHavUyB
         PCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776791652; x=1777396452;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lMUefLi5WLFFDpzONKvGSaE+pHGV5IKQnKH5bOuejr8=;
        b=EaqqueSspiNLpSt3RWnaYDRXTYfV2uhpWa1nh4Ov30IFZCPCkBnbh6MkPW1TKl6SGM
         GXolLKyKV/kP/bmN22ls6CLvX+9esQhMwFwL+AmrN/4ZmM6zQauwp296j+tVS3oBYlvN
         J5VkkOcHaSeZj8a640jOVmq0Am1oaZ/r7Z5yJft62y38KBXd4BEYrnaS3yftSWSfO6RN
         mE4+8wXqBh6KUcmDl4cWom/V7PgB7B3HYaGNEwuu1K9602MYPmgFcllJBqUjnYthxK5h
         K5OW7zSzhiOmx6v8vBwDO6GQnlgB/0dSDzOsE4SWu9rYnwe/3IWyEOCT1xdts22o5Ak3
         urwA==
X-Forwarded-Encrypted: i=1; AFNElJ/+YI7jvZVyiLadL+sHsH734JK5e9CMbgXNqljhB4fp0FnEPHuIB4I9KhQTQDjWjP7gTpAaEDjV82Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwB41EXTUH4/91lxyHDRjgh6n9vuhmoVN/83k/RzhUi6QjhuJU3
	k6a9pCE/VXUVN0s5myjTeOD25TP+e1G61jiuwUeoSeHnkhzVjBX4m01eT059C8IbUBc=
X-Gm-Gg: AeBDieu/GvuD+LhTV8/uwRk7vASmBSKk3yJeSYYlVCho1z7msRkTM0TATCzJ7h5oNrZ
	IJPNcO+3PeHRUL4qQFdtE0ITGjpJiMdVwj+24sWiDnVi7Gp/MfLz9Dg9f+vbMTvJbycynMSp8d8
	gTi/s9DkwOLV6Hhcjp8lEZXGtA16RDUCfxYcjEWdOjXRdfRQ3/STTOo3FnPLyf27me4JA+qAhH0
	esWKP86vJkuaYoiOcnzEFIedOi0HgSAQxP0KW+bKvtafhFjIpWmvV0Aj9XtoVkQqQgl7tb+GTEI
	Ve/a6eXZcwVj9iTxiNShyhOHOo8sdhaHpkKjQCVZ8aXGeFQ7kvON/iUyhMMgn9Dy0QO6s9DAXXk
	0D47Nn066in452TcDN/NTtFbxUIXNClNYZVejKv/8Lls6XKqM3Hqpro+aLnd95mubIDaKEKpVdK
	hLPtZlJpqslSFDC5z65zMopLc6AWNiM8LsrSiUg7w0gmM5uA==
X-Received: by 2002:a05:6830:8d0:b0:7dc:e38b:d9c1 with SMTP id 46e09a7af769-7dce38bda62mr402872a34.13.1776791647395;
        Tue, 21 Apr 2026 10:14:07 -0700 (PDT)
Received: from phoenix.local ([104.202.41.210])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd56bd0e4sm3393742a34.2.2026.04.21.10.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:14:07 -0700 (PDT)
Date: Tue, 21 Apr 2026 10:14:00 -0700
From: Stephen Hemminger <stephen@networkplumber.org>
To: Dan Cross <crossd@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
 netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
 andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, federico.vaga@vaga.pv.it,
 carlos.bilbao@kernel.org, avadhut.naik@amd.com, alexs@kernel.org,
 si.yanteng@linux.dev, dzm91@hust.edu.cn, 2023002089@link.tyut.edu.cn,
 tsbogend@alpha.franken.de, dsahern@kernel.org, jani.nikula@intel.com,
 mchehab+huawei@kernel.org, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, tytso@mit.edu, herbert@gondor.apana.org.au,
 ebiggers@kernel.org, johannes.berg@intel.com, geert@linux-m68k.org,
 pablo@netfilter.org, tglx@kernel.org, mashiro.chen@mailbox.org,
 mingo@kernel.org, dqfext@gmail.com, jreuter@yaina.de, sdf@fomichev.me,
 pkshih@realtek.com, enelsonmoore@gmail.com, mkl@pengutronix.de,
 toke@toke.dk, kees@kernel.org, jlayton@kernel.org, wangliang74@huawei.com,
 aha310510@gmail.com, takamitz@amazon.co.jp, kuniyu@google.com,
 linux-doc@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH net-deletions] net: remove ax25 and amateur radio
 (hamradio) subsystem
Message-ID: <20260421101400.67545b20@phoenix.local>
In-Reply-To: <CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
References: <20260421021824.1293976-1-kuba@kernel.org>
	<20260421065507.2c5e3ba7@phoenix.local>
	<CAEoi9W6ZRw6aEh62Xbgkg-TW8URHbVp6dHTT9krFiTkotjTuTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Apr 2026 12:17:23 -0400
Dan Cross <crossd@gmail.com> wrote:

> On Tue, Apr 21, 2026 at 9:55=E2=80=AFAM Stephen Hemminger
> <stephen@networkplumber.org> wrote:
> > On Mon, 20 Apr 2026 19:18:23 -0700
> > Jakub Kicinski <kuba@kernel.org> wrote: =20
> > > Remove the amateur radio (AX.25, NET/ROM, ROSE) protocol implementati=
on
> > > and all associated hamradio device drivers from the kernel tree.
> > > This set of protocols has long been a huge bug/syzbot magnet,
> > > and since nobody stepped up to help us deal with the influx
> > > of the AI-generated bug reports we need to move it out of tree
> > > to protect our sanity.
> > >
> > > The code is moved to an out-of-tree repo:
> > > https://github.com/linux-netdev/mod-orphan
> > > if it's cleaned up and reworked there we can accept it back. =20
> >
> > It would be good if these protocols could be done in userspace
> > or with BPF? =20
>=20
> Consensus for a userspace implementation is what folks on linux-hams
> seem to be converging on.
>=20
> The amateur radio protocols are more or less specific to low-speed
> links, they are not particularly coupled to anything else that
> requires running in the kernel, and the main coupling point (IP over
> AX.25) can be implemented via TAP/TUN.
>=20
> There are several popular packages that already implement AX.25 and
> NET/ROM in user-space (for the interested, LinBPQ seems to be the
> canonical example).  The main missing piece is ROSE, but it is likely
> easier to add that to an existing package, or potentially something
> brand new, than keep it in the kernel.
>=20
> There's no compelling reason to keep these protocols in the kernel,
> whether in-tree or out-of-tree; at least, one has not been
> articulated.
>=20
>         - Dan C.

Thanks, my other concern is carrying support for these in ip commands.
If not kernel based, then iproute2 doesn't need to worry.
