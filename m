Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A41224DCF9;
	Mon,  9 Mar 2026 12:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773057689; cv=pass; b=Fp/Hifv7q++j8l3VFsPZHCszjh4l1lyDZ16/5L0X7Q7dkaCbwL9H/3AtDcFYVsxmAk9Rn7Bi7ZR6xHHrD1uCFKdPbL/uCxA2WYI3tSBzJAPsAsfGIKMB77wPHcFKufcCdtV1D+8evmFOO0fJsbvKS/sP9+CsXulooS8uoayTt/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773057689; c=relaxed/simple;
	bh=jsieX2kxuH36O9g0xoiluXbz8ayquuEC1ux5tG8NV7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=VRS32o2pwCGrgreIaq1hshfuJfnyuAuyJ8o335cYh23IQ2BQhHwn9wN+j06iBJuIfFR+1IWRkuADbyu5z3Zz+13DJ6I4YDrEcNXF99hSzJoN1bAzjBFJoeocC2GFbrLvDLZSkHQtjFucBISbZfIzalp/COXpYs4gHuZjLFS+BJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=GQt6gMeH; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="GQt6gMeH"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 629AoNIX046939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 9 Mar 2026 19:50:24 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 6614D109EFC59;
	Mon,  9 Mar 2026 19:50:23 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OR19hQ6O0WBw; Mon,  9 Mar 2026 19:50:18 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id D33E2109EFC58; Mon,  9 Mar 2026 19:50:17 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1773053417;
	cv=none; b=BdFp0fdnvo+8w8g6B4vMo4PBEvr+bFsNzlUuUifOawsaNkO1VvWY9OLBfPgNUYVfJXw+Dz+XDrugqUEshCvsp3GJijNGAFZslMFDp0ujQv3CkN2+Urtdr0NIQSw+g4MS2/R0ugjWKcJvFTAyoKa5WsR7tHQJBSpFc/mnefdDzCg=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1773053417; c=relaxed/relaxed;
	bh=JuFeJlFp2UPceish3Pt4gcdjLVEPPALkUcxLqqQie5g=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=eEa956G6V92wT0JLbxOqLa78Xf0Fe1QpGUmAklk83DjZ4fcNpGDCkgXCod1gEDpwB3daZtzSw/Fb7kybbdwRJCxPHU9SJNbFmqUFmmRr2BFxe2VqMcCcrvcSiZLfQ3aZtzGo+6XpvUPUTX02JFDjwzOjakMp8aOC9UkzLmqtcbY=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org D33E2109EFC58
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1773053417;
	bh=JuFeJlFp2UPceish3Pt4gcdjLVEPPALkUcxLqqQie5g=;
	h=From:To:Cc:Subject:Date:From;
	b=GQt6gMeHBaS4zs+eewvogmgRzLXHgwTZpwtu28dG4GZBTYu+VFviqPUqiROkt1h8E
	 UEYxPX89+6UeLSU/ql3cktfIp+1C1BPXgpm7OLBM2bZXuGY/PM8NHzP5ZS2ihY59J1
	 y8iUeCXMxVtNB2IsLWH8wjsYZCyP5aDanYvyhVN8=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, corbet@lwn.net, akiyks@gmail.com,
        weibu@redadmin.org
Subject: [PATCH] docs: ja_JP: process: translate second half of 'Describe your changes'
Date: Mon,  9 Mar 2026 19:50:15 +0900
Message-ID: <20260309105015.309116-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the remaining part of the "Describe your changes" section in
Documentation/translations/ja_JP/process/submitting-patches.rst.

Follow review comments on wording and line wrapping, and cover guidance
on self-contained patch descriptions, imperative mood, commit
references, and Link:/Closes:/Fixes: tags.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst      | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 1c0f694fd2a0..91bd79a0e9dc 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -96,3 +96,87 @@ Linux =E3=81=AE=E5=A4=9A=E3=81=8F=E3=81=AE=E7=92=B0=E5=
=A2=83=E3=81=AF=E3=80=81=E4=B8=8A=E6=B5=81=E3=81=8B=E3=82=89=E7=89=B9=E5=AE=
=9A=E3=81=AE=E3=83=91=E3=83=83=E3=83=81=E3=81=A0=E3=81=91=E3=82=92=E5=8F=96=
=E3=82=8A=E8=BE=BC
=20
 .. TODO: Convert to file-local cross-reference when the destination is
    translated.
