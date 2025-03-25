Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FF61EB5B
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 08:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742890770; cv=none; b=oqpSYt5r2xsc9SRBIIK5ghjZCtx3C4nTZrbIhgli0Q//G8XUIJb2UQUC9IfzS/+z9cHdx3YZyaVRkMOlULqZ8eQRAMlBLg9Zp8dRqRtLuq7hhn5mG6TvaKRNa22yKrE0UHALGQ9wfLeRsLxyP6mZswQfnpsDgwbb2OjqYCE/zTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742890770; c=relaxed/simple;
	bh=Qi3n2UcX+IvJZ19UnaqwJjG+EcGUlkvdSSbw/rrpIqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXMOuIKPM/qUQQ6NfzdVXsBaw81FZ11a8hE2q2aCzpQtKUN99ZSUpeZ6Sg87GRdT7rzc7DZVtXg178htY2y+TZfK6lWfO9NDG28ZdIdfSqXCPHUstYKB96fTPhW3eLO+E3SRA70c3W53SSk/wd501+xkg9wiqqixGdYxW+7Rp/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=jIKyV8hN; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="jIKyV8hN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1742890767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rS+MoTdB4pkIEatsijwvVjP5EPVl82vhlrNKuRzK2Ew=;
	b=jIKyV8hN5OqUIS9GNmT0F5bAB/L+T/P8Tik0aaWUK9Qhx6iKNns9u90OxTaMoIY5W4XKvI
	Jpfgc7MsQp7chVVlqLi0RQ2a5ZgOeTj+Ebo1oRP86vvFClvHaXLBOeWDwYhcqcIIwciwik
	8FFfC0/p7ljwwyAaV1HOp4odZjAntTA=
From: Yanteng Si <si.yanteng@linux.dev>
To: alexs@kernel.org
Cc: Yanteng Si <si.yanteng@linux.dev>,
	corbet@lwn.net,
	dzm91@hust.edu.cn,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 2/2] MAINTAINERS: Change Yanteng's email address
Date: Tue, 25 Mar 2025 16:18:55 +0800
Message-ID: <6253b1e20328ae892778aaf06a08139657c3d0bc.1742889962.git.si.yanteng@linux.dev>
In-Reply-To: <cover.1742889962.git.si.yanteng@linux.dev>
References: <cover.1742889962.git.si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I no longer work for Loongson, so I have permanently
lost my Loongson email account.

Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a9b8fa5f032..5c4d42428487 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5498,7 +5498,7 @@ F:	Documentation/dev-tools/checkpatch.rst
 
 CHINESE DOCUMENTATION
 M:	Alex Shi <alexs@kernel.org>
-M:	Yanteng Si <siyanteng@loongson.cn>
+M:	Yanteng Si <si.yanteng@linux.dev>
 R:	Dongliang Mu <dzm91@hust.edu.cn>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/alexs/linux.git
 S:	Maintained
-- 
2.48.1

