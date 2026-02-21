Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E901322D7B1;
	Sat, 21 Feb 2026 15:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771688818; cv=pass; b=Uxa1pchQgpICOOrGr8dX4j8IN0yKBvjjDZZKm8cptWqkv0kgAdGADsGYKZjItLtjo+fXNnLTehXXWLLLWIlrtQx469CPvJyPorHScovhUHOvgIdY9E/3Bp5ClBWc2Fe8G7ljYYXVtiTfqHPjKcvaJoraobMx+bGY8OVVITIoM8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771688818; c=relaxed/simple;
	bh=NDg0/7G62KwS3455DweMqSNYyJUO79jUDyXYiTmW1R8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BR0IcJRFd9XIzuBCbU+A8xhZXikmeT3hFmmULqfe3q9VD87pG2tEGdNkqzGBxh/rvnWtXdvETh1RMDflLZXCg7zzM6AUexF7Gl+giQpU67wvFpW5MnEI5Di9x7GFdJMxQ0kOLofcaDOFO5PZh/FyEC2X+w/XlWo6/kGQ1YDUS/g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=wXuL1/62; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="wXuL1/62"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 61LElPGZ050227
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Sat, 21 Feb 2026 23:47:26 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 1D670109EFA43;
	Sat, 21 Feb 2026 23:47:25 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ibt8mtwMy45M; Sat, 21 Feb 2026 23:47:21 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 0BB83109EFA42; Sat, 21 Feb 2026 23:47:21 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1771685241;
	cv=none; b=hTshCVcbuSqgG2ed/jrUPWNqNlxm40Hm8Gc3ah0Sjk0ev0ja4eJgxPmZeOYpYDOqc88HXrPt/MAkaOkupUCS1hoRX+6WL6lpqmuYMUD3H0CnwZJJZKLrDt8fJ9WjJDSJ3w5tYCHuRKg1LbUJb7Mp9X5Uud/BGm9gDDV5c37te+g=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1771685241; c=relaxed/relaxed;
	bh=6UOIJsr8I6FpYw6XccTvSjPlOiKLH1fL7TrvSQVDX30=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=YO1T7U9v34zmT1UA+C3kuUvEpfYqE6EcqVez2PLxoMZzMuGKk7PwZGAeyVLvV5GFPvDTKpBVr6yVeJhv46wD5YsUpGgPkPHHPkJ/fTvrnxyFKKczX5DAItogYfDq3dAvUbNNoC5fjdfWcYDBB+sVmrpXbcwDfDupz5XYcXohWHc=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 0BB83109EFA42
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1771685241;
	bh=6UOIJsr8I6FpYw6XccTvSjPlOiKLH1fL7TrvSQVDX30=;
	h=From:To:Cc:Subject:Date:From;
	b=wXuL1/62yhuc/uXcwS4BCpexCB3593cP/i57u3o6Jh1/yk3dkEwipzKx99sAXU+s0
	 lTzwNbyCziEBwbDytAAKXa+tuDaXlHH9kyKOjYMEDQBgAPtYQDzeF2EdEoa3xFZ5ZD
	 pdcCEmus/OVGaFhefIWdwA4wBibZgnQ6DzjnMdLE=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, akiyks@gmail.com,
        weibu@redadmin.org
Subject: [PATCH v2] docs: ja_JP: process: translate first half of 'Describe your changes'
Date: Sat, 21 Feb 2026 23:47:15 +0900
Message-ID: <20260221144715.2934942-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the first half of the "Describe your changes" section in
Documentation/translations/ja_JP/process/submitting-patches.rst.

Wrap lines at around 74 columns, and avoid cross-references for now by
adding TODO notes to convert them to file-local references when the
destinations are translated.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst      | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index d61583399ef4..48188c772d47 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -54,3 +54,44 @@ Documentation/devicetree/bindings/submitting-patches.rst=
 =E3=82=92=E8=AA=AD=E3=82=93=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95
=20
 =E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=99=
=E3=82=8B
 ------------------
