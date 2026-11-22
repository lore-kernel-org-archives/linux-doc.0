Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795356092;
	b=XL5lOe+aPms5Mjuzvh+oWTGKwWqTltGvEVhvTXlBxFWxeGj0FHK8YC4IkzPL8PqkeL83
	 v+D/eRh4RuwDZQofWdmdoHQCgi7hpdvYdL5ma/J4hc44JkbhuNn/P499+2X4q61v6gvJk
	 Tba5c/N6YlS/WXVLDvjIEluchm3rmdLX4fxdj/XW++cQAw2Yt+wygZVYZWD3GD3gvpZs5
	 HY04WZv73f/q0tqjSHnom/fnyz4bE+km4gUvFy39d9enYmhbIbz3gscm5BHlu0h5UOaYO
	 2UqivK75K5DNypRGTMQ0vfm+zOkwsRtNMy6cMqEwZ5GrkLUlBp5iJ3Fg6B3zJwZF7OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795356092;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=eIcHEVvzW4cB/FaFVqRo+G3fbS5VCOT94KwesOV7ZjI=;
	b=Hlr9en2hziE5lPDlDvFMUF4TtfTvCx/8nTylLpZ7rFDUmAuxi4nR4ch/IQLSBD0dcd1A
	 h1b7dx8ie2DC5+a3+xDuntc0GYaaeX+Xy0x9mSBLORZEzCfhNPs6jUzlxE9Gf4UZhSR4H
	 P31LgARvvcDJQEtlJGO7XXtZFgJvpnYkb7DL/g+BVSMKfdUO9C4WlRW7wHx0S4quZ8gLb
	 e7PpVf8f27+7gS1rSZvkR0ql3AibOwwg6TBDUY1hsScvw/eFiZveo9+itHpB8PuHJ4Unb
	 OdzVIp/6UnJhn8netXCZXCiiCjTS0vs45hjbC7rO8OViAMXnRhVMm2q/lZu4DjiDrWg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADBRkGcd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A5DF606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ADBRkGcd
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795356091;
	b=NCa8uCPXAeKMggrxJBsqWOi51CgH1aOlY47eVY0ScGyqPSPANBqmfldHf/qXO/HdDOHL
	 iZ2PScdJhx6dNAeS1auIbqTDfwwjFS6QAMKGcDQNynUHvW82vXj22A/JPtpR6VRn4YJkx
	 HHFzh1p5bWvtO5JH2Hie76g4UmEn/9nWFn+MbD/n14NQiarANW3eJbd14fkHOW2Dv9NDk
	 UYs9PjD21+tVpRP8dzoKV2BqdWN4rjyFKKc9vHHN5IvMsalFFPCmeRlfo78p2gnYffkDH
	 qWcvh4AqoaB1S4boxLhbkmY6CCkpJS/Yl5ppprIZ6gpuFuAd9sY+LUKY0qPkXtr/6vw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795356091;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=eIcHEVvzW4cB/FaFVqRo+G3fbS5VCOT94KwesOV7ZjI=;
	b=06WRGd2r98UIEf2XGjMkisr6Rr+lvB6r0AtGrwizencNzmxTeN07pbWOcgBOivpqw9qt
	 1lwELK+3EczHZ3oEAFcvjTY3kHEPl938xgpLh0U12sRNqo8sg+cUBIPRH+yOkSC/abt4u
	 s2p/7H40aAGsTkCmzKHID2dOMsqFmsytwDSzCVwTjZCLed+GcA5Ez5gpRrQu/iQqDL0Se
	 66G+AovcEMQUEl9II472NlZJK634/qNorru+wf4sgMouRr24ZirOHvXBEk20a6K2uekt1
	 fkueeht/v8J+E1cJP28B4so5XejXDnvHKRMFvcrFvpeBqmGRAGh9KTk7aPGrrxwWWcA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 72C6D1F000C6;
	Sun, 22 Nov 2026 14:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795356091;
	bh=eIcHEVvzW4cB/FaFVqRo+G3fbS5VCOT94KwesOV7ZjI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=ADBRkGcdVFvpJUqSGIUQiq2ykP7G7w3Vx365PGVssdPpcTEo7bSBeTjSW3LWCLhoE
	 m+tp48mlMNfUG6IRCrlYhJvWmVweNeuSWYEJ+Lf/fsPgQnShii4E81/QZVomPqaHa/
	 XzXm1ui2jI076OJvFaovG2Av677o8kwFdWaWBDt99yUmnYHWmbeAsK53+vOWtmGAjg
	 0tjlFRtXXL4knjryHOqpdXr8mX/UJiyw2E1N2PC/tc1xdcQbzbSNEBtblYvr1wlcZI
	 g7cDgJdJRTJz/sOhQBquzqZN50aZrkk3Uw7bVLB57rFBwcuAi8C+8xLcs73wEsUu5b
	 ZGVUaLUk6bSuQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C81214C0D4;
	Sun, 22 Nov 2026 14:01:26 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Subject: [PATCH v4 0/3] docs/translations/pt_BR: process: add
 handling-regressions.rst
Date: Sun, 22 Nov 2026 11:01:25 -0300
Message-Id: <20261122-handling-regressions-v4-0-b6b9f2070290@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Nyw7CIBBFf6VhLYZOSy2u/A/jgsdIMX0YqETT9
 N+FunGnyzO5c85CAnqHgRyLhXiMLrhpTFDvCqI7OVqkziQmwKApSwCajqZ3o6UerceQ94EKXkq
 umGYtMyS93j1e3XPTni8fDg91Qz1nV150LsyTf23dCHn3IxGBMgqcH4ziUom6OdlBun6vp4HkR
 Kz+kVRJgpXhKEULom6/Jeu6vgG0JapWDwEAAA==
X-Change-ID: 20261122-handling-regressions-951a5b0c080d
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, danielmaraboo@gmail.com, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795356085; l=2059;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=piaR4pVX3njhKNRnfIxX/CMHnLB9/5ah13wj0salF4k=;
 b=KkXmyDkEZE0g/JHmRWS6jzCcLUuaCVAJ9XnBVNR5+xVsVO+vM9n9+pWtpha2+JglcJCrneGgD
 RHyXuhBP8aXBex+Hb3xsZoWo3RqlagiwHbz1LdsTwdrxfyykuKVC3cH
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

Changes in v4:
- Join the section titles that were still split over two lines and give
  them a matching underline; one title had also lost its underline.
- Rejoin the two #regzbot command lines whose URL had been moved to the
  following line, which made the command unusable.
- Use a single "::" before literal blocks instead of ":::".

Changes in v3:
- Split the SPDX header back into two comment lines; the previous
  version merged them into one, which breaks the directive.
- Keep each section title on a single line with a matching underline.
- Replace the remaining "etiqueta" and "maintainer" occurrences with
  "tag" and "mantenedor", and use "flag day" consistently.
- Fix wording issues found on review: "nem sequer compila", "versão
  mainline ... de fato" instead of "adequada", and the AppArmor
  sentence.
- Keep proper nouns such as "Maintainers Summit 2024".

---
Eduardo Pereira Cruz (3):
      docs/translations/pt_BR: process: add handling-regressions.rst (1/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (2/3)
      docs/translations/pt_BR: process: add handling-regressions.rst (3/3)

 .../pt_BR/process/handling-regressions.rst         | 1136 ++++++++++++++++++++
 1 file changed, 1136 insertions(+)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-handling-regressions-951a5b0c080d

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


