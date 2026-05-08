Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A505345750;
	Fri,  8 May 2026 06:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778221861; cv=none; b=ixXhelbu6GaeZHH4CzbF79rWkAaLWLgZqEEGsiswRNqb1ABI7FEKGU8ZWGkDGxs+w3Qi8gfT1POqeV+cxGqxggPi1Xme5gkbj3tX0TF+bG71QNN2n343P0hoRpfTQJgphjqB4FEKCb7f8p7YGlDTYncN9WV3y17k7II20wNfgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778221861; c=relaxed/simple;
	bh=6Jig/He22Bmju1B+AuDIGnaRi57JQX2CyToq6EYF+LE=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GrnRKv9U1QtL1Yk2coGWr9hN3W7HO7QPhYT3p9Uw+WAGK3HdzTE+F2CIHpYYT2fe+M5G/1w3CVtWzkPzFwaWfCfyulPvea3NsCRmC2A9RKc+By8e0QPPDt6isg7kVBdyJVRSkz95toRGmj06dtOqjTukwxKCPxLu+Hde/CO49E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=pEbm03Gw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Emc05uua; arc=none smtp.client-ip=103.168.172.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="pEbm03Gw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Emc05uua"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 45964EC0175;
	Fri,  8 May 2026 02:30:51 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-04.internal (MEProxy); Fri, 08 May 2026 02:30:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778221851;
	 x=1778308251; bh=P6Qisp2uh+ZU1pZlgMPC2wwUyiGwR/sCLzdvoiRuaJY=; b=
	pEbm03GwGkwVJ0XA4b/cIbLytUnIn6TMfuxNcpNOPmwu15Q1R4wa040V852/Kd/T
	vLOYqetqgJwFCsNWCWMrfA949L2t8oVhKvofN0vIxUXgP82AhKn7r+30FGgwiNpe
	km2fUVGZ0gBpJk/XCqAs6Ttes4rTzMPlJlfasbEnpX0AbsaZ2EO3IW3OSqmfbsZu
	e6DwHEXOsH6Q9sIrt2wrzWnRhTvkXbjF3Yo2BVmc/dwRQcdn8OGOkT+fESpCdRM2
	IavUgNBmev6vhUG1KuuPe6lnN8ydb219JENbaq+THS3XUHWC0IWPVcdEoNYg9Xxo
	YEjlTE6wqJj2aHB8eZ8UCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778221851; x=
	1778308251; bh=P6Qisp2uh+ZU1pZlgMPC2wwUyiGwR/sCLzdvoiRuaJY=; b=E
	mc05uua+0gVLrsO6srLb4cM6xP2Ts6pOUGWR4UzfbOelAut0L3wo5TSX0qmq0Zbg
	ZsFQrvE4cBUk1tUFhWGYf4zZAEdG//q8BTQwkugupS0pMmUwD/v6vS0NXJIWWema
	opPAt626ttnLEqVDoctHb7I1O6MLcjdNMDqutCt35ItZHoGcLiB1JpQzvhko7Ara
	QTUtaBp4R8Ks7ptnmO12DRbEq/HlSZ3hOoqqN4Lu3Fuzs+wn2AFQ/5uqg/lujZf+
	V0y8sK6GyXNz7doJneo9kB5DVL+eOMM2x4VzNrnoT5sLs9ZQdYrcqaPsjJm1PjSj
	W1ob/bLuRLSyGijeJdHMA==
X-ME-Sender: <xms:GoP9ac6pFE4it_buoGgv20U5SEeWoTn4wXlmPJiFUSkq67mxIfdt3A>
    <xme:GoP9aYs00tinCves_92f0wYujXVvMee4uj8XN-IQyzbUH0o9OxvCqc1hy9yxiQyS7
    Q_VAN-llW1ISyawP4V0p35PYrwxyVnuSBf1XuJh1U4FXAJSJpbP-30>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddutdelieefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepleetfedvfeeggeegheefveelffelledvteekkeegueevteduueeffffhtdelvdej
    necuffhomhgrihhnpehsrghrtghithgrlhhirgdrihhtpdhrshdqohhnlhhinhgvrdgtoh
    hmpdhkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeelpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopegvnhgvlhhsohhnmhhoohhrvgesghhm
    rghilhdrtghomhdprhgtphhtthhopehmrghnihhkuhhlihhnsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepjhhirhhishhlrggshieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    ghhrvghgkhhhsehlihhnuhigfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepsh
    hkhhgrnheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegtohhr
    sggvtheslhifnhdrnhgvthdprhgtphhtthhopehmrghrthhinhdrphgvthgvrhhsvghnse
    horhgrtghlvgdrtghomhdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:G4P9aQLODOh_z6cMVyYRGbr3Eh5VPCdH-vmDFerxlH2JKwD3mSrWGg>
    <xmx:G4P9aQk5AwblKwPfhehDh79W7ZDnsdQnFMwcASPq2ajldI0u0AwP_Q>
    <xmx:G4P9aRZb8J_2M_4XzcznNNpbmeV5fXdB_D1DHtB6LEuULHtM0suw2w>
    <xmx:G4P9aU9zQI_ejs9dEmDP8LDmU5rNGIEZ8H1jw7rLA-i_VgqWYl85Lg>
    <xmx:G4P9aeXZ7_QJ6PUpmlB0B6AdA2tl9ZRIiQYXNl8t9eMquKamcOLKlK5V>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E11961060065; Fri,  8 May 2026 02:30:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AjOVnvd5Dno-
Date: Fri, 08 May 2026 08:30:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc: "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jiri Slaby" <jirislaby@kernel.org>, "Max Nikulin" <manikulin@gmail.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>
Message-Id: <2f229a4f-110a-437a-8ecb-51e2d6adf30b@app.fastmail.com>
In-Reply-To: <20260503035824.24078-1-enelsonmoore@gmail.com>
References: <20260503035824.24078-1-enelsonmoore@gmail.com>
Subject: Re: [PATCH] char: applicom: remove low-quality, unused driver
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, May 3, 2026, at 05:58, Ethan Nelson-Moore wrote:
> The applicom driver supports PCI Profibus cards from Applicom, later
> acquired by Molex. It has severe coding style issues and has attracted
> a number of bug and security fixes over the years, despite the fact
> that no one appears to be using it. It was broken from at least the
> beginning of Git history (Linux 2.6.12-rc2 in April 2005) until October
> 2008, when a fatal bug was fixed in commit bc20589bf1c6 ("applicom.c:
> fix apparently-broken code in do_ac_read()"). In the commit message,
> the author commented that no one they knew was able to test the change.
> Since then, there have been no commits that indicate the driver is
> being used. Later PCI and PCI-Express Applicom Profibus cards only
> officially support Windows [1], and even the PCI-Express cards have
> been discontinued [2]. Given all these factors, remove the driver to
> reduce future maintenance workload.
>
> [1] 
> https://www.sarcitalia.it/file_upload/prodotti//PCIE1500S7_PFB_987651-3769_0876250001505823933.pdf
> [2] 
> https://us.rs-online.com/product/molex-woodhead-brad/112011-5026/70631928/
>
> Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>

I recently looked at this when another fix came in and came to
similar conclusions, but at the wasn't sure if any users remain:

https://lore.kernel.org/all/5c4965c8-dcec-4faf-bd87-19ca7665fedc@app.fastmail.com/

Let's go with your patch now. If users do remain, they should
be able to either just revert the removal locally, or work
on reintroducing an improved driver.

Acked-by: Arnd Bergmann <arnd@arndb.de>
