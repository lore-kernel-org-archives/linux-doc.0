Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037330;
	b=mQQ2CGrdMBMpn+SK2fJekEcgzbKm4K0Osmgj+itpipj1JibzHw1BDLHzHkDSx68KlGJj
	 FjoaqAizzckTpaGCbc3BlZmUiuctiD1ZEO65ej9KnjtA66Vp1aO+0Qx4ue8EXSlghOPnW
	 9rfcvDRdxNOsfgPEVNOeMnGk6nUycSlh6lqFsjL/EXfvcjIlbi/9YzjNVRZstgVX6CRgr
	 VJrWSXO6Gb16E1zCFEFXB3fMlZGGulL67XErusC0ztsZ+n1yvahqeJ/E9K4ERAkP4P+hq
	 IPy3VmZFKOrdx5EIANzvGq4HP/TQAnO9imUD4XbyMyx/hD4zrv52nooVV5o2gCSAl4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
	b=fg4IUA9Cv1uCZlKZmZCmQ9HHCLTQH4G8S7+NVU7nVSwqICEJoUHQZYeFgGwcAmh0sMNP
	 QGc/5toAAxCxxXO8GYfqhsvNBD7GOLvxX0ib8u9ApFgDv/lP9/b2SV4h+oifqwgbUStXQ
	 YbyeWVheV0wmMc5F75wJAFuyQopN3Ap89NqxcasBfzSXhXOxPR+rF/IrvE1TfP9hv0MjQ
	 M4FRqKHG+b99w11LTMWH2cACglra6qOWdcoSoW0XZ4+6XAsyJ4psFFqOib2ZHfELlVBbb
	 X8hHk63eAiyJhRrNLV9jTE7JR7KU9gdPQkW7JwUcSXE8ZEjO8+aCbx9KAveZJBY04xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OamzoJbL;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B56606A325
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:28:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3B56606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=OamzoJbL
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so890004241.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037329; x=1795642129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
        b=OamzoJbL9uxjeznOyamyEJPum8bSRzXRjYlCzZLURlPdu+bET+SL96zAc0amHZw74w
         Ls8sLCgyWz7UeAOt1aeaNSEVB0WSGIqARJ/AqvqrElfpbhrNqY4nz8bhZPlCJnZsoBVG
         4meE12uFE8V563KmzfQJBho02GI9ZHqRHEoHFExj6VTqyOUdtltEI/921TA8KDu9uqeS
         RJRJHdgouAAehrM44ztE6RQDdN9QBi+E2EXFc5W02W63aimScMoeX4xHguu5g8VFWAU9
         dbSVTj2/q/wTNQdXzxNuotbpd6GoS1hLZq9YasC1nIJOGCWHD2d1rpLsR5Mppr3xfuJD
         VrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037329; x=1795642129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RinnfRqFmJMbnCr6d3DXp7w2qk/BhwlH7a68zOSwViI=;
        b=2ruzN/mX4+W3AfoIz7UgBBv1bnSJXBnWaJ52QhQc13wFKbZJCj3M71bzC/yJcHZdd1
         7ZGmsBO1me9/1Aqf7OjSKgAD7QY/peoYfcMUYzKixJykpgnyxKQLKC2ng8AyMeJhROrK
         5GxMMiPPd2Gv5IWq/5PsfwzfoImd3iKNZSNTa4VbLAymRT8YakoWK9tUQl/SjgaqS6bo
         btJXtDIUGN27E7RDA/LoLNvPwSlzNs5iuvwtREYhmEqO3E5ShuHPFyP7B/w7RA32hzsz
         75IoAfU3dqhoOVWOKO/jpjvYxIR4lgoAi4y8Ydp2/gDFLKndIxgdrbGFyAgC7AFlObuL
         CVrw==
