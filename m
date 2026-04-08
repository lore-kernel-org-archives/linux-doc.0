Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF7F3101A5;
	Wed,  8 Apr 2026 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677472; cv=none; b=WR9/2TZeqiuoq3uL+lBmhEN9UXMOudZSW+6ONwBOK6Mo+Iw3nVoY+bjZN3oEr7UTzTxq8ATVHfLhKl3kfq9qRLuM83S6OzeskgjtVq+vASlreIlI5s0NTeI/UQwWR7tJM2RXvloDreZ1d/BSZLsz0rINwBcPDrsLeZZSypaExgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677472; c=relaxed/simple;
	bh=dv0Rrd8FRvHWChHLYVAdJ2E7yTTOnw6oCt8yvEaWei4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=q/2hLf1awVVjYjDeNNh2x1VK1GPO29LC/NR9OoxLxLNm8J90qPGQTwO/aSYLwSFnQD4YzBT1nxp3O2kQXtTrdUXTJ8DVTlv4tdm/VZEaohhm1LZkpqooBhCMbO7tqqek37Xb4nlqhp52vMUUcwuuj8UWU4MrtUkoxiogO6Ki100=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com; spf=fail smtp.mailfrom=mssola.com; dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b=nN/Bi3Mh; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mssola.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mssola.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mssola.com header.i=@mssola.com header.b="nN/Bi3Mh"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4frYRR5Ddyz9tVR;
	Wed,  8 Apr 2026 21:44:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mssola.com; s=MBO0001;
	t=1775677459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Qecm+tQ+Ywyd1ucb8nyib1pHP2cJ6XRw4E2UU704M40=;
	b=nN/Bi3Mh8onrJ7lQkVBymW89ZY7wj4OJ5zN2VKq7ZFHAc4iKVonYqEnXJs/JfXXu+JMjYC
	fzkojK3Sif9nH6JRjjY25weLM5N2rej4sZCwPbzGcmJT232pQC1m1q1C3/9vFt1nwBHVXA
	7ZUbOrsgvX+7mE13t2t5UFn9bmwjUR0SShw69RWHBUTaZ82hrGIF7juRzt44n43vzAP08v
	A2rMy8Cqc+cBvnl5Gu06J6cUdITpGWlqY2ZBl2g94Sh9vU48m7Bp0AWyQU+RiVoPSS3smG
	BbHN/s185HhaMqJAkmFmVb8W9V4FhLKCsQVFBn8pvknZnuLtl+rtcD8NQ7L6Eg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=softfail (outgoing_mbo_mout: 2001:67c:2050:b231:465::202 is neither permitted nor denied by domain of mssola@mssola.com) smtp.mailfrom=mssola@mssola.com
From: =?utf-8?Q?Miquel_Sabat=C3=A9_Sol=C3=A0?= <mssola@mssola.com>
To: pjw@kernel.org
Cc: palmer@dabbelt.com,  alex@ghiti.fr,  corbet@lwn.net,
  linux-riscv@lists.infradead.org,  linux-doc@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: enable HAVE_CMPXCHG_{DOUBLE,LOCAL}
