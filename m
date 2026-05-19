Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D292E718B
	for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 16:01:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779206484; cv=none; b=BHoPTcrrOcyjo/c8qQ0rCKO5ukXnoJ1WU1kMhv8BfLFGzTPG1Z16hzJovFA7AtsH/9qGD4nhKNnhFuVO/tyYx5FMyARbZFsRyp9fhxodexzGhufw40Fr1bFrvf6GmyfBwhWVaWEMtR6JDQcm7DDG9BcyRfF0646K7zkpouFNyh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779206484; c=relaxed/simple;
	bh=6qUbI3kCpq9IrzG3DkvyvMZ2Bn6Qq+bPF5M36smFsFg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=qcDplA+AfTVD/fC4daqHR5w0jvn1zy5Hhub1V9AiJ8g8iXaimM2DENM6ICvqXF8Y/UbwdQP+dKi6Qkhv/IBppS5XwWxWMFQbrIsSYQOJzwcDUm0VctF1GSJqN0ANbjcrrdLB9wOyHz00lFHfHmLqIgpxJP4VeRhLETK4h3nyemk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MiY6bFpQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=N1odwPE0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MiY6bFpQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="N1odwPE0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779206482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=T6OjxI0zZxwDX8SXPRnZD+crOhWj/eJOyVt4Fi52IP8=;
	b=MiY6bFpQK1qPcMoo+yneKt4ynjd/6YL0LIy781H56dNrRS/RZSf0uQtpaeckfrr/dJWuAT
	iC03/sfcRIyQX99fk1D4Y/hoqyXAGK81XCIOWcP1bT8btZLuXxV37wpacHtJJJ9J932mR3
	ij2MfH8Vf8QUDbTedTNRMau0CSAnZfw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-591-3HF63aWpOGqcpI8I_4Kfuw-1; Tue, 19 May 2026 12:01:17 -0400
X-MC-Unique: 3HF63aWpOGqcpI8I_4Kfuw-1
X-Mimecast-MFC-AGG-ID: 3HF63aWpOGqcpI8I_4Kfuw_1779206477
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-90fd6eeed3cso925651485a.3
        for <linux-doc@vger.kernel.org>; Tue, 19 May 2026 09:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779206477; x=1779811277; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6OjxI0zZxwDX8SXPRnZD+crOhWj/eJOyVt4Fi52IP8=;
        b=N1odwPE0/siiAwiVn2M6iHvLCude0BJRLK2LIsB+9rEIEJ3zXCfHr5FNSHn5UPIwqD
         YxjeeEkwbbTdscSOypKWq+cym/hSvdm5jgesamu6ba7XDOJTcd/YCHSkXvlUpQLSFaVK
         a3JxL4vgocd7VuPSPa8u7CsD+zcxpfs9THAyLTb+qsF2L8tmtPzORyCrfM8b0z5WUvEN
         EEKaP8YdghLJXHZuRgIp1Gu3iIj3nesI6YueloDzmf9UvNY+tUjd8Qe6eRODi34IzH0z
         4LXV2gc1nuLytyOObTMDZtWowVAQH7AEcZvF+FUsfglrVaxbavRr0hUG7juYAsYMlfmB
         Y+zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779206477; x=1779811277;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6OjxI0zZxwDX8SXPRnZD+crOhWj/eJOyVt4Fi52IP8=;
        b=G108sis8DfiJQMj/5Oqt0RaCnbgbPYW4qiDw2e84jxM6TiQLa41k1287JEXER6WGPo
         zHwCWYzz9iOatzeEitC6KfToI4qbCd2+df5MABV6mCJ8JS5fuOeEKXX+2sFBDeKpkikt
         dPLnoumqiPSqn17AtJvGczKjIBtPRf6/C2FClEFZI/RjVNlEz7GfHMPaB0/WldvNEYZP
         ONmujF5HE2G7iXzWfmVhBRr75T21nxlwCSvZanuF5ZPEBCqVEZlUYcICU79lnXvbqPUt
         wfNOhjBzZHG2VItIR+6AIbbxcLmzTXLj2VmvkzRG6ainCxAvWuIHzWjIUxTEOFZq12FP
         glhw==
X-Forwarded-Encrypted: i=1; AFNElJ+/gXOJAkduDyGiPxSnOliQASblN4Hcil7vmdiuJ1CCc5FCGYszOZJONvyxUYQgTBp9F56SNB58h4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMs0QX7cYFIcFdyre1ML4xmbXAaDCdXNPDUeVZuN4aqECPsfAh
	VgAkTu9E01vwSsDhzL90kr0yGmyes5fSBg6EMkMQKXMg8BaUiW9jWziBob8DnNhqMV81PT6TxMG
	eCYZ8KmmJ1mtVKAOOQyS9XYWSsGXVgSvv/iaGKMuMYJgxX1N6XSLYSJ9GV3rVsA==
