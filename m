Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3AE13B294
	for <linux-doc@vger.kernel.org>; Thu, 15 Feb 2024 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708040046; cv=none; b=PqJmO8dF2E4diG8T2w95xfPZAExtL6KNnm5jJPGxoBDMa+LT2IqXDqaNw0jKSaPeV0F6YVRSOET5Bp1K5hkoWp58Bk41K6jXi2rTqMT4mThnVjeHbCGQfFz9ywAArVnh7hLx66jgoqhQJWgPFe+OUGocye1UAzlCWFg3Oo5cPyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708040046; c=relaxed/simple;
	bh=U9qB/1eN3eBotuyI4AgjrAxNMbk8osSsz/EQ8SmxP9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LHo/SI9IIOKU3tOm9R0QMfmuGLfL6jIPJt6/efCGCzGxMQ661qySH4EFDEZ2t1jMyT/Ji9iErh5qwyhL3VwVAir5bDFyFkyfWUxo34tuF4O7CK6HFKb7j+PObkXis3oaLU1e5bb4trPGl/VBqjwHYolxqo3mh/gOyrA/wTD71tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=lO9LG0ep; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="lO9LG0ep"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=t764A1Rc7GLfGQeZWvgPeMnPgt9n1U+YRKn49J5eYnE=; b=lO9LG0epn3mHcks56OL38bnvTl
	u+/ujhBn6YVofqCZG2QNc8k/M0B4z88Sam0k2N1XCA/UkRygYAF1342fD+5Kk1LyDAvqxbNPv7FaT
	pquF0cxd8sDvbp41zumlhphYHEgX3pEvWab8zK1S/ymBeu51PFcCSPomZDwF3abxpbYVQzW3ZY1nV
	df58adSZQ3IvDWHj3YZA8IBkzd9fotHEkIwpcmNBu8Hb6x9XRlMHPqCgwB8d/6mNX2eNUf97K1y1E
	akFhGgALns4sOeBuzyw4xaHv9w/nPXTF/y6XcURhBGwF17SWyM//rpmtGwPvzqexHJ0tr2CncVcln
	xmP+mXXg==;
Received: from [50.53.50.0] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ralEu-00000000Tgo-1NLQ;
	Thu, 15 Feb 2024 23:34:00 +0000
Message-ID: <6e83d049-0db7-4876-a3f5-54d584f205e9@infradead.org>
Date: Thu, 15 Feb 2024 15:34:00 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] scripts/kernel-doc: add modeline for vim users
Content-Language: en-US
To: Vegard Nossum <vegard.nossum@oracle.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
References: <20240215134828.1277109-1-vegard.nossum@oracle.com>
 <20240215134828.1277109-2-vegard.nossum@oracle.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20240215134828.1277109-2-vegard.nossum@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/15/24 05:48, Vegard Nossum wrote:
> Set 'softtabstop' to 4 spaces, which will hopefully help keep the
> indentation in this file consistent going forwards.
> 
> This mirrors the modeline in scripts such as recordmcount.pl, ktest.pl,
> and others.
> 
> Emacs seems to use 4 spaces to indent by default, so it doesn't require
> anything special here.
> 
> No functional change.
> 
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>


> ---
>  scripts/kernel-doc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> index a9947080ead3..4dc5c3909d8c 100755
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1,5 +1,6 @@
>  #!/usr/bin/env perl
>  # SPDX-License-Identifier: GPL-2.0
> +# vim: softtabstop=4
>  
>  use warnings;
>  use strict;

-- 
#Randy
