Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA683D171B;
	Tue, 30 Jun 2026 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848666; cv=none; b=l956qf5TiLKpq1w/LcjRxSy6yhCj2t5CghtpEQRQ1ZBo5knNfeqzyoFjimeX6yYhJ/BIK6zbNrrRrtsL4mSfgAp0cUs2j3Z+MbNDdisEbJGp8jbFA1+5fSw1LUYN2kkkfgYlDTUAE/NXgztvkq3xXtDAsZISeTyKNGbtpy+EfbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848666; c=relaxed/simple;
	bh=S4bQ5oB3FYqOo0il1Tq3otYqu+DjSIcENJSyTwn3yW0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=A1YG9nJU6YpAMUWUCKY1Twmrj+nFszufvjyyvIRxLCjBChtzR7FQHMz8Xcrtd3Mm/tkMpsuU4uXus9PgVZT1pNJjfuJlj3dwiI5QWYJg2oGSzomHEivUZdJtTP3GqWXrVSiwH2bPQ88yjNAHjvTWZXyEruCvCBWxn8qjIlxoE64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=jYjmeuCa; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="jYjmeuCa"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 27E8040E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782848664; bh=7uFqC5xhgw4sKw8sqaWYA+AQq1bYc/FIBWG7fBx2FnA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jYjmeuCaISFrLjnnWS5KGnJWVOQ4feQgDwfSQfpJ+whIcKBkB/Rro5cv1XRSHFfPI
	 k6CUE5RNn5KJHC2rJNUbDGuRK/gutrhKjKAVdJ2KJ7PShFskFzZChO63olaNYJiW4j
	 SIeZZDrMukDklDhHbts3lF0W283qQ4tQT3VWUuRi9I60MpLNE+KA+0cfLv3t6LK6YW
	 k1HASv7lXLnA6nRgGuvnE1WnjqW7LnQ3xThGE96TShqXOeOUqh4d5TsAbvAU+jxzvT
	 WrlDNge1YskdU4feKrQ+HawtRPZBXuFDIU//bl8ZwRn9+Qs7MnGIAsieKhJ4BwQLSD
	 piXW8uFkODBzg==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 27E8040E27;
	Tue, 30 Jun 2026 19:44:24 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, Thomas Gleixner
 <tglx@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Andrew Morton
 <akpm@linux-foundation.org>
Subject: Re: [PATCH] Docs: SMP: add an SMP docbook chapter
In-Reply-To: <20260625210331.1050915-1-rdunlap@infradead.org>
References: <20260625210331.1050915-1-rdunlap@infradead.org>
Date: Tue, 30 Jun 2026 13:44:23 -0600
Message-ID: <87se63rey0.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Add SMP primitives to the core-api documentation.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-doc@vger.kernel.org
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
>
>  Documentation/core-api/SMP.rst   |   11 +++++++++++
>  Documentation/core-api/index.rst |    1 +
>  2 files changed, 12 insertions(+)

Applied, thanks.

jon
