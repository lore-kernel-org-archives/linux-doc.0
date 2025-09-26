Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E14FF28F4
	for <linux-doc@vger.kernel.org>; Fri, 26 Sep 2025 06:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758867427; cv=none; b=twqzfEw/hxuY3UCnRCdOZvErTqRyUEiI6SGklmiibgxH1U1mCVKbEFBcqUlYGFqY2dSvLda/MWC4jXG16y+b+Ixi+y0vaFn1YFcu21KclMoXbKw6xsXKLA4//TJ4jM0RyjTS1giGABea+H47qnKtM7tOqL1IBQOQ2/PIG66UQuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758867427; c=relaxed/simple;
	bh=/gM8OwzvODS+bUklSnHmHz8YqZuuCv0DSYEUDKHbTcs=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RAZ3QF1o8aHxJW4MvbEFPiRLSBxXp3BA8QwX7/y5QHGrjhsjz87zOp2yqOg+VvV4tjmNxNmfB7glqLNEy0/XeliLxPQDoi/G+QMVxbddngHZWCymUQaAoixE7BjRpx+Qd1Dcl3RGT4TM7+USHfjTnaYl6ow6WGrNONt6XtL7LiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=qFgp8Ebs; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="qFgp8Ebs"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 35F3B406FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758867420; bh=/gM8OwzvODS+bUklSnHmHz8YqZuuCv0DSYEUDKHbTcs=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=qFgp8Ebsv27hTl+J/J1n9+YXBk9qLBKYanVq4Ka0Ngkd8RmimY2COH7u83zeXuC9a
	 lNTqZIW2ZJdXYurYnKEKW03MvSM6JgRTh0Pw9SPuB2P+y6xyEpPz8kcImUHeb6nEIG
	 EsowsgC5As+XdSzIFf5Ta+O8Sk3vnpgT/3LYZMUZ/mlRQujW54SXS9u1o47wHNXbHM
	 5lAVrNEo9paA5wuySmK2ndCK/v+3JbK2yJFLY2WwZlhTx6/B2fXCn9VxdYpWarxGmZ
	 IdtQXRcIsNywuzcDHIkYMEgfQaWVrzkiVOGcP/N65IA3HN7oodeiA4z1m/mQX5Hnko
	 0/cZfLv2DiDzw==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 35F3B406FB;
	Fri, 26 Sep 2025 06:17:00 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: daniel.garcia@suse.com, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: extensions: don't use deprecated ErrorString,
 SafeString
In-Reply-To: <0a8ced1ad245b337181a7a29476beec3f1183987.camel@suse.com>
References: <20250925094508.43174-1-daniel.garcia@suse.com>
 <874isq4hmj.fsf@trenco.lwn.net>
 <0a8ced1ad245b337181a7a29476beec3f1183987.camel@suse.com>
Date: Fri, 26 Sep 2025 00:16:57 -0600
Message-ID: <87ms6h3fhi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

daniel.garcia@suse.com writes:

> Okay, sorry for the noise. I looked for this patch in the mailing list
> archive but looks like I didn't look too far.
>
> And of course, I should have checked the linux-next repo. I will check more
> carefully next time to do not spent time trying to solve something already
> fixed.

No worries - thanks for working to make our documentation better!

jon
