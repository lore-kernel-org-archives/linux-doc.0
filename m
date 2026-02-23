Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33106369984;
	Mon, 23 Feb 2026 20:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771880210; cv=none; b=Nj3moX/BUD5HoTEE1germMpLLU/UXzfQpSfCPeaCv+rEnBNGAU6ed5rpeDnbdMRQA7TH8ClPJWtz51l2LlT33ZGqM5euP8qM8sCSSHL6mKT4W6eM8g1yP3B5J32nmnNj755RV3Vqmj0RoS8zYGzUaSXptIiivTT2HZ5suk4jQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771880210; c=relaxed/simple;
	bh=T1ObfTIgnYEaMxqXYGOWHjmarzC7i49+LCFQu8lzArE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=qV6U5/PHVHiBClPH4ZYoBndfOfclroE4jZeP/u4OJXZbUpqfgneIg88dZ+YcKA2ljj5Oex5E5EAzfwcckD9YAAOYuimK8ca/aVrW6nDPMMGEO7AR183ugs6EWcdF3aIrPMQkAwwIjYa4IwImr2sYl9kkdnMpzzJ5rESkrBsJXB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VlOZ4Riw; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VlOZ4Riw"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4957640423
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1771880208; bh=KoLNaG4tEEslkp3fex0XxCvHTAOxhO470inbqlQnYzc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VlOZ4Riws93d4wJN1JPcQ/GFJe5Osr5JZhbwc9hdzNpyqs54Zuck6jZx3zbA4/NV1
	 a4lIJ1t17FXYbUV82pPZkc5F3nbJbIEfvT1KimK1ovQKq+IA9ajAjSGCd7ecP6WSyy
	 jAZDzRVKpvZHgcdhf/kFv19TVZy2GtXjlDp7eeXTQq6NhKaw35AaBwBh5AaUXyVBT2
	 NCUGwInq/8Ym7mpTb6rtWH5JFL1wsx9kCiXI+KLbKLNF9yIoonDe30tHzfUSBj/nD+
	 XAIeunQJ7Wk5SxxxmwI+P5mjkj5ggjA5CbAQmZTBj3O+sn33iH9SK3fNe7zzuoII8g
	 Ms3RuASHnRBnA==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4957640423;
	Mon, 23 Feb 2026 20:56:48 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shubham Chakraborty
 <chakrabortyshubham66@gmail.com>
Subject: Re: [PATCH v2] docs: sysctl: add documentation for crypto and debug
In-Reply-To: <20260223203724.20874-1-chakrabortyshubham66@gmail.com>
References: <20260223203724.20874-1-chakrabortyshubham66@gmail.com>
Date: Mon, 23 Feb 2026 13:56:47 -0700
Message-ID: <87ecmb5gc0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Shubham Chakraborty <chakrabortyshubham66@gmail.com> writes:

> Add documentation for the /proc/sys/crypto and /proc/sys/debug
> directories in the admin-guide. This includes tunables for FIPS
> mode (fips_enabled, fips_name, fips_version), exception-trace,
> and kprobes-optimization.
>
> The documentation is based on source code analysis and addresses
> stylistic feedback to keep it direct and concise.
>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
> ---
>  Documentation/admin-guide/sysctl/crypto.rst | 47 +++++++++++++++++++
>  Documentation/admin-guide/sysctl/debug.rst  | 52 +++++++++++++++++++++
>  Documentation/admin-guide/sysctl/index.rst  |  6 ++-
>  3 files changed, 103 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/admin-guide/sysctl/crypto.rst
>  create mode 100644 Documentation/admin-guide/sysctl/debug.rst

A few other comments:

- This is the second v2 you have posted, which can only lead to
  confusion.  If you only change was to add Randy's Tested-by, there is
  no need to post a new version just for that; it will be picked up.

- When posting a new version, it is good to give a quick summary of the
  changes from the previous version, below the "---" line.

- Please slow down a bit, there is no need to post multiple times in one
  day.  Give people time to look at your work.

For me, there is no need for you to post a new version unless there are
other comments that need to be addressed.

Thanks,

jon
