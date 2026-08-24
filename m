Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7213367F2F;
	Mon, 24 Aug 2026 17:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787591271; cv=none; b=AZ5ULOh8gqnj8Et+9mL7FKXlgMLXijiNc0nTqMDQLYWhR20hVTo+9U14Oje5AyIrgZ7mtgoktd9/vLpcB/o7Jp1VptpCL59xDRT9wfwlqFpUyyUEcwNP/D5CuuB/NUsV5dWN36LmZRosgWeTI4IWByMmLbDdc0x7Yb9kCX5M7Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787591271; c=relaxed/simple;
	bh=RFY2fk7zkTvw1Iat1gDQSTYqeoRFNbee6Kuz/Gxf3T0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UrnppVu1Z3vPALINj+msJ5JwekEQ7M+NEX9DyygSRJH9XZgmpkCju4HVc5ynDrChjXMR7IDml3zr7gjFROTI+T3wO3MhpKjV7q+8GN/SB6ru3KdRcfmvOxhmly6H5BziFeN2SEa7lHD99OqTWvYLQ8SjBt+lRiAXBiobigOa9ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=FaE8SCCn; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="FaE8SCCn"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 110A0408F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787591269; bh=t9TDgbEIXxfFNT50InwrEzfG+725xhe7KtZYDXRKyfo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=FaE8SCCn7U1GUvnF6M2nSKxTp0+eHGnynUD5ZSd0X1KT8TNt/9Dk9wd3f+4uBscns
	 BXA2Stu6emrGOE00LP8TVZnVGrdj9vRD6qupWOIlt6EdXA1G2xICppWy+5DwrasaYd
	 dKMzcDbZ7iFg7bip8ua099eq0riM7e1kJNObP97idWDkytFPYYhn90NuWwZNMNwSzL
	 ZjVFXmjXgQ0B33KydhrjetCYvLmzDKFqYhNB5N+75PYgJm2FaI9s13t7IlQPFQ8LYG
	 hbmQrkZKXph6w8NwjtjuB+wZL7nZmDp1B2Yc+chYu0cDBj0uxbSZ0/TWflJqj4e+51
	 GIrURLnzbvg5w==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 110A0408F8;
	Mon, 24 Aug 2026 17:07:49 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>
Subject: Re: [PATCH] doc:it_IT: align Italian documentation in process
In-Reply-To: <87cxvhd7u0.fsf@trenco.lwn.net>
References: <20260816193906.68808-1-federico.vaga@vaga.pv.it>
 <87cxvhd7u0.fsf@trenco.lwn.net>
Date: Mon, 24 Aug 2026 11:07:48 -0600
Message-ID: <87y0dvxx97.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jonathan Corbet <corbet@lwn.net> writes:

> Federico Vaga <federico.vaga@vaga.pv.it> writes:
>
>> This commit updates the Italian translation in `process/` following
>> these changes:
>
> Thanks for the update.  Just FYI: at this point it'll wait until after
> the merge window, so be patient...

I've ended up pulling together a second set of stuff for 7.3, so I went
ahead and applied this one.

Thanks,

jon
