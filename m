Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3F914A4C7;
	Thu, 25 Apr 2024 15:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714058058; cv=none; b=CjPFaj16mVTT/fBBi09UCwsmNVpPVS8VTMolaGowWF/2ARtWHyuQHlUvxyrTbusOTARSXO9EN+prp0TPVBDZd5+7epY0gY+V70m0kfEog62Qi7fFoSzluYqy1b/7XNlPHyo2GeGgQS1vrrIIRcFiV9mtq5Z9euzh04gGP24cyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714058058; c=relaxed/simple;
	bh=FI3RHSIowKSjYMHW9athi9aPj4X022XHsvU7EV9JCVQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mVVNleHIxE1uNcQy2RMQ6LgDjI55zs3IM3uhOmC7t34tIHBV3X90NiIDS1ytOPT7IZjcfyeZBA7SX/N8JDsC63DPAsWGYiw85dKbnoArxOBKN9Rrm/8n/tOsjuTO9JIdNojZSL1AcALamLQqstaYXg2gfdvGhu/V0ojcWdbVLgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hxId7Fkg; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hxId7Fkg"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 647A147C47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1714058051; bh=zRLn1xnHbzW1iSNGc1RtWHcYvxK+sTgqStID0oZY19Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hxId7FkgqOtzNRRQ6ldPYv69235a/06e/72CfMJOdsWyo9NgTl9GQmMWmoHR77ahG
	 Aek12K4asZSA0PTTuP31n7IR36wPB83fyUKBPx/+XYc7rWq8px0u0GRr+WoRgefKOs
	 ouazQsWZQ2bZyT+SVh6473LTXaoPpKn3lq1rDL9wL1xH00dD+8QVAMSKqPdTh/P3he
	 i5VYGc1bQC6wKTwP04IFYFeho4oXVckzm7WstoJZXh5pAOhIUy6LvPSsoJqyyqa/Ib
	 F6bQH26qCEOJ5SUKc5bhd8tx6jFc76CDa9awbxMf4+1fJfTUphLPTIkGWauduGutL0
	 ol8JMC+nQ45BA==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 647A147C47;
	Thu, 25 Apr 2024 15:14:11 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Josh Marshall <joshua.r.marshall.1991@gmail.com>, "Bilbao, Carlos"
 <carlos.bilbao@amd.com>
Cc: ngn <ngn@ngn.tf>, linux-newbie@vger.kernel.org,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 pranjal.singh4370@gmail.com, "bilbao@vt.edu" <bilbao@vt.edu>
Subject: Re: Feedback on my development setup
In-Reply-To: <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
References: <CAFkJGRc824vYEufG=6ZVPAW2iVpd0NDThJadZVrUk_ZND_qJag@mail.gmail.com>
 <Zh6Xbqijp8rRGo1H@archbtw>
 <CAFkJGRe+UpNPSnSL623o6G+NCkK_uGPx-NCNLQx0vSGpMo98eg@mail.gmail.com>
 <CAPzh0z8RySn429XYQHoP_c9UA+pb6SLHGhH40vQDhc3P2xiysQ@mail.gmail.com>
 <CAFkJGRfK=1f8tfWO8G0v8SOmCwCgK7P5y7g2My47VG6Obb1DNw@mail.gmail.com>
 <ZiE9ydgMtpKOBLDk@archbtw>
 <CAFkJGRddGHK0j4CcQUoRKiD3afniLY=rRV5npY5wpauqqY0XZg@mail.gmail.com>
 <CAFkJGRdFuMoO4_mR-cR1NWjKQJnopN0v1R11-jSnLn+FKcOCdg@mail.gmail.com>
 <CAFkJGRcg+ThJ-xUve0=WorChW=-6PreLHXeM8YwtwzwpkHTu8g@mail.gmail.com>
 <CAFkJGRcgJA4qe1AVi23ZQVPr_UEzkTBPH8f30g=OsKmii7QzQw@mail.gmail.com>
 <ZiKYXX-v0Eu-qCBt@archbtw>
 <CAFkJGRdjvebW6u6pyyA_MeHsoecRgYjiVrxoWYWsREdYH9iOFQ@mail.gmail.com>
 <7ba7cff1-8d9d-4bc3-a74c-6f6828c9195e@amd.com>
 <CAFkJGRe7DVpcr+VKouTYzBK5r905W4xmxphU11AA6uB8Oj5FJQ@mail.gmail.com>
 <CAFkJGRdu+Ng3APAQAEQntbspXrVNzg_=b2Cd6n0wsFY5m=vWzw@mail.gmail.com>
 <e47385b9-cbab-465e-8c8d-3bbad57415aa@amd.com>
 <CAFkJGRfPinGR30oRJNxiYpib5JCaA3f5D672noR-x_3Gq2UBSA@mail.gmail.com>
Date: Thu, 25 Apr 2024 09:14:10 -0600
Message-ID: <87o79xqxtp.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Josh Marshall <joshua.r.marshall.1991@gmail.com> writes:

> Hello Carlos,
>
> This is a generational shift.  For my peers, we understand the benefit
> of keeping everything in a thread.  But at some point it becomes so
> verbose and cumbersome as to defeat the purpose.  The size of the text
> I'm working with and the number of text changes it has seen meets that
> level.  And so I've kept it in git and referenced that.

Nonetheless, you are trying to engage with the kernel community, and
will have far better results if you follow that community's norms.
Those include sending patches by email and not top posting.

They also include listening to the advice you are being given.  Like
others, I appreciate your efforts to improve our documentation; it
certainly needs it!  But please think about improving the *existing*
documentation, rather than creating yet another file, disconnected from
the rest.  We already have far too much of that.

Thanks,

jon
