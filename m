Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C719E31F9AB
	for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 08:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781769741; cv=none; b=DQmuXnE/rV3dxYOQK3O2G1gHbuP+Pw+UIznErFzWV1QCwM3Xd9/kfl4wbioAn0dpeT4FLmmUUQkc3hmch+3nk2IKyQELjFT+erYH3gpi4qC9rocWk9wIYumtiA2DcwqZZk0NL9C/DQ9eWEpKIAWuPk6qUUj/Q9AJLKUfrLoiZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781769741; c=relaxed/simple;
	bh=2t+RkjBFL1lZxO64xK2l79qUSt5JM3y5CAjnWbpJF2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j38pD0akLblfibJJUe9QrAL7oiFsPuKj5V2eiSDpRiFixmG2fn8UArtOnplu8PIIoUFQqbSFpYkm8FWJ9rX204oEiQYErCCEzJcwWBYCALvojggrOtkBtn9UhNfi/r2+u0LKoFc5vYo4M1rC0GGhPPj0Kd40pzTEPJZDiM39h7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk; spf=pass smtp.mailfrom=rasmusvillemoes.dk; dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b=FV+rwnEo; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rasmusvillemoes.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk header.b="FV+rwnEo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rasmusvillemoes.dk;
	s=protonmail; t=1781769735; x=1782028935;
	bh=2t+RkjBFL1lZxO64xK2l79qUSt5JM3y5CAjnWbpJF2s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FV+rwnEoy5qvX19DmBCoPvVnyMzrAOtumwXoUfetPoSZlM72lcpIPhets9nZKC3Y9
	 ++MWFO6w/2CpYjIVoma//uy0OnNJGwT12Sol+YUoI7or3hFNqtcvR+UrNFlI+EVT8P
	 //TsbPhdKNHsC/JbE48Ta6ianX0G0dpgVUKcNGiKlbf7C+dlgGbm198XVihAm2KZSw
	 DqKfz4PzpR2d1piZFDHpkjVT6HJagz/4B1QXv2qVEjih2bRcNXAiratjBQcAwyJFJY
	 2w7p84ewLIAYJk7u+yO5DfeD+7mrUo9zm2JF9x8JedS8VHp1DF5JtHwjB3unNkYYxR
	 Jhi9BcpTilPUg==
X-Pm-Submission-Id: 4ggtVZ1FRpz2Scmx
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: <linux-arm-kernel@lists.infradead.org>
Cc: "Ard Biesheuvel" <ardb@kernel.org>,  "Will Deacon" <will@kernel.org>,
  "Jonathan Corbet" <corbet@lwn.net>,  <linux-doc@vger.kernel.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] docs: arm64: Document that text_offset is always 0
In-Reply-To: <20260604140839.1930847-1-linux@rasmusvillemoes.dk> (Rasmus
	Villemoes's message of "Thu, 04 Jun 2026 14:08:45 +0000")
References: <rWEeI8VTs9ivADjblsACv--YW_WrirJXCPkBOYE-az7ys6mFKCBWMAkGvsTwYpJrObRYWS_hgRXyiSqiZSb46Q==@protonmail.internalid>
	<20260604140839.1930847-1-linux@rasmusvillemoes.dk>
Date: Thu, 18 Jun 2026 10:02:12 +0200
Message-ID: <87cxxonunv.fsf@rasmusvillemoes.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jun 04 2026, "Rasmus Villemoes" <linux@rasmusvillemoes.dk> wrote:

> When trying to figure out where to place and call an arm64 Image in
> memory, reading booting.rst should provide the answer. However, it
> requires quite some digging to figure out that text_offset is set via
> ".quad 0" in head.S and is thus actually always 0 since v5.10.
>
> Update the documentation and make that explicit. Reword the 2MB
> requirement accordingly, and remove the paragraphs that only apply to
> the ancient versions where text_offset could be non-zero, as they only
> confuse a current reader.
>

ping
