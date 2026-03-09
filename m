Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A6C3BED05
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773072721; cv=none; b=AK8DIUGjVlzit6hxU2ocnsUrz5WTbAvHNrb2hbfRPEQD65ZWNB9FIMAQOn4dtP0qD2amFjIoNDQJhR6Wf0qa6fov1uJRuS1K3YLkeq0hICnq7llIo7DvOHUS2hdmu3WDMDcEbkHkDrpSyJBJFtiBTcEYl9gNkwln502PTtWKWh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773072721; c=relaxed/simple;
	bh=LPt0dfila2NyBqZzbSxHIKbfVI0edSOfwcbjFT4it9g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g7qGs00kAmKHIeKi368vq5ujIfzfmEHToZbAkC3h/Hx3uim8xpeiuCbyTDFNdVKc0DMbVKzS9mFA/E1xIsWH9WeAYZITSGj28TRy/RANKkkoEKY2GITFa6IadNKNvqIl7szHj4SyTYMRol59ePTZEGGyMIB/8Irtp4ZwnFYQB1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r/wo5gNt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r/wo5gNt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7E11D40C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773072719; bh=YejBCxJ/HS7Hw1i90FheifYe1ic3iw2fKyDcxPJuffM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r/wo5gNtF0Uh/Mv1U/r7xU19jjJUbepas0Rt3pShXWS1fMiJZarysCSqgcJFAHKdT
	 kkKFxaDLYwGo7uM4lhdfj4LtgPXGPNtSME0aG0z1l6Gl2cx6xjlTtKzJpkACmmETDs
	 t6v04OPtdtCY/qm2O4Oo/UkJ6jdABx1Y8b8FmsOMrs2vvkVmBXEWAh/XNUT23krIS2
	 8OniJceIgOwUctYU2sIe/l0bJ9IkilN3A710y/sbFkkMzpQj47SRUYZUvgVnPRFkps
	 hHE+COYS4TEluDmQqosnmJhd2jfAPIsjWCQm46d9s5dPPGJM5O0eXEqjo1tM+wdT+m
	 hlYNATmC9ERew==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7E11D40C9C;
	Mon,  9 Mar 2026 16:11:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: bhanumaiya@chromium.org, Ariful Islam Shoikot
 <islamarifulshoikat@gmail.com>
Subject: Re: [PATCH] Documentation/mm: Fix typo in NUMA paragraph
In-Reply-To: <20260307114006.33183-1-islamarifulshoikat@gmail.com>
References: <20260307114006.33183-1-islamarifulshoikat@gmail.com>
Date: Mon, 09 Mar 2026 10:11:58 -0600
Message-ID: <87qzptvv75.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ariful Islam Shoikot <islamarifulshoikat@gmail.com> writes:

> Fixed a typo in Documentation/mm/numa.rst:
> -changed 'allocated' to 'allocate' in the paragraph about
> memoryless nodes.
>
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/mm/numa.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/mm/numa.rst b/Documentation/mm/numa.rst
> index 0f1b56809dca..b765295c6e85 100644
> --- a/Documentation/mm/numa.rst
> +++ b/Documentation/mm/numa.rst
> @@ -140,7 +140,7 @@ this.
>  
>  If the architecture supports--does not hide--memoryless nodes, then CPUs
>  attached to memoryless nodes would always incur the fallback path overhead
> -or some subsystems would fail to initialize if they attempted to allocated
> +or some subsystems would fail to initialize if they attempted to allocate
>  memory exclusively from a node without memory.  To support such

Applied, thanks.

jon
