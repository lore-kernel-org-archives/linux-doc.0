Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610161D54E
	for <linux-doc@vger.kernel.org>; Wed,  3 Jan 2024 21:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="UBvX/vb3"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7EF031C33;
	Wed,  3 Jan 2024 21:02:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7EF031C33
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704315723; bh=UT/YPeY75RW/2Rl3UN8k+7c3AHjrlPMvwQgHmWLuqlk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UBvX/vb3gjSZn3gCe8O58HzzH+i8T+4fmgTC1xRD5OeWY8JfvthJdF1Lfv8y/daKh
	 SXZ67SBnI0j/thN6fg3q7abKZSmfvJSu8VzNbj3qrtdOBFPE8HJWRe8UWtAXvuKEVp
	 7wXK3CRfgLamQ8KEA9h9HrLkwpEswjq0SoMkklZVF+AFYh5tokVSXb6vHscxzmcSzn
	 8jAG7xNtwWzTZnD9Hh2WmGvIOIrOUnld2fljpfkeU4OziHUe/lIvLWn3C2D7OVIO2T
	 EBXwnGDzv/X/nHNjza9SevJ+7CmndoHs7WYaDDa1JSrcqwVvGLVb/dK61GxhwKzIOS
	 fLUTsrxYQPELg==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [RFC PATCH 1/2] scripts/get_abi: fix source path leak
In-Reply-To: <20231231235959.3342928-1-vegard.nossum@oracle.com>
References: <20231231235959.3342928-1-vegard.nossum@oracle.com>
Date: Wed, 03 Jan 2024 14:02:02 -0700
Message-ID: <87ttnu871x.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> The code currently leaks the absolute path of the ABI files into the
> rendered documentation.
>
> There exists code to prevent this, but it is not effective when an
> absolute path is passed, which it is when $srctree is used.
>
> I consider this to be a minimal, stop-gap fix; a better fix would strip
> off the actual prefix instead of hacking it off with a regex.
>
> Link: https://mastodon.social/@vegard/111677490643495163
> Cc: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

This definitely is worth fixing; I'm a bit annoyed that I let these
problems through.  I've tossed in a Cc: stable as well, backporting them
can only do good.

Thanks,

jon
