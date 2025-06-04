Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63EDC79D0
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 20:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749070430; cv=none; b=ZVoD9hZPIPmtbBCiao7wkGEek39WQVVECpVExjbWnOlUvffsIMz/SGvoOXf2NPAR2Pdek6YxutfLIHrLlrtlpighHDNjNDSYgoprZzCDMz//HgpFryJdd+Znh5ncrnlJ9OF3d41PJdMKAkR44GZTQUIrbY8PsSoNyxz2fCFjNiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749070430; c=relaxed/simple;
	bh=OROSKy3Og9lQdFOnnznByLrZfr2zEdVYbdApWk9da5g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UTL1VOJ8rMEhB3uDDn20V8DavjXkGs1/o5PqwTuuRW5uaVyLAgHJWIYj1v7CTa21qFQ7i/pHLu1IoXCn25o2tLCbQ5hvduShmdbsfsgeWv+k93wEpzDM1rcfZH+wtI7KVl8xIUfrvh9zwkiFG48+/aBU24GGvxEr2rn4MyaMeUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZX7KRZn0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZX7KRZn0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5773A41AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749070428; bh=gpDyEV+r+zqnC18GiMqJFdyewtaqw9X/wEKUp35R/3c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZX7KRZn00BHkI7HzxpLrHzeVNcv0m9CcWThgX0+ztXUmtYPo1abV3iIrqjaA8xzc/
	 t7sqjOBASdQpbiyOdc0qb4ssmi+Nl7ggJhXzBkLEI3B5h0+ab8Hk0CEnbjiWYihufM
	 Sa+JgS7SqXTcGdTjPzGZ4WphI9dJRpVO9W5hs8LPrHKIENMUai3fqw/e1IUIvwYER6
	 NyMMh+iX7K/rwJxcVStS2+AJF3V9KefuhtWuK+X5QEQVxsQy5P89SpRWiYe5yLTEqS
	 TvPCMjRm6/hPLAAxQClLwa9JJ6UOi0wYOKpXRHXYKg7a37GzxPSm5DBgYBZvb4AZ8C
	 78p/NE7GXJD8g==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 5773A41AA1;
	Wed,  4 Jun 2025 20:53:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ming Wen <mwen@ambarella.com>, Rongrong Cao <rrcao@ambarella.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>, Long Li
 <longli@ambarella.com>, Jian Tang <jtang@ambarella.com>, Zhao-Yang Chen
 <zychen@ambarella.com>
Subject: RE: [EXT] Re: [Kernel 5.15/Kernle 6.1] About Sphinx Doc.
In-Reply-To: <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
References: <IA0PPF7478C2D3A237C6EE1AD359301D79BDD802@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87jz71lstz.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A0AF4E32EE1ADD91EBCD5DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <87bjsdlp6o.fsf@trenco.lwn.net>
 <IA0PPF7478C2D3A47E070E5B5E2A74A7DE9DD832@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3ACE380061479DF07A6EE9DD892@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
 <CH2PR19MB47320DFD7A542B842C42C4F0A188A@CH2PR19MB4732.namprd19.prod.outlook.com>
 <IA0PPF7478C2D3A5F61C0E93BF2EE5CA242DD88A@IA0PPF7478C2D3A.namprd19.prod.outlook.com>
Date: Wed, 04 Jun 2025 14:53:47 -0600
Message-ID: <87bjr3i5yc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ming Wen <mwen@ambarella.com> writes:

> Thanks for the update. Good to know!

> As the next, Jon may help to check a bit why this changelist is missed
> to be merged into LTS Kernel 5.15 and even LTS Kernel 6.1. It should
> definitely be needed.=F0=9F=98=8A

So I have *finally* had a chance to take a look at this.  For 5.15, I
can certainly ask that commit d69dab7de208 be backported (I'll note that
anybody else can do that too).  BUT: that commit was applied to 5.16, so
if there are problems with 6.1, they lie elsewhere.  That makes me
suspect that this commit isn't the one we're looking for?

jon
