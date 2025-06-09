Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A534C8E
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 20:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500765; cv=none; b=QUkGLkb6lxiLZ11DVbBYsGeAClQvaqVYJbS4muCKgFiW+Fj5j2UWdNzW7GRmNrEuQCi2lG4PaLGDKZ/HA4BGWB87rUSrAr9Tj8pMtBbJgOz/jXskuhccArbLEsgxOOzz5nz3AiujSB6pmcbksa+R6QSEiIPesaE7ZJVX+9M1fts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500765; c=relaxed/simple;
	bh=b+ytTM1HXivPcUyqthBGQ8yGcrU5QMnY1qiEevcTcio=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CCEqXIX5NZfbqqLqSruLxartQBjxAY085jRL8y9/xaCnRiYshLAB/qhg+eM10Wf1vykhlaTL3LAW8TgKj7dQVdH7V3ND1YjgqM3ELMzqxcmNhPVHV1gMQMnTuR4IYdecv0Rb9sob/K6mjrJX7UAfjl7Wg3lC0Ag5RU4u4sFfBt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=czLJd+H5; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="czLJd+H5"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3FFB341AA1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749500763; bh=cITMUVv4yEmmHAEfTuBNB1BMp/g5XFxql2Tzx7JZQSU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=czLJd+H5sNz6EKnquKAWfFnbC0lVaoEQEHQWrZsYdjKSqtLUaVaZjyx+XZGehJZTH
	 aXafW1uWvZkMIleyifSS6CEFIC32frA6A7RpUGYsIaXnHiIrqJqwDgk87gFlIibcib
	 gCWVBEXShg0JH6Za9lRGrD71qRze+Zh7gFWy40/PGBXPYXVH+JIXzv4+oJvyBbKhV3
	 VbM6nZZR1TJ+n/NqD6JIT0fohqAdmNWsIlLbKvbkjmelUKu72R27Fu2gf7xtjV4fOn
	 r30QTjIyWuwQSzWfsTItNzZKBTOGGh+l2xDjhxWjMqQIgkMRI7eYbg1VTou1EpQHSD
	 OI+56LdV8zUuA==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 3FFB341AA1;
	Mon,  9 Jun 2025 20:26:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 linux-doc@vger.kernel.org, James.Bottomley@HansenPartnership.com
Subject: Re: [PATCH] doc: Include scatterlist APIs in htmldocs
In-Reply-To: <20250604195753.823742-1-willy@infradead.org>
References: <20250604195753.823742-1-willy@infradead.org>
Date: Mon, 09 Jun 2025 14:26:02 -0600
Message-ID: <8734c8br1h.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Matthew Wilcox (Oracle)" <willy@infradead.org> writes:

> We have all this fine kernel-doc written, and it's not published
> anywhere.  Expose it to public view.
>
> Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
> ---
>  Documentation/core-api/dma-api.rst | 6 ++++++
>  1 file changed, 6 insertions(+)

Applied, thanks.

jon
