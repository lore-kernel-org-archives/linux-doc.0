Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383571;
	b=EyAOQfgYcLXKA5c3MWOI8e28V4eFIelfqHFqFJceBrCXMprOxJt0Amz+ObWZoFff5PUt
	 ZAISwWVn+PUKFpw1Rv5nB6Lqtq4YhREOtD7QZ/JXSqzzczVrbnWU0tb+TuYska7wYOajv
	 W250ZIc8z6gLA79iYXypIfH/kPKWb9ZQyOfVphgq6/c5KuM1SXpVRikv5RloXdGDh7AoV
	 On5jw0Ak+7LHdORr2pG4AV/gG2xr24F/o37qDjr2XDOEdggOApeyhTEaNj/yOk42qQc+s
	 9Eq5AU2x0QLibBuip8KUvdk5djwnLKVx4R5rJEq+STQ153gevEs+pOxJ7PLwK8g3Fgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383571;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
	b=lzOiW0OaA/ZymvkWj67gRgup/rqRM+vGiCyUhEzMFzRIT1Jz5hVuIvZnNmFLiFLZRfOg
	 3/H7oIGAAxk6DCsTXiYm4Sj/UIw7gbjMNEl2RvDZ0czWBntU/gMFLgj7q9v6p+A1ZBmQR
	 wbmpPXz8dDldIuUEGm0GvX2MYeConE5E+DN4SiTN7ZZZzIb9WWYUKiqWpGHYPk9ZqmfYX
	 TiRdRR2KECbl9p1jf54Em0vo+CPCfeqiaUItXN2KkV4D9JdO6IlKTV6c780f1Y/4XR3d8
	 K2b8xjHoh/KupL6nmc6F958eB+Yhn+/hodRiALhKKRxiWtqUhRecfui+JSlDL4VFX5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E069606A326
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E069606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=rg0AnoZk
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e977109392so16909435ad.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:52:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383571; x=1794988371; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=rg0AnoZkPwtV1r39FwY0fYtx+B96qCAj4XVMip88C/9myzm80RBPFU2IAquryZOpEw
         HdyksEXUIKYlStPIHQFe+XswkRSfDVjCV+PuDM5mPVvVsB5Zhzq12JVethAv4uT7qDLh
         gLXECA+eszlPSiHp3RlqZOoUtxhu/9gEEG7ag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383571; x=1794988371;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=59sgXJgrAjzlF6lUUIt9hHd7ZlSVCeSH79v3f3zBjaU=;
        b=vjjj9NatgMbIUGQze6f0zxq5sLd07gH0NPrRTP9D7uRLTn2tGiVnFa+tRtfzMGZhaw
         TG2/NWclgHrZuJ7a26f6RW9uh9OLzc2fKUtZo2Q0uidxwkhM1bVcqMntnBlPjaJkAvFp
         bAl/wvFTYk/G461MgBp84UrlYFCOX5iJY1OtsbZPbX9DxBFbzWHvnrvMXAU8/dQ1oty7
         m6FSSLNoXju+2FAru6MTdE59FnBGUNtrYza6374uNM2CB83WEJ+VMt/gYn12ozwWzYUg
         te/LF+W/W5gxG90WYQ18c2hHklhJr5hOlkP4FTUj+AqHLGxaoL5XtpgXb1baBLK9WAZw
         of/w==
X-Forwarded-Encrypted: i=1; AL+hErFXUleWENJ1a5x2tmzW/gVK+l9UEpfERcYKxAw6JoxqqU34GpzqEntYjwtixxOpxWM1qXs6MysAEPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8j35w/qcLbyaT0lTCT5ha2ojzAXawtjUD2NlfNtloY2U7m/35u
	olKZJu3C+U8ZwJfxXD63ll/UcvfwFDz7Uptbc6UqBUdjDxEY87QteuT6CDx5SqLLYyA=
