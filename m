Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01ADE1D0F5A
	for <linux-doc@vger.kernel.org>; Fri, 18 Apr 2025 05:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744954449; cv=none; b=LF/w/u3GbrFNHRNrzVsgBQcsIKfEe6z6qkaHtFLQ/l5ByozQ1xGSBupLdyguQs7fJusneeJf9XcYe0yeyzaEduiVOGPOidla4hWXfS1UDeF2mNgsZO7kVMC8uRKKFBauRCVg7k+mnI6+KrmSBocJ1x+fEGY88wEgNdBnr2VwbaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744954449; c=relaxed/simple;
	bh=LtRg6niHEi2DQ9iFDzwd5PA1DwtNs1UPqBb+ekeVp3U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jEFGu89y6314yFIUOxgL+Cf+AYK9TqWQp92jSMBMW5Zn/DJY1DRuHaxbRiHAYmSW1BNN7YSj70AtL2FtV2AQoGhOEdNoScbxsWkgaZqCG3KIvWs2dHMUwitbKlTS29eR61KyMMaYCMNMa3xZrY7tUu9rQtUcR+3LOXhdq9jg/9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=UgU5ug4y; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="UgU5ug4y"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-225df540edcso28774945ad.0
        for <linux-doc@vger.kernel.org>; Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744954446; x=1745559246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=UgU5ug4ycWDYc0y9b0U+r0rw/XBmkgCaka+N8KC66/P9MnKem1f9rKAnzRYgmXgsDD
         b/Lt30fiv8RrVfuKXqb+GkBcUwz3EnKepWUvB0MGysVubU5HAWOb/pLqOmKKZhmEZv/m
         GHsEORpMEFu1CKtrrj3FDMPlV/96zwdIUpkCCZRawaWOKo2yGSEpqPGqCMIR4Q/1et/E
         P+6Ia2OCLqBvfSxNflo65joFzjC8YE0JcXfwxqgMYGue1Fbh0z4e6n9TG7Y/Z2LdeNYr
         FLNqwcsxPC5JF9HFAqcG3NmUfmiZLshm+0dagf8KAarF64hP0+nLhe2OGanTodkmaamH
         qO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744954446; x=1745559246;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ifg+0ndXJ2hyqLqsXxIeKIJUyt2/+ZV8bbkAn0MMen4=;
        b=cXrnZF54wVxwXuGViqL7v29X/X5TLFvVtsatGJWqnrtkI4ZMUntjlO4aY4PnO7QoUk
         8MkgibKNn8udv+B+TYR3tiiG9LaZgKPLPLpWHj/InxA8lEcznKs4pSIcnAdzwJncebX5
         pRr5IbWfxNTKy544zaULrIIvrkKXTFOaRC9w1Kj2n5VtUnRtmM8d3lN6CL+Bfk8ws6yp
         PBgA75K9IxcnS+2qzw3YcLAkCy4m8vqPnTktoUfagTNQQRQgR4bodZtOJD00VxQNndJh
         Ze040Yh5R8M/rFeKmmFe+ce229YGmAF1Jb8IvxZHb2QLf6gWr1d5mPsCRxsx2dN4ZVEA
         YiiA==
X-Gm-Message-State: AOJu0YxrXMhdnO8CxI0ddvJ+RfabT9w1917JSsP20HWlsbyII2t21PwJ
	fHe98YQwYMdnpacnpXv+0EASj1qh9nF68wZ+avO/yYWD9huS/Tq4r1iKQIFctp8=
X-Gm-Gg: ASbGncvwtXbUjnQtXInLWVVFqsa7pe3PjxyMRNRAJz7OlU/AhXZo6FnXwclLFIdMXWz
	iAtsmuCdU29rU9sv4B2m7G8Er5geXVXu3WaYBOO/ww7j1243fhawo5PDZz9SRxbpabL1IDs2PTf
	v/N4i5Pi0w2CLTrALblrYcoHumbLfD1tuAbySEcxmnGhwiu2/OvVd4N8pd/+AuYI77FNLrLdz8C
	PCZbDpgB7BONHC19iNtTgR+7kjnuJwnnumJXVhaMSV7a3NbArTUL7i26+8Tsfwra123V6UTKqAJ
	Evkz66bu5M2ymHUt+I5AebxYApri6fz/ObZ0ACOxXhZvKKRJkarD2Qao+24b/HtyhT7B2u3maHH
	j
