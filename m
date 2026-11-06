Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793962768;
	b=wM0sKknjE9FhqbwB0oXi9Ud1GvuhU7gqLGftGsSTH5vkmF7SunDfraxuz5Nd3Ov/PSwZ
	 ky1kEGHci9s59nLATSKh/ci9HwuqwO5/DhQDrl4tvTmg58FMnyV0HMELhbaWQ0ZsgaR+R
	 ghOmwYuSDEJfSrbD0cNNNCHoHJLsKR5tOq/Sehx2NqAAack9pCrFFDGBqMSQRNNEhETIJ
	 DS6hxs8sCnanVHQU6EyzeGP8etCoYMh+NPayU6og1thosbV1Z+wmjoE3bH/nWe//BPl1f
	 AmTrhJTxhn9F3PAONyJfJPesqfVsiaGrC7uslRMcEvu7Asjs/172qZzJX+DNR/b9VQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793962768;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=YdF6PPQzQSFeCCYdMh8DWbPVW5HlWyGy7xDHzsQJrDU=;
	b=1H2ggHqPHn1u36Pqr/q0pO3RWSzDZQ0Y3NLI+dj6E1SmXpMDf5sYWRIVzZvQEyJgXstD
	 NoF01TxY19hts+G/aHbLw9Bv1ILplxePNrHJnsZsQ8IGc9ASZQwoP49Cr8fc0As4EkBwg
	 1XzCks5EfZFE5zhrFXqtJ81eXZXtM2RhI2JlQIII9J6wY1HEHyxh0dK84rqmLaVUhe0V7
	 ql2lQx0T24HtNmrFwhRUPMtZuXadJ98xYuBs5rrW1UqcJrSLyUDepzQSv4GaefmcrWR3T
	 ST29bU2IA0oKe/1ABzjJo5Ob0SlsYlM7+n8wNHwzw/sS0ET5edmt/ZdAzs1ct9RXdiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DvQnYnLL;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9630E606A32D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 10:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9630E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=DvQnYnLL
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net CF2234091D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793962766; bh=YdF6PPQzQSFeCCYdMh8DWbPVW5HlWyGy7xDHzsQJrDU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DvQnYnLLto+s309dfjEBLkFhrmti0tqaknngZDU39Ev/tFHYp6pTYdDlZu80gtSW5
	 yHByBtnuP8I8xEVEVKeqiehJSm/JxAYWI1HlVifnrk3VRQZpqyeXoJFH4DLs1/HLFW
	 D3zTUSI1gceNA9hi96kWhUNqbXaHU++f2oKufOuB8PG2N8hjUTM/bz804n29HKWvqH
	 tomaanoZXehWO67sS1aLXebA1jnZh0xr+9jZHHVTQdvZgFpYWL1v/rWuJjuHIe2KBD
	 jdvRgP7DesBky6wHhQGruUxJS35XOAdcr9d7y9uRZTzm09nuPl9OMY9q9BOcTZv3JU
	 5h0SPDTak3mEw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id CF2234091D;
	Fri,  6 Nov 2026 10:59:25 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Petr Mladek <pmladek@suse.com>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
Cc: linux-doc@vger.kernel.org, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Steven Rostedt <rostedt@goodmis.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Shuah Khan <skhan@linuxfoundation.org>, Randy
 Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>
Subject: Re: [PATCH v2] Documentation/printk-formats: Remove notes about %pK
In-Reply-To: <au2rp0Gas_C-bRgc@pathway.suse.cz>
References: <20261019083040.Fgpb8Jz8@linutronix.de>
 <au2rp0Gas_C-bRgc@pathway.suse.cz>
Date: Fri, 06 Nov 2026 03:59:22 -0700
Message-ID: <878q369qet.fsf@trenco.lwn.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Petr Mladek <pmladek@suse.com> writes:

> On Mon 2026-10-19 10:30:40, Sebastian Andrzej Siewior wrote:
>> The %pK is slowly vanishing from drivers. The %p already prints hashed
>> output unless overridden at bootime. It is not obvious for the user which
>> output is using %pK and which does not.
>> 
>> Some people pointed out that this documentation encourages people to use
>> it so here is the removal. I also update the translation since the block
>> looks the same.
>> 
>> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> Just for record. The change looks good:
>
> Reviewed-by: Petr Mladek <pmladek@suse.com>
>
> Note: It seems that Jonathan already took this patch. The plan was to
>       push this after the last users were removed. But it is not a big
>       deal when it goes in earlier by the documentation tree.

You'd sent a Reviewed-by on October 21; I took that as a signal that I
should pick it up.  Apologies if I misunderstood.

jon
