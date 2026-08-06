Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1D23793C6;
	Thu,  6 Aug 2026 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786036364; cv=none; b=cgVjIlSfJhcM1IJh9eoScOe9WrFluS8gALAt1bUdUXSEGaFTiHd+uz1ByTZRHeQaWKnF8+81+jLRGM0VENwQAGdh3WphRKYa0k+XpQL0uKe02cox6g4rBArtV63NX0VV+r/l8dLyrG1GSknpYvQWwwsHgpSqOZIP+0p/XHEchqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786036364; c=relaxed/simple;
	bh=zM9hh6gc9E3NdSPm/f+CEbPei48fwuF6L75h3LIwdvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FSZ8Gv0r5ibXdU1BUwWb84/zUezyQpzLkE7ItwnC6BYlZTl2AkaIHOGEDcMUBTESRrDE6GefdKrg9rcSJ3e9qorY6Y7oKy9aw1f3XZZ+l7ahnawziGKzcsEk1A91o4Ru7y8E70AVNQC32RFP6XVsXdjKMvrFKFwKVmz41EiH/3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LWXSBVoS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LWXSBVoS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8331C1F00A3D;
	Thu,  6 Aug 2026 17:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036363;
	bh=NU3Qy6+p2XwSww4AMBEQzj50cNrsTlHhbl2ITppcJdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LWXSBVoSo6E3S3ESjNiXWKg/SrLjnps/ec4aqlh/WjBbxvC4DOhbVyLWaIaJk6AmM
	 gk0yon14O94m7ZGP9qPbt4jcYt1TRUYdM1QUtMOifLXbU0ITQVLszHrTKGVje2Zcfj
	 4QKa8G/Obm2a5jKaoM4Z/a1OVqB+1+PlJ9WMfDrZhxGe4kf4DQuKN9ud4CYJqjs5EK
	 xLGtlfRW+GeJUKeu/BbZwJRqdLROdLSkQ+SZQ2UXfjvodIeeRVJ3kuxWTPfTkuBOT7
	 e7lvjlUZfMa8VlghtX8KIbhp7Rdt+Zw1KXJlv7oS/2HSPUPmTf4b5a1Y82/vsp6Ut9
	 O5DRurJP/gDTQ==
From: Will Deacon <will@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Yureka Lilian <yureka@cyberchaos.dev>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3] arch: arm64: add early_param idle=<wfi|yield|nop>
Date: Thu,  6 Aug 2026 18:11:51 +0100
Message-ID: <178602185639.422567.12281019594187208555.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev>
References: <20260804-arm64-idle-param-v3-1-d10f8159062b@cyberchaos.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 04 Aug 2026 19:23:15 +0200, Yureka Lilian wrote:
> Overriding the idle mechanism might be useful for debugging and performance
> testing. Add a cmdline parameter for it, similar to the existing idle=
> parameter already present for the x86 and ppc architectures.
> 
> It is also useful on platforms where the WFI instruction misbehaves,
> such as Apple Silicon SoCs. Generally, a misbehaving instruction should
> be treated as an erratum and patched using the alternatives framework.
> However, in the Apple Silicon case we need more flexibility because it is
> difficult to detect whether the erratum applies. For example, Linux VMs
> inside macOS have the same MIDR and may even seem like they're running
> in EL2 in the case of NV, but should continue using WFI (it's trapped and
> handled correctly by the hypervisor there). Thus, we prefer to
> let the m1n1 bootloader add the idle=nop parameter[1].
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/1] arch: arm64: add early_param idle=<wfi|yield|nop>
      https://git.kernel.org/arm64/c/d97afae6f16a

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
