Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 465C350248
	for <linux-doc@vger.kernel.org>; Thu, 11 Jan 2024 16:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="n8VZ/pGT"
Received: from localhost (unknown [IPv6:2601:280:5e00:7e19::646])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 7026C5CC;
	Thu, 11 Jan 2024 16:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7026C5CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1704990797; bh=xefc1aXCX+Xv3lW+7uXx5Qqi7oGJ+BtOOSCNViNtWEU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n8VZ/pGTNkqBRoEZ+mjxLqFKP1MVXqHAphmWIWi2SUmpUXaNZ3BYxyzuvKuP3BFMo
	 TWovWEiL1bqaqWRDFbzjjovObhOAvjorpU6d6ZwiiCpyDEFAaKcPUB280WQssQypDP
	 ub3b7jZABDJ1/vpqKXgrc4sMf3q5a7qjRMdUQ4Ttzxabcj+bPZBB5lbcsWGiZbcT5G
	 r3Uf/wHnx+mDlw1fcI4PlUlk5Qnn65IYF4XXpJ6owpV2bySSoQUHwvbdK/OPiX/y4n
	 iWk0q6HwaH7oPUFoA+NvkvlQpaZuIe32/d0FOOSK4RDvcB0i586G957cOZdKj0ENB5
	 pTbwwtQ4Q6yeg==
From: Jonathan Corbet <corbet@lwn.net>
To: Vegard Nossum <vegard.nossum@oracle.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-doc@vger.kernel.org, Vegard Nossum <vegard.nossum@oracle.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH] docs: kernel_feat.py: fix command injection
In-Reply-To: <20240110174758.3680506-1-vegard.nossum@oracle.com>
References: <20240110174758.3680506-1-vegard.nossum@oracle.com>
Date: Thu, 11 Jan 2024 09:33:16 -0700
Message-ID: <87bk9rn837.fsf@meer.lwn.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Vegard Nossum <vegard.nossum@oracle.com> writes:

> The kernel-feat directive passes its argument straight to the shell.
> This is unfortunate and unnecessary.
>
> Let's always use paths relative to $srctree/Documentation/ and use
> subprocess.check_call() instead of subprocess.Popen(shell=True).
>
> This also makes the code shorter.
>
> This is analogous to commit 3231dd586277 ("docs: kernel_abi.py: fix
> command injection") where we did exactly the same thing for
> kernel_abi.py, somehow I completely missed this one.
>
> Link: https://fosstodon.org/@jani/111676532203641247
> Reported-by: Jani Nikula <jani.nikula@intel.com>
> Signed-off-by: Vegard Nossum <vegard.nossum@oracle.com>

Applied, thanks for fixing these.

jon
