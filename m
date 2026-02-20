Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77C62D9492
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 19:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771617092; cv=none; b=Nmyl4jPiA9Yxbqb7+k3CG/Q0HQ8Pbh2xFghhoQ5UEPH6buQpEUf+MuHzx11Zvzsh98JCfLkoS64gJGS9t5dBwOsfJxXmQr4Man8sT1eTFrQ3iVk7E1ZPNIQxnIPbSIRiDWvu/q/jv5+oqd57hii3JzwtyH1GHTO/Nd2u2kd8dfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771617092; c=relaxed/simple;
	bh=jTcsRO225WnltwD4uVrFiWcuLvAaX7gfGhb0PXSAxfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mIOp7oEQXzHs9JbwhjJt5ZwwHD36g8Ft8r8KAyeNBhdxTLhgEmsizX8sZoUCZpMpQxbzZPVhL2tfWH03BOJomZRXua7xrZNeGrRAXZ2f2gk4ZAiXrLhERl/HYTcEbpwl6V9Yc9bxlIu2oc9Emvxc+GKEE+671mooLlhgjfPfRaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=04iw6sD2; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="04iw6sD2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=G/cwX7mz7VcjeibB1ELVtt9XfXY4eKDic+uAdaJM7ns=; b=04iw6sD2GcQExvqWoBnR62wosH
	vAIGLyaCIxpi2LTM78kYPtfOqbf5FWVCm26jUfozUXBaUGh8vcXIYbH0pyFYwDP+7CiyvjVzYU98g
	G6bhdMm6n2WEhDzwG1UyaIQo/YSZbV9Ddu9uT4TsAqQ+2LozNv/aBNp1pT8zsDUGf2PAzIplTxQr7
	VfHRu6sbqzM8AiuqSeSAVkEcO2qN4GuTYDDCz2bN5Fs1FDb9GVcLyivgW3lW/NnU/nTrVTpiOQHJW
	m9amBF7RLoefQbt0yiIqZZ/nw5c7SFlocj+YL5iIN8trUtRKPCy13Ij6rZhArKhYbg9yj6D4xooHf
	9884ywKw==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWXB-0000000FXNE-0XR7;
	Fri, 20 Feb 2026 19:51:29 +0000
Message-ID: <a6609dac-7fc7-43a5-ad49-497e7cacec40@infradead.org>
Date: Fri, 20 Feb 2026 11:51:28 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: polish Executive Summary and Intro in
 stable-api-nonsense.rst
To: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
 linux-doc@vger.kernel.org
Cc: greg@kroah.com
References: <20260220132910.9645-1-islamarifulshoikat@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260220132910.9645-1-islamarifulshoikat@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/20/26 5:29 AM, Ariful Islam Shoikot wrote:
> Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> ---
>  Documentation/process/stable-api-nonsense.rst | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/process/stable-api-nonsense.rst b/Documentation/process/stable-api-nonsense.rst
> index a9625ab1fdc2..120c10ec2ab1 100644
> --- a/Documentation/process/stable-api-nonsense.rst
> +++ b/Documentation/process/stable-api-nonsense.rst
> @@ -17,7 +17,7 @@ kernel interface, nor does it have a stable kernel interface**.
>  
>    The kernel to userspace interface is the one that application programs use,
>    the syscall interface.  That interface is **very** stable over time, and
> -  will not break.  I have old programs that were built on a pre 0.9something
> +  will not break.  I have old programs that were built on a pre 0.9 something

The original is better IMO.
Maybe (!) there could be hyphenated:  pre-0.9-something

>    kernel that still work just fine on the latest 2.6 kernel release.
>    That interface is the one that users and application programmers can count
>    on being stable.
> @@ -25,13 +25,13 @@ kernel interface, nor does it have a stable kernel interface**.
>  
>  Executive Summary
>  -----------------
> -You think you want a stable kernel interface, but you really do not, and
> -you don't even know it.  What you want is a stable running driver, and
> -you get that only if your driver is in the main kernel tree.  You also
> -get lots of other good benefits if your driver is in the main kernel
> -tree, all of which has made Linux into such a strong, stable, and mature
> -operating system which is the reason you are using it in the first
> -place.
> +
> +You might think you want a stable kernel interface, but you really do not - and
> +you may not even realize it. What you truly want is a stable, running driver,
> +which you get only if your driver is in the main kernel tree. Being in the main
> +kernel tree also provides many additional benefits, all of which have helped 
> +make Linux a strong, stable, and mature operating system - the very reason you 
> +are using it today.

This adds 2 lines with trailing spaces.
I thought that checkpatch would catch that - so did you run checkpatch on
this patch?

The wordsmithing is a slight improvement IMO, especially  "has" ->  "have".


-- 
~Randy

