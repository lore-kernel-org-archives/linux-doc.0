Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E43EC5
	for <linux-doc@vger.kernel.org>; Sun, 10 Mar 2024 02:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710036085; cv=none; b=AWCn1NVYH3AiyIjoZTdT1/bl23sHrUThdIfccHxjzXK8zOUYJMZsvyrOAbLoBlHTshHWkiuf5xUMCnZaGvzUvRgS22XOzSIP6P32+4owJHNLQvFppEd6bIvggyN051fAQoUzhHEDlefFR1r47KGLgdbdmnCbW4p6YxHVtw1uwAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710036085; c=relaxed/simple;
	bh=ssJchHlnGMDqlurjyy+LWluozNYp3GBtrSNRGHBk15o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+kVvlMibPE2tkbDM+RKA20hgICKQ/yQW1siLc3ssQdK55PewTAuYXmefK/t3E3zejdOsAlSCjUUnMHeOZlrrZu2Y/AH1E9ViVCgoEaZ4k/uHJak4OCU9n71SDwJ3thRUJZbvUkL8Oa/7x6K8DBa2fnuRvPzgq86WI5prpPHvrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=q9zWp2Hq; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="q9zWp2Hq"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=TBTK0/243VSlW+aXQ//YUwzYpvuWv/g62NI4uT41YLk=; b=q9zWp2Hq/SzxWiPPrjRnRNicWs
	YVvH2DCkpaU6i8dE7fhwbr5YbbBRAXqhWR2muzJgEulHxq14jVMI4Gh4pvJ2Y0A5C+4NcYb+IFedA
	yzSUDUDBPeghS6RIJkqQkJ2v5Y/FFIrosE60OeQ6ePc84t/p5t283aWxwvvOEbHGC/xR2Jd+JwLVQ
	fU9CORnXEV5bDO2+UMudBJiFyb7c1ZEbAO0FEEBmlrzhE3oJqBJbuHjPYDurQ6kdDV3bVfT8cW3a0
	gDavth8XYlmEQ2YcVo8A+I/4I+D7rZ5CwQnI1ZathQzg42jGYiB2MIgjjpquxI3P1Wl3PKGZaNTNB
	0w/LDYMw==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rj8V0-0000000EwvS-05Hq;
	Sun, 10 Mar 2024 02:01:14 +0000
Date: Sun, 10 Mar 2024 02:01:13 +0000
From: Matthew Wilcox <willy@infradead.org>
To: jinyilong <longjinyii@outlook.com>
Cc: alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH -next] Signed-off-by: jinyilong <longjinyii@outlook.com>
Message-ID: <Ze0UaTVmhqw8AbQf@casper.infradead.org>
References: <OSZP286MB23305246FD79A66606B3B35AC2252@OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSZP286MB23305246FD79A66606B3B35AC2252@OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM>

On Sun, Mar 10, 2024 at 08:47:58AM +0800, jinyilong wrote:
> docs/zh_CN: Added ioctl Chinese translation documentation

^^^ this line should have been in the Subject: line.
The Signed-off-by line should not have been.  Please fix your script
(this is the second malformed patch from you like this)

> The content submitted this time:
> Added ioctl to the translation/zh_CN/driver-api directory,
> and modified the build and TODOLIST in index.rst
> 
> Signed-off-by: jinyilong <longjinyii@outlook.com>
