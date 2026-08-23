Received: from mta1.migadu.com (out-101.mta1.migadu.com [95.215.58.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4112594BD
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 07:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469330; cv=none; b=A9Sn4L3GtGGfQZhz5YqV0cuqUebGony4aW8EN1lCZKpD3snTf151XJo+W9vFmJhuZHuXkU8pr0lOyFG0sEVMfYlydsHB0eSsNUXV2gqtDK/LB6Bn9Hud0IZAu/bANBhi8HHBRi3ae7/DHU4FNJrsjjILlCJhrs2mfwf804mT3AI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469330; c=relaxed/simple;
	bh=5ZuAEAQyybRW946rhgehF/uHgjS3z9Pt035+5ckDtMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZfrr7RvlI9hYtZ6JH5uoodHkE3GZmlGW6kLbbpuG0ru9T6Q/qHlNEFm9dRno94e8POPVChdLzd2Mg9vqMtXINPCsPp8aIx86nBC+y96Hx5tbMj7KGWYodoKoVNvoPitwdepY9inHbzdL/WX0w8Kte3wdxP2zA+iKZAwAVeT/Kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=ITeMRx7L; arc=none smtp.client-ip=95.215.58.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="ITeMRx7L"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=5ZuAEAQyybRW946rhgehF/uHgjS3z9Pt035+5ckDtMM=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787469326; v=1; x=1788074126;
 b=ITeMRx7LnJ8oKdsDv+epybAPzapEn62vzjD2a0cvhIyOMaiK6ZXdaGQ64ptg1jntlYtSur9E
 FtT/eaW3u28TMRky32JFFMK5d1eaZHWgW655RjqwTGH21/epkJeyw8n2KjsCTXBzpQ7nc3s7E/+
 GLrh0aO7HVV6m2Bi0brYzM3opVYd6fDO6BjmPTyOMwOC5LpTWUfaf3sJT69WhnUc/VpCcimrzmX
 pch+FUEzI+7K/JxPcV8cavKqJU+fm0qEBvcZWQA+ezsPAJtwhVjAlOHesAUocAFdXpFlKuzSZSV
 1yuRVAeCSEJmGwz81YLa5RPidc110ncUYKU9SUrpr3A8A==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 5188c006d38ebb33;
	Sun, 23 Aug 2026 07:15:25 +0000
X-Mizu-Trace-ID: 5188c006d38ebb33
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sun, 23 Aug 2026 15:14:58 +0800
Subject: [PATCH v2 2/5] docs/zh_CN: clarify free Nitrokey requirements
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260823-maintainer-pgp-guide-v2-2-bea33b2ece54@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
In-Reply-To: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Update Documentation/process/maintainer-pgp-guide.rst Chinese
translation to clarify that developers must be listed in an M: entry
in MAINTAINERS or have a kernel.org account to qualify for a free
Nitrokey Start.

Also translate the Nitrokey link text and fix its RST reference markup.

Update the translation through commit 273aa250f138
("Documentation: Improve wording on requirements for a free Nitrokey")

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index a526366a42fa..b329755cc960 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -351,14 +351,14 @@ Paperkey。
 
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

