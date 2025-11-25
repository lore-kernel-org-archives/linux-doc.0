Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0A14A60F;
	Tue, 25 Nov 2025 04:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764043424; cv=pass; b=oPIs+rJfonJf3iNWN7rt4n/cHaJtR7mA4PoRK1x3PudGaXDTUUBnjfpbITwRZXH1mv20ZSKhqRi4+LCa+cEsxXVD3d04X/17M1tv5XbN3WsuR6HrTVXIMW7ypQ/5V64/RsZo5s3QpSrieG00YhnFWk5Jl7m6vFzAunn3CyhVBcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764043424; c=relaxed/simple;
	bh=93DS6d8IHF1unBKE92JyB51Wcv+AtjaDU6ikFURszms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BV0euKZC01GDxH8AUUX08Fid7+6T2hqbhntH4PYh/EmIkuJdnSbp6tkTNOCM2Cph+as0Ei0wb2fRx8MbgIppDFULksRT3BSREE+AoeVO+jRoar2VmZODKQpAFsJz4dbCAFP5m9oOVj6hszNOdagqmiyyKtK9sUQOLaNgXfOVgQo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=VLEHZq85; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="VLEHZq85"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5AP2XjML083701
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 25 Nov 2025 11:33:45 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 82F5F109F2541;
	Tue, 25 Nov 2025 11:33:44 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqQbQw-JKcK4; Tue, 25 Nov 2025 11:33:39 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 0D6B2109F2540; Tue, 25 Nov 2025 11:33:39 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1764038019;
	cv=none; b=FIvArcoGH4RoCJaP5lqkaSW2cOP+Uqnsx3Pp5RkhB0ixypiYRXzWXjzdmTSPEhRKfADC/cHytu6dkjmxlODVYds5rm6oiQFTHxAvmGksDlIaur0oSICKnSTkKCxy0V/TgNNlQF4KSrOWhMta5XEEAKV26OTLXuhayNn7CM7c/LY=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1764038019; c=relaxed/relaxed;
	bh=O+dTMaL5YK7iLasKShPOeEnlODV9ggHWVDHe08cnmw0=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=AvFkDvZrwE0u4u5Giq/0vFStxok1TFuLvhLfM16E1wdv5WvH4wIgKFJBde2uhrU7tSEnv+9z/0+xiw9m5F9uvIhFHxurHqAt7uyQgqDG3rPnC/ZhVnpS1vFCa+8wH6LAFC9jQdvhUmDuVZ7c4uKbxN8Hernepium53ns3zPYzx0=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 0D6B2109F2540
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1764038019;
	bh=O+dTMaL5YK7iLasKShPOeEnlODV9ggHWVDHe08cnmw0=;
	h=From:To:Cc:Subject:Date:From;
	b=VLEHZq857fbywBI8XNmLblTrFkUE3r0+FapV+OxNXKO+rTOLbRonmZpMzmp+vw3vI
	 hyIPeNNigaNnkkHYEgZ1xjOhnr67yzYemk4haAi7Ms0RvcPMbNNKT56HyxRGLS8CcE
	 lQv/YZtxrYphw0rbdwcCI0U06bb8IB/dF6V6lpN8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com, shibata@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, weibu@redadmin.org
Subject: [PATCH v2] docs: ja_JP: Move submitting-patches to process/ and add to build
Date: Tue, 25 Nov 2025 11:33:36 +0900
Message-ID: <20251125023336.639136-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

As requested by Jonathan Corbet, move the Japanese translation of
'SubmittingPatches' to its proper location under 'process/' and
convert it to reStructuredText.

