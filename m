Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A6435898;
	Tue, 12 Aug 2025 12:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000161; cv=none; b=R2eGbpE4HehhE9uCW5bO6NCNBxmhMGqkErwOI03t0GxI2ZYJPiJVcL00T3L//gWMSdp75BS9IcuEWkVoPtNKfcr+YNbPZxvbqQ97QPzv1aQbe8I+JSvfa/ttAN+23/NGlj0ztUzGAGGmJ51nhDSgh+dIant/vscap8fJraTVgko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000161; c=relaxed/simple;
	bh=x4792kMrZj47j99T6lWx2nj433Rgcq33V5liRqif+jA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dt7XV/IJps7ue7KM9ILmHuxlUtO9WcxErSYd3vYdhmFTulOAaTFc07A99cKSzAxzI5hsqHwCzD8ReJDmTIZCWqMsIu/2FOvHpxvq3HrX5IdAkeUTS9wN71/uAmzo5+MCcMtqHmuNa3Sy1OCOknYUXbfGyIhHyE0KfiUBE2m/G88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=tt440SBW; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="tt440SBW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SCjE30ZZw+UniBUhWFphG1aedCqy4tfoS3bq5SByJsc=; b=tt440SBWK/PzGWUcR+xbDT+tkc
	Fnj7Vy/9tZ4zRYcsBGocRBwe5M7cgXPpEFm2nycc0sp7C+D4xZp/s3ye1oc8RFYf9zaDEWNOBMc6J
	sOs6RaI85evB8WspsNxBl8NBbkDUJn20somsKfRLdHqDIzLhS/4dy8cwOIvWxdI3+Ipq1Bf24sowc
	rg4sEuP05ZHj+IJOCkRNy55zNrRMxroy7HWCdEjSvgtUp7ebZPq2O6AyuEGI40gVfL7k0pP6mX9s5
	mlR4nLFDq6b80M/02eu4Raf0IbHjEC6aaDM6/4USNF01Wyklr2o7quxhL6fj28CkZ/DC9mBTGdbQQ
	l2/y3IUQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulni5-0000000FszU-1Enq;
	Tue, 12 Aug 2025 12:02:33 +0000
Date: Tue, 12 Aug 2025 13:02:33 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Nikil Paul S <snikilpaul@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH 2/2] docs: rcu: Update dead OLS link in RTFP.txt
Message-ID: <aJstWTgc04AdemO8@casper.infradead.org>
References: <20250812094851.3770-1-snikilpaul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812094851.3770-1-snikilpaul@gmail.com>

On Tue, Aug 12, 2025 at 09:48:24AM +0000, Nikil Paul S wrote:
> From: Nikil <snikilpaul@gmail.com>
> 
> Replace a dead link to the OLS 2001 Proceedings with a working
> version hosted on kernel.org.

why fix just one?

$ git grep linuxsymposium
Documentation/RCU/RTFP.txt:\url{http://www.linuxsymposium.org/2001/abstracts/readcopy.php}
Documentation/RCU/RTFP.txt:\url{http://www.linuxsymposium.org/2006/view_abstract.php?content_key=184}
Documentation/RCU/RTFP.txt:\url{http://www.linuxsymposium.org/2006/view_abstract.php?content_key=184}
Documentation/timers/highres.rst:       http://www.linuxsymposium.org/2005/linuxsymposium_procv1.pdf

