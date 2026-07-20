Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC3D3822A5;
	Mon, 20 Jul 2026 22:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784586872; cv=pass; b=iAEK/g2zfWgbaAvUblsHIL8YJFWatvcMJi9/IzBjTBI/1uIsgGVPvbpBlKlBb50M8BDdBe4JM11tJT74KDrjT3cUiRts2/kIgqg9rOXN+J8UNDOFleVdwFodpgG5KHFfs/uZYI9zk9Eaemtdnz3HEbdLzON1UsO5PthC/9I/NBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784586872; c=relaxed/simple;
	bh=i+8iP6TqvcE/Fwsg3chLexyR7rglhtQJDkM0lDIBRUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cy0NHKH+EwGaAWpQBNCftr9JP5rf7qiRQIN2JbE9iqiF34kZWyLmGZvkf7aAh63Jmjz+ghTQnbES9FDztbZjjrhxWk4ivk46RGi0KlxkCV1ieJvSH2GWHp+7FIof0VP2apZRQVAusakcmKQNOIFdnt8usEm7FPAGUKKYiumF2wo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=ulNCAZMP; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="ulNCAZMP"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 48812109EBDF9;
	Tue, 21 Jul 2026 07:34:17 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QTxq_byMZNKy; Tue, 21 Jul 2026 07:34:13 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256; cv=none;
	t=1784586853;
	b=JIYIPZfEjlURN4ZkVEQ68vhu0FMY3a8U4R08fBFOHoZSWUpr23ODGlOCQcrhkzzxHBpx
	 cumsW63vZCX9PCvQEiFNlfjqE4+Ha5YNa05ihEVQ8Wh4Qo6U2kbCymOBl1Q63wfMRuSTs
	 UvSvFbdGhqzMEzNTYTvJeC+Uzi6FgEk/14=
ARC-Message-Signature: i=1; d=redadmin.org; s=20231208space; a=rsa-sha256;
	c=relaxed/relaxed; t=1784586853;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=8f6cJV5k02j/+gzqFC3ZYN9KAj3p0Mk6s+ZCRMZxRIQ=;
	b=Vd0uxwmF10ZAn6d6wPDCuyVvFZeIy4DKwqFbVUe2TEsui4WBlXrHej+7WOPFzOEYXjYn
	 CBDip8e58R1zIxUvv7bObGIK6mdI7771oidjwrdqRK2PZo4Q9fZdSxO3hlR9H8IGqonkl
	 cnGAOuygnkf03JcZ2Zf/ByZj29kmy8JTkY=
ARC-Authentication-Results: i=1; www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 3484E109EFAF6; Tue, 21 Jul 2026 07:34:13 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 3484E109EFAF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1784586853;
	bh=8f6cJV5k02j/+gzqFC3ZYN9KAj3p0Mk6s+ZCRMZxRIQ=;
	h=From:To:Cc:Subject:Date:From;
	b=ulNCAZMPZLX3qYqc9s03AY4dFUcEqjqnLRPJoG1J0GqThbmeLvfjCI6UV+/1fKblM
	 Hm3k4JUkzdS1LptiZGrlJHhZ35ryFWsh4zE2U61Ci14eQ4mMU+AOBc25KTmhKvwrjs
	 evgK8h+TAENorElDKExVZenV1Rwxf/f++JKBjTd8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	akiyks@gmail.com,
	weibu@redadmin.org
Subject: [PATCH v6] docs/ja_JP: translate submitting-patches.rst (sign-off)
Date: Tue, 21 Jul 2026 07:34:10 +0900
Message-ID: <20260720223410.421262-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the "Include PATCH in the subject" and "Sign your work -
the Developer's Certificate of Origin" sections into Japanese.

Keep the DCO text in English as the original certificate text, and add
a Japanese note that the sign-off refers to the English DCO text.

Use a reStructuredText note directive to make it clear that the note is
specific to the Japanese translation.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
Changes in v6:

