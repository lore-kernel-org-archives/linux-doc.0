Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CE2136672;
	Sun, 22 Mar 2026 20:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774211724; cv=none; b=eFSsBoOaxgIXLhMzWSJFKD3c/ZD4TKvrVS8T7icDnvMwWCMlI8Qd8depr6Gikq9p6ZNVnjK6xWydQpHwz2+/PaBVL4WiL4cmUiLXGrPGGR/ZHW91FAMLBALc68/EUVxGFIsdyWbRBqKO+wYecc5Xd7bk3/mVk41FWkECcmY6iiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774211724; c=relaxed/simple;
	bh=G7vENXpDNKDzMT6T90HvsTuR6BdiHPmMZqJojxELaws=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=L3WFtFcvwOljVyi+xQlaU2rGYgeSC7NOz1uOvJ0tzBARmtwse6XsIkmAyXKl4m5GP0aTGJBr1pg9EDEvDJuH+F9iEuHyoUC/Rr0U/E/zF15nVJMqMwnYQDXbzJyDXcZNjO7biEnsQU+mjCETaymwKpG9o0e92PBRBYcm8TaQozo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=J21rt7aS; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="J21rt7aS"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 31DD6411E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1774211722; bh=oimrN5cYHx/hTjQ35w0ll0C/DPG7NSwSdNgwyE09Ztw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=J21rt7aSp+kT9V+f95dyAWbzBWVLf3v3bM1STT6ozYOyj6tXFk9yukDYhTDtlxM8+
	 bu3Smj6d2/9ChTN25+pBEmaclPxCmssXP653QfqZZ8QZ/adDAGkhY0orItWSwhm+to
	 lz8HluJzyd0JxxWJ8xAnPcJ0E7AzJfGZQN2sa6G0tOi2XTQ4NYFxs3UADoEVIiR3LA
	 3mzwE8qK6ZqckuokdCGTpgSfnW8nL3hNRzeP6J6q1NFlhTu9EojQXeqCnrkNVPiR1u
	 biTd4ytKWVKfI7ybAu+5yYRXAKODDExrBbZdCYjp03xo8bsdpQtpMIfDpTerSd7Xkf
	 Na8QL71kyRD8A==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 31DD6411E2;
	Sun, 22 Mar 2026 20:35:22 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Rito Rhymes <rito@ritovision.com>, linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, Rito Rhymes <rito@ritovision.com>
Subject: Re: [PATCH v2 0/1] docs: examples of pages affected by C API
 signature overflow
In-Reply-To: <20260322193740.68784-1-rito@ritovision.com>
References: <20260321142559.26005-2-rito@ritovision.com>
 <20260322193740.68784-1-rito@ritovision.com>
Date: Sun, 22 Mar 2026 14:35:21 -0600
Message-ID: <874im7eh6e.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Rito Rhymes <rito@ritovision.com> writes:

> Examples of affected pages on docs.kernel.org this patch improves:
>   core-api/genalloc.html
>   userspace-api/iommufd.html
>   userspace-api/liveupdate.html
>   core-api/liveupdate.html
>   arch/sh/index.html
>   arch/x86/sgx.html
>   devicetree/kernel-api.html
>   userspace-api/fwctl/fwctl-cxl.html
>   driver-api/regulator.html
>   driver-api/reset.html
>   driver-api/s390-drivers.html
>   driver-api/scsi.html
>   driver-api/spi.html
>   driver-api/target.html
>   driver-api/wbrf.html
>   driver-api/wmi.html
>
> Rito Rhymes (1):
>   docs: contain horizontal overflow in C API descriptions
>
>  Documentation/sphinx-static/custom.css | 7 +++++++
>  1 file changed, 7 insertions(+)

This is a general comment applying to most of the patches you have sent:
is not a typical or particularly helpful cover letter.  The cover letter
tells reviewers what the series as a whole does; this one does not.
Perhaps more to the point, a cover letter is rarely warranted for a
single patch; just put any relevant information into the changelog of
the patch itself.

In this case, some examples of the problem being solved are certainly
warranted, though perhaps not so many as given here.  They should be in
the patch changelog so that somebody wondering, years from now, why the
patch was applied can gain that understanding.

The names of HTML files are perhaps not ideal; since you're talking
about docs.kernel.org in particular, you could give URLs that people
could view directly.  So, for example:

  https://docs.kernel.org/6.19/core-api/genalloc.html

Note the explicit version so that the problem will be findable in the
distant future, even after the fix is applied.

Thanks,

jon
