Received: from mta0.migadu.com (out-74.mta0.migadu.com [91.218.175.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EA2379974
	for <linux-doc@vger.kernel.org>; Sun, 23 Aug 2026 07:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787469343; cv=none; b=bfa7IfvxIwknLjp7Vw6ctg0KTJ23/aQyxzM8/dWapuzwiOqmO4T472ROD8pxRiy+dyISzKXz6FFu7E5duwPU6DbZWx9ce+7ufi6FXti+7m+4oe3TemsQETQp2k+oed+HVIdYHxMAEHIE4qYcyvS1V2VMs4miwLf8FnBUekTqrr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787469343; c=relaxed/simple;
	bh=sgwfqA9sAjgSBgQ/O6bwV3Csq7CjVG+v9NkaeSLCyvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=anNjnruemsW0o4JDI/bwgCbOXHa58qp2tFUrSQi6Y6hyyocir55lbefDk5F5nUeeufHhGxxwbbT6kgaD3beg0g6pMRYziyytK9Dcf4S2wWjc78i9GevhYmT+l5PHmHFXrZwCPZF7LVVxFenu7gHckOIVvmQTV7/CtXDBA1vxIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=T+jjI9xR; arc=none smtp.client-ip=91.218.175.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="T+jjI9xR"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sgwfqA9sAjgSBgQ/O6bwV3Csq7CjVG+v9NkaeSLCyvk=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787469339; v=1; x=1788074139;
 b=T+jjI9xRPabguPxSlja/WQbzHJdwcQ6mOsYDQ0SNjhb3+gFF38g3gqlH0OcZ0XKXcf6bbtRg
 Cgc9BMkJIR2me17JO4CYAXlAidZpRfTCnvdn5eohPr+vL9kaoNre0+No1DU9tEYDsBeD83R0Jbw
 uJtbvqZ7VUSvnG7QSlE+CVCR9Re25AaxxxmjzmrShUmlcPqzEK126/Xau6k+PlP4BhIpWieLMtA
 patTOLDrWlbc/hV/KULMXkbOHbU+KjRKA+lnnK0NEGCrw0r9mdGahPzUl2HhGsBZ2WOL+m3oWr6
 pI+GEkcAJStGrJsy/BI8/Eg9GcFEPqbuDtM2svH2uYwlg==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id e40a9d944dd2d7a0;
	Sun, 23 Aug 2026 07:15:39 +0000
X-Mizu-Trace-ID: e40a9d944dd2d7a0
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Sun, 23 Aug 2026 15:15:00 +0800
Subject: [PATCH v2 4/5] docs/zh_CN: add kernel.org trust repository
 reference
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260823-maintainer-pgp-guide-v2-4-bea33b2ece54@wyuan.org>
References: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
In-Reply-To: <20260823-maintainer-pgp-guide-v2-0-bea33b2ece54@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

Add the kernel.org trust repository reference to the Chinese
translation.

Update the translation through commit 54857c52452a
("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index 6e29c9a74f4c..79f8de3c1f5e 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -778,6 +778,8 @@ SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密
 
     trust-model tofu+pgp
 
+.. _cn_kernel_org_trust_repository:
+
 使用 kernel.org 信任网仓库
 --------------------------
 

-- 
2.55.0.822.g20453c30eb

