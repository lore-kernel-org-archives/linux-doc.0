Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E772F746D;
	Sat,  6 Jun 2026 04:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780719014; cv=pass; b=Hv1RZKrYmiZUqvTmZUMARbcofUkMXg78CsGTCJR0TgrMZeNFpraESuFtRKKGZo49yZjCCQuuPsBjSaHXe3as3m82o7vxP3Fbacz8fHL5sQZXG8VMVAi9QwJWAoGt/Y7SOInDMAv1fKmhX44R5OzU1W0Jtw1jJ4QYUWyTf4cSvQg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780719014; c=relaxed/simple;
	bh=jMj9c3IfP+tyqlgRZi1huwQY320WIuSY+aJDNsp9xgI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ODDRF46osIJIEOV5KYCZqFOtk33LFRGhdbntfvAm+/H93NQC7N49MC1VSQsGDP6EKFCHa9IuMitOJzzkQOM12b5i496kDfbOqlK0tkcsbeeQPvAfxmUCL4IJS7WfU4p02mNJqLmRIkt42dmkKyS5NdkUzvSpLIEFuLoM6JipSQA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=fSglB/z9; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="fSglB/z9"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id AE0C411973336;
	Sat,  6 Jun 2026 13:00:04 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZefMSO6J9hN; Sat,  6 Jun 2026 12:59:57 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1780718397;
	b=CekU9abfAJQ23sScd+XT1hgAZUs2FKK8yLta374jATkIf21pUQuo4qZ6N6HOqNU8xe0k
	 wdaBr4TFk1FYmVTe3eNCUBCW2XndpoXcQ2BBOeQWAFsiFZnyPR81qDBU4Fv1xBHW24pSx
	 vGr62uKxueIh0g5o2VK10hmkizsHJi8DVk=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1780718397;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=y/wlgbokZzSMKCzQxd2CIBaPnIU1aD6YGe/tQNOoeks=;
	b=waYzNfpdpIysYGAoGZ1gf9juwq7P/TuYYHBeYSWmt7PZJKypdIdq8V8YpfwhOsu7Wlcd
	 RcJMEsWkox33y3G2lH8q2gHfM7YIyXd3NzbStPyR9WG1nR8d4cgdr+Zv5lv/yR0xmS7en
	 3qCcBTuNsiiHddHV7xciNqHnCVPcgnkuvY=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
Received: by www.redadmin.org (Postfix, from userid 1000)
	id C1847102D0638; Sat,  6 Jun 2026 12:59:57 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org C1847102D0638
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1780718397;
	bh=y/wlgbokZzSMKCzQxd2CIBaPnIU1aD6YGe/tQNOoeks=;
	h=From:To:Cc:Subject:Date:From;
	b=fSglB/z9LjCdqSuZr52nPe4v3R3hpy1FULpp6G33yxTfi3RLQgO8cWo+sgXoH5Gac
	 ZRXULpwl8c2Wxs1Cs8FEK7fzleD4QhlCHiwkI6IGDi1cfh4t+yItRAXwLnVg4Bg6WA
	 1bS4ha70l1JAENwleufZaf9WosWGP2utYXCSZERs=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	akiyks@gmail.com,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v1] docs/ja_JP: translate submitting-patches.rst (interleaved-replies)
Date: Sat,  6 Jun 2026 12:59:54 +0900
Message-ID: <20260606035954.27605-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the "Use trimmed interleaved replies in email discussions"
and "Don't get discouraged - or impatient" sections in
Documentation/translations/ja_JP/process/submitting-patches.rst.

Keep the wording close to the English text and wrap lines to match
the style used in the surrounding Japanese translation.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst      | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 165cb3ed94ec..d31d469909e4 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -355,3 +355,50 @@ cover letter =E3=81=BE=E3=81=9F=E3=81=AF=E5=80=8B=E3=
=80=85=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=AB ``patch changelog`` =E3=
=82=92=E8=BF=BD=E5=8A=A0=E3=81=97=E3=80=81
=20
 =E3=83=A1=E3=83=BC=E3=83=AB=E3=82=AF=E3=83=A9=E3=82=A4=E3=82=A2=E3=83=B3=
=E3=83=88=E3=81=A8=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=
=82=B9=E3=83=88=E3=81=A7=E3=81=AE=E4=BD=9C=E6=B3=95=E3=81=AB=E3=81=A4=E3=81=
=84=E3=81=A6=E3=81=AE=E6=8E=A8=E5=A5=A8=E4=BA=8B=E9=A0=85=E3=81=AF=E3=80=81
 Documentation/process/email-clients.rst =E3=82=92=E5=8F=82=E7=85=A7=E3=81=
