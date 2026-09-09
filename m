Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893C3282F0C
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914263; cv=none; b=sBPjDyMIDWpWlL2MxZCa781Ow82zZEDmHK1vQ90j0HIYhjnsBTwwfc0ADK4DQ7101n7bZ1BzdZyg4FOj0V3cuX779m4Yhn8DKi33KIAk922NNWHmur0M7n17rJy9ybVbRS5W8mw00HcWe9bf81+ydaBXvb8IFHMpb5R6iLoSNWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914263; c=relaxed/simple;
	bh=hWltHfXGF6tM0pJn0+dwTACm7KNrwHA6EQNSK8fnngg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B02f6TaHCFVPvtyvzSHhExjx2iKTv4Z7N9lUzANseaTwzZaluWuj+kmmWO1rvEoXbGAHdnUs4jv5aK0ovg8Ak8kcvM9n4H3jBLeVVtwA7PY7pJwyfC74kKLbVMwYOHwTeOA0q+VyszUk4es73LHnfyR3PT07cmofGBlV646s3pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b67E0KW6; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b67E0KW6"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccdaea75so522744a91.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788914260; x=1789519060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=b67E0KW6w76sjMa7IIOQV7KpwyutMY/UpNjhG+tb3pypdHWBMsRMiPbT4fqzjhBOZx
         pZUjjARIpymH0YYhqCq9Xj0DM6nSGbwVJnNNH6XozqSQ80mvspNhthpdyhQjpn/uqufq
         T4etY/QXRQ1ebVTmcI4Q0I+3j6YrZpfdWa6l+hYzzbTioaHjkmv189blSDS4BEMbq7qs
         q858JQ+KrqGGiEIJp3K+Zyn/Rn11AvL3URiuDsw57/+4bmXYXjPNi0RdubT3SBDD9H/K
         wfGxqzVsKL4T/oqQ1rNsPhMvs/xTHjCr2O6LQmeUUUpd+gC05jaF5EulbVrd0Fb4iv2y
         wZpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788914260; x=1789519060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Lm7BcEa8+Jgt9xkhmMJfF26Iq1SFFXivMsEEThtEiJo=;
        b=Rx/x+nBbgzbhtFRvb+LRn8kAayeMFLV5N8xg5v7UWDAcHxxMIBFXb7luRacdN1PIqG
         mzNT/0mKdijH6knex1k+By5tEt3j6DB+khU9+KVBZe7zHOHUQpNHNpNXfXF+dqoS/lCk
         7+u3H98KJjPaHr4FpcXF/91DzCPjGXmGe2sXLv/r4kQPnR7k+q3mDwOsrMysFz1a/HCm
         VrxnAV67JnLji5RYi/S8fdVcAl+QXe+6xf/f0OjtznVXiUuV8xZ9xdExSTaQ2XOTEULx
         aI/I+5s8SewmJdL70qfH+NTXzcZtleFH5Ut0hz6u9K7+7Kl1jPl7cBGOenc9qfgXo1EX
         KGrw==
X-Forwarded-Encrypted: i=1; AKwUvBzDEvgCGnetZGV8K7FnwzD7CQbYvi7YSSagmbXTD9yj8RwPdnSlu1A3Tqpx98SOZgDqOTy7jw/aTok=@vger.kernel.org
X-Gm-Message-State: AFuF++nb9LbUxUpvJwwEThTLHP5r3VXd1JgcGb+ZuZog5PemZfarGkFN
	33/FjKp9Y4zBMnXC9UD97amN6oPeEj6/dbDBFlpO5TlcLI3ebx4q4iVH
X-Gm-Gg: AYBFou36k0v9lIN6kqbgaDyxSW833igRkgZr7R+2ZbDj1Ton5vg5/kGlnvYPp9pkFtm
	y7AvhRJ7OWBck4e0LOSOXq/x0rzkEngetgDbwcOYkTd8n+pnI3M3dFPUaQj9fpAMm1eWADSyCKh
	Mbh3AT4rNbo0uxQG7192iGykUxUIOhUkENjiqaBI00TxbJjPLr5WWVF4kqsmMmxqf0Q79np2LMH
	5L8UHDPEUFr6j3sFEyE1sIU5YbTehRikqKMeSku/hrhOuZ7YVL0Dx2ri6PWHqZDrIkg/KlA2in5
	4H3wSQrUNClrSeYnqJvejvTlLXkf1vZuGU4BYDgloMjEePbdrxtHzZgKmvdc0R5Ztz3YVgU7BE9
	AQ9eAx+NVwSe4QcoIkyvcGCT8Clk9U4Jhpraf6X0qSNIVCRwIzT+GYOpZLajqPeWbpdQEKW3/7g
	dAU1ktbiC1nZb4lVUW3xKAjZLg/L0EjBlXYnCeRzkQV36NaR+83/b4TXBxAW5v
X-Received: by 2002:a17:90b:58eb:b0:398:ceef:edde with SMTP id 98e67ed59e1d1-39b8bf497edmr7501490a91.15.1788914260009;
        Tue, 08 Sep 2026 17:37:40 -0700 (PDT)
Received: from localhost ([2400:ac40:62f:1b67:ddd8:990d:9d6f:13b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08d0d845sm35551055a91.17.2026.09.08.17.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 17:37:39 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: kexec@lists.infradead.org
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Sourabh Jain <sourabhjain@linux.ibm.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Dave Young <ruirui.yang@linux.dev>,
	Pratyush Yadav <pratyush@kernel.org>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to encrypted dump target support list
Date: Wed,  9 Sep 2026 08:36:51 +0800
Message-ID: <20260909003657.1570544-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909003657.1570544-1-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
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

