Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713BD135A53;
	Fri, 26 Dec 2025 21:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766785081; cv=none; b=SEP89rpal9AIDHV0yBkLkd7fXmbCYwuQpqt7qPfQsXN6vnkaWQefbZ0uCaDROhFDA5llQUhdQRYq0mNwlpDweXMvnXDN/udd6eFLvlMoP2Pfj+7t23bo8Xu37hu769DQHh5Fq5YPGXeoicJDUQIoWjSod8XjXIvzYRuZeQhGXkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766785081; c=relaxed/simple;
	bh=TW6jzJIcpwj+KdYAsEQhPJAA+TXh64y/A/RVUw143GY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBeLxgCZ4cBWzLBM2g7wtqnVRVuGCHDNR22+v/UR+5eQJtojHxejG/9VyGxgx+cjRZRFEkWUE7yv1MkGNCbMZQwl1QxSYXmP2ME2hrg0e3UtVwZaedbc+aQNjMt6yJBA4Rj1H1caM0UWi9caEwdSdQ6XbRXsoBNsZhKmC/4isPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cfb9CDtq; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cfb9CDtq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=NwTaNf04fESp3/hTHeAD+xIvYWOT270z5yzG7bScUIA=; b=cfb9CDtq+RF5+pFWXCuNLsJg8P
	aUN0oACFAvKNJS55Og1HQjL8bRLnKLV/hMrBP6lwC+saJw8TrwBvtkT053TP3FIPhT61p9COw4DJc
	cbhUAw3UfSkhowgrx5Q6NEekCjJzfMQ0eQNaVs9arPoQoZHbS/ThgugAFvY1GM5bTdgY8bP/s4jP0
	kQeNf/aD42OuhFz0l0SK4vBXNTTzF+4AM4clo49C9Fb7ql2HKj8qVoE1/tP+GNAP84mPft+94TGtn
	JatqEhZOMTuXxYj7OYseYCb2aX7Z/Z4oXw8XMDnIr4lU0b7UwIYuVKI2KPy7SfvQU8K87Y8u5efzD
	dXAv7pcg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZFVM-00000001Uc1-40MS;
	Fri, 26 Dec 2025 21:37:49 +0000
Message-ID: <88fe4b63-13cd-47ce-8408-1e9d6f947b3a@infradead.org>
Date: Fri, 26 Dec 2025 13:37:46 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: Makefile: wrap SPHINXDIRS help text
To: mustafaelrasheid@gmail.com
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251226085651.198464-1-mustafaelrasheid@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251226085651.198464-1-mustafaelrasheid@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/26/25 12:56 AM, mustafaelrasheid@gmail.com wrote:
> From: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> 
> When using `make help`, SPHINXDIR doesn't wrap around 80 characters,
> causing text to overflow or wrap in incorrect ways,
> which then makes the text difficult to read
> 
> Signed-off-by: Mustafa Elrasheid <mustafaelrasheid@gmail.com>
> ---
> v2:
>   - Added '-s' in fmt to prevent word segmenting at the end of lines.
>   - Reduced width in `fmt -w` to account for the added indentation of
>     `sed`
> 
>  Documentation/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/Makefile b/Documentation/Makefile
> index e96ac6dcac4f..e260df866f5e 100644
> --- a/Documentation/Makefile
> +++ b/Documentation/Makefile
> @@ -98,7 +98,7 @@ dochelp:
>  	@echo  '  cleandocs       - clean all generated files'
>  	@echo
>  	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
> -	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
> +	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)' | fmt -s -w 72 | sed '1!s/^/    /'
>  	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
>  	@echo  '  provided that there is an index.rst file at the subdirectory.'
>  	@echo

OK, that works.
I think that the output can be made a little nicer to look at like this:

@@ -98,7 +101,8 @@ dochelp:
 	@echo  '  cleandocs       - clean all generated files'
 	@echo
 	@echo  '  make SPHINXDIRS="s1 s2" [target] Generate only docs of folder s1, s2'
-	@echo  '  top level values for SPHINXDIRS are: $(_SPHINXDIRS)'
+	@echo  '  top level values for SPHINXDIRS are:'
+	@echo  '$(_SPHINXDIRS)' | fmt -s -w 75 -g 75 | sed 's/^/    /'
 	@echo  '  you may also use a subdirectory like SPHINXDIRS=userspace-api/media,'
 	@echo  '  provided that there is an index.rst file at the subdirectory.'
 	@echo


although I would rather not assume a terminal width of 80.

thanks.
-- 
~Randy

