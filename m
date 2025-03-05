Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E3A45C18
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 02:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741143076; cv=none; b=G9fXTtlczxpvq9upMqeEvdV5xHWGAaXTs8tg2JegF3v9hmqsQThpH0qN81Clzv1C4q6DDIu0egUnzbCHtGy9MYpPZGreHfJ3LfOg90ZvepoEg8wuGuh6UvlV+/ZYxHvCip7jVnjPyzYO1YYdp9nbAxuE2GwboZgd0z3vMKAHohQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741143076; c=relaxed/simple;
	bh=31EeGEBntdR+96QopTaXkZ09eq9NCvDO9umfxH+NWmQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mCuONsdj+sa+u6Lk1F7hrGbqra+r2cCZ1BUoQyaWvfij9jPukI6amHhnANa9TTR4poJtdEW+rffT1o4ssnQimabosJM8SD1m1HqkcP2B9Yf2ZjYi3P69jD2er2EAL5BNZJBPt8DjZrJzoz2I7ogc24SbSUFfnHJ2II9+wdw6S/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+gyG0Mo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+gyG0Mo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE398C4CEE5;
	Wed,  5 Mar 2025 02:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741143075;
	bh=31EeGEBntdR+96QopTaXkZ09eq9NCvDO9umfxH+NWmQ=;
	h=From:To:Cc:Subject:Date:From;
	b=s+gyG0MoHk+VFfyXZGS7ICYokIBUe0IB/+Vthv5YPzYnRPtW7mXMMHGmmu46VCBFN
	 /JDgbTrxPMu7h5Zu++ZJexGxlTvZC7YvlG7wvRo5OY/K3lFIaNBAqABVkuRCrBOJEl
	 Zx/YxKuSkTXz8GxpziMecEL8c4bqxCN+igACP/fMPa51G3Vwqoxc3ufDTtPUv8N5TH
	 fXBnIlw4Opqwvfepd1luq+68wAgej1+N1rfXOGO9XqtWEctsB2FcZWg0hr2qTjSd2i
	 7MSPbD/gxcb6YMDJ344vnKEAXJvddTZWTl3E+G3hr3Bd6FGbcyGLh/oeNEZA+08Lz2
	 RgHTr47ADU2qQ==
From: alexs@kernel.org
To: 
Cc: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH] docs/Chinese: change the disclaimer words
Date: Wed,  5 Mar 2025 10:50:58 +0800
Message-ID: <20250305025101.27717-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

2 paragraph warning and note take a bit more space, let's merge them together,
and guide to other maintainer and reviewers.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev> 
Cc: Dongliang Mu <dzm91@hust.edu.cn> 
Cc: Jonathan Corbet <corbet@lwn.net> 
Cc: linux-doc@vger.kernel.org 
---
 Documentation/translations/zh_CN/disclaimer-zh_CN.rst | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/disclaimer-zh_CN.rst b/Documentation/translations/zh_CN/disclaimer-zh_CN.rst
index 3c6db094a63c..5a0414eefa01 100644
--- a/Documentation/translations/zh_CN/disclaimer-zh_CN.rst
+++ b/Documentation/translations/zh_CN/disclaimer-zh_CN.rst
@@ -1,9 +1,7 @@
 :orphan:
 
-.. warning::
+.. note::
      此文件的目的是为让中文读者更容易阅读和理解，而不是作为一个分支。 因此，
      如果您对此文件有任何意见或更新，请先尝试更新原始英文文件。
-
-.. note::
      如果您发现本文档与原始文件有任何不同或者有翻译问题，请联系该文件的译者，
-     或者请求时奎亮的帮助：<alexs@kernel.org>。
+     或者请求中文文档维护者和审阅者的帮助。
-- 
2.43.0

