Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8BC535AB
	for <linux-doc@vger.kernel.org>; Mon, 19 Feb 2024 21:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708378460; cv=none; b=qDYPrKoHCk7qHNAW7p/6PwCvOgPAWUOpUWcMaa6Fe6diztsEJTYaHQGXZ0ab2aX11BhOoiZKCKdkNknrlivSk5IJQkhkCPUI9nBeh6xWa9KH4HG5ii5wO8DZKL5AZoSmAeczKC03MqtGx7OfkFKvSqt6D0JYIVWkKjsHfKYV7GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708378460; c=relaxed/simple;
	bh=UxS4wbfFoLFWKQf+NL/9fcIDio+f+jImA87ZLf12KbY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=JRjm8rfPmbjammARWjom3rZ6omx1GM5i90f7tkNCLUnIgix6eDtzxRcifF1AxDITvPBO6nitf16ejSjAbeoz443kiygagVFPfEU/2QARJFbl1weVgiTrKUIW61s3+FOkm5kIEf8W9rhvlg8Sw71UrC3kEIJQphlqAhcoQ77Me6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=dvAyPvqo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="dvAyPvqo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 53F345A270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1708378458; bh=9HbgrJKcJZEbhLWkp0Juw4fUjnolebYKMYRszRYm16o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dvAyPvqoOpNx/rbZruPoHU41+llRl0xG4aAPua8upl5NPPKe0VDwjkFx0ucze5fcC
	 5R/28w/Fjz2A1TienBIJkWmOLvK0F3/hKqMnuQlcY9ozm+vRtUWVFWJvtC5BR6hxI9
	 5/DqOOlykgKlq09wXjkuTI/jCi2Y6Mh8rxAzrt+Tdi66AkadOEg5Bo3l3Z6HhcZgpT
	 sih0pohr8ifg5BUIA7hqSZg3v2cq+tQWE5gfbHUij9YUqH/+uK6kA9gK/KuzaJX0g/
	 ddWz/YG/2VAw3VjVGsQK8DjJSiiUFHZKa4IEEuDkq4A922Q4CD1cRTh1Ok4X4Z+Iv1
	 gbWr9zB6cVmCw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::646])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 53F345A270;
	Mon, 19 Feb 2024 21:34:18 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Johannes Berg <johannes@sipsolutions.net>, linux-doc@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>
Subject: Re: [PATCH] kernel-doc: handle #if in enums as well
In-Reply-To: <20240214142937.80ee86a3beae.Ibcc5bd97a20cd10a792663e4b254cd46c7e8b520@changeid>
References: <20240214142937.80ee86a3beae.Ibcc5bd97a20cd10a792663e4b254cd46c7e8b520@changeid>
Date: Mon, 19 Feb 2024 14:34:17 -0700
Message-ID: <874je4nnom.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Johannes Berg <johannes@sipsolutions.net> writes:

> From: Johannes Berg <johannes.berg@intel.com>
>
> In addition to #ifdef, #define and #endif, also handle
> any #if since we may be using e.g. #if IS_ENABLED(...).
>
> I didn't find any instances of this in the kernel now,
> there are enums with such ifs inside, but I didn't find
> any with kernel-doc as well. However, it came up as we
> were adding such a construct in our driver and warnings
> from kernel-doc were the result.
>
> Signed-off-by: Johannes Berg <johannes.berg@intel.com>
> ---
>  scripts/kernel-doc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index e8aefd258a29..152b42181662 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1330,7 +1330,7 @@ sub dump_enum($$) {
>  
>      $x =~ s@/\*.*?\*/@@gos;	# strip comments.
>      # strip #define macros inside enums
> -    $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
> +    $x =~ s@#\s*((define|ifdef|if)\s+|endif)[^;]*;@@gos;

Applied, thanks.

jon
