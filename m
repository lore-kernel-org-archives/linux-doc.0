Received: from fhigh-b4-smtp.messagingengine.com (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9242FD1C2
	for <linux-doc@vger.kernel.org>; Sat, 21 Feb 2026 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771651701; cv=none; b=CELpMCYYmRNth9+/s+lzKcEU/4aCIAaV53Yd91lzgCaHP8SXpRAQuO998Em1xllwIbOPB230a66V8RrG1rOIXxkSaYHCKFnTsqpdWYgoi/XQzfJDApf0s8PqGCGoweRcrZLPDS4THS2ylLpoy3ruPeMMxhK+zGCAONxjpMr7jww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771651701; c=relaxed/simple;
	bh=N9rtb6fCgQJvWWxRSDufNJufJwlQ8tMo3dZG5Hq54Nk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kui0MZklgJ6zLs0RiCUZJdEvEBlT0UTlaPwgwb4W6syNfgbh9uq5vFsOdibC+tkzO5rat7jf0k1UTY6QT801L+Hwfy+JwyPftRNXuShi3crN4MPYV+lFLOY9ooO+J8IrgqMOiRibdMObnx5tBhtX68Mzc2F3IDYxOQgizmMgQkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=OBYet1/X; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=oxpsAX4v; arc=none smtp.client-ip=202.12.124.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="OBYet1/X";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="oxpsAX4v"
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6FFD37A0140;
	Sat, 21 Feb 2026 00:28:18 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Sat, 21 Feb 2026 00:28:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1771651698; x=1771738098; bh=dFbaEocVMM
	58mMOIu/XyB5yvmbHwYdcTYPUSl0xqfFs=; b=OBYet1/XmHaN5GR3MAcfbZd/1m
	gtJaybEn7saewr6XzVquT25yTc0IX0cp9yFo6YTP2KK7mp/I2+amQvjpA8/QYESr
	QhKJ9Pha86b/8ALL6lKYiHOkjhr4ylEBMS0OaBZlRKcJp5vxza4C5iZfbRcHUQbw
	AlHn4/ksLXDAwljCVGoTU/RDx/SdN1a9Pfux2ZrUhsiO7DYFYBk4uHyaz2CQ4HcR
	kyBZZtV+tAxBBHZsL4eXg8H4Ssi0N8gpXr4SK5Xavyq57WRa+2pmYL0BWWXU95sz
	5NPhtwIPtldLzm69XmXEllafPqLfv7Q0pNY1dykaIyF7GnCjE4FkXgT7ZuuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771651698; x=1771738098; bh=dFbaEocVMM58mMOIu/XyB5yvmbHwYdcTYPU
	Sl0xqfFs=; b=oxpsAX4vRtxYjdjrTst2dJaGzryALHWYAzaii86hVi6C99nFOmO
	GJ8Aizo6flmZBBDk/agwGfUrg4i5UFl9aHQWc/uYKY7p9xDJQcpwu11wQQ7a7smm
	cd/W/M/rmbVOYkeyXB/jEL8ZO211LmIbcuulLLviXiVrBuijUMBNKDZPI2H+0Hux
	gGndWkQ/A6gxiiBghAzPQHmgavXMD+5gobL16WRPrNc4cdqlleh92IGizSy6I8Ip
	eQN5d+AbFg1n4ET830ZkPBWleY2svio2hj1kmvprtIYvcUbwzKePS7NCsC3ytWEN
	+1w3hPccgp9T18R4Honuu1vmok/7CuBb+RA==
X-ME-Sender: <xms:cUKZaUPBvvkVOF2dz_RUUgq5nB-T9vAXg5FXSyGiyEiBW71ZAB3HeQ>
    <xme:cUKZaUTri9-LDrlUHRWhz7qDU2Mf3AevCVr51VzO4zLzdbnv5VfF054_OkPmncUEz
    k0XkYjO1mNfVtPorkC2nPqQNN9FQpte2eg4v99aTZ07-ibbh7s>
X-ME-Received: <xmr:cUKZaSgTGCXjkqYJ-o76PhV5Ojt8oSQ8n6ibctXnGPjv7YfY74GSTOakbtSV1txeHKufmHdQ3AjngOsurB-LuIgD9u1_POojc0CQUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfedthedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepifhrvghgucfm
    jfcuoehgrhgvgheskhhrohgrhhdrtghomheqnecuggftrfgrthhtvghrnhepheegvdevvd
    eljeeugfdtudduhfekledtiefhveejkeejuefhtdeufefhgfehkeetnecuvehluhhsthgv
    rhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghhrd
    gtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehrughunhhlrghpsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepihhslhgrmh
    grrhhifhhulhhshhhoihhkrghtsehgmhgrihhlrdgtohhmpdhrtghpthhtoheplhhinhhu
    gidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:cUKZad82hlQBQqg8dhPEI7kOLE-15b83Vj-cAavMviKkGyAgwAse3Q>
    <xmx:cUKZaZEtDpjG9A3S0jx5TarO9SjL1aeRsi6EBCIYurg6Wdpn1f2klg>
    <xmx:cUKZaQmxczlAdMR-ukkDPD7OeOztXz8J9WKwgwvxIcahgyd3ziTvKA>
    <xmx:cUKZadZS4FQ2UlPv-O_czKLvscyZGj9rhmfmuHCzVIlQEFYkmO4eTA>
    <xmx:ckKZaZEmft7xGF8INy0pd8h0k-xl-4Qn8Y5w_Xd6Vv31F8OQEhrH1QWi>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Feb 2026 00:28:17 -0500 (EST)
Date: Sat, 21 Feb 2026 06:28:12 +0100
From: Greg KH <greg@kroah.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: polish Executive Summary and Intro in
 stable-api-nonsense.rst
Message-ID: <2026022158-casualty-juggling-61dd@gregkh>
References: <20260220132910.9645-1-islamarifulshoikat@gmail.com>
 <a6609dac-7fc7-43a5-ad49-497e7cacec40@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6609dac-7fc7-43a5-ad49-497e7cacec40@infradead.org>

On Fri, Feb 20, 2026 at 11:51:28AM -0800, Randy Dunlap wrote:
> 
> 
> On 2/20/26 5:29 AM, Ariful Islam Shoikot wrote:
> > Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
> > ---
> >  Documentation/process/stable-api-nonsense.rst | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/Documentation/process/stable-api-nonsense.rst b/Documentation/process/stable-api-nonsense.rst
> > index a9625ab1fdc2..120c10ec2ab1 100644
> > --- a/Documentation/process/stable-api-nonsense.rst
> > +++ b/Documentation/process/stable-api-nonsense.rst
> > @@ -17,7 +17,7 @@ kernel interface, nor does it have a stable kernel interface**.
> >  
> >    The kernel to userspace interface is the one that application programs use,
> >    the syscall interface.  That interface is **very** stable over time, and
> > -  will not break.  I have old programs that were built on a pre 0.9something
> > +  will not break.  I have old programs that were built on a pre 0.9 something
> 
> The original is better IMO.
> Maybe (!) there could be hyphenated:  pre-0.9-something

I'm pretty the original here is correct, we didn't use a '-' after 0.9,
right?

> >    kernel that still work just fine on the latest 2.6 kernel release.
> >    That interface is the one that users and application programmers can count
> >    on being stable.
> > @@ -25,13 +25,13 @@ kernel interface, nor does it have a stable kernel interface**.
> >  
> >  Executive Summary
> >  -----------------
> > -You think you want a stable kernel interface, but you really do not, and
> > -you don't even know it.  What you want is a stable running driver, and
> > -you get that only if your driver is in the main kernel tree.  You also
> > -get lots of other good benefits if your driver is in the main kernel
> > -tree, all of which has made Linux into such a strong, stable, and mature
> > -operating system which is the reason you are using it in the first
> > -place.
> > +
> > +You might think you want a stable kernel interface, but you really do not - and
> > +you may not even realize it. What you truly want is a stable, running driver,
> > +which you get only if your driver is in the main kernel tree. Being in the main
> > +kernel tree also provides many additional benefits, all of which have helped 
> > +make Linux a strong, stable, and mature operating system - the very reason you 
> > +are using it today.
> 
> This adds 2 lines with trailing spaces.
> I thought that checkpatch would catch that - so did you run checkpatch on
> this patch?
> 
> The wordsmithing is a slight improvement IMO, especially  "has" ->  "have".

Let's not wordsmith this, it's been around for forever as-is and the
content is the same, otherwise every grammer-bot is going to want to
tweak it slightly different :)

thanks,

greg k-h
