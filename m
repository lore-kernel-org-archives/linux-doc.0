Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803AB31C567;
	Thu, 13 Nov 2025 19:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763062769; cv=none; b=fq45jKVBQY3QZYH3M522F+3y3/4xYAry8qdj2bgz815KjsMb4cU12PROidEqNUWFa7obFeKlmXOAyPl+dJuWeAdaXzoHM96xWUepp+LKICLptAIAnKfYGIdGT6ZUTu/RUu+cT/1OScqGPFqsaj/whWi5b/nzKIQ5T3uOvTnWCng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763062769; c=relaxed/simple;
	bh=XyVqg3GtsNMi3GD0Cw5dwDVLQ3jZCbFrjOLApr0SPF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hrqBOMnvi1RHFY6zzfcvvJF/8WwKj/W9ucYJqQAJnhvFm6/sW7s2OUT9HP5Osv0i1bn9VzIKlbgtPRfntG670rFjV8bvH6QByhCLecR7TvvLV1dK+v9flieVomZyBG0YETb6jSDHYCqQT60T0pAKAMOs3kmgDWrqtnfOxGzZdQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P5oNYZEi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P5oNYZEi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=chfwgQva+X89GsoUHHNeRTir8EzngYoiykPKmQ0oA3I=; b=P5oNYZEi5LVq2L59eofMFuJsvP
	itYF1U1Zl6Owre8Uz9N1DZB/r0Lw2ZGjhGGnGg1okh0dp4osnGQmtp4YnFIurmjLs23Y3GEd1u6qH
	LrvBdgw5awtHZF+NnSYWFPBWWKPCWyAIsKBc8uW+5KXnjllNfqucU7ipPcTc9wqLaTwOaLRVUJHOg
	xeBvzQEpER0cVqYkbibXydMlB/mMwRiGDOKsi52OdhgA+5HQVgXhGRREOlNHnSo8jhWwalzJqG/1l
	3QYO1KmY9CgoYHffh4cfsTAQDy9PDsIft+TDvYFPpTU/S57EOZAQ1jpnchMTzdiQyhCi/CPI4Y+M+
	DQEX/fVw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJdAD-0000000B1Nt-2lgv;
	Thu, 13 Nov 2025 19:39:25 +0000
Message-ID: <e6343b60-da03-46d3-a98e-4c31c39b42a0@infradead.org>
Date: Thu, 13 Nov 2025 11:39:25 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts: docs: kdoc_files.py: don't consider symlinks as
 directories
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org
References: <73c3450f34e2a4b42ef2ef279d7487c47d22e3bd.1763027622.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <73c3450f34e2a4b42ef2ef279d7487c47d22e3bd.1763027622.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/13/25 1:53 AM, Mauro Carvalho Chehab wrote:
> As reported by Randy, currently kdoc_files can go into endless
> looks when symlinks are used:
> 
> 	$ ln -s . Documentation/peci/foo
> 	$ ./scripts/kernel-doc Documentation/peci/
> 	...
> 	  File "/new_devel/docs/scripts/lib/kdoc/kdoc_files.py", line 52, in _parse_dir
> 	    if entry.is_dir():
> 	       ~~~~~~~~~~~~^^
> 	OSError: [Errno 40] Too many levels of symbolic links: 'Documentation/peci/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo/foo'
> 
> Prevent that by not considering symlinks as directories.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Closes: https://lore.kernel.org/linux-doc/80701524-09fd-4d68-8715-331f47c969f2@infradead.org/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>

(again...(

> ---
>  scripts/lib/kdoc/kdoc_files.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
> index 061c033f32da..1fd8d17edb32 100644
> --- a/scripts/lib/kdoc/kdoc_files.py
> +++ b/scripts/lib/kdoc/kdoc_files.py
> @@ -49,7 +49,7 @@ class GlobSourceFiles:
>              for entry in obj:
>                  name = os.path.join(dirname, entry.name)
>  
> -                if entry.is_dir():
> +                if entry.is_dir(follow_symlinks=False):
>                      yield from self._parse_dir(name)
>  
>                  if not entry.is_file():

-- 
~Randy
