Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05853596E1;
	Fri,  6 Mar 2026 11:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772796530; cv=none; b=VwNrl39W3Fey28yXTPh41X8INAUsJLdjpLjWz1zo4RsiSJUNgN5CGvQ68KjcA6c9j74h4JwHJ+91P2bz+ZzMHwoI87qyiiLruz6iIPVwa3z8vJCZsUlsWUec+W2RAZ+N6ew2HC7CRC7pU1O3rhAFRwf0pt866FtbZR/VW1CDieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772796530; c=relaxed/simple;
	bh=Cf5Ri36aqGZAeA3gVwYv7tsS/cl+PXdpzlMVXeOVd1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KqhHTia90fCIz3rW2Q+1249yH4TssoCB76C2ni0bnBVZpscONeDFrxGUHbavNnvCXbOGgsXXfujSQPtftSj0Rp56dHom0mzUE5KV40di9idrIBts1T4NDVV45TvcgWVmRjKEm5RWq5DOE1hATuUVl0TFHCEqXG8jdqYL1qdoPUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=LnWQQVNy; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="LnWQQVNy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=4J
	BTRCBGa5ROeLIwLaPxKksydAUTfA05obJQkDOCbsg=; b=LnWQQVNyi5y/GIBzfF
	WpnpUoHBcvX+HseGqzedTjEz2pujuDzn2o91dScKHgmrJyfuDbJK893UJwa7I2Eo
	ky/pESt80mxw+7NzWPqPyG4ASUfgSf84fPzMGhe3HFg+8Ij+0cu+Vn1M7fbZx1Bg
	PULJUQyIjRsMvSyoMRYO4Du6w=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wAnZc8ouqppZ42WOA--.54025S2;
	Fri, 06 Mar 2026 19:27:38 +0800 (CST)
From: "rom.wang" <r4o5m6e8o@163.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundatio.org>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yufeng Wang <wangyufeng@kylinos.cn>
Subject: [PATCH] riscv: enable HAVE_IOREMAP_PROT
Date: Fri,  6 Mar 2026 19:27:34 +0800
Message-Id: <20260306112734.108186-1-r4o5m6e8o@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wAnZc8ouqppZ42WOA--.54025S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW8Jry3AF1fCFW7tr45GFg_yoW8XFW3pa
	y3ur9a9rnxZrn8CFWqgry7WrWUJas3G39Fgw10kay8Wr1DAFy8Z3sayFnxJFyUXFZ5WFW8
	WF9ag34Fya1jyrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U6OJrUUUUU=
X-CM-SenderInfo: 3uurkzkwhy0qqrwthudrp/xtbCzgq9M2mquir+agAA3N

From: Yufeng Wang <wangyufeng@kylinos.cn>

RISC-V has implemented pte_pgprot() and selects GENERIC_IOREMAP,
which provides a generic ioremap_prot() implementation. Enable
HAVE_IOREMAP_PROT to activate generic_access_phys() support, which
is useful for debugging (e.g., accessing /dev/mem via gdb).

Also update the architecture support documentation accordingly.

Signed-off-by: Yufeng Wang <wangyufeng@kylinos.cn>
---
 Documentation/features/vm/ioremap_prot/arch-support.txt | 2 +-
 arch/riscv/Kconfig                                      | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/vm/ioremap_prot/arch-support.txt b/Documentation/features/vm/ioremap_prot/arch-support.txt
index 1638c2cb17f1..c0a2d8f56046 100644
--- a/Documentation/features/vm/ioremap_prot/arch-support.txt
+++ b/Documentation/features/vm/ioremap_prot/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: | TODO |
     |     powerpc: |  ok  |
-    |       riscv: | TODO |
+    |       riscv: |  ok  |
     |        s390: |  ok  |
     |          sh: |  ok  |
     |       sparc: | TODO |
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..32b6aa8dece7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -113,6 +113,7 @@ config RISCV
 	select GENERIC_GETTIMEOFDAY if HAVE_GENERIC_VDSO && 64BIT
 	select GENERIC_IDLE_POLL_SETUP
 	select GENERIC_IOREMAP if MMU
+	select HAVE_IOREMAP_PROT if MMU
 	select GENERIC_IRQ_IPI if SMP
 	select GENERIC_IRQ_IPI_MUX if SMP
 	select GENERIC_IRQ_MULTI_HANDLER
-- 
2.34.1

