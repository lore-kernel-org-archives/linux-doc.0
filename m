Received: from mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76CE47DF86
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 17:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787246058; cv=none; b=fYLisxiGweJet/3xpUTbxgLarJ8RJbAvj64PKoJphNX3laCdX3zQ3Z48N5BpI52mJJ1CHqsYL3Qklxl5Z9dtZ6ONY0uru4MWNmF7nHaDvsXBdyuqMZX12LhuYxt3ah+NVjxfOwiFL2tepdYzlSh3YJuJMmCZPCo4IUwxp22NNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787246058; c=relaxed/simple;
	bh=/WY9HBfIh+3AS3HH9aYVRgHp45+83trdkT09mYuTiro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSdFvQvb1R8w9zF2+FE+EUNVNk6IenordVe2ptWG23n4ylAQE55UjsRELX8iEw8fF4oHJE2QVaJ24yq4qMwpK6zu9Twk58SRAoHgz3z/9SRgcfV9zSmmpsJkCvSQESzOnW0zvq+UAbRDKrCoqZWmf47j/r3WtZkt4A/z/GixDgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org; spf=pass smtp.mailfrom=wyuan.org; dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b=MXngjBZ0; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wyuan.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wyuan.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wyuan.org header.i=@wyuan.org header.b="MXngjBZ0"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=/WY9HBfIh+3AS3HH9aYVRgHp45+83trdkT09mYuTiro=;
 c=simple/simple; d=wyuan.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787246054; v=1; x=1787850854;
 b=MXngjBZ0JvIInfMWb7mc3IT8tR4imAl7+5sVbqqLhA1j6EZfn/lOQR5Ge3sdKlY+VWqiwOl1
 klBHss0vJTiX1CBZs2Ce+dCqg5zr0TFrpTyw0z8uWe8YMjYa5m2CwSJPzZEFOE5vUn6nCZ0qhO0
 dlIrRUC/OLIY0geeOcrNFdHNClimqJ/Q53xD2LY+J/Tfd+QputCLshUCIA73h8p6qqsVknPxp78
 RTJTMkuPTBEzhRm7FDIPN7mJwsOmSAkNlpbpvWbx6ccc/97mU2AuRYLb4iXekMAsohtTd1O8nWD
 2pE7u84mY4QhYERrtCIsuo9yiIa9fg+xZZ8M0sY0qsr4g==
X-Envelope-To: linux-doc@vger.kernel.org
Received: from yuanweijie-macmini-2058.local (117.176.242.187)
	by smtp.migadu.com with ESMTPS id 63a9e2b98aca5b4d;
	Thu, 20 Aug 2026 17:14:14 +0000
X-Mizu-Trace-ID: 63a9e2b98aca5b4d
X-Migadu-Flow: FLOW_OUT
From: Weijie Yuan <wy@wyuan.org>
Date: Fri, 21 Aug 2026 01:13:23 +0800
Subject: [PATCH 4/4] docs/zh_CN: add kernel.org trust repository reference
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260821-maintainer-pgp-guide-v1-4-08e5e3602c04@wyuan.org>
References: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
In-Reply-To: <20260821-maintainer-pgp-guide-v1-0-08e5e3602c04@wyuan.org>
To: Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
 Dongliang Mu <dzm91@hust.edu.cn>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=wy@wyuan.org;
 h=from:subject:message-id; bh=/WY9HBfIh+3AS3HH9aYVRgHp45+83trdkT09mYuTiro=;
 b=owGbwMvMwCWmYiA08XxmoirjabUkhqx2072MM24KlJjvbe0ROe8kkWmswq71Ti3A+U5O7LqXC
 d0LkrI6JrIwiHExWIopsijmPb/A5R6wd9qKiPMwc1iZQIZIizQwAAELA19uYl6pkY6Rnqm2oZ6h
 kY6BjjEDF6cATHWQGsN/D+GrTqosHRf5twXenyWvJqJe9/1equCVh91i64/wOFlqMvwzE4wqEWQ
 yipxjx7VEKfYNI/Ok2QEMm4xNmdZtXrHC6DA3AA==
X-Developer-Key: i=wy@wyuan.org; a=openpgp;
 fpr=216EE7D00A4750BD96A858CF24301291CF696125

Add the kernel.org trust repository reference to the Chinese
translation.

Update the translation through commit 54857c52452a
("docs: maintainer-pgp-guide.rst: add a reference for kernel.org sign")

Signed-off-by: Weijie Yuan <wy@wyuan.org>
---
 Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
index 12b3e8030364..f6e8ac2d11de 100644
--- a/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
+++ b/Documentation/translations/zh_CN/process/maintainer-pgp-guide.rst
@@ -767,6 +767,8 @@ SSH 的信任方法”。使用 SSH，第一次连接到远程系统时，其密
 
     trust-model tofu+pgp
 
+.. _kernel_org_trust_repository:
+
 使用 kernel.org 信任网仓库
 --------------------------
 

-- 
2.55.0.822.g20453c30eb

