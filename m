Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84E6265606;
	Wed, 13 May 2026 14:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681109; cv=pass; b=fFor5+I/e0IP53ZGAKw5PT2ZqlWlL/fPA/3zYbEWVRmnZoF/sLZbuuSrbzjH9eSxy4WFmP6uFykM2JijAAvE4Wlg8+8gogFB0hkr5i+kG1Z8VNIpowL2VYjb1kEVeiXkKi2qortZvA54CJKXyAd0YiXWmrg5oSN5to8tifY0rQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681109; c=relaxed/simple;
	bh=p8n5UJrp835Gg9QvlWjnZWVKufEUJgp0tcNk8oMctUQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XeX6L2R6yzfLKjjsKWdmVaq1oQPeonIfnbhNdEtQvf9i7dB1xNeIA2oHBxZLA6kBpzvOw3Jh9XEX9DjV0iKtnryoJ/iav3johMM8hojUdKHqYFagWvjY60w0i2cpSJHqcTDY3rcfTLqOB10ZZoXUzmCDLy1So5P5/i68bqJH25Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=iFwTgJpC; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="iFwTgJpC"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 46BF2109D57F6;
	Wed, 13 May 2026 22:11:21 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgO_fjtAqS1H; Wed, 13 May 2026 22:11:13 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1778677873;
	b=Z9O/5BaKMjIowL5rc4/byvK4Dc/hFDsDFGiRFnASkf17K2SCYz/eXekusaxoPO7ctrTa
	 9QSyGXVFo0ZruUUY0rl8Ne8PRMhixHYqGlR9urxTpJZbW0xvoiqhGYXEQ9p9Oqfjs9bdn
	 Ex1Mxzq657YSH67qHSXqb6cSbNHnLOWdJs=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1778677873;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ICx9aXyzEN50HidMh//KSRxlNl87rw4HbADx5D6rT0g=;
	b=Xd998CfIZwrsBjvWwhbkaYwcgHNjPQnFNYVqwHxV6i9LlS4n4de1G/mPK1w41laQotYb
	 smxy+G5Go5GTO2vAC0KlBcpXBOM0JjGKSrhajSzcfuE3U3GCE+avtxw2XNBcE+57JkcCH
	 AhUM6qB3V7sgUUkmln/MRHqNSZM40OoOXw=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 36917109F2894; Wed, 13 May 2026 22:11:13 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 36917109F2894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1778677873;
	bh=ICx9aXyzEN50HidMh//KSRxlNl87rw4HbADx5D6rT0g=;
	h=From:To:Cc:Subject:Date:From;
	b=iFwTgJpCyqVnu6JEYBmTRJQbvfnE5R7FjLNH60WgB/O4ztI+s7mcyk6hP+Dzw64cX
	 NaXv18Oan5DKZISI5p0RYNG++Nhn9Niz4sl9bBCWRmirSuFUGnIdqOfZ4tob5tBYDL
	 mY1ERIvmpWVfCFLzpKY7AuUaf5etUgp7iMYSFGKw=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	akiyks@gmail.com,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2] docs/ja_JP: translate more of submitting-patches.rst (no-mime)
Date: Wed, 13 May 2026 22:11:11 +0900
Message-ID: <20260513131111.432772-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the "No MIME, no links, no compression, no attachments.
Just plain text" and "Respond to review comments" sections in
Documentation/translations/ja_JP/process/submitting-patches.rst.

Keep the wording close to the English text and wrap lines to match
the style used in the surrounding Japanese translation.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
v2:
- Make the subject unique.
- Reword the no-MIME section title.
- Refer to the untranslated "The canonical patch format" section by name wi=
th a TODO.

 .../ja_JP/process/submitting-patches.rst      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 928e38a8d34d..165cb3ed94ec 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -292,3 +292,66 @@ MAINTAINERS =E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=81=
=AB=E8=A8=98=E8=BC=89=E3=81=95=E3=82=8C=E3=81=A6=E3=81=84=E3=82=8B MAN-PAGE=
S =E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=81=AB
 man-pages =E3=83=91=E3=83=83=E3=83=81=E3=80=81=E5=B0=91=E3=81=AA=E3=81=8F=
=E3=81=A8=E3=82=82=E5=A4=89=E6=9B=B4=E3=81=AE=E9=80=9A=E7=9F=A5=E3=82=92=E9=
=80=81=E3=81=A3=E3=81=A6=E3=80=81=E6=83=85=E5=A0=B1=E3=81=8C
 =E3=83=9E=E3=83=8B=E3=83=A5=E3=82=A2=E3=83=AB=E3=83=9A=E3=83=BC=E3=82=B8=
