Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA86F39EF25;
	Wed,  8 Apr 2026 21:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775683690; cv=none; b=iUr5OLrcI4R/pIQTEssv+eQ35gOa7XXcEuuRFahcceC/hAVyoVq2XQlOf+lKvhmAyCueTbr08ozkuRLb0Wh1LwALpn8uL0AOVmE3nNvH9DKuWhCy1e8e09J3aKpM9mZ4v3iFYo4RwFbKpa96XsutWEgrukrR7mMQyUp3Uojhw1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775683690; c=relaxed/simple;
	bh=engBedRuhrjbNk0xfZeM5VxZnVckToEwU2h0LTU/irU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y4hX0uI70iBrVG1ww8GOueUvP6Aj7Hi5TTGr1BxynWeMm+d4lC4zBA0hMLThkKf43ilBI5JNWbS0Ice/GAnxYD2Gz8YR0QyKwIMpmNQgjxjBSFmHI3opiSIQw1awzga5o5kG8B3/6CZwSwNPz+LOZmZ7tgD3POG823Iq11gwmkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Xr3JeG2Q; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Xr3JeG2Q"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uD2TBJhgLJhpmMQ77mqkAJN5JTU8a6U6wRIYcP/9EkQ=; b=Xr3JeG2Q0KNKr/Z8bwsVWnK76K
	xBbO3JsqGPtwdzRVfNKRyxadeDaiXpP94ZjFVeZfgIItEX4EtRO0x58PDipsZeDddX/2dg4xxcRHP
	78OD0uvOE1+vXQB1D3moJvdTcS4V3K/2WmCJDLt0olN4NUOs3C0YbJ8y1iRA5RILZoG/dukYQw7LT
	dDOKo8lPG9iOQay5X3EygLe9MmTiPzJElnWHzsZt6Ov+ssn91WgOexAvgv7UWd8iM2G0/kx6V/0sv
	qNPqZJl3Gr2Y+45TFZBVXcWJC/o5QN1y+vTuJiK+3cgaoSfTr8xFHoCWhlHbZP+Ul/aoDphppGOCh
	Gn2HmQ5g==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAaRQ-00000009R4B-3Nxu;
	Wed, 08 Apr 2026 21:28:04 +0000
Message-ID: <4335969d-8075-407e-963c-62f937c52917@infradead.org>
Date: Wed, 8 Apr 2026 14:28:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc: watchdog: fix typos etc.
To: =?UTF-8?Q?Bj=C3=B6rn_Persson?= <Bjorn@xn--rombobjrn-67a.se>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260408031212.2510235-1-rdunlap@infradead.org>
 <20260408205611.0f7e38de@tag.xn--rombobjrn-67a.se>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260408205611.0f7e38de@tag.xn--rombobjrn-67a.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 4/8/26 11:56 AM, Björn Persson wrote:
> Randy Dunlap wrote:
>> -Similarly to the softlockup case, the current stack trace is displayed
>> +Similar to the softlockup case, the current stack trace is displayed
> 
> "Similarly" modifies "is displayed", so the adverbial form is correct.
> 
>> -The core of the detectors in a hrtimer. It servers multiple purpose:
>> +The core of the detectors is an hrtimer. It servers multiple purposes:
> 
> And "servers" should be "serves".

Thank you.

Andrew, I'll send a v2 patch.

-- 
~Randy

