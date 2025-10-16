Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8861C345721
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 14:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626029; cv=none; b=WjZHyKte4BQ9VCjJYByYQmQZJrRh9jRjmaJgtJC0x9AKATT6Tz/N2+wOmcLMuLJHvoe52iIXNXvnf6HJ7G7FBL5tXakd2sNNwPPERkMn5flmx5Lq76m776NZLWxBjN2NGPXLfHmU48A1QLjhHXSH2FZW38W9BSEg6zUqNadcSP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626029; c=relaxed/simple;
	bh=qrYx4OQbtVttMxYPNSKZyKUM/2EziepE/DMT9sZuO9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLAtZVdemhfkkvHUTYDT/LH9wapcZciVLWa4l6rJK+vo7+u33HTptc1EevewlRIzfXc3MboOC2JRE4uy5zc5N3iWcVRxWGmwZQPEmwdNrU41dJXkCZtANCdczzSTNhq0R6+nfzGlwOdNxbwNFLPe+1QNPCOuru729My50/nkPhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=yonch.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-43f5ec025d3so480295b6e.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 07:47:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760626026; x=1761230826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6FTC4pXxezWlArm57ZmRQwBfAYH7sPfczRlTm0tzCY=;
        b=O1KtiygpJwKCwaUtZUaSJnuuducGrMjsEBmMwbaYAVI7oMDi0P/+fi6+2Ez/WL3eom
         kf54mWmaf7aeKSBIkJ8eWKot7R0qCPNqzetmNbYL6gBUBD4W92/wzBMKqv7W+uL7rLS6
         gXB7BS7JlIG2wjRy+osRm7ZsqLBykfb9S77N4hyGOJBVgikd73UPKjt+GftcD5L+sNOq
         EodZ29FQQdzoYF+U9rZ7ztgvZ/EnOmanClaCzd4qijPjZKAo5rftg7NVr2/uYNeR7Mkr
         zRRvwQH/Fb8amDgtkZMBtImmH6MWkSAsGniHO3UoEB7cttY3z1XD2fjmb99gjjYr1o3g
         nmcQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEAYVXYSMJ6iDRpdeEjC2uYyi9J1joKHGFlfbgEJIygahlxzRFB3vXhZiXr03KVKmePuJ9BuhZxgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5oYkuBzo/ZapgsRMjSM9JZ6ixsN1qa5lVKEHNS/sfNzBjHpEs
	H6RJTBgAAPmRonG1YTPgfvEwFwIL7oGxpI2WhasMyRCIZq2G4PNFTvuZ
X-Gm-Gg: ASbGnctKZs0DOAqhxSFts3VKHzVv154v/gcNFaYU2w9FsAVmaDQd0o2IkmsadbLY5uz
	I8tkczJKzLBzgZICuun2vhPKtbBQ0rhdgGtUbBdNLtjybCCQbuQbXAwN8sQz5YirGtqEgQMSMn0
	QScZIC8UqPtI9Pd1Y/iOo2laIgMpjkBPRUL9+TBGBrDMcJwLdFYG8tuWODK8OHsNnK820V3AaVr
	Mh2OI9CgAHuHH9cwzkn7gBJRwazeTQr/sygWyWQQvGd07ZE7SlQQI4Mj5hiPt0gPaTyF1ZgtFxy
	aPEgPPnuOkR1j9KPNgteJr5j+66qMx0yTN7EtZxrT03dxzgFanMc6lFq0qBghtSks3Q0Bwdey8F
	S+Vq6WAUkWtBujWTBMXbq14/HiN5I46HHM/qPsCfYwEQnKc/KG3xSNpGbwr72iekgZzF+gEam3h
	WyIOlBAkNmQNUi8EKy/pDrrh/t4ZZUSTw0q3z+zraDqjHCG1YdHKCry6QOhUKN8mE+Vhk=
X-Google-Smtp-Source: AGHT+IEqY0Itcc1XjdzEUHZg7NibgLkNaNHb6IF/rm8TnzxUng5S0hLv2Izsxr0tjhoHkMDieMlXEQ==
X-Received: by 2002:a05:6808:4f0a:b0:441:fb07:c178 with SMTP id 5614622812f47-443a2ed0503mr112853b6e.8.1760626026415;
        Thu, 16 Oct 2025 07:47:06 -0700 (PDT)
Received: from localhost.localdomain (syn-067-079-108-173.biz.spectrum.com. [67.79.108.173])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-441cc812f24sm3678018b6e.12.2025.10.16.07.47.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 16 Oct 2025 07:47:06 -0700 (PDT)
From: Jonathan Perry <yonch@yonch.com>
To: Tony Luck <tony.luck@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	James Morse <james.morse@arm.com>,
	Roman Storozhenko <romeusmeister@gmail.com>,
	Jonathan Perry <yonch@yonch.com>
Subject: [PATCH 5/8] resctrl: Propagate CPU mask validation error via rr->err
Date: Thu, 16 Oct 2025 09:46:53 -0500
Message-ID: <20251016144656.74928-6-yonch@yonch.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20251016144656.74928-1-yonch@yonch.com>
References: <20251016144656.74928-1-yonch@yonch.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When __mon_event_count() rejects a CPU because it is not in the
domain's mask (or does not match the cacheinfo domain), it returned
-EINVAL but did not set rr->err. mon_event_count() then discarded the
return value, which made failures harder to diagnose.

Set rr->err = -EINVAL before returning in both validation checks so
the error is visible to callers and can trigger WARN_ONCE() in the
PMU .read path.

Signed-off-by: Jonathan Perry <yonch@yonch.com>
---
 fs/resctrl/monitor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/fs/resctrl/monitor.c b/fs/resctrl/monitor.c
index 4076336fbba6..4d19c2ec823f 100644
--- a/fs/resctrl/monitor.c
+++ b/fs/resctrl/monitor.c
@@ -445,8 +445,10 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 
 	if (rr->d) {
 		/* Reading a single domain, must be on a CPU in that domain. */
-		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask))
+		if (!cpumask_test_cpu(cpu, &rr->d->hdr.cpu_mask)) {
+			rr->err = -EINVAL;
 			return -EINVAL;
+		}
 		if (rr->is_mbm_cntr)
 			rr->err = resctrl_arch_cntr_read(rr->r, rr->d, closid, rmid, cntr_id,
 							 rr->evtid, &tval);
@@ -462,8 +464,10 @@ static int __mon_event_count(struct rdtgroup *rdtgrp, struct rmid_read *rr)
 	}
 
 	/* Summing domains that share a cache, must be on a CPU for that cache. */
-	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map))
+	if (!cpumask_test_cpu(cpu, &rr->ci->shared_cpu_map)) {
+		rr->err = -EINVAL;
 		return -EINVAL;
+	}
 
 	/*
 	 * Legacy files must report the sum of an event across all
