Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46E029BDB3
	for <linux-doc@vger.kernel.org>; Mon, 11 Aug 2025 17:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754932405; cv=none; b=aO8AtRJ7KplqOmAAET4fALsvlsmu0k7J/gX9tzctaKgnsoPxM2v0KZcVsKTzkJ9/ZftomotBfZ7vXJNik8pxrpMJG8tWUvxgIeENqXecWrQEI/k3XACnkh9vWc6PxZYm+pu2I6wwsiS7cC0htIEQWHTw4hdcf8xagIjDH12pqSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754932405; c=relaxed/simple;
	bh=CvFanQbqqpd3y6hBW8sgxf1GrW2U+dH2vTbRcZPPmW8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YjqatQtzk5KIaVOYgzYlbe7fAJQ7i5rl7P9Qk2fHKe/DxCRLN6KY7VWqGP+6U0/5I/7E9H2OBwyUV+Ga4sRTHo5+6BfbciV10aaSqKU+7R6FA9Ue7Ax6zYRFaV4EwYMdvi5i07b63EjJaiu5rbPzBi5FdLzNE+GTbX0oZ9AJe4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MvKqnHQ4; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MvKqnHQ4"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 00BB340AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1754932404; bh=xjCRCPM40+40i2fr/lFol9pm8cv5dbHLZnQP//M+5Rc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MvKqnHQ4MzRQ5FyIEWWe7jSKdPfEPzZ+/3lf0uIxG1aY6I48I2q10RqSmIwig4VYF
	 v0smVNyCZH8m3bft/CTQ9KSPISUkMT3mASdl5pZgvn5OO9RVuI15fzWo/t+LCoatjh
	 buDQrZMfwp20vkS64lOecUXCok0Q54oMifqwv2ZPOoqVm7PJgHXgbXiqDJgsxtf81N
	 DeR1sCHKH4J/NILXkpMdkiW/DIPvBTYf3xbzEpHbdo7FlYIs/919XFRqjeWGMtLG3O
	 RbU8L0YGpEHJaZneTraj3ufiQ4JYXGat13cFd06kWHtMb8BbTIA+3mo9vSpa5t00Qv
	 vWZRIuZnRsNWQ==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 00BB340AD2;
	Mon, 11 Aug 2025 17:13:23 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ranganath V N <vnranganath.20@gmail.com>
Cc: linux-doc@vger.kernel.org, skhan@linuxfoundation.org, Ranganath V N
 <vnranganath.20@gmail.com>
Subject: Re: [PATCH v2] Documentation: Fix minor typos
In-Reply-To: <20250726063645.4156-1-vnranganath.20@gmail.com>
References: <20250726063645.4156-1-vnranganath.20@gmail.com>
Date: Mon, 11 Aug 2025 11:13:23 -0600
Message-ID: <874iudeq8c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ranganath V N <vnranganath.20@gmail.com> writes:

> Corrected a few spelling errors and improved the phrasing
> changes since v1:
> --corrected as per review
>
> Signed-off-by: Ranganath V N <vnranganath.20@gmail.com>
> ---
>  Documentation/arch/loongarch/irq-chip-model.rst | 4 ++--
>  Documentation/arch/x86/cpuinfo.rst              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

jon
