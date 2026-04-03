Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBA3C5DC5
	for <linux-doc@vger.kernel.org>; Fri,  3 Apr 2026 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232406; cv=none; b=uKukPSuUd4W3lULQ8czLrvmfo5gmOXskRFtZ3plNtZaq2dLArVDPwatGSBvCXFRQXukIaUwo4d8MiAqR6gQcNcE+Klvz+c4xbKHfjRs0Mk9QGGdHFxm0NCGHcXj3zD9gSKjHq4/r8PcmhUncQMgQS/jGkfFS8kX7nZZhCkSx3/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232406; c=relaxed/simple;
	bh=t0EHngMNYsB2IiM9j2tQRnef+d8tab6F5xgT1UMQNwg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fnDPgyGG2ManMSaDlJiqTEaGD3bk8PBpwKd82AB67HEk4o6aySA61RMl9E51RrBMoz3JlwV39YaG1clKQKTifLUb40aeVvYSvM0FomRKBvRNhkOiqIEERi4mDLkd9tY494CIkaWIbJlMBGSRWwWnUFmdAQCzAX8RwO4Blxtj0ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=2Tx1mKPq; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="2Tx1mKPq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AD9191A312B;
	Fri,  3 Apr 2026 16:06:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 703EC603C1;
	Fri,  3 Apr 2026 16:06:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 049E3104500F9;
	Fri,  3 Apr 2026 18:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775232401; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KrVx7jihaMo4JfVPFc6GDwNKRrjQQHnDzJIXkqNJIFg=;
	b=2Tx1mKPqr6MGr+MBrfMLLJ7EKQyPlAHd+lPXQZazym6imMuJ10BcFwZxJ3Tkdz4VOmXNLl
	fqbziwHYlYvdSeJn99Qj3FsRy9ciSZwNxpNUVTYNdtBLaWRk++Ji2j3HvP7fO4hdJBPSZW
	1HWLavfhPgrYou6npZxg0jcOwPUuxa/eKtL1BPcodUfuEu7aOAHgPmTsxBHm3NFdHmBYo8
	zoUb0sGSk/Whv5/D3OC6A4bfoRFLjd6jnoZBJmJs/STJIO66Ud7kxgvqFfyeOWc7oMIlPy
	30Hdqch5+DaKmbe6L4E/VP09lKdFP2wiOm2awo2HDAw84feMgnaz3f69IZFyLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <pratyush@kernel.org>,  <mwalle@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <corbet@lwn.net>,  <tudor.ambarus@linaro.org>,
  <sean.anderson@linux.dev>,  <thomas.petazzoni@bootlin.com>,
  <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <ee2057a104d44d3dbfbedcf5b1ed80b2@infineon.com> (Takahiro
	Kuwano's message of "Thu, 2 Apr 2026 05:40:55 +0000")
References: <20260317-winbond-v6-18-rc1-spi-nor-swp-v3-0-2ca9ea4e7b9b@bootlin.com>
	<20260317-winbond-v6-18-rc1-spi-nor-swp-v3-17-2ca9ea4e7b9b@bootlin.com>
	<ee2057a104d44d3dbfbedcf5b1ed80b2@infineon.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 03 Apr 2026 18:06:33 +0200
Message-ID: <87a4vk58qe.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

Hi Takahiro,

>> +u64 spi_nor_get_min_prot_length_sr(struct spi_nor *nor);
>> +void spi_nor_get_locked_range_sr(struct spi_nor *nor, const u8 *sr, lof=
f_t *ofs, u64 *len);
>> +bool spi_nor_is_locked_sr(struct spi_nor *nor, loff_t ofs, u64 len, con=
st u8 *sr);
>> +
>
> It would be better to have generic helper functions rather than using SR-=
based
> functions directly. The locking_ops is vendor/chip specific and can provi=
de
> other locking mechanism than SR-based block protection. For instance, Inf=
ineon,
> Micron, Macronix (and maybe other vendors) offer protection mechanisms th=
at can
> protect sectors individually with volatile or non-volatile manner.

I get what you mean, thanks for pointing this out. Unfortunately it's
not that straightforward.

As of today, there are the "default" locking ops (SR based) and a few
others, chip specific. For debugging purposes, these "other" ops do not
provide any kind of useful feedback regarding what has actually been
locked. Only SR based chips provide this, it is useful, I want to use it.

So I'm going to expose a new boolean to filter out whether we have
locking support *and* if yes, whether we can use SR based functions, this
should also address this concern:

> Don't we need to check 'SNOR_F_HAS_LOCK' flag here?

We will still need to expose the SR specific helpers, though, but at
least we will no longer get inconsistencies with chips not featuring the
default SR approach.

>> +       seq_puts(s, "\nlocked sectors\n");
>> +       seq_puts(s, " region (in hex)   | status   | #blocks\n");
>> +       seq_puts(s, " ------------------+----------+--------\n");
>> +
>> +       spi_nor_get_locked_range_sr(nor, nor->dfs_sr_cache, &lock_start,=
 &lock_length);
>> +       if (!lock_length || lock_length =3D=3D params->size) {
>> +               seq_printf(s, " %08llx-%08llx | %s | %llu\n", 0ULL, para=
ms->size - 1,
>> +                          lock_length ? "  locked" : "unlocked", params=
->size / min_prot_len);
>
> div_u64() is needed.=20
> I got undefined reference to `__aeabi_uldivmod' for my 32-bit ARM platfor=
m.
> Same for following four seq_printf().

Good catch, I will fix this too.

Thanks,
Miqu=C3=A8l
