Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A34366541
	for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 20:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789071314; cv=none; b=jpcE3vrYDtwWJVREovjhvlEP9VkA5iRNiw7SX/8OHv1OnByDjn5AwT48JXfmQvq2PhTuOuc12er3PMu6vHT6uDcBWmB7dBzt561w1ceyz0zmUhhJBRf0Unk917oeeAHX0IpKGsv3P5S1EWQCNQV+yIl44m9tmr8SgO9EH8pMmuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789071314; c=relaxed/simple;
	bh=BrZ0dIJO0RkSkIme1mpNhpLe3Qd+sBUABFmqtsGuMCs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mPsdfzObKoYpmHe1J0nF4YQ/4ViYe79qAzsG4CRtznWGLLnGM4M7TiK2WQQmMt0DykCf6b1dwOTE6I6oCY4SidvzQzUQMPTkYSffAw9Wk9g2o/7JUWQfZ8Hcr0RrdCnUTx6/3FI7vx20zA47faQXzJaudo6aGGzrLtLJO2vq2oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k+IpoM7G; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k+IpoM7G"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ABFE1408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1789071309; bh=ha/vhdCtc/HhPMiInTFCkJKD+/NQy8sKr4wHTKv5dN0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k+IpoM7G7kRlrDk6O+iDdULMgfU6LAcixf8cXrQI3+iaIX5K1KN0A8Nbfx9ArN4nK
	 HFaj0tYjalmwtrQFV5g6/vbflhhBVihT8f95OsV8kdaW6qKdNqWDpr5ylbEGuFQAXo
	 jODRJv94YiqgMCwhp46pZyepz3nJhZlmdbIEi7CaEe/ZxYk4Txzg6dmp88zOwUjMLo
	 Ow5Y1FJNLuQ4u/z5FeOzERNIrc2enf7P4roz+sOURA4PfY0EVjvPW61UZ0fR64CUIP
	 XrabSZmGQlU4m+nRVpftSqfa/WEAeL8sSoGUR8B1wLHLHO8jxUZgpetzltIPw+sq/b
	 L7CQUwohAeslw==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ABFE1408B4;
	Thu, 10 Sep 2026 20:15:09 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Fabio Pereira da Silva <silvapfabio@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Fabio Pereira da Silva <silvapfabio@gmail.com>
Subject: Re: [PATCH v3] docs: translations: pt_BR: translate
 stable-kernel-rules.rst
In-Reply-To: <20260910195119.1723-1-silvapfabio@gmail.com>
References: <20260910195119.1723-1-silvapfabio@gmail.com>
Date: Thu, 10 Sep 2026 14:15:08 -0600
Message-ID: <87ecf0j22b.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Fabio Pereira da Silva <silvapfabio@gmail.com> writes:

> Translate stable-kernel-rules.rst into Brazilian Portuguese and add it
> to the pt_BR process documentation index.
>
> Signed-off-by: Fabio Pereira da Silva <silvapfabio@gmail.com>
> ---
> Changes in v3:
> - Remove Assisted-by trailer.

Why?

In any case, please slow down and take some time between posts.  Others
have to keep up with this stuff...

jon