Remove the extra blank line at EOF introduced during the rebase.

 .../ja_JP/process/submitting-patches.rst      | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index d8ee82ba790b..22d54b663051 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -402,3 +402,80 @@ ping =E3=81=97=E3=81=9F=E3=82=8A=E3=81=99=E3=82=8B=E5=
=89=8D=E3=81=AB=E3=80=81=E5=B0=91=E3=81=AA=E3=81=8F=E3=81=A8=E3=82=82 1 =E9=
=80=B1=E9=96=93=E3=81=AF=E5=BE=85=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=
=95=E3=81=84=E3=80=82
 =E3=82=92=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=AA=E3=81=84=E3=81=A7=E3=81=8F=
=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
 "RESEND" =E3=81=AF=E3=80=81=E5=89=8D=E5=9B=9E=E3=81=AE=E6=8A=95=E7=A8=BF=
=E3=81=8B=E3=82=89=E4=B8=80=E5=88=87=E5=A4=89=E6=9B=B4=E3=81=AE=E3=81=AA=E3=
=81=84=E3=83=91=E3=83=83=E3=83=81=E3=81=BE=E3=81=9F=E3=81=AF=E3=83=91=E3=83=
=83=E3=83=81=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=E3=81=AE
 =E5=86=8D=E9=80=81=E3=81=A0=E3=81=91=E3=81=AB=E5=BD=93=E3=81=A6=E3=81=AF=
