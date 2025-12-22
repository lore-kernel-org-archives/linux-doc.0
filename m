Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E763161B8
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 08:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766391724; cv=none; b=EL5tMvXZh8FOstRYMg/2W0in82xfpcCEQQvO6vZ2tZhvwpFm6Xp8Zdx3REBitHDdOauTWiMM+dO82dbFmtIsxnSBS4y1qlgQ1DqPYfs5i7vfs9s1LPCIAdgNrMV3pMUPD3Jee2WCTtm+CdmUU1p4d7UEBq4cJNLiba5UvDbyUpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766391724; c=relaxed/simple;
	bh=EqxGeITc2UKYaMAzZMDYQfg02UCHl3X6FUpCJ4R9urE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfIXwiJJWd3z/SaSRmdCQ85LZQiu9lWOFj2oZ0d4/b7vQfhCyzeyA1D/iNDduy//iGexb8k7RmGufUu/Gc5IrjwT9qFVMPigtTW6s0gvbnWGm5gqdIkKzLo7i1tfHb3LUiQbQyqM7+4y1zZ8ffVaoHSVNXPcv5jQbjycEARVpxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJXpRmsj; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJXpRmsj"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7fc0c1d45a4so3369621b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 00:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766391721; x=1766996521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=eJXpRmsjLS3VyGb8byupvVr5yTocjvkDkbcR3XuO6rdwDL7aCCy0Hg4jHwQOjjgmJ6
         oWJ15u6kkZhZUdF3NyqIqTAa6BVl5RYexz5XbXRbemf6AZqctZD2x5aosKb44UpMSXJM
         xZ/sYgWGEQjd9nRs9VJJ8X+jnsEhoSBzgE80MXKDCfOPvvfKhJGskO+m/I6hYmqpvrMx
         GLBuDeR2oJqueRHPKUoA+13rfESg7uvJ/sL958TEmv0nSijITW1TYTvQRXJB98WKAod/
         UBBucn1bWWIxxYIlUms7Aj5/jVlmeF0iL4i82SPWK0SssLsBVU/hzxZwqJ4/OVPjVFu2
         ADow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766391721; x=1766996521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dFfaj1jg7DkAQbZ2xQqGZ0nerYqYJ2u1eC/UX4LEwiY=;
        b=d1NnYdMGeDFjRJuRW1O4iXnfOscQ3n+YNIovfOYaxk7BABz2gdduasAQWrdRdij4/y
         ClpIdBpoaC7GaNXTcnekXDT4Vskb5RkKsERoCIsiBR0dkVLEDaMgrX91PJOailn2JKZG
         otwpOpszUc57BOpSrQH8rYxp6BRam2IBPhUYvPwI4Xfp9HfuQGrZE4Q8yY8yS15GMNZM
         7rIM2qDwZlmFD+UNnKSTuu/wrRZGv9q7AfeU0q/jBEBrrGtZXZ6gEBa+6+yz56WtpeVv
         SXFQE09R06V3cdAxKDnjQlHDZS5KHwYr59q31aL0r7b/oEsrEaWYDgqkqplvQmX8vXAi
         asgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaMe4k4/EjnHBQz2q1bwMYfmkmoEDQCveeXQF3B6R3gfTadmFikE3/PZ/hLOwbCAX4Q68voeVX6Bk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3tpoJIAQZ2WI6jDFvuRRGSZHt6HBuabdEVRc+Y1GkhU5G/yF0
	5vOJDmuoT1gcUcz4fvrHGcfdjgaXjGViWQutyI5hIdEaY6rYUFQFnlD/
