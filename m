Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4853DFC86
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961100; cv=none; b=oMhX7la+GS6nUY9zLbzAS/8aLEaI744pt3eQWyNsnY3A/k+7p1GysA86Qf2SGHkV5VRXCtQuTF+EzyJm9CIN2wAjFHy6LIUA/2QkaKEq/7xRPQxWYTr6p1CaFKnhi4jQKMQB+UOwQBRGlarZh7j+2ln3dXvHxLZPex24m3lc1lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961100; c=relaxed/simple;
	bh=Pa9p0AOtc4bgbwY1yolIgiVFzciMbdEAo29iWopVcH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Da/PBLEA7bGTrdXaDi96cBKz+F1fuPUkbMrDmWv8Aii7Scc8+z76yp4JouAI3wFNVs3bT3JclfnnlMuz6DflyXPYaeayUGRcMKMaUbMXC3nTPtAKHuh9W1wJ7PM6ypVkjLcOK0DaTyA8SXbZZbTZOuonxfS2WR+eTpPlXCDynDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ATj1+iSl; arc=none smtp.client-ip=95.215.58.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ATj1+iSl"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Pa9p0AOtc4bgbwY1yolIgiVFzciMbdEAo29iWopVcH0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786961088; v=1; x=1787565888;
 b=ATj1+iSlQNNovxT8O3CbPotMwBuYAI4L8jTpfQLObFV4lxDuzdHm9/Z1RUdr1cxHmKUF83Xc
 vHX7FGdrzAVcE1zlU7D35mT4D4HXvbox20T2rQpr57HDWYPjeHIH53iCaKlG8Cnav41KSU17/jI
 B6Jk70gJ85n50hTq1cMoc804=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from fedora (117.129.78.49)
	by smtp.migadu.com with ESMTPS id 35ac66a1649c20c9;
	Mon, 17 Aug 2026 10:04:47 +0000
X-Migadu-Flow: FLOW_OUT
Date: Mon, 17 Aug 2026 18:04:40 +0800
From: Hao Li <hao.li@linux.dev>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Vlastimil Babka <vbabka@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] mm/slub: use a track count for user metadata
 sizing
Message-ID: <aoLci4aJGKDNaNWd@fedora>
References: <20260813160825.73031-1-pengpeng@iscas.ac.cn>
 <20260813161059.73855-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813161059.73855-1-pengpeng@iscas.ac.cn>

On Fri, Aug 14, 2026 at 12:10:59AM +0800, Pengpeng Hou wrote:
> SLAB_STORE_USER metadata consists of allocation and free tracks, but the
> object-layout calculations repeat the literal count at each offset site.
> 
> Add TRACK_NR to the existing track-item enum and use it for metadata
> initialization, original-size placement, object-extension offsets, padding
> checks and cache sizing.  This is a behavior-preserving preparation for
> extending the tracked history.
> 
> Assisted-by: Codex:gpt-5
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---
>  mm/slub.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)

LGTM.
Reviewed-by: Hao Li <hao.li@linux.dev>

-- 
Thanks,
Hao