=E3=81=AB=E5=8F=8D=E6=98=A0=E3=81=95=E3=82=8C=E3=82=8B=E3=82=88=E3=81=86=E3=
=81=AB=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=83=
=A6=E3=83=BC=E3=82=B6=E3=83=BC=E7=A9=BA=E9=96=93 API =E3=81=AE
 =E5=A4=89=E6=9B=B4=E3=81=AF=E3=80=81linux-api@vger.kernel.org =E3=81=AB=E3=
=82=82 Cc =E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+MIME=E3=83=BB=E3=83=AA=E3=83=B3=E3=82=AF=E3=83=BB=E5=9C=A7=E7=B8=AE=E3=83=
=BB=E6=B7=BB=E4=BB=98=E3=81=AA=E3=81=97=E3=80=81=E3=83=97=E3=83=AC=E3=83=BC=
=E3=83=B3=E3=83=86=E3=82=AD=E3=82=B9=E3=83=88=E3=81=AE=E3=81=BF
+----------------------------------------------------
+
+Linus =E3=82=84=E4=BB=96=E3=81=AE=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E9=
=96=8B=E7=99=BA=E8=80=85=E3=81=AF=E3=80=81=E3=81=82=E3=81=AA=E3=81=9F=E3=81=
=8C=E6=8A=95=E7=A8=BF=E3=81=99=E3=82=8B=E5=A4=89=E6=9B=B4=E3=82=92=E8=AA=AD=
=E3=81=BF=E3=80=81
+=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=81=A7=E3=81=8D=E3=82=8B=E5=BF=85=
=E8=A6=81=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E3=82=AB=E3=
=83=BC=E3=83=8D=E3=83=AB=E9=96=8B=E7=99=BA=E8=80=85=E3=81=8C=E6=A8=99=E6=BA=
=96=E7=9A=84=E3=81=AA
+=E3=83=A1=E3=83=BC=E3=83=AB=E3=83=84=E3=83=BC=E3=83=AB=E3=82=92=E4=BD=BF=
=E3=81=A3=E3=81=A6=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E5=A4=89=E6=9B=B4=E3=
=82=92=E3=80=8C=E5=BC=95=E7=94=A8=E3=80=8D=E3=81=97=E3=80=81=E3=82=B3=E3=83=
=BC=E3=83=89=E3=81=AE=E7=89=B9=E5=AE=9A=E3=81=AE
+=E7=AE=87=E6=89=80=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=82=B3=E3=83=A1=
=E3=83=B3=E3=83=88=E3=81=A7=E3=81=8D=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E9=
=87=8D=E8=A6=81=E3=81=A7=E3=81=99=E3=80=82
+
+=E3=81=93=E3=81=AE=E3=81=9F=E3=82=81=E3=80=81=E3=81=99=E3=81=B9=E3=81=A6=
=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=AF=E3=83=A1=E3=83=BC=E3=83=AB=E6=
=9C=AC=E6=96=87=E4=B8=AD=E3=81=AB ``inline`` =E3=81=A7=E6=8A=95=E7=A8=BF=E3=
=81=99=E3=81=B9=E3=81=8D=E3=81=A7=E3=81=99=E3=80=82
+=E3=81=93=E3=82=8C=E3=82=92=E8=A1=8C=E3=81=86=E6=9C=80=E3=82=82=E7=B0=A1=
=E5=8D=98=E3=81=AA=E6=96=B9=E6=B3=95=E3=81=AF ``git send-email`` =E3=82=92=
=E4=BD=BF=E3=81=86=E3=81=93=E3=81=A8=E3=81=A7=E3=81=82=E3=82=8A=E3=80=81
+=E5=BC=B7=E3=81=8F=E6=8E=A8=E5=A5=A8=E3=81=95=E3=82=8C=E3=81=BE=E3=81=99=
=E3=80=82``git send-email`` =E3=81=AE=E5=AF=BE=E8=A9=B1=E5=9E=8B=E3=83=81=
=E3=83=A5=E3=83=BC=E3=83=88=E3=83=AA=E3=82=A2=E3=83=AB=E3=81=AF
+https://git-send-email.io =E3=81=A7=E5=88=A9=E7=94=A8=E3=81=A7=E3=81=8D=E3=
=81=BE=E3=81=99=E3=80=82
+
+``git send-email`` =E3=82=92=E4=BD=BF=E3=82=8F=E3=81=AA=E3=81=84=E3=81=93=
=E3=81=A8=E3=82=92=E9=81=B8=E3=81=B6=E5=A0=B4=E5=90=88:
+
+.. warning::
+
+  =E3=83=91=E3=83=83=E3=83=81=E3=82=92=E3=82=B3=E3=83=94=E3=83=BC=EF=BC=86=
=E3=83=9A=E3=83=BC=E3=82=B9=E3=83=88=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=
=81=AF=E3=80=81=E3=82=A8=E3=83=87=E3=82=A3=E3=82=BF=E3=81=AE word-wrap =E3=
=81=AB=E3=82=88=E3=81=A3=E3=81=A6
+  =E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E5=A3=8A=E3=82=8C=E3=81=AA=E3=81=84=
=E3=82=88=E3=81=86=E6=B3=A8=E6=84=8F=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=
=81=95=E3=81=84=E3=80=82
+
+=E5=9C=A7=E7=B8=AE=E3=81=AE=E6=9C=89=E7=84=A1=E3=81=AB=E3=81=8B=E3=81=8B=
=E3=82=8F=E3=82=89=E3=81=9A=E3=80=81=E3=83=91=E3=83=83=E3=83=81=E3=82=92 MI=
ME =E6=B7=BB=E4=BB=98=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=81=A8=E3=81=97=
=E3=81=A6=E6=B7=BB=E4=BB=98=E3=81=97=E3=81=A6=E3=81=AF
+=E3=81=84=E3=81=91=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=E5=A4=9A=E3=81=8F=
=E3=81=AE=E4=B8=80=E8=88=AC=E7=9A=84=E3=81=AA=E3=83=A1=E3=83=BC=E3=83=AB=E3=
=82=A2=E3=83=97=E3=83=AA=E3=82=B1=E3=83=BC=E3=82=B7=E3=83=A7=E3=83=B3=E3=81=
=AF=E3=80=81MIME =E6=B7=BB=E4=BB=98
+=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=82=92=E5=B8=B8=E3=81=AB=E3=83=97=
=E3=83=AC=E3=83=BC=E3=83=B3=E3=83=86=E3=82=AD=E3=82=B9=E3=83=88=E3=81=A8=E3=
=81=97=E3=81=A6=E9=80=81=E4=BF=A1=E3=81=99=E3=82=8B=E3=81=A8=E3=81=AF=E9=99=
=90=E3=82=89=E3=81=9A=E3=80=81=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE
+=E3=82=B3=E3=83=BC=E3=83=89=E3=81=AB=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=
=E3=81=A7=E3=81=8D=E3=81=AA=E3=81=8F=E3=81=AA=E3=82=8A=E3=81=BE=E3=81=99=E3=
=80=82MIME =E6=B7=BB=E4=BB=98=E3=83=95=E3=82=A1=E3=82=A4=E3=83=AB=E3=81=AF =
Linus =E3=81=8C
+=E5=87=A6=E7=90=86=E3=81=99=E3=82=8B=E3=81=AE=E3=81=AB=E3=82=82=E5=B0=91=
=E3=81=97=E4=BD=99=E5=88=86=E3=81=AA=E6=99=82=E9=96=93=E3=81=8C=E3=81=8B=E3=
=81=8B=E3=82=8B=E3=81=9F=E3=82=81=E3=80=81MIME =E6=B7=BB=E4=BB=98=E3=81=95=
=E3=82=8C=E3=81=9F=E5=A4=89=E6=9B=B4=E3=81=8C
+=E5=8F=97=E3=81=91=E5=85=A5=E3=82=8C=E3=82=89=E3=82=8C=E3=82=8B=E5=8F=AF=
=E8=83=BD=E6=80=A7=E3=82=92=E4=B8=8B=E3=81=92=E3=81=BE=E3=81=99=E3=80=82
+
+=E4=BE=8B=E5=A4=96:  =E3=83=A1=E3=83=BC=E3=83=A9=E3=81=8C=E3=83=91=E3=83=
=83=E3=83=81=E3=82=92=E5=A3=8A=E3=81=97=E3=81=A6=E3=81=97=E3=81=BE=E3=81=86=
=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E8=AA=B0=E3=81=8B=E3=81=8B=E3=82=89 MI=
ME =E3=82=92=E4=BD=BF=E3=81=A3=E3=81=A6
+=E5=86=8D=E9=80=81=E3=81=99=E3=82=8B=E3=82=88=E3=81=86=E6=B1=82=E3=82=81=
=E3=82=89=E3=82=8C=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E3=81=82=E3=82=8A=E3=
=81=BE=E3=81=99=E3=80=82
+
+=E3=83=91=E3=83=83=E3=83=81=E3=82=92=E5=A4=89=E6=9B=B4=E3=81=9B=E3=81=9A=
=E3=81=AB=E9=80=81=E4=BF=A1=E3=81=99=E3=82=8B=E3=82=88=E3=81=86=E3=83=A1=E3=
=83=BC=E3=83=AB=E3=82=AF=E3=83=A9=E3=82=A4=E3=82=A2=E3=83=B3=E3=83=88=E3=82=
=92=E8=A8=AD=E5=AE=9A=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AE
+=E3=83=92=E3=83=B3=E3=83=88=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=AF=
=E3=80=81Documentation/process/email-clients.rst =E3=82=92=E5=8F=82=E7=85=
=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+
+=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=
=E3=81=AB=E8=BF=94=E7=AD=94=E3=81=99=E3=82=8B
+--------------------------
+
+=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=AB=
=E3=81=AF=E3=80=81=E3=81=BB=E3=81=BC=E7=A2=BA=E5=AE=9F=E3=81=AB=E3=80=81=E3=
=83=91=E3=83=83=E3=83=81=E3=82=92=E6=94=B9=E5=96=84=E3=81=99=E3=82=8B=E6=96=
=B9=E6=B3=95=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6
+=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8B=E3=82=89=E3=82=B3=
=E3=83=A1=E3=83=B3=E3=83=88=E3=81=8C=E4=BB=98=E3=81=8D=E3=81=BE=E3=81=99=E3=
=80=82=E3=81=9D=E3=82=8C=E3=81=AF=E3=80=81=E3=81=82=E3=81=AA=E3=81=9F=E3=81=
=AE=E3=83=A1=E3=83=BC=E3=83=AB=E3=81=B8=E3=81=AE=E8=BF=94=E4=BF=A1=E3=81=A8=
=E3=81=84=E3=81=86
+=E5=BD=A2=E3=81=A7=E5=B1=8A=E3=81=8D=E3=81=BE=E3=81=99=E3=80=82=E3=81=9D=
=E3=82=8C=E3=82=89=E3=81=AE=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=81=AB=E3=
=81=AF=E5=BF=85=E3=81=9A=E8=BF=94=E7=AD=94=E3=81=97=E3=81=A6=E3=81=8F=E3=81=
=A0=E3=81=95=E3=81=84=E3=80=82=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=
=E3=82=92
+=E7=84=A1=E8=A6=96=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=81=AF=E3=80=81=
=E3=81=93=E3=81=A1=E3=82=89=E3=82=82=E7=84=A1=E8=A6=96=E3=81=95=E3=82=8C=E3=
=82=8B=E3=81=9F=E3=82=81=E3=81=AE=E3=82=88=E3=81=84=E6=96=B9=E6=B3=95=E3=81=
=A7=E3=81=99=E3=80=82=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=81=AB
+=E7=AD=94=E3=81=88=E3=82=8B=E3=81=AB=E3=81=AF=E3=80=81=E5=8D=98=E3=81=AB=
=E3=81=9D=E3=81=AE=E3=83=A1=E3=83=BC=E3=83=AB=E3=81=B8=E8=BF=94=E4=BF=A1=E3=
=81=99=E3=82=8C=E3=81=B0=E6=A7=8B=E3=81=84=E3=81=BE=E3=81=9B=E3=82=93=E3=80=
=82=E3=82=B3=E3=83=BC=E3=83=89=E5=A4=89=E6=9B=B4=E3=81=AB
+=E3=81=A4=E3=81=AA=E3=81=8C=E3=82=89=E3=81=AA=E3=81=84=E3=83=AC=E3=83=93=
=E3=83=A5=E3=83=BC=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=82=84=E8=B3=AA=E5=
=95=8F=E3=81=A7=E3=81=82=E3=81=A3=E3=81=A6=E3=82=82=E3=80=81=E6=AC=A1=E3=81=
=AE=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8C=E7=8A=B6=E6=B3=81=
=E3=82=92
+=E3=82=88=E3=82=8A=E3=82=88=E3=81=8F=E7=90=86=E8=A7=A3=E3=81=A7=E3=81=8D=
=E3=82=8B=E3=82=88=E3=81=86=E3=81=AB=E3=80=81=E3=81=BB=E3=81=BC=E7=A2=BA=E5=
=AE=9F=E3=81=AB=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=81=BE=E3=81=9F=E3=81=
=AF changelog =E3=82=A8=E3=83=B3=E3=83=88=E3=83=AA=E3=81=AB
+=E5=8F=8D=E6=98=A0=E3=81=99=E3=81=B9=E3=81=8D=E3=81=A7=E3=81=99=E3=80=82
+
+=E3=81=A9=E3=81=AE=E3=82=88=E3=81=86=E3=81=AA=E5=A4=89=E6=9B=B4=E3=82=92=
=E8=A1=8C=E3=81=86=E3=81=AE=E3=81=8B=E3=82=92=E3=83=AC=E3=83=93=E3=83=A5=E3=
=83=BC=E3=82=A2=E3=81=AB=E5=BF=85=E3=81=9A=E4=BC=9D=E3=81=88=E3=80=81=E6=99=
=82=E9=96=93=E3=82=92=E5=89=B2=E3=81=84=E3=81=A6=E3=81=8F=E3=82=8C=E3=81=9F
+=E3=81=93=E3=81=A8=E3=81=AB=E6=84=9F=E8=AC=9D=E3=81=97=E3=81=A6=E3=81=8F=
=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=82=B3=E3=83=BC=E3=83=89=E3=83=AC=E3=
=83=93=E3=83=A5=E3=83=BC=E3=81=AF=E7=96=B2=E3=82=8C=E3=82=8B=E3=80=81=E6=99=
=82=E9=96=93=E3=81=AE=E3=81=8B=E3=81=8B=E3=82=8B=E4=BD=9C=E6=A5=AD=E3=81=A7=
=E3=81=82=E3=82=8A=E3=80=81
+=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8C=E4=B8=8D=E6=A9=9F=
=E5=AB=8C=E3=81=AB=E3=81=AA=E3=82=8B=E3=81=93=E3=81=A8=E3=82=82=E3=81=82=E3=
=82=8A=E3=81=BE=E3=81=99=E3=80=82=E3=81=9D=E3=81=AE=E3=82=88=E3=81=86=E3=81=
=AA=E5=A0=B4=E5=90=88=E3=81=A7=E3=81=82=E3=81=A3=E3=81=A6=E3=82=82=E3=80=81
+=E4=B8=81=E5=AF=A7=E3=81=AB=E8=BF=94=E7=AD=94=E3=81=97=E3=80=81=E6=8C=87=
=E6=91=98=E3=81=95=E3=82=8C=E3=81=9F=E5=95=8F=E9=A1=8C=E3=81=AB=E5=AF=BE=E5=
=BF=9C=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E6=AC=
=A1=E3=81=AE=E7=89=88=E3=82=92=E9=80=81=E3=82=8B=E3=81=A8=E3=81=8D=E3=81=AF=
=E3=80=81
+cover letter =E3=81=BE=E3=81=9F=E3=81=AF=E5=80=8B=E3=80=85=E3=81=AE=E3=83=
=91=E3=83=83=E3=83=81=E3=81=AB ``patch changelog`` =E3=82=92=E8=BF=BD=E5=8A=
=A0=E3=81=97=E3=80=81=E5=89=8D=E5=9B=9E=E3=81=AE
+=E6=8A=95=E7=A8=BF=E3=81=A8=E3=81=AE=E5=B7=AE=E5=88=86=E3=82=92=E8=AA=AC=
=E6=98=8E=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E8=
=A9=B3=E7=B4=B0=E3=81=AF=E5=8E=9F=E6=96=87=E3=81=AE=E8=A9=B2=E5=BD=93=E7=AF=
=80
+("The canonical patch format") =E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=
=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+.. TODO: Convert to file-local cross-reference when the destination is
+   translated.
+
+=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=AB=
=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=81=97=E3=81=9F=E4=BA=BA=E3=81=AB=E3=
=81=AF=E3=80=81=E3=83=91=E3=83=83=E3=83=81=E3=81=AE Cc =E3=83=AA=E3=82=B9=
=E3=83=88=E3=81=AB=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=A6=E3=80=81
+=E6=96=B0=E3=81=97=E3=81=84=E7=89=88=E3=82=92=E7=9F=A5=E3=82=89=E3=81=9B=
=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E3=83=A1=E3=83=BC=E3=83=AB=E3=82=AF=E3=83=A9=E3=82=A4=E3=82=A2=E3=83=B3=
=E3=83=88=E3=81=A8=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=
=82=B9=E3=83=88=E3=81=A7=E3=81=AE=E4=BD=9C=E6=B3=95=E3=81=AB=E3=81=A4=E3=81=
=84=E3=81=A6=E3=81=AE=E6=8E=A8=E5=A5=A8=E4=BA=8B=E9=A0=85=E3=81=AF=E3=80=81
+Documentation/process/email-clients.rst =E3=82=92=E5=8F=82=E7=85=A7=E3=81=
=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
--=20
2.47.3

