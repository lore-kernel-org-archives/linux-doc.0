Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56391862;
	Sat, 21 Mar 2026 21:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774128776; cv=none; b=jBVUwtEZchomQUFSEonzcwMabSNSNXROMGtssbiTR3umyjAISzLM2JuyKM8/Xz034CRnjoZk2Biip1nEkltgVcM6tkd5cmbQHJ1ChLzU/vh8UH8+YUCQHM2C990ruvLz5XIS0dgeEdTrfZQePvDSzsZb/xkTrywjkfgmtf5Bu2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774128776; c=relaxed/simple;
	bh=US2ZkY7ezxO6irwnY/5YvbgPHrs2lKhJFZwLBaO1ln4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o9GGdNa5ancYrCE6aBSEjIR8bnOXVUxEbfdzUoSaoV57HXewTOUpICd3OUTOsiVWmch4dBqdhBikBXxV5AJZjWbMQOeMUhBed2peZRMbxhIrU6ec87vzt/QLZlfbvQ/RLpnEckb0dFLpiiD7ubvJneLKCcnIVKY1hNlU5jLTZLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=eq5U/cLY; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="eq5U/cLY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vGgUZkHGxR71KC/fo60+5eRwCvQ/Yq4YeIthjrO12/Q=; b=eq5U/cLYblfMpfroMObICuNnZh
	1qMMqfoEgAsdYwDLTU+Rz49u6CoFyVPl5wYiNDElmZAfYNcYF8Ggz2bvVvRyqErBqctwxNJiSDrDO
	feGWLosIKrpqwd8dri5dXWlZdQueQx6+sZOJJIF/IzYQw6n9Xk9TLRT3inqZ4pA1vrK3YuQ4kdG7y
	4bN6MlJy5ayGtsrwQLf4vIqT1kqDHy66Dpb6ooPlh7bWuK77hN6UFqFKd3eTozIrpmYgeaKQbOKTb
	SY59ptBjkTchHCnXl7Ko/erPRmhuFRMRWdG8BRIx1HdcAIXc/VhRibGkVYx3iyIo/vlkQZNXG+bhf
	P6MvoIFA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43wF-0000000EodS-14k6;
	Sat, 21 Mar 2026 21:32:55 +0000
Message-ID: <e2b86d3b-0ffe-47ea-b4eb-defe313151af@infradead.org>
Date: Sat, 21 Mar 2026 14:32:54 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: allow long unbroken headings to wrap and
 prevent overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321144855.30429-1-rito@ritovision.com>
 <20260321144855.30429-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321144855.30429-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 7:48 AM, Rito Rhymes wrote:
> Some documentation pages contain long headings with unbroken strings
> that can exceed the content width and cause page-wide horizontal
> overflow.
> 
> Allow headings to wrap when needed so they stay within the content
> column and do not break page layout.
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>
> ---
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)

Tested-by: Randy Dunlap <rdunlap@infradead.org>

-- 
~Randy
