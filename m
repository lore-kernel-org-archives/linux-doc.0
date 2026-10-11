Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB16223817E
	for <linux-doc@vger.kernel.org>; Sun, 11 Oct 2026 21:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791753970; cv=none; b=TrT+43oiwEIEu623hrmdxsFL/SV+WUCot8D1KPKdGoySnsoQehlw7BcvIi1NZaTq8yF9a+UmhyripGXp2l4f6WCVpU5vF2Xr/7eYf0zjGdRLffZU+VhtoR0Am8dvlG5NIOMI5SKNzu26z1u3U/IH81IeHO2xLQUlr5UxtYsqTyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791753970; c=relaxed/simple;
	bh=pG/CM3X1lZPavEKWIGEJdu+0bFA82ksniUnSmf9M/Ek=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=qUDtFBaBZi7sUQM3B59HjzoFx1QBaVgxKTznaeAF/qHWGKb/Jf08AdAMTXFwLtgvmwgC63QqCIMKQ78FPKjz737xKX2MGm8wWcrH+XomNlDxHuvgwoAN+M+2obLGWxldhA2a4oWfeXD8EWMjxGMM1mc16eWgLCU7hv+yGHR1TrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q6EOZsvX; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q6EOZsvX"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Pnnws7lEAmrf3B1LokF7zaUuZwu40uPCgTyEYYQLG34=; b=Q6EOZsvXXxarRZGdIbFtsRP36o
	GcFwYd5wzJ1daqH6XueN8eExPwEUNMkUhrOVbZJMcHAO/Z4KCxfeyQXClGPBHkSLjcz8BDE/4enQJ
	DNPrPHfcvGURcQx32En3RcjJo3/HqqJJVIVDuh9ncf2SOSYFBXWfa4Oc4lsEwDeAFjaqc4AXVLPw4
	0xCJYF445POg49f1vHeDZQyfhzwypfYDXSkDmu0ay6DmOch4eK5YZRXIy/W83d5/bM11UcDmBN0jm
	jTnAylb6RexZPolgv1rGsX2GvEjWzc28kChlnkDIEr8vIPIoXhz2/6yN4r/f/oVoDEqCkZ78seicc
	B6mReB2Q==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG13U-00000009QAi-2lM6
	for linux-doc@vger.kernel.org;
	Sun, 11 Oct 2026 21:26:04 +0000
Message-ID: <07bf838f-a393-4e32-b02c-a09b6e3a2cd4@infradead.org>
Date: Sun, 11 Oct 2026 14:26:03 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linux Documentation <linux-doc@vger.kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: kdoc to drop entire static_assert()?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

Where is a good place for kernel-doc (kdoc*) to drop an entire
statement/expression?

See net/netfilter/nft_set_pipapo.h:

Warning: net/netfilter/nft_set_pipapo.h:99 union member '32' not described in 'nft_pipapo_map_bucket'
Warning: net/netfilter/nft_set_pipapo.h:99 union member '32' not described in 'nft_pipapo_map_bucket'

This is caused by 2 static_assert() statements (that
can be ignored for kdoc):

#if BITS_PER_LONG == 64
		static_assert(NFT_PIPAPO_MAP_TOBITS <= 32);
		u32 to;

		static_assert(NFT_PIPAPO_MAP_NBITS <= 32);
		u32 n;
#else

thanks.
-- 
~Randy

