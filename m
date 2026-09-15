Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDDA43E9DF
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 05:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789451117; cv=none; b=Ma9VHfBgB/2mY/7VIOfMZUS7Kus2wXj4WFVPLGD8LftGgKIzOCKQtzpUiCHIIgrD5twErbXymIgTISUH2H/6TEzlwNtqh5x22a9JIaXyGOfffu0xGclem821+65XRcil4JDhtS2nMmmsVxSUnfj0FVa2EnvtVZhPP6F6gLGbq/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789451117; c=relaxed/simple;
	bh=FMcmyRQ2dhYp6L0Dmwp9VeiYleNOB9zWYqKgMPgSNA8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iiXMVdrcuIo6FoY5PI2HsO10BXWQ58u9e0KqbJi9CyiV1XUO02y1/xXKSmzeeeUke2c5zvcCy3E9fW25dEUuOzmlea9FLwxyx6JZgB7X2xkVF6gZit2q6kOxadnjsh3AEvz4V2q3Tsm2M52Th80sZ1aQYYb/tuqEdKbvEetHai4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ecXFsIvV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ecXFsIvV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4FE1F000FF;
	Tue, 15 Sep 2026 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789451113;
	bh=BkH5OQM9J/Q/GhLi+Du+nLfiLe24ZwtlQQhnR2ApN4A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ecXFsIvVk1QMUhpvZieAX2h7WytAJzaDxJ8bGv0LTBj6wL7iaBRSO4jevBYmidcrH
	 k+jQTvZQcHHAAC8sumGKPyTnJAF7tEBwjkZx9ZN0iLMfXxVPhdZz5IoGgrsSxa1zbl
	 mjtYTGW1+qSP01Hj7DZCNNeiz6BsTwUUmCcxSbK1fGc2U0RcDDusrlMScc7MsJS5DZ
	 7JbjEngauqhEdfj6KoCIoaL+cz1Kv4JmRnS4/P/KdJ1FV3NDxu/aeCxoOD2tSNFVKn
	 rReDMjmZh9VZ2vd0TOgCZ3armPR9dTp1VnfIB98cD39/d1kFE6oDw3AmNFQs0ZRcsc
	 g+WdZP1XC8kxw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-doc@vger.kernel.org, 
 linux-mm@kvack.org, Pratyush Yadav <pratyush@kernel.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260905141526.1546478-1-ekffu200098@gmail.com>
References: <20260905141526.1546478-1-ekffu200098@gmail.com>
Subject: Re: [PATCH v2] memblock: reject non-page-aligned reserve_mem
 regions
Message-Id: <178945110677.43585.11156052528524749779.b4-ty@b4>
Date: Tue, 15 Sep 2026 08:45:06 +0300
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev

On Sat, 05 Sep 2026 23:15:24 +0900, Sang-Heon Jeon wrote:
> memblock: reject non-page-aligned reserve_mem regions

Applied to for-next branch of memblock.git tree, thanks!

[1/1] memblock: reject non-page-aligned reserve_mem regions
      commit: 5728d3523f12826a2b180c1c5738f74e33197e14

tree: https://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock
branch: for-next

--
Sincerely yours,
Mike.


