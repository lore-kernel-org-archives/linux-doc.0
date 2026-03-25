Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437BA3491DB;
	Wed, 25 Mar 2026 21:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774473289; cv=none; b=P1BrVru9zvCfF+W7/U5TPwzZ3vMjlp37y6NsA6urzyZut8JMI4O2zrvVdk+/jw1CPf7OS5mJpl3d/5SR1koUruVKMOXNQToHz0R3JIpL9/y7uLx4+dZOOw/3j8aFrLYT0RTiDvjxpXFT+AkY4TzmgtjC+4Dh+HsZRs+eb1/pqN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774473289; c=relaxed/simple;
	bh=yeTzRZfL+dEr6m1S/lDAsZClO2vAqlZlNBvWnyMw/+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xo5widUdA84XMeCYpHC+5e1pTUWeex2W6A6OPyphE1qdxrK2hmFs7zSTnDcxHXnEnSB5hMOmt04zE8kx1uhVH6lB/VDXi5rT4/lloT+jtDaz5a+4KkVlvfb533zcl7pyWXR1TmJsC4EO83JNyxR/CCch1Ypwvi3TysX8AeOGl98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CfKYx0Yu; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CfKYx0Yu"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 72A71411D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774473286; bh=u1vGk2CYKnV2eJF4XeiSIS1x6jXbf8xmqUdZH6aaZw4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CfKYx0YutFswU90qad4RJwdv9SXaSBmNLGN4M+SmyxBx3Hno9VSGF3yG1DxWDPZDU
	 fKr3RGs73IgbE1vCFthNMikpfEzmGecbQ1lhW32UJL7ORW9wm9SO6YyVqujogX5lu/
	 DnQhfCYdUFanTp4JPXFMBSFb5iHvEAHHsxEGP3WQxUKzM45HrO9OIW3EtjYbIUtJHX
	 LVRng2Vg8/Q5GidKwJ/A/HS183v5dsSNFv3BJfZ4vOpDg/MmQFY2gzhcGL5q72pqaM
	 uORSJZbpBvbmR0e3VuZ2T8OfclF36jFEEjwjzsSXtlUTeGIrV81iCDMMk+Mjs7LCOk
	 agqXuva1Zfy3g==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 72A71411D3;
	Wed, 25 Mar 2026 21:14:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, Rito Rhymes <rito@ritovision.com>,
 linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
Subject: Re: [PATCH v3] docs: contain horizontal overflow in C API descriptions
In-Reply-To: <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260323153342.33447-1-rito@ritovision.com>
 <87jyuzg2fi.fsf@trenco.lwn.net>
 <DHC5RBUT88C0.2OACW6VS3CYF2@ritovision.com>
Date: Wed, 25 Mar 2026 15:14:45 -0600
Message-ID: <87jyuzehmi.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Rito Rhymes" <rito@ritovision.com> writes:

> If you could imagine an optimal solution, what would it look like?
> Can you describe the layout and/or behavior?

It should wrap so that the entire prototype is visible, but the way that
happens on small screens is definitely ugly.  The trick would be to have
it wrap the way it would for an overly long line in the source.

jon
