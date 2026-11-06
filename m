Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952126;
	b=s7q/Elklqtnwng7JfSvkSFs8Qz/z28uNFZoi0eUOBq/liPvDUA9bWNPpnFWfK84B6p9s
	 u+uryNbpeUwLCMJZmqq1CP1LhejFWI55r7Pb2YiC+ZoyaZRmaBU2FmatZq8mHJRfvEjU2
	 iaqty9eCu6oP0REHT1C85887rAHw/WYZAJypaKfs74Z2PiGNflM5qbAg+7UJNWlKidZs7
	 7nt/IQVFiukJnIlDVclZoFQYcSvGoJ19wLKvIh/ahmGgbTEu7m3gzlrQTuWhn0FVuHV3Y
	 LzAIMJXe/x9g1slEUTe9CXTRv8t2l5VVZzCf+M8/Kwj3qOCTN1a/TsS+/FJUf3V5b4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952126;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=upa7e4x4UrpEceLbmQEOyIgK5o4Ta8XgOf1XRCNdVeE=;
	b=nvtHXH2moL37tPZ6L4x/VnlYOLET3mv3eRVvEax2vjXxzx3zxY0rbalAcCjd+z1jiJCg
	 uW5GqQmap8/E7jHwX0tXPophWeprbCEJALvrYwBvHL2ck0Cfc06WeDNZ0SuR+7rExXQ9X
	 J9MOAk+phhwNS3dpFB2ZBFzqHZ6s5SL8iYLFZJRtreSIFZgjZgBVQIoSVQxYpILXF2j9w
	 q4NOwOgi4d1CGaCtni9iEFA8qmcXUEPQ9PAdYugXsvSL7fxaKi4Q5gSj43VtBGw4CAltg
	 i5t8/c7koFb12Okzf8+rSyXm5YA3Y7iOUNXC5LWpqwxVZkJr9PUtGG69CHA/5+emjvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OZaIcwHb;
	arc=none smtp.remote-ip=95.215.58.184
Received: from mta1.migadu.com (out-184.mta1.migadu.com [95.215.58.184])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFD7606D82A
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 08:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EFD7606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=OZaIcwHb
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=EQD6iBRuzY9Hc1wA37z098al2hhKb1UV+0Ibj8J0Ad4=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793952123; v=1; x=1794556923;
 b=OZaIcwHb+DDIsVd1foyZgUzl6VTxzGHo4JVrl6m333TRfD3OV9/kxYXAiIuIClM6uQ6nyDqd
 vYPW7SL4InuoXwLVWgRszicy7yciyx8aFxzXdOoG6NJlhenwUknYe4aYQT8mPmWdK6e7XstG96F
 7QhM/sY4GrnUUo2B24sdRy2t+os1tR4Qp6Pcyr7EoboyxezoDIiAPtWTnv3comdBML60RL2zkqp
 rN97WTxhxzQ8Elhf8aZcbaXrz1hNNM/wmeVF+gEX/Z8+a0/vKB2833omQicyfkAA1PIayfKD2Lb
 yqznXYsyMlCGmbi7/ApqngeiXmBvvXCvpYMXtUzIO0nTw==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9d4b8561adbe0eab;
	Fri, 06 Nov 2026 08:02:03 +0000
X-Mizu-Trace-ID: 9d4b8561adbe0eab
X-Migadu-Flow: FLOW_OUT
Date: Fri, 6 Nov 2026 16:01:59 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Update maintainer-pgp-guide.rst Chinese
 translation
Message-ID: <au2Jd6oyloqfeXCo@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
 <85899751-7554-4014-896a-24bb916c572e@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <85899751-7554-4014-896a-24bb916c572e@hust.edu.cn>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 8/23/26 3:14 PM, Weijie Yuan wrote:
> > The script says:
> > 
> > $ tools/docs/checktransupdate.py Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.341547] Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
> > [1787244823.630509] commit 54857c52452a ("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")
> > [1787244823.680849] commit 6c5c07bc8589 ("docs: process: maintainer-pgp-guide: update kernel.org docs link")
> > [1787244823.730027] commit 273aa250f138 ("Documentation: Improve wording on requirements for a free Nitrokey")
> > [1787244823.779408] commit f44a29784f68 ("Documentation: update maintainer-pgp-guide for latest best practices")
> > [1787244823.779522] 4 commits needs resolving in total
> > 
> > So I updated this document in chronological order, created four patches
> > based on these four outdated commits to make it easier for you to
> > review. Hence, you can freely squash them when applying them.
> 
> I am not sure if we should use "So I updated XXX" in the cover letter
> message.
> 
> From my understanding, it is fine to describe about what you have done and
> why you do this here.

Fine, will notice this.

> > Tested with make cleandocs && make htmldocs, no warning or error made by
> > these patches. (Hope my eyes work fine this time :))
> 
> Haha, LLM can help here.

Ah yes.

> > [+To: Konstantin, as he is the original author, thanks.]
> 
> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>

Thanks.

[...]

> > Range-diff versus v1:
> 
> I think this versus is too long to read and it has no much information. In
> the future please do not add such thing in your patches.

Yes, indeed. In our literary work, range-diff may be not that useful
compared with actual codes reviews. So it would be better to just look
at the patch content directly, not range-diff.

Will pay attention this and save our time.

Thanks.
