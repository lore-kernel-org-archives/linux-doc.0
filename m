Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB09E1DE4F6;
	Fri, 21 Nov 2025 17:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763747306; cv=none; b=h+p8Nw5tpF7ZseJd/rUPudqSprJNtvi/KTn/B65UUY5csmjzqafNMlvfjsRntW7YqSXz7hJO/vhDMKtuMaqRaDcfob4Mngd974ovhfZMqXMrKWPNnkrHbn2WlxDwCIG9eTk+Qv9FyxZ3giEE6cYF4Q+G9mV1CBHFqXeNOCoeD1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763747306; c=relaxed/simple;
	bh=wxERG6i0Mb2vCbETIq9som2gvv0+eIiaVs0jWcQuni4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IwL1J3HAtgXANImS1U57vTzWZMg8qiWFHPW4iO8Trb+a+PyJwx3j64qenmN10WMfFqt40JVPh62CRtZTwW5VATtRw/tJYlCJBK/5o92668lTdCjCOwheBwJUtTzui0GZb2ecLbqNcVLUJ/BBhDuAnr0vF2N+QGOKADFSTA6ErFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RRbxVUNx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RRbxVUNx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0209440AD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1763747304; bh=FNzKWpQv7lDfglFx9RxULrTltnsu8Y95y71vG4fAv+0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RRbxVUNx/GIKSP+OJn6XfoM5lMLekByZsME8PooxFKsO5pOMBzondw4N4k2uslBqP
	 oVkpZzhGhmCVx9a+ZoN2iIOlZ1L/ZtUiBgIcqB/YXrgfgMIiq+a9PiHUOcfZlMctcP
	 vJzpKR10OV7a3NgBb1QNqx3xaeva9EFuWxUBcVRpFaCuThzOZ1e9uLGwaa7NobSqqB
	 UW6WTzv/yrl0HwMADYh9L6ASv/6MnZC5e31Wfdo2V+vMBQp+FdH+VuvkasKTo4eE5S
	 ZLN/BAirk4fjm9JM3FEr5Ev6uEjPJo7BpTzGx8crPpvVBRB5pZDkwP4YeMHi32q9fT
	 kiWwi7zh0Fg9Q==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0209440AD1;
	Fri, 21 Nov 2025 17:48:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Masaharu Noguchi <nogunix@gmail.com>, jaegeuk@kernel.org, chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, bagasdotme@gmail.com, akiyks@gmail.com,
 nogunix@gmail.com
Subject: Re: [PATCH v5] docs: f2fs: wrap ASCII tables in literal blocks to
 fix LaTeX build
In-Reply-To: <20251117122754.297742-1-nogunix@gmail.com>
References: <20251117122754.297742-1-nogunix@gmail.com>
Date: Fri, 21 Nov 2025 10:48:19 -0700
Message-ID: <87fra7tgyk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Masaharu Noguchi <nogunix@gmail.com> writes:

> Sphinx's LaTeX builder fails when converting the nested ASCII tables in
> f2fs.rst, producing the following error:
>
>   "Markup is unsupported in LaTeX: longtable does not support nesting a table."
>
> Wrap the affected ASCII tables in literal code blocks to force Sphinx to
> render them verbatim. This prevents nested longtables and fixes the PDF
> build failure on Sphinx 8.2.x.
>
> Acked-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
> Signed-off-by: Masaharu Noguchi <nogunix@gmail.com>

Jaegeuk, are you planning to pick this up, or should I take it through
docs?

Thanks,

jon
