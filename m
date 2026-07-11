Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0982D2BE7BA;
	Sat, 11 Jul 2026 20:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783800275; cv=none; b=EkAT/6AaWHs0kSCtsekFGpwLpFEIN0jsLnEky8cm9UVaL9D5huwwtsy4ub45UDUDnT9z2v4EnqYe6TrO9bYhJmyu9rpaN+1ansmFW+eD1DX5Z2TUX1X+E2tYtCxXGlEOfzZU38AkKeDP+nwro6yeyaCHcfiMkasdHDC/KNAJa1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783800275; c=relaxed/simple;
	bh=8PAjzyzotNfNkhIWlz+EkjTKIq1DPAA6PfmvB8HHQYU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WDbOR8vOCditko1rqTxPrB4N98W5oE78SP/ohaIfa4p9odjwUMbI7r1PT81pQDbxHilnJPbFmTjrqNo8VInomTZbBhLoLsH+gTRdB3QhY4DOP3VdXxzXePN00XfqBdBEuotoudh0/w3TETh9d1/sq0G0CnP8lZNLLLFT13TOD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WR0XSoB5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WR0XSoB5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 55BDB41208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1783800267; bh=zzLfj0cWWPBie2fjoCifX65Wz2c19+KLNqSDwP66S5I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WR0XSoB5Fj9QNVxY9cl+jM61bqt/+GLZ4biaGXI2bA6FI6eSJZPt9eBVH91hVw+t5
	 O17CUuvo1R1XKaGPJwCFoncD3S9IsB1134Z1WsZm0tkVSHT/v9FBLebUkcL/ANKw8i
	 hzxiD01B/PCGsOOzq2ovG5Njp1U4OJ+ZMr8ix2EiMC3zAB7nejy5AzGtGlFN9dKXi/
	 2w4WCXN/7UCnhXFgtzCZoCwFDxFWB9p93zxNclzCqxb49qnhtnVDmz2jhzXgtmaW5u
	 i865yc/tyFUCUEWLTqgguhN3yR7T1xnsck3eWXhxOg8EewyieT+XvQufAR5396Ff+I
	 y8eAFLM4b8GTA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 55BDB41208;
	Sat, 11 Jul 2026 20:04:27 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, =?utf-8?B?6JGJ5a645L2R?=
 <chenyou910331@gmail.com>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, Hu Haowen
 <2023002089@link.tyut.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Dongliang Mu <mudongliangabcd@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yuchen Tian <cat@malon.dev>, Alex Shi
 <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>
Subject: Re: [PATCH v2] docs: zh_TW: process: localize terminologies and
 improve fluency in 8.Conclusion
In-Reply-To: <alJ7ocaqtpUkCGrd@wyuan.org>
References: <20260603082531.263115-1-chenyou910331@gmail.com>
 <CAKspUh+2ndK1qMP58hPPmvwczruCikEuaO2tmyw=APCGrd9yaw@mail.gmail.com>
 <alDs8bnIK8bWApIr@wyuan.org>
 <57e42f43-44dd-4b22-8d81-c88e20016138@hust.edu.cn>
 <CAKspUhKh=cT_ks1hH9B4G8KppR=XT+THHsmNUFH_irX6xo1SZw@mail.gmail.com>
 <alJ7ocaqtpUkCGrd@wyuan.org>
Date: Sat, 11 Jul 2026 14:04:26 -0600
Message-ID: <87wlv1i985.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

> How exactly we define the position of Traditional Chinese or zh_TW?
>
>   1. Simple conversion between simplified and traditional Chinese
>      characters
>   2. Taiwanese localized traditional Chinese
>
> This issue needs to be confirmed by the senior maintenance personnel.
> (I will review the archives to confirm. If there is already a clear
> definition, please forgive me.)

"Senior maintenance personnel" in this case is the people who actually
step up to maintain this translation.  There is no higher level of
authority that needs to somehow sign off on it.  The existing
translation is essentially abandoned; if somebody wants to carry it
forward -- and stay with it -- with a shift in focus, I think that is
just fine.

Thanks,

jon
