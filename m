Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6A4385D9F
	for <linux-doc@vger.kernel.org>; Fri, 15 May 2026 14:21:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778854888; cv=none; b=sYyShWlKmXUjBlOYQ0PrLtiqqHfqf0F8MGnEV0OFAMWUxXJ77q1XihNplujJS+euMl5QtzG+b7TukXgTYRp1Uoe4vggv66Uy26AQa7hhJtdCJ4nkyDGx9VVOAtCBDlG2sR71KEpb7nrtnQcMSnJM7Tc3TDy3iA5sElh08QNqKgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778854888; c=relaxed/simple;
	bh=BNfxLAZGBcPXoaR3PsCfk/x4P6g5Qfw5pCBIbTJ4KMI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Ml9wlJYtYslYM8bGi/CgLtULhK5JNMQLB+g0QTmmE4kBfXWdORwPPcec1lcb/1jkRlYc/vPzszKl5Zc/RTZaGkxQW+3DhmLrLkGSPIn8csl+s+WXp1TH31oEs8b4ianGlhvMXIrW56qZaFefXXybG7iJH4F8okr5zqvq9AA6Uzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=oIMSR9YX; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="oIMSR9YX"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D5624410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778854887; bh=88m8LZ/ZzXe/9musi2EiRg6FK8i38XMG3tbDEWGMhOA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=oIMSR9YXwHlWQniU7+cfopTg9Hl8QHMziwCllnDaxd/d0xY7xSdt8lf2VQeGBovF5
	 9OjASjA73GdiiFyZ806Mtn28Jlu1mm74Q9IjXWIAaM9hS8k3AQpV4/YyNieFIng1d9
	 os7rBt8luoTe5XOw2pJbq7BATefyzI1dIOAvWqQBHUsKRzjH0EA0WgbtTOXT63no8Z
	 B7ce+KqNNUisc0Uh2bDh7tX1N2ezpgSJic1E9zM1VuC1DnJ/2smbOVnq+jdlbGxgEX
	 ZqL6cXXxTNamS//SIMg38TGqElWWc1c6I61FK22GUBNA+8XWX20Qp7WctT8Tx6UYbK
	 imi+IzwcygPww==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D5624410B5;
	Fri, 15 May 2026 14:21:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: update minimal software requirements in
 changes.rst
In-Reply-To: <20260505194143.32009-1-danielmaraboo@gmail.com>
References: <20260505194143.32009-1-danielmaraboo@gmail.com>
Date: Fri, 15 May 2026 08:21:25 -0600
Message-ID: <87ik8orbx6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Update the Brazilian Portuguese translation of changes.rst to align with
> the latest English version.
>
> Key changes include:
> - Updated minimum versions for Rust (1.85.0), bindgen (0.71.1), and
>   pahole (1.22).
> - Fixed ReST syntax for internal references (:ref:) and external links.
> - Corrected formatting for tool names and config options using inline
>   code backticks.
> - Synchronized technical descriptions for udev, kmod, and NFS-utils.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  .../translations/pt_BR/process/changes.rst    | 52 +++++++++----------
>  1 file changed, 26 insertions(+), 26 deletions(-)

This doesn't build...?

> Documentation/translations/pt_BR/process/changes.rst:37:
> ERROR: Malformed table.  Text in column margin in table line 7.
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Programa Vers=C3=
=A3o m=C3=ADnima
>         Comando para verificar a vers=C3=A3o =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D GNU C 8.1
>         gcc --version Clang/LLVM (optional) 15.0.0 clang --version Rust
>         (optional) 1.85.0 rustc --version bindgen (optional) 0.71.1 bindg=
en
>         --version GNU make 4.0 make --version bash 4.2 bash --version
>         binutils 2.30 ld -v flex 2.5.35 flex --version gdb 7.2 gdb
>         --version bison 2.0 bison --version pahole 1.22 pahole --version
>         util-linux 2.10o mount --version kmod 13 kmod -V e2fsprogs 1.41.4
>         e2fsck -V jfsutils 1.1.3 fsck.jfs -V xfsprogs 2.6.0 xfs_db -V
>         squashfs-tools 4.0 mksquashfs -version btrfs-progs 0.18 btrfs
>         --version pcmciautils 004 pccardctl -V quota-tools 3.09 quota -V
>         PPP 2.4.0 pppd --version nfs-utils 1.0.5 showmount --version proc=
ps
>         3.2.0 ps --version udev 081 udevadm --version grub 0.93 grub
>         --version || grub-install --version mcelog 0.6 mcelog --version
>         iptables 1.4.2 iptables -V openssl & libcrypto 1.0.0 openssl
>         version bc 1.06.95 bc --version Sphinx\ [#f1]_ 3.4.3 sphinx-build
>         --version GNU tar 1.28 tar --version gtags (opcional) 6.6.5 gtags
>         --version mkimage (opcional) 2017.01 mkimage --version Python 3.9=
.x
>         python3 --version GNU AWK (opcional) 5.1.0 gawk --version
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>         =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D [docutils]
>         /stuff/k/git/kernel/Documentation/translations/pt_BR/process/chan=
ges.rst:71:
>         WARNING: Footnote [#] is not referenced. [ref.footnote]
>=20

jon
