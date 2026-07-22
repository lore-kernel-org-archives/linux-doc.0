Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C73AB480;
	Wed, 22 Jul 2026 16:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736933; cv=none; b=FwbpLVFFl94V4LxE99F1XUcmX6bgF92pkALrHZnqIpcwAR3ouExtkNjxRtLmYkng6X8rXq5royuhYht8qLrPbtFlEaIwdW1zHn9hivoPdKn8QXUkU1aNqB2rG2gTibjGdfuYtwXFR5//furE1hQgXdZSAoLq5vw7gOsWmJL0ER8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736933; c=relaxed/simple;
	bh=xQCj34XAHN19DM7GQaS66eid/ow3k7gWEARp3L3+cGc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g5XSJ0jt5LI6N7VyajwyI/GobzR3XltXPlg9KyOoE08BKI47pd4kT6zNeTJtwhKEEXKtfAS1xZSn6lEkIP8ibe1RSO8KEREGPETSntuFkFRF90eBxEsCZXFnpzS54ay8PCHmmSU2XJLfbIOcaOBq2zdcX/tNYFAmVBJsvZC/Up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VWiQHXJG; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VWiQHXJG"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 888B2408B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784736931; bh=ZLpvDn4QgPBvfntCUNJBmz0mWDjXAd4XvY3JSqNSHzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VWiQHXJGEPl2ql6kn8ILZaIqpPT9VNVmjPKOgN2LwQFKcsfDHiwECrzh2QwgNZ1Mj
	 7hEvWtSJfveHaF1HSq6BH+RKF6PlYHwLbj0KcgE+a37n03+iSB6jZrUkBQG10VrAFv
	 th73MHwi8MjEoB6ksQi0hdEyfQOGSmNoPzgATXyBLnBLpZ4cnZl7o6aPwCrw8tQC+A
	 Xi1r+87bn352mTe2pTZyQqAQlN/v0V3ekZOKSP+OmpzLxQs1YsiSvP9Ii0pw4IVLhA
	 bMdFbk1PS/HEt1r5rTBScJjAXU/2WdqcCy0tLVLzF172cV9ij7Ua2xDj/B43jxc/o8
	 M7jpwcZ9JScpA==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 888B2408B4;
	Wed, 22 Jul 2026 16:15:31 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Jani Nikula
 <jani.nikula@linux.intel.com>, linux-kernel@vger.kernel.org,
 intel-xe@lists.freedesktop.org
Subject: Re: [PATCH v3] scripts/kernel-doc: Suggest possible names for
 excess descriptions
In-Reply-To: <20260717125753.634550-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
 <20260717125753.634550-1-ryszard.knop@intel.com>
Date: Wed, 22 Jul 2026 10:15:30 -0600
Message-ID: <87jyqnc865.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryszard Knop <ryszard.knop@intel.com> writes:

> Recent check_sections() change added a warning if a documentation tag
> member name does not match the detected struct/union member names. Since
> the checker knows all possible names, we can suggest known names, so
> that it's more obvious how to deal with the warning.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
> Changes in v1:
> - Added the suggestion hint in the warning, with basic name substring checks
> - Link: https://lore.kernel.org/linux-doc/20260714111208.323108-1-ryszard.knop@intel.com/
>
> Changes in v2:
> - Strip trailing whitespace from the warning when the generated hint is empty
> - Link: https://lore.kernel.org/linux-doc/20260715111726.394565-1-ryszard.knop@intel.com/
>
> v3:
> - Use difflib to generate suggestions even if the tag member is mistyped
> - Suggest names based on the nested struct members too
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 51 ++++++++++++++++++++++++++--
>  1 file changed, 49 insertions(+), 2 deletions(-)

Applied, thanks.

jon
