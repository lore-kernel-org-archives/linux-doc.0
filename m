Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795642417;
	b=n3ICh75sqRHmqnhC8ahU38WpD6bnF6uaxH5Zv2E9zhBjYDlcrJhbMpVmOZbuT77PzyF5
	 ZTO1XSSvOBUmLIImlLWvJT3S8okFT818+Z+lPJtf5MKX142vRrFrL7zcsDVAsoM9lFQNi
	 qf7RhbSp/It0t0EQzxdFBw3aFqGOlevwt0PKTooTLiV0cvioJoVv0jYc2R+2Ps2G3duBn
	 lPqQpYn//OvOL1VW+uOfBdfWIyvlLMPGowqL/xMJFpCzYlp0mBRHUN6EkDBNDmqS0hl85
	 YcDJhNVwXLH38CYkeaocBWKJkH0VqNvROc2k6hMbU7DqQZFA3SKMMQ7WaHjSysJ2pKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795642417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=FGNJ1d/2nF+bRZrybTD7E/noHwTUs34iqH0nvE138sc=;
	b=VrEHucEswqLhn0+834pnNfRbWtnmNTWAUCGUbEpT5pAzWlklQRwDyl6mmaRM+GebYVbp
	 iZ2q856AWKqT1v6PKMDIWB9LSc6V9m7t4ecNLbL5NeV6Ag9EEisSqUnbXzwoVeuAmjW7h
	 j7T6+nDNFXb6a5h97gBe3B16kkzpOSSZ338noORiXCoPgFrgf+mPFFyW8uW07fLAAamQb
	 cGk5QszJJtsiARxDfQNQ/tN26QzSctlTq5Jqmtbi7fRK6JvwcgRN75xUjvFmn4Li4IE55
	 ATapHQM/6O1ZD9NTKkPPtlPxSpQRr/tSiXiOuJin68PWJ++VKPBqLadG1fflWMj6hoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyaNhQwk;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44656606A326
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 21:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44656606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LyaNhQwk
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4a3e706b5dfso3925605f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 13:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795642416; x=1796247216; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FGNJ1d/2nF+bRZrybTD7E/noHwTUs34iqH0nvE138sc=;
        b=LyaNhQwkXbqpnZKQEFhSkXYdJnRuGKBuuLo4jMsASztOhDAKo/KLjtuUsGuJcBlEXa
         L9q5KsH0RDu7VhTtDI/7sQNdeUHKbiCE4UoTYbpDjatBwUbHY0aghBKcJ1jAy3etEkOB
         SRACMXZz5iIdXEUmV0YEGNUmGpDA+sNgu6gEYF9DmXC8KGwmX9bCsi/CJOLNgO+wTbbG
         lhvnHY38xO9YEx6YYjl+XslYqIdorjHMYTu7z3o6izDZiq+V8t7zvkDvaFfxCYiKSkSe
         OIEvBBzRuYo1TczJtkPUnW8+3ij30yPkrtXbZqfgQ434wojlx8AeDgewp82b/5hogoP1
         RBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795642416; x=1796247216;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGNJ1d/2nF+bRZrybTD7E/noHwTUs34iqH0nvE138sc=;
        b=ghrmE1xdfe2Dqh5G1pZBTuUw4IIoFZmhHelS6ZKmy+KSBz8l30wpkVXXXoLXppIhHD
         AgNROsUr6HGcFrTmJJrw62cGGTewwOLz0cTBLwiBOiK/vmBmmB3aTvnZ1687nWwFlYfK
         /8SfMvtMPF2rvnNkDN3QoXMACWQ1Bpo3HFTviU+slJ01KK1V3wTJBbCzrTUH0YpxDG2y
         Ynh5BR+TrqDe32Xbku7ZU2sDmNnTAMpFqBK1M68mnCfwWBlbCHHcdtScFf0U/CDWogaG
         rAPULhHgMDf4czGrJQFh1RDqn9A/WhyUA0orLcGfS5/OK14P6yhWz7PNX+kYDCDtbzhF
         4QMg==
X-Forwarded-Encrypted: i=1; AL+hErHQmm9v3xBObYpYIV5z4N+TdkgtYU67UspjldM6BsgxBXrNVcOohUN0SFRqZIqkO1qjmPiIt7nRgk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nXxhCJtH0GoqnstZ0k4QZMoLdElWUPP9MV3vDOAc1WeefwDJK
	JI/7WWumHsDE4YGJJcMR7ezeIVPVvAR+YJpiemdgxZ5N8nSkx+w3v8DG
