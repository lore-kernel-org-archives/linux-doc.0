Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F30F26ED48;
	Mon, 26 Jan 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769437191; cv=pass; b=Y8MrtPmQQCKVIczymWSi3T6fKy9RnmRTnl2V/BRzPTrkTa6Xs2E6fw592zyy+8ae2Q4fikR4XtRj/4M5RXYvu8uaLrsjLwh6BllbozfhbM/JqmRe+pKpcCVVaSlxWKEt065DjjAePaVa+m+nbWXN/aeIcaNHgmNALZpU43ck/hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769437191; c=relaxed/simple;
	bh=cDY5DB10gPht+ACPeUYOXkW+5kML6uXTay8GzEkwM5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rOCAA3T8ov0cyEW8gtCpib7etbH3aEWEhyrzyaj1DMmTj8Ig0gaOpkhXG5ptHyoKnIv4Fy6Nf4lTy7aXQ2s5jIQJgIHhXsvSMQdBNHfvpfz48eHo1pXeIz/NVddHqhfmZQEJ2JlqbFr0LHtA0vB6ZcAnr45hrTJeUXSHmLfvZ50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=g4D4O+bl; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="g4D4O+bl"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 60QEJb2P058808
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 26 Jan 2026 23:19:38 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 4DEB2109F15C4;
	Mon, 26 Jan 2026 23:19:37 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WrI6P84p-gSq; Mon, 26 Jan 2026 23:19:33 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 4128F109F254B; Mon, 26 Jan 2026 23:19:33 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1769437173;
	cv=none; b=YdtMN7AQD8oNM9EU+DBmgvQlr8hlsnibyHHG+Sc/0qkKd+f4trQJE6ewaGFGH85lJfnHMAsIfCMxRx8Ohbxje3OIuVTLyGcm95ZoWYes7JicFYOPjaLXu1qnESHT8FYRaV5pABSc5aSVPzp7kpZSJWTe1CWyml6NUinnHMe96+c=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1769437173; c=relaxed/relaxed;
	bh=Jbt6e2zAjkvS09bN4XlCfTXjNKTNtky2swc8wMiwVrk=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=PbjOUsSAz7gH10ZFBFMvz+F6y/WdKt3XG25nagJEef9n4igiZ6VdfAi6LgrWr9Yw4+OpJKq/out4/SnuQkjkcgVRvHTJAJaRGu0a+R7vRyLij8LTUl1P9dNzLMkgBpfP9c1SR9afBDgel1Alp8RdIdKS+VmrTVy4JXDlherHCL0=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 4128F109F254B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1769437173;
	bh=Jbt6e2zAjkvS09bN4XlCfTXjNKTNtky2swc8wMiwVrk=;
	h=From:To:Cc:Subject:Date:From;
	b=g4D4O+blvr06Vkg2y+LvKlPLfrKgWhxd4AuSt4X0OD9liHJyyxxuJte1Fs1W9rP+H
	 XKV/ETGYM/UAID7slIoOVOQLPs+zH0yAogeC98W6+beenh9rG4xiz+1qTJwE0rtCyQ
	 PgYdpzaChZl076YX+ujzxpBgKQ4qOHmRmfh16cvU=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v2] docs: ja_JP: process: translate 'Obtain a current source tree'
Date: Mon, 26 Jan 2026 23:19:31 +0900
Message-ID: <20260126141931.3222463-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Translate the "Obtain a current source tree" section in
Documentation/translations/ja_JP/process/submitting-patches.rst.

Use a jp_ label (.. _jp_describe_changes:) to avoid a duplicate label.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst      | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 2ff887c86b2a..def262367055 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -36,3 +36,23 @@ Documentation/devicetree/bindings/submitting-patches.rst=
 =E3=82=92=E8=AA=AD=E3=82=93=E3=81=A7=E3=81=8F=E3=81=A0=E3=81=95
 =E3=81=84=E3=81=8F=E3=81=A4=E3=81=8B=E3=81=AE=E3=82=B5=E3=83=96=E3=82=B7=
=E3=82=B9=E3=83=86=E3=83=A0=E3=82=84=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=
=83=84=E3=83=AA=E3=83=BC=E3=81=AB=E3=81=AF=E3=80=81=E5=90=84=E3=80=85=E3=81=
=AE=E3=83=AF=E3=83=BC=E3=82=AF=E3=83=95=E3=83=AD=E3=83=BC=E3=82=84
 =E6=9C=9F=E5=BE=85=E4=BA=8B=E9=A0=85=E3=81=AB=E9=96=A2=E3=81=99=E3=82=8B=
=E8=BF=BD=E5=8A=A0=E6=83=85=E5=A0=B1=E3=81=8C=E3=81=82=E3=82=8A=E3=81=BE=E3=
=81=99=E3=80=82=E6=AC=A1=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E3=81=
=8F=E3=81=A0=E3=81=95=E3=81=84:
 :ref:`Documentation/process/maintainer-handbooks.rst <maintainer_handbooks=
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

base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
--=20
2.47.3

