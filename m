Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1DE352926;
	Wed, 19 Nov 2025 15:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564803; cv=none; b=hPlUPzcZ/1oqQQhoChTLfT+j95tLj3wX2tzBOl82sxw332CVL0nLJTLH4A/WYWUOn6zsy4SQgSlopL2VTZULC+A39p8WpTL3FF0dSK/ILFPARKMs5FBBniAUdBluXZ6uthPg7aD+QQ9xZhs0ORIHjjIm4Au8utGD39uB9PyckiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564803; c=relaxed/simple;
	bh=9ygV8Ib5R9B59P1HGoxvGRbw6RavX/VlcZjwl02fSmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RdrZIBR+D28U2WWNsIpt6uFn5qPzXIlvfEcS9Gwlyja4+PF5saFjWd7oi/44yC6DGIaD+H8nCNHrYkySdh4UeQFjpgTV1rMvhlQKXw7gYkC6azMAsUiy8e4e98PCBjs4spe/94nUXfzDorLdsIrrQGfE2qHcnd6FFCb9/x4Q7wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=OqNUZW+Z; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="OqNUZW+Z"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 87D3540E022F;
	Wed, 19 Nov 2025 15:06:30 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id NynMnOoLNrog; Wed, 19 Nov 2025 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1763564787; bh=ojK/cPC++4e45VG5AQMxGG7pg6Lk/+lBeFb2u0szPco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OqNUZW+ZRS185OjIeekvMRGChlr33Fqw3cWg5/zmoKyYIy+bhpvLxmtB7m+zqDCbP
	 3owrtUQU7veRkV8V7nIdzBo2Dce7F15uF6sOUfp1RsQd+H+OFPK9ToVWa0VIooOgyR
	 bJZUl8OJME0sMexo+hnL8GokX+gkq6uyOj5eOPy4ymTitknOKUwrc3FREru2pdFj+B
	 p1MJE/hL2hF0/2f5+pKqOz6uFFCGdRTDyPo+AnEakM1dzEV1YuBwcSgOM3Id1vtZM9
	 2HsxD+2Gemxui6vXyWNDSyL9YoPqcnAzaeP3Ja0aqBCBHSeKOjiD28pHJ4bDhRROh+
	 ud1gj6sZp2cYsl76198Pa3yqBe71+vprQ35Hq3k9XQySv2xBdXnRokvcwDjK/umgah
	 v5buPYiKlCDTOGbnp0qMP4LfmjcKsEF7u4PqXOmZOEvmWp00nNNNzqyKzlbLwNqLbT
	 TdDg6eXah1YDxSC12CrXAtIPAe2WwUJXvSjm0ieTaDIH7xq40nR14lP/yZuCLOuBrb
	 Emx6A9+8hSXY0gtiDFpuOrTQgV0Szp2mXHHOSbBu/A0mqUQuzoYyBHrvCvdoW050JN
	 7FfD6XcSZr35FR39s1Dgk483nF4nFTcWhqe+WkRRl9e2oyGm90ORfs+4bs/649UXvE
	 PAPqrcE22ySOOvuF/oa8ao1k=
Received: from zn.tnic (pd9530da1.dip0.t-ipconnect.de [217.83.13.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id D669340E0216;
	Wed, 19 Nov 2025 15:06:22 +0000 (UTC)
Date: Wed, 19 Nov 2025 16:06:16 +0100
From: Borislav Petkov <bp@alien8.de>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Borislav Petkov <bp@kernel.org>, linux-doc@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Documentation/kernel-parameters: Move the kernel build
 options
Message-ID: <20251119150616.GDaR3c6MW9VkFKpH_C@fat_crate.local>
References: <20251112114641.8230-1-bp@kernel.org>
 <87a50j5n3f.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87a50j5n3f.fsf@trenco.lwn.net>

On Tue, Nov 18, 2025 at 09:20:36AM -0700, Jonathan Corbet wrote:
> So I applied this, but it's dancing around the real problem: that this
> material is split into two files in the first place.  I honestly don't
> remember why it was done that way

I was wondering the same thing.

> - maybe just to ease the RST transition back in 2016.  I think we should
> really just pull all of kernel-parameters.txt into the RST file.

Except the .txt file has its own formatting and if the conversion to .rst
makes it more unreadable due to the .rst formatting gunk, that would be a step
in the wrong direction, I'd say.

So including it verbatim as it is done now looks like a good compromise.
Unless you have a better idea...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
