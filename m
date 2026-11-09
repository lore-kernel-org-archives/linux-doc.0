Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794187379;
	b=Pg5lCUHpQk+x26HJ4gcT+TYyak0y17YRhltbmCH/ijnrnUx0tdmnwJxe+XxTmPw43WGU
	 Y9p4yJm58bmOeKkDLdvx5BCGdQNqwbfZAMA/sfm0xvtt6xAIGI2XKU9hethQfU822Rsao
	 mSTjD7892Oi75hxMyxO/xk9h7ssrMVvK+WwmcXAjpcqm1j9EPO6jxuvKERv0U4oCPHuH2
	 5Vx9BhfxLl4aAk+ivOsN9/G41DQkMW6AeX+EJp+VxoWWH/hpFyiBf2AoLAFSL0ksb0Zez
	 6LLIOiKtOMUB6HsAd71JCpGVaYQg2vwbNJsIYd5chmt5OI7T4kBxoA8UD1kMEZqAc9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794187379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
	b=EZMDb+HovK7mHG+ZrUyzawqSgi/THLZaqLDAoquX5uMRhXHwmRi3MvZ8uYYFyIW42T/F
	 1iM28IMD6Xd68n83xERwh6jeAfxLehQirVIs359dKJcSdkUQmLSw6ARW774Alahb+MWMa
	 auX74lTJk1mBFZa0ueQ9VohxQ36FxB7zBp4j5Hzih85fABboH8gbTZPNbSOYO085Hko6w
	 5R7DWB+ObEdOUZ6hlCzNKjSU/R+TsgTOxSrl9Sf5tJukddR7lz9lksEyljvRp8jwT2Y+K
	 tq4oHbFLZ5XwpM/TwNv6Jq02TY68wjK585O9iZZWW/9vdXB1bfYQlArn3qeqiHq6w1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3UekpUa;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA75606D81E
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 01:22:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AA75606D81E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a3UekpUa
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a3c08d6928so636233c88.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2026 17:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794187378; x=1794792178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
        b=a3UekpUaA4JIlfxinSS7NPD57AxZnwhcsa8MojRbUp+3TebzYP1Go6r8trx3GPnwz5
         G3GD+okyXsTduKd253Bbe0Fy1wU+o27kqTQSvd1ZivVKjgspxXIA6iW62Cs0lxUiS/L9
         Ru9kYy21WlxqIAHevkM31qMjTNoFd0/6C0NtarXysY+s1GGgW1+jirkLXTrbsaIe0xDp
         R9IEJMpcrrh6gj6mj7qbGTgjwlhPBNg30Od+fcQSy5Li+cvXDgpifvC9l65kz2OU7VPo
         KZKT3ys40TpD3UNWQKBbJxUUwXa+cjhZQ5056UF1Gs12jF1LMqtOERF7Ho5mCZ+Sp8z9
         7EAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794187378; x=1794792178;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vdbzkytGXRhHN+l/mE1rRdmYyXtT3CDBuzLxY9K8xVc=;
        b=t6rpwPUhTSW86YYHdiYeinX4MmlBuZFd6rNJChna4BV4QM+utucy1r4p5drpMIcsso
         C347GwuVG95p4ti6yxX2kEAIjF9ZVNfB8OiI3VAWX7xvQZVe1KDh18EUSvRq9CxGs+QN
         atrwMsfXtRfD2uFMutQMGVa6EZG76NikW/WWXY51ngjm3t8RK6DFfm6qS187KeNn2Csu
         EyujuW740IJAWSpN0gl1JIYXl5psbjTchZDRvj4RPx1QXJrMke+gODuc6nv5htF+10K2
         qyXT2NiNmanEeKCk3n3LQrIB5KFnfgKQnHI62gZO+B1PUWB1VrF1mcOfP71/Ee42nFyS
         18Uw==
X-Forwarded-Encrypted: i=1; AL+hErHvJ5VZFb7H+QREwRQfoxEVgWqEnw/mHGtFi7oEP0qGjoyShQZ4ewJ88Dzadzrgvd/dSvZErTwx4jA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+1lpT5wXKTiuX18L0X4nnmAuzJulosLoqOa7hhFdtRwUvdTvxL
	+tAVR+d9iwb9YKZ3ICFaDkSmwAQ7IjMInJHcFNSYPlJb0/sYV3ct/3eJ
