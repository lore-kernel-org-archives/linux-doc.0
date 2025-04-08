Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58ADF158DD8
	for <linux-doc@vger.kernel.org>; Tue,  8 Apr 2025 16:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744130515; cv=none; b=SMgbGO7JDyRnvIQRcZhIcrVbrViGbY2kFCVdY3YY7GGnGroGT/ebl6npjL26cRmOG/ywbntJs4Xa2iqVt0K0qL1aFEwirCINKtPek0gqNJ8v9kdgk9F8q49CkyNcTxY1kP+mkRVB5+oV1J/mJd32i3LLSy8qcHR1XVC35/g2KLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744130515; c=relaxed/simple;
	bh=4op9jNhu1JrYinf6lyrrAvndTpJ+bMmeXtUhZ5RQAyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q3XSO5mI78pdTy+bvMCqL//qoshTD0eb+egGpH+bNTvF1fLPauC0jc5COJZ/Uq11jprm+/LNx2eMQoeFZEYQm6K9AY3sicmarAuhnigZRyBQ+j3YP4oU36efcREO6wzx0wyWT+nWnzXYiEFKYpHkliaS0qAMe8z7c9ZtmWzNwd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kTBq7tk2; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kTBq7tk2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vvGkU4gEgFwDt2sKMqjCOFpYd9TI16NHGHC2HMBpO4M=; b=kTBq7tk2eHSmviBufhNL52rJji
	durQxeQIaRA6HHOVppjTWPWP4qgdyGfRdpfq128YPdZtp6dD+KPdSqsbndxwR44U5YQ7ouPclXuY3
	056JcWJhIcIsF7lHOdpq0wD8i3HghcqoOUBPMTK2q2+z12zTPes00P5J7o/1k/x5ncKwnAXFHYvs5
	YVbOxpjwx1iPFgmjZ/vK8Rn7fVNMENXUaJQBw4mdtewtGMZ55oEmNKUfQ7eltR/NXTYXDkyh4AVpi
	D75SGXYOs5aj9oxow0TGHQFFEUm44R4qW8U26aOKzKg00kjBaq8Ul0hoOKaGfl0vVLRRmEboDM38s
	BiiwHWaw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2C15-0000000GykQ-3lqL;
	Tue, 08 Apr 2025 16:41:39 +0000
Date: Tue, 8 Apr 2025 17:41:39 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Moumal Al-Saady <mos.alsaady1619@gmail.com>
Cc: linux-doc@vger.kernel.org,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	x86@kernel.org, linux-mm@kvack.org
Subject: Re: X86_64: Obsolete 5 level paging config flag documentation
Message-ID: <Z_VRw0WUTocVWK6P@casper.infradead.org>
References: <CAJu75abi1gcn78k+srTPNOFRDsyxrgc8_uW9R0EkFxVV3S9Qww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJu75abi1gcn78k+srTPNOFRDsyxrgc8_uW9R0EkFxVV3S9Qww@mail.gmail.com>


Adding Kirill, linux-mm and the x86 maintainers.

On Tue, Apr 08, 2025 at 04:43:29PM +0300, Moumal Al-Saady wrote:
> Hello,
> I was wondering if 29.3.2
> (https://www.kernel.org/doc/html/latest/arch/x86/x86_64/5level-paging.html#enabling-5-level-paging)
> should remain in the documentation, considering that from 21st of June
> (https://lore.kernel.org/lkml/20240621164406.256314-1-kirill.shutemov@linux.intel.com/),
> the config flag was removed, and unconditional 5 level paging support
> was put in (https://www.phoronix.com/news/Linux-Unconditional-5-Level-x86).
> 
> First post, followed the FAQ, guides, please lmk if any improvements
> to communication can be made. Additionally couldn't find in the
> MAINTAINERS file, the maintainer for 5level_paging.rst, so directed
> here.
> Thanks,
> 
