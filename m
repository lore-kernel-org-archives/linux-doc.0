Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812094;
	b=vIW4Kc+wMKOyG2vUsa4UOCB5LMcPO4++hUbNM3duB1adLcyS8X6xe0eMxqiZ5yz5+tx1
	 qrLXbHEH/N7cJxdxRzYhXz68/ymegDqQ6MYxJvm09Yp/lnCsC1zVYBL3GhiYSXSSJxQk1
	 QWmyjsFqqDAtTO4jDFPYFxpKOKcaBCmzW7OepGbzuZiER+9jo9uxHSiAxK47JxNGnQU3P
	 RrF+q0g+9o+1cHmxaAIdnNNon4PxlyHUSx0cCYThO4e7EVqBL3f6upYCirsqIPLl+hUTK
	 WmJy5IMFI8ZffcIlBpcaQtGdKWxD4LqelQCjWuY+zdSUqKer+umrzSUVB+bE5hDSFZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812094;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=7LbIq7QtBuD8l1ZM3ysDGC4GsDSWb7XrF/nM20+iPNU=;
	b=i2ZTBmRTtM/rw1QnRD+v2TGBtFY0Vo0LbfkwcDgWjGV0Bf215JNKnsZhkmFexX9hJqrv
	 +gi9fUPMBCSNsRZQ9ZgbkMd/mdSedmlZujcV7KeoodAhYLFZ95bkZoJratNqwPFt7q+l9
	 iK1ubg7RAldmZQDL/QZTRe4DQrX95oB+EwstzonfDjkeLPvprHMlUxr318KYGEjJTZ0wF
	 CW1OgrmWglZfb+7X7rqDZ442sThoKLrM8nzrXSZ/6SAys45ATPvbvNWT6j1iER1gVC0mC
	 N+jHv0pIooIAzxxmYyHkn5nzHyOT01MI3kh3spSBeVqUoVP60YewMeAR3CqrHmmPn3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkDuJUxA;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5691E606A31C;
	Fri, 27 Nov 2026 20:41:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5691E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZkDuJUxA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=7LbIq7QtBuD8l1ZM3ysDGC4GsDSWb7XrF/nM20+iPNU=; b=ZkDuJUxA9cZyB5AMHphN927eCi
	FYGWouY7hPHj6talUX8YvUrIt/dci8NmB4AqJtX5VgzGMt7CQpueHa9dyDeyYxvt5X4knIbwDsN3t
	Zd/QNABiso4PIzKSRmG7Kkb63qiTjEuLOnd3aOPwwKA6e3yppVLCdqrIeuwqCTLRTKTqfWmZNa6RJ
	JI4d8xTR9MzoNzvFEN6gSuVB7WKRbDF3Atbxztart7n4EWC5ZURYJOl0vGsUnZjjJMqGxT84xzXYS
	K+TjfpXMAVrAdo6sdJeZzxapyG3oW+KfxdDEZ95tlOzcXKMpRX7u5GC0fISQH+1UCmTPXX2ypiY7O
	Y6YYf5OA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX2l8-000000004Xo-3KUI;
	Fri, 27 Nov 2026 20:41:30 +0000
Message-ID: <17a9f3e0-f075-42de-b173-ae334b51d0bd@infradead.org>
Date: Fri, 27 Nov 2026 12:41:29 -0800
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
Subject: Re: [PATCH RFC 01/10] Documentation: coresight: cpu-debug: Fix the
 module parameter name
To: iav@iav.lv, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>,
 Feng Tang <feng.tang@linux.alibaba.com>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
 <20261127-b4-coresight-cpu-debug-lockup-v1-1-69d3ad1e0fc8@iav.lv>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-1-69d3ad1e0fc8@iav.lv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/26/26 10:38 PM, Igor Velkov via B4 Relay wrote:
> From: Igor Velkov <iav@iav.lv>
> 
> The parameter that enables the debugging is "enable"; the module has no
> "debug" parameter.
> 
> Fixes: 0cd555c35131 ("doc: Add documentation for Coresight CPU debug")
> Signed-off-by: Igor Velkov <iav@iav.lv>

Acked-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  Documentation/trace/coresight/coresight-cpu-debug.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
> index 836b35532667..32fbae244524 100644
> --- a/Documentation/trace/coresight/coresight-cpu-debug.rst
> +++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
> @@ -130,7 +130,7 @@ If you want to enable debugging functionality at boot time, you can add
>  The driver also can work as module, so can enable the debugging when insmod
>  module::
>  
> -  # insmod coresight_cpu_debug.ko debug=1
> +  # insmod coresight_cpu_debug.ko enable=1
>  
>  When boot time or insmod module you have not enabled the debugging, the driver
>  uses the debugfs file system to provide a knob to dynamically enable or disable
> 

-- 
~Randy
