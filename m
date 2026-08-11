Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B502930FC27
	for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2026 16:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786466611; cv=none; b=oHwhWinshA2YQMc97Xx2tCA2eNIOaaFpXBrnAJHAIy6g8o66VW/rpqPAFjGAJ59Wc+Juw2K04E1WXa98I1jHuXeqChIm9TP+bHXy1Qofp7j+ZDb4JsGkslY6rEFEB+2ajKNDJ/DXflh/ovl+KIEtdFPvOfPwgQdbvFLrj5gPQkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786466611; c=relaxed/simple;
	bh=H6VF48DHPNbwIU8Rwf7M++sOSIbOEtU6H9J1dH9w5JQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DuR+7AhmRWmDOimkASzAZnVUO5hSM3ZeWeb8d4XNqe3X3CTSk71cedhBR681BXozbUE8acwnD+sdA1heBJFMkHD6+uXiKBj5ORaicKMeYl/95gEHCa4OFZ+YQ/7SCUzjer2Ak2JdTv+qo09yOEQrIiRzR9GlOFZSFNIls9gfmjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kMPRfAsf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kMPRfAsf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 14BA3408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1786466610; bh=84y7HXygybU7S9v7Ex4hmsbzgf+cO4NVxo6sWbeEHaI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kMPRfAsfQHYhqUhGr8hnLqk+kBobKOyx9RddHpf3sYZkDq+4B6HmCH6Sv5yM2RuOU
	 gzhtY7rZ2oDzRb48VfEoFNE7pGIAZl3av5WkEoncFAdKKMzy8dWX//spajTptRZEzS
	 p0bpvaBkZLJVRsnfO0TGRVkKO5w+puJ/cm+wA0SKlR2Bhkcb32izM8pEltI4/uDoXe
	 3aypn+QQq7xc7np+RSo6dcvmd/AA1FchfjXNMSi3IIgWGFa4G+5nx9TlcutnzqZOyD
	 1mN3aGHwtCATvx1/cVXH0uskkCr4FWGAbVXXsABw8Hg5fhKEmVUANbUsDzjVeatX/n
	 8wCYXc3ihjYUQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 14BA3408B2;
	Tue, 11 Aug 2026 16:43:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] doc tools: fix 'path' typos
In-Reply-To: <20260806055634.1293294-1-rdunlap@infradead.org>
References: <20260806055634.1293294-1-rdunlap@infradead.org>
Date: Tue, 11 Aug 2026 10:43:29 -0600
Message-ID: <87fr0klia6.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Correct "patch" or "patches" to "path" or "paths" in comments.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  tools/docs/documentation-file-ref-check |    2 +-
>  tools/docs/sphinx-build-wrapper         |    4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> --- linux-next-20260805.orig/tools/docs/documentation-file-ref-check
> +++ linux-next-20260805/tools/docs/documentation-file-ref-check
> @@ -143,7 +143,7 @@ while (<IN>) {
>  		# Check if exists, evaluating wildcards
>  		next if (grep -e, glob("$ref $fulref"));
>  
> -		# Accept relative Documentation patches for tools/
> +		# Accept relative Documentation paths for tools/
>  		if ($f =~ m/tools/) {
>  			my $path = $f;
>  			$path =~ s,(.*)/.*,$1,;
> --- linux-next-20260805.orig/tools/docs/sphinx-build-wrapper
> +++ linux-next-20260805/tools/docs/sphinx-build-wrapper
> @@ -99,9 +99,9 @@ class SphinxBuilder:
>  
>      def get_path(self, path, use_cwd=False, abs_path=False):
>          """
> -        Ancillary routine to handle patches the right way, as shell does.
> +        Ancillary routine to handle paths the right way, as shell does.
>  
> -        It first expands "~" and "~user". Then, if patch is not absolute,
> +        It first expands "~" and "~user". Then, if path is not absolute,
>          join self.srctree. Finally, if requested, convert to abspath.
>          """

Applied, thanks.

jon
