Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47B0318ED7;
	Tue, 13 Jan 2026 20:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768337720; cv=none; b=c+IRnjboJgxxkh7spiImpOdLV3Dz/mVeJf+aS+DqxxPViNTFaYYDLq3yYaxULGAqBTPUG8ClZkuL6TlG9xtr1B2g5j9HO9ZSEmnT0mcioybk3swL03uehYWxvHNgOBIj6LB9F758aoXI3NQVp8hyyTQdmvboXpatzT5NrvEfuUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768337720; c=relaxed/simple;
	bh=vzmBt0z3ma4hD/j+DxSwzTLyRYqBVqCQiNr/41uZak8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j5iyNMf+O8RNkxshWa8O98EuwXlAVv8c9BIXjXggnmUkyvFuKHToT8Fb5SUfR3moKYUWidG/eMqRnBAQl1Gm1fGvD9Mj0faxPnVYfl3qD4P37APxW/++PrckJ+Ykhj19Lu9Z49qzgzUcO7GfoM57oDiD/i3fXHw8MuS8V3cwhmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UahJVn7v; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UahJVn7v"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E94BD40C98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768337719; bh=x1JYO/TQ31Tlov5BDVCdRVsRD+gv/KU3j/7jwQGQk/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UahJVn7vVLrbh4cGPer6OxHtixLKYv9nxRDSbQRUD6zF4t20CcZIcs//9URoL4Njq
	 knTfYe9LLBqQ4+7vuFn2zq05fIb3R3xMZwJAn1MtQoCGwHDaGJx9RUPi+AepvcVLw+
	 z5rmFKlyn0XYB6hlcFHikDtDxFTRflqCLLz8HPQ4syEaBjwOTVnV84RyUlxzQbBatg
	 f65A0BvW8KSc3g/zwBpqSuJhHllsuuvdDKYZCiRLCxoIn/st0E2R7NQt68vI0eeQCV
	 VylMQqhq6428xURmFFKD/FRg/Z2TIkcWMHXIIn9+mnX3fU9x0r1fNfcVLBP8Q1UYVB
	 VLx+ty6k0V/iQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E94BD40C98;
	Tue, 13 Jan 2026 20:55:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Shuah Khan
 <skhan@linuxfoundation.org>
Subject: Re: [PATCH v3 4/4] scripts/kernel-doc: some fixes to kernel-doc
 comments
In-Reply-To: <434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
References: <cover.1768324572.git.mchehab+huawei@kernel.org>
 <434e60e7868ef4e001e81e8cfa872dec711ddd34.1768324572.git.mchehab+huawei@kernel.org>
Date: Tue, 13 Jan 2026 13:55:18 -0700
Message-ID: <87sec9w7ux.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> There are some typos and English errors at the kernel-doc.py comments.
>
> Locate them with the help of LLM (gpt-oss 14B), locally excecuted
> with this prompt:
>
>     review English grammar andsyntax at the comments on the code
>     below:
>     <cat scripts/kernel-doc.py>
>
> Not all results are flowers, although it caught several minor
> issues there. Add the pertinent fixes, discarding the bad ones.

"flowers"?  Did the LLM put that out too? :)

The changes themselves look fine.

Thanks,

jon