=E3=81=BE=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82
+
+
+=E4=BB=B6=E5=90=8D=E3=81=AB PATCH =E3=82=92=E5=90=AB=E3=82=81=E3=82=8B
+---------------------
+
+Linus =E3=81=A8 linux-kernel =E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=
=E3=83=AA=E3=82=B9=E3=83=88=E3=81=AB=E3=81=AF=E5=A4=A7=E9=87=8F=E3=81=AE=E3=
=83=A1=E3=83=BC=E3=83=AB=E3=81=8C=E5=B1=8A=E3=81=8F=E3=81=9F=E3=82=81=E3=80=
=81
+=E4=BB=B6=E5=90=8D=E3=81=AE=E5=85=88=E9=A0=AD=E3=81=AB ``[PATCH]`` =E3=82=
=92=E4=BB=98=E3=81=91=E3=82=8B=E3=81=93=E3=81=A8=E3=81=8C=E4=B8=80=E8=88=AC=
=E7=9A=84=E3=81=AA=E6=85=A3=E4=BE=8B=E3=81=A8=E3=81=AA=E3=81=A3=E3=81=A6=E3=
=81=84=E3=81=BE=E3=81=99=E3=80=82
+=E3=81=93=E3=82=8C=E3=81=AB=E3=82=88=E3=82=8A=E3=80=81Linus =E3=82=84=E4=
=BB=96=E3=81=AE=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E9=96=8B=E7=99=BA=E8=80=
=85=E3=81=AF=E3=80=81=E3=83=91=E3=83=83=E3=83=81=E3=81=A8=E3=81=9D=E3=81=AE=
=E4=BB=96=E3=81=AE=E8=AD=B0=E8=AB=96=E3=82=92
+=E5=AE=B9=E6=98=93=E3=81=AB=E5=8C=BA=E5=88=A5=E3=81=A7=E3=81=8D=E3=81=BE=
=E3=81=99=E3=80=82
+
+``git send-email`` =E3=81=AF=E3=80=81=E3=81=93=E3=81=AE=E6=8C=87=E5=AE=9A=
=E3=82=92=E8=87=AA=E5=8B=95=E7=9A=84=E3=81=AB=E8=A1=8C=E3=81=84=E3=81=BE=E3=
=81=99=E3=80=82
+
+
+=E4=BD=9C=E6=A5=AD=E3=81=B8=E3=81=AE=E7=BD=B2=E5=90=8D - Developer's Certi=
ficate of Origin
+--------------------------------------------------
+
+=E8=AA=B0=E3=81=8C=E4=BD=95=E3=82=92=E8=A1=8C=E3=81=A3=E3=81=9F=E3=81=AE=
=E3=81=8B=E3=82=92=E8=BF=BD=E8=B7=A1=E3=81=97=E3=82=84=E3=81=99=E3=81=8F=E3=
=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=80=81=E7=89=B9=E3=81=AB=E3=83=91=E3=83=
=83=E3=83=81=E3=81=8C=E8=A4=87=E6=95=B0=E9=9A=8E=E5=B1=A4=E3=81=AE
+=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=83=BC=E3=82=92=E7=B5=8C=E7=94=B1=
=E3=81=97=E3=81=A6=E6=9C=80=E7=B5=82=E7=9A=84=E3=81=AB=E3=82=AB=E3=83=BC=E3=
=83=8D=E3=83=AB=E3=81=B8=E5=8F=96=E3=82=8A=E8=BE=BC=E3=81=BE=E3=82=8C=E3=82=
=8B=E5=A0=B4=E5=90=88=E3=81=AB=E5=82=99=E3=81=88=E3=81=A6=E3=80=81
+=E3=83=A1=E3=83=BC=E3=83=AB=E3=81=A7=E3=82=84=E3=82=8A=E5=8F=96=E3=82=8A=
=E3=81=95=E3=82=8C=E3=82=8B=E3=83=91=E3=83=83=E3=83=81=E3=81=AB=E3=81=AF si=
gn-off =E3=81=AE=E6=89=8B=E7=B6=9A=E3=81=8D=E3=81=8C=E5=B0=8E=E5=85=A5=E3=
=81=95=E3=82=8C=E3=81=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82
+
+sign-off =E3=81=AF=E3=80=81=E3=83=91=E3=83=83=E3=83=81=E3=81=AE=E8=AA=AC=
=E6=98=8E=E3=81=AE=E6=9C=AB=E5=B0=BE=E3=81=AB=E8=BF=BD=E5=8A=A0=E3=81=99=E3=
=82=8B=E5=8D=98=E7=B4=94=E3=81=AA=E4=B8=80=E8=A1=8C=E3=81=A7=E3=81=99=E3=80=
=82=E3=81=93=E3=82=8C=E3=81=AF=E3=80=81
+=E3=81=9D=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=82=92=E8=87=AA=E5=88=86=
=E3=81=A7=E4=BD=9C=E6=88=90=E3=81=97=E3=81=9F=E3=81=8B=E3=80=81=E3=82=AA=E3=
=83=BC=E3=83=97=E3=83=B3=E3=82=BD=E3=83=BC=E3=82=B9=E3=81=AE=E3=83=91=E3=83=
=83=E3=83=81=E3=81=A8=E3=81=97=E3=81=A6=E6=8F=90=E5=87=BA=E3=81=99=E3=82=8B
+=E6=A8=A9=E5=88=A9=E3=82=92=E6=8C=81=E3=81=A3=E3=81=A6=E3=81=84=E3=82=8B=
=E3=81=93=E3=81=A8=E3=82=92=E8=A8=BC=E6=98=8E=E3=81=97=E3=81=BE=E3=81=99=E3=
=80=82
+
+.. note:: =E3=80=90=E8=A8=B3=E8=A8=BB=E3=80=91
+
+   ``Signed-off-by`` =E3=81=AB=E3=82=88=E3=81=A3=E3=81=A6=E5=90=8C=E6=84=
=8F=E3=81=99=E3=82=8B=E5=AF=BE=E8=B1=A1=E3=81=AF=E3=80=81=E7=BF=BB=E8=A8=B3=
=E6=96=87=E3=81=A7=E3=81=AF=E3=81=AA=E3=81=8F=E3=80=81
+   =E4=BB=A5=E4=B8=8B=E3=81=AB=E7=A4=BA=E3=81=99=E8=8B=B1=E8=AA=9E=E5=8E=
=9F=E6=96=87=E3=81=AE Developer's Certificate of Origin 1.1 =E3=81=A7=E3=81=
=99=E3=80=82
+   DCO =E3=81=AF=E6=B3=95=E7=9A=84=E3=81=AA=E6=80=A7=E8=B3=AA=E3=82=92=E6=
=8C=81=E3=81=A4=E6=96=87=E6=9B=B8=E3=81=A7=E3=81=82=E3=82=8B=E3=81=9F=E3=82=
=81=E3=80=81=E6=9C=AC=E6=96=87=E3=81=AF=E7=BF=BB=E8=A8=B3=E3=81=9B=E3=81=9A=
=E3=80=81=E5=8E=9F=E6=96=87=E3=81=AE=E3=81=BE=E3=81=BE
+   =E6=8E=B2=E8=BC=89=E3=81=97=E3=81=BE=E3=81=99=E3=80=82=E5=86=85=E5=AE=
=B9=E3=82=92=E7=A2=BA=E8=AA=8D=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=AF=
=E3=80=81=E5=BF=85=E3=81=9A=E8=8B=B1=E8=AA=9E=E5=8E=9F=E6=96=87=E3=82=92=E5=
=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=
=82
+
+=E8=A6=8F=E5=89=87=E3=81=AF=E5=8D=98=E7=B4=94=E3=81=A7=E3=80=81=E4=BB=A5=
=E4=B8=8B=E3=82=92=E8=A8=BC=E6=98=8E=E3=81=A7=E3=81=8D=E3=82=8B=E5=A0=B4=E5=
=90=88=E3=81=A7=E3=81=99::
+
+        Developer's Certificate of Origin 1.1
+
+        By making a contribution to this project, I certify that:
+
+        (a) The contribution was created in whole or in part by me and I
+            have the right to submit it under the open source license
+            indicated in the file; or
+
+        (b) The contribution is based upon previous work that, to the best
+            of my knowledge, is covered under an appropriate open source
+            license and I have the right under that license to submit that
+            work with modifications, whether created in whole or in part
+            by me, under the same open source license (unless I am
+            permitted to submit under a different license), as indicated
+            in the file; or
+
+        (c) The contribution was provided directly to me by some other
+            person who certified (a), (b) or (c) and I have not modified
+            it.
+
+        (d) I understand and agree that this project and the contribution
+            are public and that a record of the contribution (including all
+            personal information I submit with it, including my sign-off) =
is
+            maintained indefinitely and may be redistributed consistent wi=
th
+            this project or the open source license(s) involved.
+
+=E4=B8=8A=E8=A8=98=E3=82=92=E8=A8=BC=E6=98=8E=E3=81=A7=E3=81=8D=E3=82=8B=
=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E6=AC=A1=E3=81=AE=E3=82=88=E3=81=86=E3=
=81=AA=E8=A1=8C=E3=82=92=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=BE=E3=81=99::
+
+        Signed-off-by: Random J Developer <random@developer.example.org>
+
+=E6=97=A2=E7=9F=A5=E3=81=AE=E8=BA=AB=E5=85=83=E3=82=92=E4=BD=BF=E7=94=A8=
=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=8C=BF=E5=
=90=8D=E3=81=A7=E3=81=AE=E8=B2=A2=E7=8C=AE=E3=81=AF=E8=AA=8D=E3=82=81=E3=82=
=89=E3=82=8C=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82
+``git commit -s`` =E3=82=92=E4=BD=BF=E7=94=A8=E3=81=99=E3=82=8B=E3=81=A8=
=E3=80=81=E3=81=93=E3=81=AE=E8=A1=8C=E3=82=92=E8=87=AA=E5=8B=95=E7=9A=84=E3=
=81=AB=E8=BF=BD=E5=8A=A0=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=99=E3=80=82
+
+revert =E3=81=AB=E3=82=82 ``Signed-off-by:`` =E3=82=92=E5=90=AB=E3=82=81=
=E3=82=8B=E5=BF=85=E8=A6=81=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=
=80=82
+``git revert -s`` =E3=82=92=E4=BD=BF=E7=94=A8=E3=81=99=E3=82=8B=E3=81=A8=
=E3=80=81=E8=87=AA=E5=8B=95=E7=9A=84=E3=81=AB=E8=BF=BD=E5=8A=A0=E3=81=A7=E3=
=81=8D=E3=81=BE=E3=81=99=E3=80=82
+
+=E6=9C=AB=E5=B0=BE=E3=81=AB=E8=BF=BD=E5=8A=A0=E3=81=AE=E3=82=BF=E3=82=B0=
=E3=82=92=E4=BB=98=E3=81=91=E3=82=8B=E4=BA=BA=E3=82=82=E3=81=84=E3=81=BE=E3=
=81=99=E3=80=82=E7=8F=BE=E6=99=82=E7=82=B9=E3=81=A7=E3=81=AF=E7=84=A1=E8=A6=
=96=E3=81=95=E3=82=8C=E3=81=BE=E3=81=99=E3=81=8C=E3=80=81
+=E7=A4=BE=E5=86=85=E6=89=8B=E7=B6=9A=E3=81=8D=E3=82=92=E7=A4=BA=E3=81=97=
=E3=81=9F=E3=82=8A=E3=80=81sign-off =E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=E7=
=89=B9=E8=A8=98=E4=BA=8B=E9=A0=85=E3=82=92=E8=A8=98=E9=8C=B2=E3=81=97=E3=81=
=9F=E3=82=8A=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AB
+=E4=BD=BF=E7=94=A8=E3=81=A7=E3=81=8D=E3=81=BE=E3=81=99=E3=80=82
+
+=E4=BD=9C=E8=80=85=E3=81=AE SoB =E3=81=AB=E7=B6=9A=E3=81=8F=E8=BF=BD=E5=8A=
=A0=E3=81=AE SoB=EF=BC=88``Signed-off-by:``=EF=BC=89=E3=81=AF=E3=80=81=E3=
=83=91=E3=83=83=E3=83=81=E3=81=AE=E9=96=8B=E7=99=BA=E3=81=AB=E3=81=AF
+=E9=96=A2=E4=B8=8E=E3=81=9B=E3=81=9A=E3=80=81=E3=81=9D=E3=81=AE=E5=8F=96=
=E3=82=8A=E6=89=B1=E3=81=84=E3=82=84=E8=BB=A2=E9=80=81=E3=82=92=E8=A1=8C=E3=
=81=A3=E3=81=9F=E4=BA=BA=E3=81=AB=E3=82=88=E3=82=8B=E3=82=82=E3=81=AE=E3=81=
=A7=E3=81=99=E3=80=82SoB =E3=81=AE=E9=80=A3=E9=8E=96=E3=81=AF=E3=80=81
+=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=
=E3=83=BC=E3=82=92=E7=B5=8C=E3=81=A6=E6=9C=80=E7=B5=82=E7=9A=84=E3=81=AB Li=
nus =E3=81=B8=E5=B1=8A=E3=81=84=E3=81=9F=E5=AE=9F=E9=9A=9B=E3=81=AE=E7=B5=
=8C=E8=B7=AF=E3=82=92=E5=8F=8D=E6=98=A0=E3=81=99=E3=82=8B
+=E5=BF=85=E8=A6=81=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=
=E6=9C=80=E5=88=9D=E3=81=AE SoB =E3=81=AF=E3=80=81=E5=8D=98=E7=8B=AC=E3=81=
=AE=E4=B8=BB=E8=A6=81=E4=BD=9C=E8=80=85=E3=81=A7=E3=81=82=E3=82=8B=E3=81=93=
=E3=81=A8=E3=82=92=E7=A4=BA=E3=81=97=E3=81=BE=E3=81=99=E3=80=82
--=20
2.52.0

