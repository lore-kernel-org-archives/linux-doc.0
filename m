Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECEA3446CC;
	Wed, 14 Jan 2026 19:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768418424; cv=none; b=Y5bfr4AGBIhP9lAand+xOXzNdbtui6vO8cLio4kVIKkZ7hANwOKhXxkByZpAwEUgSLtMrWiwxrPBUxqmBzB2Oa9K09eJb5j7AREhNfUjcvXLGJZy36U1Wk7tvIJySzfjaUZJSljGCctrXz6An1Nqxfj9EtHx7LVXGuR982LbUjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768418424; c=relaxed/simple;
	bh=QSk1Uc2DBpR3jdSduQCyT4R7PaQnOWCvMhA3ccUMmdU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iFRWKSN1OZyGuRL7U+6qLJH+KtY1Nk0wk9KX/zzbiCWz357ke6MWgzGN2c5B8IV9z97RK01AqP4oYZjBXY/upZk7naTN8KwuYFbY9wosjkklMEpFs9xhvQx+ghsEcz+L8lB76rJQWrvI5PKJkAOuS1Bt39MlxmgQpw9OsIT0P6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bIXb4Odi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bIXb4Odi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=bV1hnSjNwlkp9xrH7jxCGUKuilqfZNcLnH5BN7LzF0Q=; b=bIXb4OdiCOJmvo/UgbnYXQRzyv
	wWEmAWCFTBmYsQrOxq/j8k2TISUcJb+p/YNDoA5N095eV+irf9Jm82U0Vr4a99cSw/KxOdMCD+oDs
	fopObAtkselpclo1ZMNLsK0b0yta5AaA3luDZE61rBHbKyXrnfrlLrr1UbkmxHmwJVjy9jTNuxH3e
	b+5fIFG6mWDtB4KyqfT/RqmKmV5bQ5Udq/qPJTGiLZ23tJeVijZII4Yi8Etal0eBtOGEq3HXxNQRl
	gTQlZeu00VeAwLDZz34nLXusfdOcPmpZsrgOX+sVIDSNgKZ7vmdSttCfOHht3oOscOSCwqE9z+mRg
	Hqq/kT/A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg6Pm-0000000ASrR-21vJ;
	Wed, 14 Jan 2026 19:20:22 +0000
Message-ID: <813cd0b6-e23b-4571-91fa-224106d3ad54@infradead.org>
Date: Wed, 14 Jan 2026 11:20:20 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Move kernel-doc to tools/docs
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>
References: <20260114164146.532916-1-corbet@lwn.net>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260114164146.532916-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 1/14/26 8:41 AM, Jonathan Corbet wrote:
> All of the documentation-related tools have been gathered together in
> tools/docs, with one exception: kernel-doc still lives under scripts/.
> Move it to its proper home, fixing up a fair number of references along the
> way.
> 
> This move was delayed because it ran afoul of one other relatively recent
> change.  With the conversion of kernel-doc to Python, the Sphinx kerneldoc
> extension gained the ability to import the relevant modules directly, but
> it also kept the option of running kernel-doc as a separate process.  To
> decide which course to take, the extension looks at the kerneldoc_bin
> configuration setting; if that setting ends with "kernel-doc.py", it
> chooses the import method.
> 
> Some of us found that behavior a bit obscure.  It also complicated the task
> of moving scripts/kernel-doc.py to tools/docs/kernel-doc.  I tried a couple
> of ways of preserving this behavior but ended up with solutions that were
> just as obscure.
> 
> So I took a different approach.  In the end, the ability to run kernel-doc
> as a separate process does not buy us much.  For debugging purposes, it's
> easier to just run kernel-doc by hand directly.  So this series simply
> removes that capability, simplifying the logic and removing a bunch of
> code.  The code that creates the command line remains in case anybody
> should ever want a specific invocation to run by hand.
> 
> Jonathan Corbet (2):
>   docs: kdoc: remove support for an external kernel-doc from sphinx
>   Move kernel-doc to tools/docs

I do many of these on a regular basis:

$ ./scripts/kernel-doc -none -Wall <path_to_source_file>

Will I still be able to do that (by using ./tools/doc/kernel-doc ...)?


-- 
~Randy

