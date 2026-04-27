Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1358F3CAE80
	for <linux-doc@vger.kernel.org>; Mon, 27 Apr 2026 13:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777297175; cv=none; b=HDrWvKbjnaLMAEMa1MyPiDL8+ZMLaPznNgiGBid4E3cm1q2WemOLzB/oGBispJq8wWTzMAQELVux0sAIai/LbNriWTBHB9dZdGZrVSt72miEkvnqgZTfZGNC/8xI396uxKOmo4OBVWYKcUtXWiS/Mt2acXj/pBXwnrI8DCbCeAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777297175; c=relaxed/simple;
	bh=Y0VpK42OYFPVZikAyTfNSBvKDn3CI0iZPkZRiBCaizg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fRNFoB8Nt4LIbvX4zW/N1FwTJFNGO8CvMLfx+lfg6oB3sKiHaYtw9uMCb3XTRZghs74pWGEOAPlYqKDM1Mi0O2BOeJfMyvr+zuZp8CSt0yjsrEUmLWDCf+smqeNlePDCbtsCSc+SQvIMRhsHouRSliHP+x4G4G6+6hFtcrNj3FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0BnMPsQ1; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0BnMPsQ1"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 480EF1A3444;
	Mon, 27 Apr 2026 13:39:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EE3C600D1;
	Mon, 27 Apr 2026 13:39:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BAC70107281FE;
	Mon, 27 Apr 2026 15:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777297170; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=u0HjnDBlJRHnuFJtZhpcX7G+V9nt/9IjO9ARqXr88uE=;
	b=0BnMPsQ1Mmc9LvCCnGpqxVA1xDxrZqHjoeHF9/iGUyJIV3DgfY5EnNblpDt+Gi4wIq2/m2
	W7L2mdfEIpgUxtwz2M6bS2ibD5Vtiz4JFkdlVpzcwrAW55TssuDA+0+C9Ycl6S9LdfA7Zv
	gyC9kDdAvQHGS8BYWzZ9y8BPNdQfrZKAwN56HqsRT6GCJsjOhMN1T9ykLnd4phHO2NuVTx
	KD1B0MM5zBC7RpaWcHIdaWKSrMFuN5Ro0MawTW3n6h6zeB3gSDYL7WYYARytouoRgFp2SI
	8Ezvjq7bIs7hBIdKez/Zy9em8tj3DAAPxNRgWHHHDb37reO14YW1XFdCFXM9TA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <c8521e12e49040ce8683f81692644574@infineon.com> (Takahiro
	Kuwano's message of "Fri, 10 Apr 2026 04:39:22 +0000")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Mon, 27 Apr 2026 15:39:27 +0200
Message-ID: <87h5owh69c.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hello SPI NOR foks,

On 10/04/2026 at 04:39:22 GMT, <Takahiro.Kuwano@infineon.com> wrote:

>> The ioctl output may be counter intuitive in some cases. Asking for a
>> "locked status" over a region that is only partially locked will return
>> "unlocked" whereas in practice maybe the biggest part is actually
>> locked.
>>=20
>> Knowing what is the real software locking state through debugfs would be
>> very convenient for development/debugging purposes, hence this proposal
>> for adding an extra block at the end of the file: a "locked sectors"
>> array which lists every section, if it is locked or not, showing both
>> the address ranges and the sizes in numbers of blocks.
>>=20
>> Here is an example of output, what is after the "sector map" is new.
>>=20
>> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
>> name            (null)
>> id              ef a0 20 00 00 00
>> size            64.0 MiB
>> write size      1
>> page size       256
>> address nbytes  4
>> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BI=
T_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP |
>> SOFT_RESET | NO_WP
>>=20
>> opcodes
>>  read           0xec
>>   dummy cycles  6
>>  erase          0xdc
>>  program        0x34
>>  8D extension   none
>>=20
>> protocols
>>  read           1S-4S-4S
>>  write          1S-1S-4S
>>  register       1S-1S-1S
>>=20
>> erase commands
>>  21 (4.00 KiB) [1]
>>  dc (64.0 KiB) [3]
>>  c7 (64.0 MiB)
>>=20
>> sector map
>>  region (in hex)   | erase mask | overlaid
>>  ------------------+------------+---------
>>  00000000-03ffffff |     [   3] | no
>>=20
>> locked sectors
>>  region (in hex)   | status   | #blocks
>>  ------------------+----------+--------
>>  00000000-03ffffff | unlocked | 1024
>>=20
>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

I don't want to be too pushy but this series has been pending for a
while, there are real fixes inside, it (IMO) greatly improve the
documentation, adds a testing procedure, gives a friendly interface to
understand what is locked, etc. I am working on clarifying and improving
the Winbond vendor driver even more now and I need these changes to get
in for the cleanup to continue. Can someone bump spi-nor/next on top of
v7.1-rc1 and apply this? Unless there are more changes, of course.

Thanks a lot!
Miqu=C3=A8l
