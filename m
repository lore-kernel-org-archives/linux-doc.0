Received: from www3141.sakura.ne.jp (www3141.sakura.ne.jp [49.212.207.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D600563B9;
	Thu, 25 Dec 2025 16:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=49.212.207.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766679397; cv=pass; b=BC0Pbh/S9lbaCYlyptBCiWMeOLy18Kuaw4+SPEaqEvFojbdByxxLXlHYSpDH7eAxduELkyA4WZy7k4n9GzMpK7SfdgWN0cIJgGxxaHhyfL4oA2zPFeTWfk7ErJI0XE2Xd7ygcTwHvrRgB1UzVZuwsTqnrKHd75HjC4Piv8ejbsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766679397; c=relaxed/simple;
	bh=UyaiQYhk65x6zgsjlDmFPPuGtkt0Hu/eirlxxTS9uF0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HHpwIedD2GiQ3GtDi1oNQwhQeQhst56EYKIzwgkjq0RGagDacU7rf1QaG/SYh0mNp+HN0SJCoVHse9zNqqhKheL3NRHdzTynuUSHhQ0Bq9o/UDovdHdmVJOy8fLPytoCPt+lKXcIN+adGH7oA9gPJgonAIc7gZ3Djgn2n4f1eAw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org; spf=pass smtp.mailfrom=redadmin.org; dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b=k+rai9gS; arc=pass smtp.client-ip=49.212.207.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redadmin.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redadmin.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redadmin.org header.i=@redadmin.org header.b="k+rai9gS"
Received: from www.redadmin.org (bc043154.ppp.asahi-net.or.jp [222.228.43.154])
	(authenticated bits=0)
	by www3141.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 5BPGGMYU093622
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 26 Dec 2025 01:16:23 +0900 (JST)
	(envelope-from weibu@redadmin.org)
Received: from localhost (localhost [127.0.0.1])
	by www.redadmin.org (Postfix) with ESMTP id A998D109D6C01;
	Fri, 26 Dec 2025 01:16:22 +0900 (JST)
X-Virus-Scanned: amavis at redadmin.org
Received: from www.redadmin.org ([127.0.0.1])
 by localhost (redadmin.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfzykGPWz9wj; Fri, 26 Dec 2025 01:16:18 +0900 (JST)
Received: by www.redadmin.org (Postfix, from userid 1000)
	id 848BB109D6CBD; Fri, 26 Dec 2025 01:16:18 +0900 (JST)
Authentication-Results: www.redadmin.org; arc=none smtp.remote-ip=127.0.0.1
ARC-Seal: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space; t=1766679378;
	cv=none; b=U+d73EtocvAQrpTQIHEdrdBE40tplz4r9Mb/yBxe9KG2dTMBiA5gyt4nL0OkvkiBKedQIYsWed1uLLOlxNK2JGA+JNCXHCy0uq27xBuVQSHplV1AKdRq9Sumnj6w5mMljUN+za6yUbQBoiKOp1EdhXtmQScUS2/j35XwOTD8D7s=
ARC-Message-Signature: i=1; a=rsa-sha256; d=redadmin.org; s=20231208space;
	t=1766679378; c=relaxed/relaxed;
	bh=8ChEyV5fmSDKZ2ZgXn1GYJ7h6kclQsVyxXAqRaKWiCI=;
	h=DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding; b=HGohX4KtlmkHu7/+euVY8LWnIjtVzsun8NFDAPw1uAekNvQPzf781o6v4NDsNDhjmYPHpE1WOmxdptGwcBXTTDJcR/r0UjVRtBwWU/7v6vDCBXcBJOIwu/4sYMrb9mwWAt0X6zrItRqoTXcIe0Lup7AYShCpvDkRykFkQyFdDFg=
ARC-Authentication-Results: i=1; www.redadmin.org
DKIM-Filter: OpenDKIM Filter v2.11.0 www.redadmin.org 848BB109D6CBD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redadmin.org;
	s=20231208space; t=1766679378;
	bh=8ChEyV5fmSDKZ2ZgXn1GYJ7h6kclQsVyxXAqRaKWiCI=;
	h=From:To:Cc:Subject:Date:From;
	b=k+rai9gSvATeBP8LJ1sDv2jCsLEr/SGmYgaocK55gx72YnNdqMU8XnyosZftCIRno
	 wdmxTgv2+S1DuiPnn79RRV3offJ57SFk3GpzDuydNkmvB7vcfLRk9No3BHUhyQkkjM
	 f+TKSv0/pNTmwywjdLAIaXZYu30FP4VqPyIVDAys=
From: Akiyoshi Kurita <weibu@redadmin.org>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Akiyoshi Kurita <weibu@redadmin.org>
Subject: [PATCH] docs: spufs: fix ppc64 architecture line break
Date: Fri, 26 Dec 2025 01:16:15 +0900
Message-ID: <20251225161615.3107808-1-weibu@redadmin.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Fix a broken line break in the word "architecture" in the spufs
documentation.

Signed-off-by: Akiyoshi Kurita <weibu@redadmin.org>
---
 Documentation/filesystems/spufs/spu_create.rst | 4 ++--
 Documentation/filesystems/spufs/spu_run.rst    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/filesystems/spufs/spu_create.rst b/Documentation=
/filesystems/spufs/spu_create.rst
index 83108c099696..c1f1d857f911 100644
--- a/Documentation/filesystems/spufs/spu_create.rst
+++ b/Documentation/filesystems/spufs/spu_create.rst
@@ -113,8 +113,8 @@ Files
=20
 Conforming to
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-       This call is Linux specific and only implemented by the ppc64 archi=
tec-
-       ture. Programs using this system call are not portable.
+       This call is Linux specific and only implemented by the ppc64
+       architecture. Programs using this system call are not portable.
=20
=20
 Bugs
diff --git a/Documentation/filesystems/spufs/spu_run.rst b/Documentation/fi=
lesystems/spufs/spu_run.rst
index 7fdb1c31cb91..c5fb416296a9 100644
--- a/Documentation/filesystems/spufs/spu_run.rst
+++ b/Documentation/filesystems/spufs/spu_run.rst
@@ -120,8 +120,8 @@ Notes
=20
 Conforming to
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-       This call is Linux specific and only implemented by the ppc64 archi=
tec-
-       ture. Programs using this system call are not portable.
+       This call is Linux specific and only implemented by the ppc64
+       architecture. Programs using this system call are not portable.
=20
=20
 Bugs
--=20
2.47.3

