Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8635319D8A3
	for <linux-doc@vger.kernel.org>; Fri,  3 Oct 2025 04:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759465929; cv=none; b=UCfzDMJX+Xj1njQW8DikaVNrHgOQ05vHjLU4rOW2LXJC+fy4xG8nqCUa2LAyzvLaSaaRSLQtVTtjWuzlN5+HPU2bT+kJ7T92/LjvjyX89Od3hXIxlb1WHA2QVXe99ZY9rzmBFRzh/xGfSvRpZhR38YWH8PN9XCPTWdtpxEYW3i0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759465929; c=relaxed/simple;
	bh=30M2SYEXKiw8WZzmkL6ySmGYOxUGhfy4zZB7sDxdVWw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m3cLwCl4GSsE4evAzmw/ds2+Oh10V2gpBiY1JzPIc0hxGkRYx/KCmFVgXEt/Opjr9mdIpwBukOzJuI0aws4c01aCf9I8WS255BG+7UFWlBjsJLG77B+YCMO6m7jS0EySgVLug0IOwyB+5nnRXBGvIoOGRBwLER9av13ed/U9n0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iYpGAH/S; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iYpGAH/S"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3381f041d7fso3174669a91.0
        for <linux-doc@vger.kernel.org>; Thu, 02 Oct 2025 21:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759465926; x=1760070726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6iRWbJphARTg9SH+UGYwTi095jj0E6vFAKoyN/er2gY=;
        b=iYpGAH/SFZ8QkF20ILCrWlpLWt6sbMpb2k6O6T84bvuQJVr++t8eaFw1mLUloM4dNJ
         UB4jXec8ikitL7+SYkaM+REusJ9c70Amel/qFZejZFDG4A0XXpI8xpLnjumhnAZkEzsQ
         9ecj15rKKNfAwQ2QwQDb3DroX5VYqh/GgF72bDjXrrJcadRXb8djNo+8gQChn+9lZ5hd
         DoqFCHOGpSYnb+3ilKVXc36F0UaY7lsjmTzOISGuJ7EVWS7aI569CIaOSCMCaKscim0i
         k4WUIUtFBH8pDeZBAcM65RTY7F1BmCP1XZ+21pUuUPuB+UD+ere8QEfP7LAMLFgDSvU2
         /i7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759465926; x=1760070726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6iRWbJphARTg9SH+UGYwTi095jj0E6vFAKoyN/er2gY=;
        b=w6qW+33361RwP7ELOclmzOa/blGjD1HCMc8m0tJ7LHMSX8ttH1OeuEl2ODjt2dlV1J
         HqcpcY6i8YLlF8h2RJLIfph2mOUdOK50UhEkaQa4wQC0OEVBldlOc0L+tditjqn8fAu5
         DRBiuavWwHVOWqeCQ90bVPxt64tIsRHGri3in6Z6STPetJaoIXPE+5osp1u8CXlbYYR3
         zDH2krv75SnENYGVv2mVMXFYRVhrZ7vgjNeM43Gw+RHIK4hGsVzteIS6Oye7zDaW/W2L
         NwceoFKnCY8CZe3gGWtbSOQSY00SH59FDMNOg4dTfVEDKiPJE5i/XT4VoNqoOfhLHOW6
         TrHg==
X-Forwarded-Encrypted: i=1; AJvYcCXFoIr3GBHIIS4K9oRpgk1td+EojhNKyzsxoaVezxM8baD5y2QeuEVYjUKHcQvYo6W6dusBNtJYwjg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzGCbD7GFEa0UU0ih0rOvFGBmiPoWd2j69ghV3B5lqUHO3bRKx1
	k/GqYL+22XSBD8KpNevmsIYYeosuFkPZq5nmpfR7kVzS39FptJncu59+
X-Gm-Gg: ASbGncuUbjQkYC+3P3rGvfi7Ic7Hxwy6gGTBZ2dGSfUhcQYJKHmdfyssbr9vri+gfvj
	knbKeyBqu8iVKgR42+ToYnBMll4J8MJhwqzEF00BbGlV45+WglPeH3b510W2GSuYMreB+t59Sz1
	MBd0QoQpmdp1wJ2KtL4dyoz4rNzzVmRzVlzcvGu3McD4QFmBGPP+5/ss+8CO1/DeeiegQnuJ6lR
	QWAV02sLQrPrhHV1mTgvgpdOjnRLHkfLE3aGCQMrfMjGOOIbjNFxLeENqkI4cs+VriaOfjIR/Nw
	fAMFf3C1VBiTaP9mikOjtgWDYHNl7TrsmzjfoY9Jsw+2xBMoqcg4lCfRA7mxySB1bk8RP34QN0S
	FW/AQHVUwcl1YbTPnBuSLKBU4vDEEralRq800k3zBaOTgQFeuqI5VsCGqYWfsBN51dk9nlvSvKA
	G7IorAjOFh+kX2fVNpIQjm1Bgr5eksgRcYL8lItrMrXQ6avy1JivbO
