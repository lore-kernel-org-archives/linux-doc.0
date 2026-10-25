Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.88
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792906962;
	b=PJCCFH9AW8zPbeSKvngPcQuGR4gh2Hm6YOdaYlvN3Ds+mR4w5Z8FA1l40mTh+y3naSWo
	 VoazbvcA1PYXDmaXx5Z4FAf/LCKdfPzSpVDdmIKY2GU3Bl7lVLSUUWjCezHlkbjChu9vR
	 m0Eui66EnZqP1Uxk2crqefcd7a6knRWjtz9OdeAdx7nBk2PVB+Dltr1n6e8G6LuRMEEGu
	 Z5kL3ydr6iec0XR2xEy7fXmxS/yfsvy8XMViw0xQ+ztsNcT5GSn3NgWhrrRm6ItoRbBtS
	 Pags6LzLFST2OSH7kiU2SOGDklqbmbde18xBH8/AZXXlBIpmB1gdPE9Y0NGIzyKJ/cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792906962;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uzqUpvldOgyepFICn9CyFIDXmsB3DlElD/wOuH73qOM=;
	b=3SbpK0zyerrKemryzcNUIz6F4yp3hrXdhcKefmv9/AfldVfinKtHC+sQEVJz4wTwF9gu
	 SHBrEgI8Sy3aDRxm6aMdr6ZbFagMFmi0lUBHfyrPHBBGmyOKJWrdxsLJVqSt4wa4dW0TU
	 HkaLz13JwcdZR1J+DaEKRTOaVHoaVnV71zJY2nobAYdzB7Tmab2oLqpxC9y106XGnGRpp
	 HcZVIuqdDVGdrFi+MZ4lw055cVDpA/vVYw6JZB8xS/fDGrHaFikmDjFa5TpA0DELoaWk+
	 29Nzw3E4IM/sUKNYS8U0jM6sbcrXhZ0UOEF/SdFn9omzqYbozokA5MsYwetYkWrvPQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wyuan.org;
	spf=pass smtp.mailfrom=wyuan.org;
	dkim=pass header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=I+Oyjn4D;
	arc=none smtp.remote-ip=91.218.175.88
Received: from mta0.migadu.com (out-88.mta0.migadu.com [91.218.175.88])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2C5606A31A
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 05:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D2C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wyuan.org header.i=@wyuan.org header.a=rsa-sha256 header.s=key1 header.b=I+Oyjn4D
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=18Iv4f0BUVzuuT+HAHGgMih+vPOIm0y/2K7gWqkQFyg=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792906958; v=1; x=1793511758;
 b=I+Oyjn4DLGMALosLkxzmGTsthmTEuhsRuSvOg7aaxS21tfIiEZMDL5Q+D5l9JTs90tI9lKcy
 rHSs3wNPhDYpRG9tCkwLE5p6wTmY/Ytb8Ayu4RFifjw9IXHzQ/KV0QW02CAZyy76gDyCaeb8AJv
 Tyy7w6xYxvui5H6961SGIVGiWXifaqZXq/bQjOrhZxKDfQ7yfDhkq8e31wi+XpJwyXm0Q7Jyy8l
 wGVlxAoHkR6pvGGWmhL5jRIc0uFFd4SHxp6Yml0/n/tKCTsWwZgkIToZe+Oxnn5lYM1ggb3tCBH
 wTBg1JCRiprj3uubTCsaiDiOwKHgStxU3qi0sDu/p4Ghg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 95ca32f85b2e8eeb;
	Sun, 25 Oct 2026 05:42:38 +0000
X-Mizu-Trace-ID: 95ca32f85b2e8eeb
X-Migadu-Flow: FLOW_OUT
Date: Sun, 25 Oct 2026 13:42:30 +0800
From: Weijie Yuan <wy@wyuan.org>
To: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Chucheng Luo <luochucheng@vivo.com>
Subject: Re: [PATCH v3 1/2] docs/zh_CN: remove translator-related headers
Message-ID: <at2WxoK-VN-Zfhkb@wyuan.org>
References: <cover.1792745468.git.wy@wyuan.org>
 <57bf0bce03cb0257532dc6c44dbba4b77e4f2b25.1792745468.git.wy@wyuan.org>
 <f7e6aa9d-e47a-4480-a003-038f1c57631a@hust.edu.cn>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f7e6aa9d-e47a-4480-a003-038f1c57631a@hust.edu.cn>


+cc Chucheng Luo <luochucheng@vivo.com>

Dongliang Mu <dzm91@hust.edu.cn> writes:

> 
> On 10/23/26 4:58 PM, Weijie Yuan wrote:
> > The headers related to translators and proofreaders appear multiple
> > times in our directory. Their information is duplicated with that in the
> > commit logs, making it difficult to maintain over an extended period
> > of time, as there have been multiple instances of requests to update the
> > email address.
> > 
> > Remove the translator and proofreader credit fields from the headers.
> > 
> > Suggested-by: Jonathan Corbet <corbet@lwn.net>
> > Signed-off-by: Weijie Yuan <wy@wyuan.org>
> > ---

[...]

> > diff --git a/Documentation/translations/zh_CN/filesystems/debugfs.rst b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > index 4981a82dd651..e74fabca3bc2 100644
> > --- a/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > +++ b/Documentation/translations/zh_CN/filesystems/debugfs.rst
> > @@ -8,17 +8,6 @@
> >   Debugfs
> >   =======
> > -译者
> > -::
> > -
> > -	中文版维护者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > -	中文版翻译者： 罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > -	中文版校译者:  罗楚成 Chucheng Luo <luochucheng@vivo.com>
> > -
> > -
> > -
> > -版权所有2020 罗楚成 <luochucheng@vivo.com>
> 
> 
> 版权所有2020 罗楚成 <luochucheng@vivo.com> in debugfs.rst
> (Documentation/translations/zh_CN/filesystems/debugfs.rst:20)
> 
> I am wondering if it is suitable to directly delete these copyright
> information. @Jon, how do you think about this part?
> 
> Dongliang Mu

Ah so sorry, I do have some memory here, but I forgot to mention it
later.

Excerpt from the content of GPLv2:

... 1. You may copy and distribute verbatim copies of the Program's
source code as you receive it, in any medium, provided that you
conspicuously and appropriately publish on each copy an appropriate
copyright notice and disclaimer of warranty; keep intact all the notices
that refer to this License and to the absence of any warranty; and give
any other recipients of the Program a copy of this License along with
the Program.

So maybe better not to delete this line? I dunno..

Thanks for pointing this out!
