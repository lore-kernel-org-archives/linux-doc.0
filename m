Received: from lf-2-40.ptr.blmpb.com (lf-2-40.ptr.blmpb.com [101.36.218.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F6FC21CC60
	for <linux-doc@vger.kernel.org>; Tue,  8 Jul 2025 02:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.36.218.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751942610; cv=none; b=jjI9+pqyBZe9ts9kSj96C7znawhFGiqlLYfnl1N9fJa3QFWtzEB5RVkmv2CpaLEmjEb19sxUHcwYE6/75Js05EKVozmmJ+LC2ts3GLrPAvnB8hleBosYBpyGM6bOJ+fns95GeoUjSM/AYr6wv3M3c+SAFc+bu11gt2UDEeVM6V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751942610; c=relaxed/simple;
	bh=IroXhgyNPTKFJrfF0A7wiRdKHyWrxv55aMOFqIJMdso=;
	h=To:From:Content-Type:Subject:Date:Cc:Message-Id:Mime-Version; b=XHuYuGeONxIF7R9sxoszOXmERyr4gsdlhcAA/T5LSpWf7OWWFZZAcEjFKgaAcKnKdVQT0nu+GE+V6jruIKY+UoCDagD80R59QyJcMYz7xB2eBksVbkuczpB8eGp0AMqMztnPW7MrFqDLymdfKeNld8zDlFDWitPSJPArXZi2AjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com; spf=pass smtp.mailfrom=leap-io.com; dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b=MCzB+bbT; arc=none smtp.client-ip=101.36.218.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=leap-io.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-com.20200927.dkim.feishu.cn header.i=@leap-io-com.20200927.dkim.feishu.cn header.b="MCzB+bbT"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=leap-io-com.20200927.dkim.feishu.cn; t=1751942518;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ui9H0MAZWKXMA8KUGPmRi2GmkiaW99sZ3SLbhYNu8K4=;
 b=MCzB+bbTmT8wsqI7GqA4vQxVgjaUNecOzfBSH51M7nUaS4gV/5XPzkzSR4NxV6OR2IIRed
 v1CWTftjRZKj9FDWU9vKn55hnYA7DGptFemfwNJv8kanrhRndPHeoSw61JHOHA0OQxzRhy
 c9NiYOVeO0nL1uY99ROsvUeBs6E+tJ7k+WHIyY8LqWhnAOGTxgkByOsAudfYhrdNdK+z4l
 ZoZk1FC5bSazs5PGQg8h8O13gHlbRLLJEWMjROqRtKq2g6qmrX6EPl1aAbC/emIJuaCSpp
 ZAqTfI8LcKVLVtcI4k4BpidwOFF4B8GLrWmmwp1Re1sRWAZYlkJ/CPyElFIZgw==
To: <alexs@kernel.org>, <si.yanteng@linux.dev>
From: "haodongdong" <doubled@leap-io.com>
Content-Transfer-Encoding: quoted-printable
Received: from localhost.localdomain ([210.12.5.226]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 10:41:54 +0800
Content-Type: text/plain; charset=UTF-8
X-Original-From: haodongdong <doubled@leap-io.com>
Subject: [PATCH 7/7] docs/zh_CN: add sd-parameters.rst translation
Date: Tue,  8 Jul 2025 10:41:39 +0800
X-Mailer: git-send-email 2.25.1
X-Lms-Return-Path: <lba+2686c8574+08ef25+vger.kernel.org+doubled@leap-io.com>
Cc: <dzm91@hust.edu.cn>, <corbet@lwn.net>, <linux-doc@vger.kernel.org>
Message-Id: <20250708024139.848025-8-doubled@leap-io.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0

Translate .../scsi/sd-parameters.rst into Chinese.
Add sd-parameters into .../scsi/index.rst.

Signed-off-by: haodongdong <doubled@leap-io.com>
---
 .../translations/zh_CN/scsi/index.rst         |  3 +-
 .../translations/zh_CN/scsi/sd-parameters.rst | 38 +++++++++++++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/scsi/sd-parameters.rst

diff --git a/Documentation/translations/zh_CN/scsi/index.rst b/Documentatio=
n/translations/zh_CN/scsi/index.rst
index d739203d9524..cbf3be256174 100644
--- a/Documentation/translations/zh_CN/scsi/index.rst
+++ b/Documentation/translations/zh_CN/scsi/index.rst
@@ -50,9 +50,10 @@ SCSI=E4=B8=BB=E6=9C=BA=E9=80=82=E9=85=8D=E5=99=A8=E9=A9=
=B1=E5=8A=A8
 .. toctree::
    :maxdepth: 1
=20
+   sd-parameters
+
 Todolist:
=20
-* sd-parameters
 * 53c700
 * aacraid
 * advansys
diff --git a/Documentation/translations/zh_CN/scsi/sd-parameters.rst b/Docu=
mentation/translations/zh_CN/scsi/sd-parameters.rst
new file mode 100644
index 000000000000..662caec15b4d
--- /dev/null
+++ b/Documentation/translations/zh_CN/scsi/sd-parameters.rst
@@ -0,0 +1,38 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/scsi/sd-parameters.rst
+
+:=E7=BF=BB=E8=AF=91:
+
+ =E9=83=9D=E6=A0=8B=E6=A0=8B Dongdong Hao <doubled@leap-io.com>
+
+:=E6=A0=A1=E8=AF=91:
+
+
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+Linux SCSI=E7=A3=81=E7=9B=98=E9=A9=B1=E5=8A=A8=EF=BC=88sd=EF=BC=89=E5=8F=
=82=E6=95=B0
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+=E7=BC=93=E5=AD=98=E7=B1=BB=E5=9E=8B=EF=BC=88=E8=AF=BB/=E5=86=99=EF=BC=89
+------------------
+=E5=90=AF=E7=94=A8/=E7=A6=81=E7=94=A8=E9=A9=B1=E5=8A=A8=E5=99=A8=E8=AF=BB=
=E5=86=99=E7=BC=93=E5=AD=98=E3=80=82
+
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D    =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D
+ =E7=BC=93=E5=AD=98=E7=B1=BB=E5=9E=8B=E5=AD=97=E7=AC=A6=E4=B8=B2          =
       WCE     RCD     =E5=86=99=E7=BC=93=E5=AD=98    =E8=AF=BB=E7=BC=93=E5=
=AD=98
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D    =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D
+ write through                   0       0       =E5=85=B3=E9=97=AD      =
=E5=BC=80=E5=90=AF
+ none                            0       1       =E5=85=B3=E9=97=AD      =
=E5=85=B3=E9=97=AD
+ write back                      1       0       =E5=BC=80=E5=90=AF      =
=E5=BC=80=E5=90=AF
+ write back, no read (daft)      1       1       =E5=BC=80=E5=90=AF      =
=E5=85=B3=E9=97=AD
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D    =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D   =3D=3D=3D=3D=3D=3D=3D   =
=3D=3D=3D=3D=3D=3D=3D
+
+=E5=B0=86=E7=BC=93=E5=AD=98=E7=B1=BB=E5=9E=8B=E8=AE=BE=E7=BD=AE=E4=B8=BA=
=E2=80=9Cwrite back=E2=80=9D=E5=B9=B6=E5=B0=86=E8=AF=A5=E8=AE=BE=E7=BD=AE=
=E4=BF=9D=E5=AD=98=E5=88=B0=E9=A9=B1=E5=8A=A8=E5=99=A8::
+
+  # echo "write back" > cache_type
+
+=E5=A6=82=E6=9E=9C=E8=A6=81=E4=BF=AE=E6=94=B9=E7=BC=93=E5=AD=98=E6=A8=A1=
=E5=BC=8F=E4=BD=86=E4=B8=8D=E4=BD=BF=E6=9B=B4=E6=94=B9=E6=8C=81=E4=B9=85=E5=
=8C=96=EF=BC=8C=E5=8F=AF=E5=9C=A8=E7=BC=93=E5=AD=98=E7=B1=BB=E5=9E=8B=E5=AD=
=97=E7=AC=A6=E4=B8=B2=E5=89=8D
+=E6=B7=BB=E5=8A=A0=E2=80=9Ctemporary =E2=80=9D=E3=80=82=E4=BE=8B=E5=A6=82:=
:
+
+  # echo "temporary write back" > cache_type
--=20
2.25.1
