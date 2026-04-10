Received: from va-2-29.ptr.blmpb.com (va-2-29.ptr.blmpb.com [209.127.231.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8335261B92
	for <linux-doc@vger.kernel.org>; Fri, 10 Apr 2026 02:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788903; cv=none; b=ExrwLvhzTeXbBFDaBYLLp1ni8Ud3pi5MEGwl+MOD6R04AkTR5cqB+QmKxDFJTV6YiS/gPiUrGesNYl+4s2HLbU3jHdVbRV2Om2GUe7DXAtlPrrjIMPhRm/wGXsclludAuocS0e1iOU1rRvNDBBe46zeXKGeZp3cYQaCd24ZZaDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788903; c=relaxed/simple;
	bh=x7fMB+wMRvuGAjp1drvurdaxRfEbIF6nIk0Q2DCtp9U=;
	h=Date:Cc:Subject:Mime-Version:To:From:Message-Id:References:
	 In-Reply-To:Content-Type; b=t6dVZSX17U6uQ3pG0DV6RQNGlKVre67njKeviTg3J6h1ZoBcC7Z7Rp3gZqQ7FPZ+0mARSVfNyV8AH6CWGYeeIQToyjgkPSTL8Ez8pM0AMBPLRgs1xgws9Aoh5LELtNGt0zC0HUt1cBcUC8Ax3CBouhGm8OZ5BKrzJw+Z/YyZgo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=ng5RGxGD; arc=none smtp.client-ip=209.127.231.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="ng5RGxGD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775788892;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MKw695QzE+NmQPlHBHsT1i0aQqZLyNy/mK453Mf+7b0=;
 b=ng5RGxGDaS82F4VfD84TMfhWKndSgN7MkV+3mlIR249LaxBsz2gk0oDc2/qL6VDegFfZVA
 O3IfOSIvG3plZd3T/gFbrV5fnUyLszN/jwrW0xB0zAw4pelJrAImVD18TntPuDcbCyYfcS
 yffzAxQG3TO6jlLsZ7YToIapAuDzvoOFQAPAer4EhAV+ewMWHxNuxLrb5fNd7rOSG7rfkg
 ZJyfawdZnpiht6jfhybWszmWD4NZT1soFH9ovqVx1iMEQ5awCIZC44F+RDAtQHUV26DIKj
 QMWm3SXthqRXGmqrOdlude+Tqa79LZc7Kl9NSnFTA8LFhQ846wd+8UhXkdOM2w==
Date: Fri, 10 Apr 2026 10:41:10 +0800
X-Lms-Return-Path: <lba+269d8635a+5d46db+vger.kernel.org+ben.guo@openatom.club>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
Subject: [PATCH v2 1/4] docs/zh_CN: update rust/arch-support.rst translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Fri, 10 Apr 2026 10:41:29 +0800
X-Original-From: Ben Guo <ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Message-Id: <bc2b5eb22841e2d2cbec5626d50afd412684f572.1775786987.git.ben.guo@openatom.club>
References: <cover.1775786987.git.ben.guo@openatom.club>
In-Reply-To: <cover.1775786987.git.ben.guo@openatom.club>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Update the translation of .../rust/arch-support.rst into Chinese.

Update the translation through commit ccb8ce526807
("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Ben Guo <ben.guo@openatom.club>
---
 Documentation/translations/zh_CN/rust/arch-support.rst | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Docum=
entation/translations/zh_CN/rust/arch-support.rst
index abd708d48f8..f5ae44588a5 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -19,9 +19,10 @@
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
 =E6=9E=B6=E6=9E=84           =E6=94=AF=E6=8C=81=E6=B0=B4=E5=B9=B3         =
  =E9=99=90=E5=88=B6=E5=9B=A0=E7=B4=A0
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
-``arm64``      Maintained        =E5=8F=AA=E6=9C=89=E5=B0=8F=E7=AB=AF=E5=
=BA=8F
+``arm``        Maintained        =E4=BB=85 ARMv7 =E5=B0=8F=E7=AB=AF=E5=BA=
=8F=E3=80=82
+``arm64``      Maintained        =E4=BB=85=E5=B0=8F=E7=AB=AF=E5=BA=8F=E3=
=80=82
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        =E5=8F=AA=E6=9C=89 ``riscv64``
-``um``         Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
-``x86``        Maintained        =E5=8F=AA=E6=9C=89 ``x86_64``
+``riscv``      Maintained        =E4=BB=85 ``riscv64``=EF=BC=8C=E4=B8=94=
=E4=BB=85=E9=99=90 LLVM/Clang=E3=80=82
+``um``         Maintained        \-
+``x86``        Maintained        =E4=BB=85 ``x86_64``=E3=80=82
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--=20
2.53.0
