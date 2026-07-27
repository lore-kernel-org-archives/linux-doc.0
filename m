Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD742A140;
	Mon, 27 Jul 2026 23:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785196771; cv=none; b=sXqunAcDoDw7vkj81QvkPF/PY45HENVa11xVUkTPJ6Ub0wnIVbBXkcOFGFu6XBy0Ve/Wi/pVLW5B7OFvVTFOjo3irNcDFa+DG9k1KT9XrmMNtzJg5G1qQR2JqN7zHsHU5lJCgZ5z4sRI+2M9E6HEU8LTIYSDiCLMVbvnO71xLWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785196771; c=relaxed/simple;
	bh=3y7ZqRFLA5hc0RMIwm6TIsIB5DxmwHyMxE57lOCkxjo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JXyP+4k1xViqgEkx/QCjc8UAIgSSYsEflyBZMtOdF8zdfOEmIe1HfKn0tMk4OB2qa7PDVIKWVTzfngMf3Qho/Np8D3J/0Z62P+9U1aCmW5ARciGriQ5hbBX832o1RV0+BSWzTYHvBd+4OfqQcD5hGYXuB6Wvxy46PD/F/oDapu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j7CVbejW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j7CVbejW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14F031F000E9;
	Mon, 27 Jul 2026 23:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785196769;
	bh=CflxV47qfVfUx0JJR1VtbTQOpBhDDaq8i8LFF5znoYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=j7CVbejWrjp2jr+HvQnk4xenwKqlsl0ldDmXYG87J0qTxQu5UJuaBmrxz58dSHjJd
	 3ybZDF1mgWEnAUl3OjButj8RpXIixKfh+jSJiYxviGVwTtLqfpLeju19VTmJUIeytv
	 mj5Bf1yTzjYQUDX2LKHOwt0Kt3W0if5Fq8rh+ZOfceIbCRnikmZHg3G3La+aFaj2zs
	 y2VlcPEw/mJGYZLWgP/wZTSKJBGgCT61l1LAtWmjLjqucSVMa002t9US2Ad8uxMzO3
	 3INU7qQhv7J8ZONvMYuvFI19a9JK0eMB6Dk/gsW5WHnp0L/PUDWgHhvctVx4hUZe/V
	 4hpxF0KTlx1Dw==
From: SJ Park <sj@kernel.org>
To: pratmal@google.com
Cc: SJ Park <sj@kernel.org>,
	akpm@linux-foundation.org,
	vbabka@kernel.org,
	david@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	anshuman.khandual@arm.com,
	gthelen@google.com,
	surenb@google.com,
	mhocko@suse.com,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	ljs@kernel.org,
	liam@infradead.org,
	rppt@kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v3] mm/page_reporting: Add page_reporting_delay_ms module parameter
Date: Mon, 27 Jul 2026 16:59:25 -0700
Message-ID: <20260727235925.93406-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260727230545.262579-1-pratmal@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 27 Jul 2026 23:05:45 +0000 pratmal@google.com wrote:

> From: Pratyush Mallick <pratmal@google.com>
> 
> Currently, the free page reporting uses a hardcoded delay of
> (2 HZ) between reporting intervals. While this is a reasonable
> default, it lacks the flexibility to adapt to varying guest workloads.
> 
> A low delay allows aggressive memory reclamation, returning unused
> pages to the host as quickly as possible. However, during spiky
> allocation/free churn, this immediate reporting can lead to a severe
> performance penalty (nested page faults) as the guest re-allocates memory
> that the host has just unmapped. In these scenarios, there is benefit
> from increasing the delay to batch free pages over a longer window,
> absorbing the churn without hypercall and re-fault overhead.
> 
> This patch exposes the delay as a module parameter:
> /sys/module/page_reporting/parameters/page_reporting_delay_ms, measured
> in milliseconds and defaults to 2000ms.

Makes sense to me.

> 
> Signed-off-by: Pratyush Mallick <pratmal@google.com>

Reviewed-by: SJ Park <sj@kernel.org>


Thanks,
SJ

[...]
