Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F28E48C8A1;
	Wed,  3 Jun 2026 21:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780520827; cv=none; b=axj2h+rf0lqLdabAfKgjwC74XLXlgIIlLx2EA6TAzQB3v0ge5NNg5KiFdtMjMajHH0Gr/AW3Go3ppoTj0kz5SkVrjL2R69pm39TOw/9GSqCItOUkld+itiJtQu6HjI95POesA1mPDvVSziyjPGojqeOWyjeGf5B0zwfYpsFY/AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780520827; c=relaxed/simple;
	bh=4m2Fj2ZS2BLyJDWSMX9JZEerPxvMzhGBmpS8xsHOyrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lPhQvVfe7G8+LRGPD9yd9//qnybSFsSa1ddAkloz/aJbeHkKMwqbBPwx/TBtozi53iufPSFUpjXmY1CFl2m4QRhFBUJgtq4jTJcvoWdD2U6CQ7UrGI3yUOc2rvaGneXZWRwR5Vjrn6LU6KcpCVMiEvI2tuZ1PhqgeeBJ634Dj0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3NEPwD4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3NEPwD4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C75D1F00893;
	Wed,  3 Jun 2026 21:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780520825;
	bh=zuCcNKlBGvtnqvBvkqXr9K8d2tUZ3DIWY7nKfWt/lcs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C3NEPwD4GvgSeWN6a3CQ/gyiEh+c0zvPeQQGLhGxCTjJet12GZSBrXbGn9OH0fhcz
	 hpMn48cXO8/bhBG1zh9zB6P3mRCow/IqcbgbwCJRugr3zXJFhZi9t862Ip6Owa+hJg
	 2BOXHRdLsy7Ue1D4XV29EC1bdDP5qtC6rNkxfXGmeekH3i8oGoRbHI1GeJuosp42BH
	 tH/TL+AP/KMPMuJJkP4t1OAjayb0Ffo3bYj3qKN7X1nqueA6+bQLCbYNgNOWk3f8D8
	 Cen2wOVPr+p6qQSHKaNDiCG0ndlgVo3FsPPaQ8vHCA/EKtLnZ+Fr1R8kFwMkTrkqLl
	 /QvGO20Ola7AA==
From: Will Deacon <will@kernel.org>
To: vladimir.murzin@arm.com,
	xuwei5@huawei.com,
	broonie@kernel.org,
	ryan.roberts@arm.com,
	corbet@lwn.net,
	catalin.marinas@arm.com,
	oupton@kernel.org,
	kevin.brodsky@arm.com,
	maz@kernel.org,
	yeoreum.yun@arm.com,
	skhan@linuxfoundation.org,
	yangyicong@hisilicon.com,
	thuth@redhat.com,
	kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com,
	lpieralisi@kernel.org,
	miko.lenczewski@arm.com,
	mark.rutland@arm.com,
	james.clark@linaro.org,
	Zeng Heng <zengheng@huaweicloud.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	wangkefeng.wang@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	zengheng4@huawei.com
Subject: Re: [PATCH v4 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
Date: Wed,  3 Jun 2026 22:06:31 +0100
Message-ID: <178048700943.309679.7634002465643697724.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260603062025.1504083-1-zengheng@huaweicloud.com>
References: <20260603062025.1504083-1-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Wed, 03 Jun 2026 14:20:23 +0800, Zeng Heng wrote:
> v3: https://lore.kernel.org/all/20260601112000.1145391-1-zengheng@huaweicloud.com/
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v4:
>   - Keep orthogonality for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM and
>     CONFIG_HISILICON_ERRATUM_162100125 within the cnp_erratum_cpus array.
> 
> [...]

Applied to arm64 (for-next/errata), thanks!

[1/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
      https://git.kernel.org/arm64/c/25996982ebcf
[2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
      https://git.kernel.org/arm64/c/f64328ecf4bf

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
