Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E860F27FD4A;
	Tue, 27 Jan 2026 13:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=222.228.43.154
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769518935; cv=pass; b=YrscRHpEjr2CR79M6+UN2mHLiGgvX0jX7wrTzWHCYfpnKPvl7HY8Lfvniv9rvFU0AD0Xr/4Cnc9b/GYvbqOkZNaha9LrGsObEx1frubnGk7cVAZlBmBCatbqKVulmVKGuF/+lZwksanV6VEOv9yiGi2f33a+GpjeCFgLDbGaHiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769518935; c=relaxed/simple;
	bh=G3riEswtHtD+IXi3zupTcPvNWjo8Ngyj95e5QJmvHsk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KJl3glJdE+ybgtt/H2C90RBpVjlpjdtEU39TXrFOFbvjqn5t+lR2FtfbURnw/J/NGaVTDZZzWSX/HpC9PwjUTv0dQEM+slZftd+Qo6jr2xIpOP2DGcW72oZngtvJVDHc/zHn0JLRR7ucmBceOUNZwsmaPbyy3jmPQI06scKNDFY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=EMBGloAS; arc=pass smtp.client-ip=222.228.43.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="EMBGloAS"
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id 1E667109F288D;
	Tue, 27 Jan 2026 22:02:02 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SBf6wt688lev; Tue, 27 Jan 2026 22:01:57 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 1B640109F2888; Tue, 27 Jan 2026 22:01:57 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1769518917;
	cv=none; b=xZOMJrVK9qm9EwHR+AaYxkx5GGxt7rox8Q7gC5IBAUHjYo0KoVzRCEIu7hKRUuQfPaOqBBp8EH5M/wNZyBvKMoDVbEdiGFMaG7yObwBUu0M4KmbVybdJ2gtwQ7qzPSLs0xm4AWCI8CjPRjj0g4dRlabrPrgNs3wjUSgXW5TTNrI=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1769518917; c=relaxed/relaxed;
	bh=f67+E4NlJsMrwKMPgpFz3xFbG9+gJsMdk2jt2vVhES8=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Type:Content-Transfer-Encoding; b=hoNCO/auTrsKny6lFw9LllDitmx4/2Rgd3f3j5c9EhluMFuAKI9lyZN7iEMcUaqV6kCYb/Cf0Q5C2j5i80JoP2fEVxB2CEhI8Cm0Lp41pKe1B0WqfhLCEhmjt5BKjMlVCHVKSLczQ2Fb+QM9dHgya8bn6cylc2QXFs0j1O7mhHE=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 1B640109F2888
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1769518917;
	bh=f67+E4NlJsMrwKMPgpFz3xFbG9+gJsMdk2jt2vVhES8=;
	h=From:To:Cc:Subject:Date:From;
	b=EMBGloASPeCnsFlw9/0RHsfA64Hl1mA5HAFS5odpdfHztfLZBzr5+Nc0yEi3msfaD
	 pbH3DI3t2h+9cA0wkRbsenVWH8FCqyvdEhrHfaoPokMkjZSK9IyGD7/DRUtaiqsetR
	 j51bsZ0Zvmhv4y0ILPACpBWIwm1MhJxyWOYHE+jQ=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: akiyks@gmail.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH v3] docs: ja_JP: process: translate 'Obtain a current source tree'
Date: Tue, 27 Jan 2026 22:01:55 +0900
Message-ID: <20260127130155.16935-1-weibu@redadmin.org>
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

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 .../ja_JP/process/submitting-patches.rst       | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/translations/ja_JP/process/submitting-patches.rs=
t b/Documentation/translations/ja_JP/process/submitting-patches.rst
index 2ff887c86b2a..d61583399ef4 100644
--- a/Documentation/translations/ja_JP/process/submitting-patches.rst
+++ b/Documentation/translations/ja_JP/process/submitting-patches.rst
@@ -36,3 +36,21 @@ Documentation/devicetree/bindings/submitting-patches.rst=
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
+=E3=81=9F=E3=81=A0=E3=81=97=E3=80=81=E7=9B=B4=E6=8E=A5 mainline =E3=81=AE=
=E3=83=84=E3=83=AA=E3=83=BC=E3=82=92=E5=AF=BE=E8=B1=A1=E3=81=AB=E4=BD=9C=E6=
=A5=AD=E3=81=99=E3=82=8C=E3=81=B0=E3=82=88=E3=81=84=E3=81=A8=E3=81=AF=E9=99=
=90=E3=82=89=E3=81=AA=E3=81=84=E3=81=93=E3=81=A8=E3=81=AB=E6=B3=A8=E6=84=8F
+=E3=81=97=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82=E5=A4=9A=
=E3=81=8F=E3=81=AE=E3=82=B5=E3=83=96=E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E3=
=81=AE=E3=83=A1=E3=83=B3=E3=83=86=E3=83=8A=E3=81=AF=E3=81=9D=E3=82=8C=E3=81=
=9E=E3=82=8C=E7=8B=AC=E8=87=AA=E3=81=AE=E3=83=84=E3=83=AA=E3=83=BC=E3=82=92=
=E9=81=8B=E7=94=A8=E3=81=97=E3=81=A6=E3=81=8A=E3=82=8A=E3=80=81
+=E3=81=9D=E3=81=AE=E3=83=84=E3=83=AA=E3=83=BC=E3=81=AB=E5=AF=BE=E3=81=97=
=E3=81=A6=E4=BD=9C=E6=88=90=E3=81=95=E3=82=8C=E3=81=9F=E3=83=91=E3=83=83=E3=
=83=81=E3=82=92=E8=A6=8B=E3=81=9F=E3=81=84=E3=81=A8=E8=80=83=E3=81=88=E3=81=
=A6=E3=81=84=E3=81=BE=E3=81=99=E3=80=82=E8=A9=B2=E5=BD=93=E3=82=B5=E3=83=96=
=E3=82=B7=E3=82=B9=E3=83=86=E3=83=A0=E3=81=AE
+=E3=83=84=E3=83=AA=E3=83=BC=E3=81=AF MAINTAINERS =E3=83=95=E3=82=A1=E3=82=
=A4=E3=83=AB=E5=86=85=E3=81=AE **T:** =E3=82=A8=E3=83=B3=E3=83=88=E3=83=AA=
=E3=82=92=E5=8F=82=E7=85=A7=E3=81=97=E3=81=A6=E8=A6=8B=E3=81=A4=E3=81=91=E3=
=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+=E3=81=9D=E3=81=93=E3=81=AB=E6=8E=B2=E8=BC=89=E3=81=95=E3=82=8C=E3=81=A6=
=E3=81=84=E3=81=AA=E3=81=84=E5=A0=B4=E5=90=88=E3=81=AF=E3=80=81=E3=83=A1=E3=
=83=B3=E3=83=86=E3=83=8A=E3=81=AB=E5=95=8F=E3=81=84=E5=90=88=E3=82=8F=E3=81=
=9B=E3=81=A6=E3=81=8F=E3=81=A0=E3=81=95=E3=81=84=E3=80=82
+
+=E5=A4=89=E6=9B=B4=E5=86=85=E5=AE=B9=E3=82=92=E8=AA=AC=E6=98=8E=E3=81=99=
=E3=82=8B
+------------------

base-commit: a592a36e49372172d7c7551ec19ed18184c935e1
--=20
2.47.3

