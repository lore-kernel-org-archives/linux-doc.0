Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231E02F28F5;
	Tue, 18 Nov 2025 07:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.201.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763452406; cv=none; b=JYD3eRLWQdYq65KviO2RfNeqkdAm1JbtlzTbhl6A5nuudAhT7CZC7wXcPc/MGB7y+cXDs/Zbip1Bi30ecR/SzAJHpiUyLcA7nHbtMy5OiBa/G6KwC0LZ8bElS3iXeURNlZKXKNCOEhGqJRHwrSHbNFZJJIew8wPHlePrOF5mH+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763452406; c=relaxed/simple;
	bh=ua5Rcn2+zdvOJ+7LaujfTC9q5vz9RMWWUGltSg0Y2XE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:From:To:
	 References:In-Reply-To; b=Tittfe++feL5MrEkkmcbLxiTc0KDpiASfheKoNiAm0HdpH31TfjX/Suzo3vRUJFrz9FOvvxGN18EJ79B7vZFwscHQcMiT4S/CvRLwFXqJdSAt+2fAv3cJ/bLY7Pp9ah5pS6OIqpWf2Omt4bfL3Q3KNHOGBathIhm2gXMcP3MT/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=walle.cc; arc=none smtp.client-ip=159.69.201.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=walle.cc
Received: from localhost (ip-109-43-115-221.web.vodafone.de [109.43.115.221])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 71B0A52A;
	Tue, 18 Nov 2025 08:43:40 +0100 (CET)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Nov 2025 08:43:39 +0100
Message-Id: <DEBNHY301733.1WQ81WKC64207@kernel.org>
Subject: Re: [PATCH 01/19] mtd: spi-nor: debugfs: Fix the flags list
Cc: "Sean Anderson" <sean.anderson@linux.dev>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Steam Lin" <STLin2@winbond.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Jonathan Corbet" <corbet@lwn.net>
X-Mailer: aerc 0.20.0
References: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-0-487bc7129931@bootlin.com> <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-1-487bc7129931@bootlin.com>
In-Reply-To: <20251114-winbond-v6-18-rc1-spi-nor-swp-v1-1-487bc7129931@bootlin.com>

On Fri Nov 14, 2025 at 6:53 PM CET, Miquel Raynal wrote:
> As mentioned above the spi_nor_option_flags enumeration in core.h, this
> list should be kept in sync with the one in the core.
>
> Add the missing flag.
>
> Fixes: 6a42bc97ccda ("mtd: spi-nor: core: Allow specifying the byte order=
 in Octal DTR mode")
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>
