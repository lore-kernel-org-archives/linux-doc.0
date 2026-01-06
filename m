Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61CA72D9EF3;
	Tue,  6 Jan 2026 22:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767738136; cv=none; b=IlD6KL7beAPMJ5nuwhOmy1L+wAK8SAlRS2HjFNbtuBQ4eCuL6EEqefyRgFAaNJ15DQT+LvLhIG31XDdPcrYMkkr24xDnMpkAnU593QszQO4AxFMtofy5Z9u6uemQBD2d4OKCjG1YlPQ/wgZR+ro7r3zXiYnuhqGEGy7vikWxkBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767738136; c=relaxed/simple;
	bh=PAH9TctejqYvQQ8olDVvuz5N1ba6KLu1BFREcL+jXw8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VE8irKoG+0qen4EWdwnoC2HbJ/wD4WCJNDk1HamZPt6WuTnxgLRpzjF0cw/sh8nukYE4BqtRxWBlkC8GC6FpsxQy85ym7bb3tkoCvyqHITrUfztbJyx7FyIiZxBYJ3g0D03TjjFzEucnlmrAXgkNXMBGjowkHXGgxo3EV45T3yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l83u2j8c; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l83u2j8c"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C99F240C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767738135; bh=Bu87LjOXuTHmxDUAVpfaXCQZgZYuPry7ky1/sNKhG7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l83u2j8coD+svsB+lXLSyBpQLFnYQ8dan8/zgTqRZP6dOOj3iUeNUNEORtIsTo7VG
	 Ok9tfSztLR0kLsUjn4TiLONOnGNEn0KFX7bvtEaYTeHAHhij1xLI5qh5J+OF2hwmEg
	 fR/oJxYotYw2jY+gSS8FkPVhQsE+1zmgsWF/YmQTLMRAokZ8FvzOnf8P9uCqunEwpb
	 Y+a+j1GXAXKpol6svKBkxsgd76mXFZfH26yucQ/Tpkt+gXphceFp7ZSIxMKCoUENQA
	 tq0yi6ufQ2Ekvc6cw80UdrKaj7PvaqW8YqrfY6xRxYBdxsS55znHpgKO6Dr9LR6DLr
	 AULn2pb2RsW1Q==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id C99F240C7D;
	Tue,  6 Jan 2026 22:22:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH] docs: spufs: fix ppc64 architecture line break
In-Reply-To: <20251225161615.3107808-1-weibu@redadmin.org>
References: <20251225161615.3107808-1-weibu@redadmin.org>
Date: Tue, 06 Jan 2026 15:22:14 -0700
Message-ID: <87ldiabcvd.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Fix a broken line break in the word "architecture" in the spufs
> documentation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  Documentation/filesystems/spufs/spu_create.rst | 4 ++--
>  Documentation/filesystems/spufs/spu_run.rst    | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
>
Applied, thanks.

jon
