Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD071E7C18;
	Mon, 25 May 2026 20:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779741481; cv=none; b=sKzWapkIL8RNdvq2iUme0zk3gQBqe71DXZ6oU+vE4S8xUyxQHbnPkMXpEKmNdNj4Ign5tgPCslgbvst00wJ8UK871n/Ke4YZEqQiKtAtOMQ18iubyvMa89E1btyJ7pJPmL9sVb2X8AnAuzNO1yeLzy7mZUKCRBbHhg6nbuh/n7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779741481; c=relaxed/simple;
	bh=kbY4vqTG6CNp/h26Ur/FrFkdHgwR5L7WsheCei6IlR8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jqu9DEXLY6DRFgWrS2h76XFRgMarEZUIOAgkRJ0KRSXsbG+qQKOO3sUDMOzxX3HNiSLuClmT/gM5MyHT0fGM0SL9RGENAXJJsJGczpiBx0l5iuB0g+4DKFcd06H9MziThVcgMOjDoDBKXaUyPraUFam3Ko3pMw1ZBKi2lefCdnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hNXv8iTo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hNXv8iTo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8271040E29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779741479; bh=sAnD0BMPYz1o5tZ0bzf3qKCWK3A91IucG6nM5aN2ZY8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hNXv8iToXirc+A3X24tOcpC37jGhFsyWSco3MteFVgruHBlRieS9DiZXOjPWRHyIJ
	 7GpexJjSPjG769W4bX0Li1jL86ra77PqIFA2zAwBA+WOobkpn61jznfba/rhBqx9co
	 OdOQlK8LYyEkxYDv0SDID1hNhPTn+Js3LXZkJz5jiA2SsSbvyo3pDYDmuXqr9o+EYq
	 J5chpSWvLLlI0HvK+JQ2P5wul/W6oLN/H9UVhmPQlGtE2sc3zuwiTJkHs0ZSE2xSca
	 HbT8TWWDtdnpvfVDtnMA/X/HIVbJpTAP4pPbotlYhqf6m+cmC0dNOHVEzXD3DQ4lWk
	 25Go19nqrrIvQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8271040E29;
	Mon, 25 May 2026 20:37:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Costa Shulyupin <costa.shul@redhat.com>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: Re: [PATCH v1] docs: sysctl/net: Remove ax25, netrom, rose entries
In-Reply-To: <20260515180200.1490926-1-costa.shul@redhat.com>
References: <20260515180200.1490926-1-costa.shul@redhat.com>
Date: Mon, 25 May 2026 14:37:58 -0600
Message-ID: <87ecizz0m1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Costa Shulyupin <costa.shul@redhat.com> writes:

> These networking subsystems were removed in commit dd8d4bc28ad7
> ("net: remove ax25 and amateur radio (hamradio) subsystem"),
> but the sysctl directory table still listed them.
>
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
> ---
>  Documentation/admin-guide/sysctl/net.rst | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

Applied, thanks.

jon
