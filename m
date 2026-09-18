Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FBB3AE19D
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 22:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789769609; cv=none; b=gJwUeJ9TbplTjWn27mpvzTGYp6Y4TpFzHXFLXz2/ehw77tMjw9c8s3myaz55meTKHIAxL4o1bZmaXmUHvzPSADMiZnG+6tx5LAbMLnF+c+aWMgnJVOXgCtrpJ4omO3G5ThtbfrYBIaKmftNDQfRygF3lCgLeewDr+9AHTMfywL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789769609; c=relaxed/simple;
	bh=txGAveWwvTAAtYGBERUy5ooogepTZpOlvAx7wGepRlc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZwJZF7riSODGKUkw8tEKDrShKDDx1NbaptJjoZKdCf/Y8B1dR6wL2zF5BCYEmyeEv6wLg//6mTGQAsxpOS5CjZNWxZ9zbHV/ws8TUdGBcoBOABwM8nTFN0Im9GeXSYAK7EcK7aHXC44uX/OPGT+aUYWp5YknjpjbcsEu+qzRg/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MZ5vy8lR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MZ5vy8lR"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d90ba1d807so15475005ad.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 15:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789769607; x=1790374407; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FAJrnRTPiGjW3lczIKaVvBCkSw+LsISQ6r4v8TGclfY=;
        b=MZ5vy8lRjyXUbO7q82VLmSmKccMicCKIHP7RuBDLckWLQ5g5eDf3aZ97XFF8Y1VnIS
         H93WnrDz32WcHdBeWU2MFVr1qHpY32QRk5up1/ELaZ1Z0Us9t+a4LjCICC66laddAdEe
         imatyivHj6+DEytw4Wx6/zNZFs0ig91yE829IOINvHBKcaEIk0B65y3gzuyhMXCysi1d
         TQsrWv0QoX+mO5iTMEt86yjm35UevPkea7xGaJCnjrUfA3vlr1xPfXUsGCCItncReTYC
         oa5q2k2L3RIgRtaEBF/c4LVsp3I2F0IYkkg7irEOYK6YA8p5dhue94Mswga4UY/eniKc
         vZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789769607; x=1790374407;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FAJrnRTPiGjW3lczIKaVvBCkSw+LsISQ6r4v8TGclfY=;
        b=bjMfp9MUZBK+cPfAIiKLVgqE2emUGp3MSG0Vo9wOv1OtjTr5cg0Ol+3UcuPirgLb4m
         QzbJncJ+2vZE5pt662YLfTraRD6wrx+aLGPXnUHHHs1pkgcRL6Bjklrsyuom5jPQmu6G
         tcheX1bnC3/t9uCC+RdQ6l2AeW9d/0tgTU7si0OCIEP80Frbzmf5pIkbTYoQbzlres3W
         sz3j7L+ic7bxU5ug8m8EcS7FaDvBRE0s0y4nciTTBUMvmaxwL/+4QdCLQDgdE1kycxyK
         Y22/PExcd/EJ/s9sivkN6V46WzJG7QCCLuRUoKLnMQgAMhBJk4V5wddNkl6m2KPvQT4F
         o0IQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8UeAa2UZfMX9Dxb2mMxiUZOqdPMkwrP8jVdDKAVZuI4Y+tbT1G6SHeG7unzH34ws7WW4cSrIMYo0=@vger.kernel.org
X-Gm-Message-State: AFuF++m+lpEd8fXseVruS/spv8vImopPRXPe57QdtcZiEkcLfkJJ8x8L
	mJu2cWtQSfECkbY5Um9l9zZ1PcFWhHnPbP8MhRw+eKqUj2nRYOkBrztB
