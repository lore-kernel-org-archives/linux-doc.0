Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29CC29B8E0;
	Fri,  9 Jan 2026 06:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767939946; cv=none; b=rP5kcNrluCT1bLSVe6csrbFh6nWeVdqJuaSG5daf/WefOoGz1LQsvSJ6d1SQSfp/yAh5YIFIWTqe3a2E0I1h15QsqdLxjNGxtMxf1/B1WeEc+cUEOCtV6b6tHUS58uReTHXyDKSY7mCgHuaOEOflgQQa1I2Sio6Wz0K9SGi0tXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767939946; c=relaxed/simple;
	bh=Xl+QaIttFkGp/1s3dd6W8hQ7lh9WDmSDLC0JFD9JCq4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dSYMDtgLMIYz/tb1/M3CXluLWo8sLoqmVArj9EW3hC9til5+vtqHPH7fOc1+i7U26zmHv2O02CoJlq5DXBZwrLr/9irG622yzG/4ch/s5fxL8sJU9hAAFU/8KlQeMwVmnb5yqvuzHXuHqc60lpA5LkLEOwUcXCoZAtsvvJrFsIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=IrR/yjsw; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="IrR/yjsw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=4q
	7Sn9RU1aXiM9ptwL6dHdYjXW3fLAagaxXYGEC0XB0=; b=IrR/yjswoO1f26247S
	QIpzVz6oir83E7/K9vpIpEO8OAdJzn5NOQJJi0RBG9O0uR9XHg8lllIxoXPXPe+5
	yTpTssHp/ooXp6lOY98r1FfnkZVETUtXDAH6IT6VcfcNJ2Ligeb3dLI3S+hTWjUK
	ArxLltzDMSAqwUyCipdxAVcOo=
Received: from ubuntu24-z.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3P0wVn2Bpw14kFQ--.6242S2;
	Fri, 09 Jan 2026 14:24:22 +0800 (CST)
From: ranxiaokai627@163.com
To: surenb@google.com,
	vbabka@suse.cz,
	kent.overstreet@linux.dev,
	akpm@linux-foundation.org,
	david@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	rppt@kernel.org,
	mhocko@suse.com,
	corbet@lwn.net
Cc: linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ran.xiaokai@zte.com.cn,
	ranxiaokai627@163.com
Subject: [PATCH] alloc_tag: remove sysctl prefix from mem_profiling boot parameter
Date: Fri,  9 Jan 2026 06:24:19 +0000
Message-ID: <20260109062419.157284-1-ranxiaokai627@163.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3P0wVn2Bpw14kFQ--.6242S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF45Cw1kKrWrurWkXryrJFb_yoW8Cr1DpF
	4UWr1rGa95AryUCrn5J34IgryxWan7Ka17JanF9FW09wn0yF4ktrW8trWSvF1xXrZ7CF45
	Xr4IvFWxXr10ywUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pin2-UUUUUU=
X-CM-SenderInfo: xudq5x5drntxqwsxqiywtou0bp/xtbCxhZfq2lgnxbCJwAA3B

From: Ran Xiaokai <ran.xiaokai@zte.com.cn>

Boot parameters prefixed with "sysctl." are processed separately
during the final stage of system initialization via kernel_init()->
do_sysctl_args(). Since mem_profiling support should be parsed
in early boot stage, it is unsuitable for centralized handling
in do_sysctl_args().
Also, when CONFIG_MEM_ALLOC_PROFILING_DEBUG is enabled,
the sysctl.vm.mem_profiling entry is not writable and will cause
a warning. To prevent duplicate processing of sysctl.vm.mem_profiling,
rename the boot parameter to "mem_profiling".

Signed-off-by: Ran Xiaokai <ran.xiaokai@zte.com.cn>
---
 Documentation/mm/allocation-profiling.rst | 2 +-
 lib/alloc_tag.c                           | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/allocation-profiling.rst b/Documentation/mm/allocation-profiling.rst
index 316311240e6a..fe341d6da7b9 100644
--- a/Documentation/mm/allocation-profiling.rst
+++ b/Documentation/mm/allocation-profiling.rst
@@ -18,7 +18,7 @@ kconfig options:
   missing annotation
 
 Boot parameter:
-  sysctl.vm.mem_profiling={0|1|never}[,compressed]
+  mem_profiling={0|1|never}[,compressed]
 
   When set to "never", memory allocation profiling overhead is minimized and it
   cannot be enabled at runtime (sysctl becomes read-only).
diff --git a/lib/alloc_tag.c b/lib/alloc_tag.c
index 846a5b5b44a4..81b248196629 100644
--- a/lib/alloc_tag.c
+++ b/lib/alloc_tag.c
@@ -747,7 +747,7 @@ static int __init setup_early_mem_profiling(char *str)
 
 	return 0;
 }
-early_param("sysctl.vm.mem_profiling", setup_early_mem_profiling);
+early_param("mem_profiling", setup_early_mem_profiling);
 
 static __init bool need_page_alloc_tagging(void)
 {
-- 
2.25.1


