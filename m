Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB0A15E5BB
	for <linux-doc@vger.kernel.org>; Tue, 15 Jul 2025 19:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752607709; cv=none; b=ZwOQjAJu7PK45VBH4PgzZwVtpw0ZPG0VWE9CEdgsAR4x6mBGlskW+HYnbCXyzx5lqeYoIqs4s56DEyWpOaUkxLHc2cx/U928EttMbnkUFhvPDXjqpOtGIZhDkxFSp+ABGLjweiqmBGVlAf04PVIzCMmLhHnfssepMa32QVF0dyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752607709; c=relaxed/simple;
	bh=89GWXGxwWrgOZH+7T/YYz20o8iXTMHYQljW3qW/pbcI=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=capdw68K1STfemC99SGBut/Fr7yV+m9E8f+B3zLu8k5xFlt+2SGkqILL3coEMrH+UpvUyhcFMKnpYyQHK6EGzJtQaLBalgAikb14D8nh+rRPWHVqzG3PXtQkNQGFVLB7NO/74VW3vZDOGSW7yxndBtNaUdvDnUz3iB0ed4t/sHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PY2n5Mdo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PY2n5Mdo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DAD104040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1752607707; bh=iwgVUYeMcl/AMD0BaZckE1s4YoNBzPVHiTn3f0ZHkQg=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=PY2n5MdouwHQM5X+I6y7nojakMnQeJYSkBLA+oeyHwC6jBKe7SeK4MP0L5+P0CEXq
	 HUjpSMhmURMtsDsNFZTXh/sZbCU0fqRkv5DXHpyhykpb02b6goYYfaJncQiF0Mj71k
	 NUHrNDZpS+IAs1J26GGu9Mpe9URczyuEIRRSQRgFG19NuG23oua/oAmRg4q/g1pdju
	 RxIrHtnu5xKFC60Xdgp4pouxvvQrgv1IO86a9hsMxWK5khy6i5CSdXsonFPJIVvhL6
	 4cGIlcsl3nBl5OzevnpVZXHsj8mEV0N8M9i1y/H1e69v/lNzmdWx4OjJx/2BwhHILP
	 Kxbxlm2BPr9bg==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DAD104040B;
	Tue, 15 Jul 2025 19:28:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>, Linux Doc Mailing List
 <linux-doc@vger.kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>
Subject: Re: [GIT PULL] Chinese-docs changes for v6.15-rc1
In-Reply-To: <CAJy-AmkHszv8wV2qjVuALNfF4dpmwfk4APavqXUso+ebkJtHNA@mail.gmail.com>
References: <CAJy-AmkHszv8wV2qjVuALNfF4dpmwfk4APavqXUso+ebkJtHNA@mail.gmail.com>
Date: Tue, 15 Jul 2025 13:28:26 -0600
Message-ID: <87o6tlfe3p.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

> Hi Jon,
> Please merge the Chinese translation docs for v6.16-rc1.
>
> Thanks
> ----
> The following changes since commit d3f825032091fc14c7d5e34bcd54317ae4246903:
>
>   docs/sched: Make the sched-stats documentation consistent
> (2025-06-09 16:23:58 -0600)
>
> are available in the Git repository at:
>
>   git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git
> tags/chinese-doc-6.16-rc1
>
> for you to fetch changes up to 744cc616b8d80ae57b6fdb3d23dd2fa27bd25d2f:
>
>   Docs/zh_CN: Translate alias.rst to Simplified Chinese (2025-07-06
> 21:13:46 +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 6.16-rc1
>
> This is the Chinese translation subtree for 6.16-rc1. It
> includes few changes:
>         - Updates to the process documentation
>         - Added translations for network and speculation docs
>         - Polished zh_CN/how-to.rst
> The above patches have been tested by 'make htmldocs'
>
> Signed-off-by: Alex Shi <alexs@kernel.org>

Pulled - thanks!

jon
