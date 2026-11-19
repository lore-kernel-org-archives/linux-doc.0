Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795061557;
	b=cNZCGMo3sHl3JGPS7f0eQKdNwFQPjcrB3hpij2zNg9pdIUmpN+9DmSi+ERtU2ai3YACD
	 jZ/1tXztqW2PWCF6G842+AKt7CC531tXPLLNvwH6zXYUpk5CVU7iOzTSSs+Nrrq+CS7J5
	 dt5kleJWc+/ICATBAjWtv10P9BhtX9BwtgwN6iAtlKvBJqpyJM58E5FOy+gMgnNzW26s7
	 OSGICTlqu/oft+LKgYMT+iJhPeUAV4q14K+l9feJNyeaFoujAaof7QRIpcjPOqFQOXa+n
	 QlWsxgDwss1et4ymMb1zf0iAC+Scg8EvmAVO3EF+5+slaf5NCkkLHHlMWD+mcl/zivQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795061557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
	b=L+bFG/TNdyu4VHaFkenQLH/vPHmy+DQELuT0NNiLcnmNwSamBU+9daenQkc0da/hiC/T
	 DlweGrIKqIK+u1qBOXP2/EvG9J5nzRDgdMb3RA2WXfZFpg7wXdN0OQmLIKnAQ0EwLOBP6
	 N5Frd/SwX8v0WMz3UBACK3sgYB0pnbtEiq31vTCmjgfq6d0Vw9q6rznArKRICKFjyCYXY
	 yNzaldlP14o3+8TVUifWrMCIzxqpoAbLDVRLjEgKTCWAkro1aRvV8XcJ82SWcYX+FY7OK
	 d9LtgcBgfu0B7x0eY70HFTA69ELuzloibDU44pKtv6ENzmXbQmjQ7pu5L54HkcvgVAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q372Zxnf;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57BB60A2608
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 04:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A57BB60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q372Zxnf
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-38190551625so3138014eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 20:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795061556; x=1795666356; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
        b=Q372Zxnfz9G3qwHtYJGkKfs/bWWacgMHKyYW6x6kH+YqKC1cIKtCqEM+EZMmOA7/xs
         EYEKMT3XmMTypOqAPVY9RrQCiahsnEleXPrs/Rt7jNLfabgJaZlBDeZzwsURaEliHFl/
         NmZBqc/csrcS/1gAZvOa53QRyxawb7my9RuMy1soq0TLgv2kmLVakkiCuSXI9cf0fH11
         WLxE2npv0o4MP12kJ8tclmCGtEjQ1AI39k8/dnm0j/GgmFFDjPKGdkuIR5xfuqlUL6YH
         WSrJBi6s2geVprzxxbUK2Ij7kEViJSGfOVpq1GRi9cDkBAcFgguPdLUTeF9a+AKSmfkb
         Y4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795061556; x=1795666356;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ThQIZ/0Cdw7/Fte0QHHM+pd7xnF8SH/AfbXD3VLonjw=;
        b=v8RQk8XW69HF9mu/PaJO98L6QO2EfwVSc3FNufS4hXhaT3L3vSJOd3BOWsdxSuM+u3
         eKJGTF9l/MOAhs35Iapf1Za52n5lM4wxscdQyoylZhxIecrUi0vFs4wB+dDRbgFPzUt/
         1qSY8jm78tGyzvnL003oE5xOXXR1fkSK3jL4R3V7WbSajMpaw7qRdzLwxZ4pyHnHrFTw
         E4mPXpVuRNFLX1tSeFzezImB4BiKGYwYHF2aU0go7zLukiXiXK0QjiZU6pyK4UORBWQ3
         nRUPa3sQZ8bqs7p9Gt0lhIHh6BhRIUM/q9+CXB67Hn67vr4/NGOwC1SbQeBKM/v9VKB9
         qdGQ==
X-Forwarded-Encrypted: i=1; AL+hErEFa+U8JqNY24enSk/FEBdhH9GzxN07yChh0Tpmgsnq/b+zcjsKuScDn54h/KxleeJyC77+BLr0pk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XWlZuEakBwpYfmxTv1qgjmZLu4eje7h8rlgs4zdoB6ZgXQmPk
	zl/Nga4ZSi6SoAO5h5dpI+GguCtqhOJ3bTR741ixduDdh4INH0UjbQV0
