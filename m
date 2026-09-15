Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD207431E49
	for <linux-doc@vger.kernel.org>; Tue, 15 Sep 2026 05:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789448498; cv=none; b=hYyt5FwOTXh21ZQD404qdNouUuGqotZpOFN5pHMwxf04CW0N+LVgJt3MFav8fk9CpB3m/cix22hWMPOLTVmyXQEPE6sPkPLU9JhVhzJdqIY2B0JwXwRhLdSayJFr2YP9NpGZPu0wM3Qc+oiA4vbw+bUo13aWW3V+POR+qhlEwII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789448498; c=relaxed/simple;
	bh=WvJDz0SMer3VBOphKTbusnWx9vBwOwyigPUnd+wAAiA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AB97BGpUaJkimuI1Iz/25GiJa+CkRHzLJoadNFrwayrU3timh7yuX6LTHWm+GwhrnaddMtITVgtn/ys43so7E8zTbhPlnLl77EcKWLYR9alOlryq6OsP1ncBEtry36QuV5jfXf570qk3QSS+vgx50iCptLm48tWZvOHosWUsjEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CESLyb8q; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CESLyb8q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccafb751so2836882a91.2
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 22:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789448495; x=1790053295; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ptBV0v6Gt6jAGsqstGkmrulpyxyqgfaikKMDt/h5aaw=;
        b=CESLyb8qb9mC71opDonoVuBQSmNLGkr0FyokxmGTXBXKnoGBaohfQtCFhF9iYDfSZX
         OfGYYFOzGxa4dsd6j/zDtS3Cj4a3AGa5Jgfo/pd75wLuIaRmJ60D350O2I53HL0JbM7Y
         SE4OMaXtERlI24QAe/wrufjpOkVXCuFppv5+fe5PKlShsccsf0EP2nRdjP+6sMye1e1i
         brCrnikbGHwPIZF0H5foqV7lrJ0oGAEgNgHtTVhR7uTwHOOmREhZUCnimhLJMchiBk6G
         w0hU0HuoY3ONKkoG5l27rBui5zgFaPh48lKsfBqYcAqTFfo24Z938eEoWWXxi/ZA7q8W
         EBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789448495; x=1790053295;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ptBV0v6Gt6jAGsqstGkmrulpyxyqgfaikKMDt/h5aaw=;
        b=YxFR69QRh+hIxyWWsxVMDKe3tYupeREzFZG7L+IaEUFe1yjBUlEfI4WsfxQTYmdzyi
         dJeNaOAflCCIuBFFDj9Gs1pVkhf1Q6rrY9djbTr6XH9mvBQo86cKqkqC3nUUXFaX5hDB
         cZQxf5YIeFecFm+ZcwJIcpvN2NOa06PeUaiXaSmBSPwKG2WWMfvgodz8LF7gz0fNFhML
         VmfjnecC6gnkW4CNbhX9/d1lVIcyAoIOFNCQeiEveEe4C0WyVu8tClm+oXQ07DJysfB6
         0UB2/7+eAnpImdesxElsqOB/xMDNZMXUo0mLKAaNKhPxI+4ajhDr+xh7S14MTjhLXHXv
         yQZQ==
X-Forwarded-Encrypted: i=1; AKwUvBxmNxh95XFCbGxXXtcE3e+KjSQRZuxOJYMOpVTR7hRLPJ9UlrElubObyZDQYlo+zSOHczI+53UWnhE=@vger.kernel.org
X-Gm-Message-State: AFuF++kFtxTHaluRbhjxsvqCoOa8efhX4xh+KCpaIizUzWp0vyykVw9+
	YtuAFsQ/iPVEpchl/KvoOWxx/i0Sp7JrszkRrCeCxXN1XziO/4cUwxwO
X-Gm-Gg: AYBFou3GSKiN9YcbJTN+hE9qJMiLPRqv8qzM0x7pXWPqE62yVMBdLyKfFKrqG1W2B5s
	BE8jOiGIJdgF1NXJPNO+wl4fzBaAUVlAeiJez5vuUHa0/nmDNgSpb3mLy8ypqoU6hGqWtQDoqWo
	oSmIcKDK9xxfC9hYck42jTEtAom6Y0KtDsSNi45LzP4qn0qpQ95jOBOJLBQUDBlWsSgrz/+pDkg
	w3zl74CmSduSbPeO7Ffsvh9/G/Yht2RNVF8L/pOIvU5hXlbx2V+q0k6+yZE2pG3P39f6bO7WYR0
	7a5S/4VdXL94x0jaTT5gNaUjVf0K+EEotEXQ4Z1EYcUwqL8LrCDIFgrC9lEDito47sk8eE+/cLN
	yJx9vTnfAgIhb1tpbTtCzFVEc3Dk84IOVasQ6b8lmIsuHxXcZ0mjfvA1fKeXJwlM2qSiUwWce2c
	QOfCe3tQHBJ2d2d+mTTdUZDYoiCrZjIm0nxAu4FGN88llzWN6a6okRVqgmfaUeFiss0kuWSQCPk
	iVgZ/CGGWmPYJr6Ux4xpZKRNwGgQxHQl+5O2wrQWAcSYy7+IT/gCh8jqEp5oNL14Q3ZKScDfWLZ
	Phq7ZAb0Ci2ftY1W7Dyn
X-Received: by 2002:a17:90b:57cb:b0:39d:f130:f8fd with SMTP id 98e67ed59e1d1-39df13108cdmr11368757a91.11.1789448494978;
        Mon, 14 Sep 2026 22:01:34 -0700 (PDT)
Received: from lawlee-vm0.d4y3nv5wwgfelhhopdxv1tqjld.dx.internal.cloudapp.net ([13.93.150.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e51449sm26872358eec.5.2026.09.14.22.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:01:34 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Alexander Aring <alex.aring@gmail.com>,
	linux-wpan@vger.kernel.org,
	linux-bluetooth@vger.kernel.org
Subject: [PATCH net-next v2 0/2] ipv6: update NUD_FAILED neighbors from NA messages
Date: Tue, 15 Sep 2026 05:01:30 +0000
Message-ID: <cover.1789448374.git.lfqlee314@gmail.com>
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
v2:
- Full implementation of logic to update FAILED entries to STALE.
- Update the RFC 9131-related comments and sysctl documentation.
- Add selftests to verify state changes only when the accept_untracked_na
  setting is enabled.

v1 (RFC):
https://lore.kernel.org/r/20260813233344.445265-1-lfqlee314@gmail.com

Testing:
- x86_64 current-config and allyesconfig builds with W=1
- tools/testing/selftests/net/ndisc_unsolicited_na_test.sh: 14 passed
- Local NIPA checks: all substantive checks passed
- Sashiko local review completed

Lawrence Lee (2):
  ipv6: update NUD_FAILED neighbors from NA messages
  selftests: net: test untracked NA recovery of FAILED neighbors

 Documentation/networking/ip-sysctl.rst        |  28 ++--
 include/net/ndisc.h                           |  15 ++-
 net/6lowpan/ndisc.c                           |  15 ++-
 net/ipv6/ndisc.c                              |  94 ++++++++-----
 .../net/ndisc_unsolicited_na_test.sh          | 124 +++++++++++++++---
 5 files changed, 201 insertions(+), 75 deletions(-)


base-commit: 272a65db243bfa34b9277632830e0e06d7e3518e
-- 
2.43.0
