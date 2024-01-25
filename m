Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7713D8E
	for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 10:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706178186; cv=none; b=oGERxUXr3Sbkkmjyz2u4Ck4ZImHp+GjO7DOBoM/cJsJTb4szSYTdp0YTF2sJe/wFpWPvDW2Uw2fdrTqMMh70qsJiBmLCkafWOa2pMaSkZ4tPgXyBPksWNrmMTioe7DxEXGuvAj4qNvf1pbWs2loV0avrPHQkbKqhK4AcQaDbYRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706178186; c=relaxed/simple;
	bh=t1KsDiBUgMxQO9shposCqdN19x3KEx0vI3arWyop0ao=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jRvqQZNtrjkqKFZ1dZIdPH3VqVHadWguzdIvLH0V0jBUHmkr6Oyrkx8TuDoWsOuqshrKBRV1qNMgKUyIrNOgP90lvgReB75Yg/3lrcL8mGG2nmJ0BNUN6DpF/MHZFuyiDWD0Dl0rz7xkECwqs70i7YreprzHXiWVTGU0j5MK0D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwBnbcmCNrJlxzOQBA--.7235S2;
	Thu, 25 Jan 2024 18:22:58 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
	by mail (Coremail) with SMTP id AQAAfwBXe_1+NrJlOJwBAA--.2666S3;
	Thu, 25 Jan 2024 18:22:55 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: jiahao.os@bytedance.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re:[PATCH v3 00/19] arm64 kernel text replication
Date: Thu, 25 Jan 2024 18:22:51 +0800
Message-Id: <20240125102251.1302796-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwBXe_1+NrJlOJwBAA--.2666S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQAPAWWxZmUF7gAFs2
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
	1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

Hi, Russell & haojia

> 
> Kernel text replication performance test results depend on your
> workload. Different workloads will behave differently.And performance
> testing in a virtual machine is not very accurate.
>

Sorry for disturbing. Another problem is that how to verify this patches 
could really work on kernel? In other word, how to verify its function 
rather than the performance. Maybe one workable method is that adding some
print-info in the kernel code to check these patches?  


Many thanks
Yuquan

