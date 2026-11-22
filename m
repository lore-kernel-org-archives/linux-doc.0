Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352914;
	b=LNVTG74XtHMbKGweaLoXehPB7etJQFCRN993YOGljVc/69cRqhFqAD/2SqgkKzjpkAV2
	 G6OxRYYYELMzdB0vc9eyzTkUmJCyPRTkdZoGfHmRbjVYwzMjkaXG654pC5vsr7q9k3xAy
	 6LgJ8zzwPP47LSdZT8E6U3wTvhsDIiv5Ix1d6ceT5Sym3bNufMrbVjZ8XcUbZF93KH7tp
	 Xx9YdDmilD5WtF83dLnCHxyAR/9F7oc1RYjReU7o8yyOLRcx7Fe8GJ7LPwRENJ3W3R4bU
	 UrHcnoSy6OQVizNv+P2PzE7k8mpcY5D6m5khRtaaJX4nB5uYVZaqTrIUnNj36t66I3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352914;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=izpvEBCF+pCd1bC0tJiM3VE7Lp8ETfBtwNMYMgcE2vM=;
	b=wbiORTdTiGL4RgL4AuR1Spz+Uhi2WoreLPdXBwKDPFv3t/vMmpevQWSyUKr1ihKtYgy9
	 QWtPFBQzzZrqgchnfTLIypxynHhOnCLOuh8c+AqtdTdreJhDqbW7w4kIbt3QLWEblkxAq
	 koNGUcJlcGZAj0dhr+Zdg3DWCVkZYEnoo/MCtU1Kjy+2rJ1kVdpA8/TjHMutpzDeqrBQE
	 rK/WZf0jM4vDixJutBx1e77ulk89bhHaLS4vKqyfSugtv8uwL8GbXs/JpMPfcJ7Td7FJ/
	 TPJCIVujYAwXDpjmRcqcY7FAWklvNL10Z3MFaJvC0Iw8yKYdxqcd522O7t2t2j0+aIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guEIiycI;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79AD1606A320
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 13:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=guEIiycI
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352914;
	b=tHHrYodv48xZXt4zU1dBuISSPjBOFgYGAe/va9QwRPBb11DFekQntU65fsy82MhakBeY
	 vzM/hwJKsH/EhphUPzI3dAqiZo0FGy8aBp1FHZnDUveVlgAWQNdX1sorM3xELbkDUmKAi
	 wS7RtzhRhiRiD3GDWxTlUKtfC4x2D3gOSqS4tW/Tc1+oMnZDfTIPhYRwdhG0ZXCPytN9+
	 XnQsm7SEJngWqGNy9/Wum48ZgRsUQTMkbSF+UyboBYb95NOQMyoN+OzWepOyhV5DqhVG1
	 U1HFwIk0E4oigJGV+qzExGBw89s0ik29FxArkU/2+aCbfX+VcpCjpBBKSHGz/zpVmAw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352914;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=izpvEBCF+pCd1bC0tJiM3VE7Lp8ETfBtwNMYMgcE2vM=;
	b=WC4zXWZGymFKjIzvy7NNnbuKpWFQEkUr5spFN+INWrSGhe+TQI2rRCM+NHbBNvIYtWIQ
	 mzuW+6yU1ODmGeKssEuzEdinV4glGNPEvw5z0GKKe8Iz2n/frkbjjqfqWqCN3IxmyxU3T
	 C76P9TtrbU5i/sRUuTO0RNMY4WvMfG0FYVveHWhahai9vR538dXKdCb44QYso2kEHDlE/
	 LwRx1X4TA15OhfzJmCPdK55BWUQOTq8IN6auMNUFhN/4cG7CHSrkJvOEgbmVGA9BGxiGZ
	 zvOT20HxOL/hJbSPd8uCdoNogWmJmZl0yZBNqm2SB4Hib6/rtFMv2U9PgCW2N2wV+rg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2BDA91F000C4;
	Sun, 22 Nov 2026 13:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795352914;
	bh=izpvEBCF+pCd1bC0tJiM3VE7Lp8ETfBtwNMYMgcE2vM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=guEIiycIZTwYoxc8Mrj3F77NN5gFdkNiu+ukRPKOnYf9t8LeKouoYiyrRHkXbSXs3
	 iet8NOZYRpQTlbiUXCHYPoexfq3iW3yz90gXFB2jmEhjdcosrbdxkQSu9SQ8bQwVS2
	 w0aJ5cSprx23MCashtlbHuM5SYUWPIYk57y+WXhixvmYX4yXfoFWs6nj9jFN6zwLm8
	 bQ9nTwTZ1Hz/mQg3kVWyL8Ttux1go7ztQTOTFSwh2GwYCNicWyjAXuxyDBQC19Ok1r
	 B2cQwoh3FPtxITKgcaoZ9gp+MCI+PC8njvOIdi1tuezwMipmvbrflx2C/p2SQFAuWK
	 JmWVT3lYasBIg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4904B4C034;
	Sun, 22 Nov 2026 13:08:30 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 10:08:30 -0300
