Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD9325B667
	for <linux-doc@vger.kernel.org>; Mon, 10 Feb 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209635; cv=none; b=gMJEZU8vzZtTtdtR5dzQqxZBbc76NMXngoAK5cd80TIaqFzasEnQWHL+sylKyWXxS0WDOW22o4dTw5ACJvIiwZie5QMLqfOGf4PCJjLkiAQXEmfV5y9Ify9iPff/J/zNbG1VVdQitFf97yo7y7NuzkYZnJdIvmfUrfHKVCavnuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209635; c=relaxed/simple;
	bh=3XYMsF/JltYobm5fpigCYAMzJ/N6sXTC9v0QKmfknNs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TwusBFVW3fjSY9DKnfTivaT6MC9gaNGn5+7MqJ+Hu2J07y3vJwi78b0GSTNA9Y+nqZieARlTd8H1p9rqeg6UcoE6c6p8dvJb1YZXwFJdz4sUW+2Nh2KOaInMOpDxUyfRYpF0pCK05qmrb6bICPoL2T42CdwYYOmMY43x9FtnyYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=r1zK9/oR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="r1zK9/oR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 246A7411A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1739209632; bh=usCSxGFJFpJfYhpfqyEEgAs8nuXlxyQs97pnBTa6Pmg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=r1zK9/oRJPorE3jiKrSIuTe6/+g4nPKkjFDco4pbk2pYf21qOObqJaV87YXQRW8Ov
	 ToEMWtHcPXOVyAhdRjApStSk3OjGXOQ77XRzUbXUO+jlURaykhcmqYCYtEg9z30mrl
	 Vb6g84UPdL4ZPX428ABdNkTGIkaQb4mzHbBMVjMf51Uo6dYj7TMo4wMLVX6sHkeyXn
	 N2VvER/RqelNs+BKYaSXbuHd5QnnmRds2kx/D4JsJ9bhifMzI6rMcAvtL+1jd3Lzo2
	 hbpZpq+RTC87wzKgnK1l/xifpLWPIIj3wmlCiWOYSwSNvuaCB97xkB9E2ZDUWfg3uR
	 J0hYWZzNEUCRA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 246A7411A1;
	Mon, 10 Feb 2025 17:47:12 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: ritvikfoss@gmail.com
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH] documentation/filesystems: fix spelling mistakes
In-Reply-To: <20250210043937.30952-1-ritvikfoss@gmail.com>
References: <20250210043937.30952-1-ritvikfoss@gmail.com>
Date: Mon, 10 Feb 2025 10:47:11 -0700
Message-ID: <87frkl1ylc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

ritvikfoss@gmail.com writes:

> From: Ritvik Gupta <ritvikfoss@gmail.com>
>
> Corrected the following spelling mistakes,
> based on the suggestions by codespell:
>
> 1. Optionaly   -> Optionally
> 2. prefereable -> preferable
> 3. peformance  -> performance
> 4. ontext      -> context
> 5. failuer     -> failure
> 6. poiners     -> pointers
> 7. realtively  -> relatively
> 8. uptream     -> upstream
>
> Thanks for your time!
> Regards Ritvik
>
> Signed-off-by: Ritvik Gupta <ritvikfoss@gmail.com>
> ---
>  Documentation/filesystems/9p.rst                              | 2 +-
>  Documentation/filesystems/bcachefs/SubmittingPatches.rst      | 4 ++--
>  Documentation/filesystems/coda.rst                            | 2 +-
>  Documentation/filesystems/debugfs.rst                         | 2 +-
>  Documentation/filesystems/netfs_library.rst                   | 2 +-
>  Documentation/filesystems/xfs/xfs-delayed-logging-design.rst  | 2 +-
>  .../filesystems/xfs/xfs-maintainer-entry-profile.rst          | 2 +-
>  7 files changed, 8 insertions(+), 8 deletions(-)

I've applied this, but ... for future reference ...

- As Randy noted, the "thanks" message doesn't belong in the changelog;
  I took it out.

- It's not really necessary to list every word you've fixed; "fix some
  misspellings" is sufficient.  I left those in though :)

- This patch did not apply to docs-next - the bcachefs file you change
  only showed up in the mainline yesterday.  I pulled docs-next forward
  to -rc2 to avoid making you redo it, but it's better not to make
  maintainers do that in general.  The proper approach, which would have
  been needed for a more involved change, would have been to send that
  fix to the bcachefs maintainer instead to go through his tree.

Thanks,

jon
