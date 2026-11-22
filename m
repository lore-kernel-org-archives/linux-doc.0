Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352233;
	b=tt+Fgw09qvefLbDeOH6XiyH6za4kl2lpL3ZPEVvvfeNMd3bSTIo2Su9RBmj3+AUIKCs7
	 dXhSzFAWEu+PrWSD0CmUaGd22v9YkGHJZhrNdshtXr8WZryQErkkeEeVMQEWk6+5uD2dG
	 2+dRCwfCNNjXsphGT7jKx55kdHDmpWUzXsxEH+i2XLOh6tBqWxTAsF2gLw7snItcS8kif
	 LVts4KPMkAhE2wyj6wCwRnS5zATgwdESJ+QP7ofTYgy2EVyqBs9JfnXfqY2wJ1sX0ywKf
	 cqPqjegUlugaSuWmUDuRICnIUtpOgy6Eg07rJDqX/Jh8JjqlJO00aekBOLjFP/zFFMA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352233;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oynJNxkhV4rieW/iNjYO9Q0IuDidzXIQAA3SXMAJUWc=;
	b=aUi/FL0e3NL0/gfKoHF9ex3r7fiNlO3in64mpYMF53ihMOtfGA7ZNoHaufkfIJ3KKyEP
	 +NJIgIsazh8IB2NNtQNYlnguD5ZzSdF4vKGcEiKhacoSssptfkKH0Mdg40huTv2jeNfWH
	 SSIoDu0ohdoYU97XVkydICYny9wQSf/ZhD0zFpmefcruXA6LKPmkE7Z5e1kVZxqa7aG8I
	 bThPBaFzyM09IgGJIuHo6Vz9KDyQw15YjEhy1UeOh2C7orEjlcRU6OtLhkSmeoF+eRUze
	 L+A4Y5IpJsGrdtgRWwWt81ak1ICtZE3rj6MT1Qn+Qe6LUjPUvI/5OhbJ6TntzUVpHQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OakCdzul;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687B3606A32A
	for <linux-doc@vger.kernel.org>; Sun, 22 Nov 2026 12:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OakCdzul
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352232;
	b=3D/QPDs9YHZEl16rEiUR9rkwtYIj3ab0vW8ge3W368tkOYFpeuh4bJrYVlTaHMeYOnHC
	 sA0b8RHcZa7YTrnoWIwIgFQlYh/54X4gMIy697VRIrck9AyZ9TAm3fLLZpUTwsO3RSl2/
	 0lVv3c+Pd3b3OqCCeym8NvBLP985qJzBFl0cH22Q/BscmJRJTup4h3KmVVT/B1MydYPTL
	 YqqGcaicRQa8NkZWQCZpp8oYg5LoRdu5S6P9BC8xONVaHKhY6t36vmYIXrH/S1ZpkeDeI
	 IP+JxuDp0LGUT4c/hkFEy+9qovUsQ+R5017rZXfNYMUAfTgzVrKR0Apm4D05DZLcCcA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352232;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=oynJNxkhV4rieW/iNjYO9Q0IuDidzXIQAA3SXMAJUWc=;
	b=Z80rhaa8T21bfvCVsLpuqy2Kr2pV1vD4T3kAIM32AZUEJEgIEVk9v11Pl284n5PZwbFl
	 hEI+qxerFfRzKjYH19hPX8tDQF6EbE2nGpwWclKM0MrwheIDRNEBKg5aaGttvT4hh5F63
	 J5nk0ojCRmXONjnp5+VAnCNKJ28gslvKqc6jM6NI2blVhoZoDtHjcXJA1hUO4gLxeAlRZ
	 iTUadPHWXOoubftrr2H95d6buj2k+TJ/niTFq9WVSpcZyUWsUqVr5iHmwKrNcQzVvd4Q7
	 XCT1HnOA7GwZYMSqNuYcjdfnfIT2UDOd7pq0dclr7Z4hEUi/Q7UP3b39rm414N4WqEQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BE4031F000CA;
	Sun, 22 Nov 2026 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795352232;
	bh=oynJNxkhV4rieW/iNjYO9Q0IuDidzXIQAA3SXMAJUWc=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=OakCdzulLvQ2YD8emYuoRFgnHr68mkUtk4bOtPJk9mri2OBJKOotDDo+sv6ZhjVmV
	 vXzLYsA6tWLPGFJl2B0UxCgDdRVP0MWgMMfiZOiPPuq32iABY4xdB5QmUlwuV0SuGM
	 Caw1+EIYCnEP8WcFen1vujsFSKvweKnV/L5JHZLnyCPxClFVz1Zv1ii98nKGzGXGh9
	 SkbAHNcv4kSDkWHZwvzaBJCGS0DrDmnN8446CneXIAsAeSLzJhdB35ZLIKfMe2WNS9
	 f2ZRW9eMDwHO+ANGFH4e+DhFPYv23Y0GJQ3WDQfHjzVRwSPdJFxDatxc4hx5FJJGQq
	 6xn1mcmQkqopw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 1F9844C034;
	Sun, 22 Nov 2026 12:57:07 +0000 (UTC)
From: Eduardo Pereira Cruz via B4 Relay <devnull+dreduardocruz.gmail.com@kernel.org>
Date: Sun, 22 Nov 2026 09:57:07 -0300
Subject: [PATCH] docs/translations/pt_BR: process: clarify patch
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
Message-Id: <20261122-pt-br-5-posting-send2-v1-1-2ec22746ff1e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMMQ6DMAxA0asgz7WETWHoVaoOIXHBHUIUpwgJc
 XdCO77h/x1MsorBo9khy6qmS6ygWwN+dnES1FAN3PJAxIyp4Jixx7RY0TihSQyMPDgKnb+3xA5
 qm7K8dft9n6+/7Tt+xJdrBsdxAk3N4It5AAAA
X-Change-ID: 20261122-pt-br-5-posting-send2-26a1d3c4012a
To: linux-doc@vger.kernel.org
Cc: rdunlap@infradead.org, Eduardo Pereira Cruz <dreduardocruz@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352226; l=1949;
 i=dreduardocruz@gmail.com; s=20261119; h=from:subject:message-id;
 bh=bikcW79H5cLCTDbIzztgDYzwRII64Lwxrqz28jbPmjc=;
 b=pAwGVp8Rf5L8U8DYHVBiuSWLP2RnMLqHvEcYYzurFV9SNpiyZmJP5Ey9uqxjLwL0tyNppKvyy
 CeYU7K18PmlDdbNDyP/zARJYE9/OEY5HCrq9xOVj3d+/qWnidRMsP/D
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