+
+=E3=83=91=E3=83=83=E3=83=81=E3=81=BE=E3=81=9F=E3=81=AF=E3=83=91=E3=83=83=
=E3=83=81=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=E3=82=92=E6=8A=95=E7=A8=BF=EF=
=BC=8F=E5=86=8D=E6=8A=95=E7=A8=BF=E3=81=99=E3=82=8B=E9=9A=9B=E3=81=AF=E3=80=
=81=E3=81=9D=E3=81=AE=E5=AE=8C=E5=85=A8=E3=81=AA
+=E8=AA=AC=E6=98=8E=E3=81=A8=E3=80=81=E3=81=9D=E3=82=8C=E3=82=92=E6=AD=A3=
=E5=BD=93=E5=8C=96=E3=81=99=E3=82=8B=E7=90=86=E7=94=B1=E3=82=92=E5=90=AB=E3=
=82=81=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=8D=98=E3=81=
=AB=E3=80=81=E3=81=93=E3=82=8C=E3=81=8C
+=E3=83=91=E3=83=83=E3=83=81=EF=BC=88=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=
=EF=BC=89=E3=81=AE=E3=83=90=E3=83=BC=E3=82=B8=E3=83=A7=E3=83=B3 N =E3=81=A7=
=E3=81=82=E3=82=8B=E3=81=A8=E3=81=A0=E3=81=91=E6=9B=B8=E3=81=8B=E3=81=AA=E3=
=81=84=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=82=B5=E3=83=96=E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E3=83=A1=E3=83=B3=
=E3=83=86=E3=83=8A=E3=81=8C=E4=BB=A5=E5=89=8D=E3=81=AE=E3=83=91=E3=83=83=E3=
=83=81=E7=89=88=E3=82=84=E5=8F=82=E7=85=A7=E5=85=88 URL =E3=82=92=E3=81=95=
=E3=81=8B=E3=81=AE=E3=81=BC=E3=81=A3=E3=81=A6
+=E3=83=91=E3=83=83=E3=83=81=E8=AA=AC=E6=98=8E=E3=82=92=E6=8E=A2=E3=81=97=
=E3=80=81=E3=81=9D=E3=82=8C=E3=82=92=E3=83=91=E3=83=83=E3=83=81=E3=81=AB=E8=
=A3=9C=E3=81=86=E3=81=93=E3=81=A8=E3=82=92=E6=9C=9F=E5=BE=85=E3=81=97=E3=81=
=A6=E3=81=AF=E3=81=84=E3=81=91=E3=81=BE=E3=81=9B=E3=82=93=E3=80=82
+=E3=81=A4=E3=81=BE=E3=82=8A=E3=80=81=E3=83=91=E3=83=83=E3=83=81=EF=BC=88=
=E3=82=B7=E3=83=AA=E3=83=BC=E3=82=BA=EF=BC=89=E3=81=A8=E3=81=9D=E3=81=AE=E8=
=AA=AC=E6=98=8E=E3=81=AF=E3=80=81=E3=81=9D=E3=82=8C=E3=81=A0=E3=81=91=E3=81=
=A7=E5=AE=8C=E7=B5=90=E3=81=97=E3=81=A6=E3=81=84=E3=82=8B=E3=81=B9=E3=81=8D
+=E3=81=A7=E3=81=99=E3=80=82=E3=81=93=E3=82=8C=E3=81=AF=E3=83=A1=E3=83=B3=
=E3=83=86=E3=83=8A=E3=81=A8=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=
=81=AE=E5=8F=8C=E6=96=B9=E3=81=AB=E6=9C=89=E7=9B=8A=E3=81=A7=E3=81=99=E3=80=
=82=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=AE
+=E4=B8=AD=E3=81=AB=E3=81=AF=E3=80=81=E4=BB=A5=E5=89=8D=E3=81=AE=E3=83=91=
=E3=83=83=E3=83=81=E7=89=88=E3=82=92=E5=8F=97=E3=81=91=E5=8F=96=E3=81=A3=E3=
=81=A6=E3=81=84=E3=81=AA=E3=81=84=E4=BA=BA=E3=82=82=E3=81=84=E3=82=8B=E3=81=
=A7=E3=81=97=E3=82=87=E3=81=86=E3=80=82
+
+=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=81=AF=E5=91=BD=E4=BB=A4=E5=BD=A2=
=E3=81=A7=E8=A8=98=E8=BF=B0=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=
=81=84=E3=80=82=E3=81=9F=E3=81=A8=E3=81=88=E3=81=B0=E3=80=81
+=E3=80=8Cmake xyzzy do frotz=E3=80=8D=E3=81=A8=E3=81=97=E3=80=81
+=E3=80=8C[This patch] makes xyzzy do frotz=E3=80=8D=E3=82=84
+=E3=80=8C[I] changed xyzzy to do frotz=E3=80=8D
+=E3=81=AE=E3=82=88=E3=81=86=E3=81=AB=E3=81=AF=E6=9B=B8=E3=81=8B=E3=81=AA=
=E3=81=84=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E3=81=82=E3=
=81=9F=E3=81=8B=E3=82=82=E3=82=B3=E3=83=BC=E3=83=89=E3=83=99=E3=83=BC=E3=82=
=B9=E3=81=AB=E5=AF=BE=E3=81=97=E3=81=A6=E3=80=81
+=E3=81=9D=E3=81=AE=E6=8C=AF=E3=82=8B=E8=88=9E=E3=81=84=E3=82=92=E5=A4=89=
=E3=81=88=E3=82=8B=E3=82=88=E3=81=86=E5=91=BD=E4=BB=A4=E3=81=97=E3=81=A6=E3=
=81=84=E3=82=8B=E3=81=8B=E3=81=AE=E3=82=88=E3=81=86=E3=81=AB=E6=9B=B8=E3=81=
=84=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E7=89=B9=E5=AE=9A=E3=81=AE=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=81=AB=
=E8=A8=80=E5=8F=8A=E3=81=97=E3=81=9F=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=
=80=81=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=81=AE SHA-1 ID =E3=81=A0=E3=
=81=91=E3=82=92
+=E6=9B=B8=E3=81=8B=E3=81=AA=E3=81=84=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95=
=E3=81=84=E3=80=82=E3=83=AC=E3=83=93=E3=83=A5=E3=83=BC=E3=82=A2=E3=81=8C=E3=
=81=9D=E3=82=8C=E3=81=8C=E4=BD=95=E3=81=AB=E3=81=A4=E3=81=84=E3=81=A6=E3=81=
=AE=E3=82=82=E3=81=AE=E3=81=8B=E3=82=92
+=E6=8A=8A=E6=8F=A1=E3=81=97=E3=82=84=E3=81=99=E3=81=8F=E3=81=AA=E3=82=8B=
=E3=82=88=E3=81=86=E3=80=81=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=81=AE 1 =
=E8=A1=8C=E8=A6=81=E7=B4=84=E3=82=82=E5=90=AB=E3=82=81=E3=81=A6=E3=81=8F=E3=
=81=A0=E3=81=95=E3=81=84=E3=80=82=E4=BE=8B::
+
+	Commit e21d2170f36602ae2708 ("video: remove unnecessary
+	platform_set_drvdata()") removed the unnecessary
+	platform_set_drvdata(), but left the variable "dev" unused,
+	delete it.
+
+=E3=81=BE=E3=81=9F=E3=80=81SHA-1 ID =E3=81=AF=E5=B0=91=E3=81=AA=E3=81=8F=
=E3=81=A8=E3=82=82=E5=85=88=E9=A0=AD 12 =E6=96=87=E5=AD=97=E3=82=92=E4=BD=
=BF=E3=81=86=E3=82=88=E3=81=86=E3=81=AB=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=
=E3=81=95=E3=81=84=E3=80=82
+=E3=82=AB=E3=83=BC=E3=83=8D=E3=83=AB=E3=81=AE=E3=83=AA=E3=83=9D=E3=82=B8=
=E3=83=88=E3=83=AA=E3=81=AB=E3=81=AF=E9=9D=9E=E5=B8=B8=E3=81=AB=E5=A4=9A=E3=
=81=8F=E3=81=AE=E3=82=AA=E3=83=96=E3=82=B8=E3=82=A7=E3=82=AF=E3=83=88=E3=81=
=8C=E3=81=82=E3=82=8B=E3=81=9F=E3=82=81=E3=80=81
+=E3=81=9D=E3=82=8C=E3=82=88=E3=82=8A=E7=9F=AD=E3=81=84 ID =E3=81=A7=E3=81=
=AF=E8=A1=9D=E7=AA=81=E3=81=8C=E7=8F=BE=E5=AE=9F=E3=81=AB=E8=B5=B7=E3=81=93=
=E3=82=8A=E5=BE=97=E3=81=BE=E3=81=99=E3=80=82=E3=81=84=E3=81=BE 6 =E6=96=87=
=E5=AD=97=E3=81=AE ID =E3=81=AB
+=E8=A1=9D=E7=AA=81=E3=81=8C=E3=81=AA=E3=81=8F=E3=81=A6=E3=82=82=E3=80=815 =
=E5=B9=B4=E5=BE=8C=E3=82=82=E3=81=9D=E3=81=86=E3=81=A0=E3=81=A8=E3=81=AF=E9=
=99=90=E3=82=89=E3=81=AA=E3=81=84=E3=81=93=E3=81=A8=E3=81=AB=E6=B3=A8=E6=84=
=8F=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E5=A4=89=E6=9B=B4=E3=81=AB=E9=96=A2=E9=80=A3=E3=81=99=E3=82=8B=E8=AD=B0=
=E8=AB=96=E3=82=84=E3=80=81=E3=81=9D=E3=81=AE=E8=83=8C=E6=99=AF=E6=83=85=E5=
=A0=B1=E3=81=8C Web =E4=B8=8A=E3=81=A7=E5=8F=82=E7=85=A7=E3=81=A7=E3=81=8D=
=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81
+=E3=81=9D=E3=82=8C=E3=82=92=E6=8C=87=E3=81=99 ``Link:`` =E3=82=BF=E3=82=B0=
=E3=82=92=E8=BF=BD=E5=8A=A0=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=
=81=84=E3=80=82=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E9=81=8E=E5=8E=BB=E3=81=
=AE
+=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=B9=E3=83=88=
=E3=81=A7=E3=81=AE=E8=AD=B0=E8=AB=96=E3=82=84=E3=80=81Web =E3=81=AB=E8=A8=
=98=E9=8C=B2=E3=81=95=E3=82=8C=E3=81=9F=E4=BD=95=E3=81=8B=E3=81=AE=E7=B5=90=
=E6=9E=9C=E3=81=A7=E3=81=82=E3=82=8B=E3=81=AA=E3=82=89=E3=80=81
+=E3=81=9D=E3=82=8C=E3=82=92=E7=A4=BA=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=
=E3=81=95=E3=81=84=E3=80=82
+
+=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=B9=E3=83=88=
=E3=81=AE=E3=82=A2=E3=83=BC=E3=82=AB=E3=82=A4=E3=83=96=E3=81=B8=E3=83=AA=E3=
=83=B3=E3=82=AF=E3=81=99=E3=82=8B=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E3=81=
=A7=E3=81=8D=E3=82=8C=E3=81=B0
+lore.kernel.org =E3=81=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8=E3=
=82=A2=E3=83=BC=E3=82=AB=E3=82=A4=E3=83=96=E3=82=B5=E3=83=BC=E3=83=93=E3=82=
=B9=E3=82=92=E4=BD=BF=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=
=E3=80=82
+=E3=83=AA=E3=83=B3=E3=82=AF URL =E3=82=92=E4=BD=9C=E3=82=8B=E3=81=AB=E3=81=
=AF=E3=80=81=E3=81=9D=E3=81=AE=E3=83=A1=E3=83=83=E3=82=BB=E3=83=BC=E3=82=B8=
=E3=81=AE ``Message-ID`` =E3=83=98=E3=83=83=E3=83=80=E3=81=AE=E5=86=85=E5=
=AE=B9
+=E3=81=8B=E3=82=89=E3=80=81=E5=89=8D=E5=BE=8C=E3=81=AE=E5=B1=B1=E6=8B=AC=
=E5=BC=A7=E3=82=92=E5=8F=96=E3=82=8A=E9=99=A4=E3=81=84=E3=81=9F=E3=82=82=E3=
=81=AE=E3=82=92=E4=BD=BF=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E4=BE=8B::
+
+    Link: https://lore.kernel.org/30th.anniversary.repost@klaava.Helsinki.=
FI
+
+=E5=AE=9F=E9=9A=9B=E3=81=AB=E3=83=AA=E3=83=B3=E3=82=AF=E3=81=8C=E6=A9=9F=
=E8=83=BD=E3=81=97=E3=80=81=E8=A9=B2=E5=BD=93=E3=81=99=E3=82=8B=E3=83=A1=E3=
=83=83=E3=82=BB=E3=83=BC=E3=82=B8=E3=82=92=E6=8C=87=E3=81=97=E3=81=A6=E3=81=
=84=E3=82=8B=E3=81=93=E3=81=A8=E3=82=92
+=E7=A2=BA=E8=AA=8D=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=
=E3=80=82=E3=81=9F=E3=81=A0=E3=81=97=E3=80=81=E5=A4=96=E9=83=A8=E3=83=AA=E3=
=82=BD=E3=83=BC=E3=82=B9=E3=82=92=E8=A6=8B=E3=81=AA=E3=81=8F=E3=81=A6=E3=82=
=82=E8=AA=AC=E6=98=8E=E3=81=8C=E7=90=86=E8=A7=A3=E3=81=A7=E3=81=8D=E3=82=8B
+=E3=82=88=E3=81=86=E3=81=AB=E3=81=99=E3=82=8B=E3=82=88=E3=81=86=E5=8A=AA=
=E3=82=81=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=B9=E3=83=88=
=E3=81=AE=E3=82=A2=E3=83=BC=E3=82=AB=E3=82=A4=E3=83=96=E3=82=84=E3=83=90=E3=
=82=B0=E3=81=B8=E3=81=AE URL =E3=82=92=E7=A4=BA=E3=81=99=E3=81=A0=E3=81=91=
=E3=81=A7=E3=81=AA=E3=81=8F=E3=80=81
+=E6=8A=95=E7=A8=BF=E3=81=95=E3=82=8C=E3=81=9F=E3=83=91=E3=83=83=E3=83=81=
=E3=81=AB=E8=87=B3=E3=81=A3=E3=81=9F=E8=AD=B0=E8=AB=96=E3=81=AE=E8=A6=81=E7=
=82=B9=E3=82=82=E8=A6=81=E7=B4=84=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=
=95=E3=81=84=E3=80=82
+
+=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E3=83=90=E3=82=B0=E3=82=92=E4=BF=AE=
=E6=AD=A3=E3=81=99=E3=82=8B=E3=82=82=E3=81=AE=E3=81=A7=E3=81=82=E3=82=8C=E3=
=81=B0=E3=80=81=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=
=B9=E3=83=88=E3=81=AE=E3=82=A2=E3=83=BC=E3=82=AB=E3=82=A4=E3=83=96=E3=82=84
+=E5=85=AC=E9=96=8B=E3=83=90=E3=82=B0=E3=83=88=E3=83=A9=E3=83=83=E3=82=AB=
=E3=83=BC=E4=B8=8A=E3=81=AE=E5=A0=B1=E5=91=8A=E3=82=92=E6=8C=87=E3=81=99 UR=
L =E3=82=92=E4=BB=98=E3=81=91=E3=81=A6=E3=80=81``Closes:`` =E3=82=BF=E3=82=
=B0=E3=82=92
+=E4=BD=BF=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=
=E4=BE=8B::
+
+    Closes: https://example.com/issues/1234
+
+=E3=81=93=E3=81=AE=E3=82=88=E3=81=86=E3=81=AA=E3=82=BF=E3=82=B0=E4=BB=98=
=E3=81=8D=E3=81=AE=E3=82=B3=E3=83=9F=E3=83=83=E3=83=88=E3=81=8C=E9=81=A9=E7=
=94=A8=E3=81=95=E3=82=8C=E3=81=9F=E3=81=A8=E3=81=8D=E3=80=81=E8=87=AA=E5=8B=
=95=E7=9A=84=E3=81=AB issue =E3=82=92
+=E9=96=89=E3=81=98=E3=82=89=E3=82=8C=E3=82=8B=E3=83=90=E3=82=B0=E3=83=88=
=E3=83=A9=E3=83=83=E3=82=AB=E3=83=BC=E3=82=82=E3=81=82=E3=82=8A=E3=81=BE=E3=
=81=99=E3=80=82=E3=83=A1=E3=83=BC=E3=83=AA=E3=83=B3=E3=82=B0=E3=83=AA=E3=82=
=B9=E3=83=88=E3=82=92=E7=9B=A3=E8=A6=96=E3=81=97=E3=81=A6=E3=81=84=E3=82=8B
+=E3=83=9C=E3=83=83=E3=83=88=E3=81=AE=E4=B8=AD=E3=81=AB=E3=81=AF=E3=80=81=
=E3=81=9D=E3=81=AE=E3=82=88=E3=81=86=E3=81=AA=E3=82=BF=E3=82=B0=E3=82=92=E8=
=BF=BD=E8=B7=A1=E3=81=97=E3=81=A6=E4=B8=80=E5=AE=9A=E3=81=AE=E5=8B=95=E4=BD=
=9C=E3=82=92=E8=A1=8C=E3=81=86=E3=82=82=E3=81=AE=E3=82=82
+=E3=81=82=E3=82=8A=E3=81=BE=E3=81=99=E3=80=82=E9=9D=9E=E5=85=AC=E9=96=8B=
=E3=81=AE=E3=83=90=E3=82=B0=E3=83=88=E3=83=A9=E3=83=83=E3=82=AB=E3=83=BC=E3=
=82=84=E7=84=A1=E5=8A=B9=E3=81=AA URL =E3=81=AF=E7=A6=81=E6=AD=A2=E3=81=A7=
=E3=81=99=E3=80=82
+
+=E3=83=91=E3=83=83=E3=83=81=E3=81=8C=E7=89=B9=E5=AE=9A=E3=81=AE=E3=82=B3=
=E3=83=9F=E3=83=83=E3=83=88=E3=81=AB=E5=90=AB=E3=81=BE=E3=82=8C=E3=82=8B=E3=
=83=90=E3=82=B0=E3=82=92=E4=BF=AE=E6=AD=A3=E3=81=99=E3=82=8B=E3=82=82=E3=81=
=AE=E3=81=A7=E3=81=82=E3=82=8C=E3=81=B0=E3=80=81
+=E3=81=9F=E3=81=A8=E3=81=88=E3=81=B0 ``git bisect`` =E3=81=A7=E5=95=8F=E9=
=A1=8C=E3=82=92=E8=A6=8B=E3=81=A4=E3=81=91=E3=81=9F=E5=A0=B4=E5=90=88=E3=81=
=AB=E3=81=AF=E3=80=81SHA-1 ID =E3=81=AE
+=E5=85=88=E9=A0=AD=E5=B0=91=E3=81=AA=E3=81=8F=E3=81=A8=E3=82=82 12 =E6=96=
=87=E5=AD=97=E3=81=A8 1 =E8=A1=8C=E8=A6=81=E7=B4=84=E3=82=92=E5=90=AB=E3=82=
=81=E3=81=A6=E3=80=81``Fixes:`` =E3=82=BF=E3=82=B0=E3=82=92
+=E4=BD=BF=E3=81=A3=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=
=E3=82=BF=E3=82=B0=E3=82=92=E8=A4=87=E6=95=B0=E8=A1=8C=E3=81=AB=E5=88=86=E5=
=89=B2=E3=81=97=E3=81=A6=E3=81=AF=E3=81=84=E3=81=91=E3=81=BE=E3=81=9B=E3=82=
=93=E3=80=82=E3=82=BF=E3=82=B0=E3=81=AF
+=E8=A7=A3=E6=9E=90=E3=82=B9=E3=82=AF=E3=83=AA=E3=83=97=E3=83=88=E3=82=92=
=E5=8D=98=E7=B4=94=E3=81=AB=E3=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=80=81=E3=
=80=8C75 =E6=A1=81=E3=81=A7=E6=8A=98=E3=82=8A=E8=BF=94=E3=81=99=E3=80=8D=E8=
=A6=8F=E5=89=87=E3=81=AE
+=E4=BE=8B=E5=A4=96=E3=81=A7=E3=81=99=E3=80=82
+
+=E4=BE=8B::
+
+    Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the num=
ber of pages it actually freed")
+
+=E4=B8=8A=E3=81=AE=E5=BD=A2=E5=BC=8F=E3=82=92 ``git log`` =E3=82=84 ``git =
show`` =E3=81=A7=E5=87=BA=E5=8A=9B=E3=81=97=E3=82=84=E3=81=99=E3=81=8F=E3=
=81=99=E3=82=8B=E3=81=9F=E3=82=81=E3=81=AB=E3=80=81
+=E6=AC=A1=E3=81=AE ``git config`` =E8=A8=AD=E5=AE=9A=E3=82=92=E4=BD=BF=E3=
=81=88=E3=81=BE=E3=81=99::
+
+    [core]
+        abbrev =3D 12
+    [pretty]
+        fixes =3D Fixes: %h ("%s")
+
+=E5=91=BC=E3=81=B3=E5=87=BA=E3=81=97=E4=BE=8B::
+
+    $ git log -1 --pretty=3Dfixes 54a4f0239f2e
+    Fixes: 54a4f0239f2e ("KVM: MMU: make kvm_mmu_zap_page() return the num=
ber of pages it actually freed")
--=20
2.47.3

