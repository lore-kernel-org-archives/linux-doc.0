Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1D22DEA67;
	Mon, 22 Dec 2025 21:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766439665; cv=none; b=jLLyuBLlu3inhVso/4y1i7z8TJSKVE418MK4o3Fd/xLTasjJ7qMzzyBZLq20B9l/9sDfB4zFIXviYnebmyct5dgiFoUb1BXYj8KxBQnSU2mpyVGPg/FhViJqi02E6HpLBT0EI9UukbZm5wIKcm+6ORORFP643SrL+GK2xxtUDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766439665; c=relaxed/simple;
	bh=BT1eqoXwig79c8++CJz0ouOMQrJbaduFZuEBEWltq/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CQRudachZ9OgDL3uPHG6L5y0T26oL3HSLoUe76ZZbbqo672SWMYB8Z3kS0aDusu695tiTC8mrtz9AZlbLL7+/H3s08JNwl1gKqa1Xt9IIDC8xNVMU0I48K2H7kfNPoRGfxwcSyWgxab/uR2QLB44wZjIhdpGW5kmAVYKm8ZMOkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=tAlNWbal; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="tAlNWbal"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net DE99E4040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766439661; bh=NcZyJ+rS6qy6+jvh5bcwSVoRWqgXOdRkDex6OWrzZjY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tAlNWbaltE3uCozNBV26lTCuaFbAS+UdMSdySUl8jXNVINOViAj411tywNBtq2VVE
	 2rlCKder2aGnit74Kcye37ULNszYvhEnufGGK3DCIcpPkrVlg1oTRKsiiJ8q6dogrL
	 SKWgGN46fLp4RxL045IsILEFlnYrr/CD4vlIhzFUxCZH4+fT+4Apx53Z54WzFOCsGn
	 zKolTt6GPS1Kk4q+ZrvAiuPceZODbXcZYBRWWr4BtVm7+NY/vwnhbRZYUAoXtNEYsR
	 8WO88EyvWm5NOXM29NW/0VF46hDNqtRItqQa9husN3MAvCIuBiVRsotvDl27cYTvEM
	 jBF+M3Uz53cPw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id DE99E4040B;
	Mon, 22 Dec 2025 21:41:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove comma
In-Reply-To: <20251219171827.44015-2-thorsten.blum@linux.dev>
References: <20251219171827.44015-2-thorsten.blum@linux.dev>
Date: Mon, 22 Dec 2025 14:41:00 -0700
Message-ID: <871pkm2o0j.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Blum <thorsten.blum@linux.dev> writes:

> The comma is wrong, remove it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  Documentation/kernel-hacking/hacking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
> index 0042776a9e17..06fcb7c662d3 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -49,7 +49,7 @@ User Context
>  
>  User context is when you are coming in from a system call or other trap:
>  like userspace, you can be preempted by more important tasks and by
> -interrupts. You can sleep, by calling :c:func:`schedule()`.
> +interrupts. You can sleep by calling :c:func:`schedule()`.
>  
Applied, thanks,

jon
