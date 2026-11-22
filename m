Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795354346;
	b=3EJS6xJuSARVxEPUowlohdoWLdSnLDh9Lkakw4uF8xWNXJowiiHb30rLUYv6SikkJN/Q
	 wmklda8VvH05goYJSYNcgJQw5e+GdsPSua+/8njIPsSPvy6RL4Ds3oAsqTtgINGrR1JzK
	 e9lYlpUCzm7b9TMsqLvfD0qGlrJHEqTj19gXSkTdUR3tSOlvXaYqzYCm5sjLveCSZ1Rzw
	 IBJQ64UAr2c5shaGTb/x9qhptu25yiYHUdCiowSlP9IUrf3A5Pm/HWJ2ldOWZpjbuGoLf
	 PLsbJTWW+0H+Cs2bOxXpQppSMLQWzaYJBWQl2cWx4MJklkejCKm2ip7JXBvadt0+Kaw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795354346;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=IQYaTxa4WOG7E12kNFkZ/mkSXKOwoW/C3V1bg243Yh8=;
	b=DowHvWgy9fycsGjhbyYjuQoVJ86+0qdpLQvUZjCpXkADK7uGAWTaC3m0p0NbVtzKKvTI
	 oePlZza17spsPrZlwXZ75TGZUyJrZgr+4mxzuDlnBu0kyT6Ppq9Ckf11U8XxOBn7PALlv
	 2Rm7iyFktmLjC4t15w4KBvuZWfRnvjMl2gQR80JcWJ7DjFOYXXjjwcAeiad8OzF2TwdIp
	 wLycOXqKBF/NyOsIaMl4esBsyttf3NFrzJ4aWXtr3OUkzIJHlnWNLVVtn4aV39Oh6XraM
	 pepGYLhgL7PS0Z4pBI6Qp0jY5fXrSxGy3cGpGJ6hApYDLCVp/dR5UEbia6eYLckKXdw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8CoSdHL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188BA606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C8CoSdHL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354345;
	b=XiXhmrVitav1sSdm3j5N9Rz2noWBrsAykw/1I2O6VC3sLsxf+4Kmf2I+YG5xRxBPAwh2
	 cWdke6GqAy3RMQC3z8Xoho/KhIIRJqk/fWCwShdmOzWjZvwUWuE34Vm1cAUsrm7wi48Yk
	 0VPfpIMdxAan4m4JL7s/6W9JJ5F4eNW/67iBvNGLcQ3jUlKAs8iG80oxrH5lxJNSt85rI
	 4NPMD9wNODilg0nrtYW0p/UxWoW8TGXcFzbxWbfdeArdVLvvfsUChkBYEDon64OSi9+ZZ
	 o5vQkxG84NLMxnqjFe0RMct0qqQgrk497H4txF9CWpvEcuQ6J+k4p6JTmfikHQc9bIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354345;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=IQYaTxa4WOG7E12kNFkZ/mkSXKOwoW/C3V1bg243Yh8=;
	b=wWokPnGXVFHFCaSiv2GwMy2K3NLhFOBeMLYrO8bw50gX9NwWSR4yhW98p+BarvbfiezE
	 KVU3wXwXqG32VHD2BKSwTB9wiq0V2kcZCMvRlOMnR9ZFkB4Qewq+qCcKV3wJEvTsBEtGk
	 LSPCFXGGV08emycpAJeADrbgw0rR3Dh+LXHqofxujvb7m4np+UsnXvIB5HozU8ppDEIgI
	 /7B73YByeVFluxHGCFiBf+hTuaSe09FwVwvcy5OrTIv8uy41S8mquwbpdLbLL8xUgJoXe
	 BIvdHoZKRRNoPlzhaFMnvE65id7ivOXg61C8KlTGsRpqPzoTJHyma+JFKXvnCyACNcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E20F51F000C6;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354345;
	bh=IQYaTxa4WOG7E12kNFkZ/mkSXKOwoW/C3V1bg243Yh8=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=C8CoSdHLmObotiXmGt7V37S5+NXXMUTRWzcK/e57EH5/APWhhVKFhhJSyoFPWt4v7
	 QGvna1LrbMmVPc81aCecB/Um3fCwi/RPX6DT+/xlcVv4sOvu7/mpnMJS7NJENYsyXX
	 oRpMJHVMlIV1Ry98rHXGYUZbohpbT+sWadnhSmR0yXIGdZRBCT5ABiqxBf05kDvesB
	 YtpNWEN9vnpZzUTXg4XDl2ozY5IvBXDHFvMT3qcYP9ES+ry4UoiIY1NkwmQ+uTdNtL
	 dZrzSB33EoCgbKs4ttF6STOP9JMVURaBMHCupgcx0chZDlf2awbHo/OazkwwCGEbfl
	 JAEo2rB+BOcfA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F9D54C08B;
	Sun, 22 Nov 2026 13:32:15 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Subject: [PATCH v2 0/3] docs/translations/pt_BR: process: add
 handling-regressions.rst
Date: Sun, 22 Nov 2026 10:32:14 -0300
Message-Id: <20261122-handling-regressions-v2-0-2557db5ab946@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqEMAxFryJZT6ENKDpXGVxoG2tk6EiiIoh3t
 zrL9/nvHaAkTArv4gChjZV/KQO+CvBjlyIZDpkBLVbOIZo8hi+naISikN5/NU3purK33tY2QFZ
 noYH3J/tp/6xrP5Ff7hac5wWGlHGReAAAAA==
X-Change-ID: 20261122-handling-regressions-951a5b0c080d
To: linux-doc@vger.kernel.org
Cc: Eduardo Pereira Cruz <dreduardocruz@gmail.com>, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, corbet@lwn.net, danielmaraboo@gmail.com
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354334; l=1676;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=y8odRTxkZ1PHw5d/Qd6sZ8r8xIKCChf09gHxL27hi28=;
 b=PwCpBRXpXLndfzKEotswdUqwoF+gYQv9wtVNyGNDcFHMyOBH0KVsgTwqz6rKescmCdkNdaD0V
 Vo6m3LbN1glDWGgJOAsfPtbJd6MqmuDVMaCyMbyX0aTcgiEs3BxHG8R
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com

This series adds the Brazilian Portuguese translation of
Documentation/process/handling-regressions.rst, the document that
describes what the "no regressions" rule means in practice for
developers.

The translation follows the original file as last changed by commit
fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and keeps
its structure: section levels, literal blocks, URLs, :ref: roles and the
regzbot commands are preserved verbatim.

It is split in three parts to keep the review tractable. The last patch
also wires the new document into the pt_BR process index.

Changes in v2:
- Use "mantenedor" and "tag", matching the rest of the pt_BR tree.
- Keep the term "flag day" instead of inventing a translation.
- Fix two headings that were merged with, or split across, their
  underline, which broke the section hierarchy.
- Reflow paragraphs as a whole instead of line by line, removing the
  orphan fragments introduced by the first version.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
Eduardo Pereira Cruz (3):
      docs/translations/pt_BR: process: add handling-regressions.rst (1/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (2/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (3/3)

 .../pt_BR/process/handling-regressions.rst         | 1176 ++++++++++++++++++++
 Documentation/translations/pt_BR/process/index.rst |    1 +
 2 files changed, 1177 insertions(+)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-handling-regressions-951a5b0c080d

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


