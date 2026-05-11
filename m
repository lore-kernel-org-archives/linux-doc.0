Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216D62727F3;
	Mon, 11 May 2026 06:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778480275; cv=none; b=vADkmiw8me7wBGov+uL2dcEgmvTAdrgDaSpsIg1L+Nf+LgdL8EXHQ78ThjDlV8ABOje2l0/TDPlJSKmQ3X/OAfJ+aTb0pibwPyBspQIQRuqkKY/UF8mvtMOOAa123y+gFBM5DqlnOan/67vuYh+8lXyK4iVOdRRLvBwTgdyoXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778480275; c=relaxed/simple;
	bh=aV2L4OqWcARzbAf8U3qv6EXLlyObHFpzuN20mpGcuZ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=AM3e1ISeY8UMhsNLwJTMGwkKc2PAnlcWLqAW/XW7G8GzcnkXlnzwkiz1zSbgS1dPwmPospCJlpg9mKHpmn58GuRawWKrZdsHDKux2lW40jdWiLDeYjXRKyx9oYMh4KQIlBwPwCGbJaex2lr7I4vfpeNSTulWQQeLRdDEEMEXQsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=vkCWZNm+; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="vkCWZNm+"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=np+ARTjgA1bL6y/BsjDkZjVFrHrr3tuq6B1vzrJgeSI=;
	b=vkCWZNm+0ckIAvYiUx4kG2HndOxd0/rmJMyuW4xaGIPEPRzRrGpswwlnUVoefd5DUweMpH9Sc
	DXW+/oY5S/FKioyTaBP3XtKZ0XEErkQeZ0nnLI1ulZIAnLhLEpz+GKk1YCNtISf050ExxX7oR6H
	y/FUvmE7fxdy3V4i1jkYzSM=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gDTqb22mNzpStP;
	Mon, 11 May 2026 14:10:51 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 0450840537;
	Mon, 11 May 2026 14:17:49 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 11 May 2026 14:17:47 +0800
Message-ID: <bf8f55b7-1e0a-4b24-b11b-c92f7129eb82@huawei.com>
Date: Mon, 11 May 2026 14:17:47 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: Update nosmt support for arm64
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>,
	<akpm@linux-foundation.org>, <bp@alien8.de>, <rdunlap@infradead.org>,
	<pmladek@suse.com>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <safinaskar@gmail.com>, <bhelgaas@google.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<skelley@nvidia.com>
References: <20260417032540.3720627-1-ruanjinjie@huawei.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260417032540.3720627-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)

Gentle ping.

On 4/17/2026 11:25 AM, Jinjie Ruan wrote:
> commit eed4583bcf9a6 ("arm64: Kconfig: Enable HOTPLUG_SMT") enable
> HOTPLUG_SMT for SMT control for arm64, but the documentation was
> not updated accordingly to reflect that ARM64 now supports control SMT
> via boot parameter and sysfs knobs:
> 
> 1. Boot parameters:
> 
> nosmt:          Disable SMT, can be enabled via sysfs knobs.
> nosmt=force:    Disable SMT, cannot be enabled via sysfs knobs.
> 
> 2. Runtime sysfs controls:
> 
> Write "on", "off", "forceoff" or the number of SMT threads (1, 2, ...)
> to /sys/devices/system/cpu/smt/control.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index cb850e5290c2..6a73eb5abae9 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4661,7 +4661,7 @@ Kernel parameters
>  	nosmt		[KNL,MIPS,PPC,EARLY] Disable symmetric multithreading (SMT).
>  			Equivalent to smt=1.
>  
> -			[KNL,LOONGARCH,X86,PPC,S390] Disable symmetric multithreading (SMT).
> +			[KNL,LOONGARCH,X86,ARM64,PPC,S390] Disable symmetric multithreading (SMT).
>  			nosmt=force: Force disable SMT, cannot be undone
>  				     via the sysfs control file.
>  

