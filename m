Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C5B15CD72
	for <linux-doc@vger.kernel.org>; Thu,  2 May 2024 16:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714666558; cv=none; b=r4tdlmVuky4jlFwWvGs1NvHhnloQiUfxqSuabmoQ9dnASj5ZV76KETVztcNA5AKwbingTg5hq7NDaH+KIqicAIPbf0QfWLqbhN4HGuPr49HtKOu0vnT2t3Pspql3f9KnpfiWyX2i1marB1Pe0SNIpdzDcMj1IFaegn9XzEkjwb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714666558; c=relaxed/simple;
	bh=t7Cq6h3k+hnBDa2Ep7A2j9SX6coJS9/TuVklqWvJT00=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=FBRpl66BI7p59YaWXak3GNUIlglied1q23cN5KqSL6SwwlwvYlWS9acX9t81lQU64A3Plgl5mJ7vjuECVAu4uAMOln6KUlKH9wlkwESpDV6bYbgs3xfsZzDB6ACBdf+qh6/phwJlTRlQoRQaROf8dazadE2KsO3i72k4dh3Owgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l2jyF/Il; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l2jyF/Il"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3272947C39
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714666556; bh=SvG59EWPF2YLE4F15xq1/879hmXo8E1C9EQUSciPW5A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l2jyF/IlZYD5ZC44W3IpSHgfIqDxvDNd6VmLFfguLINJhSdGs7RIUExUePsAwBAhy
	 p8hoxXKxNCRB5B9Ah/37hBtAg/x0CO8dEARsM3TOueez7+tBhrQcTxPyVDwP69ufga
	 GVoLnE3R9YZ2TuFuevMDDxachsNafYHSD/XzZ7/1Ffb8Bo45sKyqIzDV2mRfqDiJFj
	 mDTAu/fcq+Put4l+YDMBoJkHrafyxG76NqyRA7dIAMhOTcTQr8/VXZ/vILBGgB7Nv1
	 /mej3P35TsuLJJwoEavAFLKdr1d8Ff2grlOCEm1FKGcn7yftP438SZjKVZzf6Ds3HU
	 wK+axZvPdB0uQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3272947C39;
	Thu,  2 May 2024 16:15:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
Subject: Re: [PATCH] docs: scripts/check-variable-fonts.sh: Improve commands
 for detection
In-Reply-To: <c62ba2e6-c124-4e91-8011-cb1da408a3c5@gmail.com>
References: <c62ba2e6-c124-4e91-8011-cb1da408a3c5@gmail.com>
Date: Thu, 02 May 2024 10:15:55 -0600
Message-ID: <87frv06vgk.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akira Yokosawa <akiyks@gmail.com> writes:

> As mentioned in "Assumption:", current grep expression can't catch
> font files whose names are changed from upstream "Noto CJK fonts".
>
> To avoid false negatives, use command of the form:
>
>     fc-list : file family variable
>
> , where ":" works as a wildcard pattern.
>
> Variable fonts can be detected by filtering the output with
> "variable=True" and "Noto CJK" font-family variants.
>
> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> ---
>  scripts/check-variable-fonts.sh | 14 ++++++--------
>  1 file changed, 6 insertions(+), 8 deletions(-)

Applied, thanks.

jon
