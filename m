Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793789644;
	b=fGc5LBrSXsbNvKAoToJn7N4QiW4GLBccqK04vLR9K273he8K+2NV82hJurjBS5yQNGmk
	 agbY2y/6sUjMoZesLm28lXS9EictCKFHNvbY9jWsIyDN0vagpqn/3SzyfWVG0aNkuhJX2
	 mLGMuT2WuKfQlHb+q+s8VM/JQqqb565FN77+eG0bD0XtL/9i2L/Tkb24lEgZaA6/0IwB3
	 zTn3mNEmGtKdTgHTPsyKQS57Y0llqWK/ajOFP+DNFMrWtOSwu9owXSNpCGmaJ1qKwl107
	 jicRcWNOljgOKF97Lf1a1ErW6ztoyB+8S9ezTjcuYaWiSRzAOyH3mMLDNTm60BdmVAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793789644;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=mr6TqXgtbsRpH7YcJhsJ3zQQdGBC5zTXONlOxYcraG8=;
	b=QhaBRQ8x1M2fsBv4z1hvsJWEKne15cU/S5hNVdqag8Hqss9SB4y8zm0qvXsSYxGkKqCu
	 vmNMZPAHdCutnLdbMWs8remFcfWeJnpugHw6HDK0z12rlNl30sHfr18GfhD1YgQtnUUL1
	 5I4Z7KpiagVCfpQcGq95sZsbOiYf8wiqrjH9Se1siAadeKgNz8lpewcKCghUfMs01OyhP
	 n+QarbziiPFJumNa/At9hgLqcKnXHNWHqycjpco0NLTI8c80dLrKgnhW0I64XVEEp5Cgc
	 /GDcwZGZoUPs1j+XOxq0nViBRCUOuDEV8PWCgGEYKeg7rH7MFAgT0bKFH7e4S1A3wnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ayTtI8zu;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E279606A32F
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 10:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E279606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ayTtI8zu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793789643;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mr6TqXgtbsRpH7YcJhsJ3zQQdGBC5zTXONlOxYcraG8=;
	b=ayTtI8zuxpP12qFX9wjfGdXYEY0gZVyPlXjVjiK5J2VwaBt5DEJWJ2NPxYrTy/jIVPHJ2O
	cnQ6DfVAw7B+E0LsDgkcKBm3VW/0s/p3ILAhw/2n29TC/SKr7VNL9GEgltapMUAGsEH3xJ
	lefujBtO2llqs3itHWI956CVwg65Jm0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-679-6F5HHHkzOV2WTNhpUocNng-1; Wed,
 04 Nov 2026 05:53:58 -0500
X-MC-Unique: 6F5HHHkzOV2WTNhpUocNng-1
X-Mimecast-MFC-AGG-ID: 6F5HHHkzOV2WTNhpUocNng_1793789636
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8FB7819560B1;
	Wed,  4 Nov 2026 10:53:56 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.48.42])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6005930000E8;
	Wed,  4 Nov 2026 10:53:54 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/crypto: Add a sentence about zeroizing raw key structures
Date: Wed,  4 Nov 2026 11:53:52 +0100
Message-ID: <20261104105352.135540-1-thuth@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Let's make it clear that raw key material has to be zeroized, too.

Suggested-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Suggested here:
 https://lore.kernel.org/linux-crypto/20260930201434.GA61218@google.com/

 Documentation/crypto/libcrypto-zeroization.rst | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/crypto/libcrypto-zeroization.rst b/Documentation/crypto/libcrypto-zeroization.rst
index 76b6506711634..fe9f94413d1f2 100644
--- a/Documentation/crypto/libcrypto-zeroization.rst
+++ b/Documentation/crypto/libcrypto-zeroization.rst
@@ -47,7 +47,9 @@ The following types of structures hold sensitive material and should be
 zeroized after use:
 
 - **Key structures** (e.g. ``struct aes_key``, ``struct hmac_sha256_key``):
-  contain expanded round keys or prepared key material.
+  contain expanded round keys or prepared key material. Note: Arrays and
+  structures that contain raw key material (e.g. raw AES keys) of course
+  need to be zeroized as well as soon as the data is not required anymore.
 
 - **HMAC/MAC context structures** (e.g. ``struct hmac_sha256_ctx``,
   ``struct aes_cmac_ctx``): contain inner and outer hash states derived from
-- 
2.56.0

