Received: from relay5.mymailcheap.com (relay5.mymailcheap.com [159.100.241.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF05814BF92
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.100.241.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781140057; cv=none; b=CyL8iJUf81RXS/gPtvfo9Xd9N0D3nZyjWQsmHwRl+yL9R/ULCzWfWfr3tmMIuuVbFAul7pkVTlxUTDRYB3QkuWItcZJN2iqOIKw/rcEBP26FGJWcXZMW2BezisndWchLILkSa2e1Q6rTghRSUMJ3JXb1bXidI7mDqLEJ8lOCR7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781140057; c=relaxed/simple;
	bh=wcUExsndoOlvj/KV7BBmXF9Xwy2u2NkpBQ2daipBiOA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Od2HQS/5H96TNg5qWmKilrXTIFigA+CARRaTWvq7MVm1LT0/JNYqp9nyBarJe5AwSodWbRb3R6LPZVlHrtNs1GfWEnx+U0oi6Zqs3JMgfy8dJP1JnReIzgekIIrbAIjdlv3BlAu1cW/ijE3QbXdGCYxbTYcW5ebFmgPqp3kw9N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=twMZOShY; arc=none smtp.client-ip=159.100.241.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="twMZOShY"
Received: from relay4.mymailcheap.com (relay4.mymailcheap.com [137.74.80.154])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id EAB4520063
	for <linux-doc@vger.kernel.org>; Thu, 11 Jun 2026 01:07:33 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay4.mymailcheap.com (Postfix) with ESMTPS id D7EC5201E3;
	Thu, 11 Jun 2026 01:07:25 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id A9AAF4007E;
	Thu, 11 Jun 2026 01:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1781140043; bh=wcUExsndoOlvj/KV7BBmXF9Xwy2u2NkpBQ2daipBiOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=twMZOShYoIsore+E0/GaPVxD7xR2s9Rxe0/GVdmDYGEQTd2TSxWbMK5C85G/nC+TG
	 j0TE26gtzj/C+/KEudOYQMM8Bbc9q1GXrIWzDiB8T3djA7ViQlF/MmJYFYHLvK4CuP
	 PFIz6+ZHnovHorvU/kNxtEB1qTSzFDr+XtDBuaPU=
Received: from [172.20.30.22] (unknown [223.160.130.36])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id 54EF44100F;
	Thu, 11 Jun 2026 01:07:20 +0000 (UTC)
Message-ID: <5ecb345b-2151-4a74-86e7-5544e268503d@aosc.io>
Date: Thu, 11 Jun 2026 09:07:16 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/zh_CN: fix CONFIG_CONPAT typo for CONFIG_COMPAT
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Dongliang Mu <dzm91@hust.edu.cn>, Shuah Khan <skhan@linuxfoundation.org>,
 Kees Cook <kees@kernel.org>, linux-doc@vger.kernel.org
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
 Jonathan Corbet <corbet@lwn.net>
References: <20260610231836.186610-1-enelsonmoore@gmail.com>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <20260610231836.186610-1-enelsonmoore@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.30 / 10.00];
	MIME_GOOD(-0.10)[text/plain];
	R_SPF_ALLOW(-0.10)[+mx];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	RCVD_TLS_ALL(0.00)[];
	SINGLE_SHORT_PART(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,hust.edu.cn,linuxfoundation.org,kernel.org,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Queue-Id: A9AAF4007E
X-Rspamd-Server: nf2.mymailcheap.com
X-Rspamd-Action: no action

Reviewed-by: WangYuli <wangyl5933@chinaunicom.cn>
