Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C151E42F
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 16:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788799988; cv=none; b=NI5CLK3H+vZJjV5lrNgIO/Cx7GNPSZ7oY1KKOIzwCs3A8ZChU05i3+ZfVW4wH1LL20IgM0/WSsVNZeBkRr3Qm48lSDfy+eXZllUmsZ8YSmacml75E77HTjICHHJ8SekBj3kyKZV2PzPVcFJVJSTwWMn2F7ifWuVRaUw7Ai+P0aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788799988; c=relaxed/simple;
	bh=Lu+gCE6XQ0sDXPgivNyeUMPuraOdXSRMJAh4EH3ouLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Eo7DUQ0l/hBJctywMyrisultOQ1kWUH849fGe3QrEpQ9Fv1VrkDXJ7HHB4ln8N3J58hpi6QqCDd5UFjUGd0UsGuKmv0mauJW+tu+uNusjjjWhD1Bzg9zh4JgvhVUldxHgU755XOZZoFIs3L1vheqH763QFil6Ucrcnxe/hYOyxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=MsUBavUo; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="MsUBavUo"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F07DE408FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1788799987; bh=Lu+gCE6XQ0sDXPgivNyeUMPuraOdXSRMJAh4EH3ouLg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MsUBavUoWyzXuBTUZyMTEGS9un8Z5aXmTkgnMugIVZ3v9j/tGsaWB6IPdruE0ZMqy
	 3t/jEip/tilIH/3RGCdXp13fdB8pKBNMFhQF1FSA4WxvkG9jIUDQLU5XxSXG/G9rqx
	 tiZrz2961Av1QsDmNYLWLx/tFf4mgTvaDdIHIy0utzr/8sgde6x9BdmK7cA5L1NM1E
	 gghfFfH9dTHjp7TNLFIJnizHPqI5Wc8H/xc+Nw1sujTrQKJCbs0A9/aBC/asAqyvzD
	 Mr/QxCM2FXT7kLk3BO711cWU2MxlWMScFQ+tj0BGekfJvUOIO0TywwkEQDb74GgHL2
	 uNer9FIlQ6+3w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F07DE408FF;
	Mon,  7 Sep 2026 16:53:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Pereira <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org, Daniel Pereira <danielmaraboo@gmail.com>
Subject: Re: [PATCH 0/3] docs: translations: pt_BR: process documentation
 updates and new translation
In-Reply-To: <20260829162438.13039-1-danielmaraboo@gmail.com>
References: <20260829162438.13039-1-danielmaraboo@gmail.com>
Date: Mon, 07 Sep 2026 10:53:06 -0600
Message-ID: <87v78hngul.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Pereira <danielmaraboo@gmail.com> writes:

> This patch series improves the Brazilian Portuguese translation of the
> kernel process documentation by adding a missing translation and
> fixing several formatting, typographical, and structural errors across
> multiple existing files.

Series applied, thanks.

jon