X-Google-Smtp-Source: AGHT+IHzxGQNHei00u1+ginjgv2orHJOxfjQE4QOoj8gcgp7Hp+3jzZDnna3Wuw+xDdTBAA6cpxSvw==
X-Received: by 2002:a17:90b:394d:b0:32d:fd14:600b with SMTP id 98e67ed59e1d1-339b5092b52mr7933152a91.7.1759465925666;
        Thu, 02 Oct 2025 21:32:05 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-339a701c457sm6528233a91.23.2025.10.02.21.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 21:32:05 -0700 (PDT)
From: alistair23@gmail.com
X-Google-Original-From: alistair.francis@wdc.com
To: chuck.lever@oracle.com,
	hare@kernel.org,
	kernel-tls-handshake@lists.linux.dev,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-nvme@lists.infradead.org,
	linux-nfs@vger.kernel.org
Cc: kbusch@kernel.org,
	axboe@kernel.dk,
	hch@lst.de,
	sagi@grimberg.me,
	kch@nvidia.com,
	hare@suse.de,
	alistair23@gmail.com,
	Alistair Francis <alistair.francis@wdc.com>
Subject: [PATCH v3 0/8] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri,  3 Oct 2025 14:31:31 +1000
Message-ID: <20251003043140.1341958-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alistair Francis <alistair.francis@wdc.com>

The TLS 1.3 specification allows the TLS client or server to send a
KeyUpdate. This is generally used when the sequence is about to
overflow or after a certain amount of bytes have been encrypted.

The TLS spec doesn't mandate the conditions though, so a KeyUpdate
can be sent by the TLS client or server at any time. This includes
when running NVMe-OF over a TLS 1.3 connection.

As such Linux should be able to handle a KeyUpdate event, as the
other NVMe side could initiate a KeyUpdate.

Upcoming WD NVMe-TCP hardware controllers implement TLS support
and send KeyUpdate requests.

This series builds on top of the existing TLS EKEYEXPIRED work,
which already detects a KeyUpdate request. We can now pass that
information up to the NVMe layer (target and host) and then pass
it up to userspace.

Userspace (ktls-utils) will need to save the connection state
in the keyring during the initial handshake. The kernel then
provides the key serial back to userspace when handling a
KeyUpdate. Userspace can use this to restore the connection
information and then update the keys, this final process
is similar to the initial handshake.

This series depends on the recvmsg() kernel patch:
https://lore.kernel.org/linux-nvme/2cbe1350-0bf5-4487-be33-1d317cb73acf@suse.de/T/#mf56283228ae6c93e37dfbf1c0f6263910217cd80

ktls-utils (tlshd) userspace patches are available at:
https://lore.kernel.org/kernel-tls-handshake/CAKmqyKNpFhPtM8HAkgRMKQA8_N7AgoeqaSTe2=0spPnb+Oz2ng@mail.gmail.com/T/#mb277f5c998282666d0f41cc02f4abf516fcc4e9c

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Based-on: 2cbe1350-0bf5-4487-be33-1d317cb73acf@suse.de

v3:
 - Rebase on the recvmsg() workflow patch
 - Add debugfs support for the host
 - Don't cancel an ongoing request
 - Ensure a request is destructed on completion
v2:
 - Change "key-serial" to "session-id"
 - Fix reported build failures
 - Drop tls_clear_err() function
 - Stop keep alive timer during KeyUpdate
 - Drop handshake message decoding in the NVMe layer

Alistair Francis (8):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  nvmet: Expose nvmet_stop_keep_alive_timer publically
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate
  nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs

 Documentation/netlink/specs/handshake.yaml |  20 ++-
 Documentation/networking/tls-handshake.rst |   6 +-
 drivers/nvme/host/tcp.c                    | 147 +++++++++++++++++++--
 drivers/nvme/target/core.c                 |   1 +
 drivers/nvme/target/tcp.c                  | 104 +++++++++++++--
 include/net/handshake.h                    |  14 +-
 include/uapi/linux/handshake.h             |  14 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 +++
 net/handshake/tlshd.c                      |  47 ++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 12 files changed, 349 insertions(+), 35 deletions(-)

-- 
2.51.0

