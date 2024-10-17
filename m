Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1A37DA84
	for <linux-doc@vger.kernel.org>; Thu, 17 Oct 2024 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729181719; cv=none; b=pR8R/L1ad/qtxEVMtAjgpDHO2ucDD1yOfsDnTqJAgvNJ+HTVRx/UlpNqvHXD3+FVhMG+65vpFCZs5eLJ8EXsD8WLQgfmr2ETw2vZoLbKqmref8oi7p8PpQ1gP6c9Kl0l9d0u608d32TcHESNphV4CuIAz8VjZrVyeUKv6Yq6KOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729181719; c=relaxed/simple;
	bh=WmswDp7pCXWOzT8fDb5NdhDgoTHqLQI5ektd2u+be1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BUDa1aUwf1vZ8QIxEUPQ/aP/rFJVZelvMmmIknuydJuFJe9zRY0WeyfmP/L+fgZyTkCYB6JPAS9+Y9UhTIA+R371kvaKAve3niPiJbVVoPYIFY3coN83/UTQccd6+FqCjzTuUbNIXljNrAa35z6yQ3qrWe/2KBF/2XhdIndxAag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=s70oPf23; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="s70oPf23"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2EF6742B29
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1729181714; bh=gKQ0tpJqoZmwod1f402ZUomCnJDDpwBXSUqslw+sNvE=;
	h=From:To:Cc:Subject:Date:From;
	b=s70oPf23jNDxnSml4FmK18EPA+cNLsdelP53jUXENtP1eTDwwwKOzhLk7mnIke37K
	 q9hJQNMbHXK37L7kLZl+aDtpIT8Yh64dc3PXsfzQvwfSyIxN+KpWhQkC2Fa8kb0VZd
	 vpx6CUdLBcYc5P8BfTh02RzZC2LnLg4rvwW3j9o8EoVL9jJnAXdH6JVGGsAr9rr8H+
	 FSLQ8nIdkkSfipUwDYbsb3xCD+C1TSrxyWvvDVSciKuxd2zGWFkTxbLC9O2c2gWWje
	 FDGu69nUVWReZPi/EaLHJ/Ow2FU7aqlr5+wfKwryMDdpNcUU3Nk8gKHPPXsRgkZY2T
	 kkbut0uHctlFw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2EF6742B29;
	Thu, 17 Oct 2024 16:15:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>
Subject: [PATCH] Add Yanteng Si to .mailmap
Date: Thu, 17 Oct 2024 10:15:13 -0600
Message-ID: <87plny1zam.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Yanteng Si's old address bounces, creating a lot of noise in conversations
about patches.  Add a .mailmap entry so scripts/get_maintainer.pl will
return a working address.

Cc: Yanteng Si <si.yanteng@linux.dev>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 .mailmap | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.mailmap b/.mailmap
index 0374777cc662..f2a4e48ad81a 100644
--- a/.mailmap
+++ b/.mailmap
@@ -717,6 +717,7 @@ Will Deacon <will@kernel.org> <will.deacon@arm.com>
 Wolfram Sang <wsa@kernel.org> <w.sang@pengutronix.de>
 Wolfram Sang <wsa@kernel.org> <wsa@the-dreams.de>
 Yakir Yang <kuankuan.y@gmail.com> <ykk@rock-chips.com>
+Yanteng Si <si.yanteng@linux.dev> <siyanteng@loongson.cn>
 Yusuke Goda <goda.yusuke@renesas.com>
 Zack Rusin <zack.rusin@broadcom.com> <zackr@vmware.com>
 Zhu Yanjun <zyjzyj2000@gmail.com> <yanjunz@nvidia.com>
-- 
2.47.0

