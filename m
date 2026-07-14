Received: from va-2-35.ptr.blmpb.com (va-2-35.ptr.blmpb.com [209.127.231.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DAD3EB0E8
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 07:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784012470; cv=none; b=W36BHojGwqNVtdbEXty+s2nczwjb2hyfiNsQFhn1I6k2fmQ8s1WsWjsDWOSLCA6H6s2yM0RoUddeZccgUZyILpgHew5zhULhMTNmV66QcqSbC9OkscUOMThVTfQEGyX+0Xse2hovAjKhw7vDvrrXaIpNWC8mXZQuilr0XxL/T/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784012470; c=relaxed/simple;
	bh=gNLDLjDiJQrNQ/BJDs3dh3CJYRDKd/WHXTMTTXaaZcE=;
	h=From:Mime-Version:Content-Type:In-Reply-To:References:To:
	 Message-Id:Subject:Date:Cc; b=BLHgc5Oc7+cULTyxmtQbF5c5skUliY8/uqjHJ00xz45CCS2RaRKbSax6c3JAfrZf1+URQlgIJfVrvOjgBOm7QDnSbM0JdItz65YHdOfEp0NvBNQYGIQtc2JRQSimVYLLZaFO7CEAi4oCghQZpXq7en2kkuDx+2QTlhXI9EPfD6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=K5LJSSrS; arc=none smtp.client-ip=209.127.231.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="K5LJSSrS"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1784012453;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=8oy1lKCW+ydZeYMRTpmA5EiGWYk65RJv0w63nUr0nGI=;
 b=K5LJSSrS3b6XkYf8DVCrGL4yZh1npq6fP5DoHtbPf8uCDUm2xn6SKCs5e7XCrLDvyEqmJa
 GUL8zwaHe4NbKP2/axupSjbdXhS8ZrBsBMwHRJsMPmwzsikdN2favSw3/2Qn1nYfjjr0J9
 mUKGAmtbfUB19jfBUKAkGz6hcEfXRKPXv23Fq/TnZMDzYBf7DITgEl9Ch6qvmy6rX8OzCk
 fC+jCHYEZ7zDDLjqocBNMnNvVPK0WlZuUwEgL7dKJwjt4bg6TFePxJyzlrnqB9SPdVOPBP
 q3JhrT1PjvyVqs2vxKSU7n4y0+MM7pW37Z16saaFweLuiMqXZA5UWcVjRP5chA==
From: "Ben Guo" <ben.guo@openatom.club>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <cover.1784000217.git.ben.guo@openatom.club>
References: <cover.1784000217.git.ben.guo@openatom.club>
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <siyanteng@loongson.cn>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Message-Id: <2684fbb81c5ca3321e927af7b2e61c2c6016df36.1784000217.git.ben.guo@openatom.club>
Subject: [PATCH v3 3/4] docs/zh_CN: Update rust/arch-support.rst translation
Date: Tue, 14 Jul 2026 15:00:10 +0800
X-Lms-Return-Path: <lba+26a55dea0+8ddc6d+vger.kernel.org+ben.guo@openatom.club>
Cc: "Gary Guo" <gary@garyguo.net>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
X-Mailer: git-send-email 2.53.0
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Tue, 14 Jul 2026 15:00:46 +0800
X-Original-From: Ben Guo <ben.guo@openatom.club>
Content-Transfer-Encoding: quoted-printable

Update Documentation/rust/arch-support.rst translation.

Update the translation through commit 3f70ebe63858
("s390: Enable Rust support")

Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
Signed-off-by: Ben Guo <ben.guo@openatom.club>
---
 Documentation/translations/zh_CN/rust/arch-support.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/translations/zh_CN/rust/arch-support.rst b/Docum=
entation/translations/zh_CN/rust/arch-support.rst
index f5ae44588a5..0ca4be6e176 100644
--- a/Documentation/translations/zh_CN/rust/arch-support.rst
+++ b/Documentation/translations/zh_CN/rust/arch-support.rst
@@ -23,6 +23,7 @@
 ``arm64``      Maintained        =E4=BB=85=E5=B0=8F=E7=AB=AF=E5=BA=8F=E3=
=80=82
 ``loongarch``  Maintained        \-
 ``riscv``      Maintained        =E4=BB=85 ``riscv64``=EF=BC=8C=E4=B8=94=
=E4=BB=85=E9=99=90 LLVM/Clang=E3=80=82
+``s390``       Maintained        =E5=BF=85=E9=A1=BB=E7=A6=81=E7=94=A8 ``CO=
NFIG_EXPOLINE``=E3=80=82
 ``um``         Maintained        \-
 ``x86``        Maintained        =E4=BB=85 ``x86_64``=E3=80=82
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
--=20
2.53.0
