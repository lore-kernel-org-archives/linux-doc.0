Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432008;
	b=F9UzjWAMPZVU2nD/mVv8TcK/3IpkCDu/iThojuFQ5sIGY4pFPBScHIYG2XJ7GFfYh8qM
	 zE4LwJL6rPxaYhWcn+L6EzPbjeeXkVRGxUk8Rf3FL5Eq9CYD7k24iKK0ARGDRt5wW0CJM
	 Z/GTWvIhcKG0gYfB1ladAx0cimWJ13dd3/COzj7mc2NzOc6CAnpvry4rCqc+CH7SHpGLu
	 4rN3ggJK9RMzhyUyrnwPyjxhQw9C2hfFMd4vAxt56/gm5kQ7GaIQ+4f4jheabMAg9JXhB
	 gu2AnL8FvqrBIDEyIFxFbczkFB64JyMEo0Jjrk4ehdayXGSZ05UJ+n3ObGOp02mI5pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432008;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
	b=E/ftqHuhx985CJGPrMWAcpi2oSnTgIgXTlRHukhqbAGhZG4WY/5o3brx/ZcXOe66HruL
	 c3oVjMYvRcAw87AVEGMDfns7hEe1739DMKjgJU2vOwW/Nww008hJeP64cDAGLqryWrkc1
	 ANFVbkTM66QpkVWM2+V7Rn+mqz7/dThLCt8wqhL3omT2C3vhOHZ1jfDxJWAfg23tWwmpW
	 Gy9DMb0gKZ6muLc9jrWcO/yBNUaCBcEDI0A438CLDY7UeRPCOhJUo/Vkh2YJk3pMPNGP3
	 HzN0llCPA+idD/lbT51stiqlpmiEWSGSgLu3owCq+Tk/5XEb67fbnr7++m1iXN4FSLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na1coZTh;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A2B606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A2B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=na1coZTh
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3859da5694cso451388eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432007; x=1796036807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
        b=na1coZThoYNwYhIV1igqGSdS+NMMFhY8aSV7YS62w3rHRuE98v+/g3gIQCf7QaX/cH
         K9Ne2nc6A2oYH9ImNSlr5JMrCb4A5945NLHCEyoaNHIohgx2R33uaDmsekY+3zUB+KIG
         WwlmZ4YYp0mGxzlhi0MXaj1TKIp5tdB0lA5I3byJhW9BqdSsSdqko7eOAGZvVjDG4e2z
         VQcXTOyAif3dQ5WNku/21NGOvkxChbKr84usGStafIMkz+ainhPijwR+lRiCa6oNgi/V
         A1O2YGWhSmx6aGhSfFSp5eCUp2ZLluS/lMFulOjUdyvdKex+ez2i7K2QMsWctBHDjQXC
         /kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432007; x=1796036807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x8YQa1D4D7Z8Lu5JGDQU9m0aos2cqq5iQXG2x9p7/pM=;
        b=s2ICQyS8RcPcHiBFG/gWeZo16vrZDp2bH2kwH5rq8yiUZWBcP55AVsxjuUP2Sn6GxB
         aUhv2AMgupqvW05HpMCDVekHbMEeUVIDF/5aNLSZFVpUKLgagPE5i6/u2avFhLws6icF
         K5OK7csQ7ZVGfk5LMgX5EU0qzXFuiBgih5Uqrs6YGCywhiuvNemvl0/GRPX66Wm8pwj2
         tE+w7MDjcxBpxtmB6kNzeK+dJ0dxT1s9/i+wAH1cqIcYbvbjc4qft1D3eYD/gAVuxCQc
         rUo4MrALB3SrTz03miipEsq1xpzqHZ1p7c6kxJvq8aOapGDd7PaPKsE18x+F5gNQbs3g
         7wmw==
X-Forwarded-Encrypted: i=1; AL+hErGFT9YXqxbYP5xOYVQ/z1Q3Ua2H4fxRBPFWkB4Hc1hIn7SpSRKPkOTSS0zyHgqyoU6eREX8pNGyghs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/P0+vGKT+jrCwXjwsOuKdDR2F1jDfC+W+X4vm6XkrnZtZOepnX
	m/VGpJJ2QqoINl21zPlVt1O+RV1GHHsruZWzzNn4pQEowZu88FEiAF4M
X-Gm-Gg: AZFdTZfBALvsYOVQLI6gDVJjbbBydKdM8q4m3hFrRi7mZ9idAyiCNLVVDWuUmLMJHn/
	EGbSU1UAblo5WWFUyF3RWzm2osOPuuyLDB5gM0wPRZKRHCtshUCp6zeD/DTijUJPdJpW7RCgTPe
	Z8AMWQLF/5/XFsJfpW8b2Ly7mCnF2Ezu04pmWWfRCFFogjQQnwbAD2dpwpZd+FkkKmTr5ivUGCs
	eyAAwr4vWO1vZm9IsZ7yVX1fX7CFLW7Oc2e836tRB+DP5sPAh5NTSIISfglr9PGx+gLVG4NDnnr
	BXHR/KdgigkiuMqojdWwGdMz0YN2nVoUJqgff4uElN/kuK/ohUY89X00m2ZIlgU20IJI87LsiG4
	GOr1s0h9AxTBVYjDVTLt97tOby5XCPmi2SYjEHLxVaHacXTQPIGYVoPAETUG2KRvcI44sVNQcAx
	ViwGn8GGqImjNUK1DmpREWZEfn/b38RgksruwdReKYH1jPyC5RibNM4cZYxy2aXOnRb0lbxPhhR
	hdOH7uosL/PP2xfEmC6oBO5lZFBZIfyfBDoKT1Mta5enYXSpe9JQPXgeoVQHrUXjHG0dp5NnqXa
	ILoLC2yd8wth6/8tOzVEhIWVF/zltj3BNGonY4bVuj3O5tDGy9N1LTiQYduGsmvB3J2DwJYh79M
	UgbFbDhRlH26migsTXnU6uJjurJfBrCPzJsX1V/jlmhghtg==
