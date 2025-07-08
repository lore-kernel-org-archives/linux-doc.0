Received: from va-2-39.ptr.blmpb.com (va-2-39.ptr.blmpb.com [209.127.231.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4721CC60
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 02:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942561; cv=none; b=hxtA/DaYWgJjPjyza+iAylc3DD3xQfUyvZ79uFaTVFV+h40EtniOe05cSPrpgyMJ5VVF7Tp0aOQfZdsmAQVIYEoU9tCnmAi1iu9HTX10xFpxFZh5kTCScozItHbOp041ZscDBpHQPlLzlBlltU9KCUUm6g2MxK0qGjHUUkr13f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942561; c=relaxed/simple;
	bh=5QLW/rGYM/NS/fhjGQmCRLbOzhETP6Tc3bULadHBJhg=;
	h=Cc:From:Content-Type:Subject:Date:Message-Id:To:Mime-Version; b=mjAAyK1/NgPSjz7n8p0wKsmrzMtPrtRXxQDq5jzdyuIqajM5NQqswBvplYyB3cvDFV+B3jZTX4hjlImqrwj+j1qkRKaAJAye3GlcWladpqoGD0chRkxXtWEl99TiH+QnFUSPZZ5hdQiPcnmXowLgxVPPBJzg9DFEj3/KksOrFf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=JpNw4UBT; arc=none smtp.client-ip=209.127.231.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="JpNw4UBT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1751942504;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=QQK9s5Hs7oT1QlkAMIhA6q1rHeSN6D5cEGQny+2+UQw=;
 b=JpNw4UBTT1lnt+mjk4mFAcZGyzWmYmc08BIcZ+ENE9Zvvs2RG2tUQA2p00JGfvk/hfCXkA
 0uc6IvFlKd6xQdlNNT2KnhA1kCKTZC5VSlraTTUs2phTh1mr3Vcfvgf9zmNR1MFBC9QWTz
 BJrbj/27eHpbER16Mnb6bKN8BAJb0vP1GZefCiScqcXFWVl+6ywvnUHuNmAhLs3L1pQFl8
 ajpHMarrg8xC6+xaqXGe8bp7xJDQAYcFsyFqwU/Am4JI4vR/M3U54EXtJL/olSTlzR8RAo
 E2S4JRo+bV5llIMgNRcBs5jNBhxWi8Fu85TBX4HHFNHKlWtbPyo/PngEIk0Bgw==
Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
From: "haodongdong" <doubled@leap-io.com>
Content-Type: text/plain; charset=UTF-8
Received: from localhost.localdomain ([210.12.5.226]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 10:41:41 +0800
Subject: [PATCH 1/7] docs/zh_CN: update subsystem-apis.rst translation
X-Mailer: git-send-email 2.25.1
X-Original-From: haodongdong <doubled@leap-io.com>
Date: Tue,  8 Jul 2025 10:41:33 +0800
Message-Id: <20250708024139.848025-2-doubled@leap-io.com>
To: <alexs@kernel.org>, <si.yanteng@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Lms-Return-Path: <lba+2686c8566+5560e1+vger.kernel.org+doubled@leap-io.com>

Remove scsi/index from TODOList

Signed-off-by: haodongdong <doubled@leap-io.com>
---
 Documentation/translations/zh_CN/subsystem-apis.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/subsystem-apis.rst b/Document=
ation/translations/zh_CN/subsystem-apis.rst
index 8b646c1010be..0f121f9b0f70 100644
--- a/Documentation/translations/zh_CN/subsystem-apis.rst
+++ b/Documentation/translations/zh_CN/subsystem-apis.rst
@@ -71,12 +71,12 @@ TODOList:
    :maxdepth: 1
=20
    filesystems/index
+   scsi/index
=20
 TODOList:
=20
 * block/index
 * cdrom/index
-* scsi/index
 * target/index
=20
 **Fixme**: =E8=BF=99=E9=87=8C=E8=BF=98=E9=9C=80=E8=A6=81=E6=9B=B4=E5=A4=9A=
=E7=9A=84=E5=88=86=E7=B1=BB=E7=BB=84=E7=BB=87=E5=B7=A5=E4=BD=9C=E3=80=82
--=20
2.25.1
