Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5DD43EE1D8;
	Tue, 31 Mar 2026 10:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952728; cv=none; b=mV3hnVjFcbvxF/sYE79YJfSVfF898JJ02ZLsEHA6gz+PUgplmNygAOi0rmSeDFUCjOjCJZIo4KkiLGtLWznE3dfC5mweaQ3sFIObb9SY4VUACXM+JoEeKfEhZuCDjTJr1tqSNxmNLgonJzu705dIHDFOC3keIcIluKKt/ntwsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952728; c=relaxed/simple;
	bh=Or0MsLAUgZRD9KP2/ag734x42p0Csbll1jWn9v6NCbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzJqpJUDd5lawayM9kksNutde8cdbVRP1hiGUy3f2jrzQ74IK5OQsRQ0kFVJBLYW8h4lCUfJc74BlXSStZxmwz1g3NYU9bhHa5XvH8BjMobF9LZ5XCmXyJSISOspivB5xwB2JMid5UtPsKshlyr9DbBGsxtrdeJdNnnQwL6bfeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=none smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=Hwn6F+Z4; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="Hwn6F+Z4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wS0B7N8hTDMx34nsv1RGAeGiy66uMx39VPwXLEOqJc8=; b=Hwn6F+Z4RVWedrnbTn8XXv+KmF
	5AeftYsSUV+CpcKV8Dhh/f9dxZvvhDwV8TLXHhWIZ85ubtLv7V+dzW+Ag0UptxBYGS+m9wb6YftTI
	B5fFXXN/QC0DXIlf4d/xt4/rVFitE1jXpCJLb30QRn2PZW9adUoRaItFrM42JA/TBUOXR2gIbOPo9
	r53K28YM6LRlxBHGZP4IJ5d33vb0xH9lUZFE4T0aChDOX267xz7zI9ZcF8k7lI/K03CexBxpH2SM8
	M4kwg6kdgypyxMps6gjHM00AAsjlCxlXsh+OvLKm8W4AcXUgep2yodTI/H4sGPtvvwNme3gnpsBgr
	lRm7yyFw==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1w7WHW-0029LL-1u;
	Tue, 31 Mar 2026 10:25:09 +0000
Date: Tue, 31 Mar 2026 03:25:03 -0700
From: Breno Leitao <leitao@debian.org>
To: Miaohe Lin <linmiaohe@huawei.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kernel-team@meta.com, Naoya Horiguchi <nao.horiguchi@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 1/2] mm/memory-failure: add
 panic_on_unrecoverable_memory_failure sysctl
Message-ID: <acugba9zIDYTjp0a@gmail.com>
References: <20260323-ecc_panic-v1-0-72a1921726c5@debian.org>
 <20260323-ecc_panic-v1-1-72a1921726c5@debian.org>
 <a88d62ee-530c-1a6e-c05f-de324f940b8f@huawei.com>
 <acp8wYLHDGAfhzI5@gmail.com>
 <d8d2a5ad-9b8a-f0e2-3eb0-ee820eb7a148@huawei.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8d2a5ad-9b8a-f0e2-3eb0-ee820eb7a148@huawei.com>
X-Debian-User: leitao

Hi Miaohe,

On Tue, Mar 31, 2026 at 10:27:33AM +0800, Miaohe Lin wrote:
> On 2026/3/30 21:45, Breno Leitao wrote:
> > On Mon, Mar 30, 2026 at 03:55:00PM +0800, Miaohe Lin wrote:
> >> On 2026/3/23 23:29, Breno Leitao wrote:
> >>
> >>> @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
> >>>  	pr_err("%#lx: recovery action for %s: %s\n",
> >>>  		pfn, action_page_types[type], action_name[result]);
> >>>
> >>> +	if (sysctl_panic_on_unrecoverable_mf &&
> >>> +	    type == MF_MSG_GET_HWPOISON && result == MF_IGNORED)
> >>> +		panic("Memory failure: %#lx: unrecoverable page", pfn);
> >>
> >> MF_MSG_GET_HWPOISON contains some other scenarios. For example, an isolated folio will
> >> make get_hwpoison_page return -EIO so we will see MF_MSG_GET_HWPOISON and MF_IGNORED in
> >> action_result. But that's recoverable if folio is used by userspace thus panic will be
> >> unacceptable.
> >> Will it better to check type against MF_MSG_KERNEL_HIGH_ORDER?
> >
> > Yes, I was discussing this with akpm, and maybe the better
> > approach would be to panic for types MF_MSG_KERNEL_HIGH_ORDER and MF_MSG_KERNEL.
> >
> > In both cases, it seems that, the page would not be able to migrate. What do
> > you think about a change like this:
> >
> >
> > @@ -1298,6 +1309,10 @@ static int action_result(unsigned long pfn, enum mf_action_page_type type,
> >         pr_err("%#lx: recovery action for %s: %s\n",
> >                 pfn, action_page_types[type], action_name[result]);
> >
> > +       if (sysctl_panic_on_unrecoverable_mf && result == MF_IGNORED &&
> > +           (type == MF_MSG_KERNEL || type == MF_MSG_KERNEL_HIGH_ORDER))
> > +               panic("Memory failure: %#lx: unrecoverable page", pfn);
> > +
> >         return (result == MF_RECOVERED || result == MF_DELAYED) ? 0 : -EBUSY;
> >  }
> >
>
> Maybe MF_MSG_UNKNOWN can also be considered? Kernel can't do anything further
> for those folios.

Agreed, I'll incorporate that change.

> BTW I think current code can't reach to MF_MSG_KERNEL and MF_MSG_UNKNOWN cases
> bacause there is always a (PageHuge() || HWPoisonHandlable()) check before calling
> identify_page_state.

You're absolutely right. I'd like to address this observation as well in the
updated patch.

Thanks,
--breno
