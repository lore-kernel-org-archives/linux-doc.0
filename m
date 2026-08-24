Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F11B46C4A2;
	Mon, 24 Aug 2026 16:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787590774; cv=none; b=PognjnR5U09SlG+xz+NpURCEnxLo4lKrcLdFBVjvxtLQVsVGY1nZT26XJ8Pk9Q7U1mcGAHrokTDEAo24M8zL2XLdfYCtIw7rzpaKWhGss4g58xB3qBHbrmI2F0OfcrwxTVK7XZhPvKQWHjlc+l5yEEtTKg2T1g4vP533oR50UdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787590774; c=relaxed/simple;
	bh=OOSp9+a4MbQcII0jiTyvAjIf0Jbfd9ztDpQ6nY9IQQc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HCdyVce4fI6C5bqn0bJn/GtZPtrYUYWYue2xvRBFzXbpKoaL9i6GvgS9Q5kiWhwh4yydhrr5aODE1t27zmTYWk0FQlZB+hwUlk5m9tlgUk4532qIQ2b7bsschF/inG00r4cOMb2gG0Rq7No4UUiJC2EV/+1zn4MqNALKsD2WWoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MtR7XnEP; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MtR7XnEP"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 63AF8408F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787590772; bh=ZSkZPBfV0Xk4j0XWtt0t8C6nKLcOsrmR8S+4fXn0YRA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MtR7XnEPVxlSn3puUDoVjXM/1zqeXI9rO5woFP9206gCl9JlZJZqmiPTHSUf6fzs+
	 2dq7tUiV/8tQuMbtvDLyZ4rFXqpl/tgRYBx8mogJoSnzN3gGcQXC/V40eSLqI87DRH
	 vd2u1QPp/+h8aDZvKxbrmIFxuKjzL6FF9wh8JnDuD9IVCrVTSZKUZGEHh2xY+6Ojgf
	 G9G6zghAzPiVjYbJM+LdsQce7DZgQFuez4OmHSDxjzo6u08e36owABT5eXqVA/TZhR
	 jCfhloPRh9NG3EXPSDGs9dysbBsyLAcGRKx2kfF2DpL70vIG/iRpXmJMcq0/+5dKCw
	 /ULeRZv2RIw1w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 63AF8408F8;
	Mon, 24 Aug 2026 16:59:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: weibu@redadmin.org, Akira Yokosawa <akiyks@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs/ja_JP: translate submitting-patches.rst (tag usage)
In-Reply-To: <87qzjn1wkp.fsf@trenco.lwn.net>
References: <20260730130030.1078990-1-weibu@redadmin.org>
 <a13ae6e3-1f84-477a-9bfc-0a4a55152400@gmail.com>
 <3000b5678dea68fc42d5f7c2484ded30@redadmin.org>
 <87qzjn1wkp.fsf@trenco.lwn.net>
Date: Mon, 24 Aug 2026 10:59:31 -0600
Message-ID: <87bjarzc7g.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> weibu@redadmin.org writes:
>
>> Hi Jon,
>> Just a gentle ping on this patch.
>> Akira has already provided his Acked-by.
>> Please let me know if I should resend it.
>
> Somehow that one appears to have fallen through the cracks...my
> apologies, I'm not sure how that happened.  I will apply it soon.

That is now done.

Thanks,

jon
