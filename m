Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.61
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795700153;
	b=GZpr2AbfYsuCEOQcR9VzQ2VpeZyJ+uDf+bqjDcxgvfi3oUP/ziMQ8tdR2zb586ic5D8b
	 WfbmnffaJ8HQcET5CAtdjxifPiquwPMDsb6FIg4UTRIfv+lFpmkUCR/fzbA48KsV3tpEv
	 5vVDh+gnWDiOSQyK6qOR51/l7mrBI994OfUNKvXi9MuPwieKyahGdaZuyCwizqcj+5AME
	 tEN7TKyMCjLHWXlUEx623zBys1iTfaHLsq1zXB7pHdNdWGP0e3RUOyViOuax5iRfQc7dW
	 nVpswNsEeortQZawxG6Urgevlrf9z/KXQqEXUMuw1dPaqB1F2Wj/M76au4wtqJ8ThXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700153;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Xb09k+Q7S+nusy1E9oGvKPTatGNmG4h5RDxHcIpii4U=;
	b=NcboHs4220doOUR4AkCFsHEh9fsqT9nXRLyGXI2SH3HaQQBK94l8V0BPhGJDV4wYQyeq
	 iEEHnssJXjnQw7c+cocxWm2gyUiLuEgQT4kG/NKafuYQmwe50UY4qmGEuO5xeZ/f5VI78
	 71FhzHBLp2tP37FO0rYXjWGYkPF6HU8LLvl523Oq6utficzCdDS4AxCE/oQNMCiHKPrii
	 OCNYyPOvqC2cTegAHA72Ofp7bFRCy0g9cSyM5FMd8oOFs3rAZIG4iCPEbAJx14Yif4pOI
	 SCse0SUtTy0uEfihjtw0oXfQgc7p1FcLEMPTuOaOLuxbiLF+ta2qO5oKRlHxrtLhAiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CObOpJZm;
	arc=none smtp.remote-ip=95.215.58.61
Received: from mta1.migadu.com (out-61.mta1.migadu.com [95.215.58.61])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13863606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:35:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13863606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CObOpJZm
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=dUdgIW56zc2LmSVw8C0r8LZdqQmDkcHedRF69L+C9RU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795700150; v=1; x=1796304950;
 b=CObOpJZmLdQcR1KhwsX1sJzeNLJrle2kxiHgKrfXFVKhRL1cnhQQhTnA2mfd0SdtdM7Sfe1f
 9pq0+f1cgSqSZYwm71e+W9KMV2t1+nG8AvXi+pc1u1+fxfCwTHbEbLk99nJnNauUwT1AoRXhI2T
 2NfVFzJBJqaLG5HNQ9BvLKIw=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6b52514b2ec1a5b2;
	Thu, 26 Nov 2026 13:35:37 +0000
X-Mizu-Trace-ID: 6b52514b2ec1a5b2
X-Migadu-Flow: FLOW_OUT
Message-ID: <0d5126e6-7588-4cf7-90de-0bd193db8246@linux.dev>
Date: Thu, 26 Nov 2026 21:35:28 +0800
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
Subject: Re: [PATCH v3 0/2] Add RCU docs Chinese translation
To: alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, wy@wyuan.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
 paulmck@kernel.org, linux-doc@vger.kernel.org, rcu@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261126132523.6329-1-xiongwei.song@linux.dev>
From: Bruce Song <xiongwei.song@linux.dev>
In-Reply-To: <20261126132523.6329-1-xiongwei.song@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for the noise. git send-email returned "timeout" after the cover 
letter was sent out. So I resent v3 of the series. Please ignore this one.

Regards,
Xiongwei

On 11/26/2026 9:25 PM, xiongwei.song@linux.dev wrote:
> From: Xiongwei Song <xiongwei.song@linux.dev>
> 
> Changes in v3:
> 	- Some translation improvements.
> 	- Deleted unused label.
> 	- Fixed indentation warnings.
> 
> Changes in v2:
> 	- Fixed build warnings and errors for both RCU/index.rst and RCU/whatisRCU.rst.
> 	https://lore.kernel.org/all/20261118131636.5131-1-xiongwei.song@linux.dev/
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
>   .../translations/zh_CN/RCU/whatisRCU.rst      | 1218 +++++++++++++++++
>   .../translations/zh_CN/subsystem-apis.rst     |    1 +
>   3 files changed, 1269 insertions(+)
>   create mode 100644 Documentation/translations/zh_CN/RCU/index.rst
>   create mode 100644 Documentation/translations/zh_CN/RCU/whatisRCU.rst
> 

