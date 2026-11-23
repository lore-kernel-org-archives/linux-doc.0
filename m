Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.85
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439381;
	b=1C2vicqxms8JxAda2b9sOaco/ILkQ7w+skO9BlhmdHp8xsS4YE0aqdOoT7/RkifSSH9N
	 cKE/dj5izxQMIv0e3REquKP1+IG/2SWETttuFaFEQ7jrRU9LgqorNUZcA6VFKCSxmcHP2
	 w20+FMCeOEJVO46y2fDE24bmgw9Jdaybfj+/mpQWyYhaoaQPrVSaTqHHoBKazlJKcMq3j
	 OHd5z9ZMJnkbrUNeUu305heV3eAn0I+Sr7FuzokWsimhpLEyRGdiScap1Z3FJCx7qxzTk
	 BrbP7tVJx5KpBipQEhlIn7lqb9MSiYnuOTjnlM4SYHjb5X9ThrBBU23KTJvtldd37kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439381;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Nd5CZyfgwE7sFhk6acA7AVJ7d2R8SkDrM35xdBcCb20=;
	b=OO9/zP2ZBDMvW/1r5Wub+jf2lmINbsFLNLVdPSnwaguRzNLizH4+sdPqK61Ysza6PxXO
	 +KViUjvpeX/55aVCX9qn0z6VEXRDtcvcVYhBMd8nj9+1IvYYxE68O6GByzQcyYbqo3oEj
	 QLLBvRg0ya3YV8/y5i8Ze8DGvclNZ3PsPW5DK//qLPiZMALxn4U0mkMtYGNr7RjVwqVLi
	 XYhEoeZxa9qYPV1ZPpCXLRFR8bYEmyLck2saTevPTtcnY9K1e5mqM+Pk3vK2JKWw9Ljht
	 ULA/xtG7JQO03qheBjLbgUhpvsjAySjVW5s2z1d+H6BSK2bDymkLMXGmMkrMk1ECrNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BvURa1Xl;
	arc=none smtp.remote-ip=95.215.58.85
Received: from mta1.migadu.com (out-85.mta1.migadu.com [95.215.58.85])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65549606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 13:09:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65549606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=BvURa1Xl
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Kv6rN9MEKoiRHQDVdRKHKD/KMDKdWjoWG0A+b+UDD8s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795439378; v=1; x=1796044178;
 b=BvURa1XlwXBtVXOp1GHIZSfHVZ3wHaEiX25ev9cxSkZqV4En8XnmSSar1zKHxO14eiTk3i2D
 5LHf2uES0dI7e9krR4YNZpMGTRziJk9s1VUNa/cFUsaADqUim8D4b8qN3BMY47TPxEpCToxZj1G
 kZzixOeX2dGdr2S7hdFRiAEk=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9a2a31f03a0d30f3;
	Mon, 23 Nov 2026 13:09:37 +0000
X-Mizu-Trace-ID: 9a2a31f03a0d30f3
X-Migadu-Flow: FLOW_OUT
Message-ID: <86f3466a-c1a8-4673-98db-4c9a95277ab7@linux.dev>
Date: Mon, 23 Nov 2026 21:09:30 +0800
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
Subject: Re: [PATCH v2 0/2] Add RCU docs Chinese translation
To: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261118131636.5131-1-xiongwei.song@linux.dev>
From: Bruce Song <xiongwei.song@linux.dev>
In-Reply-To: <20261118131636.5131-1-xiongwei.song@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Experts,

Could you please take some time to review the series?

Regards,
Xiongwei

On 11/18/2026 9:16 PM, xiongwei.song@linux.dev wrote:
> From: Xiongwei Song <xiongwei.song@linux.dev>
> 
> Changes for v2:
> 	Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.
> 
> v1:
> 	https://lore.kernel.org/linux-doc/20261113013054.5662-1-xiongwei.song@linux.dev/
> 
> The following 2 patches are adding RCU docs Chinese translation for the first
> time.
> 
> Currently, RCU is not listed in TODOList in subsystem-apis.rst. I propose
> adding it.
> 
> Thank you
> 
> Xiongwei Song (2):
>    docs/zh_CN: Add RCU/index.rst translation
>    docs/zh_CN: Add RCU/whatisRCU.rst Chinese translation
> 
>   .../translations/zh_CN/RCU/index.rst          |   50 +
>   .../translations/zh_CN/RCU/whatisRCU.rst      | 1220 +++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |    1 +
>   3 files changed, 1271 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
>   create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst
> 

