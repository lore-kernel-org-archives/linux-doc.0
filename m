Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B581C3C1F
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 04:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760675014; cv=none; b=QvwMUhbR/Pu2vlHtAg+oY8gWOo0RYhqShdHdXdFDIMW4Lqq+Y2Qmvc9a0aKeKYxQALs1uQXcAiCmEO8cC4UOVrf/oAV6jECV6p7OCYmxfoCqEj0EGrE5d7eE44NJSM1dki6/toVwI+udLhSgoK9AHrR6gNXBltOngCbNBfpKzes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760675014; c=relaxed/simple;
	bh=xlTdYn3ctaCUjwm/bvJufu9sD/yMlLPgVKinrC/dKzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j9T6zXgwUbFGEN/lzHmiSq409Ll+7IMGvleSMsEk02i9aQDQsBlaiRkcBCG3hnUIZ7VdVq7c0y1Jp5b1UlaiPTxa+Z9R/PUheUAe7guFFRykequLdVtu7QBldcXnPueD53rIp+xMIV9NmHn0e5JpVKJuKW8YJTkIyNZQkzIA3II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NBW8AnPz; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NBW8AnPz"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3327f8ed081so1886262a91.1
        for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 21:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760675012; x=1761279812; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O1LD4bJtaXgmuHvhblZcw2cHe5FWG+R07TopH1OUOIo=;
        b=NBW8AnPz+hbH4/HO5YOBRc3Yjnv1tWdFqSxgniJU1Dwvn1AcrNgTvEuo1eAYASIoQF
         GSpXsfWEf7YxtxiqLTAnVnVNy3dZS/7sl0jCrjl/cQvdE0Wjqx+tx0hIkvbOSPrE2OTu
         DRGQoxeLXDZbt8LM6VbT9JGtW0ygFoXBJCgNATbqbIL8OcIG/c+H8xwBXdv74kFV6SgA
         KJhvpKl1KdbyHWgqp1zUMCR19OSxQV40xsx22E+RKI8gPDa7J0aZ9MU46/RLuRtt9ZYC
         yqXhPpfo/8cQqzIZuTCpG4MzfS0X2ingfEp1TiWt7umxd6h0TWdIzNoa3gkLuL5OhS6k
         INbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760675012; x=1761279812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O1LD4bJtaXgmuHvhblZcw2cHe5FWG+R07TopH1OUOIo=;
        b=QuNdTimTt+tN3P1y0UdrZ33TdyWnvNRfSdevikBbuHEFfD8qRbEu4gg9Xo3TbOs5k9
         QcQ3/jSkVuc6tKCmXFw2ZcwPe6Gs8Ie/xxsq8IxPqQzUd24OYlkjbu/hOe61kQ0oqBey
         yURfjL259wPYxU6mzCzwoPQraxHeJJIdnyq5XvfIs0qoJ9kdh/YEcGxb6E5kgENerw1F
         eu6OHYx7GV20twgCesknHY+6ov1JbgwKMxgi1C5yY5xi0bupn1DCOS4j4LVpTjmX3xfS
         DTXE7u1RnP05EQQGbmZbc4cfQN5Pb95UYX+bvAHdukyKuw9gWcjqdLQUgh+aFrmCN+9E
         ZURw==
X-Forwarded-Encrypted: i=1; AJvYcCXgHbzhX3Hvi4JgfImNHiRXdZCQzIhv4kR7pIjkdSa5RaEnleFXfGn4lQ015KGM/OpPfqCt5B5G2jM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJOc5d2tJ6cTGaK/oWnLrQwPt9NB6NU/DCJEJqHeIilFFJqJR0
	akqk1ePNez91o43UhmxTGokq1jdODGJKTFQIImKgXYFNQv2JqWQ0Oy/R
X-Gm-Gg: ASbGncus2Qm4pt0Rda//zePUROachReA0NO7vVvZzvvAuXaHGhu+wNW2mf36TjB7FL6
	F6B9UFsBrjO102s1mHw09ycA2ttm/uBdngFm5KxEFzWdaFuca6BWi4wQUvlGRyw/ilV5zn58wiQ
	jdUTmbXk1tfT/RSyZChlhvuao0sTpneYpBQBTC2Wcc/6fjnmUyhsO5m5Ju0n4x+n7UBQ+y7NASW
	S4aFzpHh1C7AgeFo2pm5xgew+bPqQ9fTjjBK9ttURUUYnASNnZBJ6VBRWycJrwtt51L263YcbdS
	LNz7gHHLVMEPFsjXSup1IAIrQ8/LTNsmL4QqpfZ0pB1pvRSYd9RmRXPz6NkJ4YsVQCuY8hXyTP2
	UGPM0gteetMX2CQXN5x2/PHpuEqz/eojZGtTvwkZ7EF3OL4QwiSE74mr7yAITZ7hiORBIXqRF3N
	BfrhqyY6jokrMO8wF3j3QgobEir/KltodwJpEHmN+e712Q5R9OFZjHLmvVmr65xnFNNmQ1GqUhM
	JpUUA+x7g==
X-Google-Smtp-Source: AGHT+IHf/fkMawdLEFWrxmlDZmQ5xGwA8hncSDzmuHZwevx77yhLGUBDFp3M4+pUOvAJ23AfWMIQvg==
X-Received: by 2002:a17:90b:4f:b0:335:28ee:eeaf with SMTP id 98e67ed59e1d1-33bcf8faabcmr2469604a91.29.1760675011886;
        Thu, 16 Oct 2025 21:23:31 -0700 (PDT)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33be54cad3esm245557a91.12.2025.10.16.21.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 21:23:31 -0700 (PDT)
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
Subject: [PATCH v4 0/7] nvme-tcp: Support receiving KeyUpdate requests
Date: Fri, 17 Oct 2025 14:23:05 +1000
Message-ID: <20251017042312.1271322-1-alistair.francis@wdc.com>
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

v4:
 - Don't stop the keep-alive timer
 - Remove any support for sending a KeyUpdate
 - Add tls_client_keyupdate_psk()' and 'tls_server_keyupdate_psk()'
 - Code cleanups
 - Change order of patches
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

Alistair Francis (7):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvme-tcp: Allow userspace to trigger a KeyUpdate with debugfs
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   2 +
 drivers/nvme/host/tcp.c                    | 150 ++++++++++++--
 drivers/nvme/target/tcp.c                  | 216 ++++++++++++++-------
 include/net/handshake.h                    |  12 +-
 include/uapi/linux/handshake.h             |  14 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 ++
 net/handshake/tlshd.c                      |  96 ++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 11 files changed, 455 insertions(+), 86 deletions(-)

-- 
2.51.0