X-Forwarded-Encrypted: i=1; AL+hErEWUvCoLZecdHNrjGdoaTGxmi37ZnPeRHwKqDu2j7D/DW/wNWKpj6NcznKgJu1zF3xJZPAIHuOsFH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MaUfKVb56ZgNAMsUtxHK3mGWb1QNZNTG+EcnVlMnMAbRiR2a2
	ugUyQSwbkv1p+vZBXQDh5UWuduQssWPyX+lLI2SWktWmczIAJZ0QYReOsYJSJ4FbtK4=
X-Gm-Gg: AYBFou2HdoTJmkk153bxeK0W+FRx5TfobN0b5UWsGK5J1GWbWpYVETBoRsWVgezgOX0
	3QywdqBe0IADHqFulpc+OKGmNBpbM25+qxSrcFWDf3FWpcNcT2bQqb0WoRCzLiHIfIs1rwUo2Js
	i7R95UgxZBPM4bKS59ku/BBByl/sAcHM1TQhexN+VHEs25ar9eqAOcPxxDxZw5GTudOabkoljfu
	PLqcxQKIcYLwHndCrvbj5hfqXHDuYGG29JA9lFH73T28t9LvwZma+WcgGod8BsChRBjonOnE1sG
	z/esiwffh+dmBlTvjxwWGY34EWKkpUB+qNnUi6wX/pk9wD6/WWTUxY/d3DXLzNMS1wrs4brUtkm
	3CFmFe45fvGZ2ruu6BT5kIh0GL573EgQ3+7NSdedxKXdydczxvWDBAy5dIJAoIEilhrANtbIeJu
	aQOfYrYMh6nS5LVVolgKkN3oWX9JysE4zSiXgEnsOi3bqnx3d4zzpP2B2FJZwhWyghvXbHjhrmU
	g5FvJ8CswSxu5SU1OxFUVnp5vdmC9s1asl20z8sjPIUXkfo7K9jRCbfER6Ge9fqejrq/OmgbOye
	HvBqTUnxlQ4hdLRLxDz+IRXB0ozvUIb+oIDTq016QtRUMgt9RWlL2+RbrPIaQnCjye8C3cNYTnZ
	LM0IaR+8FlPI7WqkKf59BzV96jV3546SnyQTzZfpch4qyE9l0hvPt
X-Received: by 2002:a05:6102:4455:b0:7cc:25bc:3b30 with SMTP id ada2fe7eead31-7d6ba438d36mr1283355137.21.1795037328579;
        Wed, 18 Nov 2026 13:28:48 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:48 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 0/7] liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl
Date: Wed, 18 Nov 2026 16:28:35 -0500
Message-ID: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
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

This series adds the LIVEUPDATE_SESSION_FREEZE ioctl on outgoing session
FDs. Once frozen, no additional files can be preserved in the session
and repeated freeze calls return -EBUSY.

Currently, LUO freezes sessions only during reboot(LINUX_REBOOT_CMD_KEXEC),
serially under global write locks. On hosts running multiple workloads
such as VMs, freezing sessions early under their per-session mutexes
lets workloads freeze in parallel as they pause ahead of kexec,
reducing blackout time.

By default, session lifetime remains tied to the session FD: closing
the FD before reboot unfreezes and unpreserves the session, while
keeping it open skips late auto-freeze at kexec.

Userspace can optionally set LIVEUPDATE_SESSION_FREEZE_COMMIT in flags
to serialize the frozen session and its FLBs into the outgoing KHO state
immediately and transfer ownership to LUO until reboot. Committed
sessions survive closing the session FD, allowing processes to hand off
preserved state and exit prior to kexec.

Overview:
- Patch 1 decouples luo_file_freeze()/unfreeze() from
  struct luo_file_set_ser.
- Patches 2-4 add lazy block linking in kho_block and incremental
  serialization for LUO sessions and outgoing FLBs, dropping the
  separate luo_flb_serialize() pass in liveupdate_reboot().
- Patch 5 adds LIVEUPDATE_SESSION_FREEZE and
  LIVEUPDATE_SESSION_FREEZE_COMMIT along with uAPI and core docs.
- Patches 6-7 add unit and multi-session kexec selftests.

