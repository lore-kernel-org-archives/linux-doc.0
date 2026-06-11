Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E94BD2DCF55;
	Thu, 11 Jun 2026 19:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781205375; cv=none; b=BcLt/J8hEM89ZyBl5js/LQew3iqQzALrpPlEkINpEdt7cYxARQxb03GG7JkClQSmrMf7Js8ToXDQyjy/L2v41cwfpl2rI7px2b0JOmvI8hJaLqbLsVN1bA71rko4dYMR+0VTjd6A8lQwFzO76hdHO3wUD2ZTjafWZcFfzh+R5Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781205375; c=relaxed/simple;
	bh=6ExX3LobtHFEu3Vm8rooNNo5Kn+8vTXzVf9LIEUwGaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nlC6WYhHzy96sqeLjVdV/hgDB1jqenLANYcfdd0TTR7FzQJC0dN4I725EBR53flJ72bsmPXHOy1EJlYFsdIFOaCw0Gyq9/mGFjNMmTHd6zn3W3WYaTMQEbCK8++B7M1YxzYcf61Nz5M4VdqTvFJWxhzVXvUUteYjEiKi9PMRd94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DjhVC2O3; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DjhVC2O3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rZd4WLjqq4XvQwHB47ThdrCyV6Re/i6LgV+u2yu9EGA=; b=DjhVC2O3x2oTgn/xwo1dHD8O76
	yREnZrPW3PKdThR4vYr/3TZle42hkbSQDwk507HmsgtNWQbHG+SmAMQogfrUq6FQK6NPe3Bg28K/k
	5nfCDnlYa8uHKllJ7gswJjxhDCyy8avOiX83lqv2wbvaZZaTlWFyN0fd6QhRMmMjSwYAO4notbPs9
	L1tr9+hkWAeGKwJc8EPFH5IhO40P3igMiFM/FqFfsZG4460RJwLFjRqZ8qpCjmT3pgMe0jd6fD9+Q
	lhO6cvnWgF0E5PXRr+0w4C4jxu72ApfALVtT/+ldjp0n/H1XtVw93sD/VwRFZAgonMnjMvYDaGa4v
	80OhGT7w==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXksf-00000002S6h-3zk7;
	Thu, 11 Jun 2026 19:15:57 +0000
Date: Thu, 11 Jun 2026 20:15:57 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-mm@kvack.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [RFC V2 0/3] lib/vsprintf: Add support for pgtable entries
Message-ID: <aisJbeVVxxNuYxQ6@casper.infradead.org>
References: <20260610043545.3725735-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260610043545.3725735-1-anshuman.khandual@arm.com>

On Wed, Jun 10, 2026 at 05:35:42AM +0100, Anshuman Khandual wrote:
> Printing page table entries has been a common requirement both in generic
> and platform memory management for various purposes. Hence let's create a
> dedicated printk format for such entries which will also help standardize
> pgtable printing across different platforms.

You didn't address my objection here:

https://lore.kernel.org/linux-mm/aFQP8LzVMctf6XH5@casper.infradead.org/

ie there is now no typechecking possible.  So you've made it more
dangerous.  I reiterate my NACK to the concept, not to the implementation.
