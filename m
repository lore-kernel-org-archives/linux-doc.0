Received: from azure-sdnproxy.icoremail.net (l-sdnproxy.icoremail.net [20.188.111.126])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC97293454
	for <linux-doc@vger.kernel.org>; Tue, 10 Jun 2025 12:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=20.188.111.126
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558717; cv=none; b=lDtuKBjH/WFEPSz5o4zbiQIjKobzc1ywJ7nHA9dR6uXXwAnXDHUjfzM9x/QouU7St7BgAh4WUh6+McVB1Bch3uIS+qCburjHy5Lv356LYZj15z5wdjLd8i4lJGQDhQpNmuuDS7UWm5xUF2X2uS3F9UP6n5cC+KWVvaZvvPwy538=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558717; c=relaxed/simple;
	bh=qBJLEPENx6zgqOHiH/ITykFDM/DFFL0Rzg5UfeD5cFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fp7WRB5cec256Pu5QW77EwxUbI11BqDza0kX3ESN/qwlKDIaebjhqd8DYfurr61GgQZtlgIpO+odgeUZIobI2AH+Upb7CuXOQmV5g5vjrKtHK5GaEle3VDUmiOluKGZbu2lmK5MeSjEqZ44q1/aTN78vbwEfOVzq4Rd3HuHRbQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=20.188.111.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABHTBR3JUho12TICg--.24282S2;
	Tue, 10 Jun 2025 20:30:47 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wB3Ykl1JUhobC0mAA--.19171S2;
	Tue, 10 Jun 2025 20:30:47 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH 0/5] update the translation of files in the process
Date: Tue, 10 Jun 2025 20:30:25 +0800
Message-ID: <cover.1749557444.git.dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABHTBR3JUho12TICg--.24282S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7JF4ruw15AFWUWw1DWFykKrg_yoW3urg_Za
	4kZ3yjyF4IyF9rtFW8Kr43ArW0yF4Y9FyDJF1DtayDJrsrKrWUXryUXwn5uryrWFZIkry5
	GrZ7WryfCF1fKjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbkAYjsxI4VW5JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41l42xK82IYc2Ij64vIr41l42xK82
	IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvj4RisqXUUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

Update the Chinese translation of process/1-7.*.rst.

Dongliang Mu (5):
  docs/zh_CN: update the translation of process/1.Intro.rst
  docs/zh_CN: update the translation of process/6.Followthrough.rst
  docs/zh_CN: update the translation of process/7.AdvancedTopics.rst
  docs/zh_CN: update the translation of process/2.Process.rst
  docs/zh_CN: update the translation of process/5.Posting.rst

 .../translations/zh_CN/process/1.Intro.rst         | 10 +++++-----
 .../translations/zh_CN/process/2.Process.rst       |  7 +++----
 .../translations/zh_CN/process/5.Posting.rst       | 11 +++++++++++
 .../translations/zh_CN/process/6.Followthrough.rst |  5 +++++
 .../zh_CN/process/7.AdvancedTopics.rst             | 14 ++++++++++++++
 5 files changed, 38 insertions(+), 9 deletions(-)

-- 
2.43.0

