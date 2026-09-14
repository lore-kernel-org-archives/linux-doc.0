Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091B199EAD
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 20:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789417458; cv=none; b=fv6W5ZBO0zGtF7LjIK9lgt0jeORJsZ6y7GaJ5QumC679xfDIi7N7tuP6kJ8yDE9iyYunioIsCr4taGlRtCjKSLUtbFImzwAXIbso9NFhi7EtnRC9zbniNJRo/0vsqC0D8hWgVjw6r3IQ5VkMPRo53vGfsBzwUGoehEQRqgs/VLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789417458; c=relaxed/simple;
	bh=MMDykQzy7x7p66o0iMs9Sx0TXt7mVPc64bBKVA3boHE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u2ufEZowvjfkKV3gsO8oRjrYr3Q8EMuprVeQv/o7qnzLSYI0Qv2vLHSuua7sIXrNJy64LFqG3Dm6WBsiMR+xEFA2mihSr3vXanTvohvcgU1DrtnttFep19wC+SB+YgAqDhk7U/fFEg+URf5DzTSPs4OsvSEbAzxBfZkBMQ3FhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N2vfOasd; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N2vfOasd"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-79c44f865b8so606142137.1
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:24:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789417455; x=1790022255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=xhH2aqs/S4QiSjkf1OQB4UMLp1ZM1GdERsPNVZcMGG0rs7nMZF7YIeQSNRTo/9s1IZ
         4kuWKMpvzg6uDzA9+pHO6JTJdD+mj5Y08ZvJpCJq1GPjDdZ7J0wOq7VwcAkrVSqlCeWE
         GTVegmR0cztWxG4VwSdAoD+4d2pzQzoOETTwj2JOjUlE531HNa967zkzGVQnCwrEubQz
         WI7wRn7CmI6jmQYZv6Z6PkinaoGcSwHAmw50kiOEOE1rd9uW6uib67+MpPPraehip0Ik
         05FrQALgRZE+hvIAVhA4s8cWbpnepHfARlPEnfQMmg6Zb2fNhf4uMOxjNGFv6mvvX+m8
         8C7w==
X-Forwarded-Encrypted: i=1; AKwUvBymhcw+RLqjP2r6G9rCF+55Bws0fXn2jB62nAvFr9oTtBEKMfWGRJcO72la3iEmZNk9IMm1lDbUApM=@vger.kernel.org
X-Gm-Message-State: AFuF++kyQyUvwi9T2f0gmt5EiSIBLA7+0LrSePKNo3LKFmUb/dJlzyy+
	8W7vZ7vzWe+REItV4RsuV4JpQWbcI7CW5WEnZQvNc9UjUFVj4t2R/Of4YsZ1cZFQkZBCROOS8Ch
	Lxo50R8DyKoy48x1bI9M/6cTtUYC9bWkhQX84JBVZCOhp6YVWrhJnV6f3NVEZgjRKgnWvrq0xH3
	LM5YH5gZG9L4FNfrmZDDdZGv/6ZQrZS5GmRm00jIL8q1jSI4yMiONxakZ1nb6tVvsHnISx7hlWp
	BnAc78SqNNOjujfPQ==
X-Gm-Gg: AYBFou22Ab4EVV9qL44A7FkZzvCNwNB7kgVb4eO0MugUmAtzF4xlnd1wcGMEYR/PjhP
	rxnZJ8I3H0MlCkldYuFtgtJr5My8FkRjzK0i0T/mkvu17JHDhHo+UcfE6AVqTwz8C/UiWfvLZPV
	dgZj3pazZa2nI1eaO8wpEeymgpBdv9aAZhYzPcZjA675UqBTXsXmZ4wsM9Lz4iJaA/hO2Q20gOb
	Ove9rRRN64m80xQvr0Ar9vmNBT+CpDPxhVotYEJ9OZRBvHrkZSrGf6cnRsvwHjt16TvQ9Nli2LJ
	HvKhWy4BGXwf2L7StZw1AGAXdATyJKkvqDZuzMI+s+YT3qtQ/026TVesySmVGUo3EQwdzGYMlIY
	b33J9bmOqbY1XovXPIXRQwXVX3UvCDKWA0CD8qotpTqBaM1KIj5oOr7M7azyqAxFR0BsCtQ60b0
	vtqCFjNmauwpYbMXY53NhsBtxxM9pKNxDAgkO78A==
