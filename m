Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7530FF28
	for <linux-doc@vger.kernel.org>; Thu,  2 Oct 2025 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759407812; cv=none; b=AuOhB0N/ifUldRRQpwI9yRWIpFYqBZJr3ZuRaDe/1abQyBSjhyds0i/CfiSAYdItrKvz/lSQ9ksK+wUNvWQqNbe9e7tT5+RtBTB9ssZ8E68X8Nko17CX2Pd6N8zjDjksXymEXdGnGX+8XtEic+FgZg4+hpMDtvecfmtMJxpRb5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759407812; c=relaxed/simple;
	bh=rLmNtdE/xdnRQBU68yuVQRYXCY9GwkXf/pNOOEg248w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VUl88GTpblk1QjCvDndXTRwnq6knrAfbGn3zB3BDltQ/xSIwlHJ7eKeCISNhcpAL3WT+Q4e/JnHb8NfLYlHO9Qdd+FLoSnm73vqSoi4JbcHBmX9yW7HkL6NR7qQlDATQz7v6K44B932522rxQygR+HEhsLT2c/mZjXMWR1VuWvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iUIekTY7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iUIekTY7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nG/d9v1oKWis6F99ZNC7Pf/FkaoNMV8IzhA8el2sms8=; b=iUIekTY7dPxZ8lo0/NGvWKC5E5
	leh1nhvUHqjPTVuilQe0Ig6tEez/8gU3jgoEt6kM1pYhOvqYo4cBOJL62gS3xOAHsXffZjnwlJxCQ
	GrFyJlUFCsNPJP4M6eSM+31dqD1VYg/tfHbYJThfeGM8KSI3wOCXGa2omfSTXzCXS6UoChY3awKNk
	gY4F1W3Hl8ZU73w6qa+7He5UkGjqCKemE29pWGg4efB0/G4MPdnAQAvJAX0Z3WDrEkO+NrGXT6f/G
	vWLjR8v5Ql0RErbBrmqMouZ02WPacAdS0JsFjuxAff+bAYZXQMWWsEwmwTiYUTTXgm2EMbO0N4XAX
	zYyRWKLw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ILD-00000007Riu-1xZe;
	Thu, 02 Oct 2025 12:23:23 +0000
Date: Thu, 2 Oct 2025 13:23:23 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Mr Tourist <zakiuddin321@gmail.com>
Cc: rdunlap@infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: reorganize kernel documentation overview for
 clarity
Message-ID: <aN5uu-yJZQiORUEL@casper.infradead.org>
References: <CAOXP31GrRf2Q8NcqQ4161TiUuagZjp8i6CmEPZC1LsiGjxcD2Q@mail.gmail.com>
 <aN3RjymBjn_VfcLe@casper.infradead.org>
 <CAOXP31FT7cZ79gAH-yOb+E8UX5sNnztL_rwjn_x-aLHdefjk9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOXP31FT7cZ79gAH-yOb+E8UX5sNnztL_rwjn_x-aLHdefjk9Q@mail.gmail.com>

On Thu, Oct 02, 2025 at 09:46:26AM +0530, Mr Tourist wrote:
> Thanks for the review and comments provided Matthew and Randy,
> 
> I have addressed the comments shared and have attached the updated patch
> over the email.

No, send the patch inline.

Also generate the patch relative to what is currently in the tree,
not relative to the last patch you sent.


