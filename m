Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F74273D8D;
	Sat, 14 Mar 2026 00:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773447342; cv=none; b=TVZI5uJ/Mj9iDQO5s123bYeZeyGBFXfm0gn4boLJiJtrmVwoMqHrsjm9ydamt2Os7bM1P52OSyY0Wx7oJh54guH/x9UGYxPno4CwDHpy8iKnUVVGjEtgxvs+HVnDjpXKWpTcYheKXuAftfNn8SMQjN7Wrevf8zLIgc9/0zWo4AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773447342; c=relaxed/simple;
	bh=H+DVZCknnQxJNOZCuxYnF/Kdq+Rwh+3D4CJnhoWGS1Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o1EQ7pVqVLhd5V/16XT4Ez20ev90p8ACyuLEjlrpFT4uBG2tB70wZvAYke0N3rU+SolGzPFPJBYs7mt652hxCJMRAErK+S3WLs5cOiMEJUky8TdzMSLcL4fr2aUe7x0p20EtlgyNSVOWqn7WkAdOmt5L47P8JKE38NW05GUS1jE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BFhIeNYi; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BFhIeNYi"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=fud12JFE9yTLa5C95mCUXCu4cUUCmlWdyz8oCAvsGxo=; b=BFhIeNYiydFZNzlIObtvRWfCN8
	2CTJcnixADc8Ey3mzr/fsQHBxfZyrQJzeCdCFuXrGIu4uQiaAYU1FZ3A6n/WL9I/hQMMfHsKvzqVg
	cg8pu1KiQVPLZliuAWzytXWRS0MkbuuO5YiX1G3GwHxmi5k4+h+zH2vm4eLjBI0ompMas+CI+ZtuM
	uj5cerxySiUbpaPC50JnvlmjKDID8bY6wygbmT9c3kqqUcb8+BtMsJYCCyHHNjS5dldIdjxj3fhKZ
	JhBAPtD8xhaVkeeK1EMxGwDqgQc1d50B2K0n4MMsT7lASH9Gojk0z6MeFYeVKrjBQ8udSMf2Y8cry
	KalWp90w==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1CfI-00000001LNL-2UQx;
	Sat, 14 Mar 2026 00:15:38 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH -next v2] Docs: add percpu-counter-tree to core-api index
Date: Fri, 13 Mar 2026 17:15:35 -0700
Message-ID: <20260314001535.1419596-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add percpu-counter-tree to the core-api index to prevent a docs warning:

Documentation/core-api/percpu-counter-tree.rst: WARNING: document isn't included in any toctree [toc.not_included]

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: fix Cc:list

Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/core-api/index.rst |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20260313.orig/Documentation/core-api/index.rst
+++ linux-next-20260313/Documentation/core-api/index.rst
@@ -57,6 +57,7 @@ Library functionality that is used throu
    min_heap
    parser
    list
+   percpu-counter-tree
 
 Low level entry and exit
 ========================