This patch also wires the new file into the Japanese documentation's
toctree, allowing it to be included in the Sphinx build.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
v2:
 - Move the entry in index.rst below 'howto' (Akira Yokosawa)
 - Update the document title to match the current English version (Akira Yo=
kosawa)
 - Remove legacy header and translation history (Akira Yokosawa)
 - Add link to the disclaimer (Akira Yokosawa)
 - Fix RST syntax errors (code blocks, underlines)

 Documentation/translations/ja_JP/index.rst    |  1 +
 .../submitting-patches.rst}                   | 82 +++++++------------
 2 files changed, 30 insertions(+), 53 deletions(-)
 rename Documentation/translations/ja_JP/{SubmittingPatches =3D> process/su=
bmitting-patches.rst} (94%)

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
diff --git a/Documentation/translations/ja_JP/SubmittingPatches b/Documenta=
tion/translations/ja_JP/process/submitting-patches.rst
similarity index 94%
rename from Documentation/translations/ja_JP/SubmittingPatches
rename to Documentation/translations/ja_JP/process/submitting-patches.rst
index 5334db471744..c6402fc52145 100644
--- a/Documentation/translations/ja_JP/SubmittingPatches
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -1,33 +1,10 @@
-NOTE:
-This is a version of Documentation/process/submitting-patches.rst into Jap=
anese.
-This document is maintained by Keiichi KII <k-keiichi@bx.jp.nec.com>
-and the JF Project team <http://www.linux.or.jp/JF/>.
-If you find any difference between this document and the original file
-or a problem with the translation,
-please contact the maintainer of this file or JF project.
+.. include:: ../disclaimer-ja_JP.rst
=20
-Please also note that the purpose of this file is to be easier to read
-for non English (read: Japanese) speakers and is not intended as a
-fork. So if you have any comments or updates of this file, please try
-to update the original English file first.
+:Original: :ref:`Documentation/process/submitting-patches.rst <submittingp=
atches>`
=20
-Last Updated: 2011/06/09
-
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-=E3=81=93=E3=82=8C=E3=81=AF=E3=80=81
-linux-2.6.39/Documentation/process/submitting-patches.rst =E3=81=AE=E5=92=
=8C=E8=A8=B3
-=E3=81=A7=E3=81=99=E3=80=82
-=E7=BF=BB=E8=A8=B3=E5=9B=A3=E4=BD=93=EF=BC=9A JF =E3=83=97=E3=83=AD=E3=82=
=B8=E3=82=A7=E3=82=AF=E3=83=88 < http://www.linux.or.jp/JF/ >
-=E7=BF=BB=E8=A8=B3=E6=97=A5=EF=BC=9A 2011/06/09
-=E7=BF=BB=E8=A8=B3=E8=80=85=EF=BC=9A Keiichi Kii <k-keiichi at bx dot jp d=
ot nec dot com>
-=E6=A0=A1=E6=AD=A3=E8=80=85=EF=BC=9A Masanari Kobayashi =E3=81=95=E3=82=93=
 <zap03216 at nifty dot ne dot jp>
-         Matsukura =E3=81=95=E3=82=93 <nbh--mats at nifty dot com>
-         Takeshi Hamasaki =E3=81=95=E3=82=93 <hmatrjp at users dot sourcef=
orge dot jp>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-
-        Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=A4=89=E6=9B=
=B4=E3=82=92=E5=8A=A0=E3=81=88=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AE Howto
-        =E5=8F=88=E3=81=AF
-        =E3=81=8B=E3=81=AE Linus Torvalds =E3=81=AE=E5=8F=96=E3=82=8A=E6=
=89=B1=E3=81=84=E8=AA=AC=E6=98=8E=E6=9B=B8
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
+=E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E6=8A=95=E7=A8=BF: =E3=82=AB=E3=83=BC=
=E3=83=8D=E3=83=AB=E3=81=AB=E3=82=B3=E3=83=BC=E3=83=89=E3=82=92=E5=85=A5=E3=
=82=8C=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AE=E5=BF=85=E9=A0=88=E3=82=AC=E3=82=
=A4=E3=83=89
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
=20
 Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=A4=89=E6=9B=B4=E3=
=82=92=E5=8A=A0=E3=81=88=E3=81=9F=E3=81=84=E3=81=A8=E6=80=9D=E3=81=A3=E3=81=
=A6=E3=81=84=E3=82=8B=E5=80=8B=E4=BA=BA=E5=8F=88=E3=81=AF=E4=BC=9A=E7=A4=BE=
=E3=81=AB=E3=81=A8=E3=81=A3=E3=81=A6=E3=80=81=E3=83=91=E3=83=83
 =E3=83=81=E3=81=AE=E6=8A=95=E7=A8=BF=E3=81=AB=E9=96=A2=E9=80=A3=E3=81=97=