X-Gm-Gg: AYBFou0CqysRDevb2xW/pqQgcPVEc6ek/uQvfRp8xxL0+zsGswk7bhCMq5/Wowuo5lj
	oJyLRdaEpRFGp4Tua+sDhSVCxunmCjOodzhdckmGqmdPrNkImXGTWPEvzdGWt6Tv5HWjLcGLe0M
	Pc7l0/5PVIJbczmYrxwciAsK+yqAv8rM3Cr32CVi1Jf3WLxAj+zB2xCgu9blJNSG+UB0NUuEh4q
	ijmzSLeYteZTC2aeOWEGqQcEm8w+TN3z7zPKPJxh12Yhzpj0p1vN9ZPgnguAYg2rwQpNAtuDIvH
	O2kTtzVTTvaLS6qgkdDCfwxPEwRp2bJ6IrWmUjrOgPg1JOy6UtdyKFCDepqnU56AZenADYSNusJ
	xifuY7BKp1wL/uXio6S0a6HGbRwkWzdJG9zfZEJV7NbhYbIb2lB8monUekxf7PUZi3Gcn6Yw4Xc
	D4N02GYbv955SiadDyEQJZOFXC3QN5tueotMvsE97PNq38M7ipBA8E7OM1Kzs5j/eWGNxIZzMKe
	B19KMujU8qBshfB6A8j6s31Vg8BJcOIKeSzK2cZakOA1q+Drw7vx2uYtD/AyoUJFi5/8VZ1S8yb
	j82LtWY8cILkF3P4fiUKaSssvw7+UdvVB+vgifRVgmxa0Ii5WxQv4EvSaRRk3Cuj0Ofd7teBw64
	pVik+hAvDs3R4dRBudfhuFYNpQMJOgdtvCdUn8ePCQXN8VLEhrLA3kDJSNqD8l3Sbp5Rt0SSJms
	SZFHxU/yfU82qKtoKbZpWOL0/N5L0SzSbOQu3KEegzkdv2OvDu0Z7Y
X-Received: by 2002:a17:902:ce83:b0:2ed:205e:eac3 with SMTP id d9443c01a7336-2edd7673ee3mr20690885ad.12.1794383570630;
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6e0d5c0sm17541865ad.71.2026.11.10.23.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:52:50 -0800 (PST)
Date: Tue, 10 Nov 2026 23:52:46 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/9] kho, liveupdate: KHO/LUO observability
Message-ID: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, we are moving towards using live update on hypervisors whose
VMs can't be migrated away first. We also want to preserve service fd
stores across systemctl kexec.

Our kernel rollout is driven by health checks from each host. For
example, an increase in rejected handovers or retrieval failures may be
a reason to stop a rollout, and the bootmem size and sequence number
help us understand what is happening on which hosts. The series exposes:

- how much memory KHO set aside
- whether the new kernel accepted the incoming handover
- whether LUO could give back the state that userspace handed over

We expose these in sysfs so the collector can read them without opening
/dev/liveupdate, which starts deserialisation, or depending on debugfs
or the kernel log.

I also noticed that the incoming kexec metadata page stays reserved
after boot, so free it once its contents have been copied.

Chris Down (9):
  kho: Reclaim the metadata page left reserved after kexec
  kho: Make bootmem reservations visible to fleet monitoring
  liveupdate: Make failed retrieves distinguishable from dropped files
  selftests/liveupdate: Catch incorrect file accounting across kexec
  selftests/kho: Catch missing or zero bootmem reports before kexec
  kho: Expose rejected handovers that look like cold boots
  kho: Report how much handover memory is preserved and restored
  liveupdate: Expose the sequence number for consecutive live updates
  selftests/liveupdate: Check handover revival, sequence and memory
    stats

 .../ABI/testing/sysfs-class-misc-liveupdate   |  56 ++++
 .../ABI/testing/sysfs-kernel-kexec-kdump      |  30 ++
 Documentation/admin-guide/mm/kho.rst          |  19 +-
 Documentation/userspace-api/liveupdate.rst    |   8 +
 MAINTAINERS                                   |   1 +
 include/linux/kexec_handover.h                |   3 +
 kernel/kexec_core.c                           |  26 +-
 kernel/liveupdate/kexec_handover.c            |  82 +++++-
 kernel/liveupdate/luo_core.c                  |  58 ++++
 kernel/liveupdate/luo_file.c                  |  16 +-
 kernel/liveupdate/luo_internal.h              |  34 +++
 kernel/liveupdate/luo_session.c               |   6 +
 tools/testing/selftests/kho/init.c            |  24 ++
 tools/testing/selftests/kho/vmtest.sh         |   1 +
 tools/testing/selftests/liveupdate/Makefile   |   1 +
 tools/testing/selftests/liveupdate/init.c     |   5 +
 .../selftests/liveupdate/luo_handover_stats.c | 258 ++++++++++++++++++
 .../selftests/liveupdate/run-vmtests.sh       |   1 +
 tools/testing/selftests/liveupdate/vmtest.sh  |   2 +
 19 files changed, 624 insertions(+), 7 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-misc-liveupdate
 create mode 100644 tools/testing/selftests/liveupdate/luo_handover_stats.c


base-commit: a0dc8eddbfdb6dd9c5c2b70eb66ab49cb1978425
-- 
2.54.0

