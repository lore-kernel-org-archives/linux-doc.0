Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9311A46DFFE;
	Wed,  5 Aug 2026 13:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785936707; cv=none; b=SRf2A8ctdS5DzjSLhKbnft9xSDuQld7JSz3Ymf1AUbAim6ZplP631F01MrrJ4eawq5WtkC1cWSJj/O5mFvABr2zLfEV1kr/OObkbB4wZxqM6WnW6XncyDdtnU2MZ6ZSN+ohRQJhWOIWGXkbuyYnsRCl8m7CkQrKNgZYug7MweAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785936707; c=relaxed/simple;
	bh=wzdHx5gHrZa6BtYO2WjlbiAdMz0ylTPaSwyVHTSITYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Wlqyt1sU50KM5LovgjAGbGbdgBoYbQ+fEYWUwcwCBZdngc/6+6r+agdGkVqrI8HFOeJevVopaWFQJfKounXxnSA/3YbXzpWGzFB0ePTnxLWi+LuNA4KmkGDGMSZKLMSsDB1HtnBATW18dixdosFmGX76ZTpHi+JRNlbuiFvLGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=LbQoh3z0; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="LbQoh3z0"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E73C1408D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785936699; bh=wzdHx5gHrZa6BtYO2WjlbiAdMz0ylTPaSwyVHTSITYk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=LbQoh3z02Rm8Sx8lw+ILNMO7SeDHKZfqrVDOfoSvEElTY3280FgZQiQm5+nW9ft4q
	 NsBjzKyZg7VQfnjK0AzDB3gIOz70+rX7v/IUqsKvJLgjYWt9ejmyZtsx72iptnNPwi
	 lJB7LXp55PQ61a7JeXMM0Ua5GY6B9e7mlvlP/pQJQEcavvgXntzArgTNy/h0FPln8X
	 ooq5iEoQWyYGPD2ChB6a3Jxeeo4eBPl+X8LKwU9lVqB1Gtsxivo5wFEwT6u6MTNkr5
	 Uk5+KjMhZk3GG9HLyqHYj9hpeB03gjEIgpJzk+i9j3DLr7zYSvqGOHUQJDd52VwMDF
	 4QFvNMPdvvJRg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E73C1408D0;
	Wed,  5 Aug 2026 13:31:38 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <wy@wyuan.org>, Chen-Yu Yeh <chenyou910331@gmail.com>
Cc: Alex Shi <alexs@kernel.org>, Dongliang Mu <dzm91@hust.edu.cn>, Yanteng
 Si <si.yanteng@linux.dev>, Hu Haowen <2023002089@link.tyut.edu.cn>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] MAINTAINERS: update Traditional Chinese
 documentation maintainers
In-Reply-To: <anLkaTxwuklKyNq9@wyuan.org>
References: <20260804201012.110713-1-chenyou910331@gmail.com>
 <anLkaTxwuklKyNq9@wyuan.org>
Date: Wed, 05 Aug 2026 07:31:38 -0600
Message-ID: <87ecgcr8w5.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <wy@wyuan.org> writes:

> On Wed, Aug 05, 2026 at 04:10:12AM +0800, Chen-Yu Yeh wrote:
>> [1] https://lore.kernel.org/linux-doc/<20260603082531.263115-1-chenyou910331@gmail.com>/
>> [2] https://lore.kernel.org/linux-doc/<amcZ5SI3-Hzw4HkJ@wyuan.org>/
>
> Sorry I forgot to mention this in v1, somehow I'm not sure whether we
> have a strict trailer rule towards this one or not:
>
> Do we need to change the "[1] [2]" into two "Link:" ?

It's fine, no need to make changes.

Thanks,

jon
