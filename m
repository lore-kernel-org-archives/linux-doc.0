Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72EC405F7
	for <linux-doc@vger.kernel.org>; Sun, 25 Jan 2026 15:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769354347; cv=pass; b=gl4VFJyIVYJHHXukUpTiqsYecLkihNip3wBlxhQ+GdsqpPrRjwOQY6ptjHQ96TeLVNtEUPVTct+KrxV4nIES2OoEza4y7i3c+X+BDXPz4lohSe+d0/flzF8ezOi3V+wucycYIyHY45/KsrtEw7ZB9TbDXN+pea4CXg6uh28GWqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769354347; c=relaxed/simple;
	bh=SjFii0RhtXAxKMzK8IX/43IZKDDA9L1WLEwqhSrDHJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lVOAInsR855CeISXG5dGl87I1jBZ5UgPX/z1pMwiXNSNxxj0ustNZ/6oa9aKdTSbWJET3pXEVuQ8rjgG58kdq7CjWYspW9MiJ0A1NxuiUHzTHIq8C0xUo5oyGPLA0e7JNtZxjqe7vwlZud35VlmwxiCduvBylIlkICN1JenDkss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=hegPUGEQ; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="hegPUGEQ"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 60PEQG8h015760
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sun, 25 Jan 2026 23:26:17 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 66595109F15C4;
	Sun, 25 Jan 2026 23:26:16 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wc3cUkBzmZFk; Sun, 25 Jan 2026 23:26:12 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 2200D109F254B; Sun, 25 Jan 2026 23:26:12 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1769351172;
	cv=none; b=P3OELWCvQef1Jf8CryPSie/bg2MepYzxkkLzOX6pMCD0lN8RAggSkdgRUAxS6Eb2cQ4BRS0j+5hNwOUbXYLKFBY45I/Mvg6tgD3Xu4svN99+PbmXjg1mNd9u2hDDBkzyvAkWK1awV/vKvwU+yGZQJAYCGtt5EwhV4gk3+6GhwjM=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1769351172; c=relaxed/relaxed;
	bh=di+PdAsjmX88YW2F5+r89Syd4SdieSwYreW5LECv+xE=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=UPoBTMxrgux7JcTiH2vI8pnALiIxw7x4vhIOsKUOsBwx56lv1WmGnx3Fd7/b32mU+/qywDw3YY4dIfHJWXCPY17sFIfd/fGExrQLXdJJp/4QoYweWgHrC7/eIN9OSz+Qw8pNLcAY247/F+b150mLTU0ADc0soQFxJP2IaXTK43w=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 2200D109F254B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1769351172;
	bh=di+PdAsjmX88YW2F5+r89Syd4SdieSwYreW5LECv+xE=;
	h=From:To:Cc:Subject:Date:From;
	b=hegPUGEQoLeqF+aMDrrXp5r08qZtlpxRudJMtfSSnaakIOOc9zcqcbvl0TRdy+TIE
	 gSZ0ZIgM8q19gjXz6yXXLywhmL/LNXbrhOe1NEkhyPJjL171yURoZDMVQ0U5f5+viK
	 87yVzi/ARopOzn2wq7+Q8x80I2nHC2JNHlcVuZGY=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com, linux-doc@vger.kernel.org,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: ja_JP: translate 'Obtain a current source tree'
Date: Sun, 25 Jan 2026 23:26:09 +0900
Message-ID: <20260125142609.3029741-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst      | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 1ef10ee7cbf6..6aba1652e75f 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -30,3 +30,40 @@ Documentation/admin-guide/reporting-issues.rst
 =E3=81=93=E3=81=AE=E6=96=87=E6=9B=B8=E8=87=AA=E4=BD=93=E3=82=82=E9=95=B7=
=E5=A4=A7=E3=81=A7=E3=81=99=E3=81=8C=E3=80=81=E8=A9=B3=E7=B4=B0=E3=81=AA=E6=
=89=8B=E9=A0=86=E6=9B=B8=E3=81=A8=E3=81=84=E3=81=86=E3=82=8F=E3=81=91=E3=81=
=A7=E3=81=AF=E3=81=82=E3=82=8A=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82
 =E8=A9=B3=E7=B4=B0=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AF :ref:`Docu=
mentation/process/submit-checklist.rst <submitchecklist>`
 =E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=
