Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F3A615382A
	for <linux-doc@vger.kernel.org>; Mon, 17 Jun 2024 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634314; cv=none; b=GNoBMuEsskF41n72lk0AEOJzQ/9YblOmX1LjUn+fya9nl/9ChVBqmDNtfjSEEIod9F4XSm2tIT+RA1yWCR67nwWb5LxCDb4/CjZj1FgbBst/Uhqhfsvk6nb4SkQisAoSqmN9LsfjHQa23t3J+qHhXp1gp0zaSDo4UTpjVtUHfuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634314; c=relaxed/simple;
	bh=4rnP5cEz5PNzkjT4yxs1LiIEGVYxu6UWyQ+3M9Z0Dm4=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ojcI1x2o9renA0ux95S4PajVeRDXzgOPUxh/JA6ZaPzF7EzGDnXWOcROhEvwDLhI03z5f/xaYaIftDlncnRMAbIlgj6ZG6uZ1tcCf9Y+8RSMC3vyNMj93SC7tBReQns5jSBP55g4m0qo22PU2v27FbVrNeo/dHfbIwHtSVy+Dms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=Ppn6HWmL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Ppn6HWmL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7E68245E1A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718634306; bh=ysjSIT7Y9Up+EUMydj4SMmwUlDd5y8jMT40cQaoXHBI=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=Ppn6HWmLVLQJrKT3YBMLR25ibA/VDwabdq+gDP3amU3wT7WLOUrvaZKqoEK218R1t
	 xuVRwXsIr3scO4RdnaknySSZS7kuD651IS5RDMG3FPNimPn/+ooBd7cfMEFSBKc+DK
	 xhgNqpGpnKE11Ldme1Si+FwdLo/1StMMw7mIVEmaEpW0mX6aPFIZ/Eushf1QuCFixh
	 Bn5mE3wcbksZ6t7vaY5fwle/XipnUblKYwHtwl/74xbCv2Z5aAIL81RXV/J3ijWZr6
	 3n9JhGBOSSdJN/PAA5sDLibBaS2oaePDU6DmzVtxWLqhDJa8a0OUULjGu7RBO0kBbs
	 gndiI1cyM2O1A==
Received: from localhost (unknown [IPv6:2601:280:5e00:625:67c:16ff:fe81:5f9b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7E68245E1A;
	Mon, 17 Jun 2024 14:25:06 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matic Urbanija <maticurbanija@protonmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Translation of kernel documentation
In-Reply-To: <nsxoOqrCQ4-K8OjCxC6b-Ln3ZWyhM9w_R3J_Hjap5ERAkiTldY7U96QemhwTwuCvgpC3gOmMUZ-doU9lpx9W2JSQDbALD_-U-TwjB19CwF8=@protonmail.com>
References: <nsxoOqrCQ4-K8OjCxC6b-Ln3ZWyhM9w_R3J_Hjap5ERAkiTldY7U96QemhwTwuCvgpC3gOmMUZ-doU9lpx9W2JSQDbALD_-U-TwjB19CwF8=@protonmail.com>
Date: Mon, 17 Jun 2024 08:25:05 -0600
Message-ID: <87a5jjlk8u.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matic Urbanija <maticurbanija@protonmail.com> writes:

> Hi!
>
> Thank you all for your advice.
>
> I'll start with Documentation/process, as Jonathan suggested. After 
> that doc-guide and translations, especially Chinese (I read
> Chinese) and Japanese (currently learning Japanese).
>
> (Are there any other documents that I should read?)

I would strongly recommend perusing the other process documents,
starting with submitting-patches.rst.  Spending some time reading the
mailing lists to get a sense for how email communication works in this
community (no top-posting, for example) would also be helpful.

Please CC me on any documentation patches.

Thanks,

jon
