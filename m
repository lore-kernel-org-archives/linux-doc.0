Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B82237FF69;
	Fri, 13 Mar 2026 09:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393662; cv=none; b=nHZdMh0Uv0x9L7bbVC97hcJvSO4VyGU11jkFt+ZIyoC8AU7bPV0+m6vj+ESgY2d9Q3Aud3NVjMHQVTqp6+xV2H/BfDsfiYM9v3++QeugTwhotvE+WHCeHF4GnpSzkbwZvqoYaN9j/+a1xXCotaXyRHfTpdwaewujssKyYm0sTuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393662; c=relaxed/simple;
	bh=10IlqomPf6vjHM7K8EPRC0Bq+NZP7hJrrAoAnSGokQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dA8sz5+2g20g7359hYmcu8NbnMuipT84RU4tzohzYSYBJdKAK186dcH+YpxsrxDfM5i7G98eKvzNAygS717iA2OYbvhKD9GnIj/Zi36fCFKvyVvO335L2pBhLZxkf7d5gtp3T0pTfWGLTwARsrAJGhO7BTVcNPgSeYnYLfpiUPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass smtp.mailfrom=isrc.iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=isrc.iscas.ac.cn
Received: from Mobilestation.localdomain (unknown [183.6.60.7])
	by APP-03 (Coremail) with SMTP id rQCowACHqeDN1rNp8DWJCg--.26183S2;
	Fri, 13 Mar 2026 17:20:35 +0800 (CST)
From: Yao Zihong <zihong.plct@isrc.iscas.ac.cn>
To: andybnac@gmail.com
Cc: alex@ghiti.fr,
	eric.lin@sifive.com,
	greentime.hu@sifive.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	nick.hu@sifive.com,
	nylon.chen@sifive.com,
	paul.walmsley@sifive.com,
	pjw@kernel.org,
	samuel.holland@sifive.com,
	vincent.chen@sifive.com,
	yongxuan.wang@sifive.com,
	zong.li@sifive.com
Subject: Re: [PATCH v2 0/1] update riscv prctl for discovering V extension
Date: Fri, 13 Mar 2026 17:19:52 +0800
Message-ID: <20260313092012.64446-1-zihong.plct@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260117233228.36088-1-andybnac@gmail.com>
References: <20260117233228.36088-1-andybnac@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowACHqeDN1rNp8DWJCg--.26183S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYg7k0a2IF6F1UM7kC6x804xWl14x267AK
	xVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUJVWUGw
	A2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26r1j
	6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2z280aVAFwI0_Jr
	0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r4UJwAS0I0E0xvYzxvE52x082IY62kv
	0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z2
	80aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4IIrI8v
	6xkF7I0E8cxan2IY04v7MxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I0En4kS14v26r1q6r
	43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRAxhl7UUUUU==
X-CM-SenderInfo: p2lk00vjoszunw6l223fol2u1dvotugofq/

Hi all,

It has been a while since the last activity on this thread,
so I would like to gently ping for comments.

Thanks,
Zihong

