Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B72242D77B
	for <linux-doc@vger.kernel.org>; Tue, 25 Aug 2026 22:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787696291; cv=none; b=Sn/hqLxicaL+CWESsd0SmTMTYvjWC7lgCm1YDyNArxc27JMYNqZr+cOkkRn3ppKoWfbN0v4uFk6Fj6MkPs59Yww8gN7GEdplwv9wHQv16JIUVaU6XTe+X8JtfaShvl3kqSjDEgFR5zmk5P9yUy1VqODs5ngXx3nb67x/cKFW56I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787696291; c=relaxed/simple;
	bh=HQCDNaO6v/PDsG6ZWvhkjbeg2cIAURzogEEGplhTWDY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PnqL9L9kz3qwwn1wQ8H0ls2t96s5fQLyxxQojgBZX8hHuEgTVpgeMG/6F1GEWWvHcCrsVi+fIEdPSfc/mGm9KXrMkA2xmkILoAQ99YLTLYrJNiSM27a09gkfzFCs+mkD3sKjmrJEHByDsXt6nbBsgXffzWvfvyKeqy3RxWuD1uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=AC5FILuh; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="AC5FILuh"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 2C9E3408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1787696283; bh=fVAZjee143Ebt+iFG4thcigUhWgyZevrugR2GjTdw0s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=AC5FILuhuYPw0gDrtXB6iJ86ahMfCCihn4L69Sm773h52CPuSiYhfZnXBGzEj2kag
	 ZSlqOvcr1rweSN5h7vDCfPVwM5iTnHghWZqz9U7dTrcIiCHW26gyV9lw4Q8diGt2Ea
	 AsYM8qhdBxaqDETCxKS0sR4/a+Plr16hhZ2ijXX3tWwrhLBq7rjlXHP2uQEanLhQ/i
	 4Dw8xess6eQMnMHzTc7zmW6rsXqMyGWQbwZgsPtMVRCP6yfzWuhbza3WQu+T5l51vJ
	 u15NZFRpFVTxa/m1M12UqoDgj60V9/KzFhtPn1oTPVxt4pSzek6EUV6ua4o4sypmV9
	 0G1wEgOlwJr3Q==
Received: from localhost (unknown [IPv6:2601:280:4600:814::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 2C9E3408B2;
	Tue, 25 Aug 2026 22:18:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Fabio Pereira da Silva <silvapfabio@gmail.com>, Daniel Pereira
 <danielmaraboo@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: pt_BR: process: Translate stable API nonsense
In-Reply-To: <20260825213001.12714-1-silvapfabio@gmail.com>
References: <20260825213001.12714-1-silvapfabio@gmail.com>
Date: Tue, 25 Aug 2026 16:18:02 -0600
Message-ID: <87zey9u9np.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Fabio Pereira da Silva <silvapfabio@gmail.com> writes:

> Translate Documentation/process/stable-api-nonsense.rst into Brazilian Portuguese and link it from the pt_BR documentation index.

Please wrap your changelogs at <80 columns

More to the point, though: there was another translation posted by Lucas
Adryell Ramalho last week:

  20260820-ptbr-stable-api-nonsense-v1-1-0341f55fec2d@gmail.com

Perhaps some more coordination is needed between the folks working on
translations?

Thanks,

jon