In-Reply-To: <87sea63hmh.fsf@> ("Miquel =?utf-8?Q?Sabat=C3=A9_Sol=C3=A0=22?=
 =?utf-8?Q?'s?= message of "Wed, 11 Mar
	2026 09:17:10 +0100")
References: <20260220074449.8526-1-mssola@mssola.com>
Date: Wed, 08 Apr 2026 21:44:16 +0200
Message-ID: <87fr55qltb.fsf@>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 4frYRR5Ddyz9tVR

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-03-11 09:17 +01:

> Miquel Sabat=C3=A9 Sol=C3=A0 @ 2026-02-20 08:44 +01:
>
>> Support for atomic Compare-And-Swap instructions has been in the RISC-V
>> port of the Linux kernel for a long time. That being said, we apparently
>> never bothered to set HAVE_CMPXCHG_DOUBLE and HAVE_CMPXCHG_LOCAL in the
>> Kconfig, despite having all the framework to support them.
>>
>> Signed-off-by: Miquel Sabat=C3=A9 Sol=C3=A0 <mssola@mssola.com>
>> ---
>> I have built this patch with multiple configurations and ran it with KVM
>> (the VisionFive2 board that I have lacks the needed extensions). All see=
ms
>> to work, but I do wonder if we did not enable these for a reason or this
>> just slipped through. So far in the code I believe everything is in plac=
e,
>> and I haven't seen any commit in the git log stating otherwise.
>>
>>  Documentation/features/locking/cmpxchg-local/arch-support.txt | 2 +-
>>  arch/riscv/Kconfig                                            | 2 ++
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/features/locking/cmpxchg-local/arch-support.t=
xt b/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> index 2c3a4b91f16d..28d5fa8c3b4f 100644
>> --- a/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> +++ b/Documentation/features/locking/cmpxchg-local/arch-support.txt
>> @@ -20,7 +20,7 @@
>>      |    openrisc: | TODO |
>>      |      parisc: | TODO |
>>      |     powerpc: | TODO |
>> -    |       riscv: | TODO |
>> +    |       riscv: |  ok  |
>>      |        s390: |  ok  |
>>      |          sh: | TODO |
>>      |       sparc: | TODO |
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index 7e76b6316425..7c6726a8d738 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -151,6 +151,8 @@ config RISCV
>>  	select HAVE_ARCH_USERFAULTFD_WP if 64BIT && MMU && USERFAULTFD && RISC=
V_ISA_SVRSW60T59B
>>  	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
>>  	select HAVE_ASM_MODVERSIONS
>> +	select HAVE_CMPXCHG_DOUBLE if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>> +	select HAVE_CMPXCHG_LOCAL if RISCV_ISA_ZACAS && RISCV_ISA_ZABHA
>>  	select HAVE_CONTEXT_TRACKING_USER
>>  	select HAVE_DEBUG_KMEMLEAK
>>  	select HAVE_DMA_CONTIGUOUS if MMU
>
> Gentle ping :)

Another gentle ping :)

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJiBAEBCgBMFiEEG6U8esk9yirP39qXlr6Mb9idZWUFAmnWsBAbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyEhxtc3NvbGFAbXNzb2xhLmNvbQAKCRCWvoxv2J1l
ZcMAEACq7VYX1N8XChDr1rwM2yAKvKqM5RQEgy8GLu56W41XUjX9bJ6kHjONkc4r
IbduYPCCPwqfGsowCo6k7FW2OVdDApHwEzQht0NvV4xFv1MdByWtGKgbV/9L0jA9
/EFHWt4iKHnpRtVUNP6hy/M4lufeNiVJO13YPTuhhSQqhOfgZPIAf45T8XHWD3Bk
OnkkCr1iWmxVgXP8UWWkNlLbRvPig+DDBZabCpcI00O0s1KsirvIkmRZ4TvjzYCP
rIkq1ayLItClo0jthJgUV9NcF0X4kvpFSw2Zg3Xet6O2aWKep3zz1nkT6vW6UGzv
BqUtPn9O6pu10MAPnP7alqQze2Gf/DjsbXN96J1Ekq6oSpeh7fbrNUDo5KLzgrx/
etoXNzH0JXLXowV+3aD3+xgxtOUkbgC8xvgsl7Or4p488bpXwL7X+jZ5ezj6Gd3i
5do+RKK81xKaYe2Zshe7chgHu4Gbuv4l3C+S4vTxGnX9gGdxWT5B24s73uZMnkWE
x1U34D59cGJhSuqt2WM39Ehb6OmOpnL1BEh5Y0nBn34XtLtvzD9JKg4YC2YdyEOq
jgE29oxzCP7ToVACe+xKg943/+HUN7MsML4ZIjR3XC/GMhN3TcFoV2TXlHYOhba5
7z7qsem+tstMGgDm2j64PvCFnMDkr38LRhxdnhdbldM11pOpDg==
=1w/r
-----END PGP SIGNATURE-----
--=-=-=--
