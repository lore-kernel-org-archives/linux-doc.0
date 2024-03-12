Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5182979DD4
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710271114; cv=none; b=YHpz9r4/raHvEFVpdaOUlt9DnQGysoilny5lYcaXmRv3qmseO7xBThFIj2z/xqmXXujABWwdqGkNJmIZ+wlhc/MlfwmRv/DkV5NPsrQRiH8kUiWP2xN20AXLIBzHiZe6Kjv+nFm94zq2ZeE5oAasNrvdyyq9cdcQqUx/+fIAcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710271114; c=relaxed/simple;
	bh=+kqnd5anT5wzI+bd5hVFx3oIdadn79veWgvw73EE5PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpEjExvPhurETlLUrIeXDULp6QdcUaQWc8OCbCcaXNgErUy3kE3jauRktUb15mw1rRKRJkR9fJq5aEL5Ya9goDdOFfUsHqFzafX7ogJnox0c11ibbz//+spom9iLgfn7lnzJCtGQ/EBZ2IBYmCVBQCt+wf17jxa9mNZPuT1wB4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Lq5jRVHK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Lq5jRVHK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6CXe0g83J/BWt3q6SKLampiKkLdxZASJu+2IKbRVzc0=; b=Lq5jRVHKZx/oJ/ntr7dpP/fH9u
	QDlquW4LMyYKQZfxvzmQ+OIcnJdF/JwgVUOxhOep8aO2p1gWrYlOb/OT/wUuID4LjIhIsr3G7Mb1y
	X7xFASria1xX4XR2wok6rHACO9nPo19dR0+MAHAAlurcg+0OuSS3mk9xD9WpknrApyMdl/DbDIY9F
	XzAnGQR/2NTwuupvyOQs4x27OUzbIRgxXJhvYoywEykkxl+eqbgHED0aNiqVj2+JaS9bbWduo7GK3
	2dsR1qxj94ZO3g7vHq0Plx5/V7ci2BjpSTKeHR9+x2Adp9qCSn1/m0DgR1gfa0sEkoLIvwBhW4B+s
	4BB5pVdQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7du-00000003iLM-2A7w;
	Tue, 12 Mar 2024 19:18:30 +0000
Date: Tue, 12 Mar 2024 19:18:30 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Kendra Moore <kendra.j.moore3443@gmail.com>
Cc: linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Fix typo in admin-guide/cifs/introduction.rst
Message-ID: <ZfCqhj07yDwvHcAf@casper.infradead.org>
References: <20240312084753.27122-1-kendra.j.moore3443@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240312084753.27122-1-kendra.j.moore3443@gmail.com>

On Tue, Mar 12, 2024 at 04:47:53AM -0400, Kendra Moore wrote:
> This patch corrects a spelling error specifically
> the word "supports" was misspelled "suppors".
> 
> No functional changes are made by this patch; it
> only improves the accuracy and readability of the
> documentation.
> 
> Signed-off-by: Kendra Moore <kendra.j.moore3443@gmail.com>

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

If you wanted to, there are two other occurrences of the word 'suppors'
in Linux:

$ git grep suppors
Documentation/admin-guide/cifs/introduction.rst:  CIFS Unix extensions, and the Linux client also suppors SMB3 POSIX extensions,
drivers/media/rc/keymaps/rc-khamsin.c: * BT (STB) modes. This keymap suppors the IR controls.
drivers/net/ethernet/samsung/sxgbe/sxgbe_main.c: * and allocates the socket buffers. It suppors the chained and ring

which you could submit patches for.  You could also add it to
scripts/spelling.txt so there's a chance it won't appear in the future.
None of these are as important as getting this patch in, since this is
visible documentation.
