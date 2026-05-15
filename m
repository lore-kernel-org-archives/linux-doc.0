Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CEF3B5F59;
	Fri, 15 May 2026 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778856553; cv=none; b=g4xbRU7CFH55K13gHi/ATbBy2c3kGmllxszVVRZ66SzOtSSa3jDX1+QYvi/e4ffX+wfcHdw0yhh543vZR2PACvenKSnhx486Sq12R0/99tsenP0KYaRuRSy/z5mzeKbAQzJLxDWFJINmXiRm/+hzgsuCzfaXVfjacgi7o+5WYB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778856553; c=relaxed/simple;
	bh=1Sjq22aJEbsG6MdLOFr2gVyF8MqklxJkNoGRS9bWaqQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sY7HR8ZG/nUb/+cF5XPiDn4TC3FQEMdTf7qQUyG9LO3X9wWTUl2fM1IV7SeK6hySls3jNgv8V0efLX6D79DrHQ1UkZY7KHRkkZslMDcIWaOfNi3eCX9DbDV3zj4BHyMrWDRE9YydrmPzPi2fGLKaVkXYwSvIWUJvprJD1ehEmY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=k7k1TMaN; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="k7k1TMaN"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 6B190410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1778856550; bh=8uqzxYu6gYjdnvZfD+hsZY+He0WXDi38JOLKnIGC1fM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k7k1TMaNVzwMtJaG/jupAfP5NVRFe8lmVV+ACvu8dnwzmn2/2swtUH3gVnLlXckOH
	 gZ/aH/qO1qVNx1dFKntEcewxGUALxPJ0v0TyRRxZJSgIMeFvOj1LKzi1gQCvRCF/hO
	 uOKdhmITa3zGyq8taqgDl8gYWhWXp7KNxi3HOYYJNlbqC4plulx4uFRS2zfyvbvUvW
	 MWJU8xIcjXJL13QwR5g00NTSPjJpu4tkPR+29gpwj76L97fwCLXceTu8XpPGCJsT2E
	 P77hK5uyUq10GsQLeZVIrCKFm8C90J84Q55pXGEtv6XF1PRlnUQZn9bmFfMeMOSOV6
	 ZcvpCtwtIIEhw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 6B190410B5;
	Fri, 15 May 2026 14:49:10 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Cheng-Han Wu <hank20010209@gmail.com>, Shuah Khan
 <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cheng-Han Wu <hank20010209@gmail.com>
Subject: Re: [PATCH 0/4] docs: admin-guide: improve workload tracing guide
In-Reply-To: <20260503101429.254394-1-hank20010209@gmail.com>
References: <20260503101429.254394-1-hank20010209@gmail.com>
Date: Fri, 15 May 2026 08:49:09 -0600
Message-ID: <87fr3spw2i.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Cheng-Han Wu <hank20010209@gmail.com> writes:

> This series updates Documentation/admin-guide/workload-tracing.rst
>
>   - Patch 1 fixes several typos.
>   - Patch 2 fixes stress-ng and perf record command examples.
>   - Patch 3 replaces a stale fixed "perf bench all" benchmark list with a
> description of the command behavior and how to query available benchmarks.
>   - Patch 4 mentions the kernel build system's cscope target and shows how 
> to exclude directories with IGNORE_DIRS.
>
> Built test with:
>   make SPHINXDIRS=admin-guide htmldocs
>
> Cheng-Han Wu (4):
>   docs: admin-guide: fix typos in workload tracing guide
>   docs: admin-guide: fix stress-ng command examples
>   docs: admin-guide: clarify perf bench all behavior
>   docs: admin-guide: add IGNORE_DIRS example for cscope
>
>  .../admin-guide/workload-tracing.rst          | 41 +++++++++++++------
>  1 file changed, 29 insertions(+), 12 deletions(-)

Series applied, thanks.

jon
