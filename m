Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898DCEEBA;
	Thu,  9 Jul 2026 00:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783558272; cv=none; b=Y86MO/LBbEDOd3I0uj/AngGkA4h1oU8h9DZmW1Mglk8UKpP8FyqmRL7qTFjNdiCcdy36aBM5SkOh0DeRZfuEzGbmC1WcVkXgHNowVpvOYPmheQntgY5/DplmZ3nRm54g/3V4ivE8HPOauDK749YZgEdHL50HGoIuNmTbSq9e2lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783558272; c=relaxed/simple;
	bh=KSszxMiJiXS5y7SLoUbAL27pIAYUuy5gmG4VGaBZTJA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aD3lYVCfXIIRKBLit3mzJbG1ZXoKAMylSh3qxXV+ep5NSCx1xs2FBJgBbXJOhywylBImMQenZBdqEXc1dttDK6i+z7nqFCBnF4RfV4Wc1c7HXE6SZEVLUswknq2/7TFSlpFybLEbvA51JlH9uea/573HX9K0ck/5/7F0QdPviZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1afRHMQR; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1afRHMQR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=dDLpXWjRgmPSM3Fa97/QhPgUW9+7tqfKJ/FRhtnyylo=; b=1afRHMQRFE8hXUkpFYukwFLfa4
	Fkcify34t7Dyd25cjLSwSQVcIatJnjwp9qhjbKSQNNgg7CCeDfvopnA170ysAnbCNvaP6CsAlmXA7
	2aV0zp2qT+Dbsj+rlUCB4AxHQqgSPoiEDBzCTfLfKYrXlNLjag1F0TMxMOjAliprX0AO6l4q55ICz
	8R+fwxEf0oi4/Fu8P266A8zLGeu2todk2iVjrlC9C0CCbsITC9K+SHhhG7w/ycNCPMf4xPU6+C8Wb
	VyThyVIJJohla8SEPKI4tIaIxP6rJAgFFbyjo5pt5PAJDq+Vj1dGNg6WqfGxhkQmWej64V5mcwgJc
	m1cF/aNg==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcyn-00000000g9v-2gw0;
	Thu, 09 Jul 2026 00:51:05 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Wang Yaxin <wang.yaxin@zte.com.cn>,
	Fan Yu <fan.yu9@zte.com.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] delaytop: fix a bunch of docs build problems
Date: Wed,  8 Jul 2026 17:51:04 -0700
Message-ID: <20260709005104.501556-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add one space before '('.
Use a literal block for the last output example,
thus repairing all of these warnings:

Documentation/accounting/delay-accounting.rst:236: ERROR: Unexpected indentation. [docutils]
Documentation/accounting/delay-accounting.rst:237: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/accounting/delay-accounting.rst:237: ERROR: Unexpected section title or transition.
  ------------------------------------------------------------------------ [docutils]
Documentation/accounting/delay-accounting.rst:239: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/accounting/delay-accounting.rst:243: ERROR: Unexpected indentation. [docutils]
Documentation/accounting/delay-accounting.rst:244: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/accounting/delay-accounting.rst:246: ERROR: Unexpected indentation. [docutils]
Documentation/accounting/delay-accounting.rst:247: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
Documentation/accounting/delay-accounting.rst:249: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
Documentation/accounting/delay-accounting.rst:246: ERROR: Unknown target name: "pool_workqueue". [docutils]


Fixes: 2b0b6072b11e ("delaytop: sort by max delay to highlight top latency processes")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Wang Yaxin <wang.yaxin@zte.com.cn>
Cc: Fan Yu <fan.yu9@zte.com.cn>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/accounting/delay-accounting.rst |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- linext-2026-0708.orig/Documentation/accounting/delay-accounting.rst
+++ linext-2026-0708/Documentation/accounting/delay-accounting.rst
@@ -181,7 +181,7 @@ Interactive keyboard controls during run
 	M - Toggle display mode (Default/Memory Verbose)
 	q - Quit
 
-Available sort fields(use -s/--sort or interactive command)::
+Available sort fields (use -s/--sort or interactive command)::
 
 	cpu(c)       - CPU delay
 	blkio(i)     - I/O delay
@@ -219,8 +219,8 @@ Advanced usage examples::
 
 
 
-delaytop add delay_max fields to track the maximum delay value for each delay type
-(cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy) per task.
+delaytop add delay_max fields to track the maximum delay value for each delay
+  type (cpu, blkio, irq, swapin, freepages, thrashing, compact, wpcopy) per task::
 
 	bash# ./delaytop -t cpu
 	System Pressure Information: (avg10/avg60/avg300/total)
