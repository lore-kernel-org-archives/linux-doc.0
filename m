Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08B93C108A;
	Tue, 30 Jun 2026 19:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848176; cv=none; b=N8IJuZ+kTNJzU706O7SBcmRPlBQ9MJewkMXqdPToHQJ0Nh2yBU4p7KifKbJBqgyl7K4Tar03Y7jyaVQlQ0jHfDU5gkRqTTCPTgNbdjQ4C9lHB6PeZAQvRnlpGVqhfvWGbrPLweYJeytsIsAD5/EjffuYPNdGNv4kfgOhIT5i9X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848176; c=relaxed/simple;
	bh=5R2RGib/uuILNfkydMC7Yf3FacAn8rGaRyLB/W/BZsI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QMmzN1kc1ftQ3jRtlwt1RFYSclxT134CrXr2W+lAcwBywEyNODVOkp/iqWtGaSHZafx9Rdy5P23PCPUtVj5KOPoHlWC3CjMBVs4q79315+VD4fTQADwNflHpVE7+j5Oxbk33CHVXG9XjyF/o+P2Hw38YfWnAk92o+3BmG1GW8xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=cDIB8Hdr; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="cDIB8Hdr"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net ED75041596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1782848175; bh=yPCrY1FcI3FpRnGc5ZKuI5vFumDsIEQAM9UCUyL0JHM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=cDIB8HdrQQO0PnAQrr/CcS5aY1q1hcRwSwGYArUPiB8hYF71oZUORebnSB8sa49hW
	 u2ePanYOpizDPfSjM0ogctLfxGGRJKlqGrrCosXoq4T4k/dA9BAfwZZFEYYY8LGjmQ
	 n84eVkBksILKrf2NAwrB3adKDEXXI1KsI1BWCs/fcxBe7nJZExha/ZPMmrHee2knwP
	 EqRq+U/5l+s764TFix2MY88hcoMXFx+pGYEzr6eptSn9fIVjziNReylaS33tGkIy3R
	 RIK4EcEIeRNmI80bjL58BsMHZAdLCUml3gWIbJfV88Trh2GFt0DPhpaOcanlpnuUJ7
	 ebG660lInR1SQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id ED75041596;
	Tue, 30 Jun 2026 19:36:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Zenghui Yu <zenghui.yu@linux.dev>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, skhan@linuxfoundation.org, sj@kernel.org, Zenghui Yu
 <zenghui.yu@linux.dev>
Subject: Re: [PATCH v2] docs: pagemap: fix flags location, member name and
 sample code
In-Reply-To: <20260626162710.25844-1-zenghui.yu@linux.dev>
References: <20260626162710.25844-1-zenghui.yu@linux.dev>
Date: Tue, 30 Jun 2026 13:36:14 -0600
Message-ID: <871pdnstw1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Zenghui Yu <zenghui.yu@linux.dev> writes:

> The userland visible page flags (KPF_*) were initially moved to
> include/linux/kernel-page-flags.h in commit 1a9b5b7fe0c5 ("mm: export
> stable page flags"), and later moved to
> include/uapi/linux/kernel-page-flags.h in commit 607ca46e97a1 ("UAPI:
> (Scripted) Disintegrate include/linux").  Update the doc to reflect the
> current location of these flags.
>
> The member @walk_end of struct pm_scan_arg {} was wrongly written as
> "end_walk".
>
> The first sample code of the PAGEMAP_SCAN ioctl wrongly used the
> PM_SCAN_CHECK_WPASYNC flag twice, instead of the PM_SCAN_WP_MATCHING flag.
> The second one included the wrong category in the required mask -
> PAGE_IS_FILE should be used instead of PAGE_IS_SWAPPED as per the
> intention.
>
> Fix them all together.
>
> Signed-off-by: Zenghui Yu <zenghui.yu@linux.dev>
> ---
>
> * From v1 [1]:
>   - drop PAGE_IS_SWAPPED in .category_mask (David)
>   - fix typo in commit message (David)
>   - didn't collect SeongJae's R-b (as the content has changed anyway) but
>     thank you for that!
>
> [1] https://lore.kernel.org/20260625174447.24292-1-zenghui.yu@linux.dev
>
>  Documentation/admin-guide/mm/pagemap.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Applied, thanks.

jon
