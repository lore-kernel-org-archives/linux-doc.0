Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58BA813C3F2
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 04:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762921690; cv=none; b=FAGDHQOQ1grJhhb6j04imHlojmtNX5oRl1HDkX3UBjc2jISa5sjEOUYkAjQo58Cd99XmYFmH6A+2yjOeuBQ4dYhnn6ncJERtz1fgjBjrO8EzdWjmR/cRv//bOrtX1JMJDQieQdfPRqtku+oyofkh+X95QTDZKu2LvYpFp0mchDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762921690; c=relaxed/simple;
	bh=y29hhM9bDU990mFxxu/b+W/znqX6em5uaKBZyOrkMpc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Rfx+O+Jmx0MqIoyKs6p9EjHbphLz4HXEwX8Trd2CcmNwR/4zQOCgkg1qQV1ZTRiGEAeYD1/its7BHXi+EoKMmtXw8BXVIBiIEBk+Jenolqs9P5DVdWQGT9VjlhC8VkEgBhhP+qPvXbM9Fe1CWEFVrWjRjGPUThcpRs+EDn0mLGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e1YwtTMb; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1YwtTMb"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3437af844afso436418a91.0
        for <linux-doc@vger.kernel.org>; Tue, 11 Nov 2025 20:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762921686; x=1763526486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HWcPwvpyGHeQ7Te8LbmgWrzKDF0qH1U1PIJiFE/G1QA=;
        b=e1YwtTMbVuT8X1S15zaGGiDxW97fQdarMZ1wobpDWWt3YrkBJTMYbqwfHl/5kIwdcM
         vjdIIxIA3+LDjKVsnEeVfoyZhnH1rpcrWMGU5zHknszZdQ6Kk2nH4FRJ6tVU6uw6+w2Y
         KGMkuqPjWvRW8IdQ0vPjT6RvOdIWUDUHjdxKKXLTmPoOjcE/yUw8PJa1oTubLhDWeMos
         Yt1vDu6gNyrPCAHA0ioFdnsBxA4CJ1C2DnfdkvAQJeeODMEHkkk59afpE95xRVfcapnu
         0mbgtvMhcLwiXCdAYUyMTBVRAvOmoNkWCdrt/6D5smP2yFKgKHXLxAGHEan4CLJPdy2o
         peiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762921686; x=1763526486;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWcPwvpyGHeQ7Te8LbmgWrzKDF0qH1U1PIJiFE/G1QA=;
        b=l+AU8MMx39a+CFvDXes9XxrzWOjD/njY7dDOwpcGZZEZsXvtVCseIE26pq2uivOM9I
         1sQiFIEKlQ7JmvDgRMRuu60OxEot3H43ErrRIJS36thUfWexb5xDX7cOUlTO+AWHk1gu
         S7De6WbeCtqXAimP0tS3DI2P2qo+izl1sSGVjiEdE8k+ODxcHks6EFndw1PHMAGaj3o8
         m4IO8GFRIY72fseTJTxXAkuuh/EMb8/qmKw8AnooijjYf604o1WPS1fpwbo9mRWHjrZr
         vfRaVS30ep7REV+QHafpS9R4PVVygx7ltlrD/86WJYSYWmVY+GpCmfitr8jJNxxkoG1J
         ZDdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIhLECEncjSjS1HGDTk1I4aWoHMWmTJ4CWu+Mdm1ZXZd/sPK8FnaZG2fARdhyr4DS8mhIna5QnimQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzLdfCfIm/vuOYcfEUDZaRgJHUnkLLlkPq8TWjatyxdOeMomTj
	RXeoXnqsfKEuSRQVm8OdErpfLJraU0UEz1+rqujCbU/63gHeMVw95AAu
X-Gm-Gg: ASbGncvGPh4aVtsW+yFi1aPlY1Pzskj80mkz152HdoGxRJS6t2WvnuqC/eaD7sPIWYL
	jC86v2HROOCJVQMmGlwpWzGNtuRr9my2IhXcsxtzq++c9gcki7Q/6oVYpZDyzachviE1/iRZl16
	ATCKuUqwJGDQMziS7p6DBO1FBOGEIcqqsQ0Wje5bo+5/mbvBUgYjPokpCvBqvoHbzyLBMXQZIFv
	zQU1rx5wqzWSJAaosG80Cc5CMU0EuL1gm17MHgnIRAwLoBZI6Y5FTDvNGxuXk8EegP+EGmHhTMX
	wHDisVqBLzYc4LXa8lzJWPHe0zmwkeFsSSZIdUHhx3pJUMrBLJPkaqOk0B0K0nM+1YxtuZ35t6o
	0cum1xYDbULPWcLMtBqqtiGBka3/3bFOeqYhqF9AcErLZKDTb0ZruhjUElPYH3tRMJlaeqA2+dR
	VNCiFq3YeP5LIeErkRmTIKHv16y3pwLEj2zBNrhj4vdQVQ4rDaWm7brUWGgwsfV8TazDiCezx6K
	wi2wdxN4g==
X-Google-Smtp-Source: AGHT+IEW77FvieM+vtVkbmhzlz0RFLk71+mgtXTKXN86kZaDWUH4yy9113DxeoOKMAxSWBEyakVQSw==
X-Received: by 2002:a17:90b:590f:b0:341:194:5e7d with SMTP id 98e67ed59e1d1-343dde8b46emr1933248a91.24.1762921686366;
        Tue, 11 Nov 2025 20:28:06 -0800 (PST)
Received: from toolbx.alistair23.me (2403-580b-97e8-0-82ce-f179-8a79-69f4.ip6.aussiebb.net. [2403:580b:97e8:0:82ce:f179:8a79:69f4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343e06fbc0dsm854681a91.2.2025.11.11.20.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 20:28:05 -0800 (PST)
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
Subject: [PATCH v5 0/6] nvme-tcp: Support receiving KeyUpdate requests
Date: Wed, 12 Nov 2025 14:27:14 +1000
Message-ID: <20251112042720.3695972-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.51.1
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

Alistair Francis (6):
  net/handshake: Store the key serial number on completion
  net/handshake: Define handshake_sk_destruct_req
  net/handshake: Ensure the request is destructed on completion
  net/handshake: Support KeyUpdate message types
  nvme-tcp: Support KeyUpdate
  nvmet-tcp: Support KeyUpdate

 Documentation/netlink/specs/handshake.yaml |  20 +-
 Documentation/networking/tls-handshake.rst |   1 +
 drivers/nvme/host/tcp.c                    | 103 ++++++++--
 drivers/nvme/target/tcp.c                  | 216 ++++++++++++++-------
 include/net/handshake.h                    |  10 +-
 include/uapi/linux/handshake.h             |  12 ++
 net/handshake/genl.c                       |   5 +-
 net/handshake/request.c                    |  18 ++
 net/handshake/tlshd.c                      |  96 ++++++++-
 net/sunrpc/svcsock.c                       |   4 +-
 net/sunrpc/xprtsock.c                      |   4 +-
 11 files changed, 397 insertions(+), 92 deletions(-)

-- 
2.51.1

