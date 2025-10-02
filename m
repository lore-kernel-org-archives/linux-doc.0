Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AD81D798E
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 01:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759367572; cv=none; b=urAswSgnHZ7dBi/JRRLmB4y1avkX+3YoR/51Li5dnxb9EGt0oVb3Nm7SNxHzRLK5YIiZGCMvacM+1rRZn18z/1pJ2Chd/qC5irGWUEb7M7mW077rwyHwpYrT4OffPFKMWSpLaxaFq5HoA7Y/j/t5yx96vUlhsausMMzN5P6zrXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759367572; c=relaxed/simple;
	bh=TgzLRvLvlWkna2Bu/4p6vgVoEL11vrM4vGZ0XiVhGCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pb/vWi2KixoyBw1W/Z0LJqqycb+OaxUoHPsCNmdh7F9APLI6QP6DGH5vafqEvAShyycJqhYOy1mg8HruuJgGy8Jauz2WgqFoynDfC+l9V91k/tVkE4yfNBEXWSO0CxtBwifVed+zEcLPn+Xstp2DAO8zBkqM8gziPPbnfPjZy2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jILowACD; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jILowACD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TgzLRvLvlWkna2Bu/4p6vgVoEL11vrM4vGZ0XiVhGCQ=; b=jILowACDxJ/r1QmyVBhCaX88pA
	7QtrpKtRA68Fw47TmOu8Xu9jqMp3JDVzbrplKzse7zSSw9Yf6RqHD7ZXvy1LG9ZXY5Q8EMQkjr8yR
	MgjZL8LTn4jRzQMKTHaVs0M7fCil+rQfYSc6ED58bi2yLpRW7Fah3KNVs3A7sBVJUWkDqg3Hws6PM
	hetwB7U/qCL5nq5rc+pxjJ4JZTZCFisR6SVLDwgRiJK6VoXby7Kl1xa8IYAo1xdtZ2v69PjfWCG0J
	UrvgK1rnYUAqSA83cW1LFSWP6PBqrgkCg+m5czcPST+U+UDZuogmWk8i6abcMWX6dsK1102+3EWD+
	k6tPz6ew==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v47sF-00000004rXY-2J7d;
	Thu, 02 Oct 2025 01:12:47 +0000
Date: Thu, 2 Oct 2025 02:12:47 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mr Tourist <zakiuddin321@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for
 clarity
Message-ID: <aN3RjymBjn_VfcLe@casper.infradead.org>
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>

On Wed, Oct 01, 2025 at 04:50:52PM +0530, Mr Tourist wrote:

... you screwed up sending this, so I can't reply to it properly.

But in general, Linux uses reStructuredText, not Markdown.
