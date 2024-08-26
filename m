Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E400319D088
	for <linux-doc@vger.kernel.org>; Mon, 26 Aug 2024 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724710561; cv=none; b=Rlun/aTHAn7W2GR4s2OAe8DawjSyLoAgyho3rjKRIJroZS5C2bRnvdTFf5JR13mVDaX4+V2Z2PJ78NK74WvbzWrplUOzj6LLJJ16gfGXG4nMVTFkgw/sftxw6VDfsl+uX5NhrFNKzbXMjLaE98k1785RrxX1Az/SV3oI8T7IVHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724710561; c=relaxed/simple;
	bh=0bkrLw4uX5kXgcnT0UKEgW6WGaFWoJFTDaQeYqgCdF8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I0XTLJSWm+/pWzzGZUv7sfkIETSToTSdtM/JxF4TuCfpjIzZfMoRB2qoXwjN2/zNMncjvENOO4leGhIWKtlM6jbxkTucRgkNQGgePAtXeAhp2FmSfy3BobuZ7aiTWA0cfEy/8+G0kphvHn8kLi6yGurRxywh+tLLuGe6k8Pw5Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ipGnMmCr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ipGnMmCr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 194BB42D39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1724710559; bh=/UjvcIjG80F+ItO47u+dmlLw9La/HpofWKJeq9L0GK0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ipGnMmCrzqwvaMaiM8yl7deopXS8TCsfvZSh6JEn8MidBg5f8R+k3wwpQkBwdMsoT
	 z8x48TlCWHeKAbmXFAvceGuGi3df6zj8B7nzzIZH9VSIcHLFqyMFvyJtD6NJx3qAFa
	 5cmMDZmC5eJIVmFZ5UK50gGpE5bf0X2ZZnyW2r28W3z1BNrz+4XYdpNXFZvWAts+C1
	 7WETUfKiZubXy9CIRqz7/QhQ7siLJG/yyUU/3tbRdsc1MDLLkWI8n7JRulsBIkj2X6
	 XNwKfKpZMu7DNHfMhSpfey6KbTosOIZlJfm1bDq34V/UVA6Cmd3gQMBmy+bTc24Ztv
	 iesfEg6F6Fq+A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 194BB42D39;
	Mon, 26 Aug 2024 22:15:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Scherer <t.scherer@eckelmann.de>, linux-doc@vger.kernel.org
Cc: Thorsten Scherer <t.scherer@eckelmann.de>
Subject: Re: [PATCH] doc: iio: Fix sysfs paths
In-Reply-To: <20240805120357.21135-1-t.scherer@eckelmann.de>
References: <20240805120357.21135-1-t.scherer@eckelmann.de>
Date: Mon, 26 Aug 2024 16:15:58 -0600
Message-ID: <87cylv53s1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Scherer <t.scherer@eckelmann.de> writes:

> Add missing 'devices' folder in the /sys/bus/iio path.
>
> Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
> ---
>  Documentation/driver-api/iio/buffers.rst |  8 ++++----
>  Documentation/driver-api/iio/core.rst    | 14 +++++++-------
>  2 files changed, 11 insertions(+), 11 deletions(-)

Applied, thanks.

jon
