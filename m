Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794531341;
	b=kl1qUIJlbZBByWnGqBIqACSbthd4YK5VW8CzymG7AfqhS6tA4feM8xriS6IAj/Ep0Rky
	 FN+hDKmgPnQQf7i8jw9z5mxKuiclT/dPsaBuMWED7/NBO+JmosPLnaSA8/ImtqlOBJUuX
	 TPL6qDtcygAFyRmvWSzNIpMOCAxUxJ5cnhfwbvwDJJ1FV0aivJgdWY3SHWqe51ebu20vT
	 KEoVdWKpSe/gUkST+6/X1L3uqerxvIz4KjHeGt+WqYuqJBkD2Kzifp+127yPQUxnWroMu
	 xwa+ONfqNiKkoYAX7o+Xg4Rvc2csNilVrpAu/IRQV/eiUNIdzESqLxOPga5xsR5dg2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794531341;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=YIV8AzjRKQ457fVdvC9cmzWy207wxkKwWswzLM1Rqq0=;
	b=QKxHNyWqGxdzYIsZXUZpsjElb1yTy7qzN3/Ap19BZoosBJWDU5OWsFQEU1pzvRputXEt
	 KjqC3hsNRFkYH9nZa+XzxMHTw8ImwsV8hm43xnc6LZAaMCu0Zx7OFfNSl9+RScgTYqqvI
	 LYx3VzSvpx7CiEKtDZGRp6VfxYofYKetBHxzqOwVuTNfAQBEf4tKfF2fjHNdASpC/nhG/
	 LzLLSfx+L9Lyiqw53jVQtC9Fn2iE+n3IsW4AMWvQONjU/YKNOhA9W6w9TfAnNRpd1FQDo
	 PnTfjMTWWMRMmfYxeS8Imi1Z3r1TlrlBP/pRzH832aEBCc7I75LiuTJedm5u+HKIw2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hEmVTqqz;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C677606A323
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:55:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C677606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=hEmVTqqz
Received: from eig-obgw-6004b.ext.cloudfilter.net ([10.0.30.210])
	by cmsmtp with ESMTPS
	id RcjBx7j4RRiNxRfZsxzC8R; Fri, 13 Nov 2026 00:55:40 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id RfO6xTbbJlaNKRfO6xpOyg; Fri, 13 Nov 2026 00:43:30 +0000
X-Authority-Analysis: v=2.4 cv=UbpRSLSN c=1 sm=1 tr=0 ts=6af65d32
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=mgGIjpb2KhxFcZy2RHUA:9 a=QEXdDO2ut3YA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=YIV8AzjRKQ457fVdvC9cmzWy207wxkKwWswzLM1Rqq0=; b=hEmVTqqzt0Mu
	YE82aP7gKX+rOup052yGbDoYaDOnfVb5qmTBWH8/bfyOXMuwFEPeu3IgegcRyr8qWlrvDmlKVSeRo
	LRW+tQZ7mCS8LaiEu3QYV7Q5+da9itqfLV8fVFrE+aGtYureF1+lzs/ei87LK2FCg2iVtk2CXQEH9
	w47NktigSijrZFqWgMWOjrha7+GPWan29/ERuotvDy/NDfSHnf0GnrQjRpzTEwIrXXmJ0eEoFuYOo
	2i/KSIhnnxgTAZUGTjVy1eYlWM1DqPuSNhtFUI8GOrhtt7+U1hFqAuXQ8Z/EHRvsuzyZ7O1fPRngf
	JqckjbTPvnJ5UFlN8+A4NQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:37778)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xRfO6-00000003MQm-0cyO;
	Fri, 13 Nov 2026 06:13:30 +0530
Message-ID: <5f914d65-5e5f-456a-bfc7-5dcf830cce69@roeck-us.net>
Date: Thu, 12 Nov 2026 16:43:28 -0800
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
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (sht3x) Fix alarm attribute names in documentation
To: Wayne Ho <wayneho219@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Pascal Sachs <pascal.sachs@sensirion.com>, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20261112-sht3x-doc-alarm-attr-v1-1-91676362d133@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xRfO6-00000003MQm-0cyO
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net [108.223.40.66]:37778
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfKtpASxItXYERHbJ4o5C6uBKt/KTdnE9C4NTtv9NXIvJ27MyGcpjRPgBKrkYbcxqGvUacMvEMJaRivxlmxcx0CqSi/wRQr0lYLea3M+fTsFPNuLSAMmN
 5UmovZnSTGtxbYMcLNYMAIzx65sPsWjtWiRTLFuiwckKEqaD1ucL/CAvB2NWxIB6jgXEq8wPoRnwITCFwAzKRh2KssA9nd1ogiKZfhBWa6n9m3efNpF4t5jN

On 11/11/26 22:01, Wayne Ho wrote:
> The description of the periodic measure mode says that "the alert
> attribute" is set when a reading exceeds the configured limits. The
> driver has no such attribute, and never had one. The alarm state has
> been exposed through temp1_alarm and humidity1_alarm since the driver
> was added, which is also what the sysfs interface table further down in
> the same document lists.
> 
> Refer to the actual attribute names.
> 
> Fixes: 7c84f7f80d6f ("hwmon: add support for Sensirion SHT3x sensors")
> Signed-off-by: Wayne Ho <wayneho219@gmail.com>
> ---
>   Documentation/hwmon/sht3x.rst | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/hwmon/sht3x.rst b/Documentation/hwmon/sht3x.rst
> index 4f67671eb0c..3c022c058be 100644
> --- a/Documentation/hwmon/sht3x.rst
> +++ b/Documentation/hwmon/sht3x.rst
> @@ -78,11 +78,11 @@ The allowed update_interval in milliseconds are as follows:
>   
>   In the periodic measure mode, the sensor automatically triggers a measurement
>   with the configured update interval on the chip. When a temperature or humidity
> -reading exceeds the configured limits, the alert attribute is set to 1 and
> -the alert pin on the sensor is set to high.
> +reading exceeds the configured limits, the temp1_alarm or humidity1_alarm
> +attribute is set to 1 and the alert pin on the sensor is set to high.

Just replacing "alert" with "alarm", as below, would do the trick as well.

If you resend with those changes, I'll apply it, but for the future please
refrain from sending cosmetic patches. If you want to contribute, please
consider fixing real bugs.

Thanks,
Guenter

>   When the temperature and humidity readings move back between the hysteresis
> -values, the alert bit is set to 0 and the alert pin on the sensor is set to
> -low.
> +values, the alarm attribute is set to 0 and the alert pin on the sensor is set
> +to low.
>   
>   The serial number exposed to debugfs allows for unique identification of the
>   sensors. For sts32, sts33 and sht33, the manufacturer provides calibration
> 
> ---
> base-commit: 44c8ceae2dd3ae536c5f4f956cedb24c157aac23
> change-id: 20261112-sht3x-doc-alarm-attr-118ddfebc6ae
> 
> Best regards,
> --
> Wayne Ho <wayneho219@gmail.com>


