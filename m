Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7CA361650;
	Thu, 16 Jul 2026 22:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241604; cv=none; b=Cn6VdomhUBhd7AA2l9rQlxJhm3or9UbP4Zg8p3qyk4Z/icUzw5YEzSR8DoWj7E+475IxR3E2LC/01Vj/+DuHeXvOXsC+XTahZqKSgJV7d9/GN81k6R1eHFocBP22CxfyEA0uh4QN2XL/4YsPxVRWCC2kPt1Kurt/PSDo6cudIpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241604; c=relaxed/simple;
	bh=1jtFfg52Sz0HtyCsQSpRnWKmKUNqzrl6W++yItm4N2c=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Plt8lymO02Mncmq1Qaaw0RdzbwyTSvvJWBu72/y4B/vfK4NT87cxTXtYzLfhdyruB3+DKdD0VSdZRS8mu9azCpwS6ekWpmPFpRBWSMdFr/MMZF48EBxJRXYN10CWZfXD8AgAdXHoQe5coHYNCHHGN1Dc7oXAWk3A/rUo6ExaNAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=WCwkuSub; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="WCwkuSub"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net F0787408B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1784241602; bh=iuB3B2RLZz1h/Y9E1kMEcY617JUGpaxS73dqr9cERbQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=WCwkuSubcjdTNeTw7NbdnXyKuIXZJyamwKa/InXk51d4oHWVTTKZV9IxxeKaYfkow
	 fMqKXmWLCFRYHqKB8LIwmvBjo+XBjgE1yp//R2VwcGl3z+nfax7F8eosxKPIuELFpW
	 STYi7cVk2PQr4WjzMG5EAD8q+9XW6DQc+DWdI4SVaacRTbboCg6xcvZqMhEWDdOnnZ
	 gipn15VWoBePneIRnminqrejYCn7/HN4SN/LdyEKy7V6kU8iXerMn/LAsjI+ZEW84c
	 FtQJStaTcr6ETQnl3KGFJFybKt/g0S/Fe9YOTjiRz7R0KtMWiWcC+IPDCCoMsEfu0t
	 rRDcUNqXnJaNQ==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id F0787408B2;
	Thu, 16 Jul 2026 22:40:01 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Ryszard Knop <ryszard.knop@intel.com>, linux-doc@vger.kernel.org
Cc: Shuicheng Lin <shuicheng.lin@intel.com>, Randy Dunlap
 <rdunlap@infradead.org>, Jani Nikula <jani.nikula@linux.intel.com>,
 linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org
Subject: Re: [PATCH] scripts/kernel-doc: Suggest possible names for excess
 descriptions
In-Reply-To: <20260714111208.323108-1-ryszard.knop@intel.com>
References: <20260714111208.323108-1-ryszard.knop@intel.com>
Date: Thu, 16 Jul 2026 16:40:01 -0600
Message-ID: <87tspy5zjy.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Ryszard Knop <ryszard.knop@intel.com> writes:

> Since check_sections() now warns if a documentation tag member name is
> the same as defined in the struct, we can suggest names the checker
> knows, so that it's more obvious how to deal with the warning.
>
> Signed-off-by: Ryszard Knop <ryszard.knop@intel.com>
> ---
>  tools/lib/python/kdoc/kdoc_parser.py | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)

So I almost applied this version of this patch.  For future reference,
please:

- Post new versions standalone, not as a reply

- Do not include version information in the changelog (put it below the
  "---" line)

- Provide a more coherent changelog; the one above does not say what is
  actually going on here.

- CC the maintainer (me).

Thanks,

jon