=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E3=83=A1=E3=83=BC=E3=83=AB=E8=AD=B0=E8=AB=96=E3=81=A7=E3=81=AF=E4=B8=8D=
=E8=A6=81=E3=81=AA=E5=BC=95=E7=94=A8=E3=82=92=E5=89=8A=E3=81=A3=E3=81=9F in=
terleaved replies =E3=82=92=E4=BD=BF=E3=81=86
+------------------------------------------------------------
+
+Linux =E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E9=96=8B=E7=99=BA=E3=81=AE=E8=
=AD=B0=E8=AB=96=E3=81=A7=E3=81=AF=E3=80=81top-posting =E3=81=AF=E5=BC=B7=E3=
=81=8F=E9=9D=9E=E6=8E=A8=E5=A5=A8=E3=81=A8=E3=81=95=E3=82=8C=E3=81=A6=E3=81=
=84=E3=81=BE=E3=81=99=E3=80=82
+Interleaved replies=E3=80=81=E3=81=BE=E3=81=9F=E3=81=AF ``inline`` replies=
 =E3=82=92=E4=BD=BF=E3=81=86=E3=81=A8=E3=80=81=E4=BC=9A=E8=A9=B1=E3=81=AE=
=E6=B5=81=E3=82=8C=E3=82=92
+=E3=81=9A=E3=81=A3=E3=81=A8=E8=BF=BD=E3=81=84=E3=82=84=E3=81=99=E3=81=8F=
=E3=81=AA=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E8=A9=B3=E7=B4=B0=E3=81=AF=E6=
=AC=A1=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=
=95=E3=81=84:
+https://en.wikipedia.org/wiki/Posting_style#Interleaved_style
+
+=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=B9=E3=83=88=
=E3=81=A7=E3=81=AF=E3=80=81=E3=82=88=E3=81=8F=E6=AC=A1=E3=81=AE=E3=82=88=E3=
=81=86=E3=81=AB=E5=BC=95=E7=94=A8=E3=81=95=E3=82=8C=E3=81=BE=E3=81=99::
+
+  A: http://en.wikipedia.org/wiki/Top_post
+  Q: Where do I find info about this thing called top-posting?
+  A: Because it messes up the order in which people normally read text.
+  Q: Why is top-posting such a bad thing?
+  A: Top-posting.
+  Q: What is the most annoying thing in e-mail?
+
+=E5=90=8C=E6=A7=98=E3=81=AB=E3=80=81=E8=BF=94=E4=BF=A1=E3=81=AB=E9=96=A2=
=E4=BF=82=E3=81=AE=E3=81=AA=E3=81=84=E4=B8=8D=E8=A6=81=E3=81=AA=E5=BC=95=E7=
=94=A8=E3=81=AF=E3=81=99=E3=81=B9=E3=81=A6=E5=89=8A=E3=81=A3=E3=81=A6=E3=81=
=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=81=9D=E3=81=86=E3=81=99=E3=82=8B=E3=81=93=E3=81=A8=E3=81=A7=E3=80=81=
=E8=BF=94=E7=AD=94=E3=82=92=E8=A6=8B=E3=81=A4=E3=81=91=E3=82=84=E3=81=99=E3=
=81=8F=E3=81=AA=E3=82=8A=E3=80=81=E6=99=82=E9=96=93=E3=81=A8=E5=AE=B9=E9=87=
=8F=E3=82=92=E7=AF=80=E7=B4=84=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=99=E3=80=82
+=E8=A9=B3=E7=B4=B0=E3=81=AF=E6=AC=A1=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=
=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84: http://daringfireball.net/20=
07/07/on_top ::
+
+  A: No.
+  Q: Should I include quotations after my reply?
+
+
+=E8=90=BD=E8=83=86=E3=81=97=E3=81=AA=E3=81=84=E3=80=81=E3=81=9D=E3=81=97=
=E3=81=A6=E6=80=A5=E3=81=8C=E3=81=AA=E3=81=84
+--------------------------
+
+=E5=A4=89=E6=9B=B4=E3=82=92=E6=8A=95=E7=A8=BF=E3=81=97=E3=81=9F=E5=BE=8C=
=E3=81=AF=E3=80=81=E8=BE=9B=E6=8A=B1=E5=BC=B7=E3=81=8F=E5=BE=85=E3=81=A3=E3=
=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=83=AC=E3=83=93=E3=83=
=A5=E3=83=BC=E3=82=A2=E3=81=AF=E5=BF=99=E3=81=97=E3=81=84=E4=BA=BA=E3=81=9F=
=E3=81=A1=E3=81=A7=E3=81=82=E3=82=8A=E3=80=81
+=E3=81=82=E3=81=AA=E3=81=9F=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=82=92=
=E3=81=99=E3=81=90=E3=81=AB=E8=A6=8B=E3=82=89=E3=82=8C=E3=82=8B=E3=81=A8=E3=
=81=AF=E9=99=90=E3=82=8A=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82
+
+=E3=81=8B=E3=81=A4=E3=81=A6=E3=81=AF=E3=80=81=E3=83=91=E3=83=83=E3=83=81=
=E3=81=8C=E4=BD=95=E3=81=AE=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=82=82=E3=
=81=AA=E3=81=8F=E8=99=9A=E7=A9=BA=E3=81=B8=E6=B6=88=E3=81=88=E3=81=A6=E3=81=
=84=E3=81=8F=E3=81=93=E3=81=A8=E3=82=82=E3=81=82=E3=82=8A=E3=81=BE=E3=81=97=
=E3=81=9F=E3=81=8C=E3=80=81
+=E7=8F=BE=E5=9C=A8=E3=81=AE=E9=96=8B=E7=99=BA=E3=83=97=E3=83=AD=E3=82=BB=
=E3=82=B9=E3=81=AF=E3=81=9D=E3=82=8C=E3=82=88=E3=82=8A=E3=82=82=E5=86=86=E6=
=BB=91=E3=81=AB=E6=A9=9F=E8=83=BD=E3=81=97=E3=81=A6=E3=81=84=E3=81=BE=E3=81=
=99=E3=80=82=E6=95=B0=E9=80=B1=E9=96=93=E4=BB=A5=E5=86=85=E3=80=81
+=E9=80=9A=E5=B8=B8=E3=81=AF 2=E3=80=9C3 =E9=80=B1=E9=96=93=E4=BB=A5=E5=86=
=85=E3=81=AB=E3=82=B3=E3=83=A1=E3=83=B3=E3=83=88=E3=82=92=E5=8F=97=E3=81=91=
=E5=8F=96=E3=82=8B=E3=81=AF=E3=81=9A=E3=81=A7=E3=81=99=E3=80=82=E3=81=9D=E3=
=81=86=E3=81=AA=E3=82=89=E3=81=AA=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=
=81
+=E3=83=91=E3=83=83=E3=83=81=E3=82=92=E6=AD=A3=E3=81=97=E3=81=84=E5=A0=B4=
=E6=89=80=E3=81=B8=E9=80=81=E3=81=A3=E3=81=9F=E3=81=8B=E7=A2=BA=E8=AA=8D=E3=
=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=86=8D=E6=8A=
=95=E7=A8=BF=E3=81=97=E3=81=9F=E3=82=8A=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=
=E3=82=A2=E3=81=AB
+ping =E3=81=97=E3=81=9F=E3=82=8A=E3=81=99=E3=82=8B=E5=89=8D=E3=81=AB=E3=80=
=81=E5=B0=91=E3=81=AA=E3=81=8F=E3=81=A8=E3=82=82 1 =E9=80=B1=E9=96=93=E3=81=
=AF=E5=BE=85=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=
merge window =E3=81=AE
+=E3=82=88=E3=81=86=E3=81=AA=E5=BF=99=E3=81=97=E3=81=84=E6=99=82=E6=9C=9F=
=E3=81=AB=E3=81=AF=E3=80=81=E3=81=95=E3=82=89=E3=81=AB=E9=95=B7=E3=81=8F=E5=
=BE=85=E3=81=A4=E6=96=B9=E3=81=8C=E3=82=88=E3=81=84=E5=A0=B4=E5=90=88=E3=82=
=82=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82
+
+=E6=95=B0=E9=80=B1=E9=96=93=E5=BE=8C=E3=81=AB=E3=80=81subject line =E3=81=
=AB "RESEND" =E3=82=92=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=A6=E3=80=81=E3=83=
=91=E3=83=83=E3=83=81=E3=81=BE=E3=81=9F=E3=81=AF
+=E3=83=91=E3=83=83=E3=83=81=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=E3=82=92=
=E5=86=8D=E9=80=81=E3=81=97=E3=81=A6=E3=82=82=E6=A7=8B=E3=81=84=E3=81=BE=E3=
=81=9B=E3=82=93::
+
+   [PATCH Vx RESEND] sub/sys: Condensed patch summary
+
+=E3=83=91=E3=83=83=E3=83=81=E3=81=BE=E3=81=9F=E3=81=AF=E3=83=91=E3=83=83=
=E3=83=81=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=E3=81=AE=E4=BF=AE=E6=AD=A3=E7=
=89=88=E3=82=92=E6=8A=95=E7=A8=BF=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=
=AF=E3=80=81"RESEND" =E3=82=92
+=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=AA=E3=81=84=E3=81=A7=E3=81=8F=E3=81=A0=
=E3=81=95=E3=81=84=E3=80=82"RESEND" =E3=81=AF=E3=80=81=E5=89=8D=E5=9B=9E=E3=
=81=AE=E6=8A=95=E7=A8=BF=E3=81=8B=E3=82=89=E4=B8=80=E5=88=87=E5=A4=89=E6=9B=
=B4=E3=81=97=E3=81=A6=E3=81=84=E3=81=AA=E3=81=84
+=E3=83=91=E3=83=83=E3=83=81=E3=81=BE=E3=81=9F=E3=81=AF=E3=83=91=E3=83=83=
=E3=83=81=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=E3=82=92=E5=86=8D=E9=80=81=E3=
=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=AB=E3=81=AE=E3=81=BF=E4=BD=BF=E3=81=
=84=E3=81=BE=E3=81=99=E3=80=82
--=20
2.52.0

