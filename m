Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86DB51A705C
	for <linux-doc@vger.kernel.org>; Thu,  5 Sep 2024 20:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725567434; cv=none; b=ZIPletJeJu3MX7WEpMdYvImgWgype9oIQVWlIdRCgLSA76RGiFzvfU/213uvAVWZ7Dn96BOiogYRbxk8vVypnNb2Ex0AraW2JfLYLX8yzGqFnnlgPlrCooNHWsRqJlpSujBrsJ5JL/Jc18Zeh1dZEGK2UXs3hjcKAlZxlERB6zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725567434; c=relaxed/simple;
	bh=DvoIeVZpZHjk2GuT+Dgkww5lSQe1tc553OC9mCEPRbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=giRv4E/jRrli4oHphkZR1PSDslNc+uCUKc9+a3wus3Spp+XQajsCljyuwN6/iaCYmaV3WqdthklEmpcnJvqfmYy+Ntvc3vY9Rd/tGr3ZmxF7b/DQUsIIHpC0i7uIYgd/BzEpCpY9tnNjl72ycwem75d2LzdhqHRQo0GkZ7z72Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=gAnlGPkt; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="gAnlGPkt"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 8FB5342B25
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1725567432; bh=DvoIeVZpZHjk2GuT+Dgkww5lSQe1tc553OC9mCEPRbE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gAnlGPktAQIQRAkDrFXMrBhYS4hr0XUraR/TdhDAqQ2e4V83aWaFwpbXji7n5rG1/
	 UXEibFzKZbY/U3x2Tv4DMZ/3SZLa34yXh1l/nI75qb4O11pSCZ2xYZkFnD4ABKy9/W
	 ObMSZq6hJv6Bet/+9WPjk1/P1T6ZKvqFVZKrM7zxXt7X9FKFdRnjI/XbUcYLagJ8cA
	 Wt7nRZDM0tKeeAmYRWOQCd7KAs7nRgtGh4dHIyz/cxMQoAUje7BEzkLhEUpFctInyX
	 sOqwbQLYaQ742i8TCpZQ0f6y9iVQWLweuo5H8/x/cKYtW8+sD6h8ZuW3EZGjw8vmRv
	 gMlwBcE+kSnFQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 8FB5342B25;
	Thu,  5 Sep 2024 20:17:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: kerneldoc-preamble.sty: Suppress extra spaces in
 CJK literal blocks
In-Reply-To: <20240905050941.31439-1-akiyks@gmail.com>
References: <20240905050941.31439-1-akiyks@gmail.com>
Date: Thu, 05 Sep 2024 14:17:11 -0600
Message-ID: <87le05hn3s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> In zh_CN part of translations.pdf, there are several ASCII-art
> diagrams whose vertical lines look sometimes jagged.
> This is due to the interference between default settings of xeCJK
> and fancyvrb (employed in sphinxVerbatim env), where extra space
> is inserted between a latin char and a non-latin char when they
> are next to each other (i.e., no explicit white space).
>
> This issue can be suppressed by invoking \CJKsetecglue{} at the
> beginning of every sphinxVerbatim enviornment.
>
> \AtBeginEnvironment, provided by the etoolbox package, is useful in
> this case.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

I've applied this, thanks.

jon