Subject: [PATCH v2] docs/translations/pt_BR: process: clarify patch
 granularity
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
Message-Id: <20261122-pt-br-5-posting-send2-v2-1-2a5cf9f667c3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNQQ6CMBBFr0Jm7RhmRExceQ/DopQBxkhL2ko0h
 LsLeACXL3n//RmiBJUI12yGIJNG9W4FPmRge+M6QW1WBs65JGLGMWEd8Iyjj0ldh1Fcw8iloeZ
 ki5zYwLodg7T63rv36sfxVT/Epi22Gb3G5MNnP55o8/59TISELJb5UpRtS3LrBqPPo/UDVMuyf
 AHQ4sf3zAAAAA==
X-Change-ID: 20261122-pt-br-5-posting-send2-26a1d3c4012a
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, danielmaraboo@gmail.com, 
 rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352909; l=2178;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=c58uGNc4Z4NMrxaT4PtvM3u4XHZh5Uh6h+ehiwoSUzU=;
 b=CJ4jstM6DDpQYeuN00WhD8yTMimx+wkWIFsSr9WgajOCOJFYSXY4AeyYJd/tuoXdfBr11wWQE
 yYLX5n3XEZfDGG0t/rE8yYmmFgvTKw9vOM6Z2lwY4Lwsy6RYB1EPJit
X-Developer-Key: i=dreduardocruz@gmail.com; a=ed25519;
 pk=2dtL+BL/x70sROmAvlskv9dbjj274zlPkLBVu4gJJiA=
X-Endpoint-Received: by B4 Relay for dreduardocruz@gmail.com/20261119 with
 auth_id=1571
X-Original-From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
Reply-To: dreduardocruz@gmail.com
Content-Transfer-Encoding: 8bit

From: Eduardo Pereira Cruz <dreduardocruz@gmail.com>

Reword the guidance about patch granularity in 5.Posting.rst so that it
reads naturally in Brazilian Portuguese and keeps the original meaning:
a single patch may be reasonably large as long as it still contains one
logical change.

Replace the reference to the developer's popularity with a neutral
phrasing, avoiding the gendered expression used before.

No functional change; documentation only.

Signed-off-by: Eduardo Pereira Cruz <dreduardocruz@gmail.com>
---
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://patch.msgid.link/20261122-pt-br-5-posting-send2-v1-1-2ec22746ff1e@gmail.com
---
 Documentation/translations/pt_BR/process/5.Posting.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/translations/pt_BR/process/5.Posting.rst b/Documentation/translations/pt_BR/process/5.Posting.rst
index 2ac7e5557805..4e14405bae06 100644
--- a/Documentation/translations/pt_BR/process/5.Posting.rst
+++ b/Documentation/translations/pt_BR/process/5.Posting.rst
@@ -118,10 +118,10 @@ que podem ajudar consideravelmente:
    problemas.
 
  - No entanto, não exagere. Certa vez, um desenvolvedor enviou um conjunto de
-   edições em um único arquivo como 500 patches separados — um ato que não o
-   tornou a pessoa mais popular na lista de discussão do kernel. Um único patch
-   pode ser razoavelmente grande, desde que ainda contenha uma única alteração
-   *lógica*.
+   edições em um único arquivo como 500 patches separados — um ato que não
+   tornou essa pessoa a mais popular na lista de discussão do kernel. Um único
+   patch pode ser razoavelmente grande, desde que ainda contenha uma única
+   alteração *lógica*.
 
  - Pode ser tentador adicionar toda uma nova infraestrutura com uma série de
    patches, mas deixar essa infraestrutura sem uso até que o patch final da série

---
base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
change-id: 20261122-pt-br-5-posting-send2-26a1d3c4012a

Best regards,
--  
Eduardo Pereira Cruz <dreduardocruz@gmail.com>


