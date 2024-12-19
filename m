Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BE155342;
	Thu, 19 Dec 2024 19:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734637643; cv=none; b=gSrZRuN2wZntx7PnpOZTXXS5PRwTCTk3OYXlc5fo1HPpzagpom3l1O2vozrlOqWqun1iC15XK8/dR1xFcC3LwUiJ5VyfqNMEywHyoab8+KoBTK/gFGAcLC1GEPCLg/9vW5tZiMQ9Y4oT1/V760xAMaFDb7GZGlQGVplE+ts5/oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734637643; c=relaxed/simple;
	bh=2jRwjqhkgep1pL0mpEZG3HiVJkFkBo9BC51mkxHjI4c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=K4zls8EaP6dv2JivKQqcjtCduI1UXDb1Fz6kni8rO7KwKp22dH/LGdWc+YEz0Fu8Xx7x7xCdAjuc2BkpOBygpH5S0+xn8yShTlJAa/4FxKVJl4hKUB4OgyIX0L/S79rdgxcXru1BDKMqJbUbZdOGo9Vy+GaRH9YPlmlLEGZ9rjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BwcCmXu6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BwcCmXu6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53FD5C4CECE;
	Thu, 19 Dec 2024 19:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734637643;
	bh=2jRwjqhkgep1pL0mpEZG3HiVJkFkBo9BC51mkxHjI4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BwcCmXu6Hl5w+eM6rh1h0JNcORSpRVuhlpPCgdkkgbP4aILL/4F/h5lLh0FoxO8Y3
	 6fOrSLkRhO4KoTTP+mHjZz0oNpJdCLdItMrD5k25ypwa1coRwEPSAWQlnkYz6h+W4C
	 gXgVSmhr5Ls8hFySWAHWcNqbjTOMutDhHMUFwSNE/pv45pU5hLUdlt41CqRC2/liVz
	 auZrZLpcWsqK8Sy5XhzFXN+gk57lrTSBtUE00E2MhBlZDjORDJRqzf04sTZ+oig3mv
	 Ho0zY8/5plNXojzxlfdwIib02+lziSH8K9xyhGUkuGKYFGB5S5g7j/4udrTvt5WMS1
	 wUVMgi0YYO70w==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] docs: arm64: Document MDCR_EL3 boot requirements
Date: Thu, 19 Dec 2024 19:47:07 +0000
Message-Id: <173462766799.3925724.13780644464677755383.b4-ty@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20241211065425.1106683-1-anshuman.khandual@arm.com>
References: <20241211065425.1106683-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 11 Dec 2024 12:24:23 +0530, Anshuman Khandual wrote:
> This series adds missing MDCR_EL3 boot requirements for debug and pmu
> registers that are currently being accessed in the kernel. Please refer
> the following link for some earlier discussions on this.
> 
> https://lore.kernel.org/all/ZxfOeqyb3RvsdYbU@J2N7QTR9R3/
> 
> This series applies on v6.13-rc1
> 
> [...]

Applied to arm64 (for-next/docs), thanks!

[1/2] docs: arm64: Document EL3 requirements for cpu debug architecture
      https://git.kernel.org/arm64/c/3e5be4e11aac
[2/2] docs: arm64: Document EL3 requirements for FEAT_PMUv3
      https://git.kernel.org/arm64/c/1e4a5e3679cc

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
