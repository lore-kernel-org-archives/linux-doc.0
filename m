Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EC42580CE
	for <linux-doc@vger.kernel.org>; Wed,  7 May 2025 21:49:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746654593; cv=none; b=FMIeoHw0rsYqXJObfWz7Z9cx7GY3atk4TTDKjV5ONpDd0oN2zS2A+7sgXnicgcYiNeSbNy0RojXC+gHSF3Uql/UvNX0TTRdfFGtINE3d0RrI8Dz6O8KYvdHR360vTF3p5rKxY2DjnkgxdlT6t4VEgxKq7IXLmjuATicqhZt3YLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746654593; c=relaxed/simple;
	bh=f/xTZ8BJxeNBMZ86V1uElFpd5cDr7++FrMMuSPkUyhY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LKKMJeEGq/2pIhTeHCPXB8cw6ZkIMs1ABn4RsVGuZyexJoT722NNZfDLLWB2Bo48d0Pi6AtExWhwpemV6ZHDau+PDMs9FoYiqXWwcYYBaSQ8JOzUDqqzXfV67O6XNywJGdD5M20RWJL0G5ybMnetvRZ9uv7xU2lYc+WMUy8uGkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=WYILmm/u; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="WYILmm/u"
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-2c2c754af3cso382035fac.3
        for <linux-doc@vger.kernel.org>; Wed, 07 May 2025 14:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1746654590; x=1747259390; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtOqL5v5hGaLj2nSYEbTs7MVaDma8jT2Iux9zNB98wA=;
        b=WYILmm/ulrWDuvRg7mGH0sDMJTqwudXYEx7iA38slj1nHr3LROdGYf9Cu7pXyuD2HH
         KRTx65WwbA0ExJBK+ADGs50so2g0A37+cLpB0kC09+3CC9MymgwmaWP7OO0IKmL4f0sT
         X9pn33qGlpaFIeIab8tSeUfEmYgCc1ahsqCT9RprPqhJQKprOsleCDS6Hm8aBMQ1QwhI
         FGXlKlKxPdLQ06Aun+fkUAzKCOFwaOkD/qTHz1Y5EVojVa0pkd710gGebYLxU+aTxb0r
         eiwQb6yeHrytusErUsXoRKs5iS4rx2zVsmWTsjMpsNzJI/awq/GByTekAYUiByGhbf3L
         EnKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746654590; x=1747259390;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jtOqL5v5hGaLj2nSYEbTs7MVaDma8jT2Iux9zNB98wA=;
        b=uTHJx8ajlZ4T8GlPO6PR6PVDCaNAlHblRG+AZJ2l/hG1YLv3zpHwjjyFkWoAXtFPe/
         L5k/VVptjeVwtqgMKeaGnwv5avEEjAP/eviiGNyO7XN2oMHOWR+Epbw6/1cVkuzoDsmq
         DqiRBSXCitm5pGQx5nHQvjr3nKNtbjy7ZkqS06MqNIyIGfoSNVNx84XE2C4Ovf7d3I1O
         bm58jtl0lbi4sMNSblXe85aHYwvIB4fvS7SpTuWH8rstnozto6n8uA9dHdcmkE7rOdol
         m4BA7wGi8DVAoQz5qN4OpDLcL6uODwu54/Q+PxPknN8ovCmna2kCVxkDNJWXE3WzWUQ4
         VD4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyHQlsz1ub6uZgmIX8ZRbBlsnDOhOek3a74X/Zef4R4OuSWh07cGETjc7AAN9OhvMHahL4/em7L3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+Bp2tmPHGeYKHcJfuhbJrexSKK/SwBlOnMy84+J+clW8I9jIy
	E0Z2eYz3inGTqBU1W1JAi2bZoRr7BEp5GXiExK3o8HDxO3rCZ6J1zUxAmoGJKMaAs8lEsnGNYm1
	AMma9S9GIsVvytayOaxz9Qv5k78st0N8YXeK1qbIzVdmn9lIJ
X-Gm-Gg: ASbGnctAg4ZUJ2a8aTkGcEifphUNKiPU6vbulFCRCL8zhddn7gAOjhq+1qx2SclUq3p
	AUdI+sc+RZ25rIyydY9c7muewQ3Z4X+TwlIWje9kXO58S/6vzCd1RP9Heuonf92/qJHw0GmnHkZ
	p2wmLISBV3NVYb37TLNkakcz2P0T/Lpe/efjPPI0FxSIy+YLTUJDtG9JKJZKZDQddArmSdR0aqe
	6wXHw3ek5jN+SELyCwhMM5XN9NyKLQ+PhPW1Ml+lu3F2eUpyKvPsVYy+gj+RX4ezW+L/BU/gvAb
	ftMEMaE9BJZeQ97qP8QhEq+qUSVp4DM=
X-Google-Smtp-Source: AGHT+IGMnFiY0xyQc6c4BYgqiuOS8Lq+bjP0JIRCUEyTMPXHCZjKDaIlzWCuY20vgwE60gGjQrKqLLEmav5O
X-Received: by 2002:a05:6870:8901:b0:2c2:561c:47e3 with SMTP id 586e51a60fabf-2db814c514cmr694916fac.21.1746654589745;
        Wed, 07 May 2025 14:49:49 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([2620:125:9017:12:36:3:5:0])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-2db5cd9e153sm144323fac.23.2025.05.07.14.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 14:49:49 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 444503406B0;
	Wed,  7 May 2025 15:49:49 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id 38F63E413C6; Wed,  7 May 2025 15:49:49 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Wed, 07 May 2025 15:49:36 -0600
Subject: [PATCH v6 2/8] sbitmap: fix off-by-one when wrapping hint
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-ublk_task_per_io-v6-2-a2a298783c01@purestorage.com>
References: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
In-Reply-To: <20250507-ublk_task_per_io-v6-0-a2a298783c01@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
 Caleb Sander Mateos <csander@purestorage.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Uday Shankar <ushankar@purestorage.com>
X-Mailer: b4 0.14.2

In update_alloc_hint_after_get, we wrap the new hint back to 0 one bit
too early. This breaks round robin tag allocation (BLK_MQ_F_TAG_RR) -
some tags get skipped, so we don't get round robin tags even in the
simple case of single-threaded load on a single hctx. Fix the off-by-one
in the wrapping condition so that round robin tag allocation works
properly.

The same pattern occurs in __sbitmap_get_word, so fix it there too.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
---
 lib/sbitmap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/sbitmap.c b/lib/sbitmap.c
index d3412984170c03dc6600bbe53f130404b765ac5a..aa1cec78b9649f1f3e8ef2d617dd7ee724391a8c 100644
--- a/lib/sbitmap.c
+++ b/lib/sbitmap.c
@@ -51,7 +51,7 @@ static inline void update_alloc_hint_after_get(struct sbitmap *sb,
 	} else if (nr == hint || unlikely(sb->round_robin)) {
 		/* Only update the hint if we used it. */
 		hint = nr + 1;
-		if (hint >= depth - 1)
+		if (hint >= depth)
 			hint = 0;
 		this_cpu_write(*sb->alloc_hint, hint);
 	}
@@ -182,7 +182,7 @@ static int __sbitmap_get_word(unsigned long *word, unsigned long depth,
 			break;
 
 		hint = nr + 1;
-		if (hint >= depth - 1)
+		if (hint >= depth)
 			hint = 0;
 	}
 

-- 
2.34.1

