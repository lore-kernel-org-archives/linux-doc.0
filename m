Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1D3955F4;
	Mon, 25 May 2026 20:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740971; cv=none; b=baSIt7mTvfoD7FyMleUI46NwwnFVCtBXTlf4emmwnF35+YjGwZdp//GmJeqB8xmxCIF/39vzZWxVHer9GB3MnpPzH5U6uiJrdAC1UKOE3ug8eI9EgJgf3KXS5dPfUjnPunlaLJkD1KT+sbOzu6hqkyJ3C8LKIwxkWM/o/VrMAos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740971; c=relaxed/simple;
	bh=YAKVAi8jgfHNtJFNpwfMBz7XDBOUNtPbXJW/AxxbZdo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=gwZLcSD6tU10ckwtfOGz0bqHBDdPfdrCLs+efKOPBF02pf02ahl0vt+xdWTJRNn0GzIFO/aJCmyVNJA1QjPHE8kTdNJ/lL/TjwvywKsbL9SXr2MH318UTkZO0aPwStAverqQLwKtqcSEDX6kaDnp3T+BBUYwYaXVgolFQ+Lt444=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Hr9L6ztk; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Hr9L6ztk"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D6D8140E36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740969; bh=KAh7PuOmI94XOwvaSI3CeIU3E0pZZQ+04OPeNBf3Cy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Hr9L6ztkgpXdStaMM0LnCdlomGKskqo2Bh5kEJioBYhIIlcBsKhIXDwZF/1Vjs0ZN
	 pscvut3JiGCvtqUV/Wf0fpTddMY1tq0FqekP3zJTGas9L6HKf8RTd4HrbwWpZ9TBIz
	 1HoPzjrZUdhsOV5+4OLoxpQIp3J2tzdTnhapNgmkvp6lo9ehNsNHbT4BIQuwfv1Aj1
	 UQNmUXJJ9lLI90WciaOD7n0dG5j7l7JgAoPWfrq4ZlCLdIJ4GT3xu3lFEEZn042kpv
	 BnvNTRFjdJD/4+O9G7Gke9bUakVb14akf3k2bJA9mJ7HdH/NSSSZiQAzg4lUtHIx50
	 xO5iNDzHk45Fg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D6D8140E36;
	Mon, 25 May 2026 20:29:28 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Akiyoshi Kurita <weibu@redadmin.org>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, akiyks@gmail.com, Akiyoshi Kurita
 <weibu@redadmin.org>
Subject: Re: [PATCH v2] docs/ja_JP: translate more of submitting-patches.rst
 (no-mime)
In-Reply-To: <20260513131111.432772-1-weibu@redadmin.org>
References: <20260513131111.432772-1-weibu@redadmin.org>
Date: Mon, 25 May 2026 14:29:28 -0600
Message-ID: <87mrxnz107.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Akiyoshi Kurita <weibu@redadmin.org> writes:

> Translate the "No MIME, no links, no compression, no attachments.
> Just plain text" and "Respond to review comments" sections in
> Documentation/translations/ja_JP/process/submitting-patches.rst.
>
> Keep the wording close to the English text and wrap lines to match
> the style used in the surrounding Japanese translation.
>
> Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
> ---
> v2:
> - Make the subject unique.
> - Reword the no-MIME section title.
> - Refer to the untranslated "The canonical patch format" section by name with a TODO.
>
>  .../ja_JP/process/submitting-patches.rst      | 63 +++++++++++++++++++
>  1 file changed, 63 insertions(+)

Applied, thanks.

jon