=E3=81=9F=E4=BB=95=E7=B5=84=E3=81=BF=E3=81=AB=E6=85=A3=E3=82=8C=E3=81=A6=E3=
=81=84=E3=81=AA=E3=81=91=E3=82=8C=E3=81=B0=E3=80=81=E3=81=9D=E3=81=AE=E9=81=
=8E=E7=A8=8B=E3=81=AF=E6=99=82=E3=80=85=E3=81=BF=E3=81=AA=E3=81=95=E3=82=93=
=E3=82=92
@@ -37,12 +14,11 @@ Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=
=A4=89=E6=9B=B4=E3=82=92=E5=8A=A0=E3=81=88=E3=81=9F=E3=81=84=E3=81=A8=E6=80=
=9D=E3=81=A3=E3=81=A6=E3=81=84=E3=82=8B=E5=80=8B=E4=BA=BA=E5=8F=88=E3=81=AF=
=E4=BC=9A=E7=A4=BE
 =E3=82=B3=E3=83=BC=E3=83=89=E3=82=92=E6=8A=95=E7=A8=BF=E3=81=99=E3=82=8B=
=E5=89=8D=E3=81=AB=E3=80=81Documentation/process/submit-checklist.rst =E3=
=81=AE=E9=A0=85=E7=9B=AE=E3=83=AA=E3=82=B9=E3=83=88=E3=81=AB=E7=9B=AE
 =E3=82=92=E9=80=9A=E3=81=97=E3=81=A6=E3=83=81=E3=82=A7=E3=83=83=E3=82=AF=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
=20
---------------------------------------------
 =E3=82=BB=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B31 =E3=83=91=E3=83=83=E3=83=81=
=E3=81=AE=E4=BD=9C=E3=82=8A=E6=96=B9=E3=81=A8=E9=80=81=E3=82=8A=E6=96=B9
---------------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 1) =E3=80=8C diff -up =E3=80=8D
-------------
+-----------------
=20
 =E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E4=BD=9C=E6=88=90=E3=81=AB=E3=81=AF=
=E3=80=8C diff -up =E3=80=8D=E5=8F=88=E3=81=AF=E3=80=8C diff -uprN =E3=80=
=8D=E3=82=92=E4=BD=BF=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=
=E3=80=82
=20
@@ -55,7 +31,7 @@ Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=AF=
=BE=E3=81=99=E3=82=8B=E5=85=A8=E3=81=A6=E3=81=AE=E5=A4=89=E6=9B=B4=E3=81=AF=
 diff(1) =E3=82=B3=E3=83=9E=E3=83=B3=E3=83=89=E3=81=AB=E3=82=88=E3=82=8B
 =E3=83=87=E3=82=A3=E3=83=AC=E3=82=AF=E3=83=88=E3=83=AA=E3=82=92=E5=9F=BA=
=E6=BA=96=E3=81=AB=E3=81=97=E3=81=AA=E3=81=84=E3=81=A8=E3=81=84=E3=81=91=E3=
=81=BE=E3=81=9B=E3=82=93=E3=80=82
=20
 1=E5=80=8B=E3=81=AE=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=81=AB=E3=81=A4=
=E3=81=84=E3=81=A6=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=82=92=E4=BD=9C=E6=
=88=90=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AB=E3=81=AF=E3=80=81=E3=81=
=BB=E3=81=A8=E3=82=93=E3=81=A9=E3=81=AE=E5=A0=B4=E5=90=88=E3=80=81
-=E4=BB=A5=E4=B8=8B=E3=81=AE=E4=BD=9C=E6=A5=AD=E3=82=92=E8=A1=8C=E3=81=88=
=E3=81=B0=E5=8D=81=E5=88=86=E3=81=A7=E3=81=99=E3=80=82
+=E4=BB=A5=E4=B8=8B=E3=81=AE=E4=BD=9C=E6=A5=AD=E3=82=92=E8=A1=8C=E3=81=88=
=E3=81=B0=E5=8D=81=E5=88=86=E3=81=A7=E3=81=99=E3=80=82::
=20
 	SRCTREE=3Dlinux-2.6
 	MYFILE=3Ddrivers/net/mydriver.c
