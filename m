Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B39C1755A;
	Wed, 13 Mar 2024 08:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710317047; cv=none; b=upv6rFm4l3BdXRpYgwgSXETKIlBwBV7DwkGUyJiJ+3tW+5xJH3WGQn/dDSZBar+E5qklIQHEqCg9rGWoHMx6vs+6Bm/uugNLZSpAxl3bxm816hF59nGAE+3+fBmkaR7QNSNtOz9DMDcfVcEum/OjcwJCjbnwVssI1KLfrd2XxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710317047; c=relaxed/simple;
	bh=yrSCxCS/GLJ9fPlFDgMgjQRMYw71mCMP96p0sJeyZhE=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=JcnVZNciy9dBc2cAtNGsEAZ4E+xe3x2NWE95aiw4A6tNFTdbwKchv2KSs6Ss+RYXN15Sc1234Y1GRLmGT90/vncbOmRHeQ0HGWFJpPQKkDoBFViIv9LXj3mqs+xjNoQJ4anLPzPKCQVE4n/8IRZZZbGq5/Sgy94cWPPUH6yiCHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TvjfB2WpyzNm1k;
	Wed, 13 Mar 2024 16:02:10 +0800 (CST)
Received: from dggpemm500005.china.huawei.com (unknown [7.185.36.74])
	by mail.maildlp.com (Postfix) with ESMTPS id ED6CC140410;
	Wed, 13 Mar 2024 16:03:55 +0800 (CST)
Received: from [10.69.30.204] (10.69.30.204) by dggpemm500005.china.huawei.com
 (7.185.36.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.35; Wed, 13 Mar
 2024 16:03:55 +0800
Subject: Re: [PATCH net] docs: networking: fix indentation errors in
 multi-pf-netdev
To: Jakub Kicinski <kuba@kernel.org>, <davem@davemloft.net>
CC: <netdev@vger.kernel.org>, <edumazet@google.com>, <pabeni@redhat.com>,
	Stephen Rothwell <sfr@canb.auug.org.au>, <corbet@lwn.net>,
	<przemyslaw.kitszel@intel.com>, <tariqt@nvidia.com>, <saeedm@nvidia.com>,
	<linux-doc@vger.kernel.org>
References: <20240313032329.3919036-1-kuba@kernel.org>
From: Yunsheng Lin <linyunsheng@huawei.com>
Message-ID: <85582a98-6579-84f3-cd93-c769cf1043f9@huawei.com>
Date: Wed, 13 Mar 2024 16:03:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240313032329.3919036-1-kuba@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500005.china.huawei.com (7.185.36.74)

On 2024/3/13 11:23, Jakub Kicinski wrote:

...

>  
> -Here you can clearly observe our channels distribution policy:
> +Here you can clearly observe our channels distribution policy::

If the double ':' above is intended?
