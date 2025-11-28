Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5400B79CD;
	Fri, 28 Nov 2025 15:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343017; cv=none; b=opQXmma79V30xT7Aupd9WLw7meWYwsj1suDTHG1atQaJOYuaINBWTkhn1AP2q2R0/afzD+Rrv6yYGJi6bVQgpCNFAYmwBpovqd4LdqCXwCIh9cTb9Erx8CcI5fFU33yrdafXyMFhFDfpYxHnNnFgirOTCOw53443GbaSPPrXCNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343017; c=relaxed/simple;
	bh=C2i9DHlVy9Af3Hnd6WgShSfkfF+fANKoO9DXERIt06Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LKSpfxfDs/SMfcuSoTUqG5Wy/XuWU+VFedh+euF2pSccyM9Ijq8Jp8yqwM4YV7rJGd+1CxtKWQI7km3Ly3k6q7yjJ1j+7SlWgsbsPUvcdH77z2yLnztRkZtEWuu5k6Jby291aHyOm5RIZJvqousHOatdnmFp8vmRs33qc16tUkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=YjG4Ithc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="YjG4Ithc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LaW/YoAvMSDe/moOCsqb0QJzpCY35I32KENZPoTiBUg=; b=YjG4Ithc1T0Ik2lhrG8fr4ojOv
	6YleouwfbfVKgMURgM8ubUHPfioizu72Z47W/+Gi6CQJIRfQWAqBsHYZNEkvxiCJ6paUudNWZMz+A
	rddV7+LQrb9ufPNv9f1f5keIPkSyn2L9OSQKpyCjXx1lswiX/TnrTkZLTsH8YWKh34MzsqCFzmQOf
	HRlKO+Un+he2XICk6+wGwfEQtLjpYkwOm12E+4tQW+zBRGdVviqU43TGabpdTg3fpuda5wS2/DE7v
	vZMWDZA02j87K/7rjEV1dNApUGSUFbaaFyg+Js7Wq9nTnhB7Yt6urQTnCWnlRncMXygodjVm2FnrK
	gylzBf2g==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0D6-0000000DMbQ-0utI;
	Fri, 28 Nov 2025 15:16:36 +0000
Date: Fri, 28 Nov 2025 15:16:35 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Zicheng Wang <wangzicheng@honor.com>
Cc: akpm@linux-foundation.org, hannes@cmpxchg.org, david@redhat.com,
	axelrasmussen@google.com, yuanchu@google.com, mhocko@kernel.org,
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev,
	lorenzo.stoakes@oracle.com, weixugc@google.com,
	Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] mm/lru_gen: move lru_gen control interface from
 debugfs to procfs
Message-ID: <aSm800KsCAptVZKu@casper.infradead.org>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128025315.3520689-1-wangzicheng@honor.com>

On Fri, Nov 28, 2025 at 10:53:12AM +0800, Zicheng Wang wrote:
> Case study:
> A widely observed issue on Android is that after application launch,
> the oldest anon generation often becomes empty, and file pages
> are over-reclaimed.

You should fix the bug, not move the debug interface to procfs.  NACK.