X-Gm-Gg: Acq92OEo4F8gecD2DDehMxF+GKJqBrzggNXGHt+LuYxWmCKwd5XGW40yxgdaGLxZVIS
	VBGXWn6eY+xxRm3Yjklz+hc84soyaxywJMiaIGwfArtE1ej1QHPsmG+vOC2Rt7gzQPCqFVSZAHd
	sPBiRIdYiFCpGzI/nfAKTPqk5ddkClCPMPg7+tHfYNsBIVBh96+ZNW4c6G8Xfi/dvZx/cHTnhs5
	/aVOr4XBK0SmEALndbUxFYSmvsSLGkpFO+MoQn+XSRxCd5KEXvBfqs9w+0LSrdmz1bzXYl73YqL
	3endnz78yf7sLdlEm0HwuQdQKYEmSNV2l2SddB823oaEn8TdhD6sEWznE2Vn2vrX7wnrc+pvPO+
	W9R0wAAoUiur0pJPFDdQnhStIxx1q7blIrN/dzISaJHxWGhxmyC7fTMxEnvlxHEmiBg==
X-Received: by 2002:a05:620a:460f:b0:911:4cb1:8a60 with SMTP id af79cd13be357-911cd178131mr3073461985a.13.1779206455569;
        Tue, 19 May 2026 09:00:55 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:911:4cb1:8a60 with SMTP id af79cd13be357-911cd178131mr3072809785a.13.1779206430240;
        Tue, 19 May 2026 09:00:30 -0700 (PDT)
Received: from localhost (pool-100-17-21-205.bstnma.fios.verizon.net. [100.17.21.205])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910bc9363fcsm1883933785a.27.2026.05.19.09.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 09:00:29 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
Subject: [PATCH v2 0/2] cgroup/dmem: allow double-charging dmem allocations
 to memcg
Date: Tue, 19 May 2026 11:59:00 -0400
Message-Id: <20260519-cgroup-dmem-memcg-double-charge-v2-0-db4d1407062b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNTQrCMBCFr1Jm7cgktRZdeQ9xkSaTH7CNJG1BS
 u/uoAdw8Xg8+PjeBpVL4grXZoPCa6opTzL0oQEbzRQYk5MNmvSZWt2jDSUvL3QjjyixAV1ehie
 j4EVw8orIXLwfvAaxxFTnXN7fg1VJ3X+uE7V/XatCQtv2yqmuc6zNrbCLZj7aPMJj3/cPgkfhe
 r8AAAA=
X-Change-ID: 20260327-cgroup-dmem-memcg-double-charge-0f100a9ffbf2
To: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>, 
 Roman Gushchin <roman.gushchin@linux.dev>, 
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Maarten Lankhorst <dev@lankhorst.se>, Maxime Ripard <mripard@kernel.org>, 
 Natalie Vock <natalie.vock@gmx.de>, Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 "T.J. Mercier" <tjmercier@google.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Maxime Ripard <mripard@redhat.com>, Albert Esteve <aesteve@redhat.com>, 
 Dave Airlie <airlied@gmail.com>, linux-doc@vger.kernel.org, 
 Eric Chanudet <echanude@redhat.com>
X-Mailer: b4 0.14.2

Following suggestion[1], offer a cgroupfs entry to allow an
administrator to request that a dmem controlled region also charges to
the memory controller.

Add mem_cgroup_dmem_charge/uncharge helpers to resolve the effective
cgroup from a dmem pool's cgroup, perform the charge and update a
MEMCG_DMEM stat counter.

Add a "dmem.memcg" control file at the root level to configure memcg
charging per region. The setting is disabled by default and locked on
first charge attempt.

[1] https://lore.kernel.org/all/a446b598-5041-450b-aaa9-3c39a09ff6a0@amd.com/

Signed-off-by: Eric Chanudet <echanude@redhat.com>
---
Changes in v2:
- Use mem_cgroup_dmem_{,un}charge to account for memcg pages instead of
  exposing raw nr_pages functions. Use it to centralize where to find
  the effective cgroup from the pool's cgroup (Johannes)
- Set depends_on for cgrp_memory if CONFIG_MEMCG by having a memory
  controller in children cgroup (Michal)
- Move dmem.memcg to the root level as it applies by region for all
  cgroups
- Add a dmem memory.stats entry for reporting memcg charges for dmem
  allocations.
- Wrap the memcg enable/disable/lock configuration under a single state
  to avoid toctou races and simplify transitions.
- Link to v1: https://lore.kernel.org/r/20260403-cgroup-dmem-memcg-double-charge-v1-0-c371d155de2a@redhat.com

---
Eric Chanudet (2):
      mm/memcontrol: add dmem charge/uncharge functions
      cgroup/dmem: add dmem.memcg control file for double-charging to memcg

 Documentation/admin-guide/cgroup-v2.rst |  23 +++++
 include/linux/memcontrol.h              |  16 ++++
 kernel/cgroup/dmem.c                    | 158 +++++++++++++++++++++++++++++++-
 mm/memcontrol.c                         |  65 +++++++++++++
 4 files changed, 259 insertions(+), 3 deletions(-)
---
base-commit: d989f135f71699294bb2ffd4726b526456e2db68
change-id: 20260327-cgroup-dmem-memcg-double-charge-0f100a9ffbf2

Best regards,
-- 
Eric Chanudet <echanude@redhat.com>