X-Gm-Gg: AZFdTZfOMkdN3XwGiSkLwrKome+SovDVtc8fI+KRR5N0u7N+uyKYI/dviLgdzKFbpDI
	+7sYBrl/iG0R/rdOUVRJVGPuCbZOnhs13hgxr2Tj0EbeHzy3sbSexBEqsFXGYLhuVJuClsJpmQy
	GNTdmOkQ2UcTFGfbzMwqXmhTevygke9ZfJXXW9DsKhP7r+C9KMXEW2p4/CsIVV5KvorMwUPSHsW
	nJ8FIzhRF7Hjr90U7MBZYEBOE4pgNQl36Vm+WTDAITTg3Ftv47coQQl7f+oTgdJ543j1CGc1JRg
	xXQMAXXBIuwf2yPI63BDEHJ7wZa2ci13+H8mKFeaTl/5FSiizQLAamyV94djgjkXoWx90A5ogjm
	RfuDfoVPnsho1cm4KwBpdaN1j6fPmx7zDe3cbxNznZDORSU5ofMUtwouz1jVnDbZ9HRPS2bOPbN
	p4pxdc+IbULSQFov/kMFiXTlMV5cNL5e9mscX8PGB25OiW4viWulNaSJWhgqf6V9DDaRQMceEk/
	clyygGsNrH0FNyUfeAJX94SsP6nm+t1QCNRPKdafCeSyuxzm5PAUg/zN7ytDvQZJ88DaxEHe8e/
	EmO41h3lUXhRWr3irgUQFRnxhyr9tSGtdsmFmBXey2t15y915mptdt1g2b6/6jWJIo8MzPAQAkN
	a6Qz9a6p1LskTu2SxxznbGoX5ZdWhoFzjZjMrUH8M1ToXalJIxtcfbImFlxmn+n18xumSxO5+CT
	Dbkj528xT5/g==
X-Received: by 2002:a05:7301:52cd:b0:375:2470:c754 with SMTP id 5a478bee46e88-3827f98f338mr4353099eec.12.1795061555646;
        Wed, 18 Nov 2026 20:12:35 -0800 (PST)
Received: from Daniel ([187.15.85.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a80bc19bsm12779716eec.29.2026.11.18.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:12:35 -0800 (PST)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Chen-Yu Yeh <chenyou910331@gmail.com>,
	Weijie Yuan <wy@wyuan.org>,
	Federico Vaga <federico.vaga@vaga.pv.it>,
	Akira Yokosawa <akiyks@gmail.com>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v3 0/2] docs: add a guide for translators
Date: Thu, 19 Nov 2026 01:10:07 -0300
Message-ID: <20261119041009.63651-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The documentation has seven translations, but the English documentation
has no guide on how to contribute to them; the only one that exists,
Documentation/translations/zh_CN/how-to.rst, is in Chinese and covers
zh_CN only.

Patch 1 adds Documentation/doc-guide/translations.rst, a guide that
covers the whole workflow of a translation.

Patch 2 translates the guide into Brazilian Portuguese.

Both patches were checked with a full "make htmldocs" build, with no
new warnings, and with scripts/checkpatch.pl --strict.

Changes in v3:
- State the path-mirroring rule explicitly, and exempt documents that
  exist only in a translation, such as a glossary or a language-specific
  how-to (Chen-Yu, Dongliang, Weijie).
- Make ":Original:" optional, needed only when the path does not mirror
  the original, and drop it from the header example (Jani, Weijie,
  Dongliang).
- Drop the sections that duplicated Documentation/doc-guide/sphinx.rst
  and Documentation/process/submitting-patches.rst, keeping only the
  points specific to translations, and link to those documents instead
  (Federico, Jon).
- Encourage translators to send a fix for the English original when
  they find a problem in it while translating (Jon).
- Mention b4 as an alternative for preparing and sending a patch series
  (Weijie).
- Carry Carlos Bilbao's Acked-by on the cover of v2 over to both
  patches, even though patch 1 changed significantly; please shout if
  you would rather re-review it.
- Cc Jani Nikula directly, since v3 follows his suggestion.
- Drop avadhut.naik@amd.com from the recipients; the address bounced
  twice on v2.

v2: https://lore.kernel.org/linux-doc/20261015125644.12908-1-danielmaraboo@gmail.com/
v1: https://lore.kernel.org/linux-doc/20261013003702.5824-1-danielmaraboo@gmail.com/

Daniel Pereira (2):
  docs: doc-guide: add a guide for translators
  docs: pt_BR: translate doc-guide/translations.rst

 Documentation/doc-guide/index.rst             |   1 +
 Documentation/doc-guide/translations.rst      | 652 +++++++++++++++++
 Documentation/translations/index.rst          |   3 +
 .../translations/pt_BR/doc-guide/index.rst    |  19 +
 .../pt_BR/doc-guide/translations.rst          | 666 ++++++++++++++++++
 Documentation/translations/pt_BR/index.rst    |  11 +
 6 files changed, 1352 insertions(+)
 create mode 100644 Documentation/doc-guide/translations.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/index.rst
 create mode 100644 Documentation/translations/pt_BR/doc-guide/translations.rst

-- 
2.56.1

