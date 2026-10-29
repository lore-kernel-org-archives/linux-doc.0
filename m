Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793280619;
	b=ew1Jy0B7xvQjFVmymZhLtlk7srev4cnmLm2ZHDePjcHByJWp4Y4oVjL4RMylmV/b1kdg
	 qrrlSGafiNyQ3UQ5RPeHUn0w3XHkqRy2GzQqxrxBbgmEz9qboGDVK5jlLlTPJ5uPIKrYw
	 CB9NVVHRbuLRj1pUqea39TuruAoIOUtptWiJVBWku74yG/kVVi3RTS/gXfPa3dcFDF7S8
	 pLQMeWuuLxUN7LyeCdD2nhxEMiOJ699vBrWEODciEVUMcJ4X46ANAxxjhbcHVAT8CPsMm
	 mfVc7S6fyndn5CU6ae+9oLFnQuQIe+HorF3l/WPgmVe3ohB4f3Bvzl3MgAISiMMy3vA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793280619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
	b=UI/rs6rTNzeMAS0lnthHDoNsdRToLgs5SVQZe35YwqwGYQPKt3XqRod1cbSX0AtvRAlC
	 cV5gNdp7MUBp5b8T7r0gL+i8VFCbP8I/XXSvrhWho8KZ9b6lS5xxiZvysqGTOdzYtLEtr
	 ACBd5T8UWmTFCgsBpoQVDxivX0rFCU/m9qTIpvpNdHjqoAI3u19e//8F3Hh/zeyeTWKqE
	 RIihekDZp7leQGkOW91uqk/HvAPSRX9Ql3xc2UbWNoilryBf37C5R3t4TZJxIRDnEeu0O
	 DbZNj3sWNCSoKQVyiAEWAHlxk7wE8AJKCl2FIjohB2/PBP6+68KDvrHZJjGY1Cs1ocA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TP0rN4nH;
	arc=none smtp.remote-ip=74.125.227.129
Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158F8606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 13:30:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 158F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TP0rN4nH
Received: by mail-pj2-f1.google.com with SMTP id d9443c01a7336-2e876f468e5so1185115ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793280618; x=1793885418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
        b=TP0rN4nHLQ1fB57H62jKG4PP8jAKAyi3uopqyZO4N6PtzC2dD8jg4dpauPdJrLFsQ/
         6NY8asEy/okYbK3YqTDLb9hzEpRQFqgPEPdCkRwFEqmkgWfwVyvjTXUb7F1aVx5dRnNW
         FNaQnkS6HXj+JfvIsA4Bwv/Xd/gXvo6bjEK8nH4hBACXP9bhM2iURYU3yq6oCvMb5nzE
         ocmCqg8hMNKK54alNTlT13b6BVzDNiXlp4VGn+1sdufrXLCAdIqM7UDJZtEr6gUoOymv
         7bu7CNI2kHCNUlR2qZks7V6UTWVbFotYg4l7R/FoBT+fTYnylC7dzrcjg5zj9cIsfY1i
         knHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793280618; x=1793885418;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FK1NEp7KNqNkN9kw4sF+qFm94iQIH/PmZZAd7ktbsQU=;
        b=iMAfpcKpuowVs2MGbbjDWztY1EjS6+bvxJVJIkoKCIJqxmltWTJL2G3Gj8XwUOIg+1
         oMrb4v8v71Ssj3tQSgf5kAuF/WblzlGZB1hGBLWCqfk/xr4FoTgmAiE7gDb7SxcYAqFE
         0tp10pLaEondB65N4UHOED/TVoRwuRg2+By746StmOUmT1P9rukeDPcl7WY2miI6ZVeF
         nOOiB6aSXdVXNsvPab0euVtUUlmBPlnb94OB1wGxMo+Agq/ECIFUVToR7+n+orkn9d5x
         9+lfWYnLjExBMG8iuLlDT4lCRJXyPsQztBjlnVlN7ybWXqjQ78v9uHMQoCKwKzowyYfR
         +Mmw==
X-Forwarded-Encrypted: i=1; AKwUvBx3GfDV5O2AMcGov4TPjdL0CpgyUS6QOOxb7qiAbov6tYXN5U8Ep0/ZxcjdI+gHBKfFQ5/Mwa1Gg0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLuvxLHbthqhWcp9RacB7Yb+xDRIIA7T7TASsJqNamkE2HQWbVy
	z+8Smw7Kai7gqqqTRoujhP7PrLBzyto+gHF5vqXIHL3nF1TEO2ke73zN
