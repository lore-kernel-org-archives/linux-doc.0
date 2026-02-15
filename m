Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F8EE571;
	Sun, 15 Feb 2026 13:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771161102; cv=none; b=FhXfxL83Nead26wPNtX9KZFlG8dpxEENJYZ+6dQXpscbwe5odSE8+nsaQ3aTJNnYqhfMMN8eCoBv6KTBayKzkEAMR89vlq7Td/VuL7a5eGewz9nqdzElcYs3LEjfRBoI0kkNGMNA5T3lcpeJo06L1JlDRtd9ZTbbNoKiBQ9nrsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771161102; c=relaxed/simple;
	bh=bko72SsFEVwGvHRmVSvPZ7d2JlcM7ftHuEj1o5ay/9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M2nt6jZ6uKZhp/hrDYFmHEf48xOFLPoQZN7Phfv7cAu5/j0dChkilQi/+U0L4wJE0vsmtxrFkg1gF9ZAoP5lGq6IWhbQy25c3sX0rOeeNiefxgpCpbP+3ehsnydtI+lKZ9Idfyk/lQLTXCNJd7Ky6sk2AcY4HBUTN/sV4swTs6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEXl8Vdg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEXl8Vdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3060C4CEF7;
	Sun, 15 Feb 2026 13:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771161102;
	bh=bko72SsFEVwGvHRmVSvPZ7d2JlcM7ftHuEj1o5ay/9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEXl8Vdg+MR97wcd9y89+gKfoLf4XCuB+FNV9/tR5XBsvJJCbi9y5yez3GuZZkrW3
	 V4wkFokmEC6DHQvD/PDV/FyBbrWzgScjslfJsmYWoj6qYpZ/S049xfuhAfuAHzclWc
	 PiRkJ+vM9dlAzVMjDuLf7Cg57MzKY3FuRmT0yewglZqtICabBq+yXMSAkseW1L2ALW
	 vyRcwASAd+ZbOqMf3NmY+/XtuJVDE3MvN/11HVPIYfjZ4DQ2vdvk5kW8pQBZftUHZw
	 VLoda5m3OJpZi/aWDPXZt8ZxTQlF7uqYFGb5oTbtPy83Gd9dbtuefPCF0VTWugwN77
	 RSYj7B0UAI+Bw==
Date: Sun, 15 Feb 2026 08:11:40 -0500
From: Sasha Levin <sashal@kernel.org>
To: Achill Gilgenast <achill@achill.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Bagas Sanjaya <bagasdotme@gmail.com>, Kees Cook <kees@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] README: remove unnecessary comma in "System
 Administrator" section
Message-ID: <aZHGDN2hYyvDTCed@laps>
References: <20260215111156.77301-1-achill@achill.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260215111156.77301-1-achill@achill.org>

On Sun, Feb 15, 2026 at 12:11:52PM +0100, Achill Gilgenast wrote:
>Commas before "and" are unnecessary if they are used in the same
>context, as it is here.
>
>Fixes: b9a565b3e4d8 ("README: restructure with role-based documentation and guidelines")
>Signed-off-by: Achill Gilgenast <achill@achill.org>
>---
> README | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/README b/README
>index e6549b2a7aac..947265bc64ac 100644
>--- a/README
>+++ b/README
>@@ -98,7 +98,7 @@ Maintain and stabilize kernel versions:
> System Administrator
> --------------------
>
>-Configure, tune, and troubleshoot Linux systems:
>+Configure, tune and troubleshoot Linux systems:

I suppose that this is a matter of preference, but the README consistently uses
the Oxford comma throught the text.

I think I'll just point to
https://docs.kernel.org/doc-guide/contributing.html#typo-fixes and defer this
to the Documentation maintainers :)

-- 
Thanks,
Sasha
