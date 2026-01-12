Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD51328259;
	Mon, 12 Jan 2026 15:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232617; cv=none; b=B/7o2EUXgB5VH/0jixIsYW/U/FR1rMucA9HJe+kMNSz4IfZMU75k/TPiRhoULIxliDMYW7katFt6ExOJX6/yYCU8+hG3jDCqWq8d1I/80GYYAzDlGOj7h8s36MMzaJGjDCOsU8931qiPjUMosRkDk0K9tTTPhqOJJcTbRW3vriA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232617; c=relaxed/simple;
	bh=4rM73ldEgDqTXeCSOwDoPPvApc5KExqNZNPkAtoJwZw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VEFZ4NCw+RNZudoUBf/4m0NsLRRzv3+cR6aEwMuBnQrdsLYADcrlfrn4gtMqHYz6ThlQec4WH5CRXhaVtulQ0AYzZLeEoB6rHNu9LTzLiLfluwiqBwPMYObaWXoFbFN2o2CGIDZeFJvpewgpWywyQbRwz4EJAJhvVfjop0RnaYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WWFqswxH; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WWFqswxH"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 21ACF40C6D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1768232609; bh=vYpihDm+YgZ1i0sLBXFLKEDnED6PXnWlOn5RYbXX8iM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WWFqswxHdGpdpJRJtFJMx5ZF+TtFRSFIRWHqWbaSLDC5FmIlXAu1lkHSjK8EMhJ/P
	 GBO7H4bs6rfMt2+HSXdFOdqXNsEvjoeMNVwsE1/otfb0nKUJmj+Yvo4Q437MuaQNuo
	 jCEKlQh4wTnK3A1NMBBbTDPUNzYWTgrqdNVqjWITE9DRLNG+snpZFEGBImcEGqkB5J
	 KI2rHxxVFHPui9M/MbKeJnKdbXaqLMoIpswdU/0jvIoF8si2u9Dj/aYOTEMi8l772s
	 CHAXdMQggK/PSXq0YMDjgwRiUBl7LyanFEChZZJxPEWDXFXhuPFF6xxM/YJ4t/7eAK
	 AP1JZ1oc135hg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 21ACF40C6D;
	Mon, 12 Jan 2026 15:43:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 3/4] scripts/kernel-doc: ensure that comments are
 using our coding style
In-Reply-To: <7604a45e8ade06994afeb68616cf1838dd1101ec.1768229902.git.mchehab+huawei@kernel.org>
References: <cover.1768229902.git.mchehab+huawei@kernel.org>
 <7604a45e8ade06994afeb68616cf1838dd1101ec.1768229902.git.mchehab+huawei@kernel.org>
Date: Mon, 12 Jan 2026 08:43:28 -0700
Message-ID: <878qe23kgv.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Mauro Carvalho Chehab <mchehab+huawei@kernel.org> writes:

> Along kernel-doc libs, we opted to have all comments starting/ending
> with a blank comment line. Use the same style here.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  scripts/kernel-doc.py | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
> index 5d2f29e90ebe..7ccee4626478 100755
> --- a/scripts/kernel-doc.py
> +++ b/scripts/kernel-doc.py
> @@ -197,7 +197,9 @@ def main():
>      parser = argparse.ArgumentParser(formatter_class=argparse.RawTextHelpFormatter,
>                                       description=DESC)
>  
> +    #
>      # Normal arguments
> +    #
>  
>      parser.add_argument("-v", "-verbose", "--verbose", action="store_true",
>                          help="Verbose output, more warnings and other information.")

[nit] I approve of this kind of change, but I would get rid of the extra
blank lines, just like we do with C code.

(I wouldn't redo the series just for this).

Thanks,

jon
