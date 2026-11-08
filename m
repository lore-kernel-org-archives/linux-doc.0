Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794118694;
	b=E7gKxDDg9MwZ1bCqusqD4iQ1P9oGuEeK2Kd13dO/oKDJfi4Li3aast14/SWfNzGRmZA4
	 6ba1rAQmR9Hpf0GVJvr36hCNDk9PL6O+yZNrJBawifgk+iYVUzCmauJyMzh26AEx8Xq0V
	 ifmg5mpvu6X97jR4Xwm+9xZQDrMzI8+p5XU28/PjkCVfLkJ/lTmGYg4z4A9oZOCSMDTWH
	 AQ2f67MY+YKD/czaG7GRF5uave9C6rloZhGhZ06T+ywUo7DgwNvK8awHkQTB40BqZ4rDv
	 oqO5nhU/GMYya8Cjl3TirI8hj9bKIKvC/pXo8Lx1KwrtVdye/S+SnZ6MyRXGUhyfUjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794118694;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Mcozko3cpjsd4Fb6V5y36/b9iev/kYzZlS9QuT6BrZc=;
	b=FK0sqQLIlYUoXil3ewFV2WUmEOQI1bL1tbSm91BuTo320aq15j2LLgMzzy5jSUYcqspJ
	 pS1QQpaSohFZCL6U+mTfu72BWL6EbWvEL/myVUeNf82cZqChaJbz74VAZNUNngy86VcLV
	 vOxqO4Bt9HJewbVToTXPNoEe1V4/WBwYvf1ICtRXPz46tkIsd/X4uT5AOVXCLH8o2Qlb5
	 nedmNy1FID7stkn/Ah6Q3hNSf2bywzPQwg7GFqvrPiOr4E+2b7IVnSnYVSELMedTbDbnO
	 RoRmVrJ3KRW3m5XFdISEclgxBJ12T+0bXqHfhszG4Xr4tu4qEb8WERmsTYtTF7K+n/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niXzWDD3;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AA7606A31C
	for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2026 06:18:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4AA7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=niXzWDD3
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1a2761c69fbso522078c88.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 22:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794118693; x=1794723493; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcozko3cpjsd4Fb6V5y36/b9iev/kYzZlS9QuT6BrZc=;
        b=niXzWDD37PKYpBFRkqWDTihy/W3R4h/GAC8tTa1OPPMrT58BdfYps9O1lw+lAHqOOW
         ndCpG4Js/Bs2q3kPesofjxYM79x8xFHQgdWGulBqUJRg9JZqUpfrkf4szH63lo1U4Lnc
         qPj/Gr4IBJtkGxSKu5stljLMdTzWuy3s7UCKRE3a3S1vcPkGKG61I40ttKPH965/EFqU
         RdgudLmgUiBKFVcb8fEK+mUjHJFN1QZWfCE4plGPJ883+3NM+1cJ9Y9PDmWnGUXA/SPs
         zR0pwZXFDQyNFf2vxTX4WNjiDC5u+G9yoC4aqZA9koFuFGYbiRU/hzOZ4lcC8q8D/HPO
         G7lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794118693; x=1794723493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcozko3cpjsd4Fb6V5y36/b9iev/kYzZlS9QuT6BrZc=;
        b=2N8BmvjbwAFezla/VryXMTF88ej2P9YMEas3hic5liZ5+/1WBejvZ64udoDZQaIz8t
         XIh3WzRhxMcHY+aQBWI4T2eBKfE1+iqi8FPi8IMliMd7FqyqosdNg6snjFTqGt6cCuC2
         4SyXDAVz/EE9PoNGEtcecJk1EAZmLgM15e7XXptYUdtG8MGWneFFKWKnJsnJfqwldviN
         s86KCR95vMgiZIE05utAVx5rHkKujvEeccZgHq6FpeMbvZv6AqWNEdEY9cuuqYF9V5Pj
         VvzikZUJHhljf3xKVCfxz4oRMptdKYO8rh3k/y0gqOmzwAy9lnBj7UKctehko0URLdgy
         iJDQ==
X-Forwarded-Encrypted: i=1; AKwUvBwyq3WAJO3IcNSlqAo+0arMZoXWW/gqzDpGXs/28NvGTmKjMEhD7LDTnj1coD+cUotxKDKlI1o0uXM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vNDubVaAC0rCSsucXxFNXkdCWlkIvie2Ff9U55CEJmbF+ygp2
	tmyO23hMgqEYHsgfH4tUfxU9Um6kAYITBZRUBOfImXj3/BKV63xjZCmjgyRemHI0Kqs=
