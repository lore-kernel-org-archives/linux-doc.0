Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592E5398F85
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 02:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764816098; cv=none; b=Vp+aXAPaZdjeBAHJGKbS811F/7CQC+iff9HPQ3qh5YcE7shl8Z6q1ikEC+JvBW3ANs20LUBNNuiEnGP4X5uMgEGhWDpdbepH0Elj2JfbV+f7QrMSuLI0g4eVjYEaZLfSANVd40s5k9CF6F47na7hOOYTDpfuzWJ1fzeG3Lclscc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764816098; c=relaxed/simple;
	bh=5K6jgapJZ+tRroY9bGtmljgwJVb+rU0TuRxyD2vMOxg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGwAY2CcS8PS/VMwDPpj+eAfTiiJpMqUJ15VEoBxW6v514mHHhTPWPNuQoA9Mk1uwdjexLgi5D3lnKdB2Y2JjDDCNlpLXIQKqyiEO9/b/gpBR6zTEH9oAZsjEdYJIu5iFA87lJmqHSivy1vmB1+rw7gUL8XgB8yIUaNnYMxX0/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=dx21Y4EV; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="dx21Y4EV"
Message-ID: <06600ebb-14a3-4f3b-af61-0f378e64832b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1764816094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XdDCYwyIl8E2+TS4RjnCcB1SSBB1VQ5wxVw3CVeZvSA=;
	b=dx21Y4EVau6epZ8vY4kSdQHSOrOsZq+0ZuamnhVh692abJRczMLiCm4rAEbNLWbfDilHEe
	LgCawmnpwX98p9dUT2xR/i9p35PlT6hH1qLO2cD0+MCSO5xpKN3gkuPpZYlMXlHt3Xog8d
	gMQ9HHTSoFtcs7EedQD2FjpAdzBQHso=
Date: Thu, 4 Dec 2025 10:41:20 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v4 0/8] Add Chinese translation for USB subsystem
To: Kefan Bai <baikefan@leap-io-kernel.com>, alexs@kernel.org
Cc: dzm91@hust.edu.cn, corbet@lwn.net, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
References: <cover.1764674650.git.baikefan@leap-io-kernel.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <cover.1764674650.git.baikefan@leap-io-kernel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


在 2025/12/2 19:56, Kefan Bai 写道:
> This patch set adds Chinese translations for the USB documentation.
>
> Changes in v4:
>   - shorten those overlong title underline/overline symbols
>   - Remove CREDITS section from index.rst
>
> Changes in v3:
>   - Updated the signoff to my full legal name,
>     as requested by Jonathan Corbet.
>   - Reviewed and fixed the RST syntax to resolve the patch issues
>     noted by Alex Shi.
>   - Kept the number of translated files to eight
>     to make submission and review smoother.
>   - Link to v3: https://lore.kernel.org/all/cover.1763984424.git.baikefan@leap-io-kernel.com/
>
> Changes in v2:
>   - Update [PATCH 01/25] docs/zh_CN: Add index.rst translation
>     to include corresponding updates in
>     Documentation/translations/zh_CN/subsystem-apis.rst.
>   - Link to v2: https://lore.kernel.org/all/cover.1763897036.git.baikefan@leap-io-kernel.com/
>
> v1:
>   - Link: https://lore.kernel.org/all/20251123074540.34161-1-baikefan@leap-io-kernel.com/
>
> Kefan Bai (8):
>    docs/zh_CN: Add index.rst translation
>    docs/zh_CN: Add acm.rst translation
>    docs/zh_CN: Add authorization.rst translation
>    docs/zh_CN: Add chipidea.rst translation
>    docs/zh_CN: Add dwc3.rst translation
>    docs/zh_CN: Add ehci.rst translation
>    docs/zh_CN: Add usbmon.rst translation
>    docs/zh_CN: Add CREDITS translation

>
>   .../translations/zh_CN/subsystem-apis.rst     |   2 +-
>   Documentation/translations/zh_CN/usb/CREDITS  | 153 +++++++
>   Documentation/translations/zh_CN/usb/acm.rst  | 137 +++++++
>   .../translations/zh_CN/usb/authorization.rst  | 125 ++++++
>   .../translations/zh_CN/usb/chipidea.rst       | 142 +++++++
>   Documentation/translations/zh_CN/usb/dwc3.rst |  60 +++
>   Documentation/translations/zh_CN/usb/ehci.rst | 216 ++++++++++
>   .../translations/zh_CN/usb/index.rst          |  54 +++
>   .../translations/zh_CN/usb/usbmon.rst         | 380 ++++++++++++++++++

Actually, I don't know much about USB. I would rather suggest you copy these patch sets to the USB mailing list, where Chinese developers might help review them.


Thanks,

Yanteng



