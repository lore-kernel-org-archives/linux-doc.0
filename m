Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32611E834E;
	Sun,  7 Dec 2025 23:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765149875; cv=none; b=P5EifZ/yb3Hu+0dgrFOfEcIvRZ29paWN2pCKNutLQpA7ODmXhWXgU+GnqbH2R4X8qm5S8R+weIV3SMSUQRtmJQdfGFhcqkO0PGk9MGZOpyj0zbUb0GGeiekYBpCWMl9MbXEZMWtctaHa9DSZ0dJvCJTvIoWF1KuXN4T34z7FbEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765149875; c=relaxed/simple;
	bh=inHrNAcGtzt9kbKl0Q8A0E+iQcOBtH7b0sR1r/hgMoI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4MN0ifcQP8eWSZzmICoiwLlma8gmynFzak2/4K+LJyWduxCvqLv/2vfD/wYuzJuUTZZuuOfHic4GovT76GM28c4U4DyNubjzzQoUv8WAl+puEGjHw/M1Cehz8V09XSdYGix12Z8JYXv4XfrpUHj/nXULUMLB9ddtwNVV35tpPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=VPq9IVJh; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="VPq9IVJh"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zh2We+iALqqOPdGOcKdG9XSRtXkyirFarAeTGazkIr0=; b=VPq9IVJhuE6unKEM/qldjPP0xf
	msfOLT0Il+yMFigky4AWEQXigEfI7wHlzTdit260b/ShWMZ6J/cIzugU2/1fffGKu555LpsPWVoxI
	2o6rZxP4dFKwZFqbhZ7u9pEsSxJXL5TkoSpa/vOwGhIR2AqXdrpqxFekU2qKCUnCWRUXY9e+/axn/
	qecaxfMIFc29edV1OtxsJ5oNvoGi72z4CCgZxl7klY4ZgsNdOlzm0FSR5uYAMI9fyozmsdxrim3ZN
	mkQGtRcb7gtL2Gq2ZKIfck6BXj/XeBzXm1PjXkekRXqI0+GZywqmarLJUvaafLi/nUMMABxqVIH90
	K6z1dmPg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSO74-000000091Gu-1LKb;
	Sun, 07 Dec 2025 23:24:22 +0000
Date: Sun, 7 Dec 2025 23:24:22 +0000
From: Matthew Wilcox <willy@infradead.org>
To: =?utf-8?B?4bSL4bSAyoDhtJvJquG0iyBzypzhtIDKnA==?= <kartikpro9599@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: improve introduction wording in howto.rst
Message-ID: <aTYMprKqrg-6lSP0@casper.infradead.org>
References: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOCmVvDcg9d0cNeGqH7+95Wffo4=WXUuSTR_Jbw_Swa3T8xOnQ@mail.gmail.com>

On Sun, Dec 07, 2025 at 03:07:43PM +0530, ᴋᴀʀᴛɪᴋ sʜᴀʜ wrote:
> -This is the be-all, end-all document on this topic.  It contains
> -instructions on how to become a Linux kernel developer and how to learn
> -to work with the Linux kernel development community.  It tries to not
> -contain anything related to the technical aspects of kernel programming,
> -but will help point you in the right direction for that.
> +This is a complete introductory document on this topic. It
> +contains instructions on how to become a Linux kernel developer
> +and how to work with the Linux kernel development community. It
> +does not cover the technical aspects of kernel programming, but
> +will help point you in the right direction for that.

I'd suggest following https://sembr.org/ for this paragraph since you're
editing it.  Don't go through and change the whole document.

Also, it is "the" complete document, not "a" complete document.
