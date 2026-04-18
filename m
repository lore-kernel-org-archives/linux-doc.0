Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5216628000F;
	Sat, 18 Apr 2026 16:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528917; cv=none; b=faihc4Hz+MTY2dz5YXvob47hhRzirXyWEQwE1xTba3P5ZfvUDMS/UdXEGjgp1YO/nBySjLQsADXwUgyVkR4btoLiZtuJlwlqxUs5vH80S0E3wEBw6+QNW+1XL+Lwq8NTA38P9VeV7gWOarMQcMtIFcggrE+1zYKz3RtFrn7U6Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528917; c=relaxed/simple;
	bh=QqDs7PYPRBWen9JP1EXubiW+KO5rKnPRH0+yrINyrFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWdKgQdlSUcWkgtfgKDReQhHY3e2wZ+WZoWbY1Hmc0YQzZFS01ra6V2hKn1tYgi53fIrduoBg0FenGqmnRYhLxvIiliZI1xg012h8KjPQRCthYkOz285X/F6WObv0oU6LePbBThyQRQcT3BLhefsrKgq4oNoLdhQG6l3lhEe6y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a9NCpFDe; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a9NCpFDe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WXjaVcU0HcKrPw7CYCyN4QEtiplgwntWJoRV59jKzzU=; b=a9NCpFDeaYKGkdhDEuc6SmCNna
	n2RKJBv1X1Fs9p8AeOFyWTDTNn3PQYo4qn9pkRbkMVIc5LhX8tVU9AHwRk24yxmqyKeGk8L0eE+a4
	Y1DIKjkV/DdmS/+czfftl3HP7MxscyVw2Dx7oQ66kRK0N6Sk3hyHsz4KueHKeqgTdcZuEWtjbf4y6
	KVh1SLthde9VNGjWN2kkAhrgDB4Zj60yJJhLPC+EOrAD4+ZFRzgvEum7a6IRVGnryQosi3ZrTvLRs
	cA4BqscZscQ9Ylkn5KZyLyBQbTEBzp5GFsgLDHPdTThQE15tV1Q8mRN/VzjIZRg46QA6zEQfyF7q/
	ir031dDw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wE8K0-00000005jk3-3mIU;
	Sat, 18 Apr 2026 16:15:04 +0000
Date: Sat, 18 Apr 2026 17:15:04 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Nick Huang <sef1548@gmail.com>, Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: Add overview and SLUB allocator sections to slab
 documentation
Message-ID: <aeOuCH8ydw_yzdXZ@casper.infradead.org>
References: <20260418000635.17499-1-sef1548@gmail.com>
 <aeNGbNyPxJssnkbO@lucifer>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeNGbNyPxJssnkbO@lucifer>

On Sat, Apr 18, 2026 at 10:07:22AM +0100, Lorenzo Stoakes wrote:
> On Sat, Apr 18, 2026 at 12:06:19AM +0000, Nick Huang wrote:
> > - Add "Overview" section explaining the slab allocator's role and purpose
> > - Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
> 
> The fact you're insanely wrong about the current state of slab only makes this
> worse.

This is actually a new low.  We've always had to contend with people
putting up outdated or just wrong information on web pages, and there's
little we can do about it.  Witness all the outdated information about
THP that's based on code that's been deleted for over a decade.

But now we've got AI trained on all this wrong/ out of date information,
and, er, "enthusiasts" who are trying to change the correct information
in the kernel to match what the deluded AI "thinks" should be true.

Let that sink in.

