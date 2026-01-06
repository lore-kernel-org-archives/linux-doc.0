Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4BF274B55
	for <linux-doc@vger.kernel.org>; Tue,  6 Jan 2026 22:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767737218; cv=none; b=L9wKlzVGghj1LeTiFPjxWwCnyQkmfvi8UGdC5V3IZVEs3eVTMA/yyOaat/hM6Bp2PT3hqd3lc3ZZwtB8Vtuz6LQC/HNHYUCqqYenoyNGEL1MKG19I4m/LfpcdM2eOqwBqYfw2IXwcoj332Hi97twasms1KM5rwBpOQbrdOYJ30M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767737218; c=relaxed/simple;
	bh=xLOWx6uG0jEIpxrh5g1Vxo+YSAWng7bt/vwBtb/JVvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TbE7VIQMNDSdL9fkUj1RdUkAideXqZ+D7MCdkD2Be9q3U+moxKwuxdPBig4kL08lSBCDvk2pcRMjgYItPhlyXgvKP25O7XxTzTAe+zZyioclK8WNKcFsOr/xCj+yFvnM6Dg7RwdJM2RU4NCanLiEoBCbhtyqrtc1gbPshbPUuwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=p7kzN0U3; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="p7kzN0U3"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9661840C7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1767737216; bh=xLOWx6uG0jEIpxrh5g1Vxo+YSAWng7bt/vwBtb/JVvg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=p7kzN0U36XDIIxHXmby7DQBE/GxJZ33RxQduENk7dZuTgbyTOv94L/11OgPI1tGSG
	 Bv7oNid3a+0p7ss4Jba9yhNhbruI5iuCPbv8tzMT3juA9+/s/lhmSAhxSuBGBdfWXY
	 t9qKnBGTqaRFTQwfmzc8WV1H0uCNIA2jWt3CpwZrI42MG4cfDAnmxLItK9Au122PpL
	 zb0G1XrHjToHqI3DQLbGfE5G4jTY1a0NfZQDO/a9OKX6jhosOKJGT6SXWc1EFLm55m
	 4DT+x8JslqUZZe4ETrjCFehAL0anFFOzTECVaJhXA/ryG0+xV8vx77CewPSR1TdJ6t
	 sZyWKAL9xKoOg==
Received: from localhost (c-71-229-227-126.hsd1.co.comcast.net [71.229.227.126])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 9661840C7D;
	Tue,  6 Jan 2026 22:06:56 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Max Nikulin <manikulin@gmail.com>
Cc: linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v3] docs: admin: devices: remove /dev/cdwriter
In-Reply-To: <f5c3f6e9-cd92-47e3-89c3-06dbcfc98c17@gmail.com>
References: <87jyye18n2.fsf@trenco.lwn.net>
 <f5c3f6e9-cd92-47e3-89c3-06dbcfc98c17@gmail.com>
Date: Tue, 06 Jan 2026 15:06:55 -0700
Message-ID: <87344ics5c.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Max Nikulin <manikulin@gmail.com> writes:

> Remove /dev/cdwriter from the local symlinks table and from the related
> note.
>
> Creation of the symlink was removed from udev in commit [1] that
> became a part of release 115 in 2007 [2].
>
> The altered text was added in 1995 [3].

Applied, thanks.

jon
