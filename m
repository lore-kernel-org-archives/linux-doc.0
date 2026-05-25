Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826261AAE28
	for <linux-doc@vger.kernel.org>; Mon, 25 May 2026 20:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779740133; cv=none; b=iJ6Y9rOKv812+sKpzQeDIDcf9mEU5a/3SQubVkptYBiW3/3dpOyufROx0FoV3v+3VKJMZXViLReplhr5whTKlbjfuBGAS5Ph+aPJx16m+q1Xbrcoik6gKatxBf4XJZsSOCWG2Bw6Ug9kOtYty+ZIAx3M19yluS81mXjabdTfMSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779740133; c=relaxed/simple;
	bh=xdK82UJeNTyb63mu984Sd+UX5wD8MW39ok/J246S64o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Jjqr02nhdXLsezbsaP2jqj5p8KxuM3tYxZOq25WEvp61sVK6puPhl3M+AuojRVv+8iTkZEAik/RFHZ94kZTjNxRfW5m4Cv5VXpWcwJP/U7QDZzykr7P8QiGeM/jdySSpsxpZx2gDFXU2/ezLIR/CNizG/pKsiFeJiuWR4eywIIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=CetMYiFx; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="CetMYiFx"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E892D40B0C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1779740132; bh=k+pBEQmtqHbZqj8meEwgX7sSV7P4fEogbINSV3NWZTk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=CetMYiFxyrmWWVjmccnLXm2LavFmkoDAufStIHCQErmNKTw9JQhzhwlss9bPepYTe
	 3OZ4ZEtnI5DK0HXcXYdDLAf/gimP6g4K0hwdpYYJVABYG1eGJ7DNPhtJ3U0jfWBdYt
	 YwNU5ZnIvWxhRkUewOQZiAOCZwCnA/xqWJoDC3LsvU6zJuxttBW/610OHYuk6xQaZv
	 9dGfaLbsw4gVr96sugXhT7HL0bOEPZzQiC1Yn/3GLyJZg/Owq18rjf2TKPBtMLVvtR
	 /IULzdPfGyC8lPhm9i02ZpTkMjeFBTx4bY4QONNqwhB9V0YkVBp5VuxfCkv0ZlwNig
	 NM0j3i9O/n+uQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E892D40B0C;
	Mon, 25 May 2026 20:15:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>, linux-doc@vger.kernel.org
Cc: Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate process/kernel-docs.rst into
 Portuguese
In-Reply-To: <20260519163434.1045462-1-danielmaraboo@gmail.com>
References: <20260519163434.1045462-1-danielmaraboo@gmail.com>
Date: Mon, 25 May 2026 14:15:31 -0600
Message-ID: <87h5nv1c0s.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> Translate Documentation/process/kernel-docs.rst into Portuguese (pt_BR)
> and update the main index.
>
> The content was adapted following the RST formatting rules and the
> appropriate technical terminology for Brazilian Portuguese.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/kernel-docs.rst             | 373 ++++++++++++++++++
>  2 files changed, 374 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/kernel-docs.rst

I have applied this, but:

- I had some difficulty doing so, due to this line in the headers:

	Content-Type: text/plain; charset=y

  "charset=y" is, of course, not a valid charset.  Git send-email does
  this on occasion, I've never really understood why.  Normally b4 copes
  with this, but:

- Feeding this patch to b4 yields a lot of complaints about missing
  parts and such.  That is because you had, shortly before, posted a
  version marked as:

   	[PATCH v3 3/4] docs: pt_BR: Translate process/kernel-docs.rst into Portuguese

  b4 will, naturally, wonder where parts 1, 2, and 4 are.  Since you put
  a v3 here, b4 wants to pick this version, which looks newer than the
  one you posted afterward.  I'm assuming this was a mistake...should it
  happen again, the right thing to do is to mark the corrected version
  as "v4" and to add a note explaining what is going on.

Thanks,

jon
