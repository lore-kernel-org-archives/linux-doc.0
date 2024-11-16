Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4249A4C8F
	for <linux-doc@vger.kernel.org>; Sat, 16 Nov 2024 02:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731725612; cv=none; b=DZm24lJx0sraLHMSVQ5LH4GiJFDTnfD1yTAuAj2A7XTPxApB/GxAfZcJpw/XbSrV10/GkONK9qKNdHeUlUE3pzrkVPPI1SwDxzpC3FmpLEdbBSXIuOmVpJlXIrXtLHOsA19lA1ivuoMrcUS6xi8s2je9cWIcbsV7g+cCu8gHJHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731725612; c=relaxed/simple;
	bh=8gKoxhmoRzTSv91JZywOGHXgPFXYHE0P3mG2WYVup1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=bQYSBhAA4Vqd2QA4A1kYN+k0zE9k4JwaWVCZ0tl8lEL6Vtp3QbhJeJ1HLt4B3ygnyMsPoJwjJmGpBU9HslzToNt0/exLca49GThMkyFa2yp2O1PGGmYMBCZyi8NAYZUt/AKOQFMX86B/iDWjXDOV+HZr8g5vwebIA/X+R+QKVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com; spf=pass smtp.mailfrom=hisilicon.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hisilicon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hisilicon.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Xqz1t4yNzz21kVN;
	Sat, 16 Nov 2024 10:52:02 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 23645140109;
	Sat, 16 Nov 2024 10:53:20 +0800 (CST)
Received: from [10.67.121.115] (10.67.121.115) by
 kwepemd200012.china.huawei.com (7.221.188.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 16 Nov 2024 10:53:19 +0800
Message-ID: <ae8ff0db-480b-0d7d-e2b9-ec81130e789d@hisilicon.com>
Date: Sat, 16 Nov 2024 10:53:18 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4] irqchip/gicv3-its: Add workaround for hip09 ITS
 erratum 162100801
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>, <maz@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<wangwudi@hisilicon.com>, <prime.zeng@hisilicon.com>, Nianyao Tang
	<tangnianyao@huawei.com>
References: <20241114082813.3865466-1-wangzhou1@hisilicon.com>
 <87msi0yscp.ffs@tglx>
From: Zhou Wang <wangzhou1@hisilicon.com>
In-Reply-To: <87msi0yscp.ffs@tglx>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200012.china.huawei.com (7.221.188.145)

On 2024/11/16 7:44, Thomas Gleixner wrote:
> On Thu, Nov 14 2024 at 16:28, Zhou Wang wrote:
> 
>> When enabling GICv4.1 in hip09, VMAPP will fail to clear some caches
>> during unmapping operation, which will cause some vSGIs lost.
>>
>> To fix the issue, invalidate related vPE cache through GICR_INVALLR
>> after VMOVP.
>>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
>> Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
> 
> This Signed-off-by chain is incorrect. Who authored the patch?
> 
> If Nianyao is the author then the changelog lacks a
> 
>    From: Nianyao ....
> 
> line right at the top.
> 
> If you both authored it, then this lacks a Co-developed-by tag.
> 
> See Documentation/process/... for further explanation.

Hi Thomas，

Thanks for pointing this.

We both author it, I will add a Co-developed-by tag like below and resend it:

Suggested-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Nianyao Tang <tangnianyao@huawei.com>
Signed-off-by: Zhou Wang <wangzhou1@hisilicon.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>

Best,
Zhou

> 
> Thanks,
> 
>         tglx
> .
