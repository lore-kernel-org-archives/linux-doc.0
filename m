Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618203793DE
	for <linux-doc@vger.kernel.org>; Tue, 30 Jun 2026 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848226; cv=none; b=F8kBNsN1z5MbaGhV/xcb+SgK7Kjvu16qszs4OrTVK57rM/jaQWbeBoqP+eEaQfcEyaA5GH0q7/0QzkWU3MGjtj1iRnvYkqx2gxeOHwAD2Uf96AMfeOQ2fxAkqVkrpjKNS1rU894POiGfpMgY60qeQjKXjJ6GQcbheyMLqnh4TZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848226; c=relaxed/simple;
	bh=Fe7IiDSdVzdQ+S86wA2h242xE2qW702JlNHBnT0ABfE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Oze23OVsm04ObXs/+DwcRJL3nk5zL0qpOjeGhPQW6eD6wTkAwhBZDLQHqe2EyEekRv015c6AjwAncerXGoDc3PnL3lOrN7f4wuaQvAd8hiv/F9+kNzY3LR7lHj9eDaNy7p7u/rc3n3porILWxotY+TN9cNBpgHWCRC/GwrE1NTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PBAK3++P; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PBAK3++P"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net A7CDF41596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782848224; bh=pEs+4XQ1Ba+IYSxgxY+euRNOFB0wGqJfBtAS9aNcbk8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PBAK3++Ps5wMCwgjHgtEVMpc4VjNo+qfzjum6+TO0cOmiBtfST8Io4Fd1GSERkP6b
	 AZgTOlMg9Dv6+oDTXmWIzKN5uQUKWsj5IS6C/Da24qB5uT5DgEG9OI1itO7i31kbKM
	 Qsh5lQe8UFbOLv8I3g9ezJnoT51/0luluXv7Gfu0xcgwhIb9u6Ju+6qhxiKxTwhIoo
	 PXXWbY1vXaLAHJAGC6WDdc+pMYv3CC1UWR/+OxvURlHjOPCvNQw5kJdXJBBV2tJQD5
	 5DbZI8DW9WEdZqvgWMjc8sbXzhUeXl4Hwn+iMlPlrUR39lG3F+JqLUW+ph6QyB8x2x
	 6OC/D2qslkhYw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id A7CDF41596;
	Tue, 30 Jun 2026 19:37:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
 <skhan@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH] Docs: conf.py: fix typos in comments
In-Reply-To: <20260626005248.1121464-1-rdunlap@infradead.org>
References: <20260626005248.1121464-1-rdunlap@infradead.org>
Date: Tue, 30 Jun 2026 13:37:03 -0600
Message-ID: <87wlvfrfa8.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Change "variabled" to "variables".
> Change "relative patch" to "relative path".
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
>
>  Documentation/conf.py |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon
