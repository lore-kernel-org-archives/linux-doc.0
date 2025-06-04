Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9B08F6E
	for <linux-doc@vger.kernel.org>; Wed,  4 Jun 2025 20:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749068860; cv=none; b=Xt+/SWYyz+KOLbFoKMzQelOVwdzgJkbe73GKmnd1u5h0ngm7WOgf2BiMa+fLbW+pn2I08Kd8N/qyeQ2aJQfAYn92uBncwZ3iGKInOxOgNKqpObPVOfjQn0WwVLorjeS/YX5zZqLm84kHBLgNTjdoKWAH+nZG9H3nEgcIpdhaFl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749068860; c=relaxed/simple;
	bh=D5XAvNSElBpESK72/pR+Pvy4fxxNEjzoL7sxE1kkEzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EFk6FlyjjYQrNgv705yq7cX8W/oc3ZZmN4DzHbcJ35cNOoNBl20hBqMrdPQQ+7l5dWfqwM3pdC9bzvr1WLTyNcfTuJ0TcgoY12/NHWP35uiXDO+Vdm//hCBexUuHRDbo3KQn/gq000iIwLPQBVXmqKZvAbQt7PaSZhXvgy6Xx0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DGl4OW/D; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DGl4OW/D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=88YYN+sWuxWiLaVximl7nM/TOPRshJcJXwaLDANmr8Q=; b=DGl4OW/DjOj7V3VxRL8nwzuBNJ
	uSBcfYSm3rYAZAJ96JvRP8akGg4nCfNaYHjIIkH71yEEEPKUjNMHx2pubdqJDNLWDY8xrDZp09FTs
	fPgkirECJZzv7OkBq75v2AFVd3jIs2jFx1KEv8FmxgPhmCxH/jON+PpGkW+UVDnVUUEPAw8bN88ys
	yGOSI+IW7sS0emvvQMisYkkzN/uZa8peceo7yAD8M8nLgmbKVpkzyiWWTsgfcXxWdOstbLeh8p854
	Kh7vmjitB2SBdTpXJT9uebIiH8OFoFp2y7UxA2mYAXuVmYLZNwm8pi+R94Gw7VpFREQ/s+GHxE481
	TvqHSSIw==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuhy-0000000101p-3Nar;
	Wed, 04 Jun 2025 20:27:35 +0000
Message-ID: <98c88245-6368-4d67-b5a3-54a3d1e1a150@infradead.org>
Date: Wed, 4 Jun 2025 13:27:31 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: htm.rst not included in toctree
To: Matthew Wilcox <willy@infradead.org>,
 Athira Rajeev <atrajeev@linux.ibm.com>
Cc: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, linux-doc@vger.kernel.org
References: <aECkEJm6sl5cvcw6@casper.infradead.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <aECkEJm6sl5cvcw6@casper.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/4/25 12:52 PM, Matthew Wilcox wrote:
> commit ab1456c5aa7a introduced a new warning to the documentation build:
> 
> linux/Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree
> 
> You probably just want to include 'htm' on a line in arch/powerpc/index.rst
> but you'd know better than I would where to put it.
> 
> 

There is a fix posted for this:

https://lore.kernel.org/all/20250528054146.2658537-2-me@brighamcampbell.com/

Just a small matter of someone merging it...

-- 
~Randy

