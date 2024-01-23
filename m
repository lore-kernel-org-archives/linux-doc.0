Received: from zg8tmtyylji0my4xnjqumte4.icoremail.net (zg8tmtyylji0my4xnjqumte4.icoremail.net [162.243.164.118])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15D8C5C610
	for <linux-doc@vger.kernel.org>; Tue, 23 Jan 2024 10:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.164.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706006134; cv=none; b=DgTnXFgsZcEtBl3Cc/N2/ke28/h/rL7VMcyOlNuYDUp2R/BLIyr5dfGh53zX96xEPU0Pq0o4yNt8TGM5BItasJ0qDU67zmWa+2ZQk+tAduJp74eBQg5PdxRYldxFPMLuyTtmoSaWpCyvyQeYhNJ+NRAfmcg7wnPE/bTKZ+FT3AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706006134; c=relaxed/simple;
	bh=QnkUYy1GhMJEJtWXOR9e8HMrBZZ7EUS8om8v51ySMFk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=NPc6iP4rTdcbQXFsRBG2jZRvFVEkGF5b/l/6yOZgFkyHHQh9XyG8jO5udC7qMzCs1BK2uexFBfuJMsNuvd4CuTzLZgtvAa3vUXNiFOQB7yx6jJbrpI0GVPYD2wF9X8jYlTrOxi0WO3V23Kb8k6sk/HSv+mKgqwqXM6iFaa9/Lck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn; spf=pass smtp.mailfrom=phytium.com.cn; arc=none smtp.client-ip=162.243.164.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phytium.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phytium.com.cn
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
	by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwD3_gpmlq9l0YdkBA--.14750S2;
	Tue, 23 Jan 2024 18:35:18 +0800 (CST)
Received: from phytium.com.cn (unknown [123.150.8.50])
	by mail (Coremail) with SMTP id AQAAfwDn6dpflq9lJr4AAA--.749S3;
	Tue, 23 Jan 2024 18:35:13 +0800 (CST)
From: Yuquan Wang <wangyuquan1236@phytium.com.cn>
To: rmk+kernel@armlinux.org.uk,
	jiahao.os@bytedance.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re:[PATCH v3 00/19] arm64 kernel text replication
Date: Tue, 23 Jan 2024 18:35:09 +0800
Message-Id: <20240123103509.696983-1-wangyuquan1236@phytium.com.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAfwDn6dpflq9lJr4AAA--.749S3
X-CM-SenderInfo: 5zdqw5pxtxt0arstlqxsk13x1xpou0fpof0/1tbiAQANAWWuw2kG2QAAsz
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=wangyuquan
	1236@phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3UbIjqfuFe4nvWSU8nxnvy29KBjDU0xBIdaVrnUUvcSsGvfC2Kfnx
	nUUI43ZEXa7xR_UUUUUUUUU==

> 
> After applying these patches, we tested that our business performance
> increased by more than 5% and the NUMA node memory bandwidth was more
> balanced.
> 

I have successfully applied your patches on my arm64 linux. And I could 
start it with a qemu machine(virt). However, I don't know the way to test
the performance it brings to the kernel. Do you have some suggestions?

Hope I can get some helps here, any help will be greatly appreciated. 

Many thanks
Yuquan

