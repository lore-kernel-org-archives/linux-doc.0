Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070631;
	b=mRuvOOx8ORGjVGteqJjMuM73mTFhIK1CI4Xd0jkOEdS00xbN3ro2OSQ50CHZyOEra0pL
	 gM2C20mXWmIDaLPGKLJQsaYRLtu089tcyfyaJxxI5mehheKPJvarrx+Soebaz5LNNeT6+
	 H1g22p1r0NqOxKwHhZiHi1gvyfIq+drlSBrap/Otj2FPRxA3i8RwZHPJq2O+CmSxEoybY
	 Isa25e3EmF0Inck1lJEYcSjwkmN7zhWQVGFHmdP8FyiFAf8CNl+xzjEToATA8Ov7Su9jL
	 YoF0nvUk5lALkYuKOZ4DayorECT92tlIH5KToJvGoc7oAYFFUDjFxpeatzK76iTyM4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
	b=WOhdyS5nq4HQQFP6DV0EZW6cHPwQd6jPCGKeb50KgKRpVZpTnJnbL+XvbAX5rRg07I3V
	 zQAim1JAr/bHZr0K3djg3Zu8YtIwrBpbH3g4zcJbXrkv7QH6xlOOvVOgniFWkDEFMncqZ
	 TpIaM7nFB0VxrzAOt0nuHbWG8u2CkxC8aEt1aHJik+lPaZlcrixfD57zSIJ3I1qx2ieOS
	 P2WVpIv4XRSahi2MID+FiRwdBQkC2iCkBw6AEG8ELbSSYTnIBxQqaL8eEycY23f8l/eaM
	 cweLK9p/Z6Vngod74JA3VrSmk9VDC1XuA4ZMQspgaUcKltiWbG2jA34ORYfILKJDcsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guMlP7cD;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024E5606A32E
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 16:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 024E5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=guMlP7cD
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1a3c08d6928so2896443c88.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 08:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070630; x=1794675430; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
        b=guMlP7cD0wMcrX3IIeZXBLsOONiyXQDFzBRaZPKxgmQqZYs4SQ8hgoRMx/6hYWlU8W
         Fy6lMRahnRumImA1QmpmM1Z5IoiJmLdjzY2yWSzVoOPmTdP3VTPoW0D+gY1BdiWROg6J
         IEG4fwyBVUx3OztWk9PlrTVG5WZDphw4FS3zYLq7piiZKbhBIPHJeVFTW/PZ1DhHbnGL
         3BeACS2eXp71lIbytgiAyPuP9r2gSRaeT58C6N7adf02R+qDA6y1Xxm2Xz2P7U/utT1g
         /Zd8PmtecDQJs5rSum0E9m9AnuyIeyy3DJTcTWYFoJjgICZ0CnkmJC0ugjqNp19JpbVm
         qHLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070630; x=1794675430;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1IdYFHcguOld1djjobDM98S66C+vPqesPppAzQD9DKs=;
        b=Q1vLpDzZAejlsGoKQ4hRF05e41YVERqt61krMJz+qOLJKBhPD/C5AoCFOJT1Z7xkWe
         rvBakFfIAS0JD+8gCrmIYG29EquoBNIIoyquQDU+z1rdIPzWmvKXnewvMRH1YMorSeyX
         80qak6TvRh5vIkvUxBx3mPrwHMpL8jzA4cbzxmXnp0BFoDpP7kCmygc+xShZhc4nUZU8
         T7+8LnBR1ueda2pcmcGMlKALxReFKg3BmGBJ9SE/jLVv52ej/pGHxE1vEwFFHB5hHQJL
         zsmHZq4LRJzAZNAL26nOmK7qKQ2y+qvUFrPvUNyYCAVJrcTr7EygYW59u4FBgBDV0ver
         Na2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzESsnVuzQmfku7YNzKZdwaGrYrFtuzDqX0y60RToAmpVBUxht7WG7Q7q+hcCB/aaQDbd6kjh31hzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XN6/RUnd7KQ3G4Fg6IuCI+MOHBWHWr9jDcpxDoGmEtyQbn0fY
	3Mkf3DgsltJI97kg3ajB3NCmvCfOSnHMT1G71apdqyIXgADvP8Wzu3RM
