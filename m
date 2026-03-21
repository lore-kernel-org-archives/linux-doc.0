Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB8B6F9E8;
	Sat, 21 Mar 2026 21:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774127047; cv=none; b=iEKpyFta8mD9BPn12zKjrpJciCouu6sYFm6/68Nz9dIoh3sk0okQYDNmDEcehYU0H66jIBL2jsTQDT4WQFvbdTe/I4dqiPLrjgtlnw2a/hsyXK/+YO1/CpWp7SYGi7SRlGgKm6zVNmQKMiNCXHTZMaYBMvnkNGdbZqyb/qtyurU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774127047; c=relaxed/simple;
	bh=lOKEeiaGW6FWprmDFkDgCjSotwpXD/uaFXrTBxOwnOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o70FXyxFgy6hXRueXa+0+5+IyeOKSuRYSzcH6aVB+pFmbvpcBYYoiw0Oml240Pjh9P6qerEeEHuCKWWSx6T9wBlluj3KiOyXBuMpiBuEA7WxOcboDCa/fATer6en37zoZYurFyVq0NlpJ4BjnuBeQxNdwDUHcQDC84wdaxa4nWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=0liLQLtS; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="0liLQLtS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3t1eNfobSL5U3sdDv4OJVMOW1jfFZoQILxdSJhDLRLA=; b=0liLQLtSgWeHDy+gRQA3J7Ah5W
	G/6TASeZQjegvUI429wUiftiIeayGS2P05BXHfQzDnar7H0hrz3GBADC9P0wSp0h1W9r2bUxdC/N8
	iQPyFflWhnlwUlLey5JdBjQqp1ITDichSyXVBKlyTR3lgocwqqk13wZw0nyKz4TWcZckmgR4bFFM9
	whBLNg+Ovo5fLPZgeK7FateHDpxrZGZFmxdpQdV6N5FLMhnTNKw54mXpuBxlWKFidStZszQqeyHtl
	8JTH8h3b1MbDZ9I+buFpSSU7INHswDlRJUdLqy3DtfuOUmGjQHTqr2V/ZIn+IRb8QI7xfwn68pOPI
	LjRLXF1w==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w43UH-0000000En6v-0nxi;
	Sat, 21 Mar 2026 21:04:01 +0000
Message-ID: <6d2f87da-9485-45a8-a322-6b1582c41ad8@infradead.org>
Date: Sat, 21 Mar 2026 14:03:59 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] docs: allow inline literals in paragraphs to wrap to
 prevent overflow
To: Rito Rhymes <rito@ritovision.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org
References: <20260321141118.23828-1-rito@ritovision.com>
 <20260321141118.23828-2-rito@ritovision.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260321141118.23828-2-rito@ritovision.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/21/26 7:11 AM, Rito Rhymes wrote:
> Some documentation pages contain long inline literals in paragraph
> text that can force page-wide horizontal scroll overflow and break
> layout on smaller screens.
> 
> Override the default `span.pre` white-space behavior for inline
> literals and use `overflow-wrap: anywhere` so they can wrap when
> needed. For code used as part of a paragraph, wrapping is appropriate
> because it is stylistically part of the surrounding text. Code blocks,
> by contrast, are meant to preserve formatting fidelity and are better
> served by contained horizontal scrolling.
> 
> Signed-off-by: Rito Rhymes <rito@ritovision.com>

Tested-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  Documentation/sphinx-static/custom.css | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

-- 
~Randy