@@ -68,7 +44,7 @@ Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=AF=
=BE=E3=81=99=E3=82=8B=E5=85=A8=E3=81=A6=E3=81=AE=E5=A4=89=E6=9B=B4=E3=81=AF=
 diff(1) =E3=82=B3=E3=83=9E=E3=83=B3=E3=83=89=E3=81=AB=E3=82=88=E3=82=8B
=20
 =E8=A4=87=E6=95=B0=E3=81=AE=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=81=AB=
=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=82=92=E4=
=BD=9C=E6=88=90=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AB=E3=81=AF=E3=80=
=81=E7=B4=A0=E3=81=AE( vanilla )=E3=80=81=E3=81=99
 =E3=81=AA=E3=82=8F=E3=81=A1=E5=A4=89=E6=9B=B4=E3=82=92=E5=8A=A0=E3=81=88=
=E3=81=A6=E3=81=AA=E3=81=84 Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=
=82=92=E5=B1=95=E9=96=8B=E3=81=97=E3=80=81=E8=87=AA=E5=88=86=E3=81=AE Linux=
 =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB
-=E3=82=BD=E3=83=BC=E3=82=B9=E3=81=A8=E3=81=AE=E5=B7=AE=E5=88=86=E3=82=92=
=E7=94=9F=E6=88=90=E3=81=97=E3=81=AA=E3=81=84=E3=81=A8=E3=81=84=E3=81=91=E3=
=81=BE=E3=81=9B=E3=82=93=E3=80=82=E4=BE=8B=E3=81=88=E3=81=B0=E3=80=81
+=E3=82=BD=E3=83=BC=E3=82=B9=E3=81=A8=E3=81=AE=E5=B7=AE=E5=88=86=E3=82=92=
=E7=94=9F=E6=88=90=E3=81=97=E3=81=AA=E3=81=84=E3=81=A8=E3=81=84=E3=81=91=E3=
=81=BE=E3=81=9B=E3=82=93=E3=80=82=E4=BE=8B=E3=81=88=E3=81=B0=E3=80=81::
=20
 	MYSRC=3D/devel/linux-2.6
=20
@@ -125,7 +101,7 @@ http://savannah.nongnu.org/projects/quilt
 =E7=89=B9=E5=AE=9A=E3=81=AE=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=82=92=
=E5=8F=82=E7=85=A7=E3=81=97=E3=81=9F=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=
=80=81=E3=81=9D=E3=81=AE SHA-1 ID =E3=81=A0=E3=81=91=E3=81=A7=E3=81=AA=E3=
=81=8F=E3=80=81=E4=B8=80=E8=A1=8C=E3=82=B5=E3=83=9E=E3=83=AA
 =E3=82=82=E5=90=AB=E3=82=81=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=
=E3=80=82=E3=81=9D=E3=82=8C=E3=81=AB=E3=82=88=E3=82=8A=E3=80=81=E3=81=9D=E3=
=82=8C=E3=81=8C=E4=BD=95=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=E3=82=B3=E3=83=
=9F=E3=83=83=E3=83=88=E3=81=AA=E3=81=AE=E3=81=8B=E3=81=8C=E3=83=AC=E3=83=93=
=E3=83=A5=E3=83=BC=E3=81=99=E3=82=8B
 =E4=BA=BA=E3=81=AB=E3=82=8F=E3=81=8B=E3=82=8A=E3=82=84=E3=81=99=E3=81=8F=
