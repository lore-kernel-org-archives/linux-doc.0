Received: from relay0-f.mailbaby.net (relay0-f.mailbaby.net [64.20.38.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1DA13C13E3
	for <linux-doc@vger.kernel.org>; Thu, 14 May 2026 12:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=64.20.38.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778762190; cv=pass; b=u3WO/EWI696jNY9bibwcDSCzo8B1nIU/9lw5ew+Y4duWTYULISUR973eUMOUUK3CmWcd1bzKCG8pKgR1w8+U5zsBa+VlcvCJJa8cgoJ7O7qA3OYQRoGNQGoCbBgttAt3Cu95M09k7Ek5YkJLd6clu20K06cxayVNgxGapb8v/w0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778762190; c=relaxed/simple;
	bh=hoMaBbcd7mH9fG9OW5HELnHuwSZ+gy26Cm1BxdW9sr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fqFiTA8shvYkV46S+29Ex7mbw/enhRoPXPA4HK/QW1VzEa5LSON/l74M1OVGjvstUN1ZdQc/uo7Syz96tBEw1jLCS18Gsi7C/V47YV6bcz3luh4pHADbb8vIUoBEifo2OYoJAAEFDaeQCT8nI0zOLQztEb27PoDgVkgXxLgejhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io; spf=pass smtp.mailfrom=aosc.io; dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b=BiNqCp8/; dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b=YETQ9mPm; arc=pass smtp.client-ip=64.20.38.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aosc.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aosc.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mailbaby.net header.i=@mailbaby.net header.b="BiNqCp8/";
	dkim=pass (1024-bit key) header.d=aosc.io header.i=@aosc.io header.b="YETQ9mPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbaby.net;
 q=dns/txt; s=bambino; bh=6PfMMpJsfSzY39e+2GkEg8LDIxduImJGPWlmqC7MfV0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:content-transfer-encoding:in-reply-to:references:feedback-id;
 b=BiNqCp8/20/TMEkFdeBSdKkNT8W62Wr4CltqOXyclYlqN3VlORO4avHM8DUcUac9IqOv5ytF4
 4IID5TGp27jzidmhnlmxEebnuIQbA7StSe5W+qQflfiS95fdScJHWftrr+MGThYNAdjCRPzxOSd
 QXzh7XldkYPz/8o08oPHn3Y=
Received: from mb-nj-kvm1.internal (mb-nj-kvm1.internal [10.10.2.10])
 (Authenticated sender: mb86144)
 by relay0-f.mailbaby.net (MailBabyMTA) with ESMTPSA id 19e2677f562000bf5c.001
 for <linux-doc@vger.kernel.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 14 May 2026 12:30:56 +0000
X-Zone-Loop: 87148afb9e87adb64f796cca5647ba2e4a7608653622
ARC-Authentication-Results: i=1;	rspamdcluster19.mailbaby.net;	auth=pass
 smtp.auth=mb86144 smtp.mailfrom=wangyuli@aosc.io
ARC-Seal: i=1; a=rsa-sha256; d=mailbaby.net; s=detka; cv=none;
 t=1778761856;
	b=rL3BBfHC65fKmcZuwmcY+z74Xx9QTuyulR01bKCktWJspvLub1JLFWb2DDUi/7+dbiMgbw
	XcqPQbyyxepUQh6T98/wUEroySm+cGN6Yj72iWnjGkj8B7ZPng36XFKoChAyb3QqG6D7t7
	h3tA9BnHlUUX6RCesCpDwsYPenYh+izOOgKftOmOwfi8Pli2cRIhxhqzSz3saOU2Hy/WcC
	7lK7Sm9mjh6LY77TR6rMftVsC/TZSoDrF6Dn0w2om8nQyp0IhAICaiwyzb4L8vpbvdqfzc
	oN5Yhx15ShvR6S3xHUp/XJV1gOB7bBTb+Gf6+UJpWxwztBHW/5Ffc+LaRHdjHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailbaby.net;	s=detka; t=1778761856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=6PfMMpJsfSzY39e+2GkEg8LDIxduImJGPWlmqC7MfV0=;
	b=qL726/HPYQeB6E7t0MDhBGVdvdeS5t2Tq+6nQp/4GQZ6Oz+KGheH6cYgsMCkgm2zPyBTvD
	J9d7lvgT+o7IYKegxB5wLIwBhETaR8f26deGuFQgienxwbT70TH1NT+1AuQG6wK0jnbh9H
	f1UWQJ0rOc1eBPR06qSm/5rBb3nQIq2m+jUGEHEJG79v5PjRt1Rj6aDjGHjEoAWgGNaPG5
	FnbRsZnBUdJM5ltLufx630h/fTC/TfCvAFHZm5eZA1UJ/czltu787FMLHwRX/70Kfo97+c
	WJ21iR92Sh7BM8f92/WXASF897G6yFxGAY+Z60ttkos0eVwM53bZHh0kPbTBjA==
X-MB-ID: mb86144
X-SPF: pass
Feedback-ID: mb86144:19e267:587f4d46584359477840504741595e:mbaby
X-NS-SCAN: PASS
X-MAILBABY-ORIGIN: PASS
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com [144.217.248.100])
	by relay5.mymailcheap.com (Postfix) with ESMTPS id 05ECA2621F;
	Thu, 14 May 2026 12:30:47 +0000 (UTC)
Received: from nf2.mymailcheap.com (nf2.mymailcheap.com [54.39.180.165])
	by relay1.mymailcheap.com (Postfix) with ESMTPS id 0799A3E9AE;
	Thu, 14 May 2026 12:30:39 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
	by nf2.mymailcheap.com (Postfix) with ESMTPSA id B1AD640071;
	Thu, 14 May 2026 12:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
	t=1778761837; bh=hoMaBbcd7mH9fG9OW5HELnHuwSZ+gy26Cm1BxdW9sr4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YETQ9mPmGMnM+ACwcEBvqNSSfrPqSNEVfqnBZhOW7DokElLTpVNLBR9KXVJWEeZAH
	 NI+cSu279gIBreVnfYz3P1QOEG0pWLhrkE1pQuvSGphB0sQZl53raNpn6W5iaiPk0F
	 DqmD65QKfEhTMO32pQ2NbgOX/XZ2zF8cR5TNeP6g=
Received: from [10.148.84.248] (unknown [124.64.22.153])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail20.mymailcheap.com (Postfix) with ESMTPSA id CF2CE410A6;
	Thu, 14 May 2026 12:30:33 +0000 (UTC)
Message-ID: <99f5a198-48d3-4282-beb0-5d384b9d9c61@aosc.io>
Date: Thu, 14 May 2026 20:30:25 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] docs: reporting-issues: replace "these advices" with
 "all of this advice"
To: Jonathan Corbet <corbet@lwn.net>, Chen-Shi-Hong <eric039eric@gmail.com>,
 linux@leemhuis.info
Cc: skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260514082808.655-1-eric039eric@gmail.com>
 <e2cced37-58ea-4678-a586-97f9a6db7e9d@aosc.io>
 <87zf22uquc.fsf@trenco.lwn.net>
Content-Language: en-US
From: WangYuli <wangyuli@aosc.io>
In-Reply-To: <87zf22uquc.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: B1AD640071
X-Spamd-Result: default: False [-0.30 / 10.00];
	R_SPF_ALLOW(-0.10)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_ALLOW(-0.10)[aosc.io:s=default];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[aosc.io,quarantine];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,gmail.com,leemhuis.info];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	DKIM_TRACE(0.00)[aosc.io:+]
X-Rspamd-Action: no action
X-Rspamd-Server: nf2.mymailcheap.com

Hi jon,

On 2026/5/14 20:18, Jonathan Corbet wrote:
> Please, no.  If you start churning the code in that way you will
> certainly get pushback.  Typo fixes are a fine way to learn the process,
> but I really hope that contributors will move on quickly to more
> substantial work.

You're right. I take back my suggestion.

Thanks,

---

WangYuli