X-Gm-Gg: AYBFou2lpL6MvqUW80je+3f7H43fFEduI0h2yc9YIfebLINB2wuD0owNrcawImhcqt+
	u7ELmuVDFSq1RKf9Au3XY70PHqeeQFuDqjvLcHK6O+4sDVxVsb9y9SwoXD3vowZX/NAn++HLCF+
	3/995K+AmlpHJqVA69XyEPfyk3WagdGAJyYDepCikvNQ7eHwpGWh7V/NiQ07OnlKlRnkhdodjMz
	9xGXBUwU+eiPmlKTCxZKcJGoEx95qj0B0CXb8rr24rvVEJQ5G4uWb1Ouc1AjnOvjBM3lNfRKO34
	oBZqSg1i5lCFO1VCsuWnJuANOAAT5QZWzoZUAofTWRKOEh5/PsL/51641CfrL6GoKyqpNTG6WP6
	Klnke6Qfj/xe/EL98tHe3zFx1jjK19H9tGXLOooZ/mFT7f7mWNqaqdMPJZXFf1kDHpeE8/Lg7Tu
	cqR0+6+6oawK/W6PqJlG2uwKyIk3Sl9bwHR+1G5z3htAoAv8+zEzG2DUyuGV4FKhtwp4/xI2VLo
	klO+ysGEpzbJLoJ7L483wORTuIyzPYSefPJXV72Q0BNnjo2FcoCfXzY73pLX9emCN1ZM4SZ95Wu
	IFqRkK7FnK4KLeqT4lBUTmEF
X-Received: by 2002:a05:7022:c43:b0:1ac:d029:70cb with SMTP id a92af1059eb24-1b25d36f29amr7174636c88.30.1794070628979;
        Sat, 07 Nov 2026 08:57:08 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:08 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v3 0/4] mm/ksm: keep smart scan from losing duplicate pages
Date: Sat, 07 Nov 2026 11:56:59 -0500
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFtY72oC/5XNsQ6CMBSF4Vchnb2mrVCKk+9hHAoUuMEW0otEQ
 3h3C4tx0/E/w3cWRjagJXZOFhbsjISDj3E6JKzqjG8tYB2bSS6V4EJB+WjBOejJATkTJqDKeDB
 3bD1QjyNBVXNhM1NoXRgWnTHYBp/7x/UWu0OahvDaL2exrf/oswAOsilEnatUqNJeWmfwfqwGx
 zZ9lh9R8OwXUUZRmyLXvFQ6Tb/EdV3f/tmrZyQBAAA=
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

With smart scan, which is on by default, two identical pages that become
mergeable some scans apart can stay unmerged for as long as they live:
each page times its skipped scans on its own, and once both are old they
may never be looked at in the same scan, which merging through the
unstable tree requires. This was first noticed as intermittent failures
of ksm_tests "KSM NUMA merging" in run_vmtests.sh.

Patch 1 picks the skipped scans by the global scan number, so all old
pages are looked at together every eighth scan. Over 420 pairs made
mergeable 0 to 20 scans apart, 361 and 334 merged before on two boots
and all of them after, at the cost of about 10% more ksmd time on memory
that never merges.

Patch 2 documents how smart scan picks the scans to skip.

Patch 3 moves waiting for KSM full scans into a vm_util helper, and
patch 4 adds a ksm_functional_tests case that fails 20/20 without patch
1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V2 -> V3:
- Document smart scan in Documentation/mm/ksm.rst, as Xu Xin suggested
- Wait for full scans and switch smart scan through vm_util helpers, as
  David suggested
- Rebase onto v7.4-rc1-345-geedaa7d61f1e and retest there
- Measure ksmd CPU time with schedstat, which puts the cost at about 10%

V1 -> V2:
- Rebase onto v7.4-rc1-132-g05441d697f7f and retest there
- Drop the ksm_tests -N -m 1 numbers, as it no longer fails on this base
  without the fix
- Update the ksmd cost to 10-12%, measured on this base

v2: https://lore.kernel.org/r/20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (4):
      mm/ksm: align smart scan skips with the scan number
      docs/mm: ksm: describe how smart scan picks the scans to skip
      selftests/mm: move waiting for KSM full scans into a helper
      selftests/mm: cover merging KSM pages aged by smart scan

 Documentation/mm/ksm.rst                          | 16 ++++
 mm/ksm.c                                          | 24 +++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 63 ++++++++++++----
 tools/testing/selftests/mm/vm_util.h              |  3 +
 5 files changed, 167 insertions(+), 28 deletions(-)
---
base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

