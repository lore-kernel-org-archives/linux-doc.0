Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35A21DF980;
	Mon, 22 Dec 2025 22:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766441091; cv=none; b=aSQWYPfZIYBnDOcQBXlTLUjRhle3zkIKFCj5hIXhTzi0R18Qx8mOpJHxGxWIk0QQbARdyYVrfI8c1ApI5CEXeaDIL2j67D3DT6KLUOAFuPLckVYX2iknhPz1I9uXnBi/RDFz3f02LA4F872noEfW9dmadtyetz8vo5g4h/kGqAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766441091; c=relaxed/simple;
	bh=FJpNfwTfs8IwrQnA47tP7zbelq8Zpp7Zhqq0uOuEuzk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RTYNyf4Sb01jwhERqijwK11Lt8CrB6kO/vtNk6GW6h0A2QYJ7XR5KYsnzd22HJ8UIaKSP4wDTcyLNqgFciiB4ssM6ZkT6NEPR13utSaONmreidFMt0MN0+m5ZV2S3JWa7tU7CUieTMPkV4y+OCtocCCEHitn/6d7CPicKOEmXfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=M4F93OGW; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="M4F93OGW"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 014354040B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1766441087; bh=NRu+mCuo2pzM8q+dlKypHrQYJH2xPbXsZyRleXGOLgE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=M4F93OGW/DB+X50HZjvSjCpTCl46acouUVh6L6+mpI6Sn4gHqJdtS5mFP3GkPUyVA
	 hyY9cDf6iy8kFyhLcbHJAOYBKcAveDry8HMVV7VKr2vn+ijIkr3a5sZjyDEFHuU2RK
	 KPLboih3neupSBfDMMCBPm34rv9hsbuB+0DQPqUv6Py829lJFvAJ7DtLnC3z7XCnej
	 M26I9k+EV5ct0d6G+IAVFucb7HXEri8B5JCyZPnV9L8jR+pMPagxzDiAL7Pk5ohYaH
	 6lk0DNsKzRLvnSD/QNChVD5Hu/ntvx7zN62RXrsO6a9Cmyp+alpY01TXqfG9SfRNas
	 7ye1qjLBNidZw==
Received: from localhost (unknown [IPv6:2601:280:4600:27b::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 014354040B;
	Mon, 22 Dec 2025 22:04:46 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Sasha Levin <sashal@kernel.org>
Cc: joe@perches.com, kees@kernel.org, konstantin@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, rostedt@goodmis.org, Sasha Levin
 <sashal@kernel.org>
Subject: Re: [PATCH] README: add AI Coding Assistants section
In-Reply-To: <20251214010711.370328-1-sashal@kernel.org>
References: <20251214010711.370328-1-sashal@kernel.org>
Date: Mon, 22 Dec 2025 15:04:46 -0700
Message-ID: <877bue18ch.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Sasha Levin <sashal@kernel.org> writes:

> Add guidance for AI assistants and developers using AI tools for kernel
> contributions, per the consensus reached at the 2025 Maintainers Summit.
>
> This will allow coding assistants to easily parse these instructions and comply
> with guidelines set by the community.
>
> Link: https://lwn.net/Articles/1049830/
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  README | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>
> diff --git a/README b/README
> index a9fc263ccd711..f6016e553ba4c 100644
> --- a/README
> +++ b/README
> @@ -38,6 +38,7 @@ Find your role below:
>  * Maintainer - Leading subsystems and reviewing patches
>  * Hardware Vendor - Writing drivers for new hardware
>  * Distribution Maintainer - Packaging kernels for distros
> +* AI Coding Assistants - AI tools and developers using AI for contributions
>  
>  
>  For Specific Users
> @@ -144,6 +145,38 @@ Package and distribute the kernel:
>  * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
>  * Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
>  
> +AI Coding Assistants
> +--------------------
> +
> +AI assistants and developers using AI tools for kernel contributions must follow
> +the standard kernel development processes:
> +
> +* Development Process: Documentation/process/development-process.rst
> +* Coding Style: Documentation/process/coding-style.rst
> +* Submitting Patches: Documentation/process/submitting-patches.rst
> +* Programming Language: Documentation/process/programming-language.rst
> +
> +Important requirements:
> +
> +* License Compliance: All contributions must comply with GPL-2.0-only licensing.
> +  See Documentation/process/license-rules.rst for SPDX identifier requirements.
> +
> +* Signed-off-by: AI agents MUST NOT add Signed-off-by tags. Only humans can
> +  legally certify the Developer Certificate of Origin (Documentation/process/
> +  submitting-patches.rst). The human submitting AI-assisted code is responsible
> +  for the Signed-off-by certification.
> +
> +* Attribution: Contributions involving AI assistance should include an Assisted-by
> +  tag in the following format:
> +
> +    Assisted-by: AGENT_NAME:MODEL_VERSION [TOOL1] [TOOL2] ...
> +
> +  Where AGENT_NAME is the AI tool/assistant name, MODEL_VERSION is the specific
> +  model or version used, and optional tool names indicate specialized analysis
> +  tools used during development.
> +
> +  List specialized tools (coccinelle, sparse, smatch, cppcheck, clang-tidy,
> +  custom scripts) but omit basic tools (git, gcc, make, editors).

I won't dig in my heels on this, but I do have to ask ... I can only
imagine that this stuff will grow over time, to the point that it
dominates our top-level README file, which is intended for humans.  What
do you think about creating Documentation/process/coding-assistants.rst,
putting this material there, and adding a single line to README telling
these tools to refer to the file and follow it rigorously?

Thanks,

jon
