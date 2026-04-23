Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E789736D517
	for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2026 12:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946564; cv=none; b=duLPJqdey9t3BODFBXezFYQ4pUApaRvsdWeuIbckHq9295y6iN+yYq+hLR9h8aOI26Y6/1X5iaMrZlx2ldvlwzW0lrb7EnOOMLdB7nkKr1ZvPKt3UrxfHJRuzEfhiHMFxhwUHjLita+p6GkZWzj/O2Q2flfqE1K9tsMsuZR0PYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946564; c=relaxed/simple;
	bh=4mIKqOC2p1UHmZ0yd7ilfpouIzYkTpfLQMO1RLY1gI4=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bdqjYC/2btEs2bCDUYCM4y/4Vy3Z0eFiZD4u+QrqKI03uTT4sXV2+m+ny7poZtyetVimJLIbWpqoc9m3e8G1nMhYtMZqvdj3uAjZjch3qvScuAGBBuCDT/Heh9DogH7Ik6wOhl6BhqR434iqeQslgxeQFP4fOcqCLQ83qJTFr+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GAqSLlCF; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GAqSLlCF"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B87FA4109A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1776946554; bh=XJ4tDPhO1qGYpbC1ggfU0FU6TKFkWvH1+P8AIjcD+30=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=GAqSLlCFz4xpJVt+BAgBFKOa5QCs0sU5L2ToSehnoSwJsMrlmYHRWHflzycvibMxR
	 hVnMdFlaS2cpOIn45DdPcyzPTA9KfyEuE7QKxZHjcLfci7E7ZLv95ezVU4IvdbolqP
	 H4LMjUF34i1uUF/Vwrt3ImHo55mrdYeQ4nMorx310FhEohwLSwfj5Xn9NlkfpvFzOs
	 oW6Z1gCbzoepbmmEIlWfS5saNupc67FUylWo3mUp6dSWD+EAma4usq34blS1N22NIV
	 toNSl7+cESCmYwZkQOYZP8cfb6crcO2SwYD0mo3FHzmWzknWlQN2qOZcUe/BRGMKld
	 sRacYhZg2/WuQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B87FA4109A;
	Thu, 23 Apr 2026 12:15:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Lundberg Pedersen <dlp@qtec.com>, linux-doc@vger.kernel.org
Subject: Re: Incorrect auto formatting of struct
In-Reply-To: <35f1379c-41eb-422b-9441-393af5bddf31@qtec.com>
References: <35f1379c-41eb-422b-9441-393af5bddf31@qtec.com>
Date: Thu, 23 Apr 2026 06:15:47 -0600
Message-ID: <87eck5ub2k.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Lundberg Pedersen <dlp@qtec.com> writes:

> Hi
>
> I've just noticed that between v6.16 and v6.17 the documentation has started to
> highlight struct that are not structs, e.g `struct inside`:
>
> https://www.kernel.org/doc/html/v6.17/driver-api/media/v4l2-device.html
>
> Previously it did not highlight this as a struct:
>
> https://www.kernel.org/doc/html/v6.16/driver-api/media/v4l2-device.html
>
> I couldn't find anything about whether this is intentional and thus needs doc
> fixes, or if it was already reported, it's not that easy to search for.

Definitely not intentional.  Thanks for the report, I'll look into it
when I get a chance.

jon
