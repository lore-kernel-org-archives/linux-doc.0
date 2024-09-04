Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BAEE29A2
	for <linux-doc@vger.kernel.org>; Wed,  4 Sep 2024 01:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725414923; cv=none; b=WJ8dFjnldFWpSHrPaEtbTvOBgIkcrLYSvyg3kwonyn9FoAwDKZcVe2f2Yk4NXYz++hi5Gmy2wx9Ywbyi8zh+mZewgOUXRUw0qIqkxWqwUEyYfvNswktdg8HNoQ2pTABya1l7pJ7O+Wx+bOBUnMSkUDoZvQ+MlshZ8qk4kdmqWlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725414923; c=relaxed/simple;
	bh=dId40Hsrbcr+IXJqQQtET6rtcKjeDGH5APZvhbkknfU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FjKIClv/d4rbjOj8LSxzlNQdKr5QQ6Xx4n8znZRSRuYShuH3UxMNaVd99EtsYqS63bUS0HadYHWbFXte5uhBnaDfBN2AysM5gBOJ6eWjyLHErVyw7ypFro2/mZMmGgHKDe541R+Z/kLVEq0EJmKENZ+cclyFVOTEWbZp+dJJHlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=qDVYeOdU; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="qDVYeOdU"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1725414917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p4L/haeWKFKDjWzd6N9QbNMKWS/DoARGN+7VpDBrN1Y=;
	b=qDVYeOdUGOQO2eU/9qkesnTg8EK3KBdipUNNb3hwYTv5bqXYftSkx7ktEiARd3Tu71jLjQ
	l4+qwzvz9n/kb/t2mexuG6lWk63mZw4KM6+ujSbgA7Apr0M/bzCbNPI/Qq/VXLF0rQ53JX
	lGoJ0cl4zik85u/lJFA7GbSnFWy7xQI=
From: Yanteng Si <si.yanteng@linux.dev>
To: corbet@lwn.net,
	seakeel@gmail.com
Cc: dzm91@hust.edu.cn,
	hust-os-kernel-patches@googlegroups.com,
	linux-doc@vger.kernel.org,
	Yanteng Si <si.yanteng@linux.dev>
Subject: [PATCH] Docs/zh_CN: Update Yanteng's email address
Date: Wed,  4 Sep 2024 09:55:02 +0800
Message-Id: <20240904015502.1502827-1-si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

I've permanently lost access to my loongson email
account, and luckily I got a developer email,
let's use it.

Signed-off-by: Yanteng Si <si.yanteng@linux.dev>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 800c9528614f..1d8635323076 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5282,7 +5282,7 @@ F:	Documentation/dev-tools/checkpatch.rst
 
 CHINESE DOCUMENTATION
 M:	Alex Shi <alexs@kernel.org>
-M:	Yanteng Si <siyanteng@loongson.cn>
+M:	Yanteng Si <si.yanteng@linux.dev>
 S:	Maintained
 F:	Documentation/translations/zh_CN/
 
-- 
2.31.4

