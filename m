Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F088E2D12F3;
	Wed, 11 Mar 2026 08:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773217049; cv=none; b=GpTY703em004Q4Im8CwSl6VP6glAEr/OjSjIT9YaQ9eYWqFw5MmyJxrRrOJ9PKo2d8oUDC0hanoNOs0dBzqJoAB4Ga47r3QTNtXlB66b+uZsCkY3EXwfm4CyIaNCqJ8brPnE0reNcNLwKrKuESyvv2VJlfPRVemVGgKhhXtJmKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773217049; c=relaxed/simple;
	bh=abO+J9k1Y07FMSJTHJmX44W7VylsXRCbtmpu18yShNc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FRWS+Be/t+LVj16Zd2Y0jnFA1eXvQ+WFD8dLIpBeRsi991JYhRC5Tm+aLUa+YOhZDLEB37z4Fj+zWLmgWyK6yZKqtW+fUx2iicKk/o5sYRXqpnECGTiRHZJOF1JigO2HAZJ4CZ5EKSclciaqhv22lOJz6F8fLUfrqzyPj3YNuc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com; spf=fail smtp.mailfrom=mssola.com; dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b=yrcn6O9p; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mssola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b="yrcn6O9p"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4fW3Wc4NXZz9tm7;
	Wed, 11 Mar 2026 09:17:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1773217036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HVbE7XCLIawi/u9FQSgHONTfHdNScTIl0ofsK2VWYUE=;
	b=yrcn6O9pdFCOWtGFWrBB+buvKZi54udD+r2gZM39Gb8RLr3b2ka5DE8dNbgun7lE7f35Jk
	J/bCSrb2jQlq6BzOm5W/5HHrU8rlKmK3vzE6eVRpiZt/SxmQkQqSe3Q5LqxCWrONedkjD8
	8iG0pkIfGxLbH90+I7PGTcaKDqEFioQr/3M18HjhZu4D/VRROXo/WDc5U5dLka8FtqI3Rw
	GXVF8TTS61jv4YVRjbrAJJWBGeSvZj/h+IRuLM6/diI6cWPETE5lmVCWhQJEOpuhFljk8r
	ZLZx21Pox+Xo3UBSq3w3wu8ryghhya28xZ9ptpwqUBl/20xhNV91/zZ7XpxdOQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=softfail (outgoing_mbo_mout: 2001:67c:2050:b231:465::202 is neither permitted nor denied by domain of mssola@mssola.com) smtp.mailfrom=mssola@mssola.com
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,  alex@ghiti.fr,  corbet@lwn.net,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <20260220074449.8526-1-mssola@mssola.com> ("Miquel
 =?utf-8?Q?Sabat=C3=A9_Sol=C3=A0=22's?=
	message of "Fri, 20 Feb 2026 08:44:49 +0100")
References: <20260220074449.8526-1-mssola@mssola.com>
Date: Wed, 11 Mar 2026 09:17:10 +0100
Message-ID: <87sea63hmh.fsf@>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4fW3Wc4NXZz9tm7

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-02-20 08:44 +01:

> Support for atomic Compare-And-Swap instructions has been in the RISC-V
> port of the Linux kernel for a long time. That being said, we apparently
> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
> Kconfig, despite having all the framework to support them.
>
> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
> ---
> I have built this patch with multiple configurations and ran it with KVM
> (the VisionFive2 board that I have lacks the needed extensions). All seems
> to work, but I do wonder if we did not enable these for a reason or this
> just slipped through. So far in the code I believe everything is in place,
> and I haven't seen any commit in the git log stating otherwise.
>
>  Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
>  arch/riscv/Kconfig                                            | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.tx=
t b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> index 2c3a4b91f16d..28d5fa8c3b4f 100644
> --- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
> +++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
> @@ -20,7 +20,7 @@
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
>      |     powerpc: | TODO |
> -    |       riscv: | TODO |
> +    |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
>      |       sparc: | TODO |
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 7e76b6316425..7c6726a8d738 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -151,6 +151,8 @@ config RISCV
>  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISCV=
_ISA_SVRSW60T59B
>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
>  	select HAVE_ASM_MODVERSIONS
> +	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
> +	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>  	select HAVE_CONTEXT_TRACKING_USER
>  	select HAVE_DEBUG_KMEMLEAK
>  	select HAVE_DMA_CONTIGUOUS if MMU

Gentle ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmmxJQYbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZV+qD/42BfFHtrdjJOAGKsZ6+cKha1oRmZ5yMeHtoUCpaZKNRMTiErjvTmWP1JYW
xgRS/ygXR7uCk/6AMU/TDodVYoSAYf0aiUgUY31MVwdiAuKS47QFNcudT/amOPBj
ShwZmq1jlwC/ed8RwrrPw37q/u5IqGIcBKzrJiOo/WLxqWmhQWHBuEHXS31wMlHC
JcYsQ3fVaEjvgx1kJAxsVWZWyNC0xB4uhu/RqC8TzdI2EG2tVceDidlWMDdJytUo
rNS+Mxs8r94vXfVE4aijycvCu00KLuP3g7PjqTK6oB+2OYJNEJhJjvCC5jKPP6bu
o3KR+Tqg649SV4jPSbK1dgT2ky3YSeSPK2hd6511z0wnQ9fq90Fj1nJYNkgg1Wz3
w4+BVCOodwN9zmMPHrjyhkhm1B2/JB8gnDgD62VVVUhtVqHQXklbYgn2yeZpFgZg
gMp6qfFW9dpaSxGnV9OwYy/ufm4E6ixa9wsWuNH7VbV1ipP0iNhZZXMoDRlLot2D
ZsLQh9V7RDKUks5Qdf+FRzMVHaHIDk3lZlfbIwCn75LfZvsrIaRfQf8wCZGqnPBA
Len36N5XxlyqTq3/qtObyZMgLErVW6Z0qkB8IQtYAgTs2isLNul/2PrMY8Q1nuIF
cwKS/l8y0E8Pbh/4TE09kkDWKhjin4PlhPFUoVY672ptWzPQvA==
=vK1m
-----END PGP SIGNATURE-----
--=-=-=--
