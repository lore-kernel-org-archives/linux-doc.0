Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771755;
	b=bCN9wo3phe0myjIrdgnbU3D1WCfYLdCxIrfWiqlrndX+7ux6EBk8hBWGbOW1p29Xvmwg
	 npkxsEm+kwwSLHeUAaw5pN4Mu2VZtEF6B6zZAZVnvGPDyyNXUzi74VelvDIhPjpW/4Hmw
	 Wp1ZsEbJ2LBRki9fYVXZjASovf6tnqq4qDY1/Z/avSDzaKfMtqmi1RqZM3hND9ZSWMWR+
	 Kb6FgEFGJk24lgVPV+13AU2oDp+SdfvMYXAAJ/96Gp/3KYDuPS2GdyzwJ3rdvyliBeUE9
	 Z5HpX7WrSMbg0udewPMUp4R5hNS3pjfcc0rkiFsKb2PknbXLr+gvku1DBbWKv7zMP3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771755;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=5ssYLWCxAfo5jDi/0Ktn+mc8LR1rGP66TW/9Z5LQ1j8=;
	b=rUfWGAUJTb/LJhc204SoVnfg32+qerszl5mDe+j6vEDseL42wDttAQbRiBbpY9odNMAS
	 IDM6vp8kL+ckSAspg0BWF/hhFECLix7KjfNkXFJsGPGXZw4X6AExORPvqosESeJfJlzyQ
	 lHIgu7zTwrMDGNZR64844FP1v0dLi7mYYDi3iQNyX9llu8Rtzo3puyQYUxS0RUzB1v/Df
	 XmPb9CRf/SghEL35zdCNoK90UnwHe+K2g1INlmgWT+w6v+mODTW0tj8sHEgCve6do6z03
	 DXCd+heRvStO0UJXo0NAhL+gi3nSJaBJtAhJ6GfDWvoo+YjF0cEsINUdyQrmaJMliaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y5QsFqKp;
	arc=none smtp.remote-ip=95.215.58.64
Received: from mta1.migadu.com (out-64.mta1.migadu.com [95.215.58.64])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F371606A331
	for <linux-doc@vger.kernel.org>; Fri, 27 Nov 2026 09:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F371606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Y5QsFqKp
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=AAFEebURwC9q020+aAeTJMGbmmnNTHzYTx7bv2ZbPG4=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795771751; v=1; x=1796376551;
 b=Y5QsFqKpPfh7VbTCp2KClTUxRJe1JamI1JJwtWAtl9RFIjoBiSKoeLl7/vNEFSLmKPSGeDR+
 XmysZh9pdGnlHGyd6KyC41aTZUPjNzY+hY+FvRfe+pWrDOlqOmFgXj8jSpYy9fp8rkex7tdSxdF
 NA9iCtuk7pq+TeChVHM3Rq0o=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 2556b294b86ac472;
	Fri, 27 Nov 2026 09:29:11 +0000
X-Mizu-Trace-ID: 2556b294b86ac472
X-Migadu-Flow: FLOW_OUT
Message-ID: <392d04d6-c6f2-4e55-9b83-afe7fe8f60f3@linux.dev>
Date: Fri, 27 Nov 2026 17:28:58 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v4 1/2] tcp: avoid wrapping Fast Open blackhole
 timeout
To: Yingjie Wang <x-professor@outlook.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: "mptcp@lists.linux.dev" <mptcp@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "rdunlap@infradead.org" <rdunlap@infradead.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "edumazet@kernel.org" <edumazet@kernel.org>,
 "ncardwell@google.com" <ncardwell@google.com>,
 "gang.yan@linux.dev" <gang.yan@linux.dev>,
 "kuniyu@google.com" <kuniyu@google.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "kuba@kernel.org" <kuba@kernel.org>, "pabeni@redhat.com"
 <pabeni@redhat.com>, "horms@kernel.org" <horms@kernel.org>,
 "matttbe@kernel.org" <matttbe@kernel.org>,
 "martineau@kernel.org" <martineau@kernel.org>,
 "geliang@kernel.org" <geliang@kernel.org>,
 "ycheng@google.com" <ycheng@google.com>,
 "weiwan@google.com" <weiwan@google.com>,
 "joel.granados@kernel.org" <joel.granados@kernel.org>
References: <cover.1795424546.git.x-professor@outlook.com>
 <f16def1cfc888fd26dad40f52e3e92b138bd3319.1795424547.git.x-professor@outlook.com>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <f16def1cfc888fd26dad40f52e3e92b138bd3319.1795424547.git.x-professor@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/23/26 5:04 PM, Yingjie Wang wrote:
> tcp_fastopen_active_should_disable() calculates the active-disable
> interval as multiplier * tfo_bh_timeout * HZ. Since all operands are
> 32-bit, a large tcp_fastopen_blackhole_timeout_sec can wrap the delay,
> even on 64-bit kernels, and re-enable active Fast Open too soon.
> 
> With HZ=1000 and the maximum multiplier of 64, any timeout above 67108
> seconds wraps. For example, 67109 seconds should produce 4,294,976,000
> jiffies (about 50 days), but the calculation truncates it to 8,704
> jiffies (8.7 seconds).
> 
> This issue was found using a static analysis tool. It was confirmed with
> a loopback reproducer that induces 12 Fast Open blackholes and opens
> another connection 10 seconds later: with a 67109 second timeout, the
> unpatched kernel retried active Fast Open. The reproducer needs neither
> kernel modifications nor error injection.
> 
> Compute the interval in u64 and cap it at MAX_JIFFY_OFFSET before adding
> it to the saved timestamp. On 32-bit kernels, the cap keeps the interval
> within the range that time_before() can compare, which limits the longest
> backoff there to about 12.4 days at HZ=1000.
> 
> Also limit the writable initial timeout to one day, so the exponential
> backoff does not start from an impractically long period. Writes above
> 86400 seconds, which were previously accepted, now fail with -EINVAL and
> leave the current value unchanged. The wider calculation is still needed
> below that limit, as the 67109 second example shows.
> 
> Suggested-by: Kuniyuki Iwashima <kuniyu@google.com>
> Signed-off-by: Yingjie Wang <x-professor@outlook.com>


Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>

