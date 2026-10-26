Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.193
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021697;
	b=mGuamyEYUm07jyAUcoc7ZhScpy8aBsagfy+ik9Wcs20c+fSYhhZeQalYlhcaP65Z4Qlm
	 frYuaWJGHzwYDti5xZc+5+djs5JQcRcWJyFH818OOLjGwhJde5ff3aIpqT7ZHzs+aKPHy
	 T22t5EgCOy3OUiOY+Zp2MMk1YwAgQ+u1eUHclgQ1kRb+dsH07TeLk9AdcFv9kD5rlC4t0
	 PmBhAUU8QOLCJiB9iqg9r4YOC01kd3zyasnPZCKwUIFIzL9MHyRIbVaAra4OIs2mf0E0m
	 HgdyEwLEGN4FmHI6Ypk3+VrCefycZJ2q1Jjg52prx9KAlwP0SS40iDxLUBo9PNeQOfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021697;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Content-Type:Mime-Version:Subject:From:
	 In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:
	 To:X-Mailer;
	bh=xR/zt8Fn8bNjdz5e+SUp/73xZBn1BSzckF/z3HA7yx8=;
	b=oiZLeDL1O87xgBu1SYwdbtkXhBjLmtTCX7qMdXMZVgoOcHyMINzDx9RQXumTUXAPpbVR
	 YHqes2NFUMEFYbE7D+BDvVGB+rjLogkUa01Sm8L4HRNKHVLl9wczc8uUSo9+Gxni89bEc
	 pmHXPli7vkz736UW6hXrhqngq/akjXnEmnqA3SJJFPfDQfZ/GLFVI0IR+Ev3qE63c64pZ
	 KX1ERr40Viimeb4K0qwGymuWPU6/Tz9a9viIp9UrnEKZObJXT4gnEztEwGupnzvyIUPBK
	 HwlZ6M7Ul7L6P/XxnL57e7B/PtKsTreHfFTQc0//RgLFjhybUW4QetShAMX353lU6FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b95hf2oO;
	arc=none smtp.remote-ip=95.215.58.193
Received: from mta1.migadu.com (out-193.mta1.migadu.com [95.215.58.193])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8A8606A31B
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 13:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D8A8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=b95hf2oO
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=B/1QP7GemvzA006XUysBM5X7M8mQ9nDSapjnqLDANwE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793021694; v=1; x=1793626494;
 b=b95hf2oOKU3J1aOvxO5GQ7XBgIFmgP9n5y+cmMnRrCwI8qDXSrZTMZyd9fP76lZ8DHd/AZqi
 43xt5cBBI1i5NXZZr0oYDbRfY3lfGbGgjSwixxGldISGM3qUwd4+TX9f6sBOzlBNaC/xAX7nzyd
 wYb/BfT6laPrUKnolY8jJZ2U=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id c0df3f82cb5f4210;
	Mon, 26 Oct 2026 13:34:54 +0000
X-Mizu-Trace-ID: c0df3f82cb5f4210
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH v2] docs: hugetlbpage.rst: clarify HugePages_Total in
 hugetlbpage.rst
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20261026080856.76175-1-lienze@kylinos.cn>
Date: Mon, 26 Oct 2026 21:34:30 +0800
Cc: osalvador@suse.de,
 david@kernel.org,
 akpm@linux-foundation.org,
 corbet@lwn.net,
 danielmaraboo@gmail.com,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <7B4E34FA-A8B1-41F4-AB0E-681659F38760@linux.dev>
References: <20261026080856.76175-1-lienze@kylinos.cn>
To: Enze Li <lienze@kylinos.cn>
X-Mailer: Apple Mail (2.3901.100.1.1.12)



> On Oct 26, 2026, at 16:08, Enze Li <lienze@kylinos.cn> wrote:
> 
> "the size of the pool of huge pages" confused me, since it sounds like
> a size in bytes.  It's actually the number of huge pages of the default
> size in the pool, surplus pages included.  Reword it and point to
> /sys/kernel/mm/hugepages for the other huge page sizes.
> 
> Suggested-by: Daniel Pereira <danielmaraboo@gmail.com>
> Signed-off-by: Enze Li <lienze@kylinos.cn>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks

