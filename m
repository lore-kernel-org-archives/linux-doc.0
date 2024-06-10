Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D49A1D52B
	for <linux-doc@vger.kernel.org>; Mon, 10 Jun 2024 20:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718050576; cv=none; b=W66mD/C70ZepheJbsEAnSdHpwpY2nyR7dxGoYal+QztZcGLPuqWOnyLWbWXXCMbonLX3UykBYC3vul8JvwlJZhg/lUTxPHzn6u8pLTtyPpAuSwtI63y1WkxFQHffh/wqYUHBfgI8IpXxYY/DHPHv+uWYZ4NJtKUEbaIcDkWa/Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718050576; c=relaxed/simple;
	bh=xv1HncOUSh2mVDGXQAEf7Aqqq8CXEPnkpgOCMkHFco8=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=a3+zdMDL3ZPr1Cbdkkt7PuPaNOONVQlIT+lcKTvf2ztQEoSYr448LxzGBTDYUEDZW9hi+p9ub3VMhLqZ65OaO2Z75E12W4RXDiDbhjHgy4TsKOUZoT/96qz970VhKVkkdZ78hzuAy2zx7puH/Sd+FwaLIrrW3SDVfYHEWv9unN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VzCs7mYL; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VzCs7mYL"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 54E6C45E06
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1718050171; bh=UbstLmb9EnMX2RmrTv1TP8CKBUAgjBs1K87JeM8oCws=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=VzCs7mYLoTJaZJiDnthUWbYpqD+3reg2MoSYTWlDtut/98m96dD3Viu8cAqNu7l2O
	 1VIg9cLlfeq0BDh5kAGtuYlTWtyd0Lx0uP6CHv067g3V3ZmHKZvfM8SYzx5sqJ3YxI
	 iRSOOIqsEC2yfDnnnekVfmC1engk6zCeoiZArp6ortSx5mi/KuZc8sXbxGYfxJoz1o
	 JZFof5T5Lm6UVdzyQ+NDAPa2GH7gguivjs+seeS8jlepaHEL0j7aziEa3+rntoMd7B
	 BoupQhpF0dNvO+RWskXnRW4cx2E02y/WMRYu6KL5Ip8BpR2EjqBGLSalFo/9f9wxRj
	 FWBk4Co/B4qFQ==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 54E6C45E06;
	Mon, 10 Jun 2024 20:09:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Matic Urbanija <maticurbanija@protonmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Translation of kernel documentation
In-Reply-To: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
References: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
Date: Mon, 10 Jun 2024 14:09:30 -0600
Message-ID: <87le3cv9tx.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Matic Urbanija <maticurbanija@protonmail.com> writes:

> first of all, I'm terribly sorry if this isn't the right place to ask
> about translation. I sent an email to helpdesk but so far no answer
> from them.

As has already been said, this is the right place.

Out of curiosity, which "helpdesk" did you send email to?

> My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary
> School of Electrical and Computer Engineering and Technical Gymnasium
> Ljubljana, Slovenia (https://www.vegova.si/about-us-vegova/).
>
> I would like to translate kernel documentation into Slovenian
> language. Maybe some of my students would also like to participate.
>
> Are there some special requirements or procedures which have to be
> fulfilled before starting translation project? What is the proper or
> recommend way to start to translate the kernel documentation?

Best is to look at how the other languages are handled.  I would
recommend starting with the stuff in Documentation/process/ as being of
the most general interest.

If you can recruit somebody else to help with review of translation
patches, that would be most helpful.  On my own, I'm not qualified to
know what's a good translation and what isn't.

I do have to ask one question: is it your intent to maintain this
translation once it has gone upstream?  Documentation evolves over time;
having a bunch of out-of-date translations in the tree is not
particularly useful.  I'll be a lot happier about accepting a new
translation if I have some assurance that it will not end up in that
state.

Thanks,

jon
