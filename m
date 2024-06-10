Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9631B812
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050268; cv=none; b=TqBhUXsf/FjK8M0tBXPF4931YKRoOsoAs+9ZAh4sNC8yC90AieSg2RgxUW1CsqQyNKPj7FmuExIqY16BsDsG9HifUitVOh3AT0bdYhAjlGx9Y0SC4hCj/FrClGibJfZQKJ8lgqLF2QHlhKXWLHS2mzifyhtWQm5x3dAl3TdfLfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050268; c=relaxed/simple;
	bh=YPqO2qclEtl0OFV8otBi5M0GXwgx5mDCVdUzmPOwMX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dxCygaiUX1lveIzm17YDhU6CtKBHtyHiPmH1nUQ7GS1cdWA/S3zHL3122HteSO6HgdtVdvUhm1yqxRpMt1BYvniCmUn8EdITwCREtgfnBfaPzKvgupCZ+aMnuK4TJ+aIcU3jy0ttirOPYDesDxinLAc0VkoKvopCipAOGNqsIIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=kpFNdZ0B; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="kpFNdZ0B"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1359745E27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718050264; bh=YPqO2qclEtl0OFV8otBi5M0GXwgx5mDCVdUzmPOwMX0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kpFNdZ0BZ2DYhFj/jD/x9d7YOmgI5zUmXvYtJiZFFVyHt/g5EylVVl1KXVZoEYjus
	 UPIVukCbzQa2DHot8Yk+KGwHrNEeiPnAHtv21fzN6+Q9+yzxvLXC7UpVPkdztWTyom
	 Km87RNohKO1VeYXs2eyTmA5KnBfE5kKYLzVfygMbmeTYh7Hy9pXMJy5nxVrfOfcq/o
	 IlFmGv2tPXaaS6z6N+c93gJd/ewTtvC30ba/xWrT+C0XV5/ql8E4RQpA6qmUYGubgF
	 NIKVAlBySLa0IssoLWdfo1Bqym6N2gFjt95CR0kpgsUYGGX+fbaVd8uQyGTnPdHLpw
	 15QjOA7/Ct0MQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 1359745E27;
	Mon, 10 Jun 2024 20:11:04 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Carlos Bilbao <carlos.bilbao.osdev@gmail.com>, Matthew Wilcox
 <willy@infradead.org>, Matic Urbanija <maticurbanija@protonmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Translation of kernel documentation
In-Reply-To: <12acfd83-96a3-4c2a-8aa4-e52709e0cf12@gmail.com>
References: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
 <ZmNbSZglTdsB7aTv@casper.infradead.org>
 <44ed000a-8dd4-4dde-853a-2b35fffc8c9d@gmail.com>
 <12acfd83-96a3-4c2a-8aa4-e52709e0cf12@gmail.com>
Date: Mon, 10 Jun 2024 14:11:03 -0600
Message-ID: <87h6e0v9rc.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Carlos Bilbao <carlos.bilbao.osdev@gmail.com> writes:

> By the way, next time you probably want to CC linux-kernel@vger.kernel.org
> so we can easily search for this thread (e.g., in lkml.org).

Copying linux-kernel is fine, but https://lore.kernel.org/all/ is your
friend when trying to find patches submitted to any list.

jon
