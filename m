Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5553F328D
	for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 08:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906986; cv=none; b=B7blWfJT57cU3DQ8kEcglooGy+uMtPJ5Cx1fgTkqA80znTsslPmEJbJQUojMxeMo6a0v82jV5UZz1tsKkr7nS/zEX93y9hQDAFxKKbKUqLbPi9OLLJPdysCt1/mnIJxKOe8lxdXneXnIqkmv9YgnHUmHc0a1OQL9hlgIboyxmb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906986; c=relaxed/simple;
	bh=hWltHfXGF6tM0pJn0+dwTACm7KNrwHA6EQNSK8fnngg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fe7sX8sbVbijWu3rEglyScmkAFbrHF0WqH3m3J1Wy1aWc3+Y00/bhj+GbL/lunMed3O6wifbZgJF79SzI8Qs5JcO3n+MJe5XIhRvDnD0swhlXkZip2mlpNaSSxMXSO/n+19SY4aVZDBwtyD2ZHN6a2VhCKSVanpSx5baMvsbqME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ2x9Onp; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ2x9Onp"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cc1d57602e8so595681a12.3
        for <linux-doc@vger.kernel.org>; Fri, 28 Aug 2026 01:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906979; x=1788511779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=lQ2x9OnpqRZqbI8RdP+g0NJWARSK2K0kIaSW62gdaQDTkHhnMbO07juJJphSIUUyn8
         vUXTMdm3qJ6yVHbiSbVt8OGC8tXZUG3dqHQPO50uamZq6TOw830dBMs0GUvBx3B/rViW
         Ap8GZa35iDWlAMafzjF1XEoYfiSiFs3yAdldakUL7wOR9D49s3dOlJpD0jWfQQXgCLxC
         L/ds4ZeU27w3DkTCUhCCgW1hOHS1BMVlvbBBZmqxwRZwQfPnfj4T1O95RRtZVRnUF3/w
         w4mwTC7EvBnrs6vIeXy02xJJgVZbGW4CPZP2tO3YqSuK12hF9PtiYtqAiq1yixgD9xsa
         Iymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906979; x=1788511779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=Nejd4+gEdZd6bn97yaAATHQ7FuR+1HaIzFdEvmmix7IXqmho4vmhaJvBLND5a1Eye3
         jguxkILv79zpiezWsrziVUNmOmivRKcAZHH4FBg+CQQX72PKhElId1IvwQzIFdqcnp9L
         7RTfF18b6J5x7nPRdXqgU6xlaTZT+YIZR4+pdSGBW1+vngz9oFeOVAtC8aan1L7xNWNC
         kqICnFbYVMtjW8X2PBb9qPcP3fphrgAotCSs4KXVi1ErMphhJQfgsWy+UszSk+v759be
         Po5nQVqpHz+q4bxrjqSJv/PGm5sYZDAnPa8OD1Szmk1Ue0AoTnq9uKRTx9LwA49G2wJm
         jrqA==
X-Forwarded-Encrypted: i=1; AHgh+RpfW5lyO1mTUiDQ6gaE/yQe/B2ymv9qOSFZr/wlBOBID8ZbbT62rHmK6gOu2OMvkxhRX4mz1d2BcEI=@vger.kernel.org
X-Gm-Message-State: AFuF++kHxkRETD/jWnGG9F3icXR4dOltlvhcFyluI6uB8jtrF3sLdLdm
	nK7m4IYZJkA7Q00DqFvX9tyHnr6/rdY7jAbQKf9+GGLHR5GX8Cb5EfqG
X-Gm-Gg: AR+sD13t0E38KXIrhaMjcd6L2X635ITWj32fAN6HaxuTyjOy0vhpNIO3laQAtquulKH
	KD6/1+Hn0h/SFCqUgFDnG4til883Jj2d38ByeoTGCU/TnwhZekUJT7qpk0nfaDpzEFrUTgi8fL9
	cG64Lp5DXLdOiMNnwcm0YEGS9g0UV3y6yAHIEO1xJic30bpmprgtULQEg32352ZeM10FrBTUNkc
	6lh3QX+NIpaXnJbIhMmG+WdEt1vUoXQgt78y8ZnGVxkkpjL2LQd7Ka98gjE6roNTrLoKTCHUB/C
	DT58xzIGrNeg1hlIosdEbcBWSfk9aMWyhRNgmLNUMEx9hAst1jbt+3Z4CbT/f/6bgMNkF5w1042
	2+iiqSZsdOs1rr7Gn0dFX7RYmc/8wQO+PHBEKI0ewFi2HniDrw9p/QpCGT8+XMLfRBOojRxJ5qD
	1gKQf+ks57qh/gOQb/38IqWbpkshijUS0V2OVeao0FNiVH0XM6f9W6Mtvv/z75pxyhhVnebg==
X-Received: by 2002:a05:6a20:db0a:b0:3cd:9f0b:f788 with SMTP id adf61e73a8af0-3d267b656d6mr11291974637.12.1787906979500;
        Fri, 28 Aug 2026 01:49:39 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:a97:707e:a14f:cfbf:3e23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-328713b0451sm3801546eec.16.2026.08.28.01.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:49:38 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Fri, 28 Aug 2026 16:48:55 +0800
Message-ID: <20260828084900.1496839-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828084900.1496839-1-coiby.xu@gmail.com>
References: <20260828084900.1496839-1-coiby.xu@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The encrypted dump target support is now extended to arm64 and ppc64le.

Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump kernel")
Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 Documentation/admin-guide/kdump/kdump.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 0bf2eb100a05..36ad6125c670 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -572,8 +572,8 @@ Write the dump file to encrypted disk volume
 ============================================
 
 CONFIG_CRASH_DM_CRYPT can be enabled to support saving the dump file to an
-encrypted disk volume (only x86_64 supported for now). User space can interact
-with /sys/kernel/config/crash_dm_crypt_keys for setup,
+encrypted disk volume (only x86_64, arm64, ppc64le supported for now). User
+space can interact with /sys/kernel/config/crash_dm_crypt_keys for setup,
 
 1. Tell the first kernel what logon keys are needed to unlock the disk volumes,
     # Add key #1
-- 
2.55.0

