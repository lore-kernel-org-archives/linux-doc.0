Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B9524EF8C;
	Thu, 27 Nov 2025 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764204446; cv=none; b=UOxR9uTVG59sHIiqr3Q2Fw9DhlZs1ir/ITZBj3fiRCMiLinKYkeTBnaIFwnJpp+scR8f9ZXtbhEJAc5Dp4bQEcCOoH/zVHd0jwudbgaXt8hGNXihJyMWvpGc3tuWQ3aV8JIERtxx1E5TPzQ76Vphlg3g2uv2EPxN63WIM6DRuEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764204446; c=relaxed/simple;
	bh=NpagLpsJPAbQ8wv6F39vmbVl3BJX6o/Zh8keCSrf4f8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SRIPjSjCVoJiER4ulxo1GdExqSkGy5xvKpt4zIvREXHgi370lxQ5JluzWILy4ZsY04k/ehexJtVCjEdbMyl4T4K65RnTVNqHxMPEZyvnegfeZuHxVg/f0FkAAtro+Xmo2hvxUiPCpEfhSTrRmeun+P+s/fI5J9OVJTouSV2SVeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=M99gNBpg; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="M99gNBpg"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=umS9EAn8f/fQIL4Y42mY/gzRd7ATU9KCrPb5ewxpnR4=; b=M99gNBpgY3lEsLXwpFprN2xXif
	mIQvjpmV475D2YINLQ9dUYyJllmrElHXBywAOml5NufK7DiyiFsR79P07+SQ+BCFvdHta44P078gh
	IInU/VgsopcVLJbmVpOYLK+sO4rbn76iKb3XJyjFjMVREn/QYgG0YitocWDP5jOXXu5dD7snqPzyw
	qSVshNo+LjDjeyb03owN54pFi0x9b3vrur7/YSnBCwFUZt3O0ezX4JKrnmWGiON+V9MivnnJvCpeD
	9S7qnxVT3B8E1n0p3JrCPRTwv9RPEEsrgJUoUMjUJoRr5wEO7GLDBE0vDNrTyzYSNR3diYH9C/IG3
	IQ6DNm6A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOQAO-0000000FoeV-0LfW;
	Thu, 27 Nov 2025 00:47:24 +0000
Message-ID: <3c6c95d8-f7ab-4dec-a970-00d788769dab@infradead.org>
Date: Wed, 26 Nov 2025 16:47:23 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] docs: kernel-doc.rst: document the new "var"
 kernel-doc markup
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org
References: <cover.1763978209.git.mchehab+huawei@kernel.org>
 <5291dedbe9aa0104764a31fe2bf2b08d675295d5.1763978209.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <5291dedbe9aa0104764a31fe2bf2b08d675295d5.1763978209.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/24/25 1:57 AM, Mauro Carvalho Chehab wrote:
> Add a description containing the new syntax to document
> variables within kernel-doc markups.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/doc-guide/kernel-doc.rst | 25 +++++++++++++++++++++----
>  1 file changed, 21 insertions(+), 4 deletions(-)
> 

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy
