Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E3B2AEE1
	for <linux-doc@vger.kernel.org>; Sun,  3 Mar 2024 16:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709482823; cv=none; b=tXxhYrlR/fiBXE0C3DW4kTliDnwWE7bjF7LXgkddMKo5OnvIylaSenSse5S1HM0XywJ1ALea1ZODJAC7yIPBClHoyNSDftIZNiC1nO16ILeJzr1E1u14g7i5HRvoY7jgE/IaHQd8ecMTSSk4v8z+sVtXNQlKJbHA4h9ITKWlbkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709482823; c=relaxed/simple;
	bh=1AAo5qZIBtGTHg6wE0s4eXXHNPS9AnJLHIF2p5c1eWo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xo/iOpadBzDWQViF9lgQtCpRbYpurWkLh7PZdidPEJC79NFeDf6g3ab9iUsMw6i5xbmjBDmPwewpBu4zGLbiSYmL8As5y/pPUuN8OTx/jadFG4NXYAtto1eY5D8G9nfT63FcxMJ0G8y+pABqwGUsORpi0JGNOYx/IdtWdfjJPaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=b/I/i52R; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="b/I/i52R"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36675418B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1709482821; bh=O4+xMPjhtW3lSWX1A5Fkz5k0Kp6L4+er9UsJYXIq7wo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=b/I/i52R89ng4f1SZS8jBzW9GK7WhNYuoteu9+Dizl8RaLUSSYY31dZnS0stTduvi
	 XHCwGJTFzWOehzN1EN6uIMdDfXqbEiz4tMK/+1ZUp8LyBtjWmmR9XGt749eAgwyRCD
	 irHRd0ERjN6Ydg/Grc3OwP678tXcDN8WF3dvADcjF0Lh13geuNIrkASccB+K6WMew1
	 u08ItK7a1RQk/tSOILsUhbywJ/nn3pPIbfotm2BJfNvE1prOQw99/9+2Lwm6RAH0EY
	 QEGCSKYzhlfxni93u/lcrTnBn8xh0XTCZJJ3dYw0T0XqEyxOk4nq1mnJbdIjvAI0dc
	 a6tUU00AWFPSg==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 36675418B6;
	Sun,  3 Mar 2024 16:20:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>, Tsugikazu Shibata
 <shibata@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: Move ja_JP/howto.rst to ja_JP/process/howto.rst
In-Reply-To: <b175c52f-34ee-4753-b172-e57fee6fcc30@gmail.com>
References: <b175c52f-34ee-4753-b172-e57fee6fcc30@gmail.com>
Date: Sun, 03 Mar 2024 09:20:20 -0700
Message-ID: <87ttlnxp6j.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> Subject: [PATCH] docs: Move ja_JP/howto.rst to ja_JP/process/howto.rst
>
> Let Japanese translation of howto.rst in the language drop-down list
> by moving it to the expected place.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
> ---
>  Documentation/translations/ja_JP/index.rst               | 2 +-
>  Documentation/translations/ja_JP/{ => process}/howto.rst | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename Documentation/translations/ja_JP/{ => process}/howto.rst (100%)

Applied, thanks.

jon
