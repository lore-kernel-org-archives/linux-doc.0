Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322482;
	b=ZcDDcJBOdlcewY6b8BvDg3oiJUURpH1eThwlhAiG32OIBZ5JjYYsfQ4G9BTZi92yw2yK
	 y8VCToUHxxuagtWrAydkmpnjV5FwaqMEqt2WNiM+OUJf52uDdYREr2g/bmO7NCvABlAE8
	 j0TdYYtS1/Su0C/+eGZSJY4tAz7hrdSIgLBRmPg3ijL8IYCuVJgjEycFK2YUb/6K7s29N
	 XXLIXr2GsJtUVveuzRN3ciAiwRSB5ns2p3AEKQUgAfJMg/aqvY2WF2AY55WnyRzeN59Pw
	 kvAXSzWUm2V8EvAmlz4U7A/AyqDs+6h6UziVXY94Nmazi7ZmGOm9a/eUDLhn9LLEpZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322482;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=i8nCWJsIMi8tRj0NbiJ3ZAa3Z+5NAGFl9nF3hq0mvIQ=;
	b=4MeB2GB5uDMTmbnZ/vq4teCdd0lQb++Wx2zGtYRZ9Ryz69AYVFP6L7BZCVLDC6Q19EMt
	 24Hu/l8DehDXeVlFbEZ8YIO4S/ifHeJ0ci01jmHQSfYzH9MedaRwwq6FTiR6J3I5nbYCk
	 Uv3NFfNSGVK4u++i+9zbbEBUJOGlXuYpNHB/S/WsEHbo+TIlMMPnlgtzOdkiqXJ5l1C4W
	 3HzDU4MZgZUjEDxlYMIalfAAq94AykoqJZy7Q+1+FkfPKyvjVQMs/6GdAXNZicnF2e9w/
	 7Nc/l1Y8n57lyIWR8zNCPGo/eQt5nwhmc0lzgIvDzWNqp9X/mDqtMaYhCa9UQGZqSgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q5mB7zM+;
	arc=none smtp.remote-ip=95.215.58.73
Received: from mta1.migadu.com (out-73.mta1.migadu.com [95.215.58.73])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A76606A31C
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 01:08:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87A76606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q5mB7zM+
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=YV0ZAZQA7eLGOxIXAY73xMRJkv0rtAiAQXAfZzs6aeU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793322479; v=1; x=1793927279;
 b=Q5mB7zM++DjyM9P+4tEVYPrHMRCXGM6eJxdy1H1mVQ2xWLnNdMgk0viAK/35pesMpWcHARNQ
 ycsPqk0Lptn/DfUft1lWrO0xGBTcaUqz8ON5yx159rbEaj31/QgO6TGsJoERVKGJtLx6alEZIh7
 gmL+X3vx1kk2YDpNAzA3QmLI=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cdee6e35ee4de474;
	Fri, 30 Oct 2026 01:07:59 +0000
X-Mizu-Trace-ID: cdee6e35ee4de474
X-Migadu-Flow: FLOW_OUT
Message-ID: <89758699-95f0-4c2a-bda1-c1427a45e91f@linux.dev>
Date: Fri, 30 Oct 2026 09:07:48 +0800
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
Subject: Re: [PATCH v3 9/9] docs/zh_CN: remove stale Original fields from SCSI
 and IPE translations
To: Dongliang Mu <dzm91@hust.edu.cn>, Alex Shi <alexs@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Weijie Yuan <wy@wyuan.org>,
 Chen-Yu Yeh <chenyou910331@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261029124429.294868-1-dzm91@hust.edu.cn>
 <20261029124429.294868-10-dzm91@hust.edu.cn>
Content-Language: en-US
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <20261029124429.294868-10-dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2026/10/29 20:44, Dongliang Mu 写道:
> Remove the stale Original fields from the WD719x and IPE
> translations. Both English sources use the same relative paths
> under Documentation.
>
> Signed-off-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Yanteng Si <si.yanteng@linux.dev>
> ---
>   Documentation/translations/zh_CN/scsi/wd719x.rst  | 2 --
>   Documentation/translations/zh_CN/security/ipe.rst | 2 --
>   2 files changed, 4 deletions(-)
>
> diff --git a/Documentation/translations/zh_CN/scsi/wd719x.rst b/Documentation/translations/zh_CN/scsi/wd719x.rst
> index 79757c42032b..f56eef04fd00 100644
> --- a/Documentation/translations/zh_CN/scsi/wd719x.rst
> +++ b/Documentation/translations/zh_CN/scsi/wd719x.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/scsi/libsas.rst
> -
>   :翻译:
>   
>    张钰杰 Yujie Zhang <yjzhang@leap-io-kernel.com>
> diff --git a/Documentation/translations/zh_CN/security/ipe.rst b/Documentation/translations/zh_CN/security/ipe.rst
> index 55968f0c7ae3..51065bbc53a1 100644
> --- a/Documentation/translations/zh_CN/security/ipe.rst
> +++ b/Documentation/translations/zh_CN/security/ipe.rst
> @@ -1,8 +1,6 @@
>   .. SPDX-License-Identifier: GPL-2.0
>   .. include:: ../disclaimer-zh_CN.rst
>   
> -:Original: Documentation/security/sak.rst
> -
>   :翻译:
>    赵硕 Shuo Zhao <zhaoshuo@cqsoftware.com.cn>
>   