X-Gm-Gg: AYBFou1Dqtpt4Y/NCe+8b9wOxv2ci2+ik26bv9pvuUmRj99HHeTNtJhmE400zdFRqMv
	+gXNGvl3j1fJQ4q2c47pHnmmdA2elW0Aojg6bU8oamvZ2tfBRPkvOk6jjd2uvcUPaTmsHOzOFzz
	ZhqqgDfPqaPuolA61bRFg1MSMxWkCL8VqACE0EKkz2uh52DDiBegN+CpdIV5L9SYE2RnlBiOYkR
	M7eVXb53GoYO3LIAtCXHuvQbJDef6I1S5DFCCrIhbnMEP8YyLPOf/fthXp9Aoty2BAix0VdCDyE
	gEOGff8V8Ngd18kC2Xk2svYa+Ysb1dIzeg7nYXDiWyPDow8sYL6FYPgC9MwpwMdK3qvBl5wYuuw
	Y6MNfbadyA04kln5BncLhVDhf2L05VAoAgvQTrLlfCK7bPx0f9HNZ2dGagkKx5cB6cop5amdmrs
	L/OspikqTJccQRaTU54wBAc6n/OMt84R2q8H4pAeR7nnagQZcp49HhoKupnZKcyKqCngseJr7PY
	AgMado1U0gRGoF8j7/qb861713RceY2gytv8oFKkHk/HfIOpS2hFuPI4pniCamS9314GEoLpH4O
	OXpCldgp31fyfJgQMP7bkLEQ39XfAu9o7xxELGvX1d1/d1EdrQbKkxipgCHjTFUWIEk=
X-Received: by 2002:a05:701b:42c6:10b0:174:cf1b:235c with SMTP id a92af1059eb24-1b39fed16edmr1123611c88.43.1794118692861;
        Sat, 07 Nov 2026 22:18:12 -0800 (PST)
Received: from LAPTOP-KD1TH5BD.tail375eb4.ts.net ([47.11.96.146])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37314626dsm4838725c88.1.2026.11.07.22.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 22:18:12 -0800 (PST)
From: Gopal Malaviya <gopalmalaviya53@gmail.com>
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next] docs: net: fix outdated default values of four sysctls
Date: Sun,  8 Nov 2026 06:17:46 +0000
Message-ID: <20261108061746.32090-1-gopalmalaviya53@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The defaults documented in ip-sysctl.rst for four sysctls differ from
the values the kernel actually uses:

  sysctl                  documented  actual
  cipso_rbm_strictvalid   0           1
  flowlabel_state_ranges  1           0
  router_solicitations    3           -1
  regen_max_retry         5           3

Each one went stale when the code changed and the documentation was not
updated, or was wrong from the start:

- cipso_v4_rbm_strictvalid has been initialised to 1 since CIPSO was
  merged, while the documentation added with it said 0.
- Commit be26849bfb6f ("ipv6: Disable flowlabel state ranges by
  default") changed the default of flowlabel_state_ranges to 0.
- Commit bd11f0741fa5 ("ipv6 addrconf: implement RFC7559 router
  solicitation backoff") changed MAX_RTR_SOLICITATIONS from 3 to -1,
  meaning that router solicitations are sent without a limit. The
  documentation was not updated and never mentioned -1.
- Commit 76f793e3a471 ("ipv6: updates to privacy addresses per RFC
  4941.") changed REGEN_MAX_RETRY from 5 to 3.

Update the four defaults and note that -1 means no limit for
router_solicitations.

The mismatches were found with the help of an AI assistant (Claude),
which compared the defaults documented in ip-sysctl.rst with the values
under /proc/sys/net on a running kernel and with the initial values in
the source. I confirmed each value with sysctl on a running kernel and
against the net-next source and the commits below. The commit message
was drafted with the same assistance.

Tested by building the networking documentation with
"make SPHINXDIRS=networking htmldocs": the change adds no warnings and
the four defaults render as updated.

Fixes: 8802f616f6de ("[NetLabel]: documentation")
Fixes: be26849bfb6f ("ipv6: Disable flowlabel state ranges by default")
Fixes: bd11f0741fa5 ("ipv6 addrconf: implement RFC7559 router solicitation backoff")
Fixes: 76f793e3a471 ("ipv6: updates to privacy addresses per RFC 4941.")
Signed-off-by: Gopal Malaviya <gopalmalaviya53@gmail.com>
---
 Documentation/networking/ip-sysctl.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/networking/ip-sysctl.rst
index bc22400b53..0b7bfbd98a 100644
--- a/Documentation/networking/ip-sysctl.rst
+++ b/Documentation/networking/ip-sysctl.rst
@@ -1587,7 +1587,7 @@ cipso_rbm_strictvalid - BOOLEAN
 	- 0 (disabled)
 	- 1 (enabled)
 
-	Default: 0 (disabled)
+	Default: 1 (enabled)
 
 IP Variables
 ============
@@ -2418,7 +2418,7 @@ flowlabel_state_ranges - BOOLEAN
 	- 0 (disabled)
 	- 1 (enabled)
 
-	Default: 1 (enabled)
+	Default: 0 (disabled)
 
 
 flowlabel_reflect - INTEGER
@@ -2956,9 +2956,9 @@ router_solicitation_interval - INTEGER
 
 router_solicitations - INTEGER
 	Number of Router Solicitations to send until assuming no
-	routers are present.
+	routers are present. A value of -1 means no limit.
 
-	Default: 3
+	Default: -1
 
 use_oif_addrs_only - BOOLEAN
 	When enabled, the candidate source addresses for destinations
@@ -3034,7 +3034,7 @@ regen_max_retry - INTEGER
 	Number of attempts before give up attempting to generate
 	valid temporary addresses.
 
-	Default: 5
+	Default: 3
 
 max_addresses - INTEGER
 	Maximum number of autoconfigured addresses per interface.  Setting

base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.43.0

