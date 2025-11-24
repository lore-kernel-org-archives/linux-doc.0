Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB62BE64F;
	Mon, 24 Nov 2025 18:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764009242; cv=none; b=ZaWQehR75ugEeQ7+F6YkfTVSnjDgh/10qVAqwip6E2s6ZMs7gOfDteKRB0az+1L2vzEtaWbKHDtrQxZ+KfjhMPJ6YIEHofHHVKprS/CQGJGO3yHTOipkdvYjRkSI70nNR9Qvsr2gGpfSKenGUEdWD3LPrk3GKO0ixhuobIWO0YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764009242; c=relaxed/simple;
	bh=9BEX9s+IzX+FAHQ5TTNoBKD3YBp/XRCIbjJgD5ep7QY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nMlsIoTfy5Jq2FHRkV/t1wCst2wkQ4Lhh/yr5u2D+RZbdKHNpl5aMuHOy9sitMzgTf2z1ELJnmN1150ir+xvXj9/O5FlRVp2lIN9n9M/15bFRm0hYZwFklc7ozLPuhJkatHnSV91vOnXqgyzsZRYpM+BtBusHcGlwOryEWR5tmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Le+7Z/yN; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Le+7Z/yN"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=yOmV1n2dWZplJDLz2Tk3n3rpRqsUB+7T0fijc6lvB10=; b=Le+7Z/yNhIWwiHeh7qOoBxZEIs
	ZegZL4fsTDF3yS2iTfaM49V1udavj9LJ4xJCbkna+nK/KXnl/r1MBtMLLQgqZP+vc/QH9KH81hM2A
	/JjtrRMAm8buGsZ9xkCtLn23wdzM9/8NuOXj/cRBYkhl7qTnYvljefz/LxSuGBx+iCobB55/HSCI8
	nPBH8Zkbw2WzXwGsDuW3palLZFTeQ6b8IZVHvNCyn5Xz5jVDbMCDqP43ggBQrpOhbC1tMpbgG1Il7
	97QTVKv+oUyIMlRD6wUeY3NLjBczdTK9RjeMpDzQW5eXgYcnU3Q8mE3UJWkE0FxDwTUWKy9O6i6bO
	VKoSJBWA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNbNt-00000007MVw-0RaD;
	Mon, 24 Nov 2025 18:33:57 +0000
Date: Mon, 24 Nov 2025 18:33:56 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Hithashree Bojanala <bojanalahithashri@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH]  fix kmalloc bug in bpf_prog_alloc_no_stats
Message-ID: <aSSlFE9q1WbCCx2c@casper.infradead.org>
References: <20251124180522.5350-1-bojanalahithashri@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124180522.5350-1-bojanalahithashri@gmail.com>

On Mon, Nov 24, 2025 at 01:05:20PM -0500, Hithashree Bojanala wrote:
> From: Hithashri Bojanala <bojanalahithashri@gmail.com>
> 
> fix https://syzkaller.appspot.com/bug?extid=d4264133b3e51212ea30
> vmalloc doesnt support __GFP_ACCOUNT

NAK.
https://lore.kernel.org/linux-mm/20251117173530.43293-1-vishal.moola@gmail.com/
fixed this.  Discussion here:
https://lore.kernel.org/linux-mm/aRXeK_C44xGb3ovg@milan/
