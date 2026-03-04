Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9093559D3
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 05:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772602588; cv=none; b=kIjooI1ZjQNnbNyavfhkCfxgXh9qsik6Xnzoc4lrw+c71XbLRl8m56R4EmOSOjlch+fry9ir8AMQze8xTKUGutHNoCuGMRYX+1a/bM0JQ0Y8hEs19td+eI8qD180HJheMdb/T5ghlQSXJWVZW2WzshNQ7IgCAwYNj/Z0ftfajfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772602588; c=relaxed/simple;
	bh=DdGnEi2MIzcNo3q2Zph5X3WR+wOdcO1pfRapVm1aFa4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QvVjfXtuUUO1YCbPxXkgnsU2dCTgQ1hWR5matraeoiTJC9kGF3pEydCNC84ikhrUzwrqvbVRc3WJ4CnwzwarYLTxmwDNiDsNFl+4vfvtEZ1gbweORuCL6WFisbDvrWgO22GsOFlAqsii2yYKtnHmAgprOWvdAuUdXeNw1sHfzFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuTlsCCG; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuTlsCCG"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3598c1ad542so1837095a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Mar 2026 21:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772602587; x=1773207387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tBaAO3EhPpnhGGnT8RJsqBThiWnEysWAZzlV8WTFAvE=;
        b=OuTlsCCGosBzUauHhHv5Nr7SBeMDsCXXi/oaeAz4l/KEd7iFMpPBEJqJt7TcTTKxK8
         8bgrhiFB+b/UTAMcuxQeBoSACq+7yzePEhALqejpcZBMoqOndRG4fy+qqqf4VqKdg3N0
         DLy9URN+ZQxO3oiDhjabuDFyfSTFTcqttQwibmZVH3nfZqC6y18Js3EO1IjpyLkPVgat
         c/eio31GNapjWF1nNIsDCajiAmzky0aU01VIp4LMWYdRVwsJX0cGSfpJmRf+1easyKDr
         WdLdQzVlIJm91LxptvPCU7qzjKnesnqfjJ6o2lIVlvVfrjW0eOs6TA2P+uF+k7noTs/v
         Yy1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772602587; x=1773207387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBaAO3EhPpnhGGnT8RJsqBThiWnEysWAZzlV8WTFAvE=;
        b=srbHukhfACNmPbuzpagoKAAO5rQ4aWVR4HOnGp6Gr420YbXLweM8zaFa2d5bGdUDfY
         ArczESvDskFP5r04HHjKseNs2JOgRfP/kIq9koR3xAcUYAE1HSWcT761RFbgWAJknej7
         4Gerikm3G4U3dx83lXgrfo08Ds8bNRfcmgyaHLL9unjmN8JyujVjqFs3ha5NNnvpQtdM
         oMVSVrcRcRGbjSS8794nGNf0RYOcDHGZqcsxNpW6BJNbH+yoO+Zx7pLaJRSWAY+Z0c/5
         cKfJOdZNCKq3AN/lGct7G+Dk9rX3Whl1mag/u2fDyYtmiXoBZzVTbekFgmdm45mA/11V
         ItWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSXEGmwmotyPXSuuqf1yeJxexDdPDvtU9azsX71GjYSzBPKxLLeuJ3+t1YIkuJRTKdfkfU/OPrimE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSGgPsNSH9fOXwAwamqjVD1c2J8FQsJxhjMOJ6TuGBNB2+BTYZ
	m7/v/EPz48JGt0mEi2vo+Tis882PO2BuAxpIUNkgmsz1KP/2PytaPlnLzL/2ZA==
X-Gm-Gg: ATEYQzyknWaQ/q6gJD8ZaU5ZFP0+cGzVzFfhZ3PAXS655Q8nEvk93QlnIBUAAtTUnIE
	2pcp14U8z8YHr7kPWLqH8nE6xTbkgZ2dUnfjtdrRve0ixBuvTphV4NFQc6qwN1GTZ529QdD2S3H
	fAJDvU2zN5DC7uvpXt3yuTF7dkTmwSNadfTnh1U+6mChMCBP8qfzHtoGpFtbGBXaib0rmfC1Gyo
	i+n2my7kV67fM10ewq+NslmN3QSa4EPst+sPeE799eU7W9F9+4KZBlotDEFBG/9LYcB/A9Zk/vC
	7R6De0rB50ahZiJfsFpMMEhKl+/P1CfB/Jj3cU94hJ5hgXL0mkkJqh3wjX9Rt4klF60abHHShfG
	vQmqnBr1aMGoJpa1TynoDjraHgxube6A7uOPt0TeD1fFWJA4bmUpX7H7elVVF4JGdN163jo+YHP
	mvjYe8fGHPFvIwwpeWCzAKpzOgNcwFqliBMqb/6PmH1A==
X-Received: by 2002:a17:90b:3952:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-359a69aec32mr1042348a91.6.1772602586933;
        Tue, 03 Mar 2026 21:36:26 -0800 (PST)
Received: from toolbx.alistair23.me ([2403:581e:fdf9:0:6209:4521:6813:45b7])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c090bfdsm4020057a91.8.2026.03.03.21.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 21:36:26 -0800 (PST)
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
Subject: [PATCH v7 0/5] nvme-tcp: Support receiving KeyUpdate requests
Date: Wed,  4 Mar 2026 15:34:55 +1000
Message-ID: <20260304053500.590630-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.53.0
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

This series depends on the read_sock_cmsg() kernel patch:
https://lore.kernel.org/kernel-tls-handshake/20260217222033.1929211-1-cel@kernel.org

ktls-utils (tlshd) userspace patches are available at:
https://lore.kernel.org/kernel-tls-handshake/CAKmqyKNpFhPtM8HAkgRMKQA8_N7AgoeqaSTe2=0spPnb+Oz2ng@mail.gmail.com/T/#mb277f5c998282666d0f41cc02f4abf516fcc4e9c

Link: https://datatracker.ietf.org/doc/html/rfc8446#section-4.6.3

Based-on: 20260217222033.1929211-1-cel@kernel.org

v7:
 - Don't use recvmsg() (see [1]) instead use read_sock_cmsg()
 - Remove reviews from patch 4, as it changed a bit to support read_sock_cmsg()
v6:
 - Don't free handshake request on completion (handshake_sk_destruct_req())
 - Add handshake_req_keyupdate() which reuses existing handshake request
   for a KeyUpdate
 - Other small improvements and tidyups
v5:
 - Cleanup code flow for nvme-tcp
 - When using recvmsg in the host code first check for MSG_CTRUNC
   in the msg_flags returned from recvmsg() and use that to determine
   if it's a control message
 - Drop clientkeyupdaterequest and serverkeyupdaterequest
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

1: https://lists.infradead.org/pipermail/linux-nvme/2026-February/061252.html

Alistair Francis (5):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_req_keyupdate
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   1 +
 drivers/nvme/host/tcp.c                    |  80 +++++++-
 drivers/nvme/target/tcp.c                  | 213 ++++++++++++++-------
 include/net/handshake.h                    |  11 +-
 include/uapi/linux/handshake.h             |  12 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/handshake.h                  |   2 +
 net/handshake/request.c                    |  97 ++++++++++
 net/handshake/tlshd.c                      |  97 +++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 12 files changed, 467 insertions(+), 79 deletions(-)

-- 
2.53.0

