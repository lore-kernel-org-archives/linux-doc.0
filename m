Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7454539A053;
	Mon, 16 Mar 2026 13:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668633; cv=none; b=BN4InePvNN/lcD7Hzeus9VgaTCCAu0GqSdeWs6I4xh/dBbvAYJgkR5NTv2Jm0miACEk1kzhwI7cwxQQVZEXYn/sfHigpdvvrHBVzKBTkKeByCVn5d2zhtEhZZ6g81Zi8kXyKv6JxZ0mCN2PBjJRMP1EQ/UqU2O7KlEDLCvU3hHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668633; c=relaxed/simple;
	bh=bYyXwp+rK+gZb98xPJhdMkWot77PPZsh+L0PAeP2m7Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hnhXdEHw0nvZ2/c+pkgfkhZV/Z6GHzKF2o6Novq4/C8HPmpCLvnHsQaXPD+NOwRo2K6MsEMnx3v4Okhdfc0VqXWno9i9IVHNHe3fx0CcooavZSobT4goNm4ZpK2fXhYMUJ8WFgzORiISwLWKA2i6HMs9R/YsiqN4IcR2018vOxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=C8PlHuRJ; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="C8PlHuRJ"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0233341206
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1773668626; bh=AUuWDJN3+76AQ/ufOipsLc97Xbfv6w3dmIOiZhEOeSA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=C8PlHuRJnzf9eVkolhAc+pdhwoJ6gHyCVNSqXv6+HAgO1DCB+t6s16xMK0QTW9Iyd
	 yLqyvCtSq5Bu5b1p8vxjsrSQhIw8Eh0VuM7tl2mLIHHrGe9YnIeg1w5G7mqLliBtiZ
	 zLVTPfqehkAa3x5CdBtHTNpqaqnNNLCU1xNvi2MPbMf6WqSiIaPvKPNvqor5FarrQm
	 NwVGPwpGp/UEXYYselGeoGqF0BZaHHZ7edxxI13GgCjrvDauNZDYwUgIdC1cUwfmnI
	 iL2jbPOzBv39Hy3KRfkfLA9rwLAS1pJUaq0g60JkvWKoIAL1c7QhfpoH9AxNKkgr2Y
	 zTGwTUAdlNnTQ==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 0233341206;
	Mon, 16 Mar 2026 13:43:45 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Kit Dallege <xaum.io@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2 3/3] docs: process: fix grammatical errors in
 2.Process.rst
In-Reply-To: <20260315170521.63794-4-xaum.io@gmail.com>
References: <20260315170521.63794-1-xaum.io@gmail.com>
 <20260315170521.63794-4-xaum.io@gmail.com>
Date: Mon, 16 Mar 2026 07:43:45 -0600
Message-ID: <871phjkhym.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Kit Dallege <xaum.io@gmail.com> writes:

> Fix five minor grammatical issues:
> - Add comma after introductory phrase "At that point"
> - Add comma before conditional "if at all possible"
> - Change "close to ready" to "close to being ready"
> - Add article "a" before "more extensive review"
> - Add article "the" before "volume can reach"
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=214931
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Kit Dallege <xaum.io@gmail.com>
> ---
>  Documentation/process/2.Process.rst | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)

Honestly, I don't see that any of these constitute an improvement to the
text.

Thanks,

jon
