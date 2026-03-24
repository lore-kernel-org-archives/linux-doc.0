Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0D138423A;
	Tue, 24 Mar 2026 10:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774346993; cv=none; b=Xclb/jpJYBH/O5VCs0CryW0wg4KPvAaaZFtTdrubsxeuQ46TzeclMCqGX4LD4Qy52V3RdJ5APuUvBO+b3YGURzvWi/tgBkmf46rB8vCZ2rCKPEnw5aKIVEf+Xh23dqTBazRjfeSwvbK6cN6TUH83iDGysKaJPO7Ko8pWzk6pntY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774346993; c=relaxed/simple;
	bh=btjhgDL8ET2xQZVptsvzISz3oajysKwLAulBrTG65So=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F5X8k66TvTYVGb3E8U7cNKpDzNqUqtrF6lu5NxGd1yN6uinihkGngrX0z0qgpvA7ijMX9Y5/0WFZALZfJA9SRKOTqe8IlB08TP8mCuAq1LOrIRMQbbcP5NJ4luKSH1hnHlM9E1hrWIV8Swrp/Qa4KNAUi6U0GOHFZhe9mb/bw+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=XEt4Joa/; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="XEt4Joa/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jmlJnTySZmDWMkOjZAoeUQR+fhdtlT74RZiVZ452PIM=; b=XEt4Joa/vs/skHzujopdU/ZI1b
	EQuOLj0QUlR56RAzsi4wNnyAJqTq2PI/cQaFdXuPUHJ8E840mzctlxYjEZ3H8993FwYh0JM67dndW
	Q57OGXRyzAjhP6RhlXfRZRxuAl23u6Wntp3t4Fr+G/d+6KvC1J1msDKkf51DKHPpqBxIzzPggTLZi
	hTLJ6MXSJz3D6dz9E5C987wP0IheEtwH/CmAk/F7aXKp7Y4pLqGH0e1wx9nKGRJLEDuQujE0zNusl
	54TAnoJxpVWtu3fkBeEVDVQfQvySqehpiM19UfsJKmPZARUGSIw/qr5/RWYXffTc2F4DF57sNP6Ld
	GunnQvWA==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1w4yhX-008ELG-GY; Tue, 24 Mar 2026 10:09:30 +0000
Date: Tue, 24 Mar 2026 03:09:25 -0700
From: Breno Leitao <leitao@debian.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/2] Documentation: document
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <acJh0Sk4UdjaTFLh@gmail.com>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-2-72a1921726c5@debian.org>
 <e046d0a8-b10b-405f-b3dd-94b7f4450313@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e046d0a8-b10b-405f-b3dd-94b7f4450313@infradead.org>
X-Debian-User: leitao

Hello Randy,

On Mon, Mar 23, 2026 at 09:51:55AM -0700, Randy Dunlap wrote:
> On 3/23/26 8:29 AM, Breno Leitao wrote:
> > Document the new vm.panic_on_unrecoverable_memory_failure sysctl in the
> > admin guide, following the same format as panic_on_unrecovered_nmi.
> >
> > Signed-off-by: Breno Leitao <leitao@debian.org>
> > ---
> >  Documentation/admin-guide/sysctl/vm.rst | 27 +++++++++++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
> > index 97e12359775c9..3310fb8272fb9 100644
> > --- a/Documentation/admin-guide/sysctl/vm.rst
> > +++ b/Documentation/admin-guide/sysctl/vm.rst
>
>
> > +
> > += ===================================================================
> > +0 Try to continue operation (default).
> > +1 Panic immediately.  If the ``panic`` sysctl is also non-zero then the
> > +  machine will be rebooted.
> > += ===================================================================
>
> The table begin and end lines must be at least as long as the text (may be
> longer). Please extend the =========== lines by a few characters.

The HTML renders correctly in Sphinx (likely due to automatic column
expansion), but I agree the raw table format should be properly
structured.

I'll send v2 with this corrected.

Thanks for the review,
--breno
