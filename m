Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D41F448C8AC;
	Wed,  3 Jun 2026 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520813; cv=none; b=WZ6t/95SpuHas9JH6W9sZWq8tgHftIYOZp0wt/RGjbWDtrzP43heF9SbipFJ6XuF1/VX2KQHXlJaXja1HU8ohvpItPZ/qAn1NgFCBIhduFTuHNQ5pMtB4YXF/fTOLbV0vjJWav2unRCaeRp5R3QVxzxgQrR2PvZFH0d2Rjv/k6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520813; c=relaxed/simple;
	bh=z0Jp8LV7efE6WbL+zZOrICPpKPAe5OtclLW7a2oebsk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aAfwI85VpmXtzVNgWnMW4L8eqHeAazKG/eiFy+tct0oXkMxR9UlCz0qKM7lRnnDcLxijCWl/5gulyPvIfLpKoTzDfrbWcOP9q5WWIKSuxZB7VuV3dxf0xVuqWnI/EvtNXxZ33x2ydeOmAtIdrSarFm7SlwjanFkC0k3AHkcAp6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nydNbfnm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nydNbfnm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A893D1F00893;
	Wed,  3 Jun 2026 21:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520812;
	bh=21q3frG5dqsfzhzDGUSQ2foZqGYT+5Kd243FESgXfYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=nydNbfnm6Q5PM5n4h1PYamx+MAScoZSsjbgXa+PidSrdlv9limWwAAs3w1gBxgW3/
	 E2eDdyXoSqKK97c/sq0583UeeMRLETMOdukT3NfBOxopHZbugjnQcuX3EzwPciOpkr
	 YL0jB0WM3VW5Q73BK4TcFxQCXcu21BGcy9UIisT4THSEErXd1SnwKHO8Xym6Xof1y4
	 CVNXDJDN/VjIWvoU2mY4RlYK9vIMPKtgAqbUU1Y6hoDv9ejbMyW+5ooj6Y6ThM3vtS
	 WMofj3ch2GU28t6P4s7QXSFiP2onkVdUaEJky1Qel8NaKg7Iermv4Jy6sNxJEYxdTJ
	 AR7+TlBkLkgAQ==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Document SVE constraints on new hwcaps
Date: Wed,  3 Jun 2026 22:06:27 +0100
Message-ID: <178048736181.314885.11070346483704289867.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
References: <20260522-arm64-elf-hwcaps-sve-cleanup-v1-1-07b0cedfc6fa@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 22 May 2026 18:50:28 +0100, Mark Brown wrote:
> Two of the SVE hwcaps added for the SVE features in the 2025 dpISA did
> not explicitly call out their dependency on SVE in the ABI documentation.
> Do so.
> 
> While we're here reorder the SVE and fature specific ID registers for
> HWCAP3_SVE_LUT6 which did have the SVE dependency but listed it second
> unlike the other SVE specific ID registers.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/1] arm64: Document SVE constraints on new hwcaps
      https://git.kernel.org/arm64/c/f20f8fe086b2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
