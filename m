Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B24324716
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 16:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779465976; cv=none; b=IpKEHpF0H/ULlCy2wOyE8bUSlP68BabceNE0FTYuy4Sqd+a1tRDfTt5nhoBDf6ttEhQ8JfmBVEsmKueCRKs0ylgD+/mJ1B9NOkDoTZQe3aouH9KebNZhvTootV8S50BrSUZkUQZHWvo+nFp4rwp42VSrc01rUMOVxob34djIpT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779465976; c=relaxed/simple;
	bh=9xacnRpg4W5meEuTwneUnNV8XO5zOlIIsbg3+CODjXM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=R96RNVPvTIqfDybw/PjUxK29R6G15KojYfuT7RPP/EC2cO+wHEWKZcz1F67b+IToEcIJtlm7T6dY2/fewFvFlts2pkO8AoTvXzWwDa8nXDfU2ZI212ai/elweFrCKJCezalaPp6Nxt40DIFwODNESVxNd+zSRXUtsfOVMC5RASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=IMCSY/AC; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="IMCSY/AC"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A73441A3670;
	Fri, 22 May 2026 16:06:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71E0C6003C;
	Fri, 22 May 2026 16:06:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1590710811604;
	Fri, 22 May 2026 18:06:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779465970; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=9xacnRpg4W5meEuTwneUnNV8XO5zOlIIsbg3+CODjXM=;
	b=IMCSY/ACLu9CWZgXj+dk/78nIdJb1q0gucT4uxcTaETe+wbx1NSPPUMewxeGUHlNFzVttv
	Y6j6AU1i7+rN7/WmASadM/ByNeQ5gN/DIndccxv4HZzFqyrYQHRWaU6hC5/1Vjrq7w6EA4
	EoJe8r6obpNICdEY/KCUJJ/86P3V3Z4DqDAETHPee2wT0Z6x0v2xVFXz/CZps168rt2UNG
	XUGqjrtSXqZi34Hx+0JXW9JtiCcSHzPaADU6AL8NihbLleMWvjBplBUTKmOOX7AkV1Ydif
	7cUd88eKeamgWqGqFYTgnx4tSbS6o9PJyFPXmTobz1nFOV1Opb8sfM+/fEWHYg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Takahiro Kuwano <takahiro.kuwano@infineon.com>,
  Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Jonathan Corbet <corbet@lwn.net>,  Shuah Khan
 <skhan@linuxfoundation.org>,  Sean Anderson <sean.anderson@linux.dev>,
  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,  Steam Lin
 <STLin2@winbond.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 13/28] mtd: spi-nor: swp: Create a TB intermediate
 variable
In-Reply-To: <a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org> (Tudor
	Ambarus's message of "Fri, 22 May 2026 12:39:48 +0300")
References: <20260507-winbond-v6-18-rc1-spi-nor-swp-v5-0-93453e1a9597@bootlin.com>
	<20260507-winbond-v6-18-rc1-spi-nor-swp-v5-13-93453e1a9597@bootlin.com>
	<a54562a0-1a75-401c-9508-8e0322d81a3f@linaro.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 22 May 2026 18:06:06 +0200
Message-ID: <87zf1ro2dt.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3


On 22/05/2026 at 12:39:48 +03, Tudor Ambarus <tudor.ambarus@linaro.org> wrote:

> On 5/7/26 7:46 PM, Miquel Raynal wrote:
>> Ease the future reuse of the tb (Top/Bottom) boolean by creating an
>> intermediate variable.
>
> Please squash this in the patch that needs it.

The problem with CMP addition is that it touches all functions all over
the place. I want people to be able to focus on the CMP addition, not
all the side changes which have nothing to do with the CMP addition by
itself. Most of the preparation patches are just steps in that
direction, they could also be squashed, but overall they make the final
diff much simpler. I believe every small change making that last step a
little bit easier to read goes into the right direction?
