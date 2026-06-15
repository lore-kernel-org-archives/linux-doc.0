Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5150C21ABD7
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781538968; cv=none; b=Mvjg5lCM/+I+jfVFrU22CxETf9UfIq42CjHA93wjnWxYV3lKU7UgelS3ER7N3GtZg+3X3jDrr9ehblDEz2FObkj4JbpzlyaEVV8X9zrOBHbHlXN+o9vdpaA6lSY+dqRXVPyk/QQt/iptPOpHrBMHPWrAq5elAYayaE+3KXlUmJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781538968; c=relaxed/simple;
	bh=rtmzt0Bo4UAjPWgd+rMqGOO1/v8DFoqmyLB/UYaScSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FshRCfDyHM0opXTdTlZ3SBbdVatOnRmu0Tv1eztGuJWQrhzHwOXP+SJmlAgGIMgM3+DszIBzFU+sYw67QH+bD4FVyIRQR6MnPAb5bb78vnUCy+22eBFJKqHpEXEwajwM54dLyQK9XEHUrMXMGNupg8y48oIScS2OOXSTrGBaLDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=J3kpCxug; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="J3kpCxug"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=iOACIpXJ++eOjLmCAoWdV1eL4i8X3VvemiOL2C7UM7I=; b=J3kpCxugR8s1sHli3OhscbtcKx
	WO4EtfK1yf8Smic5vKUSG83sip1IR5Lt7pQH0lJVycYabO8BPxSyqkXusJeg5HFlqYCw7fL1aMyK2
	GRW/utR4yB4b+zljvS0/5aYIV08ecNPcIWxIFqsLzH1VSlVySXQfIW+WWHQiu+6Igkbq0KS5jvPKW
	6ibgxJvElOG+PLrvHORhHXlB8WKaIgB3VqU3vO3FBjfM5RNa+y722UTsS0k5TF9UgtMiQ2ifEb2zf
	nhqF6mGlBl3XugRXsIcd4P1UYBBIL/lLzNo6iS0cGedL9Lew1rHcy29fuPUH7042k8HcHL/Red36I
	NoUdBq/g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ9fS-0000000EX4y-1b9e;
	Mon, 15 Jun 2026 15:56:06 +0000
Message-ID: <2dd5b94c-0cd0-406f-9402-a26250b3c6b9@infradead.org>
Date: Mon, 15 Jun 2026 08:56:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Fix regex for kdoc
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
References: <20260615154057.2156589-1-willy@infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260615154057.2156589-1-willy@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/15/26 8:40 AM, Matthew Wilcox (Oracle) wrote:
> The trailing '*' means "all files in this directory, but not
> subdirectories" which excluded tools/lib/python/kdoc/.  This is surely
> not intended.
> 
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0d94420eae3d..999957a3e0ca 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7653,7 +7653,7 @@ S:	Maintained
>  P:	Documentation/doc-guide/maintainer-profile.rst
>  T:	git git://git.lwn.net/linux.git docs-next
>  F:	Documentation/
> -F:	tools/lib/python/*
> +F:	tools/lib/python/
>  F:	tools/docs/
>  F:	tools/net/ynl/pyynl/lib/doc_generator.py
>  X:	Documentation/ABI/

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy
