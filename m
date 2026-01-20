Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5B5332EDE;
	Tue, 20 Jan 2026 15:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768923964; cv=pass; b=VT4d54WgGd4AYlMGlkzQJFuFNPMvk4zu98zJedejxFqm3ipHW/6QUGu8YjaQBK1oU7x6PlTgP65fAT7r/vrMB6reikKqLU2Si9pC5Mky/dIr+PzbVDaFrwLtlZ+CHf7oo976aE2ASE0qdxmXf0dR4j0cKkf0Aiv1NFlbOp/7iAM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768923964; c=relaxed/simple;
	bh=kFnGP/8A5Keb4PzSwFYvQmHO0AcANEg8mygDNDNKP7o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Vty98dSwSXg80EKZGGdltJ7fv5+CUYm50/W2ukXKiPvHzsFyP/o2lpWALIpquz7yDCff5tbLM1zKw6cgjvnYKthsHRGqFgMGC7fGDDS7KOQa4w2ou4ZYXJDRFaOPZO++W11uitOswJFSpan4m4t7xvGzHZuuJ+AuCx/kKS0tvWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=fFf8qL6g; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="fFf8qL6g"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id E0ECE109EFDEB;
	Wed, 21 Jan 2026 00:45:50 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gDkpttnph2UF; Wed, 21 Jan 2026 00:45:46 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 91BEE109F15C4; Wed, 21 Jan 2026 00:45:46 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1768923946;
	cv=none; b=kBTlgPzkSkmdT1RZSu05EzTo9K2QGAxwn6Y0NOr1967a2k513EkBxUzuDaOYVVAvjw5RcIlCf5hDKHftTHhbidXiU5gkG6mO+cFxPpWojHpu2AKFUttvk+gFLJgP5XTs91E2zvpkCBrM8yJl7ne88ColfxISGP0G3i0WqP6Y4wQ=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1768923946; c=relaxed/relaxed;
	bh=qPrCxDv6tUvtLqsyic+HX7EPyfJ9nQqeEMrVlzUbeu4=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=nG7KrfkXGNqoVsT5XG6q9aULZnHUsMJ6WS9r2wAVY5sh3WGcjFMGLKAd3sOOIP67yswvMAmAFuG1a67r79ZGyK0+4ecCgMgxrNm8WoH5fsVhj3fOCgO+srnS0aHuz3ZXFJJoDIS3p0PNagfNZ+zozblK4PNgyHtohC9D9WJYxmw=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 91BEE109F15C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1768923946;
	bh=qPrCxDv6tUvtLqsyic+HX7EPyfJ9nQqeEMrVlzUbeu4=;
	h=From:To:Cc:Subject:Date:From;
	b=fFf8qL6gKvHPE2b/LpKA60AV3c/LLdGfr/rI7+vOQsu+o1BHW1JaZKg4hYbyswlwo
	 8x8pKuEmURBxSx7jXrsfEZeAzP3sPP70AtNojHeV88TGxGcXizZI7d3vRxiie23X8p
	 nBCp3/IM/ZAXBDFCVOSWTJRArh2odYVIZj8yd1rQ=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com,
	shibata@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	weibu@redadmin.org
Subject: [PATCH v4] docs: ja_JP: Start translation of submitting-patches
Date: Wed, 21 Jan 2026 00:45:43 +0900
Message-ID: <20260120154543.2063635-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Start a new Japanese translation of
Documentation/process/submitting-patches.rst.

Instead of moving the outdated 2011
translation (SubmittingPatches), we are starting a fresh translation of
the current English document.

This patch adds the initial file structure, the warning about the
document being under construction, and the translation of the
introduction section.

The translation work will be done incrementally.

Suggested-by: Akira Yokosawa <akiyks@gmail.com>
Link: https://lore.kernel.org/298d3a9c-41c1-4cbd-b4ab-d3009df9388c@gmail.co=
m/
Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/translations/ja_JP/index.rst    |  1 +
 .../ja_JP/process/submitting-patches.rst      | 38 +++++++++++++++++++
 2 files changed, 39 insertions(+)
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
index 000000000000..2ff887c86b2a
--- /dev/null
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -0,0 +1,38 @@
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
+Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=B8=E5=A4=89=E6=9B=B4=E3=
=82=92=E6=8A=95=E7=A8=BF=E3=81=97=E3=81=9F=E3=81=84=E5=80=8B=E4=BA=BA=E3=82=
=84=E4=BC=81=E6=A5=AD=E3=81=AB=E3=81=A8=E3=81=A3=E3=81=A6=E3=80=81=E3=82=82=
=E3=81=97=E3=80=8C=E4=BB=95=E7=B5=84=E3=81=BF=E3=80=8D=E3=81=AB
+=E6=85=A3=E3=82=8C=E3=81=A6=E3=81=84=E3=81=AA=E3=81=91=E3=82=8C=E3=81=B0=
=E3=80=81=E3=81=9D=E3=81=AE=E3=83=97=E3=83=AD=E3=82=BB=E3=82=B9=E3=81=AF=E6=
=99=82=E3=81=AB=E6=B0=97=E5=BE=8C=E3=82=8C=E3=81=99=E3=82=8B=E3=82=82=E3=81=
=AE=E3=81=A7=E3=81=97=E3=82=87=E3=81=86=E3=80=82
+=E3=81=93=E3=81=AE=E3=83=86=E3=82=AD=E3=82=B9=E3=83=88=E3=81=AF=E3=80=81=
=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E5=A4=89=E6=9B=B4=E3=81=8C=E5=8F=97=E3=
=81=91=E5=85=A5=E3=82=8C=E3=82=89=E3=82=8C=E3=82=8B=E5=8F=AF=E8=83=BD=E6=80=
=A7=E3=82=92=E5=A4=A7=E3=81=8D=E3=81=8F=E9=AB=98=E3=82=81=E3=82=8B=E3=81=9F=
=E3=82=81=E3=81=AE
+=E6=8F=90=E6=A1=88=E3=82=92=E9=9B=86=E3=82=81=E3=81=9F=E3=82=82=E3=81=AE=
=E3=81=A7=E3=81=99=E3=80=82
+
+=E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=81=AB=E3=81=AF=E3=80=81=E6=AF=94=
=E8=BC=83=E7=9A=84=E7=B0=A1=E6=BD=94=E3=81=AA=E5=BD=A2=E5=BC=8F=E3=81=A7=E5=
=A4=9A=E6=95=B0=E3=81=AE=E6=8F=90=E6=A1=88=E3=81=8C=E5=90=AB=E3=81=BE=E3=82=
=8C=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82
+=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E9=96=8B=E7=99=BA=E3=83=97=E3=83=AD=
=E3=82=BB=E3=82=B9=E3=81=AE=E4=BB=95=E7=B5=84=E3=81=BF=E3=81=AB=E9=96=A2=E3=
=81=99=E3=82=8B=E8=A9=B3=E7=B4=B0=E3=81=AF
+Documentation/process/development-process.rst =E3=82=92=E5=8F=82=E7=85=A7=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=81=BE=E3=81=9F=E3=80=81=E3=82=B3=E3=83=BC=E3=83=89=E3=82=92=E6=8A=95=
=E7=A8=BF=E3=81=99=E3=82=8B=E5=89=8D=E3=81=AB=E7=A2=BA=E8=AA=8D=E3=81=99=E3=
=81=B9=E3=81=8D=E9=A0=85=E7=9B=AE=E3=81=AE=E4=B8=80=E8=A6=A7=E3=81=A8=E3=81=
=97=E3=81=A6
+Documentation/process/submit-checklist.rst =E3=82=92=E8=AA=AD=E3=82=93=E3=
=81=A7=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=83=87=E3=83=90=E3=82=A4=E3=82=B9=E3=83=84=E3=83=AA=E3=83=BC=E3=83=90=
=E3=82=A4=E3=83=B3=E3=83=87=E3=82=A3=E3=83=B3=E3=82=B0=E3=81=AE=E3=83=91=E3=
=83=83=E3=83=81=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AF=E3=80=81
+Documentation/devicetree/bindings/submitting-patches.rst =E3=82=92=E8=AA=
=AD=E3=82=93=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E3=81=AF=E3=80=81=E3=83=91=E3=83=83=
=E3=83=81=E4=BD=9C=E6=88=90=E3=81=AB ``git`` =E3=82=92=E4=BD=BF=E3=81=86=E5=
=89=8D=E6=8F=90=E3=81=A7=E6=9B=B8=E3=81=8B=E3=82=8C=E3=81=A6=E3=81=84=E3=81=
=BE=E3=81=99=E3=80=82
+=E3=82=82=E3=81=97 ``git`` =E3=81=AB=E4=B8=8D=E6=85=A3=E3=82=8C=E3=81=A7=
=E3=81=82=E3=82=8C=E3=81=B0=E3=80=81=E4=BD=BF=E3=81=84=E6=96=B9=E3=82=92=E5=
=AD=A6=E3=81=B6=E3=81=93=E3=81=A8=E3=82=92=E5=BC=B7=E3=81=8F=E5=8B=A7=E3=82=
=81=E3=81=BE=E3=81=99=E3=80=82
+=E3=81=9D=E3=82=8C=E3=81=AB=E3=82=88=E3=82=8A=E3=80=81=E3=82=AB=E3=83=BC=
=E3=83=8D=E3=83=AB=E9=96=8B=E7=99=BA=E8=80=85=E3=81=A8=E3=81=97=E3=81=A6=E3=
=80=81=E3=81=BE=E3=81=9F=E4=B8=80=E8=88=AC=E7=9A=84=E3=81=AB=E3=82=82=E3=80=
=81=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E4=BD=9C=E6=A5=AD=E3=81=AF
+=E3=81=9A=E3=81=A3=E3=81=A8=E6=A5=BD=E3=81=AB=E3=81=AA=E3=82=8B=E3=81=A7=
=E3=81=97=E3=82=87=E3=81=86=E3=80=82
+
+=E3=81=84=E3=81=8F=E3=81=A4=E3=81=8B=E3=81=AE=E3=82=B5=E3=83=96=E3=82=B7=
=E3=82=B9=E3=83=86=E3=83=A0=E3=82=84=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=
=83=84=E3=83=AA=E3=83=BC=E3=81=AB=E3=81=AF=E3=80=81=E5=90=84=E3=80=85=E3=81=
=AE=E3=83=AF=E3=83=BC=E3=82=AF=E3=83=95=E3=83=AD=E3=83=BC=E3=82=84
+=E6=9C=9F=E5=BE=85=E4=BA=8B=E9=A0=85=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=
=E8=BF=BD=E5=8A=A0=E6=83=85=E5=A0=B1=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=
=81=99=E3=80=82=E6=AC=A1=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=
=8F=E3=81=A0=E3=81=95=E3=81=84:
+:ref:`Documentation/process/maintainer-handbooks.rst <maintainer_handbooks=
_main>`.
--=20
2.47.3

