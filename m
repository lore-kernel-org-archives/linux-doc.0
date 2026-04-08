Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AC70830
	for <linux-doc@vger.kernel.org>; Wed,  8 Apr 2026 05:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.127.231.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775624761; cv=none; b=fCDjqLXTAWcrt9OVyE5fMsE1+vt2vAJKdrMovkub1yhGuKeAPi7dN6jd4hbfw0IP4PhKuVDZ2+MxyJZJkbgGyhKndir7nBmiS4TDg/NUjL6IV9zI89CFvwm5beBC1sm09sfCRwhvAYkcZAP4vWZO3YPU4u0VpoaFozHHyO7Di7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775624761; c=relaxed/simple;
	bh=g4C6FFS8LYr/x+aDGV/cZYMvYOKUJPL9jr/OjEbqbN8=;
	h=Mime-Version:In-Reply-To:Subject:To:From:Date:Message-Id:
	 Content-Type:References:Cc; b=mmRHWVNWqLHlHlTEs6lQbPs4sSLGAej5GeB62+D1CT43sOBZjWDkmgAB3BGiBxBDpRP4fSTHHVXko9A0tG6D/JeCTORbahczhS02GKuFZH9+a8QMshenrJbHJcsPieYYeBf7Mke0knc4nKFM/GmGMNNU6lXJxu1BrHRj0YjdhZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club; spf=pass smtp.mailfrom=openatom.club; dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b=TkY0aSEI; arc=none smtp.client-ip=209.127.231.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=openatom.club
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openatom.club
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openatom-club.20200927.dkim.feishu.cn header.i=@openatom-club.20200927.dkim.feishu.cn header.b="TkY0aSEI"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=openatom-club.20200927.dkim.feishu.cn; t=1775624755;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=p3boRhsQNWfdjnCLQ95YMlxElU1EztUHBdJUM4Vp9K4=;
 b=TkY0aSEI1KcgCv3mc4LBGRXiwiwMxye0WGVurHXRj2jLRpuwqOB6wOduxJdSROXjkSd6gY
 LtXUP9YYhyT7jpWoQdvqgZJ/okfB/9d5bzavzqW0rJ3B6yBnnNEvkPv7zvXBvThbk6FvAw
 vZzVO/U5pfHAUYnacwmhxPh+tbSBzCWQWU7KyHWe7/Ier0O7KbaT43BF5ZUJkW3rgxixQV
 JNzyZW3nugp0vQH+irUConiJP28dP+3OhDat8pw31r+jx9TVyayale2I8Y/3r4Wo5/lrGc
 UMmXjKX+AS5r1Xr/WONvvLKPRKJfhj1MDJMZexu1HyAzz/DJgVEJp/1gN91TcQ==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Original-From: Ben Guo <ben.guo@openatom.club>
In-Reply-To: <cover.1775619061.git.ben.guo@openatom.club>
X-Lms-Return-Path: <lba+269d5e230+4cd28d+vger.kernel.org+ben.guo@openatom.club>
Subject: [PATCH 1/4] docs/zh_CN: update rust/arch-support.rst translation
Content-Transfer-Encoding: quoted-printable
Received: from localhost ([58.35.126.19]) by smtp.feishu.cn with ESMTPS; Wed, 08 Apr 2026 13:05:52 +0800
X-Mailer: git-send-email 2.53.0
To: "Alex Shi" <alexs@kernel.org>, "Yanteng Si" <si.yanteng@linux.dev>, 
	"Dongliang Mu" <dzm91@hust.edu.cn>, "Jonathan Corbet" <corbet@lwn.net>
From: "Ben Guo" <ben.guo@openatom.club>
Date: Wed,  8 Apr 2026 13:05:43 +0800
Message-Id: <0e367d0dc8d74287dee1605a48ea80159fa464cb.1775619061.git.ben.guo@openatom.club>
Content-Type: text/plain; charset=UTF-8
References: <cover.1775619061.git.ben.guo@openatom.club>
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<rust-for-linux@vger.kernel.org>, "Ben Guo" <ben.guo@openatom.club>

Update the translation of .../rust/arch-support.rst into Chinese.

Update the translation through commit ccb8ce526807
("ARM: 9441/1: rust: Enable Rust support for ARMv7")

Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
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
