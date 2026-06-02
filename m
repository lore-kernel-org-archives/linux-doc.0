Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35A43F0755;
	Tue,  2 Jun 2026 15:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780415633; cv=none; b=G8okET0D8a2F7XMG6gi6/vuZGb30kF4TXa+WJFB2ieafucgIKs+0jWt8KlOwqtdjIWWh/7OMAnU6543WTXWYM+xReaI/5VYkzHLytIFE3tRK/RaCg5oR8fPknX58FG4v1GDKQGSeDGvNlheEmoExBbSsD7K/plDaKa4Strchfto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780415633; c=relaxed/simple;
	bh=bPplqRqZLwULe4vwQaG/n15wR/fDHQ8TSZqe0vSiBzY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McCP5TIL99Mk96tNmr2iJgoNCMW4RcArjDiOJo1MHaBESy9dKk2J7BwnSldLmnBZtp9OxCoMkq7fKQV6jz8ifowEEKHVQX7+gq2rUGSSlQGCy8Yw40rNotC67e20lbMNqfocGPpAqcfCzYslAx5/UN047YU1NXGpmwjzvG8MtAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Eh27Qgfh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Eh27Qgfh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE6981F00893;
	Tue,  2 Jun 2026 15:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780415632;
	bh=g1gxQOYwgpOrI7CcKQFX0nybbQGoJfcX1gVspJlp6G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eh27QgfhvW7svjtX9XwdHqJ+rCdP7BBSdRVIVnMc1Wg7O9IHCAC5GUR6nIO11Faj1
	 I/8a+n1vmleEaNXGJ5drcpYTDyxJ8s6fFiNyOt6JtIPlGYCfgsbTAtmqDQf6u2+nSq
	 79sP/Wt67eSw1KbcYcWyfNiLFqWDyoh264CLTjF+zTjfQ2/2NV0Wv90+AoQIG4t2kP
	 5cGHX35eJ8FiVRKaiyRLWqdvBk8z6+GryQaamsTO3jPSmIAOZIwUQHZ6MKD6OPhPK6
	 r18UrNY2Fwh2uPGPorFa9v9L14OQIZkjcwrxsYdTdz1uh3nsa+sfZOytlKVAog+dsq
	 VSD/fiH4NIzoA==
Date: Tue, 2 Jun 2026 16:53:44 +0100
From: Will Deacon <will@kernel.org>
To: Zeng Heng <zengheng@huaweicloud.com>
Cc: vladimir.murzin@arm.com, xuwei5@huawei.com, wangyushan12@huawei.com,
	yangyicong@hisilicon.com, maz@kernel.org, yeoreum.yun@arm.com,
	miko.lenczewski@arm.com, james.clark@linaro.org, corbet@lwn.net,
	skhan@linuxfoundation.org, kuninori.morimoto.gx@renesas.com,
	lucaswei@google.com, catalin.marinas@arm.com, broonie@kernel.org,
	lpieralisi@kernel.org, thuth@redhat.com, kevin.brodsky@arm.com,
	tongtiangen@huawei.com, oupton@kernel.org, ryan.roberts@arm.com,
	mark.rutland@arm.com, Sascha.Bischoff@arm.com,
	linux-arm-kernel@lists.infradead.org, wangkefeng.wang@huawei.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] arm64: kernel: Disable CNP on HiSilicon HIP09
Message-ID: <ah78iIqAqzfofnIG@willie-the-truck>
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
 <20260601112000.1145391-3-zengheng@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601112000.1145391-3-zengheng@huaweicloud.com>

On Mon, Jun 01, 2026 at 07:20:00PM +0800, Zeng Heng wrote:
> diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
> index b0db946568b7..02e0ee5c948c 100644
> --- a/arch/arm64/kernel/cpu_errata.c
> +++ b/arch/arm64/kernel/cpu_errata.c
> @@ -608,6 +608,14 @@ static const struct midr_range erratum_ac04_cpu_23_list[] = {
>  };
>  #endif
> 
> +#ifdef CONFIG_ARM64_WORKAROUND_DISABLE_CNP
> +static const struct midr_range cnp_erratum_cpus[] = {
> +	MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
> +	MIDR_ALL_VERSIONS(MIDR_HISI_HIP09),
> +	{},
> +};
> +#endif

Sashiko [1] points out that this means that
CONFIG_HISILICON_ERRATUM_162100125 now affects NVIDIA parts and
vice-versa for CONFIG_NVIDIA_CARMEL_CNP_ERRATUM.

The easiest fix is probably to guard the entries in the array above with
their respective config options? Otherwise, this all looks good to me.

Will

[1] https://sashiko.dev/#/patchset/20260601112000.1145391-1-zengheng@huaweicloud.com
