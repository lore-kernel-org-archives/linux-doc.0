Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A054A6089B
	for <linux-doc@vger.kernel.org>; Tue, 30 Jan 2024 10:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706609819; cv=none; b=Hcfy8aatNmIU21K8MdF93yeSC6Gs7eZgl2tdwDPGCQnuGz2dEYa3PW5BUh2vXP/hMkD00twpoKoq8YUkAy47C6rmF2seovsrBHYj3r+FgWlXMaXBsQVimIhI46pY6EYBGttyZhFn1Kzow5VwECAzsTPGIvEMrjVGJRBC2E5QiFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706609819; c=relaxed/simple;
	bh=EDGuo0RUHFSwB70OalvBLp87OwyxACMnocj0LKt+v9I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ycbzp327wjT0LIQx73XltO6wGgPA1JmyvA9RZMTQqbzJFpPWXN+OCdvC9RWvYiUJeYNaX/KU6nEaiJY29EDR26j9YHUqf6w6t//bclD3vhrf1mXN6ixDvlMBEPBPS65VHut7wMHzW+VA2WfUOwIREzsSFVjsUJ42fJWCoraZVXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwCXncmUzLhlCFzqBA--.16832S2;
	Tue, 30 Jan 2024 18:16:52 +0800 (CST)
Received: from phytium.com.cn (unknown [218.76.62.144])
	by mail (Coremail) with SMTP id AQAAfwD3vn6KzLhltAoDAA--.37S3;
	Tue, 30 Jan 2024 18:16:43 +0800 (CST)
From: Xiong Yining <xiongyining1480@phytium.com.cn>
To: rmk+kernel@armlinux.org.uk
Cc: linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	jiahao.os@bytedance.com,
	wangyuquan1236@phytium.com.cn,
	chenbaozi@phytium.com.cn,
	Xiong Yining <xiongyining1480@phytium.com.cn>
Subject: Re:[PATCH v2 00/17] arm64 kernel text replication
Date: Tue, 30 Jan 2024 10:16:13 +0000
Message-Id: <20240130101613.3425933-1-xiongyining1480@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwD3vn6KzLhltAoDAA--.37S3
X-CM-SenderInfo: x0lr0wp1lqx0bjrumio6sk53xlxphulrpou0/1tbiAQAABmW3-fcGQwADsZ
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=xiongyinin
	g1480@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvdXoW7XryfWF17KFWrtw4DWrWfXwb_yoW3tFc_ZF
	WxZrykWrnrGFy09wnrtFW5tayrAa4F9r4UXrykWF1Ut34jvFnxZrs5G39xZa1rJrsrtrsI
	vFsxtr1UC39a9jkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8wcxFpf9Il3svdxBIdaVrnU
	Uv73VFW2AGmfu7jjvjm3AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUU
	UUUU=

Hi, Russell

>
> Needless to say, the performance results from kernel text replication
> are workload specific, but appear to show a gain of between 6% and 
> 17% for database-centric like workloads. When combined with userspace
> awareness of NUMA, this can result in a gain of over 50%.
>

Tested-off-by: Xiong Yining <xiongyining1480@phytium.com.cn>
Tested-off-by: Yuquan Wang <wangyuquan1236@phytium.com.cn>

Sorry for disturbing. This time I have applyed this patch on a real NUMA machine 
through "-ktext=1" linux options and successfully booted. With a database-centric 
performance test, it shows the patch will provide some improvement near 10%. However, 
since I am unfamiliar with numa performace test, could you support more details or 
suggestions on how to get the "gain of over 50%"?

Many thanks
Yining

