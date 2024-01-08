Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0F354F86
	for <linux-doc@vger.kernel.org>; Mon,  8 Jan 2024 18:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="Tp5B4RHd"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 05959377;
	Mon,  8 Jan 2024 18:39:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 05959377
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704739156; bh=HD+/ne1QMpQmz/L6L0MVdML8x6htIUriNKQw1QHVv+w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tp5B4RHd64D5wleT5vqmL4aXvNoJ0PA6swlzc9PaiN3XvBlLwG/0+lCVAVGg+UWqS
	 5TyGeyv4pDDAQbfS6rQREO0rq9syrSfWcFJJOE6mxtWMLiwFFrgjsqZz/eAOJf6cG1
	 4gx0IejGRdISL7Nwoc28ZDr1kERRXllm2yH189ZozpjQxZeA3vGqr0JRpGmmCuQ6O7
	 zgxlr6C1w0tM9C08j1QiYj5DE9ZsraBPIpa61XUhuxMb3A51XLqKV/C5nG7ahXA48i
	 ++oIZyiANKd6KuFapwHAQmBTm5MKMWGPMzDjAjH1+UR7+22JzcVZGCuKAtXk8zvpjg
	 veEMLMpyk6eRw==
From: Jonathan Corbet <corbet@lwn.net>
To: Jakub Kicinski <kuba@kernel.org>
Cc: linux-doc@vger.kernel.org, carlos.bilbao@amd.com,
 elena.reshetova@intel.com, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH docs] MAINTAINERS: use tabs for indent of CONFIDENTIAL
 COMPUTING THREAT MODEL
In-Reply-To: <20240103160938.1006517-1-kuba@kernel.org>
References: <20240103160938.1006517-1-kuba@kernel.org>
Date: Mon, 08 Jan 2024 11:39:15 -0700
Message-ID: <871qarwtyk.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Jakub Kicinski <kuba@kernel.org> writes:

> There are two MAINTAINERS entries which snuck in during the previous
> merge window which use spaces instead of tabs for indent. The rest
> of the file uses tabs. Fix CONFIDENTIAL COMPUTING THREAT MODEL FOR
> X86 VIRTUALIZATION (SNP/TDX).
>
> Given the prevalence of using tabs some scripts (AKA my scripts)
> assume tabs when parsing.
>
> The faulty entry was added in commit 1f597b1a6ec2 ("docs: security:
> Confidential computing intro and threat model for x86 virtualization")
>
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
>  MAINTAINERS | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

I've applied this, thanks.

jon
