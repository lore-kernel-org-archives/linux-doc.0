Received: from mail-10699.protonmail.ch (mail-10699.protonmail.ch [79.135.106.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 227632459DC
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 02:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778899292; cv=none; b=BOGp4C7d4bava9XOIcQxD5QTeq8tBApCsc1x7t+zxFvjwsPMuuAEirjA38xoK2rhqPIEdg971flkHHdvgz1jwG9hVIP5t0/OsQIxt9Der/UQUmMRzAMt5gi5ZE/ctBxE0/GwfdakwXGfg3/qZyGQbCKYUnbqrfbJLoNSbt9Pwqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778899292; c=relaxed/simple;
	bh=QqamRO/FvWaA61cKd7OvgRZA/H/6FG8mRTy9p8WPexI=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=S9yXSgyAlfCo4ECM/HZR7xv8XPH/IU0iJDxooHCD0U6AkeT4gfY9ehd+MPXpp9iFE/B8fEBK0F0AJv6eTLIk9b7U7rSAMl/wjJ9TNT0WBQyJlhoZtYbqW1P5XmWN5lCxhVw9Hw98GXFl7zgJWmMLTpr0vU2/eyLme20T+SK0T34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=JTjNubIV; arc=none smtp.client-ip=79.135.106.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="JTjNubIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1778899284; x=1779158484;
	bh=QqamRO/FvWaA61cKd7OvgRZA/H/6FG8mRTy9p8WPexI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=JTjNubIVab/SvlszRFUoj9ZCVmmXIKDKTghtpfHGxXlu+bLuuUjbLX8JfXQcItwah
	 XBLR+7WlBLOJJRrertApAUmGH/WTiVMdcXq3Naqc0G3CDY5jdj2tyQAoOafdWK4/tJ
	 HNOSQYkLDHTFf7ibv5UNAdlRnCREyQlzq9+UMSBr3TM9Ucl5ppBJCSScsFb904bnzI
	 OcehvAPempLx7SIGsFQQmjs6c4lphsx1RFNrI7eqVZ9J8kyUuKmTAVCRQzvbkmaqKf
	 KC16YosrxxjTmdsKx0Lbxd83lRLEtXqQpbSDjlifFlPfVTfQMd0Qxm9ene1BDK1r2U
	 nrwOcGUCc+N0A==
Date: Sat, 16 May 2026 02:41:21 +0000
To: "corbet@lwn.net" <corbet@lwn.net>
From: Hassan Maazu <maazudev@proton.me>
Cc: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "khan@linuxfoundation.org" <khan@linuxfoundation.org>
Subject: Documentation: fix typo in title for max31730
Message-ID: <lC2hDaF-g523KA69MW_DVSRix9HHjA5drjH62zaO9eFNuOboR1cxxrTbqNJ8lmvuZ0u35qD4Ds8x0SeARtp5Hi-qIVpOi2zjYoV_vzCJjEM=@proton.me>
Feedback-ID: 83974785:user:proton
X-Pm-Message-ID: fed190fbfcb7d2ceca83bb4d01f7be72cd18abe5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Wrong device name used in title.

Signed-off-by: Hassan Maazu <maazudev@proton.me>

--- Documentation/hwmon/max31730.rst | 2 +-
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/hwmon/max31730.rst b/Documentation/hwmon/max3173=
0.rst
index 1c5a32b64187..0936ba2eac24 100644
--- a/Documentation/hwmon/max31730.rst
+++ b/Documentation/hwmon/max31730.rst
@@ -1,4 +1,4 @@
-Kernel driver max31790
+Kernel driver max31730
=C2=A0=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

=C2=A0Supported chips:
--
2.54.0
