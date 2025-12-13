Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDE81494A8;
	Sat, 13 Dec 2025 19:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765653249; cv=none; b=ovpXs7y2b5ADQQBMqWIvx9ykxBqrpc4eoX3tj/2/3ZcoKf/ZGCBLAgCIsYoRMIjSJbmr1KdqAMpxtoa1WXfTlFvcotnYFOezGrbSDIOmUMu6v5V2D4JTiih3ZJOA0H7+4sQ4CgUPLVgTdvw4BvcFzq8T9zc9a3e5eTwm3FPzkOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765653249; c=relaxed/simple;
	bh=15X+3hbjrH2oYspCgVzD7LqQOoI1WXsHoO4w4j03VXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hjyhpQBC8Cd6t00BH9TnN6Vny0Wqbx7H3lwWBwl3BFGPhQNr+Fj1RpM8AhFbjXboZnM0xGxjgZGBgiqMxU1Om/6IFrPt22YAdVnxSw1JomVbhQs/DU/VS7vJhjLWLlrCkGzsg7GJULspV4b1lFe+0o7+ID7U6l3PVH1rriY08m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J1UtjVs4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J1UtjVs4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=2riLjgrR/oKcMScp0k5DIi1TENHnUTJS/5A+pqmPPgA=; b=J1UtjVs4ZGZnEhhtRf7j3ekKVE
	B/8tZiGYmaRZpGuS59JNnNKjjQO6YDTfVwia0AC5LNlfENbb2tNF9BnA7ZT8VERUOa+4CiiKyBs1H
	hxvWS7VANrYf98xhJ0d0bMNsw1Yo3Zs813o5Mq8sx9yC0rzA2VThi3sqe7jx+lCULDHLY8/n0hqK/
	32rlyjNtEuvVEWcvXKVG5R/KBDwmBOCEqrj1XTb5P8sgWqTfHiHIpVkqLVMsyYI0sQZiMNV52SBmy
	FvmxtK9MS2YI9l1nYpsNKlYJ3mAcZX3DP3rpdgYq8BnDFXHuaLf9AJdKk+JEFCXPQJEyCW5YcNDlv
	KnB+q2nw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUV45-00000001rel-3ct5;
	Sat, 13 Dec 2025 19:14:02 +0000
Message-ID: <60383fe4-c089-4bbb-829d-670afe93e9e8@infradead.org>
Date: Sat, 13 Dec 2025 11:13:58 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] kdoc: allow dots in inline @param names
To: Steven Price <steven.price@arm.com>, Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251211104851.45330-1-steven.price@arm.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251211104851.45330-1-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/11/25 2:48 AM, Steven Price wrote:
> Inline kernel-doc blocks failed to parse tags containing dots (e.g.
> creator.process_name in panfrost_gem.h) because the @name regex only
> matched word characters. Modify the single-line pattern to match
> doc_inline_sect so it includes \. and parses the same as a multi-line
> comment.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>

Nice. Thanks.

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
> index 500aafc50032..261b484ad130 100644
> --- a/tools/lib/python/kdoc/kdoc_parser.py
> +++ b/tools/lib/python/kdoc/kdoc_parser.py
> @@ -53,7 +53,7 @@ doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
>  doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
>  doc_inline_sect = KernRe(r'\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)', cache=False)
>  doc_inline_end = KernRe(r'^\s*\*/\s*$', cache=False)
> -doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@[\w\s]+):\s*(.*)\s*\*/\s*$', cache=False)
> +doc_inline_oneline = KernRe(r'^\s*/\*\*\s*(@\s*[\w][\w\.]*\s*):\s*(.*)\s*\*/\s*$', cache=False)
>  
>  export_symbol = KernRe(r'^\s*EXPORT_SYMBOL(_GPL)?\s*\(\s*(\w+)\s*\)\s*', cache=False)
>  export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"\)\s*', cache=False)

-- 
~Randy
