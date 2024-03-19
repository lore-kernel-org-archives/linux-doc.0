Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4321E536
	for <linux-doc@vger.kernel.org>; Tue, 19 Mar 2024 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710834716; cv=none; b=qrPBo6XmQIKym4JHqUpXl9ak4sw4loxqtQodk1MsbiBMxtgpdtw9dyNkabwyM6yaz9rbKpCg3gS4DANrCEyBA5DrgH3x2K5HKy8wPTQ70KhavCZQqna6iQbqNWIjJPIJV7/O8z/e8JEiJbnPBLLPvPJkAJw0nDfW4a3xOZ1ur7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710834716; c=relaxed/simple;
	bh=lSfeep1U7kZiKnh/VWo5XzXS0PbcFSIkKzWgTrt0kLU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=quu1WqxEm8LkyrvbIrn1Ayj2ZdkyW4rs+AkMWMNBycns7ih7HjM3ArzgLR6/ZwTLXPt4VXxaomeMH4rA/hh24woUmwB2NV1On5qnIAwt6y6a8wm6ZxTswgnX2qgG4RzgpWzlxka34Vb92ulGSRNvPRMfEsNGUPQ0mo2ut8sVHck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Sx3vFLWV; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Sx3vFLWV"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 642D245E37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1710834707; bh=4XlkxCwPgAxV1cUEHciW6FPGkLTohi0JI8bKRxYm4aI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Sx3vFLWV0jBQ20m59iKh1xVEWLZ1JLdBP4ZWKQ2LRoSxEini9xxbKQI6ou2QG4BGv
	 DrUho0li3OcNV0QfAqe6kwCeGxGogSQBpnIgKTimb08UUX0YQgBZrU8S4/Yb9OEFzG
	 UcsU4qt3KIy1tlp41hlA2/MbchUwngGZ9isOjSMxMcY4TMtvmkOaTrNXUlUinOqJjr
	 VEMLD+p+Und93rBNa2AGva0wYUCh5N9XuNYpjtj+f44nV4avBvXdKN6AJdC6Jvjrlr
	 ktCNavVu4JQg+GhfNjQbxRPiCgZSTxQdD+Akeu3ICnaoWNl1e9tv5ilxr00RFgy8W4
	 6nNNvoStDXSKw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 642D245E37;
	Tue, 19 Mar 2024 07:51:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weiji Wang <nebclllo0444@gmail.com>, linux-doc@vger.kernel.org
Cc: Weiji Wang <nebclllo0444@gmail.com>
Subject: Re: [PATCH] format shell command as code block
In-Reply-To: <20240318140129.21986-1-nebclllo0444@gmail.com>
References: <20240318140129.21986-1-nebclllo0444@gmail.com>
Date: Tue, 19 Mar 2024 01:51:42 -0600
Message-ID: <87le6e8xrl.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Weiji Wang <nebclllo0444@gmail.com> writes:

> This formats the last two shell commands in
> Documentation/admin-guide/mm/zswap.rst as code blocks.
>
> ---
>  Documentation/admin-guide/mm/zswap.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The *idea* of the change is fine, but there are a couple of problems
here.  I can't take a patch without a signed-off-by line, so you'll need
to resubmit with that.

> diff --git a/Documentation/admin-guide/mm/zswap.rst b/Documentation/admin-guide/mm/zswap.rst
> index b42132969..85612d705 100644
> --- a/Documentation/admin-guide/mm/zswap.rst
> +++ b/Documentation/admin-guide/mm/zswap.rst
> @@ -155,7 +155,7 @@ Setting this parameter to 100 will disable the hysteresis.
>  
>  Some users cannot tolerate the swapping that comes with zswap store failures
>  and zswap writebacks. Swapping can be disabled entirely (without disabling
> -zswap itself) on a cgroup-basis as follows:
> +zswap itself) on a cgroup-basis as follows:::
>  
>  	echo 0 > /sys/fs/cgroup/<cgroup-name>/memory.zswap.writeback

Why three colons?  "as follows::" will do what you want.

Thanks,

jon