This series is based on liveupdate/next commit 079c138d2b68 ("Merge
branch 'lu-pci-preservation' into next").

Changelog:
v6:
- Rebase onto latest liveupdate/next (079c138d2b68).
- Replace "publish" terminology with "serialize" across the series (Mike).
- Drop kho-ro concurrent-reader prep (ordering helpers and
  kho_block_set_it_append()), deferring them to the kho-ro series (Mike).
- Tighten commit messages, docs, and address remaining nits from Mike.
v5:
- Rebase onto latest liveupdate/next.
- Replace reserved field in struct liveupdate_session_freeze with flags
  and add LIVEUPDATE_SESSION_FREEZE_COMMIT.
- Add incremental KHO serialization support in kho_block, luo_session, and
  luo_flb so committed sessions and their FLB dependencies are serialized
  immediately on freeze, dropping the separate luo_flb_serialize() pass
  at reboot.
- Keep luo_session_freeze_one() / luo_session_unfreeze_one() in Patch 1.
- Update Documentation/userspace-api/liveupdate.rst and kernel-doc.
- Drop v4 Reviewed-by tag on the modified freeze and selftest patches,
  and expand selftests to cover both uncommitted and committed freezes.
v4:
- Split out a preparatory patch that drops struct luo_file_set_ser *
  from luo_file_freeze() / luo_file_unfreeze() and moves file_set_ser
  handling into session serialization helpers (Suggested by Mike
  Rapoport).
- Few more nits from Mike.
v3:
- Renamed session->frozen to session->user_frozen, - Pratyush
- Added Reviewed-by's
v2:
- Rebased onto liveupdate/next and split out early session freeze into a
  standalone series.
- Dropped struct luo_file_set_ser * from luo_file_freeze() /
  luo_file_unfreeze() (Suggested by Pratyush Yadav).
- Unfreeze the session's files if luo_ucmd_respond() fails in
  luo_session_freeze().
- Updated reboot-only wording in luo_file.c kernel-doc comments and
  added incoming session -EINVAL / invalid flag selftest checks.
Link: https://lore.kernel.org/all/20261105050053.3063001-1-pasha.tatashin@soleen.com/ # v5
Link: https://lore.kernel.org/all/20261015093816.2438942-1-pasha.tatashin@soleen.com/ # v1

Pasha Tatashin (7):
  liveupdate: Move file_set_ser handling to luo_session_serialize()
  kho: link outgoing blocks lazily in kho_block
  liveupdate: luo_session: support incremental session serialization
  liveupdate: luo_flb: serialize outgoing FLBs incrementally
  liveupdate: Add LIVEUPDATE_SESSION_FREEZE ioctl to freeze sessions
    early
  selftests: liveupdate: Add unit tests for LIVEUPDATE_SESSION_FREEZE
  selftests: liveupdate: Test LIVEUPDATE_SESSION_FREEZE across kexec

 Documentation/userspace-api/liveupdate.rst    |  20 +++
 include/linux/liveupdate.h                    |   2 +-
 include/uapi/linux/liveupdate.h               |  38 +++++
 kernel/liveupdate/kho_block.c                 |  38 +++--
 kernel/liveupdate/luo_core.c                  |  10 +-
 kernel/liveupdate/luo_file.c                  |  76 +++++----
 kernel/liveupdate/luo_flb.c                   | 102 +++++++-----
 kernel/liveupdate/luo_internal.h              |  15 +-
 kernel/liveupdate/luo_session.c               | 151 +++++++++++++-----
 .../liveupdate/lib/include/libliveupdate.h    |   1 +
 .../selftests/liveupdate/lib/lu_utils.c       |  13 ++
 .../testing/selftests/liveupdate/liveupdate.c | 107 +++++++++++++
 .../selftests/liveupdate/luo_multi_session.c  |  36 ++++-
 13 files changed, 473 insertions(+), 136 deletions(-)


base-commit: 079c138d2b6870bb658b6e638077264aefc03833
-- 
2.56.1.708.g77570a6a1d-goog

