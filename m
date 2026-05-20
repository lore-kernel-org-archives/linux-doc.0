Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5C033DED9;
	Wed, 20 May 2026 05:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779254464; cv=none; b=ZJCyfQ8dR7P/7KRglS4+RTHe47EAiSICowDYcoy9tcPxKkPZg+awPxn65vbVbrKgktipYZtOaCyyUnshbL+bch5lacmm17N3JUPHmKn31t9RATQqCVQMnhE/0JVnpb9KAXTq1VqSPA2J2G2aDrldnQ2TtXIgwX0UeQYtiVNyRpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779254464; c=relaxed/simple;
	bh=Hs3Y3d8s9CyUiPAu7BFaDDPnSbwBO4g1xfjQhZOhTkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idjtoydndzcWAKsfPo6u5g5fQbMsRgZUpHN8a6Of7kXZVR3Wv76m5L0E8DhFyO0IpWv2AoFHmP6YLLmv4fqCMecQSzhitOEAsVFeh1aL/cYuZYX5+A9iO1P5eKWfiPx29noi1VinDfQP7K00CeaAllisAH1GO6rR2Cf8veKRkac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JUJ4xWWD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JUJ4xWWD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965601F000E9;
	Wed, 20 May 2026 05:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779254462;
	bh=0ClVNQ/qL0BwmVZSTaZ5agutkbazJYSG1buLiSM5poM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JUJ4xWWDZC7ayjgLnNw3Zv1yTxlCTSdlCac/utWchwC+t8s2xegSJt2/2HSa91wKW
	 sOPxrrF+gZ2MjJpayu8Ois3BEWsu20rgV8zlw21fI2hh435yP6R028TsFTBsQUbdYh
	 X27wLIOCZe+h8GXzVyTI6k7eJoJwr6Tmd+tKUoZ/XP5I85HAcHLGDapdmNqhO3M/8v
	 0W1oJ38uMIBR/gNS3k+9/Mr5HeYJSHmoxwwuf3zD0aeQKkHSudhDmWbX60zIDrOFs8
	 eUo7UuZXg7WnsBVBv5ahAgIn6KcCBa9aFfcXSu+0n6woCVpfudv41xLOIC2qOMylSU
	 o3JaL2zIkNw1g==
Date: Wed, 20 May 2026 08:20:53 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Leon Hwang <leon.hwang@linux.dev>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH mm-new] Documentation/admin-guide/mm: Fix typos in
 transhuge.rst
Message-ID: <ag1EtRBvuT9NUTOm@kernel.org>
References: <20260520051751.74396-1-leon.hwang@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520051751.74396-1-leon.hwang@linux.dev>

On Wed, May 20, 2026 at 01:17:51PM +0800, Leon Hwang wrote:
> Fix these two typos:
> 
> 1. approporiately -> appropriately
> 2. presure -> pressure
> 
> Signed-off-by: Leon Hwang <leon.hwang@linux.dev>
> ---

Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

>  Documentation/admin-guide/mm/transhuge.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
Sincerely yours,
Mike.
