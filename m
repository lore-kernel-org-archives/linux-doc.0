Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1965041C2FB;
	Wed, 25 Mar 2026 19:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774467994; cv=none; b=pxHzthyPVSyQocabvda4aYcjuz4BNkyakNTI9zsJcYpZUvDfMPiCNSHYm6yvKApja5YPVKbnTXMIiH8zWyLF/TyEP+NZoSHG1QNRUv0BkiWVNR5FcoMVE4Tv/+AuIfDxeSkDC+PNOBGBREpfh2km7QJxWX5raBa/reoRHzpfUDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774467994; c=relaxed/simple;
	bh=me69RyLXPFho3L2zifwuig9Y/wnZ5FYbacfOEGZYo/M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=aoM8NfryfR5wIO9IV0qbtG7gTAKFaAX13VQwouSjNnw3th1b8+T5kRkiw7E8wRGj0ht9jPj/O0bIrtRcvn1gShXypyJj5RMzVAa24ObfBimfWHK2lY6Jkm5dLmgqazcm0u3rHyGrTmR/wt3js//18uyZGIhA7iXDNmO46jRYMU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=ZPE3UUuC; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="ZPE3UUuC"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 69C4840C6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774467992; bh=QaYBr5fcHzzY/GG7iXPp/Ub5kSyz74NA0MwGgB0SfIg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ZPE3UUuC8RA/6MC4gtTPalw5D5R5Y2oZytX5ThmCjC2//r4rh2rRXV6L5qrN4zKlf
	 GL89fJlFesRy6DSfOpNVYRnxQ0HW7gNS25R41DOzaNXxCEDyMH4efd/1wErI2VGXaa
	 GAReE3ray7ozTMe8bI0dFFHDlcfpMmbzNDtyEoVJqMKHQF4qVhnbbv1N6VCUHZYpL4
	 Egf0l0ccRMSR+RpDy8WISJoWHSeQFSijvBwnsHin72OxAHVJyK5YQ+3vzxAmeYJdcM
	 koGR3mRf9tzE2jBiLx0cDEE8MYPQZylfbMCWbMW4cR75rDMkmn35LoUBLsNuUxP+Nf
	 mdBqQ0SLVL8Jw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 69C4840C6F;
	Wed, 25 Mar 2026 19:46:32 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, weibu@redadmin.org
Subject: Re: [PATCH] docs: ja_JP: process: translate second half of
 'Describe your changes'
In-Reply-To: <20260309105015.309116-1-weibu@redadmin.org>
References: <20260309105015.309116-1-weibu@redadmin.org>
Date: Wed, 25 Mar 2026 13:46:31 -0600
Message-ID: <87v7ejelpk.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the remaining part of the "Describe your changes" section in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Follow review comments on wording and line wrapping, and cover guidance
> on self-contained patch descriptions, imperative mood, commit
> references, and Link:/Closes:/Fixes: tags.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
>  .../ja_JP/process/submitting-patches.rst      | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)

Applied, thanks.

jon