X-Google-Smtp-Source: AGHT+IF30Ic6GVhtBZhXWiFfbhsB3x60TB4XZmnInk7Uzg1ufwZLD/plPYkbKF7vJ/qDJWcBp1kQIw==
X-Received: by 2002:a17:903:3bcc:b0:223:3eed:f680 with SMTP id d9443c01a7336-22c50d44a6bmr35959255ad.18.1744954446358;
        Thu, 17 Apr 2025 22:34:06 -0700 (PDT)
Received: from cyan-mbp.internal.sifive.com ([136.226.240.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfaed86csm834555b3a.180.2025.04.17.22.34.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 17 Apr 2025 22:34:05 -0700 (PDT)
From: Cyan Yang <cyan.yang@sifive.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	samuel.holland@sifive.com
Cc: linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Cyan Yang <cyan.yang@sifive.com>
Subject: [PATCH 00/12] riscv: Add vendor extensions support for SiFive
Date: Fri, 18 Apr 2025 13:32:27 +0800
Message-Id: <20250418053239.4351-1-cyan.yang@sifive.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set adds four vendor-specific ISA extensions from SiFive:
"xsfvqmaccdod", "xsfvqmaccqoq", "xsfvfnrclipxfqf", and "xsfvfwmaccqqq".

Additionally, a new hwprobe key, RISCV_HWPROBE_KEY_VENDOR_EXT_SIFIVE_0,
has been added to query which SiFive vendor extensions are supported on
the current platform.

Signed-off-by: Cyan Yang <cyan.yang@sifive.com>

Cyan Yang (12):
  dt-bindings: riscv: Add xsfvqmaccdod and xsfvqmaccqoq ISA extension
    description
  riscv: Add SiFive xsfvqmaccdod and xsfvqmaccqoq vendor extensions
  riscv: hwprobe: Document SiFive xsfvqmaccdod and xsfvqmaccqoq vendor
    extensions
  riscv: hwprobe: Add SiFive vendor extension support and probe for
    xsfqmaccdod and xsfqmaccqoq
  dt-bindings: riscv: Add xsfvfnrclipxfqf ISA extension description
  riscv: Add SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Document SiFive xsfvfnrclipxfqf vendor extension
  riscv: hwprobe: Add SiFive xsfvfnrclipxfqf vendor extension
  dt-bindings: riscv: Add xsfvfwmaccqqq ISA extension description
  riscv: Add SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Document SiFive xsfvfwmaccqqq vendor extension
  riscv: hwprobe: Add SiFive xsfvfwmaccqqq vendor extension

 Documentation/arch/riscv/hwprobe.rst          | 22 ++++++++++++++++
 .../devicetree/bindings/riscv/extensions.yaml | 25 +++++++++++++++++++
 arch/riscv/Kconfig.vendor                     | 13 ++++++++++
 arch/riscv/include/asm/hwprobe.h              |  3 ++-
 .../include/asm/vendor_extensions/sifive.h    | 16 ++++++++++++
 .../asm/vendor_extensions/sifive_hwprobe.h    | 19 ++++++++++++++
 arch/riscv/include/uapi/asm/hwprobe.h         |  1 +
 arch/riscv/include/uapi/asm/vendor/sifive.h   |  6 +++++
 arch/riscv/kernel/sys_hwprobe.c               |  5 ++++
 arch/riscv/kernel/vendor_extensions.c         | 10 ++++++++
 arch/riscv/kernel/vendor_extensions/Makefile  |  2 ++
 arch/riscv/kernel/vendor_extensions/sifive.c  | 21 ++++++++++++++++
 .../kernel/vendor_extensions/sifive_hwprobe.c | 22 ++++++++++++++++
 13 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive.h
 create mode 100644 arch/riscv/include/asm/vendor_extensions/sifive_hwprobe.h
 create mode 100644 arch/riscv/include/uapi/asm/vendor/sifive.h
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive.c
 create mode 100644 arch/riscv/kernel/vendor_extensions/sifive_hwprobe.c

-- 
2.39.5 (Apple Git-154)

