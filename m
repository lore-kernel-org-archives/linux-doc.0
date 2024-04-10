Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 702F115B0F4
	for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 12:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712751615; cv=none; b=Rmnz/0uHADoTlcTg//BDDGRBrJgTrwgqd9qo/9Qpr4OfwfD1RfD4RXbYq8wLgstMQiyCO6bNTlEjSsrkyMq+veeVcB3FBdR8xWSfzANP4zKTXa3PCOyogF7XqmQNEnk7SDlSvExDWYqMlSEm/H5MZx2qCR8bskKy4a92PQwHtLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712751615; c=relaxed/simple;
	bh=WSpt8xkQ7FZzxGK2ztd6X59nvbk86bjDxsC7WRIdaw0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rLzg/1HOqlg5OieQ3XV2AeVHtLuDYvwrHmYWjt5S9GXYogRiKUCZjKJp9Q9aAJNYCRwlJDp3lMlBt/eNXbfboAJiCsSmjG7ku736yOeVlvwkW0yQjbiM0cOm8xWs+RmDIneiI5Ilp9KLbxo7kJQuhSKQDyWo0T4B/d5EL2XRuG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RK+hBT71; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RK+hBT71"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712751612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cJwZCdGn/12kQ3EbOPpSAbOJTYEctOWbdv/HkZkwxS0=;
	b=RK+hBT71G2gr1qQ3mjumZIGVvesheQHA38/uV9DQHNwh5sOp00rUlz9LzmKfg1DG4YgrLC
	oMmch/RKyNDQV26V1Kk7mQeDWXubUqrVIoqBZce6UHINqjFPgVPRV4aMRJJ1dqGmvs4C4H
	Vl/i3Z6W4NZ8wNXLygI75e8rcmzFsFM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-668-ghu7MdpcPrOm5DlWalk-ag-1; Wed, 10 Apr 2024 08:20:11 -0400
X-MC-Unique: ghu7MdpcPrOm5DlWalk-ag-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-343da0a889dso4306823f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 10 Apr 2024 05:20:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712751609; x=1713356409;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cJwZCdGn/12kQ3EbOPpSAbOJTYEctOWbdv/HkZkwxS0=;
        b=dfeBkbBfyEgSEh36yL4sQ6rHZIKkl+yWMhgPBP39lMXfQAM/yGSy8e+KhvGNet1Rzg
         gHZup4adtl9pgjC6kFxDMQcBHK0J1eT2ThudKc35f89OX353XgIgMrLGniFsgUUdcd4m
         usxAH8Ts3Nhak5c8zANCuVMMAZGEUNaULMGFPSBWGAHm0whAmaNLuzSgLW+cE8yrC+4D
         7z2NCL3ial1FOkHpylzWnU1GKvd46yPytool35tf0uv4iRi7HLBtkzKoJ9jea5Wazm77
         4S3o55M5VDfVpy/JA1y9x7vsvs/JlmcnVjCwYUDao1dsVO3SPQLxYADNXq2yNl4Ag39i
         b6Jw==
X-Forwarded-Encrypted: i=1; AJvYcCVEdL0jVv4m3BA2OzatyYkEV4drvAZFiEDczrWnbTYkoFOClKWPerrrs0JmbTh2xdrrxt4GwOZqsIZWACALxy3v3cA0q0X3nr+O
X-Gm-Message-State: AOJu0Ywn/I7MbHO3/IaIn7zzRbkkEySDIUJZ+6hJoyO+/PXUo+El0T7M
	MCoJynrIA2wn/JJ2qsABvFBJYP+FYp7doDo4chXGqfsqUMICpykHP5a1bH4jkCkK+RxiuLdJsh7
	EGWKPvIlHX5XxVj5LH7tmmo27ogX1MTbvPel//BwIRkGjtfWWl3BsJfZnXUDos5qqHw==
X-Received: by 2002:adf:e7c6:0:b0:343:96b2:c121 with SMTP id e6-20020adfe7c6000000b0034396b2c121mr1792551wrn.63.1712751609495;
        Wed, 10 Apr 2024 05:20:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGaEsfMBRsLWsO8CaeP+0eZlxRSkArpY8F3KRxzPp8gsPyxbWZ3n+PeTBB4gyznMOHXT2ieZQ==
X-Received: by 2002:adf:e7c6:0:b0:343:96b2:c121 with SMTP id e6-20020adfe7c6000000b0034396b2c121mr1792531wrn.63.1712751609137;
        Wed, 10 Apr 2024 05:20:09 -0700 (PDT)
Received: from toolbox.fritz.box ([2001:9e8:89a5:e800:aa3c:ae70:b589:bfe8])
        by smtp.gmail.com with ESMTPSA id m12-20020a056000180c00b00341de3abb0esm13678098wrh.20.2024.04.10.05.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 05:20:08 -0700 (PDT)
From: Sebastian Wick <sebastian.wick@redhat.com>
To: dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PATCH v2] drm: Document requirements for driver-specific KMS props in new drivers
Date: Wed, 10 Apr 2024 14:20:06 +0200
Message-ID: <20240410122008.38207-1-sebastian.wick@redhat.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


When extending support for a driver-specific KMS property to additional
drivers, we should apply all the requirements for new properties and
make sure the semantics are the same and documented.

v2: devs of the driver which introduced property shall help and ack

Signed-off-by: Sebastian Wick <sebastian.wick@redhat.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 Documentation/gpu/drm-kms.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 13d3627d8bc0..b98b98359c90 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -496,6 +496,13 @@ addition to the one mentioned above:
 
 * An IGT test must be submitted where reasonable.
 
+For historical reasons, non-standard, driver-specific properties exist. If a KMS
+driver wants to add support for one of those properties, the requirements for
+new properties apply where possible. Additionally, the documented behavior must
+match the de facto semantics of the existing property to ensure compatibility.
+Developers of the driver that first added the property should help with those
+tasks and must ACK the documented behavior if possible.
+
 Property Types and Blob Property Support
 ----------------------------------------
 
-- 
2.44.0

