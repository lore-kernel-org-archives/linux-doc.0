Received: from sg-3-29.ptr.tlmpb.com (sg-3-29.ptr.tlmpb.com [101.45.255.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4C93B95EC
	for <linux-doc@vger.kernel.org>; Wed,  8 Jul 2026 05:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.45.255.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783488381; cv=none; b=qKittvYTuyyRTXRxI5JGsWS6CUHmisgBPFaez+65Gp6vUIHKBbkx7AnYZ/FCLWzIz5KCMVKuKfR+wzEumqqVymDEzX8slOMSLI2BdaPJbOXoDbqifUQ8ERqKlZmJROMgO2GBUNivIE16bWW9wTOrX8U7bNhh7vPJ6VKuBkWRucY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783488381; c=relaxed/simple;
	bh=tmodcF4+QiDiIz6WsYj59ZqemeeO5oJgHmmFdea45QQ=;
	h=Message-Id:To:Cc:In-Reply-To:Subject:Mime-Version:Content-Type:
	 From:Date:References; b=Jc5n9BQRbkVBwDOpNIEcBb9Td7k0CfoleYnttgKQsykQAdTC12v/8ROTgPll1+JtRxeaksGYg/xWUA/9seRfqVTGAoCtkqLVpZ51j5RVBUPfNgmTRCi5HrPWY+h2H8psLAtSfx0IYNZt81IywWVd2tVHnhxKiGmqOQE1fFYRwA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=uiVpuxrO; arc=none smtp.client-ip=101.45.255.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="uiVpuxrO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1783488336;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Tn1ih0TZRCvYgAoo7m4rj+ooeW8ZODoMEyFV6AGT6gA=;
 b=uiVpuxrO87uXF9bhcyhY2TnR6Z22KkRJW8YrX3VAlgNhB3HvuRqDeDeFFAnkl755uAwiy2
 m1c4ezkgwcFh+JFazzwVRwrsLpnWUUd6OWshT/wFlVScV8a6AKbqnEfRpQs2P7Ev2ei6R8
 Bh0PR2xsMnIwe7AGQaT82O+WHTegC6BnzHjG9fg+kqej7VTpnmIVLePF84VH22GXBWjxuW
 ZDghDqYGMfaElgB7zWWc7RoSowRcbUtFpEMALq70matn6cipk+PQfLsrtKVLGRvOE36LM2
 jI+DA6T+ztSLLqmNO4F6h23im1CIBSAP5mu4QpABH6/ULpo6MgDkjZfQJyz0TQ==
Message-Id: <8496b3ae0cd02e7ab7f68c2f3dac781aaf4fb29a.1783480076.git.ben.guo@openatom.club>
X-Mailer: git-send-email 2.53.0
Content-Transfer-Encoding: quoted-printable
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, 
	<hust-os-kernel-patches@googlegroups.com>
X-Original-From: Ben Guo <ben.guo@openatom.club>
X-Lms-Return-Path: <lba+26a4ddf4e+13216b+vger.kernel.org+ben.guo@openatom.club>
In-Reply-To: <cover.1783480076.git.ben.guo@openatom.club>
Subject: [PATCH 3/4] docs/zh_CN: Update rust/arch-support.rst translation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Jul 2026 13:25:33 +0800
From: "Ben Guo" <ben.guo@openatom.club>
Date: Wed,  8 Jul 2026 13:25:26 +0800
References: <cover.1783480076.git.ben.guo@openatom.club>

Update Documentation/rust/arch-support.rst translation.

Update the translation through commit 3f70ebe63858
("s390: Enable Rust support")

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
