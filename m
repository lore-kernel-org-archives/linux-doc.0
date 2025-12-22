Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B33030DD36;
	Mon, 22 Dec 2025 09:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396410; cv=pass; b=DidNaj/zfQt70gg4fgxZqMgrt9mXjHddrSZ/czs8U26Ic1Wb+Bu9vQUAd8j3VStF62Ta/gv6Maqk7XQyszOxbDIH3qWhrw0Y4UYHND9ZyeN4tKxnVZErPYWypUsYwqCqT6UXXTjUlj7oMmDbAqlWRsSRwqKAfaiL40bN+l+PsWY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396410; c=relaxed/simple;
	bh=ReMe7njVCv3aGl1pz8b3HKgzu5/q59LALmYWKS63rKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SR2vtkBr/ik/LB59zOfx5syPIWE0t9xlwMnw5s/lau/DeNyEqC+a8v2Mhgwz/37j+zFCAWJu/SqDKGyWWDnZwOCESNIJCUAhTg9yfT7bblEgEG99E45bzINnrLFXNyQGlTn7x2x+CviU1rMq/WrXEurnUsOVFXyL+IuQKc9HTsI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=Wpums0Zi; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="Wpums0Zi"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id E034A109D38D1;
	Mon, 22 Dec 2025 18:33:41 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PHURZUki78Vy; Mon, 22 Dec 2025 18:33:37 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 12D2910A0ECCF; Mon, 22 Dec 2025 18:33:37 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766396017;
	cv=none; b=I7nIeQQd60pLGQCB+mX9LgOfIAcGYWj4m3i5dlIL9VbK6cji89k2+71WmGgfLcG85W/E72PsrqcHEQpA/eLbCUttN2nCqyyjUw9U4HeJXJBC93aTE6E/7rXdwIzGnnZghUncI7WKBVP1ZWGIL+4KeiXsvgf1fiy8Wf9JAqN4IgE=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766396017; c=relaxed/relaxed;
	bh=i9b9uxTvqerY9gQRKqsx6XW46B+6WuirXdwE/34IuAg=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=YROXab2pBxPSp3EgH+PKyYFHSJeng76cDl5GdE+GDJpMAXRgWdToGJckdhSdgvNNJIzcd7BEN3pacJJ2YqMeWJgziM2Y82HiC4sFTOg3+o7zKteSARU7Y9OX7qAO/51WKYMyHBmRh+orFGHBbafkuT7WXVjAoz9Xmn0geFtq0YU=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 12D2910A0ECCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766396017;
	bh=i9b9uxTvqerY9gQRKqsx6XW46B+6WuirXdwE/34IuAg=;
	h=From:To:Cc:Subject:Date:From;
	b=Wpums0Zif0uuiM2l/s28E2Han56lyDVLpwfHPRZeB3Gt8DgpemTLCYpktTcHxwvIl
	 hlVuMFqC+stp3IVNPZpkedFfybW9ESyjSEPDYJ7dx0liwsO3+O2/E++d7UG77bDFl+
	 BRwCQjBV0ojDWt+FiPKPmss6P1i5v8kRSyDFD2p8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com,
	shibata@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weibu@redadmin.org
Subject: [PATCH] docs: ja_JP: Start translation of submitting-patches
Date: Mon, 22 Dec 2025 18:33:34 +0900
Message-ID: <20251222093334.2402526-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Start a new Japanese translation of Documentation/process/submitting-patche=
s.rst.

As suggested by Akira Yokosawa, instead of moving the outdated 2011 transla=
tion
(SubmittingPatches), we are starting a fresh translation of the current
English document.

This patch adds the initial file structure, the warning about the document
being under construction, and the translation of the introduction section.

The translation work will be done incrementally.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/translations/ja_JP/index.rst    |  1 +
 .../ja_JP/process/submitting-patches.rst      | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 Documentation/translations/ja_JP/process/submitting-pat=
ches.rst

diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/tra=
nslations/ja_JP/index.rst
index 4159b417bfdd..5d47d588e368 100644
--- a/Documentation/translations/ja_JP/index.rst
+++ b/Documentation/translations/ja_JP/index.rst
@@ -13,6 +13,7 @@
=20
    disclaimer-ja_JP
    process/howto
+   process/submitting-patches
    process/submit-checklist
=20
 .. raw:: latex
diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
new file mode 100644
index 000000000000..1ef10ee7cbf6
--- /dev/null
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -0,0 +1,32 @@
+.. _jp_process_submitting_patches:
+
+=E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E6=8A=95=E7=A8=BF: =E3=82=AB=E3=83=BC=
=E3=83=8D=E3=83=AB=E3=81=AB=E3=82=B3=E3=83=BC=E3=83=89=E3=82=92=E5=85=A5=E3=
=82=8C=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AE=E5=BF=85=E9=A0=88=E3=82=AC=E3=82=
=A4=E3=83=89
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+
+.. note::
+
+   =E3=81=93=E3=81=AE=E3=83=89=E3=82=AD=E3=83=A5=E3=83=A1=E3=83=B3=E3=83=
=88=E3=81=AF :ref:`Documentation/process/submitting-patches.rst <submitting=
patches>` =E3=81=AE=E6=97=A5=E6=9C=AC=E8=AA=9E=E8=A8=B3=E3=81=A7=E3=81=99=
=E3=80=82
+
+   =E7=BF=BB=E8=A8=B3=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=E3=81=94=E6=84=
=8F=E8=A6=8B=E3=80=81=E8=AA=A4=E6=A4=8D=E3=81=AE=E6=8C=87=E6=91=98=E3=81=AA=
=E3=81=A9=E3=81=AF=E3=80=81Linux=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=83=
=89=E3=82=AD=E3=83=A5=E3=83=A1=E3=83=B3=E3=83=88=E6=97=A5=E6=9C=AC=E8=AA=9E=
=E7=BF=BB=E8=A8=B3=E3=83=97=E3=83=AD=E3=82=B8=E3=82=A7=E3=82=AF=E3=83=88
+   <https://linux-kernel-docs-jp.osdn.jp/> =E3=81=B8=E9=80=A3=E7=B5=A1=E3=
=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+   =E5=85=8D=E8=B2=AC=E4=BA=8B=E9=A0=85: :ref:`translations_ja_JP_disclaim=
er`
+
+.. warning::
+
+   **UNDER CONSTRUCTION!!**
+
+   =E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=81=AF=E7=BF=BB=E8=A8=B3=E6=9B=
=B4=E6=96=B0=E3=81=AE=E4=BD=9C=E6=A5=AD=E4=B8=AD=E3=81=A7=E3=81=99=E3=80=82=
=E6=9C=80=E6=96=B0=E3=81=AE=E5=86=85=E5=AE=B9=E3=81=AF=E5=8E=9F=E6=96=87=E3=
=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=
=84=E3=80=82
+
+Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=A4=89=E6=9B=B4=E3=
=82=92=E5=8A=A0=E3=81=88=E3=81=9F=E3=81=84=E3=81=A8=E6=80=9D=E3=81=A3=E3=81=
=A6=E3=81=84=E3=82=8B=E5=80=8B=E4=BA=BA=E3=82=84=E4=BC=81=E6=A5=AD=E3=81=AB=
=E3=81=A8=E3=81=A3=E3=81=A6=E3=80=81
+=E3=81=9D=E3=81=AE=E3=80=8C=E4=BB=95=E7=B5=84=E3=81=BF=E3=80=8D=E3=81=AB=
=E6=85=A3=E3=82=8C=E3=81=A6=E3=81=84=E3=81=AA=E3=81=91=E3=82=8C=E3=81=B0=E3=
=80=81=E6=8A=95=E7=A8=BF=E3=81=AE=E3=83=97=E3=83=AD=E3=82=BB=E3=82=B9=E3=81=
=AF=E6=99=82=E3=81=AB=E6=B0=97=E5=BE=8C=E3=82=8C=E3=81=99=E3=82=8B=E3=82=82=
=E3=81=AE=E3=81=A7=E3=81=97=E3=82=87=E3=81=86=E3=80=82
+=E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=81=AF=E3=80=81=E3=82=B3=E3=83=BC=
=E3=83=89=E3=82=92=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=85=A5=E3=
=82=8C=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AE=E3=80=81=E4=B8=BB=E3=81=AB=E6=8A=
=80=E8=A1=93=E7=9A=84=E3=81=8B=E3=81=A4=E6=89=8B=E7=B6=9A=E3=81=8D=E7=9A=84=
=E3=81=AA
+=E6=89=8B=E9=A0=86=E3=81=AE=E6=A6=82=E8=A6=81=E3=82=92=E8=AA=AC=E6=98=8E=
=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=82=92=E7=9B=AE=E7=9A=84=E3=81=A8=E3=
=81=97=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82
+
+=E3=82=82=E3=81=97=E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=82=92=E8=AA=AD=
=E3=82=93=E3=81=A7=E3=81=84=E3=82=8B=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E7=
=9B=AE=E7=9A=84=E3=81=8C=E3=80=81=E5=8D=98=E3=81=AB=E3=83=90=E3=82=B0=E5=A0=
=B1=E5=91=8A=E3=82=92=E9=80=81=E4=BF=A1=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=
=E3=81=A7=E3=81=82=E3=82=8C=E3=81=B0=E3=80=81
+Documentation/admin-guide/reporting-issues.rst
+=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=
=E3=81=84=E3=80=82
+
+=E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E8=87=AA=E4=BD=93=E3=82=82=E9=95=B7=
=E5=A4=A7=E3=81=A7=E3=81=99=E3=81=8C=E3=80=81=E8=A9=B3=E7=B4=B0=E3=81=AA=E6=
=89=8B=E9=A0=86=E6=9B=B8=E3=81=A8=E3=81=84=E3=81=86=E3=82=8F=E3=81=91=E3=81=
=A7=E3=81=AF=E3=81=82=E3=82=8A=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82
+=E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AF :ref:`Docu=
mentation/process/submit-checklist.rst <submitchecklist>`
+=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=
=E3=81=84=E3=80=82
--=20
2.47.3

