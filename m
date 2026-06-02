Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623B532ED27;
	Tue,  2 Jun 2026 11:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780401301; cv=none; b=UP1AtwRv77NZKbv4JiPpJy2X6LBBALwureCAepLjJoEhL1Uf7/sQyWHzW3QfB7U+kVeVFxhPcs4vtIa/3Kd5BqUcKy+bN/ivffS+dO88Ha+P3ob+AH1JrNI6Il4JY8RIHQLikRZXoqoAmqIP4H+DBfGbto5Yf5AHUKZJTFNPKig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780401301; c=relaxed/simple;
	bh=/vqCoLRIp5gDDqwXh9CQG/2fw0eiCCOWrvjuOV7FXkI=;
	h=Message-ID:Date:From:MIME-Version:To:CC:Subject:References:
	 In-Reply-To:Content-Type; b=I0Za3K+IAHwOyh/d10ks78elEImvuOR9Vk+rc8vEG9hQQeGwzvMwo7De3HD/1pRqbN6HsBZO6ylbM2L3kM1JZTG+983Lhrl2Gr9OgBcRelCUVaEY2qenMjZCiw+Uxh7V2N4j5IBXivvNs3RMA3cGKjah2pd+fnD/5ksT2Yq5QHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=kCSs25zK; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="kCSs25zK"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=OwD+lgpE2AoLhKFDcRsw65OP9SHvdO8TEaJlMiwY/JQ=;
	b=kCSs25zKgZEtMkWRGXtsI5iFHf5hY1YumhNQ9Ajj590nDA0ypfxercxstpvqn+bbV2waaUDoF
	5ppPuy38elEKLQIrL5100KawPFZcj9d63m7gn4JAPaYp/TTY06I0qrKy05zRvbUthD7zTsph/G2
	SP6SkC/7tfxsWiYNI7FdOa0=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4gV8FJ5qvtz1cyVV;
	Tue,  2 Jun 2026 19:47:00 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 02C5240571;
	Tue,  2 Jun 2026 19:54:49 +0800 (CST)
Received: from kwepemq100003.china.huawei.com (7.202.195.72) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 19:54:48 +0800
Received: from [10.67.113.213] (10.67.113.213) by
 kwepemq100003.china.huawei.com (7.202.195.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 2 Jun 2026 19:54:47 +0800
Message-ID: <6A1EC487.9070702@hisilicon.com>
Date: Tue, 2 Jun 2026 19:54:47 +0800
From: Wei Xu <xuwei5@hisilicon.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:24.0) Gecko/20100101 Thunderbird/24.2.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
To: Zeng Heng <zengheng@huaweicloud.com>, <vladimir.murzin@arm.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>, <yangyicong@hisilicon.com>,
	<maz@kernel.org>, <yeoreum.yun@arm.com>, <miko.lenczewski@arm.com>,
	<james.clark@linaro.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<kuninori.morimoto.gx@renesas.com>, <lucaswei@google.com>,
	<catalin.marinas@arm.com>, <broonie@kernel.org>, <lpieralisi@kernel.org>,
	<thuth@redhat.com>, <kevin.brodsky@arm.com>, <tongtiangen@huawei.com>,
	<oupton@kernel.org>, <ryan.roberts@arm.com>, <mark.rutland@arm.com>,
	<will@kernel.org>, <Sascha.Bischoff@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <wangkefeng.wang@huawei.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<xuwei5@hisilicon.com>
Subject: Re: [PATCH v3 0/2] arm64: cpufeature: Add WORKAROUND_DISABLE_CNP
 capability
References: <20260601112000.1145391-1-zengheng@huaweicloud.com>
In-Reply-To: <20260601112000.1145391-1-zengheng@huaweicloud.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemq100003.china.huawei.com (7.202.195.72)

Hi Zeng Heng,

On 2026/6/1 19:19, Zeng Heng wrote:
> From: Zeng Heng <zengheng4@huawei.com>
> 
> v2: https://lore.kernel.org/all/20260529063132.766491-1-zengheng@huaweicloud.com/
> v1: https://lore.kernel.org/all/20260526015720.206854-1-zengheng@huaweicloud.com/
> 
> Changes in v3:
>   - Keep CONFIG_ARM64_WORKAROUND_DISABLE_CNP config and generalise
>     ARM64_WORKAROUND_DISABLE_CNP capability.
> 
> Changes in v2:
>   - Unify CNP disable workaround into ARM64_WORKAROUND_DISABLE_CNP
> 
> Zeng Heng (2):
>   arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
>   arm64: kernel: Disable CNP on HiSilicon HIP09
> 
>  Documentation/arch/arm64/silicon-errata.rst |  2 ++
>  arch/arm64/Kconfig                          | 20 ++++++++++++++++++++
>  arch/arm64/include/asm/cpucaps.h            |  4 ++--
>  arch/arm64/kernel/cpu_errata.c              | 17 ++++++++++++-----
>  arch/arm64/kernel/cpufeature.c              |  2 +-
>  arch/arm64/tools/cpucaps                    |  2 +-
>  6 files changed, 38 insertions(+), 9 deletions(-)
> 
> --
> 2.43.0
> 
> .
> 

Thanks, all looks good to me and tested with the 7.1.0-rc1 kernel.

Acked-by: Wei Xu <xuwei5@hisilicon.com>
Tested-by: Wei Xu <xuwei5@hisilicon.com>

Best Regards,
Wei
