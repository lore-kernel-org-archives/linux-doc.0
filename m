Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471BF1B299
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 14:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834893; cv=none; b=WfzKpDpdFTM/ec1ustHfNeyZY/uJCX5XZnD6r99pihr+38YPxTjCVCAmMzWL04h6ZRebEJ/Qlq1zFj8ngZb5bCjOhFlPKXxmAx3kNyNW2F/HM+ty0cByWPNLHmvhx3N6hJxZnp9WJszCJUmqEL6p/PCo0AR6BY5tGwAsvdC6b9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834893; c=relaxed/simple;
	bh=fOaOf3xN3gRI5H802Xas+WADPd41KxJY0dIvJXRvyXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=e9i9X1jHYsqtlPUQVwlPb7rrKKox28n1KKqRA2VCkr0XW8MbwLOGcifqe1XuAQ8I/5zSRti3F3SyOlE1nCa3d0iBSlUSr35RrYK4PkbIjngMFQyhENyPKJT6/hqLrWSlaqodeYG8zkQgKTv+O1RiWfzChp1HOY44tyme7Br5Ylg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WcRkboWJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WcRkboWJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53EC641A29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1707834890; bh=fOaOf3xN3gRI5H802Xas+WADPd41KxJY0dIvJXRvyXs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WcRkboWJuaQW2B2oCzXDmAmZWgL9JyQzdMW6qJKgYkktd7w5sMjHicVU2pYEPrIqu
	 DAclpkQLxA/1MJImHLGIu6rT3pU7YMpblHBX9sR/m96cB6FnBa/GEnJ3tvEM0UjhQt
	 QE5XZjNdiHhW987Fh5AM63uHzOVHG3HDdUbinmNBCoV7hxiUR0s340mHS1UF96aSEV
	 YA4xC28pkfo5weoobTFz6ulTH1tQysL/lwF9JLFuhqcDPr5PIxv0C95pOQP+Qe8Zpg
	 kJYjDeyXQqyy4TUDNBq+4t+zVaqyZAVQtcAHOrWFehwV5dKiy5UA7djir4AvmmT7jn
	 LEAxviCf/XFPA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53EC641A29;
	Tue, 13 Feb 2024 14:34:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Jani Nikula <jani.nikula@linux.intel.com>, Vegard Nossum
 <vegard.nossum@oracle.com>, Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: docs: "translations" extension breaks "make latexdocs" with
 6.1.3<=Sphinx<7.2
In-Reply-To: <87jzn8908u.fsf@intel.com>
References: <54a56c2e-a27c-45a0-b712-02a7bc7d2673@gmail.com>
 <37ecca9e-83f9-4f91-9b76-b5bd012dc3ee@oracle.com>
 <4806c264-1076-401b-bb5f-283fb7b68fb3@oracle.com>
 <875xyt8i67.fsf@meer.lwn.net>
 <8b51b6d6-0360-4f42-9b96-02e0ccd0b34f@oracle.com>
 <87jzn8908u.fsf@intel.com>
Date: Tue, 13 Feb 2024 07:34:49 -0700
Message-ID: <877cj877qu.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jani Nikula <jani.nikula@linux.intel.com> writes:

> "Note that the current builder tag is not available in conf.py, as it is
> created after the builder is initialized."
>
> https://www.sphinx-doc.org/en/master/usage/configuration.html

The command line is available, though, which should be enough to get the
job done.

jon
