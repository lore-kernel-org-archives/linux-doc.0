Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795698882;
	b=AYbAJLzlzKd3MXEu8Q+ZZN7KxtfFY6Xks1RXCM8SsfENSERiidhYaWDv+63jbSqHvvtm
	 1W0kXEnOhik0Wp2PUcGVRtU2KHQMJJr3yKQ503VhyLBMwCayFzC2ypLgycteibf3g7j4F
	 43JjyjHXc0bUMCP0LrzlrTyNu7ajyyt1UgPFjatNv7ju5OXCYr9ZvKYI8+2TFMGn/yoVW
	 Tuh2Luo1xbHdkNZSWvGhLfd1HITn/OJiOeye13/apBP6n/61hQ0mBt4PBgL6eCenRdz2j
	 rbgDgUO9Gr89O80yn4YK2Fbl7e1cEXHOmo6NS54tTfXPNPqPynS3NBV3d/dqkQzgdYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795698882;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=LzrFaLrOdtynZ+YqTrHBgX0gJsOg0q5WJ1+yf3sSxY8=;
	b=HGm0yK+SnvKyPA/hygSSQbQDY1mlnpUQ1X8TF2W6JyrNm1wWhGlc9vscmUi89KVDX6Bv
	 kRdMSOgGaE3imlXbaNMfJlxUfggLxgSEcTMciCEXvMCumlXiT/wBqFI+qXIcu/QI+fKvR
	 EV+RKU4CMlAMTjSm43/VsM1UOxyMtbiRp8CflGx6HHrDQTxNSZtDjqNMQnOZDACTFLlgP
	 IEQHHFbYEfL5f+n8AC7VOQbU7sw81OtPuidSNa8m70cmxHAKv8zeT+4bzMSWNI8WhBmLR
	 pZFji/fspi4JlJo4fGsqmHXY9bJH44qFX2G84P2h6lpVOpSHn6QZZnKgtPProk8EhWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Trrmgr1B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8B9606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Trrmgr1B
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74C6E1F000C0;
	Thu, 26 Nov 2026 13:14:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698881;
	bh=LzrFaLrOdtynZ+YqTrHBgX0gJsOg0q5WJ1+yf3sSxY8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Trrmgr1BPEBD9qbna5U/e+HQli0WAAkfjJQlX+f2zwRKDn03tMFWTGigBk0QHEjuA
	 lY2gf84DYquCkVAod+yg2DyeQZhKmfSMqfravwMV1Qze5Kcx4HEi6bczuJt1GkAoJr
	 TvXbOqrghBtkKSgP3fLzN7xXWtcRFW6gEJdXhtwp/BHEgCrpK/xZiPrlqZDJqIKNuH
	 5AMWWCllTODXNr7+DP376agowqlSXVp+ycMgapV64BCHcHZAOS/FemIDCNdELAo4tt
	 rhmQy5QLzZml2MX55ofVcbi9UtxVnavgoZuOCvd0YunXyYd/xlbJ53BxKFVBg34Nuh
	 W8LHmKCPJdA+g==
From: David Hildenbrand <david@kernel.org>
To: David Hildenbrand <david@kernel.org>, Rik van Riel <riel@surriel.com>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Harry Yoo <harry@kernel.org>, Jann Horn <jannh@google.com>, 
 Lance Yang <lance.yang@linux.dev>, Suren Baghdasaryan <surenb@google.com>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Pedro Falcato <pfalcato@suse.de>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org
In-Reply-To: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
References: <20261123-fix-rmap-lock-ordering-vma-locks-v2-1-11b04646abe4@kernel.org>
Subject: Re: [PATCH v2] mm/rmap: correct VMA write lock position in lock
 ordering
Message-Id: <179569887717.7709.10576258083946748966.b4-ty@b4>
Date: Thu, 26 Nov 2026 14:14:37 +0100
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0

On Mon, 23 Nov 2026 16:10:15 +0000, Lorenzo Stoakes (ARM) wrote:
> The list at the top of mm/rmap.c is taken to be the canonical order in
> which locks must be taken in mm to avoid lock inversion.
> 
> However, VMA write locks appear to be misplaced. These were added there by
> commit 55fd6fccad31 ("mm/khugepaged: write-lock VMA while collapsing a huge
> page"), which was focused on expressing the dependency of locks after VMA
> locks in the ordering on them, disregarding those prior to it.
> 
> [...]

Applied, thanks!

tree: mm/core.git
branch: rmap-7.5.misc

Applied patches will appear soon in mm-next, followed by linux-next.

Please report any outstanding bugs that were missed during review, so we
can either drop the patch series or decide how to fix it up.

It is encouraged to provide Acked-bys, Reviewed-bys, and Tested-bys even
though the patches have already been applied. If possible, patch trailers
will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. Further, this is not a guarantee that the
patches will go upstream. If in doubt, please check the listed branch.

[1/1] mm/rmap: correct VMA write lock position in lock ordering
      https://git.kernel.org/mm/core/c/ddd689d1

-- 
Cheers,

David

