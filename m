Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A3D61FECC6;
	Tue, 14 Jan 2025 19:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736884567; cv=none; b=VwMh8xN+eOt4AJkwpFg8WwwR4zbZu+cWsxRJkG6MS6DblnjTKqcJfMpQaK8lAa9qyh/tWADurfPIUaYU4XHKgeZSzL7vGYqfkUABDYwKE+pcMNHvnN1352q8LIdymVEl4AVt+dixXGfUSdymP4ora/QvcgnAbUMutI2Qh58X7BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736884567; c=relaxed/simple;
	bh=Mp5LyUgcZks1LNekg5V1sn4FEoN0VUWll/3gls3C0WU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Y5rz8wrdZOHCmqmut36JH0SVCbiT3wTLCNPvFz5u9A02f51flbiFun+DSQg7mc2iFgfgwVB1XvRy7rOv74TVn9HCsDX9eFCwykn75XtUyTTPWDqreEPE14jKEfwrPTcjXuAEqwL0Mif0WrRUbuLt4C6m5N+dB0MaMtlyrBP21JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=i7/B/19/; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="i7/B/19/"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 47B13404F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1736884565; bh=L0QwMPCr+agEZaiJXYN/WbR1TSIUbriQDZKZA6u+1LQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=i7/B/19/8EUyPtpUgY7WMeNHAuUiznKBXHw81rPrNxcKrWOnKRdNSLgYR+5nunCzw
	 a7TyJN6SM8yXSdFGHhfDOEA30sr3EMV2Q2L75YMAXbrgI/DSUd/RfKksZ29O8g+FuI
	 wuQjrIjKqEpYGRPqfT5A05HP0AeunoS8tpmFDS8KiY3aanfChLlgy+VQuUr5/EqHrE
	 OS9fkykNnt1vrL0GpAbA1VFTDZuZ0bmRBxYCM91SkUKnkS5mRncWlb7bPoYd9wN3W/
	 t4Ehj6tV456w1Nnd8sgDtkzAxM1YfhXUgdSVx3V3elLR9RFtyvGGVOVVuWSG1LB53+
	 sxERrZS3zHbeg==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 47B13404F6;
	Tue, 14 Jan 2025 19:56:05 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Phil Auld <pauld@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/sysctl: Add timer_migration to kernel.rst
In-Reply-To: <20250114195047.GC149002@pauld.westford.csb>
References: <20250114140301.141147-1-pauld@redhat.com>
 <877c6x9vcy.fsf@trenco.lwn.net>
 <20250114174308.GA149002@pauld.westford.csb>
 <871px58cj9.fsf@trenco.lwn.net>
 <20250114195047.GC149002@pauld.westford.csb>
Date: Tue, 14 Jan 2025 12:56:04 -0700
Message-ID: <87jzax6ugb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Phil Auld <pauld@redhat.com> writes:

>> "When set to a non-zero value" or some such would, I think, be a lot
>> more clear and make a better example for the next person to come along.
>> 
>> Get me an updated version and I can still queue it for 6.14.
>
>
> It's sent but I failed to do it as a reply to this message.
> Sorry about that.

Doing a resend as a separate thread is actually better - no need to
apologize.

Thanks,

jon
