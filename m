Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95E7A8635D;
	Sun,  9 Aug 2026 22:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786314847; cv=none; b=NLfpIH01qSBlkA021H8acNckqYGzo+g4LYnaOuZ31LJceFO1dbFIAXTNuPDyqI49r5/zIlvHRo0do75JuHbvkLObDM2Qhq1PpyNBASOHxKqa1pAD3f47PvF3TNEpx08TnDHLKidylrv0zVk912NbECs3dd4KcnFxMdxjY05sCaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786314847; c=relaxed/simple;
	bh=/15t7AWw/TzOtDINLlxMOkx3uKUXNMkqtigPxMOULog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j0bXxmNIOUkfHvs/ecZuzroqS3RCSBMoLwCLOl/s3F51EFj5jSMzgYNJB/jZfsuqrfFzMtyk0HVhB48fGPvj+rpcq+BtoGbj5bkZAz526SK7KLk6ZMq/KaYr6IxcmIwnUhX7ic9yMs6EiuFUHnTjsGeAuAtsqaBPxfvYZ2KbbN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=QhDddwG/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="QhDddwG/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9B2AB408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786314845; bh=/15t7AWw/TzOtDINLlxMOkx3uKUXNMkqtigPxMOULog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QhDddwG/SEZL6RbMe9B7yieoEoaTRypZg6OrXuhslX5yC15DZnIgXGEpRdseoIdUt
	 bSsnP4TgzzY4D0+ThjRoOLA//6U5B6XsgNmrPGIMTFVUMe8Z6pETK16DdIM7/4G5DX
	 uBGK5XqzUDvtCYiiHAe6rMa2Y2eD2GPkEX+h3vhM9Xe+ThVMhXp5GS51/66A9SaBis
	 bvhDDyZvXH1Ap8Ja9YEhfsVwaM4NoUywtv3wPasKr2u10RFM3UonfLHvw7M7YcNNOa
	 hKPYbhyCeu/75/yoRtq3aSET309AI7aetguzcFmbyJfUHA+ZGJYvsvfrEoXvKVC10x
	 9nwErTkMHaC3g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9B2AB408B2;
	Sun,  9 Aug 2026 22:34:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Chen Miao <chenmiao.ku@gmail.com>, Weijie Yuan <wy@wyuan.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, alexs@kernel.org,
 si.yanteng@linux.dev, skhan@linuxfoundation.org, mchehab@kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] docs: sphinx-pre-install: add macOS Homebrew
 support
In-Reply-To: <CAKxVwgdjNjDLWpR2WPOdsXKhusobwq_52ioB5J15gdD2C=obvQ@mail.gmail.com>
References: <20260809101923.13176-1-chenmiao.ku@gmail.com>
 <20260809101923.13176-2-chenmiao.ku@gmail.com>
 <anh6axawbEiF37WD@wyuan.org>
 <49a6022d-7d7b-4414-ba61-4482ecca4b11@hust.edu.cn>
 <aniKpkE5iCCU835q@wyuan.org>
 <CAKxVwgdjNjDLWpR2WPOdsXKhusobwq_52ioB5J15gdD2C=obvQ@mail.gmail.com>
Date: Sun, 09 Aug 2026 16:34:04 -0600
Message-ID: <87tsp2j543.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Chen Miao <chenmiao.ku@gmail.com> writes:

> Thanks for the clarification. I'll first check whether the kernel documentation
> already has something like a "macOS kernel development guide." If not, I think
> it might be worth documenting this.
>
> In particular, macOS uses a case-insensitive APFS volume by default, which can
> cause unexpected problems for newcomers working with the Linux kernel source
> tree. It would be unfortunate if there were no documentation covering the
> things developers need to be aware of when doing kernel development on macOS.
> That said, I suspect this would be better handled in a separate patch series.
>
> Of course, if such documentation already exists, then that's even better, and
> there would be no need to add another one.

There is no such guide now.

Correct me if I'm wrong, but I *think* that absence reflects the fact
that Linux kernel development is mostly done on Linux systems?

We can certainly add such a guide if somebody is willing to write it,
and if it would be useful to people.

Thanks,

jon
