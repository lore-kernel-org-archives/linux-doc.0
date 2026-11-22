Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795355181;
	b=0GY2MRc3cX7Y0Ualk2YSOLPQLrnkTyJmhGRXzHI+MUiHCdM8MIMCJhFN7FrKXMRxS+3+
	 aSudoUpT8wt70yi/meAPchF0RZVeN54uDQrfPksK+VuZfjiQ3gkZ6A7l4tfO75GBzFEuf
	 Pf1HhvVIUadR/ng329BuHd7vOgYy3um6xft4l+r215XIZs1h2e1oc0pGiy2ibHsoYxbj7
	 qOoCCdzD0v8uoAuplHwpKY9UUZtqN7RVbWI3j6s68Ptv630OO3gPC5gUKMDjSxZaoGjc/
	 nDifnRlAp8oaE3CsJQvPzcx+OMt5zE3ivf9fbgVfjeo2h1UdwQgvIJSAknrAFlNYzJw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795355181;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=6XrPWr7Q4sYpQ4mKws9jBCrbBDg64pxTRwgzJuCrNsA=;
	b=3KXqIgJU9gUNVC7Rl3RDtmswP4+o+/M+Ow1U+9+BUqmDxYME10vSalzj57/I+Z+DBoLx
	 QqBjmmLNGyI4rFm+DxiapE6cNGdbSN+5t6Si0teSl+vFWRW0gibdgcSWDI0vDMrsb9rcH
	 EX3K9nOJlPQoDpidkezF9CtmmRwXAGXWofQnrkOb8PPczDjL+WiAkRek3daxulVIe07x5
	 Qeztp/IV2MFstgQRKsrWAWwgEGBf8ebqQw2IGQP+h/Rn98Ev4aDWKG2CVYgDfxUksgqd8
	 x6t9Wr8UWmoHR0SwxWjRr9FKaK2kn0La3GLKkguK6OQn4wwvWGil0N8Z1keOphPvJlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVBpl1tI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19334606A330
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVBpl1tI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795355180;
	b=v+UGraRT600X/NzjpXxIF40KU79woa+uAir9FJ6tUB0fOHD1T7PE/Ya+qAaRiz30WBsO
	 6TMt1pMIfIa1BRkTLuz3IcLD82tJM8QAOFRVtedC4Zt7Aog5NRK63KdiKSgB1uHQbxomq
	 d6uG46VCfoZu53lR/peVb19cCbEALgFfWJagy1dLrc79Y9p1gM9hyeeFcuSPLs2mi0TWs
	 Gn3xQue58m2VBABwRWlMGKNTZxPfHryObDL6zycFF8jEbmp2DqvJC2Xe2Iw+7w8CjN1th
	 Q6zfsDekKGMC4r+kP/ocqAageSR9M6qKkfRxxIz2BmLOqRnVdurC5oC4Vx9WlvVkoiA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795355180;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=6XrPWr7Q4sYpQ4mKws9jBCrbBDg64pxTRwgzJuCrNsA=;
	b=M2DwljozTgDK8oUTYNzPhUqrSKoZOpnNVwsyQ1T8fxdHsOOqJL4fPTSLt6rtVdtWxGpZ
	 fTN8gR4SYoapwWVuNgFB12kge7jdTZldpdq/baLbbfFLQKx2re3gsRbQdNU1jDngKNj7n
	 HZopKInecPxPNWb6JOxQ2XB2/PkKN0OqPTNbJNqqYNucYkSMdjzlJejLeQtGcY+6vb+b5
	 YeJH2vZkk1ZlQ/CTEbUoB6C+l+cKoShVmyX0SKwNSb0LdFQSy6G80a6fbCee/0C+OCkFI
	 V5cgesjGIOIo+gxI0d6vI7fZ81+m0V8vApK6NyljEko6ReK/wvDmGbJo5pqmRr9ctVQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2C3D51F000CF;
	Sun, 22 Nov 2026 13:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795355180;
	bh=6XrPWr7Q4sYpQ4mKws9jBCrbBDg64pxTRwgzJuCrNsA=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=nVBpl1tIhnNo34gM67VvuawobCsMWwl5sMgqnqxBeKZ2+4WbbET19/oCBtJjGaD1z
	 MM10XVO5Aj+OP4FagU0p1lgFXhNHtvE8utYG6WssvC8Ubjv+OEeu/20KddnRtvm/fs
	 k/0rF/whR6RKGHdimUJfNICkMf4Db+TDvlB0mRQLOr/Ey5Vh4NhgNCdvVW+/q5foyh
	 2kzWmbB9NY41z5Lsdv5vvOmku97nLXPqGMKDXuQbTcles30xQroxkGmB/nDYZUe2so
	 zUxAh7BYF+BKAjEQYweO4L+Iu5r22mjOI+YoOsA84TcIq2p4tYUbMKM5AnV04ppbQK
	 2xz4YgxqY/T+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 86AE14C0C4;
	Sun, 22 Nov 2026 13:46:16 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Subject: [PATCH v3 0/3] docs/translations/pt_BR: process: add
 handling-regressions.rst
Date: Sun, 22 Nov 2026 10:46:15 -0300
Message-Id: <20261122-handling-regressions-v3-0-e3d5ea982948@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSQ7CMBAEvxLNGSPH4EA48Q+Ug5fBGZQFeUIEi
 vJ37PAAjtWq7l6AMRIyXIoFIs7ENA4JDrsCXGuGgIJ8YlBSVWWplEih72gIImKIyNlnUevSaCu
 dPEsPqfqMeKf3Nntrfswv+0A35a1stMTTGD/b76yy9+diVkIKpfXJW21sfayuoTfU7d3YQ7Ou6
 xf16i3pygAAAA==
X-Change-ID: 20261122-handling-regressions-951a5b0c080d
To: linux-doc@vger.kernel.org
Cc: danielmaraboo@gmail.com, corbet@lwn.net, rdunlap@infradead.org, 
 skhan@linuxfoundation.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795355175; l=1713;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=YpcH7Wuz8zhltadGzwQ/DeWsce5nuoJ8zr3aAt5Mu30=;
 b=zfOkLdl+4V5WlR8Am5RhJj7/+7Q0jQPRQSDXZJfVQ1MjqtcU6gx/J7q1YzX4ItGFk9yp8dYcL
 18eWJy328ajBOnK1Vw/JGjaXxuRqEZyDqIEC4rV3AG4go/V+owhrnA9
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

 .../pt_BR/process/handling-regressions.rst         | 1141 ++++++++++++++++++++
 1 file changed, 1141 insertions(+)
---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-handling-regressions-951a5b0c080d

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


