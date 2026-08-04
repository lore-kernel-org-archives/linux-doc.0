Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B7B471414;
	Tue,  4 Aug 2026 16:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785859204; cv=none; b=s9hoJaZsMq7bK29mIFnJMfqZNqUuje9sDdwdzSp2TKgj1RN1OcW/brL2UwxiUqFXBWiYRWFCX5+se8q6VnShthDWexpmp3edMVmdLVV1ddiE8ahI12kCkBb7Y2bswKu9l2FJTzhk0eL9nAPcZIxc69Ig3TJjR3rEcMLv3s4DRpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785859204; c=relaxed/simple;
	bh=VF3sbomzQFpcY8lXvATjazuTalx3Z6HJCn+YLj3GZ/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=XQP4BMkmM5f5rTvIm4RUbrCEzHXMBa59S6k7TcRS8qhH/cNeykbHtVZl71rQZsTJKt67z65QWVlM0fGeiUnTs0r+Hz5R1hnGB+/okH9W9v2ZqwstaCx3iB3hDv+vcFwIi4TCsUg39ivlFruXOp52DFwdqbCrncFMHiobp/L5VN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=FL2aAaUG; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="FL2aAaUG"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 449D91A140E;
	Tue,  4 Aug 2026 15:59:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0F32F6029E;
	Tue,  4 Aug 2026 15:59:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D2B111C330DB;
	Tue,  4 Aug 2026 17:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785859193; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=e5Ac3Ut5/qKcny6MeH7be880f6glMG0zeP3RDc7S9bg=;
	b=FL2aAaUGgD0fszu6sN7a9VJrlGVZrZjUf0H4N4vkdvA5TioRiXlLewQbRBWzXQPL25hq1M
	v0jyMMlckZAxeDI7xuxOPquJSOLTSTZpDrj4GJhhGKGVbzyq+bsl42FwLBtr2qZGPdo4Sz
	Cl2OGEX0HtE1wHp3pUE+cm9f+R68hrRaD9Ip9ROWmIJ83gg22UZPx8NaVgTZ+fC0lP7PTE
	5iOKZfc6nR2eaq2JvWdMTF91ENzLxJkCXZohxtXas9tjD+Elurh3JxrdEr5EEIMurC+6wL
	lGE0Ff6V4cxl8DlagHLWft1s2+pCGmqguDJGv5WumhsTMMAYrF3hjGzXVDiiVQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH v2 0/2] Documentation: html: show sections in the sidebar
Date: Tue, 04 Aug 2026 17:59:33 +0200
Message-Id: <20260804-show-sections-in-sidebar-v2-0-a68d23bbc79d@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4V07ZhaQdCV/2FY9DGVMdqaDqKG8
 O8W2Ls8ybn3jIIxEbI4FaNIOBBTDBnUphC20+GKQC6zUFIdZK32wF18A6Pts8hAAZgcGp3A1P6
 otfNVKVHk+TOhp89yfWlX5pe55eX8NxsdcR/Td2kPu9lbM438kxl2IMGU3tmmrCtVubOJsb9T2
 Nr4EO00TT8LxZWD1AAAAA==
X-Change-ID: 20260723-show-sections-in-sidebar-b7f9aadf540e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Randy Dunlap <rdunlap@infradead.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VF3sbomzQFpcY8lXvATjazuTalx3Z6HJCn+YLj3GZ/8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqcgx2jlM8xDwS09r/DNuhdJ/j/NhEFWPc8xvZs
 ToBLlN17DKJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCanIMdgAKCRDRgEFAKaOo
 NsHdEADI1jskxJfPND+a7/lFQMOd0L1d3XyywB2YzJkZV7oPr79OrN/PJe9kn8oNEuEszpyf5lx
 5Z3O++EL/WMaTZOPkehTukKxzhDAHt5bZM+Hqy2PvSbDvHt6Bk5ulnOHkCDlhLMEaMi3QtL66bX
 +MsmIg+pA/NIiewScdTzJZ27IwidsBVoPcRuVGAhH29VAmWr9h3IWxKiYVltWaXS7qoYWlFrb3X
 xXco5cfYxc2Vk5Jzw//RtW6NiHc/tjnYiPacYSXpfPQ/xdeYskMCj3f+QF2YXOEHxuftfjHLF2D
 eppU6Q1ZzX77FLmc2Tg88PAx1kPI2scgVm6X+rjtCd7nNEw4dxSNuW8bHG52N5Az7yAN6jNy0aV
 vOVhQ206kV73iY7HtjNIfnxq5ssZyOHJWTk1gIGl8PhCKYdpziGtDjKg2YsQ4fvF4GOrz//FSce
 XmVLIzFq6XGxWNrQYvgBBx1FiUNX4eZKnPH8sQVmU0slNOQohntlogX0Vb8s2lILDRwePeSn16R
 mgj1R84uq0gPveCKGpoj6fYl5FgGo0+VHl9WGSH74Nwk8e6W+PsHS5oCXrRodYgoE6sQlnvJVAa
 xZFRcqigR1ECHkU3FzMDDvRqaEikkDODS4vc68+mzcsGCVL9lKpe2AxuGpbJZO4NAiIruAsOy8w
 cEu6g0A//V8nxSA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3

The current sidebar in the HTML version of the documentation does not
display the section titles because the toctree directives in the
top-level index.rst document do not contain ":caption:" properties.
Replacing the current section titles by ":caption:" properties would not
allow having text between those and the table of contents.

To workaround this issue, add the ":caption:" properties in the toctree
calls which makes them show up in the sidebar, but hide them from the
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
Changes in v2:
- Apply RB and TB from Randy on patch 1/2.
- Remove whitespace before section title and first subsection.
- Link to v1: https://patch.msgid.link/20260803-show-sections-in-sidebar-v1-0-b4fdc847525d@bootlin.com

---
Antonin Godard (2):
      Documentation: html: show sections in the sidebar
      Documentation: html: adjust sidebar section titles styling

 Documentation/index.rst                |  8 ++++++++
 Documentation/sphinx-static/custom.css | 12 ++++++++++++
 2 files changed, 20 insertions(+)
---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260723-show-sections-in-sidebar-b7f9aadf540e