X-Gm-Gg: AZFdTZfr5ZIFsTBa0KD0kqA7ZN6DxO99N2TupMa9WoIl8RPojHSG5GsFh+vl+Jph+Pv
	L0hb1Q2278Njh+IOQSWakAb/7V4RuwXiNTGoNg37ZFh3/ZhMJVzTdVokPsByGQKopPUfpahDlRr
	mtu7ClujlA3N8+Crm7Qoq/X+1Wxoae31Uw+Gy9VhfTntIRT06lMBfnvuf773ZSSVl7Hmj5iM7ke
	WJRb8nQ3EwaWlEiPZFzK1fvdLT8YcSax4SDnvBz9RlaIN3Dos92mMGAHjxQORxF+cRN9fbe7ajF
	uQvZPjQCLMEXPOlO2DulmBdWGjXNdbVb4fjf5DjtLz4IS9a+yeJKVLoNrk3eVe5QkI7iF/3rfTZ
	ZYRzZ8AV77DnLy5dbp8SQKPVkrGM7t1pTuiKTf5pU/5gmnaoEfneduvRwKCb2dFd7MAkSUhjEpm
	KTRZIE4giCRAH4IL2qkdT+FWHy2VqPbJoCfbJsbrcEAYE6QX4+hUCAShRRmNoEMvRLNr216xuJ/
	+NJBvOtl3nU8yqJmy6qAZyhZWGQ7ZTeH7H8E9YDw4vxD76aTzFvWYthYC/7fa4/vKsLh4j4mqXi
	z+fR3F5qMusNrgjbA67nsOEtMK1ec3hFXasyH2sznQToy57gPqZEANAlTT43wjkQ9A==
X-Received: by 2002:a05:6000:4a0e:b0:48b:db7:86a7 with SMTP id ffacd0b85a97d-4abb7787c05mr35815085f8f.50.1795642415460;
        Wed, 25 Nov 2026 13:33:35 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a680355sm30439805f8f.27.2026.11.25.13.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 13:33:35 -0800 (PST)
Date: Wed, 25 Nov 2026 21:33:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: keyrings@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-crypto@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-integrity@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, Ahmad Fatoum
 <a.fatoum@pengutronix.de>, Alasdair Kergon <agk@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Benjamin Marzinski <bmarzins@redhat.com>,
 David Gstir <david@sigma-star.at>, David Howells <dhowells@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, David Woodhouse
 <dwmw2@infradead.org>, Herbert Xu <herbert@gondor.apana.org.au>, Ignat
 Korchagin <ignat@linux.win>, James Bottomley
 <James.Bottomley@hansenpartnership.com>, James Morris <jmorris@namei.org>,
 James Prestwood <prestwoj@gmail.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jonathan Corbet <corbet@lwn.net>, Lukas Wunner <lukas@wunner.de>, Mike
 Snitzer <snitzer@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Mimi
 Zohar <zohar@linux.ibm.com>, Paul Moore <paul@paul-moore.com>, Peter Huewe
 <peterhuewe@gmx.de>, Randy Dunlap <rdunlap@infradead.org>, "Serge E.
 Hallyn" <serge@hallyn.com>, Shuah Khan <skhan@linuxfoundation.org>, Sumit
 Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v2 2/9] lib/asn1_encoder: Add
 asn1_encode_integer_bytes()
Message-ID: <20261125213333.23eedef1@pumpkin>
In-Reply-To: <awcBD-bp27JCVpc-@kernel.org>
References: <20261124194043.1651679-1-jarkko@kernel.org>
	<20261124194043.1651679-3-jarkko@kernel.org>
	<20261125091921.4bf40279@pumpkin>
	<awcBD-bp27JCVpc-@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 25 Nov 2026 17:38:55 +0200
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> On Wed, Nov 25, 2026 at 09:19:21AM +0000, David Laight wrote:
> > On Tue, 24 Nov 2026 21:40:36 +0200
> > Jarkko Sakkinen <jarkko@kernel.org> wrote:
> >   
> > > Add a helper encoding a positive integer from a byte array in big-endian
> > > format.  
> > 
> > Interesting...
> > You allow for integer values longer than 127 bytes but don't allow for the
> > much more common likelyhood of the encoding being 'implicit'.  
> 
> This is the first thing I wrote in 2024 and have not touched since
> without further feedback :-)

I wrote an ASN.1 encoder/decoder for a tcap library a few years back.
Pretty much everything was implicit and some of the tags exceed 5 bits.
About the only things that needed multi-byte lengths were constructed.
Oh - and you can't fit in a maximal length SMS if you use the indefinite
length for constructed items between 128 and 255 bytes, you have to use
the two-byte encoding.

There were a few functions for 'add item to buffer', but I didn't need
this one.

David

> 
> 
> > 
> > David  
> 
> 
> Br, Jarkko

