Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3301DE4F1
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 05:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=137.74.80.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763358354; cv=none; b=kd1Q8kq2YK6Q4+xrjzrz2zfRz4FdCto9gJ29EFuRR6VmF08sNt5fOXiNqb7udzXp/Zn9B8ZXdHbOQMj9SJcQdEf7kIRbkmvjevCnHqeMPoAhmy1l54qek3MuokqN4bsK/SWrIlh8eiiTcAVbQ/oIxasX0Q9QElC/vxxJ0Dn6naE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763358354; c=relaxed/simple;
	bh=EFvYX6e6bun4a/1UJvUtnloYAVABWUAq6VrNtL4E8LM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jDyq592sfbzdcgCXRsIO3ta5r++21mOCSq1GptrM5eUuLK2XVnv2Q1ZZ4a0yFFNKh9+pQdsaOHS0Ua39phVSqPIj6P9oVUDSjPu+6RGph5c0uB21LMCCicbVeADzYJJIIGfGpvYM+sPTdUtF1xr+1+JlCRWKnRNzCXVLw2ljrzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=RO3+AspT; arc=none smtp.client-ip=137.74.80.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="RO3+AspT"
Received: from nf1.mymailcheap.com (nf1.mymailcheap.com [51.75.14.91])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id 8204E20302;
	Mon, 17 Nov 2025 05:45:45 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf1.mymailcheap.com (Postfix) with ESMTPSA id 1FE0A40085;
	Mon, 17 Nov 2025 05:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1763358345; bh=EFvYX6e6bun4a/1UJvUtnloYAVABWUAq6VrNtL4E8LM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RO3+AspTaujAz67X/KOIrtGb7Ge18aCVJsFct78qQE7mR3ETexnxsQpq1r54LqKgQ
	 SL2KMuds2aXb/4o+1u7zN3bSwouCrVTZLFrVNmlzAIWm7pGL0plQ5xtvbAQdNrO474
	 DWbvHEUheTJ3NMKfC8yysAHo8eRJnbt+oboVk12g=
Received: from [192.168.0.64] (unknown [223.104.43.17])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 4080A407D7;
	Mon, 17 Nov 2025 05:45:42 +0000 (UTC)
Message-ID: <147f82f3-99dc-41a2-8c4d-9cd77b471f08@aosc.io>
Date: Mon, 17 Nov 2025 13:45:39 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] Add chinese translation for block
To: ke zijie <kezijie@leap-io-kernel.com>, alexs@kernel.org,
 si.yanteng@linux.dev
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1763350407.git.kezijie@leap-io-kernel.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <cover.1763350407.git.kezijie@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: nf1.mymailcheap.com
X-Rspamd-Queue-Id: 1FE0A40085
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.10 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:16276, ipnet:51.83.0.0/16, country:FR];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	SPFBL_URIBL_EMAIL_FAIL(0.00)[wangyl5933.chinaunicom.cn:server fail];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[]

Hi,


The entire patchset looks good.

Please feel free to add the following tag to each patch: Reviewed-by: 
WangYuli <wangyl5933@chinaunicom.cn>

