Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927A11DF260
	for <linux-doc@vger.kernel.org>; Fri, 22 Nov 2024 17:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732297283; cv=none; b=BSSdB3MRgywaggyuSfw6EhtvrH+0+/yjmBgwYNz7BN07vFWmcE0yciZdhC7FB4FCQUuvhW76z1BYTYY7ELbjNcUHYg7Vykekl3/XQv4PxJEBo5D5CMS6FZogSo0eaQkJO2ri3oUfpsy9hObh5r/HU8uwwNIBt0DLvuxJ2T9rnSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732297283; c=relaxed/simple;
	bh=SkEhJ1KEUvDE33jZsTK0+xiopaHguI3yVBQ0LphGqbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=rbXhgdEU5s/rLoxolA+rMRaJSA5ZsXmVOppIrf3PBoNtKZdFjVrsm1oDnLGIbcptqQBYtfuMifFlNn9FYngQnxbYz7kFm0TgQuDhi6k0kSSqy1QrrwUSNjwkEZAnn6xHcbJT3tQbYFT4DfQHlhnwOE5la4evgxj/A3+Yr9vKHYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=UbSOUFmR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UbSOUFmR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BCFAF403E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1732297278; bh=di+fosPUQPhK6QWbXycUFq2i2ZLJkvImTJZsfaL5vz4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UbSOUFmRHckpB/PQ2fc/v17MHE0xUCcFDhHVnfO15N0cvFj5zGz2nlMeqNjXkmJ/t
	 W+EKJMlzJLvlPono79Zuu//3CU0StzY2E/DtHujjmVmlSNDG2Va5CAGNiPDhBJiMov
	 rhSXc5qI4MMm1tVpTgKQk2vCw6EAbL+iPWdOC6XyKWole6u+7a4HM4d32kWnURzX7Y
	 nsKrM5Y0bTUyp6W4Q8tPWI7aLastPfAOfvcWQJkLgWRlZurKq8qSqFi1ZJlejF6048
	 5I966EMmT/R2fK+ZKmVhYZ4nh+2D1s6u5xP4L3mEv9dUR4SOPBr6O+OJjD0r7Sj4PN
	 A2ETddNbCyBqw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id BCFAF403E5;
	Fri, 22 Nov 2024 17:41:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Thorsten Scherer <t.scherer@eckelmann.de>, linux-doc@vger.kernel.org
Cc: Thorsten Scherer <t.scherer@eckelmann.de>, Daniel Borkmann
 <daniel@iogearbox.net>
Subject: Re: [PATCH] bpf, docs: Fix tcpdump option
In-Reply-To: <20241119094958.50574-1-t.scherer@eckelmann.de>
References: <20241119094958.50574-1-t.scherer@eckelmann.de>
Date: Fri, 22 Nov 2024 10:41:18 -0700
Message-ID: <87r0732mkh.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thorsten Scherer <t.scherer@eckelmann.de> writes:

> From tcpdump(8):
>
>         -dd    Dump packet-matching code as a C program fragment.
>
> Fixes: 7924cd5e0b3a ("filter: doc: improve BPF documentation")
> Signed-off-by: Thorsten Scherer <t.scherer@eckelmann.de>
> ---
>  Documentation/networking/filter.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/networking/filter.rst b/Documentation/networking/filter.rst
> index 8eb9a5d40f31..06e244094f49 100644
> --- a/Documentation/networking/filter.rst
> +++ b/Documentation/networking/filter.rst
> @@ -49,7 +49,7 @@ assured that the filter will be kept until the socket is closed.
>  The biggest user of this construct might be libpcap. Issuing a high-level
>  filter command like `tcpdump -i em1 port 22` passes through the libpcap
>  internal compiler that generates a structure that can eventually be loaded
> -via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -ddd`
> +via SO_ATTACH_FILTER to the kernel. `tcpdump -i em1 port 22 -dd`
>  displays what is being placed into this structure.

So I suspect you may be right, but both are legal options.  When you
apply a Fixes tag to a patch, it's generally a good idea to copy the
author of the patch you claim to be fixing.  Let's do that now and see
what Daniel has to say...?

Thanks,

jon
