Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795363725;
	b=t6ZoP+IcJDfk5KlFs1M4sdzLnR2Ktuj8K17YQ037hBR+O7HeY+ZatOPSegg95bV1yfRj
	 rXp1Y43mUEHrZwAJU5WyDZsV2lHJszlGdxKOXjEP9K33m1sICB+V9PvrJoWrnRZpuIgwM
	 WDofeVkfnVSXAUleQF0XLekAFJpYFpxSBAqj6kDLE5tRjeauqr7qswXkuhMEipw0OJFUh
	 lJkkUkrUREhXbzZ05RT5R8Q9GTaznLpUt47f+01ZECrdg14m8yS9wZjjDytXWScGktHle
	 3brkq7K9dHl2KqL7BKyB1X/ohk0LbVTaaMMUgOpNIXDlZDm2HtUxd0o6SVfYCN6Zz7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795363725;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=yDmT6XxWDMUjkhdEybx94MPWZ0+puuiXDhd8ArveZHA=;
	b=bGq8QPgjyRjaEHEcge4V8xga065MONSEofP3I8Z/kJQOlH2TD4kar4FJVn64pN0Vwnsh
	 TTTEBzzhI/9qmc7wERlkQOxW6dvtV8rbPoaYnAtkm5Z80ahTmXK6KZmt797niRazxKqW8
	 TtPqlDTmP3Nh1MIsC4zdDd1ELoaOwzxBnaBrmf7CI10hZJ+FdmkAEU6lYL9FwGNk5XcQ+
	 nhxTkUs4EI/XLeTMEYjv6hK4KTqbRrX+443NeGeu14/svN7QDDRmtocjUf7FdSZ6OTE8i
	 w/mn0tCHScbC4RPn5k3Z0UfqSu0gSYj9PcyZKqlzEYqtlr5A/XSeBlgy3LhI6QMm96g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtDalOcA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F835606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 16:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RtDalOcA
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795363725;
	b=P2lE2TVCALfGR+XuJS4BYRLe8+ypNzf9kM4bT4nGaviJ7phr8DIHKlBhgkThUioGVnNi
	 DVbOt56dpVxVAQvs0lKERpGX6mo3XfORmXbijfPPyUOPHUV2H93gJX86Sz9bOhi/1E4/p
	 45q7iFakk0IaNGH4BgxA3Hif9s03ZIUOGFgKrhWOApGBPvdVkcXaV4h+sE7Jh+eOFoplL
	 Uu0hLq44AjrBLEWAZf51jJx3yXUCUGkDknIaMnJR1C1ab3c/gP+fCzKs/JAaKlr0hbWBB
	 jNbHTblWYDVPvqwEOfBrOKRExvbMWRwdEy9WD3Ei/FPJcVHulTpQ7i9M59YT+NtPj2A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795363725;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=yDmT6XxWDMUjkhdEybx94MPWZ0+puuiXDhd8ArveZHA=;
	b=K58A4jUGJ9gwo7eNAqUzaCvfGq1MKAEXQuUTuU+Pd03TzVLMo48Sy//uNLgiusbPz5Le
	 zCO5/iNC92QKuenHrv/egmf5dd2xRp3DEqjocH2mu+e5SK1cASDPmbIh17t75SCjUGwe/
	 RJkHoWMy6iRnSWPhgrDBjMlXpW9ufaAOgpDbHuI9nM6oaK3fcEfPKHvMhLay2Pyo/Vnit
	 S/y1LWqUETOXk3Do+KU+8xz0QeIRkFULYFQm7xxqdEhxd9dNpg03YdMczB3emp9fRQOiL
	 bV2HcFkF0RGuMAAZc7yC/jGMiQfSft+SKoXlvxOjjDbJ/fmAPLgHryDYeGYWFQVEztg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E3C471F000C6;
	Sun, 22 Nov 2026 16:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795363725;
	bh=yDmT6XxWDMUjkhdEybx94MPWZ0+puuiXDhd8ArveZHA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=RtDalOcA943MJ92ZsX1Fh9HKsR5My8QBpFpaIbBMeJWAeyzQDh5ZkI9TiZL2JC7jK
	 vx5pdlOtJ3trDN8DFgKJfoBW1kJErvNH4yWbioC1dbWwNpNNUHgrhEZKBVEbiUvE1T
	 712ecCQf9QrXOGzIZ1RcxA3mUSpcYnrPIDK+7+TV9WGwUWPzdGbU+MZIyhM4B8hpk9
	 xamQ8I1dTr8h1OF5heEdNSKaspxBl5WVEngsov2qebfvPjkHz7lTIpA0c6JQEsGIsI
	 anh8f9TEikxj7mCRq3UuopwfDq3zPUla+4Q+NT4hQ/S9crLY3NeuV2OhNOaz2fICyh
	 H6padNiVjZS5g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 42DA24C11B;
	Sun, 22 Nov 2026 16:08:43 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Subject: [PATCH 0/4] docs/translations/pt_BR: process: add
 maintainer-pgp-guide.rst
Date: Sun, 22 Nov 2026 13:08:42 -0300
Message-Id: <20261122-maintainer-pgp-guide-pt-br-v1-0-01ce5941c5c2@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBBA0auUWTtgRiLVqxQXbTJJRzANk7QIp
 Xc36uIv3ubvUFiFC9y7HZQ3KbKkBnPqwM1jiozim4HOdDWGCF+jpNpixRwzxlU8Y644KTqyfbB
 8uwRvoQ2ycpD3bz48/i7r9GRXv0c4jg9plUbxfgAAAA==
X-Change-ID: 20261122-maintainer-pgp-guide-pt-br-c258f5e93fd5
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, corbet@lwn.net, skhan@linuxfoundation.org, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795363722; l=1429;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=JWQmIYmfYJWRTGYphpFzeIt5K+J+wEyD0NkQ7BIRMx8=;
 b=2uWxE7kBkuWoDcp1ct0swv99sMsPb52QNPYtS4l9S57EnjS1bAQiqPeSE3B+jMT6p7O5MmT3Z
 lKQITyBTW9vAcA+aqC+ALkRrPXn1POj+fmYRQWcAU37A6uP3IwCf/4h
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com

This series adds the Brazilian Portuguese translation of
Documentation/process/maintainer-pgp-guide.rst, the guide that describes
how kernel maintainers should protect their PGP keys and use them to sign
tags, commits and patches.

The translation follows the English original as last changed by commit
fdd100ee60a0 ("docs: process: use gender-neutral pronouns") and keeps the
structure intact: all 41 section headings, the 20 cross-reference labels,
the note and warning directives, the 112 inline code spans and every gpg
command and key listing are preserved verbatim.

It is split in four parts by chapter so the review stays tractable. The
patches only add the translated file; nothing else changes.

---
Eduardo Pereira Cruz (4):
      docs/translations/pt_BR: process: add maintainer-pgp-guide.rst (1/4)
      docs/translations/pt_BR: process: add maintainer-pgp-guide.rst (2/4)
      docs/translations/pt_BR: process: add maintainer-pgp-guide.rst (3/4)
      docs/translations/pt_BR: process: add maintainer-pgp-guide.rst (4/4)

 Documentation/translations/pt_BR/process/index.rst |   1 +
 .../pt_BR/process/maintainer-pgp-guide.rst         | 922 +++++++++++++++++++++
 2 files changed, 923 insertions(+)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-maintainer-pgp-guide-pt-br-c258f5e93fd5

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


