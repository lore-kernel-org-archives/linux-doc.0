Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202D23BE620;
	Sun, 26 Jul 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785078070; cv=none; b=HGoXU2gI5UmXWAd50kmeF3Myl39Zhhvrcw5lfROGFTv3p5K+UNkx8oNuYLwX8/wHBd1MEQdt9/1sfHgHRfvCGioqT0oWlJ3HR4ILguIVvF1M9QBoSSjKL+cdBAtpVjShrefAqZf7NImeDF1Y/wF2PwbeVFdamDeKo/4F8PXcNEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785078070; c=relaxed/simple;
	bh=GBLAgSV2p4J1jzEqiBJHs2qmvPwjPMxFAgVsx3o4Trw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TIIb6lW1+u0h+RNjuIZVAo3JxphaOWsa7WQ4EPte2YxoEiP8AWvLuhSup1MONWm0YbaXk4EPmV1vD93GanVMa8x12ZTFW7ejqqO656vhq4CU7xKUezVbFoDcedIvEnqguBSrh/w6gVf9oHStZR1U60nsQ1c9QC8QQJ30GlusJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m0lor05l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m0lor05l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD0E71F00A3A;
	Sun, 26 Jul 2026 15:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785078068;
	bh=90dRkqb4kzZkUYsbF32/LDqG/oAXO0WNorNYPH40nEk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=m0lor05ltBdMhQbkCNsw/qeBXNeKLp9OBtEehP1V0GvcpSWL/0xD2+KM4Lv/fXDB4
	 BftpQbEjsFL8MQa6l+nYBSoPb86UPbOjMO6e9KzyBXDIuz44ho3Wdwof1ouPxCyGzp
	 QMR3ImLIIxwgF5dZuTd6nLSQS6AM7sVnqVu0ROyf3aJuqPjHDgKJLbHjSQXkyULT5U
	 ihi1QXjSEBfNTgonWhsSVRBFI0DyRzuitJObr/D5nBYtsgZ/qyJn2RPKiMCgcjIig2
	 R4O7o82WsBmhRl4OLSK6lgxVeZYVLqvv6KcOAWwFquNClej3VoyeNrAgPyZMVDUKGI
	 uVh8ANiGRNYQg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Joey Gouly <joey.gouly@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] arm64: Fixes and cleanups for cpu-feature-registers.rst
Date: Sun, 26 Jul 2026 16:00:51 +0100
Message-ID: <178507570719.3401780.18017279270109471777.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
References: <20260702-arm64-cpu-ftr-regs-v2-0-fe0b78f1bd93@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 02 Jul 2026 20:11:15 +0100, Mark Brown wrote:
> Peter Maydell noticed some missing updates to cpu-feature-registers.rst,
> while looking at these a number of other other omissions and some
> maintainability problems were observed.  Several registers and many
> bitfields have not been added.
> 
> Following discussion with Catalin we remove the numbering of the
> registers in the first patch so that when we add the registers we can
> add them in a roughly sorted order, then fix up the missing
> documentation before sorting the existing entries in the file.
> 
> [...]

Applied to arm64 (for-next/cpufeature), thanks!

[1/4] arm64: Don't number registers in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/b6bd4d1a5b6c
[2/4] arm64: Document missing bitfields in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/4788adeca0e0
[3/4] arm64: Sort registers in cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/21a2ca869edd
[4/4] arm64: Remove hidden bitfields from cpu-feature-registers.rst
      https://git.kernel.org/arm64/c/bc7f7ddc64df

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
