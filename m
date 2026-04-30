Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743F24779A1;
	Thu, 30 Apr 2026 16:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777564976; cv=none; b=XuCefr0eHqf41awdW1540qSFJxGa6xhI81wu44kYGCKSA3u1CJI375Q3Z1lINl57Nt4A4TXpY09LTM+DTFqjbIUlvQmQ4X9dE5r9snre4st2TiTCRv33LZ2TcCq/oIjgFDAQQjc50BTov/MoFUTbe4RWcDGDs1xfhoC7hC3pBSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777564976; c=relaxed/simple;
	bh=64ja9oHCn5DeohUNhiC+0I/15Q1PE0GYQJoEQaODMyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=oeQimrtnePbS8mfUf2sdbEzG4n4dTNg0mCm2WVD3i23sfQuatknw0BRV/Oa7WAlcYcYLgh6UgAAPSdMwbtlZw4TC1oN3AaZdYwUg1+yz5ZIZ8NNctKEnC727qsbNdgtAkrvTbJm6MS9S6day1vyOY7IM5z+U1BSikmLSZA75ViM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=m15GH11i; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="m15GH11i"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E04DF4108F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1777564968; bh=64ja9oHCn5DeohUNhiC+0I/15Q1PE0GYQJoEQaODMyo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=m15GH11igDic1dSQ2LSbhK4SchROKmFVdli12U82k7/KPymSHLST9AG+wThqArB9n
	 aHiGBeMKLzKmgbO0XqNfubfH49OgjX/NLxLQEBWDBWB9csieeaNULfu2xWZlxmWQ5N
	 7oonwF6e8V8EXjuqulXvU38FGnCkZfjw6W0+66fqO8pjaowTPSIrZVWimqx//5S7lB
	 A/i1uhTrUhLvnIYH5imZ0xmuhVQHXCNMkoSBf/X7Upd2RfhUDEuiWpwj2F8x3bg9i4
	 BfiLsL3xNd+uhJasdIgy+LXCFUL7oaaU9QykTLKiaAjy071+0hy5p1HL7SUcEqVcus
	 UJNPN6TQtsMVQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E04DF4108F;
	Thu, 30 Apr 2026 16:02:47 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: =?utf-8?Q?Dar=C3=ADo?= Ortega Leyva <darioortegaleyva@gmail.com>,
 linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: improve formatting and readability of the main
 README
In-Reply-To: <b0f3ab39-ae35-4a4b-9333-29d78ca58a15@gmail.com>
References: <b0f3ab39-ae35-4a4b-9333-29d78ca58a15@gmail.com>
Date: Thu, 30 Apr 2026 10:02:44 -0600
Message-ID: <87bjf0h1wb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dar=C3=ADo Ortega Leyva <darioortegaleyva@gmail.com> writes:

> Restructured the main documentation file to use standard Markdown=20
> headings instead of underlines for better rendering. Added anchor links=20
> to the "Who Are You?" section to improve navigability for new readers,=20
> and highlighted the AI Assistant warning for better visibility.

Kernel documentation is in RST format, not Markdown.

jon
