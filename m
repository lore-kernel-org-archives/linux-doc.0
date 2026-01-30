Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E782ECD34;
	Fri, 30 Jan 2026 11:21:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769772087; cv=pass; b=jUg970PWowbzW6VqtcqBpMI/19y1iqnxMN8A10oVMHLCbBPpPYTu2LKHrKQE+MXmHSz0ImUAGjro+AbDbuRuJcM6i+FdDA4m3ujsY5Aeip33FPVnYE3a5dLqeiKotZIXRTxQmxbOvB2G5Cscuhyygqh6QOkQ50w69RfxrvnBRok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769772087; c=relaxed/simple;
	bh=DGVabKFH8UGEJgUcFUNbVcc3JHLDW1u9Y0JezEqp3x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UEvwvlFmzi6LRTrc2JFwnzeGG7f9PTRPelLDS2/iSFR7trUpSgWuEU5F1t0MMSaEzOiKmw3EuOrg6jddQucvdfSMEs4XV6aMy1Ztc5xbJQzxZzJ8OCpT2XZFDVJQzKEFvMca3LhB6MMJdZSum0ldXibOq0jNGDk0Y1l28fs6NCc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty; spf=pass smtp.mailfrom=linux.beauty; dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b=XNJaEPPx; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.beauty
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.beauty
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.beauty header.i=me@linux.beauty header.b="XNJaEPPx"
ARC-Seal: i=1; a=rsa-sha256; t=1769772048; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PmVxWZAUVHfuB1MyInmd7/Dzor74I2D1d1e8o6XUVDkCsuDRrmXfBupTmjPTFJ0PvErVUe+CfQGRMrmJHqIdlYVNbNblW7m6LdPuUWEDt0M10H9tCr88JCB6RgZFbParX3NRfkzXk9OcrxM3cMEE1KUZ1oancDtauCNvrLn3Tj4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769772048; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u4kib6FTuBOhqyNpES95UtTHAvr5LDgH5pvceXESln0=; 
	b=OyaB5zinYL05iSWIqH8NOokzyMIaPyG5Mjxgh9ZXQGjGRdoxZuqFopc4SSa89DZdPidl+lMgAqACi+Abgw+9mNLPA1md8W5kfJx66v3ULyKDzcqxtHvkW/aNZZ0l+jPsJhQinmuSsok9dSILnZkyf0YjWGvvDJMRy9aCer2HPEg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=linux.beauty;
	spf=pass  smtp.mailfrom=me@linux.beauty;
	dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769772048;
	s=zmail; d=linux.beauty; i=me@linux.beauty;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=u4kib6FTuBOhqyNpES95UtTHAvr5LDgH5pvceXESln0=;
	b=XNJaEPPx87FztnH7+Qjg2+0I18cKEBlDnYuhsxkqDvLPJVdi1gAJ0UvALToK5h1u
	HSWzX4PBCNxnYagA0e1xSfL8b6GnJVL0+IXBxyeiKwBuWH0eeAPW7Zn1lI0Ukgku5XW
	pgZOeQDISZmnvLQSsEAh9t3k5jnmoE4RIsAZ4JFA=
Received: by mx.zohomail.com with SMTPS id 1769772045190695.2632564101885;
	Fri, 30 Jan 2026 03:20:45 -0800 (PST)
From: Li Chen <me@linux.beauty>
To: Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Kees Cook <kees@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frank van der Linden <fvdl@google.com>,
	Askar Safin <safinaskar@gmail.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Li Chen <me@linux.beauty>
Subject: [PATCH] Documentation: document liveupdate cmdline parameter
Date: Fri, 30 Jan 2026 19:20:33 +0800
Message-ID: <20260130112036.359806-1-me@linux.beauty>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

liveupdate is used to enable Live Update Orchestrator (LUO) early during
boot. Add it to kernel-parameters.txt so users can discover and use it.

Signed-off-by: Li Chen <me@linux.beauty>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 3097e4266d76..56a39f6e01e3 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3442,6 +3442,11 @@ Kernel parameters
 			If there are multiple matching configurations changing
 			the same attribute, the last one is used.
 
+	liveupdate=	[KNL,EARLY]
+			Format: <bool>
+			Enable Live Update Orchestrator (LUO).
+			Default: off.
+
 	lockd.nlm_grace_period=P  [NFS] Assign grace period.
 			Format: <integer>
 
-- 
2.52.0

