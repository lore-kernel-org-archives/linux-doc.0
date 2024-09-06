Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D496582499
	for <linux-doc@vger.kernel.org>; Fri,  6 Sep 2024 18:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725649099; cv=none; b=TiBUKpMoJQER7ttKexrS4l4BI+vMmBtaOF79XhcNBORGZEoFLoFBR0VDuajnQkVmYa2lepvC98qm+solw8a7WaT89C8oU9hejOBpFP0+kFQcvS/LcWaONhD6VoXSSV62KrflC+wOHaVrPDv8pFrgW+Ye8I4WUorxVwqJiflmDi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725649099; c=relaxed/simple;
	bh=+GJGIsf/GNmqEh/LCJBCHrAWzcC3VoN9mLZ6HvjumGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l3UaqGJtri0nAlWXme83ICSNasUPAkW/M2XkWGfXoq5fQQ8asXEWASzl4mffdsQtuKBe4KrMZMaYC7rCvd1/mZoGcbbxzHTboFLzHf6agw8Tbp6K93ES8yDz0lqMFlo4+Ymmtvmwm+yDkjZltkDtP+ChO1cRTY3rZOffQ5xVWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fOzH+ew4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fOzH+ew4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E0E9F42B35
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725649095; bh=EPkIjVYkyDGeKm7wBvSFb6h5SitylDSarmkLEZaW9Rs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=fOzH+ew48NNQcFbqStrx6ULYuBDFPvWWWoce9ZW3hBRyrojRMaAvYayfoBgQLDF0t
	 WHo7Wq/80r4xlQooiLcSGnuGO4KVkymBVe8MugJgxdiryFWEHUByY6eBld5NjRbJRS
	 MYfe26Xdk0pVABs2v7DtoNAx6zx5CNZ1VagnCmBtLGvG1AUzVs3GV7j4eXYm13Nt2t
	 WsfNQOc7umweg8vXesyUISoDqGmB4wgn84ZJyMagPs7AGOic3SqKIPQ3YZbgiYHqnN
	 +SxGiq/0AmuyD4DYIusI8r466vaJP/XO8GHIblzrMazlLHLKZ/Wvk2hWr+vC72SSIg
	 vO1sG5s7E/rvQ==
Received: from localhost (c-24-9-249-71.hsd1.co.comcast.net [24.9.249.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E0E9F42B35;
	Fri,  6 Sep 2024 18:58:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: kerneldoc-preamble.sty: Suppress extra spaces in
 CJK literal blocks
In-Reply-To: <bb98d966-8c3f-4351-84ae-961c7776bd8f@gmail.com>
References: <20240905050941.31439-1-akiyks@gmail.com>
 <bb98d966-8c3f-4351-84ae-961c7776bd8f@gmail.com>
Date: Fri, 06 Sep 2024 12:58:13 -0600
Message-ID: <878qw4ehiy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> On Thu,  5 Sep 2024 14:09:41 +0900, Akira Yokosawa wrote:
>> Note for Jon:
>>   Current docs-next won't complete full "make htmldocs".
>
> Oh well...
> I made a typo here, I wanted to say       "make pdfdocs"
>
> Jon, looks like it affected the change log of the back merge.
>
> Is it too late to amend it?

I'd have to rebase the tree, which I prefer to avoid when I can.  And it
*did* create troubles for the htmldocs build too...:)

Thanks,

jon
