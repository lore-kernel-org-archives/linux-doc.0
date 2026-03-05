Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE9366831
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 23:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772753109; cv=none; b=mZjTnsL5aoISYQpy7SWYRDF6ajQ8C4f4DzP3rrUuDim0KQhGWc1l0exDAMZdwlOoqHheTrSjKp+Xq7PQB1rLiuT1aR8xtSBQ3dKUvEf6NAdtYXYX0r0fq7st8oZCnUqxfYpGZxvUmIMuNmOxTLXgKRw0+A7J7g6GZUa1mE8Nykw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772753109; c=relaxed/simple;
	bh=I8bx73URgsv+B3XTQJSC92UQ3HusOP8ucy62VFj9MGg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U4DuS74EzWuCQFJLAH8gPJSiPZNe0/XF3U/uxo0hBiy8z8XIYuxbCZnAX/5VfOpjTIb/m5aYmUc3h0PY6JifsDG+7ZkTFEj0X0K7KR9YtspPo62W6iHfkbTAj3vMywYFWWIIkI5M35xVvV4mT0RitM6Xz7A6cgOlr92rM845uQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q7328M9N; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q7328M9N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=8k/b0+8LyXoIZMHfVUIfx66lAJ/OS9UpbQwaLIKWq68=; b=q7328M9NNiN1wLQh23EDWeySmY
	o2jyE36EnBdbkONaoiR5NtNX1UwOiTbR5At3vwd0RG8ItJQ4nQ/NZ/RBwFXTa+SKR/UNfKHV/HhjP
	0oarY6t4tkwP65vTUhnZr0Fw0otiXIXOWNI5NeOfAozR9u0yLjLvdz5w1KsVor46QW+PqIJoLoNSH
	3RDNYbEwgdLmJiiCZg3ARil6tLQJA8ZCSYW60d+dKUxWh/EW3C97HYAZkO3+Lq3tZAZ+9or/Q58sn
	IBxmgDv7lfrfef6a/w7yuHXPalflGJvNfxvehhEI6FOH/DQWwMMMf6NmXGgSliLTrdcGg1UmfEfFQ
	dLsmdbMg==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyI3x-00000002ilM-3yj8;
	Thu, 05 Mar 2026 23:25:01 +0000
Message-ID: <4c5323a3-73a0-465f-b31f-b7737b92613d@infradead.org>
Date: Thu, 5 Mar 2026 15:25:01 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: printk: warn about lockups from excessive
 use
To: hujinfei <3288824963@qq.com>, linux-doc@vger.kernel.org
Cc: pmladek@suse.com, senozhatsky@chromium.org, qujingling@huawei.com,
 zhangjiaji1@huawei.com, xushuangxing@huawei.com, rostedt@goodmis.org,
 john.ogness@linutronix.de, hujinfei3@huawei.com
References: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/4/26 10:41 PM, hujinfei wrote:
> From: hujinfei <hujinfei3@huawei.com>
> 
> Add a section 'Avoiding lockups from excessive printk() use' to
> printk-basics.rst, explaining the risk of calling printk() in hot paths
> with slow consoles and suggesting alternatives like ratelimited printing,
> tracepoints, nbcon, and log level filtering.
> 
> Signed-off-by: hujinfei <hujinfei3@huawei.com>
> ---
>  Documentation/core-api/printk-basics.rst | 29 ++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)

Tested-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Randy Dunlap <rdunlap@infradead.org>

thanks.
-- 
~Randy