+
+=E5=95=8F=E9=A1=8C=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=E3=81=8F=
=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E3=
=83=91=E3=83=83=E3=83=81=E3=81=8C 1 =E8=A1=8C=E3=81=AE=E3=83=90=E3=82=B0=E4=
=BF=AE=E6=AD=A3=E3=81=A7=E3=81=82=E3=81=A3=E3=81=A6=E3=82=82=E3=80=81
+5000 =E8=A1=8C=E3=81=AE=E6=96=B0=E6=A9=9F=E8=83=BD=E3=81=A7=E3=81=82=E3=81=
=A3=E3=81=A6=E3=82=82=E3=80=81=E3=81=9D=E3=82=8C=E3=82=92=E8=A1=8C=E3=81=86=
=E5=8B=95=E6=A9=9F=E3=81=A8=E3=81=AA=E3=81=A3=E3=81=9F=E6=A0=B9=E6=9C=AC=E7=
=9A=84=E3=81=AA=E5=95=8F=E9=A1=8C=E3=81=8C
+=E5=BF=85=E3=81=9A=E3=81=82=E3=82=8B=E3=81=AF=E3=81=9A=E3=81=A7=E3=81=99=
=E3=80=82=E4=BF=AE=E6=AD=A3=E3=81=99=E3=81=B9=E3=81=8D=E4=BE=A1=E5=80=A4=E3=
=81=AE=E3=81=82=E3=82=8B=E5=95=8F=E9=A1=8C=E3=81=8C=E5=AD=98=E5=9C=A8=E3=81=
=97=E3=80=81=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8C
+=E6=9C=80=E5=88=9D=E3=81=AE=E6=AE=B5=E8=90=BD=E4=BB=A5=E9=99=8D=E3=82=92=
=E8=AA=AD=E3=82=80=E6=84=8F=E5=91=B3=E3=81=8C=E3=81=82=E3=82=8B=E3=81=93=E3=
=81=A8=E3=82=92=E7=B4=8D=E5=BE=97=E3=81=95=E3=81=9B=E3=81=A6=E3=81=8F=E3=81=
=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E3=83=A6=E3=83=BC=E3=82=B6=E3=83=BC=E3=81=8B=E3=82=89=E8=A6=8B=E3=81=88=
=E3=82=8B=E5=BD=B1=E9=9F=BF=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=E3=
=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=82=AF=E3=83=A9=E3=83=83=E3=82=
=B7=E3=83=A5=E3=82=84=E3=83=8F=E3=83=B3=E3=82=B0
+=EF=BC=88=E3=83=AD=E3=83=83=E3=82=AF=E3=82=A2=E3=83=83=E3=83=97=EF=BC=89=
=E3=81=AF=E5=88=86=E3=81=8B=E3=82=8A=E3=82=84=E3=81=99=E3=81=84=E3=81=A7=E3=
=81=99=E3=81=8C=E3=80=81=E3=81=99=E3=81=B9=E3=81=A6=E3=81=AE=E3=83=90=E3=82=
=B0=E3=81=8C=E3=81=9D=E3=81=93=E3=81=BE=E3=81=A7=E9=9C=B2=E9=AA=A8
+=E3=81=A8=E3=81=AF=E9=99=90=E3=82=8A=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82=
=E3=81=9F=E3=81=A8=E3=81=88=E3=82=B3=E3=83=BC=E3=83=89=E3=83=AC=E3=83=93=E3=
=83=A5=E3=83=BC=E4=B8=AD=E3=81=AB=E8=A6=8B=E3=81=A4=E3=81=8B=E3=81=A3=E3=81=
=9F=E5=95=8F=E9=A1=8C=E3=81=A7=E3=81=82=E3=81=A3=E3=81=A6=E3=82=82=E3=80=81
+=E3=83=A6=E3=83=BC=E3=82=B6=E3=83=BC=E3=81=AB=E3=81=A9=E3=81=AE=E3=82=88=
=E3=81=86=E3=81=AA=E5=BD=B1=E9=9F=BF=E3=81=8C=E3=81=82=E3=82=8A=E5=BE=97=E3=
=82=8B=E3=81=8B=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=E3=81=8F=E3=81=
=A0=E3=81=95=E3=81=84=E3=80=82
+Linux =E3=81=AE=E5=A4=9A=E3=81=8F=E3=81=AE=E7=92=B0=E5=A2=83=E3=81=AF=E3=
=80=81=E4=B8=8A=E6=B5=81=E3=81=8B=E3=82=89=E7=89=B9=E5=AE=9A=E3=81=AE=E3=83=
=91=E3=83=83=E3=83=81=E3=81=A0=E3=81=91=E3=82=92=E5=8F=96=E3=82=8A=E8=BE=BC=
=E3=82=80=E4=BA=8C=E6=AC=A1=E7=9A=84=E3=81=AA
+=E5=AE=89=E5=AE=9A=E7=89=88=E3=83=84=E3=83=AA=E3=83=BC=E3=82=84=E3=80=81=
=E3=83=99=E3=83=B3=E3=83=80=E3=83=BC=EF=BC=8F=E8=A3=BD=E5=93=81=E5=9B=BA=E6=
=9C=89=E3=81=AE=E3=83=84=E3=83=AA=E3=83=BC=E3=81=AE=E3=82=AB=E3=83=BC=E3=83=
=8D=E3=83=AB=E3=81=A7=E5=8B=95=E3=81=84=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=
=E3=80=82
+=E3=81=97=E3=81=9F=E3=81=8C=E3=81=A3=E3=81=A6=E3=80=81=E5=A4=89=E6=9B=B4=
=E3=82=92=E4=B8=8B=E6=B5=81=E3=81=B8=E9=81=A9=E5=88=87=E3=81=AB=E6=B5=81=E3=
=81=99=E5=8A=A9=E3=81=91=E3=81=AB=E3=81=AA=E3=82=8B=E6=83=85=E5=A0=B1=EF=BC=
=88=E7=99=BA=E7=94=9F=E6=9D=A1=E4=BB=B6=E3=80=81dmesg
+=E3=81=AE=E6=8A=9C=E7=B2=8B=E3=80=81=E3=82=AF=E3=83=A9=E3=83=83=E3=82=B7=
=E3=83=A5=E5=86=85=E5=AE=B9=E3=80=81=E6=80=A7=E8=83=BD=E5=8A=A3=E5=8C=96=E3=
=80=81=E3=83=AC=E3=82=A4=E3=83=86=E3=83=B3=E3=82=B7=E3=81=AE=E3=82=B9=E3=83=
=91=E3=82=A4=E3=82=AF=E3=80=81
+=E3=83=8F=E3=83=B3=E3=82=B0=EF=BC=8F=E3=83=AD=E3=83=83=E3=82=AF=E3=82=A2=
=E3=83=83=E3=83=97=E7=AD=89=EF=BC=89=E3=81=8C=E3=81=82=E3=82=8C=E3=81=B0=E8=
=A8=98=E8=BC=89=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=
=82
+
+=E6=9C=80=E9=81=A9=E5=8C=96=E3=81=A8=E3=83=88=E3=83=AC=E3=83=BC=E3=83=89=
=E3=82=AA=E3=83=95=E3=82=92=E5=AE=9A=E9=87=8F=E7=9A=84=E3=81=AB=E7=A4=BA=E3=
=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=83=91=E3=83=
=95=E3=82=A9=E3=83=BC=E3=83=9E=E3=83=B3=E3=82=B9=E3=80=81
+=E3=83=A1=E3=83=A2=E3=83=AA=E6=B6=88=E8=B2=BB=E9=87=8F=E3=80=81=E3=82=B9=
=E3=82=BF=E3=83=83=E3=82=AF=E3=83=95=E3=83=83=E3=83=88=E3=83=97=E3=83=AA=E3=
=83=B3=E3=83=88=E3=80=81=E3=83=90=E3=82=A4=E3=83=8A=E3=83=AA=E3=82=B5=E3=82=
=A4=E3=82=BA=E3=81=AE=E6=94=B9=E5=96=84=E3=82=92=E4=B8=BB=E5=BC=B5
+=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E3=81=9D=E3=82=8C=
=E3=82=92=E8=A3=8F=E4=BB=98=E3=81=91=E3=82=8B=E6=95=B0=E5=80=A4=E3=82=92=E8=
=A8=98=E8=BC=89=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=
=82=E3=81=BE=E3=81=9F=E3=80=81=E7=9B=AE=E3=81=AB=E8=A6=8B=E3=81=88=E3=81=AA=
=E3=81=84
+=E3=82=B3=E3=82=B9=E3=83=88=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=82=82=
=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=
=80=82=E6=9C=80=E9=81=A9=E5=8C=96=E3=81=AF=E9=80=9A=E5=B8=B8=E3=80=81CPU=E3=
=80=81=E3=83=A1=E3=83=A2=E3=83=AA=E3=80=81
+=E5=8F=AF=E8=AA=AD=E6=80=A7=E3=81=AA=E3=81=A9=E3=81=AE=E3=82=B3=E3=82=B9=
=E3=83=88=E3=82=92=E4=BC=B4=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E3=83=92=E3=
=83=A5=E3=83=BC=E3=83=AA=E3=82=B9=E3=83=86=E3=82=A3=E3=82=AF=E3=82=B9=E3=81=
=AE=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E7=95=B0=E3=81=AA=E3=82=8B
+=E3=83=AF=E3=83=BC=E3=82=AF=E3=83=AD=E3=83=BC=E3=83=89=E9=96=93=E3=81=AE=
=E3=83=88=E3=83=AC=E3=83=BC=E3=83=89=E3=82=AA=E3=83=95=E3=82=82=E7=99=BA=E7=
=94=9F=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=E3=83=AC=E3=83=93=E3=83=A5=E3=83=
=BC=E3=82=A2=E3=81=8C=E3=82=B3=E3=82=B9=E3=83=88=E3=81=A8
+=E3=83=A1=E3=83=AA=E3=83=83=E3=83=88=E3=82=92=E6=AF=94=E8=BC=83=E6=A4=9C=
=E8=A8=8E=E3=81=A7=E3=81=8D=E3=82=8B=E3=82=88=E3=81=86=E3=80=81=E6=9C=80=E9=
=81=A9=E5=8C=96=E3=81=AB=E3=82=88=E3=81=A3=E3=81=A6=E4=BA=88=E6=83=B3=E3=81=
=95=E3=82=8C=E3=82=8B=E3=83=87=E3=83=A1=E3=83=AA=E3=83=83=E3=83=88=E3=81=AB
+=E3=81=A4=E3=81=84=E3=81=A6=E3=82=82=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=
=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E5=95=8F=E9=A1=8C=E3=81=8C=E7=89=B9=E5=AE=9A=E3=81=A7=E3=81=8D=E3=81=9F=
=E3=82=89=E3=80=81=E5=AE=9F=E9=9A=9B=E3=81=AB=E3=81=A9=E3=81=AE=E3=82=88=E3=
=81=86=E3=81=AA=E5=AF=BE=E7=AD=96=E3=82=92=E8=AC=9B=E3=81=98=E3=81=A6=E3=81=
=84=E3=82=8B=E3=81=8B=E3=82=92=E6=8A=80=E8=A1=93=E7=9A=84=E3=81=AB
+=E8=A9=B3=E3=81=97=E3=81=8F=E8=AA=AC=E6=98=8E=E3=81=97=E3=81=A6=E3=81=8F=
=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=
=82=A2=E3=81=8C=E3=82=B3=E3=83=BC=E3=83=89=E3=81=8C=E6=84=8F=E5=9B=B3=E3=81=
=97=E3=81=9F=E3=81=A8=E3=81=8A=E3=82=8A=E3=81=AB=E5=8B=95=E4=BD=9C
+=E3=81=97=E3=81=A6=E3=81=84=E3=82=8B=E3=81=8B=E3=82=92=E7=A2=BA=E8=AA=8D=
=E3=81=A7=E3=81=8D=E3=82=8B=E3=82=88=E3=81=86=E3=80=81=E5=A4=89=E6=9B=B4=E5=
=86=85=E5=AE=B9=E3=82=92=E5=B9=B3=E6=98=93=E3=81=AA=E8=A8=80=E8=91=89=E3=81=
=A7=E8=AA=AC=E6=98=8E=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C
+=E9=87=8D=E8=A6=81=E3=81=A7=E3=81=99=E3=80=82
+
+=E3=83=91=E3=83=83=E3=83=81=E8=AA=AC=E6=98=8E=E3=82=92 Linux =E3=81=AE=E3=
=82=BD=E3=83=BC=E3=82=B9=E3=82=B3=E3=83=BC=E3=83=89=E7=AE=A1=E7=90=86=E3=82=
=B7=E3=82=B9=E3=83=86=E3=83=A0 ``git`` =E3=81=AE
+=E3=80=8C=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=83=AD=E3=82=B0=E3=80=8D=
=E3=81=A8=E3=81=97=E3=81=A6=E3=81=9D=E3=81=AE=E3=81=BE=E3=81=BE=E5=8F=96=E3=
=82=8A=E8=BE=BC=E3=82=81=E3=82=8B=E5=BD=A2=E3=81=A7=E6=9B=B8=E3=81=91=E3=81=
=B0=E3=80=81=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=81=AF
+=E5=8A=A9=E3=81=8B=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E8=A9=B3=E7=B4=B0=
=E3=81=AF=E5=8E=9F=E6=96=87=E3=81=AE=E8=A9=B2=E5=BD=93=E7=AF=80=E3=82=92=E5=
=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=
=82
+
+.. TODO: Convert to file-local cross-reference when the destination is tra=
nslated.
+
+1 =E3=81=A4=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=A7=E3=81=AF 1 =E3=81=
=A4=E3=81=AE=E5=95=8F=E9=A1=8C=E3=81=A0=E3=81=91=E3=82=92=E8=A7=A3=E6=B1=BA=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E8=AA=AC=E6=
=98=8E=E3=81=8C=E9=95=B7=E3=81=8F=E3=81=AA=E3=82=8A
+=E5=A7=8B=E3=82=81=E3=81=9F=E3=82=89=E3=80=81=E3=83=91=E3=83=83=E3=83=81=
=E3=82=92=E5=88=86=E5=89=B2=E3=81=99=E3=81=B9=E3=81=8D=E3=82=B5=E3=82=A4=E3=
=83=B3=E3=81=A7=E3=81=99=E3=80=82=E8=A9=B3=E7=B4=B0=E3=81=AF=E5=8E=9F=E6=96=
=87=E3=81=AE=E8=A9=B2=E5=BD=93=E7=AF=80=E3=82=92=E5=8F=82=E7=85=A7
+=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+.. TODO: Convert to file-local cross-reference when the destination is tra=
nslated.
--=20
2.47.3