X-Gm-Gg: AYBFou2uajoR0oUFjHxJO76wdjih/bA3QD0IH+OgkE38eAvqsmsZB0RiCYqvk3fuMtr
	PE3JbYpXZgyMV1A94OJEiulhB4J8iaiNTmywz6qVq4y8hqhnLeStcA3VtOnJFsjZbXDuyzIJ+5N
	V+rhBmJWOXAWcBcx+xYJVeox4nFUxvMslA/8otKgHiaCDKuN+ZclhNmVMNHdCSl/E4aYDlZyeXv
	lxyYb3UnAtsop0p24CIsIo4yF58dRQWqTUy+QT21/sdLhiQQVWQcwYy3F48Y4xUklAHzk1KbKD+
	1x+dw8l+HMJG2xizh8OMBcyaOu/WXvAWZgJG/bF00adS9FOiBrmdwzfsvPI5mDw1dNj33MVbF3S
	l6qZ9ZJmvgYUmRNbsNdUJNucC3PmHCSYDUwIogeGxCCsUNalPopmL9pGYt4FDkzOIRaXedjfWXG
	WQkv9V3Ibnd4aiw8yRRsdWj7pSRCQ+XMoxWGl7yKhLlLV33hK8IiqZER4f4ELtrD6gX2PQAjnSl
	0rs+JJY+zFviKi92pwOn3et6T33E4OpgKqHl77EeaqQFsjWlC48pGT5Jv/3mqj5ZGZCcMvYzPuZ
	9HWSBsoAViTUFrEEdKkj
X-Received: by 2002:a17:903:1983:b0:2dd:ad73:c936 with SMTP id d9443c01a7336-2ddb1b9952bmr75011755ad.23.1789769607146;
        Fri, 18 Sep 2026 15:13:27 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3311a716sm1553671eec.8.2026.09.18.15.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 15:13:26 -0700 (PDT)
From: Lawrence Lee <lfqlee314@gmail.com>
To: David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	netdev@vger.kernel.org,
	Arun Ajith S <aajith@arista.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Jaehee Park <jhpark1013@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 0/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Fri, 18 Sep 2026 22:13:22 +0000
Message-ID: <cover.1789734885.git.lfqlee314@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Neighbor Advertisements for existing NUD_FAILED entries are currently
ignored. This can leave a first-hop router with an unusable neighbor after
the host becomes reachable and announces itself, particularly when
forwarding is offloaded away from the kernel and traffic destined to the
FAILED neighbor is unable to trigger the kernel's normal neighbor
resolution process.

Allowing neighbor entries to be updated from NAs already received by the
kernel is preferable since it creates less work compared to periodically
probing FAILED neighbors (e.g. using NTF_EXT_MANAGED).

Extend accept_untracked_na to treat FAILED entries like absent entries.
Require a target link-layer address, IPv6 forwarding, and acceptance by the
sysctl, including its source-prefix check in mode 2. Recover the entry only
to STALE, including for solicited NAs, to maintain parity with handling of
non-existent neighbor cache entries.

Patch #1 implements the behavior and updates RFC 9131-related comments and
accept_untracked_na documentation.

Patch #2 extends ndisc_unsolicited_na_test.sh to cover FAILED-entry
recovery and each acceptance gate, including in-prefix and out-of-prefix
mode 2.

Thanks to Ido Schimmel for feedback on the original RFC.

---
v3:
- Cite RFC 4861 section 7.3.3 when describing FAILED entries.
- Simplify the FAILED-entry path as suggested by Ido Schimmel.
- Drop the NDISC callback and 6LoWPAN changes. The existing 6LoWPAN
  override-only behavior also applies to INCOMPLETE entries and is left
  unchanged.
- Restore the existing rt6_clean_tohost() source-address behavior. The
  source-versus-target behavior applies to all neighbor states and is left
  unchanged.
- Verify the link-layer address learned during recovery in selftests.
- Keep the NA source, target, and neighbor key fixed while varying the
  router prefix in the mode 2 selftest cases.
- Arm packet capture in selftest before starting host DAD and wait for
  capture readiness and receive completion.

v2:
- Full implementation of logic to update FAILED entries to STALE.
- Update the RFC 9131-related comments and sysctl documentation.
- Add selftests to verify state changes only when the accept_untracked_na
  setting is enabled.

v1 (RFC):
https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

Testing:
- x86_64 allyesconfig build with W=1
- Sparse on net/ipv6/ndisc.c
- tools/testing/selftests/net/ndisc_unsolicited_na_test.sh: 14 passed
- Local NIPA checks: all 45 checks passed
- Sashiko local review completed

Lawrence Lee (2):
  ipv6: update NUD_FAILED neighbors from NA messages
  selftests: net: test untracked NA recovery of FAILED neighbors

 Documentation/networking/ip-sysctl.rst        |  28 +--
 net/ipv6/ndisc.c                              |  47 +++--
 .../net/ndisc_unsolicited_na_test.sh          | 195 ++++++++++++++----
 3 files changed, 201 insertions(+), 69 deletions(-)


base-commit: 4bb9710c6a68d35207f123aef55dcd50e7195ec5
-- 
2.43.0
