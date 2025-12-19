Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36E34AAE0;
	Fri, 19 Dec 2025 17:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766166944; cv=none; b=WL+NcXI22zgzDcZc+z1x855naUUQiJfKb4q/hHGyJqmNYiKEDVS1grTBnXvAGSvnNVAUY+iKq+4R1yP2wmPKUd7cFAFHazQBBLTZZh5Nc8AQoYZxSQSI5d6gGAAek8rM3Uwgs5h0a+4G7h/PdiSNqNPe8Xu/dKUFCzUHYF1eqK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766166944; c=relaxed/simple;
	bh=SJv6+hvH9ZVKy53uhm6T0C/UglfTrJjihu6cZ5L9gSI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBzH4VwLKulZaVoEV4OVK12zIHNgZ78UXf4QR3zkOf9Qn5MT1pX4FoOIGqgWpaT+l12ocErxg/kbA6ntfA/iVbJdBEh0A6L42ShjUwncUam3ZHExWQzBRX2iOfZbJ09GTPO1LyUiUS65Pep7m33nNfZuLxuU2Jv4PggHfRjq48I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=qvRHlcW1; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="qvRHlcW1"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=3aW+h2P7/Tt7Gd/nWwpsJRVh3t7oBihrK8aIJSRotrY=; b=qvRHlcW1xkaDCV1RcnXc3NmKmN
	tzmrAClrqFi3cQxxnGokJQQQP4QGX95g5uy2kck56TJmaoAKZTMjMOh8HUtqUJ338X3QO2lLVWT83
	cwWb4wP+UHu8o+Odx2MCrx6BcuTVWKzeCUClsHW5rMd/sAd1NQzyL2glyBl4bCxmuPiRLJVsNXI03
	qImp3fQHiGQ7kpvaxzg11uuDTGwfYhEI/thdUyfDL+ZNuJHpfhNtU6dhxiJe598E5rZE/i9kxKkzv
	1KvF6SsV4Mkdzb3XhDbx292BhbSFdf6QN/4IeFpoyjwRVSyVT29RBL0UfWC6FxtM6CV84fQ1V/WFI
	KKutA0RA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWehV-0000000AjuP-2IsB;
	Fri, 19 Dec 2025 17:55:37 +0000
Message-ID: <6bcc9d9f-102e-4f13-97a8-7ee273e71fdd@infradead.org>
Date: Fri, 19 Dec 2025 09:55:36 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: kernel-hacking: Remove comma
To: Thorsten Blum <thorsten.blum@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251219171827.44015-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251219171827.44015-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/19/25 9:18 AM, Thorsten Blum wrote:
> The comma is wrong, remove it.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

> ---
>  Documentation/kernel-hacking/hacking.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
> index 0042776a9e17..06fcb7c662d3 100644
> --- a/Documentation/kernel-hacking/hacking.rst
> +++ b/Documentation/kernel-hacking/hacking.rst
> @@ -49,7 +49,7 @@ User Context
>  
>  User context is when you are coming in from a system call or other trap:
>  like userspace, you can be preempted by more important tasks and by
> -interrupts. You can sleep, by calling :c:func:`schedule()`.
> +interrupts. You can sleep by calling :c:func:`schedule()`.
>  
>  .. note::
>  

-- 
~Randy
