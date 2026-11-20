Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190722;
	b=X4TP/2brDRIpom5XsAWZ7awerqQOWgBFSiWMEzqXanx2FfBQzeQXDu4Lb5Vt7xo0ERJF
	 DJNf0hlxR7gRj27qSdTdk7oO+n1QvCWqcvbNExitrHdcAReKk4Fwl2pfAGq+iUzhgj9wG
	 Jz7I9WDLFXT9BkQMy4fvAk83Adj0jLnvD3O92+qtZtWQ2M6e2gIbDFRz/ph3YE+/w7qyB
	 fJv0gos/EV7aFIaLseQhd51gQumN7Z8wJ8/dicBTHSz9QSTSHsGZRmosKxICO4b02pM3q
	 Ghhp+bNAanFDmaLIb/7/VpQdtM71jBxqIX66nlYIIZJ28bwOxogkziPa2wk1TB20ZNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190722;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SRS-Rewrite;
	bh=/TFgzTg/dC0Sjo/mXTkd1zZJCJ/1fZS9jCHsItAXW3E=;
	b=wiEMTO0cFr3sJ2dQl8iaesZJ255cyaGSQHp5HqEZN+C16IQSJmaJL9paFn3pIn9PU8OV
	 9paSiBwS1eIcT80FcHouKQeBcFz65jAPYsxctgttWz3avBf8rwienaWwnWmFS1qpTL5BL
	 7cS5YT6bJG+ZHt+2017qEqV+baaNhwvwbGAvUZE0OBqHaUGY+oByXbvlTfLTwSTIyHWGB
	 Bw3zjdCW4yQW9pe0r0xaG2GYQmbuoLVOcHUDT1NwIZ3E7gRx5I4Qsqq9nAGCAniRI72MW
	 Y7acwr3mFKAw7FGsG+d30xX4S7FPy9E4mlP5vJKSyQrqI+Byof1P+Vkrb+3hjjdHyxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=none smtp.mailfrom=bombadil.srs.infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YyZaO7or;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB93606A320;
	Fri, 20 Nov 2026 16:05:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB93606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YyZaO7or
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=/TFgzTg/dC0Sjo/mXTkd1zZJCJ/1fZS9jCHsItAXW3E=; b=YyZaO7orwJVlXFbUn1UhzQCiDC
	zqlCfyGnoGL3l68kJKpMIVDrCevZQNeAMY8DMzJyVXMgH8QDWYHUiXnoqgjKx6t6AvDAuFr3X6KPm
	YrcSyrIrU+riLJpQPUXvO8uv0aJn6Rzk1eg3gIL34ZIQN6pI5whNbx5fqKcXGie0JeO5LrwPE51V0
	6/nmB8RD1wgaYc5wl75u588wFW+aegVOP1iRcoIaLZ7Ir7+N4aIGlK9cTD+ieFD5BbomR6YczKDrA
	BvqNxmwzljInKFSs+kOGgy0uv/G0TlxMpLz3UM0mPkb4WsXIclmlL3nWjdl57S/151kmS5lDRGh5R
	M5nb5G0g==;
Received: from hch by bombadil.infradead.org with local (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUR71-0000000FVmp-11zC;
	Fri, 20 Nov 2026 16:05:20 +0000
Date: Fri, 20 Nov 2026 08:05:19 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>, NeilBrown <neil@brown.name>,
	Eric Sandeen <sandeen@redhat.com>
Subject: Re: [PATCH] fs: porting: Retitle
Message-ID: <awBvvy0rAMx5-dnv@infradead.org>
References: <20261117035004.12262-1-bagasdotme@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117035004.12262-1-bagasdotme@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html

Let's just drop the document.  There's really no point in these
kinds of instructions.  If you don't follow kernel API changes,
documentation for a few select (and usually outdated) VFS bits isn't
going to cover you ass.

