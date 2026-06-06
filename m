Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0920978C9C;
	Sat,  6 Jun 2026 19:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780774598; cv=none; b=hSzilcSZUfByPobGliAztqXqG2Ctn00r153/RK78odbZDaYabYXidB/VNTxpuHq7x2cpozR5WmnbNFI0CVT359gu/lwt2YvFgD2EgNMmNB9dhWoiK5X53gia+CpG2w7eU5xLSwvLexwwIHEM1o7mCQK8O5nqh8DoawqvF9MSO6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780774598; c=relaxed/simple;
	bh=Ei9UTRLTnVNUFzxLS7OrzOUZQfNeMYndGWFGW0eVylM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tV8HmD/iPigrocm5h1pmskNUaXcbXrTjTl+IK6i3VM0OTn6fga9HcobBGo2NhNdLHGk++eNhIc+CHubEE/V9zA8L64wo2V3ifmzWxynVPCWttRJX+yzCgn6XlMS6Gx0e7QjmASvtp4g/BGQkLad5BLXjrHpRAe3GTY9YPnQITso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZJMrw5wv; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZJMrw5wv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=No/xV3x9JOJgAL1c15ZIv+cOiIPQT3ioZC04jvxeT6A=; b=ZJMrw5wvZzPJQdMEBjiDR+dur+
	5LRP/8nnMh44dHYngo3fb4CfBoHhr7w1+pSFIy5urgeT69Y80h68TdLWPQZi8wMZHwzPW93T2iHyY
	C/mSd1XzXEKdL3wFv6FwGYkSTi85ZXfGBQUQgTuWuleZ1zFXHULSi1ewLi+lmoTOy3QmtqqslSVQN
	f9MuMg9T/HfBb4H6iaJlEZC8GFWQLDfUL5aonI+ONxPhqAlCI+T+vFwoxZOHjE4sy31+icyUJT4NL
	2NkGFNuJL6c2lUgr61l5WucgtZkPDnfGIsn7acOBLBPviQBcAmWpQkWBTS9P+dxNTAvzjL2ZT3M0F
	JbgDqRvA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVwot-00000001mpL-1tu3;
	Sat, 06 Jun 2026 19:36:35 +0000
Message-ID: <37fbe86b-b476-4d28-b8e6-5b8cb3808b42@infradead.org>
Date: Sat, 6 Jun 2026 12:36:34 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: memfd_preservation: fix rendering of ABI
 documentation
To: Pratyush Yadav <pratyush@kernel.org>,
 Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org
References: <20260605160645.3650271-1-pratyush@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260605160645.3650271-1-pratyush@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/5/26 9:06 AM, Pratyush Yadav wrote:
> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
> 
> The "memfd Live Update ABI" section in include/linux/kho/abi/memfd.h
> currently does not render in the exported documentation. This is because
> it should not include the "DOC:" in its reference. Drop it to ensure
> correct rendering. Tested by running make htmldocs.
> 
> Fixes: 15fc11bb2cb6 ("docs: add documentation for memfd preservation via LUO")
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
> 
> Notes:
>     Mike/Pasha, I reckon this can still go in liveupdate/next. But if you
>     think it is too late, we can probably take it via -rc1 fixes as well.
> 
>  Documentation/mm/memfd_preservation.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
> index a8a5b476afd3..c908a12dffa7 100644
> --- a/Documentation/mm/memfd_preservation.rst
> +++ b/Documentation/mm/memfd_preservation.rst
> @@ -11,7 +11,7 @@ Memfd Preservation ABI
>  ======================
>  
>  .. kernel-doc:: include/linux/kho/abi/memfd.h
> -   :doc: DOC: memfd Live Update ABI
> +   :doc: memfd Live Update ABI
>  
>  .. kernel-doc:: include/linux/kho/abi/memfd.h
>     :internal:
> 
> base-commit: 2935777b418d2bfcbfe96705bb2c0fa6c0d94e18

-- 
~Randy
