Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319823064B2;
	Mon,  3 Aug 2026 14:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767773; cv=none; b=P91nfgtTWxbRTlPLV2rlgVmba+y4yVe0frhvgHaVPg5nBk4YrW+46cL+XNaPXuE7/ma28iSC/eDksh34XpixD5GwhvWPfENi2DoYRIXByGlyYZFMZOQdQkD2zOKTJBtw2/6Uic9Yjo2xWfmIpA3h8c3duKx/NaCUWOLhtBI7uCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767773; c=relaxed/simple;
	bh=PiG/4SeP/ZGiVy5B7bUqumi2uiM0H7lZnFylX7S826s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FX87gdTP/dhXlT1EhlnG63/NwR/d9JhqMZf78nDzDIDPWHmMQBy7+V4OKeMXDVLJGSDkhNRWw25WE2kNM8jQfAYtQ595+DANvRkXR5UmlgMgeEqVbW+CkM1rb/RWPHrqBblCrGOMCNYX6qyGlIkUu/kCu4ycyQ41qJOl5xIaKGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=la5TxL6b; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="la5TxL6b"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A3EA4E410B9;
	Mon,  3 Aug 2026 14:36:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EB0D76029B;
	Mon,  3 Aug 2026 14:36:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC82F11C30E67;
	Mon,  3 Aug 2026 16:36:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785767768; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=jgmbwNUuaRAOoCqoqzSSpfi/jXOyqDf9xnqvfdIPrwA=;
	b=la5TxL6bp6Xl2uEWX1zaHyia6Aw/pGUvEzEHiIObEXc2uG+iRzqWvd5fJc/YUSv9VOOrzw
	qX6z1ffH+hkSxfxeHP+wW/AeHtfAFFdv3PYJYxjN4SaqpD0mt4I1EQySPhZnwr3E2lT4Wv
	KhdHWL9dHZMBrEsYsRghZrGmsy8iFEj7jcUxFp5AR0+YNp8VA/8dSLHtjOfirKyFYimqOE
	aZeMw2nmABVkS9ZJaiV0HKZRttrVHZWOufE7zcw5lOkK9L01Soj2gjgVbo2t0joHzGzqiJ
	sjM+0rgx5aVhTXNJjT5SxGmrvTyq2Ji2q1Ipg9Zt6yaCZMuQ0F5TzCkBbJ4I+Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Documentation: html: show sections in the sidebar
Date: Mon, 03 Aug 2026 16:35:49 +0200
Message-Id: <20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQ6CMBAAv0L27Ca1IAS/Yjy0dAvLoZguiEnD3
 130OMnMFBDKTAL3qkCmNwsvSeF6qWCYXBoJOSiDNbY1na1RpmVHoWFVUZATCgfyLqPvYu9ciLf
 GEGj+yhT581s/nn+Wzc9anj84ji/afCZkfAAAAA==
X-Change-ID: 20260723-show-sections-in-sidebar-b7f9aadf540e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1631;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=PiG/4SeP/ZGiVy5B7bUqumi2uiM0H7lZnFylX7S826s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcKdVPHi5MgqLwIK73dVWaBXJ8J5of3jgWuNBV
 CVDSlq0qLaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanCnVQAKCRDRgEFAKaOo
 NkphEACVRw+5nqO9KnalFMaN57TLohPfUJnhmkMvn8NUhMAiB5xVioWpkF1bxHexHC2v0RQ3fjJ
 BiU9H1iy9MVj81WSHOSbaQ15ULWat8NqBYrezMV7sycGOlbKTumI5qgCD8kOJu2mEfMHgZ2I5XS
 gAEOD10/skWt/CgTFS0i0bBMEvyghIhydTJ/7cQLWrdRh8BczORAcNGWBCnH+6yMD0wkwZYe8Bk
 pmqGb65oVhKxhuWdSio1kcY6mCYwu5tzUfbZElClFLPuxJHYoM3yvSmGz1GWqA2cfd43Ia3oct/
 G5L3Bu/1hCtOw9+LI4LKX7eqIYHmiL/htKu4mc/rfwlCuTJiwZL4dAUgQnvApEt9XSS03oAV7KW
 INJltMnWCOsAlFxUqNRvYUQonECOjRx5ZAOo2cySfy4O8ppFMtV0mw422FAiey04G2hMBVpkzq8
 XGqAgLSXZW7xKJKH4A6w01Dwcz5eZ5WmgwQwmJ7CXFIwCvb0p8nbC08XJVf1FQhzChHEkyfHLl/
 T3SaT1Ms9E6U8ts3IUjmsar2Y/FafRK1OJrgUIBw5/JFYWgt8XjcyVHKLm6GXYCu8JOEJU+thx4
 2jC964vQZKqmP5EKc9JYeRg5T0Za/VszuYPoxe1UiDuR/hjrsmR8e/zC31lpw5zNmzqMgLS21Wq
 uyfDjKxmxRu4Y/g==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

The current sidebar in the HTML version of the documentation does not
display the section titles because the toctree directives in the
top-level index.rst document do not contain ":caption:" properties.
Replacing the current section titles by ":caption:" properties would not
allow having text between those and the table of contents.

To workaround this issue, add the ":caption:" properties in the toctree
calls which makes them show up in the sidenbar, but hide them from the
index page with a custom CSS addition.

Additionally, make the section titles in the sidebar bold to make them
stand-out.

This makes the overall structure of the documentation clearer from the
sidebar directly.

PS: This is how I've implemented this in the Yocto Project
documentation[1] where I faced the same issue. See also the index.rst
file[2] (which was by the way inspired by the kernel's own index.rst)
and CSS addition[3].

[1]: https://docs.yoctoproject.org/dev/
[2]: https://git.yoctoproject.org/yocto-docs/tree/documentation/index.rst
[3]: https://git.yoctoproject.org/yocto-docs/tree/documentation/sphinx-static/theme_overrides.css#n106

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      Documentation: html: show sections in the sidebar
      Documentation: html: make sidebar section titles bold

 Documentation/index.rst                |  8 ++++++++
 Documentation/sphinx-static/custom.css | 11 +++++++++++
 2 files changed, 19 insertions(+)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260723-show-sections-in-sidebar-b7f9aadf540e

