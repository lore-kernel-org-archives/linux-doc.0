Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27F304BDF;
	Mon,  6 Apr 2026 23:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517791; cv=none; b=Wb5/YJRfBTXp6Nn03NqkKZH+yeSmJhvfwGTirqCZ48MmP2BkWtI9GHDr80rmKCYJM991ZkOpTBRvsIICU3glRHEMDeH3a+iKlYWr+6/I1MyGALkEXJTBDNni6cDuzLldCKXGdpyBVRgQJULetI0vOF6ouW2AAXdpSbckrWgs3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517791; c=relaxed/simple;
	bh=TDR+i0Z5GEdjXxpEDkMQ16w9yzl53a1QJHKS+kArbgM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F0HfD5xEfve39BWZ1RJ8TxtpjL/ouLc6w6g6pVZgXOD+E7MQ2qkBCaAJgv3N65YZFWRMGlJARrNDvi7VDrm3UvPfsXi1SlJQWtxKK02cZy9Lx1KvIuhZJWYHlspgdKBkr3fNH3txfhQnguOaL88u8iZqTFKIkX0siqwaVele9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=krwxIrz4; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="krwxIrz4"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=uLZ+sz2ULaNa2r2JZeZNL1l0O2MgOhNKzAzik0yDKv8=; b=krwxIrz4SR6eoYbU75WQAvabU5
	7NnHQQDBLrZ9O40XEjqqFJ2C/9fW/p0T50u6hr3MqZcRnykYadeAyAiqK2I3aG2ltrZE0Cx5Ua29T
	eiLL8t6KCD0geocgJXotijzuqaxRyi/IjKg9f0kz91nKMiQfYWGbauwKYoBosmK8IwbYMdqtiXiV4
	f17iJ/yO3wo2cvL+NNMXZOujP88Tn9+IsiNvffupN/nt8oJlqqXwWZAOcjmF76eU12MCQLwMsOg7k
	tDBgaE2+JSU7FYYJOy3DiOx5BhCv8YWJ7vXizuKaDjkuM0pDzGY5Q+olPBDvS63gjmgWsnnISNI4V
	Uxr/Li8A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tHe-00000005bsT-1EQZ;
	Mon, 06 Apr 2026 23:23:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] riscv: Docs: fix unmatched quote warning
Date: Mon,  6 Apr 2026 16:23:04 -0700
Message-ID: <20260406232304.1892528-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

'make htmldocs' complains about ``prctrl` -- so add a second '`' to
avoid the warning.

Documentation/arch/riscv/zicfilp.rst:79: WARNING: Inline literal start-string without end-string. [docutils]

Fixes: 08ee1559052b ("prctl: cfi: change the branch landing pad prctl()s to be more descriptive")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Deepak Gupta <debug@rivosinc.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/arch/riscv/zicfilp.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260406.orig/Documentation/arch/riscv/zicfilp.rst
+++ linux-next-20260406/Documentation/arch/riscv/zicfilp.rst
@@ -78,7 +78,7 @@ the program.
 
 Per-task indirect branch tracking state can be monitored and
 controlled via the :c:macro:`PR_GET_CFI` and :c:macro:`PR_SET_CFI`
-``prctl()` arguments (respectively), by supplying
+``prctl()`` arguments (respectively), by supplying
 :c:macro:`PR_CFI_BRANCH_LANDING_PADS` as the second argument.  These
 are architecture-agnostic, and will return -EINVAL if the underlying
 functionality is not supported.
