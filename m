Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52BA4A21
	for <linux-doc@vger.kernel.org>; Fri, 13 Dec 2024 15:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734104423; cv=none; b=Z0vHo1W+UP7Hdh98YTRjG7+kgMdz85vaNhB5RrJmBoGJM1QTqsFhWgtFpk92L0FExQcKj63kxNWjxwVJ+TXbtuOw6uCI8s70aOBz+SUTUfyKfHcycfhIZ1g6AOTyMLldWWbbQKCO4xG9PjV/sHG/wbrrPGCxpRxfoUyQsA16ML0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734104423; c=relaxed/simple;
	bh=Bunxl9aQMgx28QPwDNSeso5EOkCFGJz3ivE1sjmt6nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CgPwwUjig96Zn60tY4e67HAX28d2n+BQqBBT3s1fRIoprI4+VXvJiVTi5b4NZ2sXFN9X3hTIdTz3p+rhFRrb/cUauIzSPVnE+cs/ea9ftbkU3YGyD4XJy3WtcsWnuXLPmp7BHQJUq8Ht41d1laNlBwNGWXt11EDpYUvsbJgXlfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ptwlDFzD; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ptwlDFzD"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B05B4403FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1734104420; bh=Bunxl9aQMgx28QPwDNSeso5EOkCFGJz3ivE1sjmt6nk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ptwlDFzDRPwST+tJiUhRYwbDVMWGrAv1PeQFrptB0rS5pKqqqYlkwFiEbdt5iapfy
	 yEEimu5l3TCxr7g6MErodPijyTmX/oZ09j9XwhdhP/4YUiLVQJIReAKTqAGPswZtAZ
	 QO3EtupaAihkVyicjpq5CTQMMuzhbnqk6MASI2oi8dPDCg71HGxuF2SMmAqfjySkaX
	 25q0SD2VDiBgeiu4wCYy6WUYLF9FehREgGuNvmQ7W3zmzbbxjbhDUlOqcZijXs3TFz
	 +C1MxnyevsCHQm7a169qYFcZAsLjmLeFLWnRE67LajFoEPXPd6wTYW2W7WTX4OKOxi
	 rHX3JH7WqSTFw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B05B4403FA;
	Fri, 13 Dec 2024 15:40:20 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Christoph Hellwig <hch@lst.de>, Guixin Liu <kanie@linux.alibaba.com>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, Christoph
 Hellwig <hch@lst.de>, Chaitanya Kulkarni <kch@nvidia.com>,
 linux-nvme@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH separate v3] docs, nvme: introduce nvme-multipath document
In-Reply-To: <20241212080835.GA7862@lst.de>
References: <20241209071127.22922-1-kanie@linux.alibaba.com>
 <20241212080835.GA7862@lst.de>
Date: Fri, 13 Dec 2024 08:40:19 -0700
Message-ID: <87h677y4kc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Christoph Hellwig <hch@lst.de> writes:

> Looks good:
>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

I've applied this, thanks.

jon
