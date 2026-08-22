Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F175635202C;
	Sat, 22 Aug 2026 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787419536; cv=none; b=eoiabrX7HJOSwvbmJPxF8oH8by3oHGTA5gNezN6ZQV9BnGxWKG/IVxJ9JwYM50jvNozgZKHqNAHcg+BkKaM2dEk01xuQmNkYAcZ3uEZqrMbikElRuAepDCwRG0VXSD79FWvlSC+V/udFxysLhfdj7S/26oOZjU3LLiCh9ZktYQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787419536; c=relaxed/simple;
	bh=R8sOdquYNcPJd4EAGLg2tgVpn1oJQjXV8qrSupNYGDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcrw7SWJfcYsXnWtvXkcEriUqtMXgzCbVL48/UaY7ZCvOchlZEbFpxRiZ+u3KF7L2EZmBh38Nf+enlVBHTLL/YW+HOHDBRM0913/OpkqTul/zlJXXNsk4Hy0kYhI1PSHTYNRmIPsWmBXPZWd25CTDvuW+rBWc9XC2esG+xIYpS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=yx1m0DVB; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="yx1m0DVB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hzN3BpD00VvrSqwfwSzT4yEA7ZiU3pR/Iwcvt2U9EN4=; b=yx1m0DVBMCs2sv6AU6A2g2Dn/d
	yDVkrnHhVokmm4aHVeuxSfKsbGqyLtQGZAXG70lIVU1bUSn9JQaLEC8WJ0Ua4ohUGlG1tY5Cuzofb
	KrezgVgX8R0jicsAs+aB3+dLWVwLRVix8DLCVkJGbE4Ohq33fQcgMO72HS67ExVWYhjn5BTXTXBnJ
	NkuIbxq0Ym4gG2mdLWVIICRB3NG2M4MFkM5dwXi3qP0qNjrjSUKVGpaIjIomh0mL7TuU9QvkJqtT/
	x3HETbV21rCN+yGNz7xDGgj4OlPcr3o0m2FFLYVtXRvUfmIcKhW/CT2GM8ICo25jOHyAVnLHjXrkD
	S84pUweQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxpTJ-0000000Egho-1CTT;
	Sat, 22 Aug 2026 17:25:33 +0000
Message-ID: <b9686e58-7e54-4226-a703-457b6db2f10c@infradead.org>
Date: Sat, 22 Aug 2026 10:25:32 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] docs: irq-affinity: Restore grep in example
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner
 <tglx@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260822121651.1559-1-kmehltretter@gmail.com>
 <20260822121651.1559-3-kmehltretter@gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260822121651.1559-3-kmehltretter@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/22/26 5:16 AM, Karl Mehltretter wrote:
> The command is missing grep between the pipe and its pattern.
> 
> Fixes: 18404756765c ("genirq: Expose default irq affinity mask (take 3)")
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

> ---
>  Documentation/core-api/irq/irq-affinity.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/core-api/irq/irq-affinity.rst b/Documentation/core-api/irq/irq-affinity.rst
> index 9cb460cf60b61..671604c7395fe 100644
> --- a/Documentation/core-api/irq/irq-affinity.rst
> +++ b/Documentation/core-api/irq/irq-affinity.rst
> @@ -53,7 +53,7 @@ Now lets restrict that IRQ to CPU(4-7).
>  	--- hell ping statistics ---
>  	2779 packets transmitted, 2777 packets received, 0% packet loss
>  	round-trip min/avg/max = 0.1/0.5/585.4 ms
> -	[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
> +	[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
>  		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
>  	44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
>  

-- 
~Randy
