Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32461360EED;
	Fri, 31 Jul 2026 16:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785516323; cv=none; b=YkcMbMxwPhwbfUeeWvkc2ioDPdGSiGGTK0vP5R76bTGkBUKWywAljxv2jA8HPsTcR30Wtm+XWUNzGqEev97IS+hRxOLW5nm+Xq8sV+63VZVYrepdLkDt5fkpnVJ4nDOjcs7vjjUVmUisdp6wWYdTIoIFkm4o3GghaIjZpNjbMrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785516323; c=relaxed/simple;
	bh=ITlvX+ziyBIBNaYx+nKiBKtmhBuq3OpNFbnQ3dYdWog=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nKDsyiw+oYFUUE+PT1mtlbJd9aHGbBfgeZWW1CVwbWJ2YJw1gjIwEcjXGCVgfxOb9kGJbdYWdANFnxTWMc6dJwuuHHMt+2VHIy4e6XTVGPyVnjyqLKBy+Cuk7q/I+NECVi1yEB66t3NERxSyvjodh2uVgpfOZCqBwdkWlDUkjL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=rpmROwGW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="rpmROwGW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1029B408BB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1785516321; bh=MgQjTxKQch4gpOEu0R2yNHL+E8DkWmfYh/+coEXZuSo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rpmROwGWat/xUa0dhLMWBONfi4GIDApZVB4/9LLjseaIbzyeb0Mx0udNASPCGPmPi
	 oy9jH6sYQgrg8VWslHfLtbXf9Zodmgh9AH5ODWvPTkHvEpKC5mnuMIuyfqQVvrdUCo
	 US/FCnvMYIo6aqY+67njz0LgL40mi1lPEzYO2d6r9hd8QT9776Qm7FB18nUKz44qN2
	 wejXvM6GQW57JFBgLMKH9ZtywveQMRNcnamJuiESJ5Hf6p5IcoFzIQv3CJN4W4Zntb
	 8PfLg4lSQTKtlph6syIaqmtRtIGBSXGPUYso415FXDUlcWmSZl9vM/hH891UZ0KZ1q
	 AQkijH8TPtlFA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1029B408BB;
	Fri, 31 Jul 2026 16:45:21 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, Akira Yokosawa
 <akiyks@gmail.com>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuicheng Lin
 <shuicheng.lin@intel.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] scripts/kernel-doc: Fix kdoc for Python 3.9-3.11
In-Reply-To: <20260731144508.912049-1-ryszard.knop@intel.com>
References: <20260731144508.912049-1-ryszard.knop@intel.com>
Date: Fri, 31 Jul 2026 10:45:20 -0600
Message-ID: <87qzkj3y73.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryszard Knop <ryszard.knop@intel.com> writes:

> The syntax used by the excess description suggestion change works on
> Python 3.12+, while we need to support 3.9+.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 884f42584667..9cba20f827c4 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -601,7 +601,8 @@ class KernelDoc:
>          if not suggestions:
>              return ""
>  
> -        return f"(did you mean one of: '{"', '".join(suggestions)}')"
> +        joined_suggestions = "', '".join(suggestions)
> +        return f"(did you mean one of: '{joined_suggestions}')"
>  

Thanks, I'll get this applied shortly.

For future reference, it needs both Fixes and Reported-by tags; I'll add
those when I apply it.

jon
