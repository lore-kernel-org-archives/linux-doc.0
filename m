Received: from mta0.migadu.com (out-56.mta0.migadu.com [91.218.175.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E313147D44B
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246043; cv=none; b=fMXb6tC5JBqvBOnWb4O8iYTqwCBFgtzbRFHsAgGfyZOjvl8p17V4m7QT6Dg3s31VFpSiGbIssq+uMGmfj9iXlUhTQNiixQC0XN9LFaTgrlGzR+7Xu4Qh/9ysjpeQkhd8SDvHyu27evuJk/7g5imp5dbDbha+APa0DzeS3xf39Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246043; c=relaxed/simple;
	bh=SFs7BZPUOSA+M3BynisdBofmqScJRJzV1pmLWpI+NJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aTpp/TJ1UdVhhEeZLIuj8LX/DqcTNK/04KAtul/+yyYz1O/8GXZHZjuXw1I2TGd6AwgJ56wg3agQGA/JgQWZfoGiZ+M5xxCg0SEShrAktCmj3kdWn4HoiEKGQp5IoR7EqEe1fZQke7BwG4CmxDujpumjfa5MEpIMcnesZKsoEoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ivHNGqF5; arc=none smtp.client-ip=91.218.175.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ivHNGqF5"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SFs7BZPUOSA+M3BynisdBofmqScJRJzV1pmLWpI+NJ0=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787246038; v=1; x=1787850838;
 b=ivHNGqF5p754RKQQsPLe79XNV/Ric1PuuIB1BKwmYImnA3IkT+wZsTbcdxBS7dY7E1cVlbzr
 o6VloJrTx6jJxXjxHYxQZssJXUeB1EvV/KwAqAvGU1nDBe0MUJkRelNw1PRj1UktIh/UfZB19id
 0VdPJhXVmOLXttJ/Qb0OCWlp2CCfGdUydGEzTjVOGFJBMTRfmDSs2BFNDW5VZ26V04JBjGbCGfj
 +/2QPSGZgnyHeR6He23fBSVQJGzb9tNz+bUVPnNEOaRhM7Q323aZjf0uQvV1uk7lv2SxVxQGV8M
 TQDwFStPHwEUymtpX0Edx7cezCGvKKIcbzIL29ZoqJn0Q==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id abc3ccbffb10427a;
	Thu, 20 Aug 2026 17:13:58 +0000
X-Mizu-Trace-ID: abc3ccbffb10427a
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Fri, 21 Aug 2026 01:13:21 +0800
Subject: [PATCH 2/4] docs/zh_CN: clarify free Nitrokey requirements
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-maintainer-pgp-guide-v1-2-08e5e3602c04@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
In-Reply-To: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1807; i=wy@wyuan.org;
 h=from:subject:message-id; bh=SFs7BZPUOSA+M3BynisdBofmqScJRJzV1pmLWpI+NJ0=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqx20z09D8/bRmtb7pm2cU0sSx/TuQj3/pxtW/rv1xefX
 DNVcrttx0QWBjEuBksxRRbFvOcXuNwD9k5bEXEeZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKn2fMHIMGf+K8Md3lU/uJ8q7Tk18XKjzP9N38Nst1V4H2GTUt4qtp/hf07padu
 7S2/wmcxx4Dt1i98+W3P+jfV3nrz/nLn+7Pt9hrwA
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Update Documentation/process/maintainer-pgp-guide.rst Chinese
translation to clarify that developers must be listed in an M: entry
in MAINTAINERS or have a kernel.org account to qualify for a free
Nitrokey Start.

Update the translation through commit 273aa250f138
("Documentation: Improve wording on requirements for a free Nitrokey")

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index fe0a78576f43..7a3fab8596a6 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -344,14 +344,14 @@ Paperkey。
 
 .. note::
 
-    如果你位列于 MAINTAINERS 中或在 kernel.org 上拥有帐户，则你有
-    资格获得Linux 基金会提供的_`qualify for a free Nitrokey Start` 。
+    如果你被列在 MAINTAINERS 的 `M:` 条目中，或者拥有 kernel.org 帐户，
+    则有资格获得 Linux 基金会提供的 `免费 Nitrokey Start`_。
 
 .. _`Nitrokey Start`: https://www.nitrokey.com/products/nitrokeys
 .. _`Nitrokey 3`: https://www.nitrokey.com/products/nitrokeys
 .. _`Yubikey 5`: https://www.yubico.com/products/yubikey-5-overview/
 .. _Gnuk: https://www.fsij.org/doc-gnuk/
-.. _`qualify for a free Nitrokey Start`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
+.. _`免费 Nitrokey Start`: https://www.kernel.org/nitrokey-digital-tokens-for-kernel-developers.html
 
 配置你的智能卡设备
 ------------------

-- 
2.55.0.822.g20453c30eb

