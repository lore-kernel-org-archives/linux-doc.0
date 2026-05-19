Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AEC400E1A
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779204263; cv=none; b=sas4vXjH7LV72dq8IRT5wYrQx6JXq3cmEWalmJPtyLFT3xLB/3vxmxLaTDGbCVx0N+Z69rEnovWxQt+WbOlktlVHVmkGEtDQYFvdyIuPTeCl+3YIlSNTvNIpYw+VYwhjcLYkEKInfMMZOY6xpBAbZGqDdp2SuOaitdArBMkotss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779204263; c=relaxed/simple;
	bh=yGclX00sEmvr2VHCUrzeE+m5yMZUCl/baz5r002iGfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aeBeo9yS3IuTc4iD4b2CCxHrdlwWZ5EfnC3owdT4rPcLpXKnHj2Xa88E2RrSwawyv/6aNqoqmejCKWxpVTBTLYBkY74oCAupv7xTLCJj25z8IulOUIhZfGQQ4BNK5B2Fmo8bkqzXRmD+5n6w4BHBD3EydItVBhZOl+oJeN8jyOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AuhVB9DO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AuhVB9DO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A66F3C2BCB3;
	Tue, 19 May 2026 15:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779204263;
	bh=yGclX00sEmvr2VHCUrzeE+m5yMZUCl/baz5r002iGfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AuhVB9DO3aQKgSyzzgiaQyUBKNX8tiLyVYh2LwfpxJo5jfSn7SvdF//NUd8ec5/X6
	 H5iw6qVBfvxfPa3WCPCgoq/jRlhG0Nmps5YeWqLT0cQdzEFtTIDBaF6Dk4yhEUUfmJ
	 wF5toKF9p0gGO3Cd5IJ52ug2WudLGT0rIUcUT+tNpelfXip53G9nA5g6Sv4SYZnLqR
	 CpLbHKr9t5Ylxfa5HMTWdXMg62nEVdezSbHysBevJ60Hwanx0DQPurSJuv9rQWA3fa
	 dljNqWcu7IGG/4IEOvBqIVE5H+KLhaJPNtH0lF9RKi4YgeJTktCXliqKXgCfSV5L3Z
	 o1RiSEby2rHzQ==
From: Will Deacon <will@kernel.org>
To: catalin.marinas@arm.com,
	Robin Murphy <robin.murphy@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] arm64: errata: Reformat table for IDs
Date: Tue, 19 May 2026 16:23:09 +0100
Message-ID: <177918817933.747252.7403057722390578379.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
References: <0d4c8f3968e5c5c0a6f3dc295c3e9f696b9006f4.1777657487.git.robin.murphy@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 01 May 2026 18:52:28 +0100, Robin Murphy wrote:
> We have some inconsistency where multiple errata for the same component
> share the same Kconfig workaround; some are one ID per line, some are
> smooshed together, and some are entirely separate entries. Standardise
> on the single entry, one ID per line format so that things render nice
> and consistently in the HTML docs, and it's simple and clear to add new
> IDs to existing workarounds without churning the table too much.
> 
> [...]

I think I intended to send this upstream at -rc1, but it didn't happen.
However, we don't (yet) seem to have any new workarounds in linux-next
so I'll take it on its own branch for 7.2.

Applied to arm64 (for-next/errata), thanks!

[1/1] arm64: errata: Reformat table for IDs
      https://git.kernel.org/arm64/c/ede94377d855

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
