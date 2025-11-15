Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C640245020;
	Sat, 15 Nov 2025 19:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763236170; cv=none; b=Owmb+a0tLZgGYLUMnn/VnQJFpWO2bKbxc5L9/VdqMtO6Iq6UQa4uUTpGSUxd2kJb+muRSKR56RGGoDAh17E73BI+XqLcpkrpW5CF3as6gp+VgNvZNwDrWJxGhC5IeigVF1YAByPJR/z9Gg1XaBDfnlQNinAKZ3E6EtiVoktfaJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763236170; c=relaxed/simple;
	bh=3V1Fy9ViaaQY/0jnDSl+WwzZFp/8UOyrCxw/t7OdckM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ppbtFOaUgWqTrHYq1f792CP9EtAHGJiiGY4f9wXkXe0TYY4usIS8xDPe0n1NVEqrhFTssa0AmXwsIuB5KYPae/VjsjHT9jNQT5OM1Z4WHPPpcOLsShAQ3frar7V0KPu8YQ/Uq4Azns+HlTMUL9SHy89xGKo85V9jHr5Ozs4CNgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mGXZAVYi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mGXZAVYi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8/KsR/WjzaOM+swE8xd3DELPIr1rW/uTNlwSdG+iOJo=; b=mGXZAVYiHcZip00J95o9zpXApI
	VTkYUQJNj/VqFv3A1I6/g9m+jDzvqS5ubbyZU+FQ1kS6g9J5MDqDSHl6L5/+ySegutARjO9h+kuCY
	WWaP5OAGP0c5qFStHefUk5dltP5ULkoOECBjmil/ERUFF1mQGimm5ev2GBozQnK7a/uyvdlTdg9YN
	Pf7plBZL+1IHGFbp/XII4aoc94qQ8PjN4JEjSbpglHnXieAIwh1FB0wRfUCyB5quarmMzLrnl6nN6
	uz6P3UtqMnHGQC0/2uZmfMbAeB0wbmbHk/77EGlNLnhN8SIODzd3H9XMw4Mlzvw7ZwFOXfPBoKDoX
	urfRkCRA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKMGy-0000000E1zt-22oK;
	Sat, 15 Nov 2025 19:49:24 +0000
Message-ID: <ffb17faf-4c08-4327-bb2f-4c3b02dfbb4e@infradead.org>
Date: Sat, 15 Nov 2025 11:49:23 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: parse-headers.rst: Fix a typo
To: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Dongliang Mu <dzm91@hust.edu.cn>, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linuxfoundation.org
References: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251115114233.32239-1-ankitkhushwaha.linux@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/15/25 3:42 AM, Ankit Khushwaha wrote:
> Replace "vantage" with "advantage" in the description of userspace API
> cross-references.
> 
> Signed-off-by: Ankit Khushwaha <ankitkhushwaha.linux@gmail.com>
> ---
>  Documentation/doc-guide/parse-headers.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/doc-guide/parse-headers.rst b/Documentation/doc-guide/parse-headers.rst
> index bd34a6d00ca9..a7bb01ff04eb 100644
> --- a/Documentation/doc-guide/parse-headers.rst
> +++ b/Documentation/doc-guide/parse-headers.rst
> @@ -5,7 +5,7 @@ Including uAPI header files
>  Sometimes, it is useful to include header files and C example codes in
>  order to describe the userspace API and to generate cross-references
>  between the code and the documentation. Adding cross-references for
> -userspace API files has an additional vantage: Sphinx will generate warnings
> +userspace API files has an additional advantage: Sphinx will generate warnings

Yeah, I prefer "advantage," but the definition of "vantage" also fits
here IMO.

>  if a symbol is not found at the documentation. That helps to keep the
>  uAPI documentation in sync with the Kernel changes.
>  The :ref:`parse_headers.py <parse_headers>` provides a way to generate such
> --
> 2.51.1
> 

-- 
~Randy

