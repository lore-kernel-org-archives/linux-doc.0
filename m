Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4693E5A2A;
	Mon, 27 Jul 2026 13:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785158338; cv=none; b=ef5kKXfxB+EPXTyU0lMnGGrRzbSukQolgqNemaW2NHhlfEyv9FO33rWwxmuphsIZMBq69UVgvpvcmvmEVLl3tDK/ozt6kXjSMnqrw+W4FLvZphTD58xkAycp1ezC9EhT9Xghsj0Fy9AcLv2pSq2YOxz7Swd+E4nCsO4JcEejGLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785158338; c=relaxed/simple;
	bh=pM+P03VnGiIv6QN0GR1Zk3lGLWkwdUhU1ElI5GoC/h4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XEbDMmqjnrwyV1tJOZ7wwCjvBqpR8gerisN+AdzngzUDfaIh0txy4a/wtVQA0DzKD9SVGCYoq2GzxMf9R3qXP/HAqemNmFG1nMfb/nhRH/UAwZzUP6FkB+KfbQx9Yvt1atE5k9gmWFaSwFkVuLSsQXz9HtcF3RVLiYNXbtnuj4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rw3rkPCj; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rw3rkPCj"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 19D6A408B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785158330; bh=yUjSPVeM6aU2OiVUG71CgI8QcCCA+0Q5lcHkRuYVQ/8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rw3rkPCjJmn912eayhRixpdTaC3eiffHBjS6ys8I69WD0lzKqPZPeABHZx81b4I29
	 bB6v7pr7nA4jOdr0EpE7lFOijH8EKJA10u9vLL61oSpDwEmc/avDZxpibHiHvs6umK
	 jGIn+zyN2dhOgUVfTNqlEAOKDW5icytfo9dAulmW8/bt9eyLfd78hVnbDtAAX4O0IV
	 moMWL9uWB1q/iuTv1Q1iks5oCm9u8Zyu/Cuq937kJNqLo9CvsKkekTi0U8uqsC/Dpx
	 QzRJnhftSk5Zl8WiyauOcqNGczaQzLsiBqlOdk0z3W7x0G+V7zyXKjmHFM8zY3BoVJ
	 2+FUkXcc9XR5g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 19D6A408B9;
	Mon, 27 Jul 2026 13:18:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Chen-Yu Yeh <chenyou910331@gmail.com>, Dongliang
 Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC] Plans for zh_TW: prioritize maintainability over coverage
In-Reply-To: <amcZ5SI3-Hzw4HkJ@wyuan.org>
References: <amcZ5SI3-Hzw4HkJ@wyuan.org>
Date: Mon, 27 Jul 2026 07:18:49 -0600
Message-ID: <87wlugk1ty.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

> That is to say, we will deliberately select relatively important
> articles for translation and hope to maintain this consistently
> first. By avoiding the large expansion of the translation coverage
> we can't handle, it is possible to truly ensure the quality of each
> article that has a translation.

This seems like a good approach in general.

Of course, somebody is sure to point out that the *English*
documentation is often not maintained to such a standard.  We have a lot
of stuff that somebody dropped into the tree years ago and nobody has
updated since.  I shall continue to try to get the community to live up
to your level of diligence!

Thanks,

jon
