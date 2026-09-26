Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C238D47ECDC
	for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 15:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790436127; cv=none; b=Lr2N1u4IMtJofH0f8kVH7Ly5ZoRBJo4h6SN80UmPhHIDt+ZHtJBLUfeqJVZzL+UXk/NUmU8Vm2FYMFZFL111MVdbPRwdSYSWDyeitIDE6kLqXq+qewR4fmcPUvZXUmy8z7+MoGlxj4VmgxxuKgnP8gXM0ErQ4q6AHzpOJeUrLkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790436127; c=relaxed/simple;
	bh=+jWXvaNTSjNZuMOSIS5rjyzFBQd+MVonG4ESCLmodYo=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fENHD6jY+CeRHQUHRzm+HVqOM0hS1syp31tPcWK+NqFvnmdU1G9yqf72Q3JX+qD+Gt9piLZ2b9lJ4ELdeNCfsl/K5L7fAX97D8YKsmD2CAywHY3pCZ3dmgnwS186m2jehFJQBbwvSeL2YYeFZsKeS8XWu9GJPg535PKgyKa2shU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nDn/YQPx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nDn/YQPx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 94DED408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790436122; bh=TV+aJt4SU2TYbYaXxFA9SFPaoAaICL7sSXNSNONy/Sw=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=nDn/YQPxsmYgjHq0dl8Ek24z+JsVBFwNgBU+4+SqfKqP8W76AciMttDMss85g/1p1
	 YiHdqwoHeW3MBQpU6nntgRzaysZYGTl/OenxyVgLE7BzF8L+mDMS7BdFh74Q7GO2E1
	 MjABjHgQOAHAIkQNMqjL8XIobosp5vgyeDMkElLmtE1l+VAqNWn1DK03khRau8bwMA
	 rQZdL3tqpIkyMklzDCJ1HEVCUDojdayIQ+e9aZ1wHle/lgDr4avV3oUv8vEP3IcfCH
	 YsNHIGh9RcNNSGoXiPO150I/3/TnqO8E7Is3MkCe+YPC1P9E0njmolLyMF38eaiRc0
	 L5ZIzG8wm3t/A==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 94DED408B3;
	Sat, 26 Sep 2026 15:22:02 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Alex Shi <seakeel@gmail.com>, linux-doc@vger.kernel.org, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [GIT PULL] Chinese-docs changes for v7.4
In-Reply-To: <47c04ef4-814e-4055-88ce-8cc9057f9c04@gmail.com>
References: <47c04ef4-814e-4055-88ce-8cc9057f9c04@gmail.com>
Date: Sat, 26 Sep 2026 09:22:01 -0600
Message-ID: <87ld8o3una.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Alex Shi <seakeel@gmail.com> writes:

> The following changes since commit 322695d64f868da8d1091ea93c7c8f47bcc41220:
>
>    docs: ioctl: fix stale NVMe registry entry and note N conflict 
> (2026-09-15 13:44:43 -0600)
>
> are available in the Git repository at:
>
>    git@gitolite.kernel.org:pub/scm/linux/kernel/git/alexs/linux.git 
> tags/Chinese-docs-7.4
>
> for you to fetch changes up to 2dc934836234303798c818467c4fe8d254ffc4ab:
>
>    docs/zh_CN: link to Chinese applying-patches translation (2026-09-21 
> 15:27:30 +0800)
>
> ----------------------------------------------------------------
> Chinese translation docs for 7.4
>
> Update the Chinese translation subtree for the 7.4 release cycle:
>
> - Refine docs/zh_TW for improved Traditional Chinese phrasing and 
> terminology.
> - Adding/synchronize doc changes across DAMON, networking, and other 
> sections.
>
> Tested with 'make htmldocs'.
>
> Signed-off-by: Alex Shi <alexs@kernel.org>

Pulled - thanks!

jon
