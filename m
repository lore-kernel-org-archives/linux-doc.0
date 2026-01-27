Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7BA222CBF1
	for <linux-doc@vger.kernel.org>; Tue, 27 Jan 2026 22:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553976; cv=none; b=H1ZL11n2hvHHizVag1e5utdd4c2AmF/MmEZNHoEw7qd5RFxGsp3hLrlO8UjNJOTCg26nN8v/GS3XUJwABmtdWV7LVqWQ1XGdb9ri9OdBDrlyDfZ4ZxEYIY0f5OhzlB5org83oEKV5bpMZLpmHJSQwaiVLrD6n64ydt4hakitLt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553976; c=relaxed/simple;
	bh=zvKN5hn5ndmpw1cLuKYPFjezIoR31DnrFkQf9bzVQHQ=;
	h=MIME-Version:Date:From:To:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=JZQEFffd668Z07Ak3JI3KJhFs8dUKwkigCwI9cm0bXAS1Ghvwg+iICZwYrslqGYnWWzdsYr4TOMiYh8kbW+UJD9BMg9Bt+KFwT93awi7DhJDKbGhhmFsXMGO7s+Xl2Wt8hKD7AdQlrog6We/dCjsT3JaLNN7rJvDTQn/ZKDhs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElPq/lxB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElPq/lxB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF173C116C6;
	Tue, 27 Jan 2026 22:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769553975;
	bh=zvKN5hn5ndmpw1cLuKYPFjezIoR31DnrFkQf9bzVQHQ=;
	h=Date:From:To:In-Reply-To:References:Subject:From;
	b=ElPq/lxB/d3QfC3uxLJ9dnNSbJs8YfRNs9DCYQJYRugGpjRUM1Q9CvqLSIWeYF4jc
	 FA0QOzqIKjWVjxrrvHzpfxCTu35fiheMbZo6j5WJKK8W5aqS8zVXflJHZPQXXLAJvT
	 DJxzUyUgppWEpUHd/F6ypNFG9GSsJn95xRqaFUgQ1eV3gTggBp/Y3mJqxNavbNvR79
	 XHIcTDJ+94LlXDLKqXLDtDuZvWv0GuoRVfpsNik/6aFpcPoC92ZgNlgep+Vk7JO+AT
	 on5rSJbudVUi5/ERVBrUMTT0XTVzQx7ncu4yqxkCd+stLX271yM06Tom1cE461C0Hz
	 iORHFIN+dyVVg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id BC668F40068;
	Tue, 27 Jan 2026 17:46:13 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Tue, 27 Jan 2026 17:46:13 -0500
X-ME-Sender: <xms:NUB5ae2IGW5D5GINlxHhxXeDTk2ACKGrIDA14Dk4cs7yHgdpAc-dJw>
    <xme:NUB5ab4O7239Ra12h3tTGxHWhilaUFI6tlubOq4qOfpmQn-eTHWzG-VMZeIbgZ2kx
    2lVm_Vp6a7p_JwS4LWhnCUB7UZBO4Etv30GrRiNivivKrGWOCJuiJs2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduiedujedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvffkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhguuceu
    ihgvshhhvghuvhgvlhdfuceorghruggssehkvghrnhgvlhdrohhrgheqnecuggftrfgrth
    htvghrnhepgfeiveehfedvudfgteeuleekuedtjeethefhgfeifffgvdeggfeugfeujeeu
    tdfgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrugdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeijedthedttdejledq
    feefvdduieegudehqdgrrhgusgeppehkvghrnhgvlhdrohhrghesfihorhhkohhfrghrug
    drtghomhdpnhgspghrtghpthhtohepvdejpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhm
    rdgtohhmpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdprhgtphhtthhopehlih
    hrohhnghhqihhnghessggrihguuhdrtghomhdprhgtphhtthhopehlvghithgrohesuggv
    sghirghnrdhorhhgpdhrtghpthhtohepohhsrghnughovhesfhgsrdgtohhmpdhrtghpth
    htoheptghfshifohhrkhhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghhvghlghgr
    rghssehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:NUB5adwUxbMRbGq4X6gcsMJp4xyQVRwkd-8fXzdP85jPnd9XPLYRlw>
    <xmx:NUB5aWeTKO51MWz_syIVMFuUI9pY7rDw8F7iAJtYBqB8qh62sxsaSQ>
    <xmx:NUB5aRcuVw6wExzVwslJqvPunsW84HVtLKjk_bp6b2N6aHTQnf5TTg>
    <xmx:NUB5aQad3hrJJrtefTOazYHRl_EVkdBfnGJrQAXSe8n5Ts0OmTVPjQ>
    <xmx:NUB5aa8pH0wq3VxGXnJPQvFrR2xmVW5bnzGReMnoTt2rQe4pJQ905RxF>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9468F700065; Tue, 27 Jan 2026 17:46:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AI0CEnD8AI8k
