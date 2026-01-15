Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4AE282EB;
	Thu, 15 Jan 2026 06:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768459678; cv=none; b=X57f004RcC4nORAsoCaP/ylqR2ZjCDvkXYlYUaPttHIFQ8x3LRIbt5wDbyBjN5F06tXG9SFDulXeMYzK9cwGp940bUYpuMNPzN4N1hkkrpn2Yzi/lBxX4Y0oxGozadGomutV90Z9pqlZ/qKQ/B3woHlRkPQMs5NRGqk42w/vFow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768459678; c=relaxed/simple;
	bh=oDLvYGJrdViK5ppA5IPeKs7Gae0fYg9Dz5ORqGmzE2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ESC0MIo7bQH/EF0sy1Y8gZnPoe8K8AO2q53fIM6JnYZPr5A9WCNKwP/O64uaHjpcRGLZBnT44DuGX2OvFB3zwKCLctBj9E/T1WAuJ1Fe28epYuprbv5mlpotyraJshlh06fIgVaaAXNtNybQ8rqpcBD1KxnPm8f8Hvd9YRKjKuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fBOmSDme; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fBOmSDme"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=r4ZYrndUdmykkWpA2HDaycS96f9Fhc4y1mchGGN3DBc=; b=fBOmSDme2BV0U1fVglIPoNbB3o
	0Ob/M+MbXeSMisJBSx6D56ZwCy4fdqPCwyRhD2pl5HA0tRH5Xs+pc8WnaWk0DEJKBfN92ygGt8Lhx
	/CdmNYEiOdcWUoMW2fj42uDSnfWEPqBZybA7VdPNTXalm14GITY9DQeXXaEVmzOZOTxikCq+pUz9U
	mAtzGSVZ+Qq6gZNSxBqqy3G0eunHaBjpJzlvbwkwgZjuQ+s6Ea7iFtC44Vos7Q6Qf/L2/BpZVEJvM
	2UuLwSoHISHUoZ0zJ54qWVoGZx4pT3v1jhPB4zLMEyrSNDcNUV/9SV/Y/O5UgmAVngGU6e8XeCOrE
	iHn3Qbvg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgH9A-0000000Bsbp-3noK;
	Thu, 15 Jan 2026 06:47:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v4] kernel-chktaint: add reporting for tainted modules
Date: Wed, 14 Jan 2026 22:47:56 -0800
Message-ID: <20260115064756.531592-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check all loaded modules and report any that have their 'taint'
flags set.  The tainted module output format is:
 * <module_name> (<taint_flags>)

Example output:

Kernel is "tainted" for the following reasons:
 * externally-built ('out-of-tree') module was loaded  (#12)
 * unsigned module was loaded (#13)
Raw taint value as int/string: 12288/'G           OE      '

Tainted modules:
 * dump_test (OE)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Thorsten Leemhuis <linux@leemhuis.info>
---
v2: change tainted modules output a bit (Thorsten);
v3: add Acked-by from Thorsten (forgot it on v2);
    more changes as suggested by Thorsten;
v4: no changes, just resend.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Thorsten Leemhuis <linux@leemhuis.info>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 tools/debugging/kernel-chktaint |   18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

--- linux-next-20251210.orig/tools/debugging/kernel-chktaint
+++ linux-next-20251210/tools/debugging/kernel-chktaint
@@ -211,9 +211,25 @@ else
 	addout "J"
 	echo " * fwctl's mutating debug interface was used (#19)"
 fi
+echo "Raw taint value as int/string: $taint/'$out'"
+
+# report on any tainted loadable modules
+[ "$1" = "" ] && [ -r /sys/module/ ] && \
+	cnt=`grep [A-Z] /sys/module/*/taint | wc -l` || cnt=0
 
+if [ $cnt -ne 0 ]; then
+	echo
+	echo "Tainted modules:"
+	for dir in `ls /sys/module` ; do
+		if [ -r /sys/module/$dir/taint ]; then
+			modtnt=`cat /sys/module/$dir/taint`
+			[ "$modtnt" = "" ] || echo " * $dir ($modtnt)"
+		fi
+	done
+fi
+
+echo
 echo "For a more detailed explanation of the various taint flags see"
 echo " Documentation/admin-guide/tainted-kernels.rst in the Linux kernel sources"
 echo " or https://kernel.org/doc/html/latest/admin-guide/tainted-kernels.html"
-echo "Raw taint value as int/string: $taint/'$out'"
 #EOF#
