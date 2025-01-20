Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAD71E8824;
	Mon, 20 Jan 2025 15:36:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737387394; cv=none; b=BczQuCachKiiz2penqobZYVpGnSoxhMlvB0mEWf2MehxwBnjTWKoKhGtGrD0r73+z1YkpKWgcJrhG+j+r9EyViq7EahSNx8BqWGWpWlSQLeybg1gJCEq7wILMBUP0LgLJlwI4B/LBQSmZNnhrZWBsOivxif6MHwIy8oMNhauGMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737387394; c=relaxed/simple;
	bh=F5GHTKd6SHjUjsMXKYNPkIR5zTWlS1V1HytM02CFY0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NvB03UuF5NNXKCd8lkopE7K4fW75rGsdEPUIjjOPjqBVt4SpqoiagULVmFoYwGJ7ncdECHsdLYIXunOTY6KO2kL2obwkEFiD/HdmyoTjbl42QVwTdypfpGqHvSbWXhSlvYwPcGzv4V62pygDpdBt1HCZfHPFuOTandi80CUVSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Q9mZvCE6; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Q9mZvCE6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=//go+pLaCR8IMBhqazIFlxoNFbU+MztBKStJ5RScj4U=; b=Q9mZvCE64gKpU3BjPLuegQ4Gdd
	a7aoxil88qj19bU32p9Se5y/HYtVcDbpZfz3/OLPySCcoGIFvWt/cO73iZFVbHkJnBW13DQlOao8B
	sZZZUf9Tka9eHvnnPGKp7U7GSRwZjuCUz01+9QsMfowcFfsgJAZkviaiTETR20uZljRHi6Wks9Jev
	qeOMB6no6jZNxFvpwCnd/1V49zZ460G8ih0sSZ98HiAGXxkk+gTqIO6OQ5rb8RJgDoxScZDtIpRuJ
	v2CVzWniU84NZzqBjCtID++0EDyT9Te+ekVjd8Fn9EhytyNa+n27QYebPjcK4jeOGS2FYvCU3DHQS
	sCaeU95Q==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tZtou-0000000Bhdd-3fGT;
	Mon, 20 Jan 2025 15:36:09 +0000
Date: Mon, 20 Jan 2025 15:36:08 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Christoph Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	David Rientjes <rientjes@google.com>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm: slub: Panic if the object corruption is checked.
Message-ID: <Z45taJAEqdcyIXX-@casper.infradead.org>
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>
 <20250120082908.4162780-1-hyesoo.yu@samsung.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120082908.4162780-1-hyesoo.yu@samsung.com>

On Mon, Jan 20, 2025 at 05:28:21PM +0900, Hyesoo Yu wrote:
> If a slab object is corrupted or an error occurs in its internal
> value, continuing after restoration may cause other side effects.
> At this point, it is difficult to debug because the problem occurred
> in the past. A flag has been added that can cause a panic when there
> is a problem with the object.
> 
> Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
> Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493

Linux does not use Change IDs.  Please omit these from future patches.

Panicing is a very unfriendly approach.  I think a better approach would
be to freeze the slab where corruption is detected.  That is, no future
objects are allocated from that slab, and attempts to free objects from
that slab become no-ops.  I don't think that should be hard to implement.
