Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7400B1D5CD9
	for <linux-doc@vger.kernel.org>; Thu, 25 Sep 2025 16:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758818009; cv=none; b=oTN6g//7Ioh42igO6/Hd0UHe//wRFw0YgHxMphdgre4zojeK9caHTb8qzI12MMXXRzGeidF9H7QlS6+S/4d1d3r3nAhSxA/Wkb3O/Ilq5Tcby3Ezkp2zs6ygX74s4PP4ecxRorSTox7vWq280it4F1t06UZK2UlCXrZZhUFgYr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758818009; c=relaxed/simple;
	bh=fDZiheov6yyKvs9Dru0skbrp2Zr9WL/o+zluoLxDD24=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ANu9qAzm2XG7ED1Ev9HUJMT7c0gp7CPD3nldmSQsARj2eGB/8CVNXberybu5lMRYOrclFeUDh6e/wy0WXHEXvL3vJG12u+AN7ZxuFf38Nknmcnf89OLtCMwrlk+rw98PEusXEkmdIZUbITtEw/G2zg/XGzHS9/UEoLy6qWVVUKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=l96Uu3ei; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="l96Uu3ei"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D3606406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1758817994; bh=1ehwVFApiewQRs3mDAzMp3eFpIF9D8L6DO3L+19T0Ps=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=l96Uu3eitPJlZ+0k4gJS6kyIN7eN/BTRtbhZbU6tj97/2A5SSt0bEWOQoVWt40j0h
	 C4r6iI3mftojLkdyZi+AMWAkX9chJKmcdWxIsHOQL6idXwBqlKyBXUza77O1/NZxEi
	 hIQ2FV1nOEy5QcoyvLXOfSezaOAaZhpO00wQAbOk55UyVhycX/6IfmCn+A4Donxvre
	 fN/2X0hVO/inHMIcEXNxTV9kIsu1t64tJgnJ41laNyVYhR+Rj5Z2rs+NoNDQFzeA2s
	 GlbnVm9Y211Y/tcNZiC9TDDrx3zCOaoojqtJeaB3PipkryUahZIK7RXXVRiwKU3Xiy
	 fdn9m5m3QNhqw==
Received: from localhost (mi-18-37-83.service.infuturo.it [151.18.37.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D3606406FA;
	Thu, 25 Sep 2025 16:33:13 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Daniel Garcia Moreno <daniel.garcia@suse.com>, linux-doc@vger.kernel.org
Cc: Daniel Garcia Moreno <daniel.garcia@suse.com>
Subject: Re: [PATCH] docs: extensions: don't use deprecated ErrorString,
 SafeString
In-Reply-To: <20250925094508.43174-1-daniel.garcia@suse.com>
References: <20250925094508.43174-1-daniel.garcia@suse.com>
Date: Thu, 25 Sep 2025 10:33:08 -0600
Message-ID: <874isq4hmj.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Daniel Garcia Moreno <daniel.garcia@suse.com> writes:

> This patch replaces the usage of deprecated docutils ErrorString and
> SafeString.
>
> docutils.utils.error_reporting module was removed in the lastest release
> 0.22. In the previous release the usage of ErrorString and SafeString
> was deprecated and the recomendation is to replace the usage with:
>
>    Replacements:
>      | SafeString  -> str
>      | ErrorString -> docutils.io.error_string()
>      | ErrorOutput -> docutils.io.ErrorOutput
>
> https://sourceforge.net/p/docutils/code/HEAD/tree/tags/docutils-0.21.2/docutils/utils/error_reporting.py
>
> Signed-off-by: Daniel Garcia Moreno <daniel.garcia@suse.com>
> ---
>  Documentation/sphinx/kernel_feat.py         | 1 -
>  Documentation/sphinx/kernel_include.py      | 8 ++++----
>  Documentation/sphinx/maintainers_include.py | 4 ++--
>  3 files changed, 6 insertions(+), 7 deletions(-)

A couple of things that are good to do when sending kernel patches:

- Check linux-next first
- CC the maintainer

This one has already been dealt with:

  https://lore.kernel.org/all/87ldmnv2pi.fsf@trenco.lwn.net/

Thanks,

jon
