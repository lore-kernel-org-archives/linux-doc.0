Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055708;
	b=pUkyfIoEyS94MfxIQtQpGzvVzg+Mfp9B8XBgdcEROTewofGIU8sNjIJaahWQnFg7N5M/
	 ADJxWDAfO6DLOsTDCEL162M3XoDY6bre53YYAHez7Gie+UxdI0ZA12XPpEB9cOIpa/Xah
	 s8qTyXhhq/5i2HJ8ZxGv6KS+44MbvvsGI0ZCEIe7CAP0rzVls8+pmFLx0+er8htmoAWrt
	 QtzA6rtRfpA9Jtm9AYxnikyyBanTj/giIp8xGtvcUlkDqvhgsV6NTwy829jDwnVLUBSCy
	 XZx8rnlb7px3XadWm+z7w0uHEoH1T0S4klyYZqaCUgaXKxarxkFDYQSYE7rmblI6Fmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055708;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=euZ0nKkeYjZGlgVWrYFEFONwTpZniRDppM5fs/8tuP8=;
	b=gyaMdkv2/SyybsTJOA8cRlWxoTG4qtXLNsj/3f3KLgKilE6/uTgapcFGpeftxfdnSYCA
	 HculNnyKpeSWADlmMiooIp0DwqnPVKlCzsPbHjeFfNn9LVrd5gcZ+kY/wybYpufzcHlOr
	 gMNOysNmeoanqRohVpNGSe3s6UTD1n3dqbZw6jb8TJpXCl3DYQbDxfXPt2baAb8dN6/sf
	 BBeHFihVOLwYhe0uNFi+8YU3/lZSk/5MTD04C0EnSWEnRESeGHxa+yC7VIj7hdse1DNe6
	 ceTku20CbzIk8iD8IAxGYdeJibZCeEHGpXJlYJfLkO4ma75olzOA//PRGBUDEIp21mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vaga.pv.it;
	spf=pass smtp.mailfrom=vaga.pv.it;
	dkim=pass header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail header.b="XR/9nZYQ";
	arc=none smtp.remote-ip=109.224.244.21
Received: from mail-24421.protonmail.ch (mail-24421.protonmail.ch [109.224.244.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11275606A31E
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:01:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11275606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vaga.pv.it header.i=@vaga.pv.it header.a=rsa-sha256 header.s=protonmail header.b=XR/9nZYQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1793055696; x=1793314896;
	bh=euZ0nKkeYjZGlgVWrYFEFONwTpZniRDppM5fs/8tuP8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XR/9nZYQqZLRSHCn5UgU08v8nAbbEXUETAdm2z0BaxtQbgRP7CiHyqvS3Eh4bfe6v
	 HAxnw0mvvDIVI27uGCHfP79gM9deMhDyH3OIJr0PovIomK9r+JpC5EcWF60B9ZSWwv
	 wQYTO1fcrDmx62s5vp2zQi07TXs5kfFoiHNq8mO8R6zLYUEjCBGVRSYMPvGB6pV6Us
	 pzcqIxRp1lCkSOfIbZWXzYZtpmxaGsw3ePgTAcOY7kBMMnuHEFuyULyows9YHA8Zi3
	 TaDlvLcUDgujJU8PnbiUDz4tz1VxLpYv8wngHgdkJZ3bnkBcbuc4IY/pkGTTSrf2Bl
	 f0yZiSdPAmOhA==
Date: Mon, 26 Oct 2026 23:01:28 +0000
To: Daniel Pereira <danielmaraboo@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, alexs@kernel.org, si.yanteng@linux.dev, dzm91@hust.edu.cn, chenyou910331@gmail.com, wy@wyuan.org, akiyks@gmail.com, carlos.bilbao@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
Message-ID: <xhxazs6ynv3f5d7hellvgeh55muhkt45h7gmftyhudfwywfvxj@bbyjvins4u2f>
In-Reply-To: <CAMAsx6cAaXUh+AkdMjZZhf6bFTdK31gqEEpHAA2F1wKkjeC7WA@mail.gmail.com>
References: <20261015125644.12908-1-danielmaraboo@gmail.com> <20261015125644.12908-2-danielmaraboo@gmail.com> <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2> <CAMAsx6cAaXUh+AkdMjZZhf6bFTdK31gqEEpHAA2F1wKkjeC7WA@mail.gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 7d0ca97120275c55454d7746b4a745062e46e09b
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
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Thu, Oct 22, 2026 at 02:09:07PM -0300, Daniel Pereira wrote:
>Does that sound reasonable?

I think so

--=20
Federico Vaga

