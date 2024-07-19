Received: from azure-sdnproxy.icoremail.net (azure-sdnproxy.icoremail.net [52.237.72.81])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DB1610A0E
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 04:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.237.72.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721362871; cv=none; b=Zm1w9D+CiKDXgxz/hND1fLkcOLB1j22dOI45NQYjITlEZaKj2dcB7vfCTbH+YM0IkBUXVqrkx+SMnWnK5kobSVaxLVODvt48Aws7MbrMzLHBRPu/mJYLpo9aKBVKx+jaWOU4jBfcEp+1MzmFohalwAunYfgAZgGfQTa8hjNh+4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721362871; c=relaxed/simple;
	bh=QaeqEE2KOopVRP6CpIlKNpbtOgIadgmB0WZT6P/ushM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qvlFx0+6ccIOQdVc27hcFj/+WW/wyX/bU5PajhK2evcGZcQZc03QB+4QspVltpMc0zwHY4kSnq6Fi8//TeUtR/ndeKYCK/snCFr9Om1EM9MTe9sQNAFYqStIcWw5yipoQnVkLVDkD8C+ueWwWCcLSnsjQXexZMkJXbewgSpLDxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=52.237.72.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.50])
	by app1 (Coremail) with SMTP id HgEQrAAXeG0K6Jlmv2p4AQ--.46078S2;
	Fri, 19 Jul 2024 12:14:02 +0800 (CST)
Received: from pride-PowerEdge-R740.. (unknown [222.20.126.129])
	by gateway (Coremail) with SMTP id _____wAnhh4I6JlmCSoKAA--.20209S2;
	Fri, 19 Jul 2024 12:14:01 +0800 (CST)
From: Dongliang Mu <dzm91@hust.edu.cn>
To: chengziqiu@hust.edu.cn
Cc: linux-doc@vger.kernel.org,
	Dongliang Mu <dzm91@hust.edu.cn>
Subject: [PATCH v3 0/2] Fix checktransupdate.py and add help documents
Date: Fri, 19 Jul 2024 12:13:32 +0800
Message-ID: <20240719041400.3909775-1-dzm91@hust.edu.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrAAXeG0K6Jlmv2p4AQ--.46078S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoW7GFy8JF4rJr18XFy8CFWDXFb_yoW8Jry8pF
	yYkrWfuas8Kw4aqw1fG3yDZr43AFW8CF4YgF9rJwnxZF4Dtw4Fvr43K3WFv3yDGrWfZayY
	qrWYkrW09r9avFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBFb7Iv0xC_Ar1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAac4AC62xK8x
	CEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0U
	Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Cr0_Gr1UMcIj6x8Erc
	xFaVAv8VW8uFyUJr1UMcIj6xkF7I0En7xvr7AKxVW8Jr0_Cr1UMcvjeVCFs4IE7xkEbVWU
	JVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r
	4fZr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0piF1vhUUUUU=
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

This patch set fixes all the issues in the checktransupdate.py reported
by pylint, and add help documents in both English and Chinese.

v3:
1) fixes all the issues (not most) reported by pylint,
2) add the functionability to tackle documents that need translation,
3) add logging to adjust the logging level and log file
4) fix some issues by Yanteng and Jani

v2:
fix some issues according to Randy

v1:
This patch fixes most issues with the following contents:
- add or revise comments for all functions
- use format string suggested by python

Add help documentation of scripts/checktransupdate.py

Dongliang Mu (2):
  scripts: fix all issues reported by pylint
  doc-guide: add help documentation checktransupdate.rst

 Documentation/doc-guide/checktransupdate.rst  |  53 +++++
 Documentation/doc-guide/index.rst             |   1 +
 .../zh_CN/doc-guide/checktransupdate.rst      |  55 +++++
 .../translations/zh_CN/doc-guide/index.rst    |   1 +
 scripts/checktransupdate.py                   | 214 ++++++++++++------
 5 files changed, 251 insertions(+), 73 deletions(-)
 create mode 100644 Documentation/doc-guide/checktransupdate.rst
 create mode 100644 Documentation/translations/zh_CN/doc-guide/checktransupdate.rst

-- 
2.43.0