X-Gm-Gg: AYBFou0GsvH3P144YC5EGSfSeQr7Wzkoyy2nYXYIh1tcYnSf8WfSMkruJwfJb1wYRd1
	6kE6l+KpwjsGuo+aCMzcY/MAaEpsBoO69OVxnvIvmhHYcBreYWHcfogAHa1Ccl4LV2zKIMu66wA
	X27V2g1OsjKWRK78IPSqqZyPGYKTOxiz5cLl5Zyhv+jgBrbN7F40Um1TGEadhqjGSJP6eE2GrqN
	CRb4pB43teD9yKgbeoZ9oPAyzJ97Sl7mKsuT+B/my8o/oVT8E14GcWFx136rC69Qlz3Q9l3Kavh
	a0LYdeGd3AV7Ui0q41dfFzwHAhgKhS+V7MW1IA142V0vJ8EGA8scm7isDHvQG4KZwTiMOQ2JRaa
	YCSPrz0P/raINFDA3xZJcm7e9LwucNLla6FSvlcE2Nxez6PkriqQWXZjRUjzw71oaIbKWErsrbM
	/+7iR8HNuVfLBnIjNrPBVbxNmG1ZXqpxiOc2UFcK36P6Z3KhF/AMhdZMtzRUQJMC/kEqm8pFZqB
	vXrFt6ylRKnlRTbmHd1Bs4fkt8azdQ93r4aTwzCns9Nj/oYGoegHx7fXiQI8q767DB3h/KW7pzy
	WT5ZLzqR8X2VK5MPJpc0nNWBmIkuqaROttl4QQ==
X-Received: by 2002:a05:6a20:2445:b0:3de:7bd5:fb47 with SMTP id adf61e73a8af0-3e9023a4ad3mr4982964637.39.1793280618265;
        Thu, 29 Oct 2026 06:30:18 -0700 (PDT)
Received: from archlinux ([2409:8a4c:cc3:2931:e1d3:ace0:b5ce:fd44])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdacd6aeb55sm4068530a12.7.2026.10.29.06.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:30:17 -0700 (PDT)
From: Jiandong Qiu <qiujiandong1998@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	dzm91@hust.edu.cn,
	wy@wyuan.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiandong Qiu <qiujiandong1998@gmail.com>
Subject: [PATCH v4 0/2] docs/zh_CN: update translation of doc-guide/sphinx.rst
Date: Thu, 29 Oct 2026 21:29:39 +0800
Message-ID: <cover.1793279600.git.qiujiandong1998@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi all,

It has been quite a while since v3. Thanks to Weijie for the reminder,
and to Dongliang for reviewing the series. Sorry for the long delay
in sending this update.

This series refreshes the translation of doc-guide/sphinx.rst.
Since the updated version refers to process/changes.rst, I also add
the missing zh_CN translation for that file to ensure a consistent
reading experience.

Changes in v3 -> v4:
- add changes.rst to the Chinese process toctree and remove its TODO entry
- sync changes.rst through commit fd5425b67355
  ("docs, resolve_btfids: Document kfunc BTF annotation emission")
- remove Assisted-by tags from both patches
- fix a typo in the sphinx.rst commit message
Changes in v2 -> v3:
- sync changes.rst with the latest commit.
Changes in v1 -> v2:
- drop the separate llvm.rst anchor patch
- remove the `_sphinxdoc_zh` anchor from .../zh_CN/doc-guide/sphinx.rst
- add Assisted-by tags

Link: https://lore.kernel.org/linux-doc/20260619140245.1982921-1-qiujiandong1998@gmail.com/ # v1
Link: https://lore.kernel.org/linux-doc/20260621131215.1303439-1-qiujiandong1998@gmail.com/ # v2
Link: https://lore.kernel.org/linux-doc/20260706151358.2103703-1-qiujiandong1998@gmail.com/ # v3

Jiandong Qiu (2):
  docs/zh_CN: add process/changes.rst translation
  docs/zh_CN: update sphinx.rst translation

 .../translations/zh_CN/doc-guide/sphinx.rst   | 167 ++++--
 .../translations/zh_CN/process/changes.rst    | 528 ++++++++++++++++++
 .../translations/zh_CN/process/index.rst      |   2 +-
 3 files changed, 662 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/process/changes.rst

-- 
Jiandong Qiu <qiujiandong1998@gmail.com>

