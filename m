Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95128946C;
	Mon, 16 Feb 2026 06:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771223854; cv=none; b=r90KXXWWcawoESHXyzD1Y5tf5KWWSnM3bR8xYfySRu6DruAJKUCQY7KtihBIu4gsQAzOnxauUBvfHNiLOfu3bDPj/B56E9qFCiy0iywudcxvqy5U79eYP4OKPcGnjlMuKAVtraSPcQggsZBN7bm4XA4y/16nDab/rkRdHpUXhmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771223854; c=relaxed/simple;
	bh=Xhkiutca+Sd+5ukm8nZDPsEdWoyAe7zko5DbSkPedvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVcaLD8fQIMA9tYYTPDB5IcVcoywCTpbVRUcbFGByHVP1odDhgQgpzpWX8xd8ucnOlupPWbi+azRr6ixORAGmEHBWIoYD56JCOLQgiMxOcTeyML9jx1k/1zz0WC97ag49x+a6ay329nhbJZ61TFVdzOWoyCBPvv8TBB2OzaV+TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BrhchNkZ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BrhchNkZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=WfIFegw59wH6+2nvb8K6oXw6l4iG6M2qjkp0LELe9aQ=; b=BrhchNkZYqnfrzMCxvg9IQw3g6
	2X6cHQQXkI0ijhAmcV+6nvd/u7z4UzjLC2tbqEHr5AOFwdTDeJjVh1iv2zRWU5ERhOH8LdyzBCoBu
	d2wl2PO6EDF1kcve+sTpdbW6N495SrbmXWxHxwxNj/9nagUrJfMpOFwyUlVP1ol6oh2Y3fm0tdUEn
	1qHhS16DLfYbWwvtnKP9lqQlx1oT0Pcw3CNOx8WjTXt4awgSj8ntUOK0TxLnkUw3XawBK3YGkIWk7
	wDVle1t+B2vg/U45WXNZlPp1oJKFqovNm/aTWeqyi3VnsfNMj94A2xYeKZcav8FaLAd+DNuAUlVLN
	k5TGB2qw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrsEb-000000062lu-2uRn;
	Mon, 16 Feb 2026 06:37:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	David Gow <davidgow@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2] docs: admin-guide: update tiny script for number of taint flags
Date: Sun, 15 Feb 2026 22:37:29 -0800
Message-ID: <20260216063729.2832770-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Account for 2 new taint flags being added by increasing the number of
bits handled by the tiny show-tainted-flags example script.

Fixes: 8eea4e744758 ("taint: Add TAINT_FWCTL")
Fixes: 2852ca7fba9f ("panic: Taint kernel if tests are run")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: David Gow <davidgow@google.com>
---
v2: rebase and resend

@Jason: the note that you asked to be added to kernel/panic.c has
already been merged: commit ed4bbe7e8fa1:
  Author: Randy Dunlap <rdunlap@infradead.org>
  Date:   Wed Oct 15 15:16:26 2025 -0700
    taint: add reminder about updating docs and scripts

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: David Gow <davidgow@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 Documentation/admin-guide/tainted-kernels.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20260213.orig/Documentation/admin-guide/tainted-kernels.rst
+++ linux-next-20260213/Documentation/admin-guide/tainted-kernels.rst
@@ -74,7 +74,7 @@ a particular type of taint. It's best to
 script, but if you need something quick you can use this shell command to check
 which bits are set::
 
-	$ for i in $(seq 18); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
+	$ for i in $(seq 20); do echo $(($i-1)) $(($(cat /proc/sys/kernel/tainted)>>($i-1)&1));done
 
 Table for decoding tainted state
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