=E3=81=84=E3=80=82
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
+
+=E7=8F=BE=E5=9C=A8=E3=81=AE=E3=82=BD=E3=83=BC=E3=82=B9=E3=83=84=E3=83=AA=
=E3=83=BC=E3=82=92=E5=85=A5=E6=89=8B=E3=81=99=E3=82=8B
+----------------------------
+
+=E3=82=82=E3=81=97=E6=89=8B=E5=85=83=E3=81=AB=E6=9C=80=E6=96=B0=E3=81=AE=
=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=82=BD=E3=83=BC=E3=82=B9=E3=81=AE=E3=
=83=AA=E3=83=9D=E3=82=B8=E3=83=88=E3=83=AA=E3=81=8C=E3=81=AA=E3=81=91=E3=82=
=8C=E3=81=B0=E3=80=81``git`` =E3=82=92=E4=BD=BF=E3=81=A3=E3=81=A6=E5=8F=96=
=E5=BE=97=E3=81=97=E3=81=A6
+=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=81=BE=E3=81=9A=E3=81=AF m=
ainline =E3=81=AE=E3=83=AA=E3=83=9D=E3=82=B8=E3=83=88=E3=83=AA=E3=81=8B=E3=
=82=89=E5=A7=8B=E3=82=81=E3=82=8B=E3=81=AE=E3=81=8C=E3=82=88=E3=81=84=E3=81=
=A7=E3=81=97=E3=82=87=E3=81=86=E3=80=82=E3=81=93=E3=82=8C=E3=81=AF
+=E6=AC=A1=E3=81=AE=E3=82=88=E3=81=86=E3=81=AB=E3=81=97=E3=81=A6=E5=8F=96=
=E5=BE=97=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=99::
+
+  git clone git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it
+
+=E3=81=9F=E3=81=A0=E3=81=97=E3=80=81mainline =E3=81=AE=E3=83=84=E3=83=AA=
=E3=83=BC=E3=82=92=E7=9B=B4=E6=8E=A5=E5=AF=BE=E8=B1=A1=E3=81=AB=E3=81=97=E3=
=81=A6=E9=96=8B=E7=99=BA=E3=81=97=E3=81=9F=E3=81=8F=E3=81=AA=E3=81=84=E5=A0=
=B4=E5=90=88=E3=82=82=E3=81=82=E3=82=8B=E3=81=93=E3=81=A8=E3=81=AB=E6=B3=A8=
=E6=84=8F
+=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=A4=9A=
=E3=81=8F=E3=81=AE=E3=82=B5=E3=83=96=E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E3=
=81=AE=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=81=AF=E3=81=9D=E3=82=8C=E3=81=
=9E=E3=82=8C=E7=8B=AC=E8=87=AA=E3=81=AE=E3=83=84=E3=83=AA=E3=83=BC=E3=82=92=
=E9=81=8B=E7=94=A8=E3=81=97=E3=81=A6=E3=81=8A=E3=82=8A=E3=80=81
+=E3=81=9D=E3=81=AE=E3=83=84=E3=83=AA=E3=83=BC=E3=81=AB=E5=AF=BE=E3=81=97=
=E3=81=A6=E4=BD=9C=E6=88=90=E3=81=97=E3=81=9F=E3=83=91=E3=83=83=E3=83=81=E3=
=82=92=E8=A6=8B=E3=81=9F=E3=81=84=E3=81=A8=E8=80=83=E3=81=88=E3=81=A6=E3=81=
=84=E3=81=BE=E3=81=99=E3=80=82=E8=A9=B2=E5=BD=93=E3=82=B5=E3=83=96=E3=82=B7=
=E3=82=B9=E3=83=86=E3=83=A0=E3=81=AE
+=E3=83=84=E3=83=AA=E3=83=BC=E3=81=AF MAINTAINERS =E3=83=95=E3=82=A1=E3=82=
=A4=E3=83=AB=E5=86=85=E3=81=AE **T:** =E3=82=A8=E3=83=B3=E3=83=88=E3=83=AA=
=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E8=A6=8B=E3=81=A4=E3=81=91=E3=
=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=81=9D=E3=81=93=E3=81=AB=E6=8E=B2=E8=BC=89=E3=81=95=E3=82=8C=E3=81=A6=
=E3=81=84=E3=81=AA=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E3=83=A1=E3=
=83=B3=E3=83=86=E3=83=8A=E3=81=AB=E5=95=8F=E3=81=84=E5=90=88=E3=82=8F=E3=81=
=9B=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+.. _jp_describe_changes:
+
+=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=99=
=E3=82=8B
+------------------
--=20
2.47.3