X-Gm-Gg: AY/fxX7V9AK4wcuCywDlZwut2cCuBs0danpBW8VlGypb6RMavIg4lwEwPGnQQK3QQQ+
	5Q+AnmeB6mV+kr409LqC2z7LTiFooN8mx+AirahasAb+xCgQN8JQ7of2Rqf0DY0ILmGCGuSd5k8
	SCmQy2r/E+Yrmyvj61Lse8bHDkGEm+baeS0Qb40yJx+/RTwsDlEhG65+Og/ERZC0h6sGBbf/vc0
	mThO1LNt5e28hF/0qx2b5yqddJ1foPvGMqe1DvbASFhY4ioghIGdLP7DyuuMWtbfiJISlNhPsE5
	mDSECJXBbMQZ2TRMh9aMX1LD8Cov0ATAHkSjoUaoHbWmxakJ3Z/wELSk8nHxf3DouPmaFj5gdZ7
	ZWfLlNmPxOssxnsLpZXKSkl0S42XI01MtWvGlYecNdJi4JF68uEnr5L21QinbWWUSMsaUxGfuXf
	4XOhpsQw60
X-Google-Smtp-Source: AGHT+IG3eUuB5Tb1s+Zs70IjrZagHo/mf8fIHvmKfCB1AS8Rh4HCdjBPUwGbrg6oNBn8UN6DCsv0tQ==
X-Received: by 2002:a05:6a00:3e2a:b0:7ff:9657:d6c8 with SMTP id d2e1a72fcca58-7ff9657d93bmr10043630b3a.27.1766391721087;
        Mon, 22 Dec 2025 00:22:01 -0800 (PST)
Received: from frodo ([2404:4400:417e:3d00:8b90:7f55:1261:772f])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7e493123sm9540699b3a.50.2025.12.22.00.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 00:22:00 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org,
	jbaron@akamai.com,
	gregkh@linuxfoundation.org,
	ukaszb@chromium.org,
	louis.chauvet@bootlin.com
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	intel-gvt-dev@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	daniel.vetter@ffwll.ch,
	tvrtko.ursulin@linux.intel.com,
	jani.nikula@intel.com,
	ville.syrjala@linux.intel.com,
	seanpaul@chromium.org,
	robdclark@gmail.com,
	groeck@google.com,
	yanivt@google.com,
	bleung@google.com,
	quic_saipraka@quicinc.com,
	will@kernel.org,
	catalin.marinas@arm.com,
	quic_psodagud@quicinc.com,
	maz@kernel.org,
	arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	mingo@redhat.com,
	jim.cromie@gmail.com,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 04/31] docs/dyndbg: explain flags parse 1st
Date: Mon, 22 Dec 2025 21:20:21 +1300
Message-ID: <20251222082049.1782440-5-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251222082049.1782440-3-jim.cromie@gmail.com>
References: <20251222082049.1782440-3-jim.cromie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When writing queries to >control, flags are parsed 1st, since they are
the only required field, and they require specific compositions.  So
if the flags draw an error (on those specifics), then keyword errors
aren't reported.  This can be mildly confusing/annoying, so explain it
instead.

cc: linux-doc@vger.kernel.org
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 .../admin-guide/dynamic-debug-howto.rst         | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/dynamic-debug-howto.rst b/Documentation/admin-guide/dynamic-debug-howto.rst
index 4ac18c0a1d95..e76ccd987704 100644
--- a/Documentation/admin-guide/dynamic-debug-howto.rst
+++ b/Documentation/admin-guide/dynamic-debug-howto.rst
@@ -109,10 +109,19 @@ The match-spec's select *prdbgs* from the catalog, upon which to apply
 the flags-spec, all constraints are ANDed together.  An absent keyword
 is the same as keyword "*".
 
-
-A match specification is a keyword, which selects the attribute of
-the callsite to be compared, and a value to compare against.  Possible
-keywords are:::
+Note that since the match-spec can be empty, the flags are checked 1st,
+then the pairs of keyword and value.  Flag errs will hide keyword errs::
+
+  bash-5.2# ddcmd mod bar +foo
+  dyndbg: read 13 bytes from userspace
+  dyndbg: query 0: "mod bar +foo" mod:*
+  dyndbg: unknown flag 'o'
+  dyndbg: flags parse failed
+  dyndbg: processed 1 queries, with 0 matches, 1 errs
+
+So a match-spec is a keyword, which selects the attribute of the
+callsite to be compared, and a value to compare against.  Possible
+keywords are::
 
   match-spec ::= 'func' string |
 		 'file' string |
-- 
2.52.0

