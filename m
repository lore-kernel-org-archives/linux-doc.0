Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C67A29A2;
	Sat, 11 Jan 2025 04:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736571179; cv=none; b=cdNYoa+dgOCfviVZ+oaq5pXl0HQo7fqapnoKeg/bqkio1LIemMUUYkMILEYPxmZuIBIzmVWVwveKL3J07iWfp1QM3UtRWBCuSbkigvR2WgRnwYu9Vl4VvLi2XbWKrs0qNZodXvgJUy6aOC+hdtZSm6nqYZ8V3akMlROUDRMki6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736571179; c=relaxed/simple;
	bh=2jgQs6OE/Z0uI8pOiG+1QeLMwQkmWHkyNd+ehkp8a5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RhKUYQJZRUyvNkdp9I7qJWiYx2N6pOW4DYfyMyG1/ng1IEWFY1LM2jsiqv0MEXgCmhR9GHh4+PKS859tvwHOOumkgcJPDKBfM8hvg3dJD16Def4iyB9M8irVii/9qcDaZWdYsg8MBBGxdXFaWN+DS/09VEpOvnIBUvEgVo2sOoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=wPWMzSH7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="wPWMzSH7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2jgQs6OE/Z0uI8pOiG+1QeLMwQkmWHkyNd+ehkp8a5I=; b=wPWMzSH7DtdpbK74pje1xIRTrA
	M2hOJIh9Oa53DqR0QbYuH3tOdCvARjCrgC/lwvL7/H0i7z/RNR3RX0LnDjkt36yRMhcxVRYxHP/lO
	RhfieJilwv8WA9k04IMkAte0i3bVAbDzvwX5qL91aopjhdnC7F451B4CrvrfRAE1eG/vjJybTBm2j
	O+MqazBzfXx/E4rgOeDnOtCOZY76RPzmUfzRQx+cSke09n7z6XPz5U36x6zNPylf2oT9zDmDPXE2T
	lBplyVVNWvaZPkw74s3wJzoEfhkgjFkk9AYta65GluxyTeYpQI+QyVUeyjByoftezf4wggAf3smmE
	xdd0Bwkg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1tWTUA-0000000EthP-25UU;
	Sat, 11 Jan 2025 04:52:34 +0000
Date: Sat, 11 Jan 2025 04:52:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, peterz@infradead.org,
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com,
	david.laight.linux@gmail.com, mhocko@suse.com, vbabka@suse.cz,
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
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
Message-ID: <Z4H5Et1Hd-JxOJKM@casper.infradead.org>
References: <20250111042604.3230628-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>

On Fri, Jan 10, 2025 at 08:25:47PM -0800, Suren Baghdasaryan wrote:
> - Added static check for no-limit case in __refcount_add_not_zero_limited,
> per David Laight

Ugh, no, don't listen to David.