=E3=81=AA=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82
-=E4=BE=8B (=E8=8B=B1=E6=96=87=E3=81=AE=E3=83=9E=E3=83=9E):
+=E4=BE=8B (=E8=8B=B1=E6=96=87=E3=81=AE=E3=83=9E=E3=83=9E)::
=20
        Commit e21d2170f36602ae2708 ("video: remove unnecessary
        platform_set_drvdata()") removed the unnecessary
@@ -601,9 +577,8 @@ diffstat =E3=81=AE=E7=B5=90=E6=9E=9C=E3=82=92=E7=94=9F=
=E6=88=90=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AB=E3=80=8C git diff -M=
 --stat --summary =E3=80=8D
 =E7=95=B0=E3=81=AA=E3=81=A3=E3=81=A6=E3=81=8D=E3=81=BE=E3=81=99=E3=80=82gi=
t =E3=81=AF=E5=A4=A7=E8=A6=8F=E6=A8=A1=E3=81=AA=E5=A4=89=E6=9B=B4(=E8=BF=BD=
=E5=8A=A0=E3=81=A8=E5=89=8A=E9=99=A4=E3=81=AE=E3=83=9A=E3=82=A2)=E3=82=92=
=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E5=90=8D=E3=81=AE=E5=A4=89=E6=9B=B4=E3=
=81=A8
 =E5=88=A4=E6=96=AD=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=A7=E3=81=99=
=E3=80=82
=20
-------------------------------------
 =E3=82=BB=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B32 - =E3=83=92=E3=83=B3=E3=83=
=88=E3=81=A8TIPS=E3=81=A8=E5=B0=8F=E6=8A=80
-------------------------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
=20
 =E3=81=93=E3=81=AE=E3=82=BB=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B3=E3=81=AF L=
inux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AB=E5=A4=89=E6=9B=B4=E3=82=
=92=E9=81=A9=E7=94=A8=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=81=AB=E9=96=A2=
=E4=BF=82=E3=81=AE=E3=81=82=E3=82=8B=E4=B8=80=E8=88=AC=E7=9A=84=E3=81=AA
 =E3=80=8C=E3=81=8A=E7=B4=84=E6=9D=9F=E3=80=8D=E3=81=AE=E5=A4=9A=E3=81=8F=
=E3=82=92=E8=BC=89=E3=81=9B=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E7=
=89=A9=E4=BA=8B=E3=81=AB=E3=81=AF=E4=BE=8B=E5=A4=96=E3=81=A8=E3=81=84=E3=81=
=86=E3=82=82=E3=81=AE=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=
=E3=81=97=E3=81=8B
@@ -645,7 +620,7 @@ ifdef =E3=81=8C=E6=95=A3=E4=B9=B1=E3=81=97=E3=81=9F=E3=
=82=B3=E3=83=BC=E3=83=89=E3=81=AF=E3=80=81=E8=AA=AD=E3=82=80=E3=81=AE=E3=82=
=82=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=83=B3=E3=82=B9=E3=81=99=E3=82=8B=
=E3=81=AE=E3=82=82
 =E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=BE=8C=E3=81=AF=
=E3=82=B3=E3=83=B3=E3=83=91=E3=82=A4=E3=83=A9=E3=81=8C=E3=80=81=E4=BD=95=E3=
=82=82=E3=81=97=E3=81=AA=E3=81=84=E7=AE=87=E6=89=80=E3=82=92=E6=9C=80=E9=81=
=A9=E5=8C=96=E3=81=97=E3=81=A6=E5=8F=96=E3=82=8A=E5=8E=BB=E3=81=A3=E3=81=A6=
=E3=81=8F=E3=82=8C=E3=82=8B=E3=81=A7
 =E3=81=97=E3=82=87=E3=81=86=E3=80=82
=20
-=E3=81=BE=E3=81=9A=E3=81=84=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AE=E7=B0=A1=
=E5=8D=98=E3=81=AA=E4=BE=8B
+=E3=81=BE=E3=81=9A=E3=81=84=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AE=E7=B0=A1=
=E5=8D=98=E3=81=AA=E4=BE=8B::
=20
 	dev =3D alloc_etherdev (sizeof(struct funky_private));
 	if (!dev)
@@ -656,12 +631,14 @@ ifdef =E3=81=8C=E6=95=A3=E4=B9=B1=E3=81=97=E3=81=9F=
=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AF=E3=80=81=E8=AA=AD=E3=82=80=E3=81=AE=E3=
=82=82=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=83=B3=E3=82=B9=E3=81=99=E3=82=
=8B=E3=81=AE=E3=82=82
=20
 =E3=82=AF=E3=83=AA=E3=83=BC=E3=83=B3=E3=82=A2=E3=83=83=E3=83=97=E3=81=97=
=E3=81=9F=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AE=E4=BE=8B
=20
-(in header)
+(in header)::
+
 	#ifndef CONFIG_NET_FUNKINESS
 	static inline void init_funky_net (struct net_device *d) {}
 	#endif
=20
-(in the code itself)
+(in the code itself)::
+
 	dev =3D alloc_etherdev (sizeof(struct funky_private));
 	if (!dev)
 		return -ENODEV;
@@ -686,35 +663,34 @@ gcc =E3=81=AB=E3=81=8A=E3=81=84=E3=81=A6=E3=81=AF=E3=
=80=81=E3=83=9E=E3=82=AF=E3=83=AD=E3=81=A8=E5=90=8C=E3=81=98=E3=81=8F=E3=82=
=89=E3=81=84=E8=BB=BD=E3=81=84=E3=81=A7=E3=81=99=E3=80=82
 =E3=82=92=E3=81=97=E3=81=AA=E3=81=84=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95=
=E3=81=84=E3=80=82=E3=80=8C=E3=81=A7=E3=81=8D=E3=82=8B=E9=99=90=E3=82=8A=E7=
=B0=A1=E5=8D=98=E3=81=AB=E3=80=81=E3=81=9D=E3=81=97=E3=81=A6=E3=80=81=E3=81=
=9D=E3=82=8C=E4=BB=A5=E4=B8=8A=E7=B0=A1=E5=8D=98=E3=81=AB=E3=81=AA=E3=82=89
 =E3=81=AA=E3=81=84=E3=82=88=E3=81=86=E3=81=AA=E8=A8=AD=E8=A8=88=E3=82=92=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=80=8D
=20
-----------------------
 =E3=82=BB=E3=82=AF=E3=82=B7=E3=83=A7=E3=83=B33 =E5=8F=82=E8=80=83=E6=96=87=
=E7=8C=AE
-----------------------
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
 Andrew Morton, "The perfect patch" (tpp).
-  <http://www.ozlabs.org/~akpm/stuff/tpp.txt>
+<http://www.ozlabs.org/~akpm/stuff/tpp.txt>
=20
 Jeff Garzik, "Linux kernel patch submission format".
-  <https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-fo=
rmat.html>
+<https://web.archive.org/web/20180829112450/http://linux.yyz.us/patch-form=
at.html>
=20
 Greg Kroah-Hartman, "How to piss off a kernel subsystem maintainer".
-  <http://www.kroah.com/log/linux/maintainer.html>
-  <http://www.kroah.com/log/linux/maintainer-02.html>
-  <http://www.kroah.com/log/linux/maintainer-03.html>
-  <http://www.kroah.com/log/linux/maintainer-04.html>
-  <http://www.kroah.com/log/linux/maintainer-05.html>
+<http://www.kroah.com/log/linux/maintainer.html>
+<http://www.kroah.com/log/linux/maintainer-02.html>
+<http://www.kroah.com/log/linux/maintainer-03.html>
+<http://www.kroah.com/log/linux/maintainer-04.html>
+<http://www.kroah.com/log/linux/maintainer-05.html>
=20
 NO!!!! No more huge patch bombs to linux-kernel@vger.kernel.org people!
-  <https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
+<https://lore.kernel.org/r/20050711.125305.08322243.davem@davemloft.net>
=20
 Kernel Documentation/process/coding-style.rst:
-  <http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-=
style.rst>
+<http://users.sosdg.org/~qiyong/lxr/source/Documentation/process/coding-st=
yle.rst>
=20
 Linus Torvalds's mail on the canonical patch format:
-  <https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl=
.org>
+<https://lore.kernel.org/r/Pine.LNX.4.58.0504071023190.28951@ppc970.osdl.o=
rg>
=20
 Andi Kleen, "On submitting kernel patches"
-  Some strategies to get difficult or controversial changes in.
-  http://halobates.de/on-submitting-patches.pdf
+Some strategies to get difficult or controversial changes in.
+http://halobates.de/on-submitting-patches.pdf
=20
 --
=20
--=20
2.47.3