X-Gm-Gg: AYBFou3ibxo6alSoiq7dU6XOwpsjfih8/W2oaV5s1WfwCejs3GDWq+Qxuu7Y6CUXTwU
	AnhdgwH0bqdkMx2UsLZRfRiCjb8eCD8hePQ4ImqXhDYq9yA7uUbMjLyKgfYa6IM3sTgfmV/ywD7
	QPq0JPSzfNvz0n/q/v3hdFNkY1H3g8usLUm/ktXmCZzo9wCbDNhzYo6MiBfGWYlhTRF5SSZbAao
	4/hBM/iRqDC0bPvUyYq05pRqMk50mZX1gU6Np+SeXkV2YKeLjDMA5PA5O+5sKjfiJ6jbOH/hzRJ
	4q0a4Nv8JziA8PqTB1sb+TaZN31aRguYFZG+5DfpHF4z09ZRW6QEhqAntYnGJtCSFFRrcJGQ8ca
	WIMmOHJbCvl8fq1bZqQKQ8rJhx50Ws+vK1ajT5P95qtGyIVmo4/Ei2plDMUDuNvqAai+SRr9zhs
	vdk4LuBQ7nPGS/+xOz7wngwRwrwW/XEWyrRd7OAA/WCJPL7rJgB4YsSIfIqEi7p70mIek6asg+i
	90DKWbtUqp3vav0f8eaJjnL6Achv5xZwSsg/KFiANB5Zum0tCk0AXcNvXIUlMBbriOebbNmcfWa
	nZ2iKoTG0oUz63bUz6kxFVAt
X-Received: by 2002:a05:701b:2702:b0:1a9:f3d2:6262 with SMTP id a92af1059eb24-1b39ff04e7bmr4005319c88.36.1794187377412;
        Sun, 08 Nov 2026 17:22:57 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3771ea85bsm9428226c88.18.2026.11.08.17.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 17:22:56 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Subject: [PATCH v4 0/5] mm/ksm: keep smart scan from losing duplicate pages
Date: Sun, 08 Nov 2026 20:22:49 -0500
Message-Id: <20261108-bug-mm-ksm-smart-scan-align-skips-v4-0-86be8fe77e7a@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAGkg8WoC/5XNQQ6CMBCF4auYrh3TqVCKK+9hXJS24EQLpKNEY
 7i71Y0mbnT5v8X37oJDosBis7iLFCZiGvocxXIh3MH2XQDyuYWSSqNEDc2lgxjhyBE42nQGdrY
 He6KuBz7SyOC8xFDa2pjaiuyMKbR0fX3s9rkPxOch3V6XEz7Xf/QJQYJqa/SVLlA3YdtFS6eVG
 6J46pN6iyjLX0SVRWPryshGm6L4EtefYvWLuM4ial+6YJqy9fpTnOf5AbYWliB2AQAA
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
 Qiliang Yuan <odys.yuan@gmail.com>, stable@vger.kernel.org
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
that never merges. Pairs whose pages are both old before they become
identical fare worse: of 1800 such pairs, 200 merged before, still 200
after 256 scans, and all 1800 within 32 scans after.

Patch 2 documents how smart scan picks the scans to skip.

Patch 3 makes the KSM helpers in vm_util fail on short reads and
writes, which could make ksm_functional_tests hang or fail cases that
should be skipped. Patch 4 moves waiting for KSM full scans into a
vm_util helper, and patch 5 adds a ksm_functional_tests case that fails
20/20 without patch 1 and 0/20 with it, on both boots.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
V3 -> V4:
- Make the KSM helpers in vm_util fail on short reads and writes, in a
  new patch 3, and the smart_scan helpers of patch 5 likewise
- Add Cc: stable to patch 1
- Add Reviewed-by and Tested-by tags

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

v3: https://lore.kernel.org/r/20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com
v2: https://lore.kernel.org/r/20261105-bug-mm-ksm-smart-scan-align-skips-v2-0-8a9780b6844e@gmail.com
v1: https://lore.kernel.org/r/20261016-bug-mm-ksm-smart-scan-align-skips-v1-0-2f91d76416be@gmail.com

---
Qiliang Yuan (5):
      mm/ksm: align smart scan skips with the scan number
      docs/mm: ksm: describe how smart scan picks the scans to skip
      selftests/mm: fail KSM helpers on short reads and writes
      selftests/mm: move waiting for KSM full scans into a helper
      selftests/mm: cover merging KSM pages aged by smart scan

 Documentation/mm/ksm.rst                          | 16 ++++
 mm/ksm.c                                          | 24 +++---
 tools/testing/selftests/mm/ksm_functional_tests.c | 89 ++++++++++++++++++++++-
 tools/testing/selftests/mm/vm_util.c              | 89 ++++++++++++++++++-----
 tools/testing/selftests/mm/vm_util.h              |  3 +
 5 files changed, 188 insertions(+), 33 deletions(-)
---
base-commit: eedaa7d61f1ec8ae053a9ece0d553785350ac486
change-id: 20261016-bug-mm-ksm-smart-scan-align-skips-cd01e5a9889a

Best regards,
-- 
Qiliang Yuan <odys.yuan@gmail.com>

