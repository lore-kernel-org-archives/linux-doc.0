Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D7E351C26;
	Mon, 27 Apr 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777306289; cv=none; b=U6JJMVx9SjE0pLEtITm5Qc9NlyO+qAVaZwKm/Upa0+2pGVZ3MxIGSvuph7ewV3+E/r9Z28eRT9GxZUJX3cCzvc3XY0bmF/LZrZUcl0CiuY02L9VUgqGrydezo5G8C24MsZdJCYMDFo/ENvBjqje5BcPdvbz1xQ7fVqL/p7wgZI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777306289; c=relaxed/simple;
	bh=gKo9yoKQkhuxhck+/pgVG+rmAMHFIGSk8/qsNH9qUkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SVxTk1nyhtUMDXIGd/Kf2560BkyvlK5gSxsm55fB7BhpQ8S2bsIUglOX67YcHAE3uTDbPlP70DjlsnBNUfPWN49xLrSjw65p4sRx9k2oZetMW6AUqus/xFDaDgF969eucvfceuwMjZmwkTUO2lKZLaCIROlXOV44OugMFqsg/Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3LEZavJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3LEZavJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15734C2BCB9;
	Mon, 27 Apr 2026 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777306289;
	bh=gKo9yoKQkhuxhck+/pgVG+rmAMHFIGSk8/qsNH9qUkk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M3LEZavJCbISUrJFaUF4rYRHYWT3nQh7W5rmqGPJMRQ011GpCDqnjCojNQxD7lyLQ
	 fB3jCD/9e3wUDdOWFuwbtUiREVNUnzCAoJ75jwwwWDhguXiHMckaazcD8kXnhMZdIW
	 e2VC2FHyUvlO+Ifkkrzx6VJzGi6r7N4mevPt6YEzSnH1OjY07LJ02IA463g6O5TccO
	 nKA2PpRulkL3cEEcV2TcH4pge1YnqLg4HLEPqE4atQkmya8sRmonF8B0N/RBqWV3XB
	 OIVf1Uj3ArJP7kwghlbWra63sJbBTG5hfzfi1V+XfxL+PLbJ3XU885En+JnKJrUWC8
	 KULOTFElF3NIQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: <Takahiro.Kuwano@infineon.com>,  <pratyush@kernel.org>,
  <mwalle@kernel.org>,  <richard@nod.at>,  <vigneshr@ti.com>,
  <corbet@lwn.net>,  <sean.anderson@linux.dev>,
  <thomas.petazzoni@bootlin.com>,  <STLin2@winbond.com>,
  <linux-mtd@lists.infradead.org>,  <linux-kernel@vger.kernel.org>,
  <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v4 17/27] mtd: spi-nor: debugfs: Add locking support
In-Reply-To: <87h5owh69c.fsf@bootlin.com> (Miquel Raynal's message of "Mon, 27
	Apr 2026 15:39:27 +0200")
References: <20260403-winbond-v6-18-rc1-spi-nor-swp-v4-0-833dab5e7288@bootlin.com>
	<20260403-winbond-v6-18-rc1-spi-nor-swp-v4-17-833dab5e7288@bootlin.com>
	<c8521e12e49040ce8683f81692644574@infineon.com>
	<87h5owh69c.fsf@bootlin.com>
Date: Mon, 27 Apr 2026 18:11:25 +0200
Message-ID: <2vxz7bps5qoi.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Apr 27 2026, Miquel Raynal wrote:

> Hello SPI NOR foks,
>
> On 10/04/2026 at 04:39:22 GMT, <Takahiro.Kuwano@infineon.com> wrote:
>
>>> The ioctl output may be counter intuitive in some cases. Asking for a
>>> "locked status" over a region that is only partially locked will return
>>> "unlocked" whereas in practice maybe the biggest part is actually
>>> locked.
>>> 
>>> Knowing what is the real software locking state through debugfs would be
>>> very convenient for development/debugging purposes, hence this proposal
>>> for adding an extra block at the end of the file: a "locked sectors"
>>> array which lists every section, if it is locked or not, showing both
>>> the address ranges and the sizes in numbers of blocks.
>>> 
>>> Here is an example of output, what is after the "sector map" is new.
>>> 
>>> $ cat /sys/kernel/debug/spi-nor/spi0.0/params
>>> name            (null)
>>> id              ef a0 20 00 00 00
>>> size            64.0 MiB
>>> write size      1
>>> page size       256
>>> address nbytes  4
>>> flags           HAS_SR_TB | 4B_OPCODES | HAS_4BAIT | HAS_LOCK | HAS_16BIT_SR | HAS_SR_TB_BIT6 | HAS_4BIT_BP |
>>> SOFT_RESET | NO_WP
>>> 
>>> opcodes
>>>  read           0xec
>>>   dummy cycles  6
>>>  erase          0xdc
>>>  program        0x34
>>>  8D extension   none
>>> 
>>> protocols
>>>  read           1S-4S-4S
>>>  write          1S-1S-4S
>>>  register       1S-1S-1S
>>> 
>>> erase commands
>>>  21 (4.00 KiB) [1]
>>>  dc (64.0 KiB) [3]
>>>  c7 (64.0 MiB)
>>> 
>>> sector map
>>>  region (in hex)   | erase mask | overlaid
>>>  ------------------+------------+---------
>>>  00000000-03ffffff |     [   3] | no
>>> 
>>> locked sectors
>>>  region (in hex)   | status   | #blocks
>>>  ------------------+----------+--------
>>>  00000000-03ffffff | unlocked | 1024
>>> 
>>> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> I don't want to be too pushy but this series has been pending for a
> while, there are real fixes inside, it (IMO) greatly improve the
> documentation, adds a testing procedure, gives a friendly interface to
> understand what is locked, etc. I am working on clarifying and improving
> the Winbond vendor driver even more now and I need these changes to get
> in for the cleanup to continue. Can someone bump spi-nor/next on top of
> v7.1-rc1 and apply this? Unless there are more changes, of course.

Yeah, my bad on this. I think a good part of this series should have
landed in the previous merge window. I was waiting to collect some
reviews on this before applying and didn't realize many patches already
had some.

Anyway, the series overall looks pretty good, although I didn't spend
time looking too closely. Will apply some time this week. Thanks for the
cleanup, it is much appreciated.

-- 
Regards,
Pratyush Yadav
