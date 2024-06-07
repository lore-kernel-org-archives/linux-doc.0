Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520F3D2E5
	for <linux-doc@vger.kernel.org>; Fri,  7 Jun 2024 19:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717787470; cv=none; b=hEdqYkWXEB4nj80gM5m0jycCd5OQsnFtJirh1EdJ6LBHXCuuSfJNpCAhyQV8DaDIw3jG97kEz8drCZz70b+PV1sJggih0sPT2b6+IHQ5JkQlf7TRlpm25t5fRxAhBhwBhWcA1MW9ATSbr1+2tKyTgzl2SNVL8F95uICmpZcVZ2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717787470; c=relaxed/simple;
	bh=+VED5JvYxeMDfZq1jV53wtrZSb4gGg2wC3IZQPytg08=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMlrD8Aewl7vigMKPbWtArw/vEVwMlDTxA0bOm96Y/tYE3LrRJx0v6CdmyLZJBM2z8vPI6OgkXp2qzuRpv3kfS+b3wZcvRuJQrFQaqG+GtM9qqQgLfS5IBcVAIlXw8TqKiaK25VGTSgDIDNz1frqBhIBltQaD7swpckjGvO8dBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=dI2LvVTx; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dI2LvVTx"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nJ6WKrwBWFMOMdUfUnE0cvAsDki47vMmb3hNZQips30=; b=dI2LvVTxD+1DQKQ2MAGajYRaxF
	rL51z9O1ThsXrbhQPUfCCYlQ0rS5M95xmOBxoKGB/0PlMncY0RojH4/m2SqmgZftWQHrdPvJmf5Vi
	ETJuULmHjI75FjGy+8LqTkTCZkzAQAevwdBLmDOF4PcWz7vEfST1OFu581DrVNvUUnbtCZ+iLsGnX
	/611vpmtEyIxSA+tqjRs9trin1ytxnpaABXct5T83Ar/u8LdUng1QY0rsmlhfCURsq5tnE0wUswuR
	YZlVpoLVQrX5yMkvESnoUB0PB7jytaIVoLuEVRrtpL/6o7iGd+ZpIdKCq1TlZVh3rPL+i6pX07KNo
	9Ofj95/w==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFezR-00000006VGw-1FLa;
	Fri, 07 Jun 2024 19:11:05 +0000
Date: Fri, 7 Jun 2024 20:11:05 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Matic Urbanija <maticurbanija@protonmail.com>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: Translation of kernel documentation
Message-ID: <ZmNbSZglTdsB7aTv@casper.infradead.org>
References: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Enls7GJQSRW6Z77NFFcLl19W5U8xKlzEGyKAIOr36JDcFQMaEYewfYgYUz5WcNW3X7Xfi7btGAXNT8Ue_WMGIjaxgdDZiKTk_CcGj-fIMH0=@protonmail.com>

On Fri, Jun 07, 2024 at 05:45:10PM +0000, Matic Urbanija wrote:
> Hi, 
> 
> first of all, I'm terribly sorry if this isn't the right place to ask about translation. I sent an email to helpdesk but so far no answer from them.

This is the right place!

> My name is Matic Urbanija, I am a teacher at Vegova - Upper Secondary School of Electrical and Computer Engineering and Technical Gymnasium Ljubljana, Slovenia (https://www.vegova.si/about-us-vegova/). 
> 
> I would like to translate kernel documentation into Slovenian language. Maybe some of my students would also like to participate.
> 
> Are there some special requirements or procedures which have to be fulfilled before starting translation project? What is the proper or recommend way to start to translate the kernel documentation?

Start by creating Documentation/translations/sl/ (the iso639 code for Slovenian)
Add an entry to Documentation/translations/index.rst
Add Documentation/translations/sl/index.rst

Now start adding documents ;-)

You can send patches to this mailing list for Jon to apply to the
documentation tree for merging.