X-Received: by 2002:a05:701b:450b:20b0:1b5:5a76:dfea with SMTP id a92af1059eb24-1b55a76e18emr14850858c88.0.1795432006886;
        Mon, 23 Nov 2026 03:06:46 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ff27bsm30054074c88.6.2026.11.23.03.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:06:46 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 00/13] docs/zh_TW: process: add translations of 13 documents
Date: Mon, 23 Nov 2026 19:06:23 +0800
Message-ID: <20261123110637.172045-1-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I previously promised Jon that if no contributors stepped forward
within two months, the maintainers would have to produce some results
ourselves.

This series adds zh_TW translations for 13 process/ documents that had
no Traditional Chinese version, and moves each one from the TODOList
into the toctree of process/index.rst.

It is independent of the "resync translations with the English
originals" series sent alongside it, and applies on its own.

Terminology follows the decisions in that series; whole-file
terminology unification and the glossary.rst update will follow
separately.

The series is based on the docs-next branch of
https://github.com/kernel-zh/linux-zh_TW.

Changes in v2:
 - Drop the seven labels that nothing refers to (Dongliang)
 - handling-regressions.rst: display the zh_TW path in the :ref:s that
   point at zh_TW labels, so the text matches where the link goes
   (Weijie)
 - maintainer-handbooks.rst: link to the zh_TW development-process.rst
   instead of the English one
 - Collect Weijie's Reviewed-by on 01, 03, 04 and 13

v1: https://lore.kernel.org/all/20261106113545.708896-1-chenyou910331@gmail.com/

Chen-Yu Yeh (13):
  docs/zh_TW: process: add researcher-guidelines.rst translation
  docs/zh_TW: process: add cve.rst translation
  docs/zh_TW: process: add applying-patches.rst translation
  docs/zh_TW: process: add maintainer-pgp-guide.rst translation
  docs/zh_TW: process: add changes.rst translation
  docs/zh_TW: process: add handling-regressions.rst translation
  docs/zh_TW: process: add deprecated.rst translation
  docs/zh_TW: process: add kernel-docs.rst translation
  docs/zh_TW: process: add maintainer-handbooks.rst translation
  docs/zh_TW: process: add contribution-maturity-model.rst translation
  docs/zh_TW: process: add conclave.rst translation
  docs/zh_TW: process: add threat-model.rst translation
  docs/zh_TW: process: add maintainers.rst translation

 .../zh_TW/process/applying-patches.rst        | 390 +++++++
 .../translations/zh_TW/process/changes.rst    | 530 ++++++++++
 .../translations/zh_TW/process/conclave.rst   |  35 +
 .../process/contribution-maturity-model.rst   |  83 ++
 .../translations/zh_TW/process/cve.rst        |  90 ++
 .../translations/zh_TW/process/deprecated.rst | 361 +++++++
 .../zh_TW/process/handling-regressions.rst    | 969 ++++++++++++++++++
 .../translations/zh_TW/process/index.rst      |  35 +-
 .../zh_TW/process/kernel-docs.rst             | 353 +++++++
 .../zh_TW/process/maintainer-handbooks.rst    |  20 +
 .../zh_TW/process/maintainer-pgp-guide.rst    | 793 ++++++++++++++
 .../zh_TW/process/maintainers.rst             | 125 +++
 .../zh_TW/process/researcher-guidelines.rst   | 134 +++
 .../zh_TW/process/threat-model.rst            | 187 ++++
 14 files changed, 4087 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/translations/zh_TW/process/applying-patches.rst
 create mode 100644 Documentation/translations/zh_TW/process/changes.rst
 create mode 100644 Documentation/translations/zh_TW/process/conclave.rst
 create mode 100644 Documentation/translations/zh_TW/process/contribution-maturity-model.rst
 create mode 100644 Documentation/translations/zh_TW/process/cve.rst
 create mode 100644 Documentation/translations/zh_TW/process/deprecated.rst
 create mode 100644 Documentation/translations/zh_TW/process/handling-regressions.rst
 create mode 100644 Documentation/translations/zh_TW/process/kernel-docs.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-handbooks.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainer-pgp-guide.rst
 create mode 100644 Documentation/translations/zh_TW/process/maintainers.rst
 create mode 100644 Documentation/translations/zh_TW/process/researcher-guidelines.rst
 create mode 100644 Documentation/translations/zh_TW/process/threat-model.rst

-- 
2.43.0