Date: Tue, 27 Jan 2026 23:45:53 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Jinjie Ruan" <ruanjinjie@huawei.com>, leitao@debian.org, corbet@lwn.net,
 catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
 bp@alien8.de, mingo@kernel.org, pawan.kumar.gupta@linux.intel.com,
 feng.tang@linux.alibaba.com, "Kees Cook" <kees@kernel.org>, elver@google.com,
 arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com, bhelgaas@google.com,
 bhe@redhat.com, dave.hansen@linux.intel.com, rppt@kernel.org,
 cfsworks@gmail.com, osandov@fb.com, sourabhjain@linux.ibm.com,
 jbohac@suse.cz, "Ryan Roberts" <ryan.roberts@arm.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Message-Id: <a6947d82-d7e3-414c-ac29-1a27257f379f@app.fastmail.com>
In-Reply-To: <20260126081334.699147-1-ruanjinjie@huawei.com>
References: <20260126081334.699147-1-ruanjinjie@huawei.com>
Subject: Re: [PATCH v2] arm64: kexec: Add support for crashkernel CMA reservation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On Mon, 26 Jan 2026, at 09:13, Jinjie Ruan wrote:
> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel=3D command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
>
> Crash kernel memory reservation wastes production resources if too
> large, risks kdump failure if too small, and faces allocation difficul=
ties
> on fragmented systems due to contiguous block constraints. The new
> CMA-based crashkernel reservation scheme splits the "large fixed
> reservation" into a "small fixed region + large CMA dynamic region": t=
he
> CMA memory is available to userspace during normal operation to avoid
> waste, and is reclaimed for kdump upon crash=E2=80=94saving memory whi=
le
> improving reliability.
>
> So extend crashkernel CMA reservation support to arm64. The following
> changes are made to enable CMA reservation:
>
> - Parse and obtain the CMA reservation size along with other crashkern=
el
>   parameters.
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> - Include the CMA-reserved ranges for kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore.
>
> Update kernel-parameters.txt to document CMA support for crashkernel on
> arm64 architecture.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Free cmem in prepare_elf_headers()
> - Add the mtivation.
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>  arch/arm64/kernel/machine_kexec_file.c          | 15 ++++++++++++++-
>  arch/arm64/mm/init.c                            |  5 +++--
>  3 files changed, 18 insertions(+), 4 deletions(-)
>

Thanks for respinning the commit log.

I am not an expert but this looks reasonable to me, so

Acked-by: Ard Biesheuvel <ardb@kernel.org>


> diff --git a/Documentation/admin-guide/kernel-parameters.txt=20
> b/Documentation/admin-guide/kernel-parameters.txt
> index 1058f2a6d6a8..36bb642a7edd 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1119,7 +1119,7 @@ Kernel parameters
>  			It will be ignored when crashkernel=3DX,high is not used
>  			or memory reserved is below 4G.
>  	crashkernel=3Dsize[KMG],cma
> -			[KNL, X86, ppc] Reserve additional crash kernel memory from
> +			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
>  			CMA. This reservation is usable by the first system's
>  			userspace memory and kernel movable allocations (memory
>  			balloon, zswap). Pages allocated from this memory range
> diff --git a/arch/arm64/kernel/machine_kexec_file.c=20
> b/arch/arm64/kernel/machine_kexec_file.c
> index 410060ebd86d..ef6ce9aaba80 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -48,7 +48,7 @@ static int prepare_elf_headers(void **addr, unsigned=20
> long *sz)
>  	u64 i;
>  	phys_addr_t start, end;
>=20
> -	nr_ranges =3D 2; /* for exclusion of crashkernel region */
> +	nr_ranges =3D 2 + crashk_cma_cnt; /* for exclusion of crashkernel re=
gion */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
>=20
> @@ -64,6 +64,12 @@ static int prepare_elf_headers(void **addr, unsigne=
d=20
> long *sz)
>  		cmem->nr_ranges++;
>  	}
>=20
> +	for (i =3D 0; i < crashk_cma_cnt; i++) {
> +		cmem->ranges[cmem->nr_ranges].start =3D crashk_cma_ranges[i].start;
> +		cmem->ranges[cmem->nr_ranges].end =3D crashk_cma_ranges[i].end;
> +		cmem->nr_ranges++;
> +	}
> +
>  	/* Exclude crashkernel region */
>  	ret =3D crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.e=
nd);
>  	if (ret)
> @@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigne=
d=20
> long *sz)
>  			goto out;
>  	}
>=20
> +	for (i =3D 0; i < crashk_cma_cnt; ++i) {
> +		ret =3D crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	ret =3D crash_prepare_elf64_headers(cmem, true, addr, sz);
>=20
>  out:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 524d34a0e921..28165d94af08 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>=20
>  static void __init arch_reserve_crashkernel(void)
>  {
> +	unsigned long long crash_base, crash_size, cma_size =3D 0;
>  	unsigned long long low_size =3D 0;
> -	unsigned long long crash_base, crash_size;
>  	bool high =3D false;
>  	int ret;
>=20
> @@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
>=20
>  	ret =3D parse_crashkernel(boot_command_line, memblock_phys_mem_size(=
),
>  				&crash_size, &crash_base,
> -				&low_size, NULL, &high);
> +				&low_size, &cma_size, &high);
>  	if (ret)
>  		return;
>=20
>  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
> +	reserve_crashkernel_cma(cma_size);
>  }
>=20
>  static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
> --=20
> 2.34.1
