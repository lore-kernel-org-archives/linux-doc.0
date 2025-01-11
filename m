Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858A6155A52;
	Sat, 11 Jan 2025 17:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736615310; cv=none; b=s4OBhnnEZmnxliUpEZGJRODppZzzBQWus2XlJE15Nyfoma8L1l50mxSgtacsCLE9Jhxi9x8cyxLgAhFbAAbaa70wb4ifxUMYQrMTmwMFAeYwV2fGBfXpAXgvpGdg7dumDuOewghFoRXp+ZLzZGe34gP/gSObjrfGWAszJRzFoQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736615310; c=relaxed/simple;
	bh=U82e5TyeCalBxBgMVYZ/hV58MDwGygQUQSCUHU7CoEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P4cBssX7TzB9frg9+PPIXBjZ9yxnMwO8ITYu3LoVUbI62zZpPlYiFhHIBb2mfgRi8Rej8LpxyQToNsKQjFEh9hsODyLwACFk8LZW8w9Q5t7KnL45QzcijWchuF/5+Vga29rY6N3i/wbV+8FIeca6OsdJvigXth6fSZCzEJm29WY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Hv4+ITLO; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Hv4+ITLO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=U82e5TyeCalBxBgMVYZ/hV58MDwGygQUQSCUHU7CoEc=; b=Hv4+ITLO26gTJvd8n7gUOZE34I
	xpGWc2fDGcd+/bF1xKeQdCBnRzaPP99qUApzOzWELQbGuVCGmi+529/mKU/oEQHdRsTM2rPO4leef
	pLUwYpb5Cdtf6dqpukwJxyLZz0h9hakNAStAy+afTkTjLvke7oEi/W2ZfYJkMHHAN0Uwp+CfgMW+C
	JKATnonMtEZ9UYcKqHA4H8YvE8e4xkBCA3Rt8iYJ/pbb1rAiRU9OVimWcm+yTCYwVTBYeiB+aamj/
	+9vOkRSmMi+i9914NuYbG2eJDNBczLIoIHoe2uTeQPFgbehMCJSUVGBOBFyZy7/tMROcx5xf9ImSG
	o9Ku0VWw==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tWexo-0000000FYR0-0Dm2;
	Sat, 11 Jan 2025 17:07:56 +0000
Date: Sat, 11 Jan 2025 17:07:55 +0000
From: Matthew Wilcox <willy@infradead.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	peterz@infradead.org, liam.howlett@oracle.com,
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com,
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com,
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
	brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com,
	hughd@google.com, lokeshgidra@google.com, minchan@google.com,
	jannh@google.com, shakeel.butt@linux.dev, souravpanda@google.com,
	pasha.tatashin@soleen.com, klarasmodin@gmail.com,
	richard.weiyang@gmail.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: Re: [PATCH v9 10/17] refcount: introduce
 __refcount_{add|inc}_not_zero_limited
Message-ID: <Z4Kla2HSvJ8mI0Dz@casper.infradead.org>
References: <20250111042604.3230628-1-surenb@google.com>
 <20250111042604.3230628-11-surenb@google.com>
 <20250111123900.643e4b49@pumpkin>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111123900.643e4b49@pumpkin>

On Sat, Jan 11, 2025 at 12:39:00PM +0000, David Laight wrote:
> I don't think the kernel compiles disable this optimisation.

You're wrong.