X-Received: by 2002:a05:6102:390c:b0:786:e7a0:603e with SMTP id ada2fe7eead31-79b58c6f329mr5187802137.7.1789417455270;
        Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-982b9c52a73sm3452641241.4.2026.09.14.13.24.15
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7ec6685adabso4866953a34.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 13:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789417454; x=1790022254; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5am8jY+Eh+kLQoKuHV0GYjrdnQEpm2u3B816c/P3fZI=;
        b=N2vfOasd4ydiiXseUAyfMvu+f2SOD+azwX8jQMco300eQf3Gqz2YWgHVTnft5iE/ib
         Y3DGvARLnLXKkfhf0GigdijG61I1/Y5RxQ/rNOuT/9owto0Cg+FBftqSURHGFqd8Kddp
         Y0oOHyR4dDfV78GLVcDrkLdgOk3VFC/KEVX38=
X-Forwarded-Encrypted: i=1; AKwUvBwvW/J+7P5nJ0oWG2AbYZJxTKQ+6gzEdFk6LXsOwNNfdDJ1AsRATHnz7cmkcQaqAIdAQ38pA9lnqRQ=@vger.kernel.org
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393517eaf.17.1789417454592;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
X-Received: by 2002:a05:6820:1899:b0:6b1:9f9d:79f3 with SMTP id 006d021491bc7-6c53fd76a77mr2393506eaf.17.1789417454184;
        Mon, 14 Sep 2026 13:24:14 -0700 (PDT)
Received: from lvn-dbc2489.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df8699bc6sm11623741fac.3.2026.09.14.13.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:24:13 -0700 (PDT)
From: Rishi Chhibber <rishi.chhibber@broadcom.com>
To: gregkh@linuxfoundation.org,
	arnd@arndb.de
Cc: bryan-bt.tan@broadcom.com,
	vishnu.dasa@broadcom.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	shuah@kernel.org,
	rdunlap@infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ajay.kaher@broadcom.com,
	alexey.makhalov@broadcom.com,
	vamsi-krishna.brahmajosyula@broadcom.com,
	yin.ding@broadcom.com,
	tapas.kundu@broadcom.com,
	Rishi Chhibber <rishi.chhibber@broadcom.com>
Subject: [PATCH v3 1/4] misc: vmw_vmci: Reserve a datagram resource id for zero-copy buffer sharing
Date: Mon, 14 Sep 2026 13:22:06 -0700
Message-ID: <137107b03a5e76ec39a0a7f453db892044ccb108.1789413109.git.rishi.chhibber@broadcom.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1789413109.git.rishi.chhibber@broadcom.com>
References: <cover.1789413109.git.rishi.chhibber@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Summary of changes:
- Add VMCI_VMWZC_DST_RID to the reserved hypervisor datagram resource id
  enum and bump VMCI_RESOURCE_MAX accordingly

The hypervisor-side zero-copy buffer sharing service occupies its own
resource id in the hypervisor datagram namespace. Reserve a name for it
alongside the existing entries rather than leaving callers to open-code the
number, following the procedure described in that enum's own comment: the
set of resource ids available in the hypervisor is fixed and statically
known, and a new caller extends it by incrementing the maximum.

VMCI_RESOURCE_MAX has no in-tree users, so the bump does not affect
existing code. The new entry likewise has no in-tree user until the
vmw_zerocopy driver, added later in this series, references it.

Signed-off-by: Rishi Chhibber <rishi.chhibber@broadcom.com>
Reviewed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Reviewed-by: Vishnu Dasa <vishnu.dasa@broadcom.com>
---
 include/linux/vmw_vmci_defs.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/vmw_vmci_defs.h b/include/linux/vmw_vmci_defs.h
index 60c9eacd2cf3..4435d2ff1241 100644
--- a/include/linux/vmw_vmci_defs.h
+++ b/include/linux/vmw_vmci_defs.h
@@ -179,7 +179,8 @@ enum {
 	VMCI_UNITY_PBRPC_REGISTER = 14,
 	VMCI_RPC_PRIVILEGED = 15,
 	VMCI_RPC_UNPRIVILEGED = 16,
-	VMCI_RESOURCE_MAX = 17,
+	VMCI_VMWZC_DST_RID = 17,
+	VMCI_RESOURCE_MAX = 18,
 };
 
 /*
-- 
2.52.0

