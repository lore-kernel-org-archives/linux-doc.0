Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793704503;
	b=OJruPxMJUXCUUK8VXJCPwUmUr+Z+nyW9mkZr63gZGiftE8QwyMw7kpEeq6idiz81iRtN
	 oMDc5w9dB2ylfqxdVpdCW8EiAFBbtdsa65qrLZScLw+zWEB55bJoStVuT8PE/ARua2J6d
	 S9D7H5tE7GCbBD+USCBBR/mH3OJknvx1cvVK0qFOiKtv1IVWk0EX87Cxld9XQCyoy85+G
	 fMWCMNat1y0/TjUPoP1g6GvCQS0tuQaWovE5ottvflQoRuk8NGjq/afOMifnd5vP7GxTQ
	 zgTzlQ7uq2uojcK2PRGiN5Upi0LHkZS1F7pJJ44Di6MwIfdvR+IAS3y6faQmkZAuqog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793704503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FqFkEa1Wf24oHm/ydD3AaExm05JqCxeJcFBeUKnuAzg=;
	b=G3/2brCAE150DU6qc2Hl0AdZGCw1ctpQeV4n3D5QtT8dWIi7TELUf0E7opSG2S7MnDL+
	 R29or8CXH7vTLUl5F5ZAxS9cwGqCodAeCKGSsPwWj+4ucMoXTXbf5i4upTaw+5JtlQMfO
	 9LhxGBUvexSFIxmtmTGTK18wijDRL10enw0KOCdWR9dPbThQOlS0yM5OE3dUojtj/K1Av
	 ljfFnn0ShuSI/aaP7OSw9u4quV6yD1skB/UnhHDEZmXA9WDznjSzDwNL/vOYlbNiKp5DN
	 FpvLpHmvM7uiocolBVMHpRG4dSZ2lwHeyyFyg2Dap7atOuYN90AMJWgtifc8Ij+r9eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PERKkOYa;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 641EA606A82F
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 11:15:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 641EA606A82F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PERKkOYa
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c315869241fso569903166b.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 03:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793704501; x=1794309301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqFkEa1Wf24oHm/ydD3AaExm05JqCxeJcFBeUKnuAzg=;
        b=PERKkOYaShx0AfUcvg3glaGUkDjcU+eiSZK1M0atlWYClrtMCNETno5tQmbA2D03Jp
         hssa2xi9vaeUhTseMPme7sq43Gz399dWzXFDA3BRj8Hpd41Cxf0QC01ZIbT3sGAMsHhV
         9jECDUetyiBXHBXrZlhrvP8clv8ONj8jE3cGNyRyTuF7xTxLTdM6W+RsW//rwvq/7vqk
         7UoFiqrU9tEvMf+tN+iqj4MzZyQ+DnV3ogkM70ewdakuOSbj7Uu1kXVnu/g17RufdLAF
         xzxIMnzQbz2r7vRgxZbZZCbxVDrHkkLIYuYUxEtH0H8HIFn4b46YWTYs83FrKJQ4Drji
         VaRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793704501; x=1794309301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqFkEa1Wf24oHm/ydD3AaExm05JqCxeJcFBeUKnuAzg=;
        b=I0q/AnpP9cBMit6Q/Rv5aHN8vD7krjB181Kt3yu7jR0WiM2dDo2uZG1SVZvCyXTCT9
         mn1KpFENUgqcOc+PlmhFA9itFwJZf1NIfL5eWbUKV5qnvslaPhGNmkzsWDGd3rXQdNQf
         8tacDHA/d1IaL1ELUYAk5jkuKzGj8j34LyNnoHQLmbTg0KPyAegSto0cFhuucGAPtk7n
         Dody2n0YjWnbTmD6yEiFrMtJz5rKDg+w4BOoXr7kgFfnpRWAemtCwQOh+mtA7hy6gXlb
         xEhfZ9FftCPU0jeMvQV2iLYjfgMEgtl1ROnyQYwkVzFqTsj6GWzfvcECGfbxZdcEdq21
         HtVw==
X-Forwarded-Encrypted: i=1; AKwUvBz49h0gCAuaKPstMfyiFCZN+x0OyNXQL7yZ2Xh7OXOeJWfEccocCXG9s4+rr7zq8AiBcpoe7UaMB6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZDAeM+IyDcS310JrNxdTBSVCyVUBod6TBlAoC9ar2QpFx5Gg1
	UcGgZVpwr5ofGBcJ/ej6a23g1eJvo8qHSIA5RsvIt7QHbFR1HbRgoDKH
X-Gm-Gg: AYBFou1H1IXGih3wi3dbwBBsh5aEjNPF1CRZMX2CWcjr1RvLqX73zWsLdtwTmrCljM2
	PiGC4zmoSvyjNnTZIYDPVCWGOPrKGAYENHpdPNV8oERGwM9UIBw6/xTZ6tT5MxhnuQyb8ltxfjN
	w/MKDYzqdvJtYhY8VEXmq4wBJ8TjUOHhO6xMyvNZKR58wLtNp1SWflYsYnmIjW3ftLPLgjf8jbW
	WXWXC4wn/rtrH9qQy/I5Ka29s8s/lrUlpQJekdl/Rx7GS/q0IU7/PJ5G2FsTppV2IcRrvlA/djO
	IzrIm8zsH7y3WmRTpBwxHP0WrOxF5mQHiIYXcrbrHgkD90uMDBbYi5N5mMNlhIfpk31xafWJVAJ
	lG2q5JrOmVp0uV5mJV3SqBnJP6RYKkbQZBkEGebvq/CWN0ZTn2X7peaS3U8ZaNkrs6m7bdYNwGY
	jLLQT0x4I4CS81tDlcSV0jjEhyDhXj3Rg0QbnoCjQUJGSc7tzrDFMxXMGX50cgODnfSNVDiF+Ts
	HU9a7NphVXncbE/VIQN6ktFk5qi3WGQwtw/hl8M/7Y0+2fKsehB8cylgpWjTYuet9LujY3ZupPn
	F55Z9SRSdQTaTjsFXKiW3Az0Ytrc1KFEysJJP8oielxojKyLnOXsuvzCd6LOFo+JHeuPKjvJHWj
	TrvKGcyil8s6OHAcjDH8kZbHSgt6/GE1iuUeVX/2A
X-Received: by 2002:a17:907:d9f:b0:c40:b477:dfa0 with SMTP id a640c23a62f3a-c4ca7a46ab6mr975704366b.18.1793704500712;
        Tue, 03 Nov 2026 03:15:00 -0800 (PST)
Received: from wlan-199066.nbw.tue.nl (wlan-199066.nbw.tue.nl. [131.155.199.66])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4eca0f376sm4349291a12.26.2026.11.03.03.14.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 03 Nov 2026 03:15:00 -0800 (PST)
From: Michail Andreas Michalopoulos <mike.michalo@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>
Cc: Michail Andreas Michalopoulos <mike.michalo@gmail.com>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tom Talpey <tom@talpey.com>,
	ChenXiaoSong <chenxiaosong@chenxiaosong.com>,
	Enzo Matsumiya <ematsumiya@suse.de>,
	linux-cifs@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ksmbd: AES-GMAC signing support
Date: Tue,  3 Nov 2026 12:14:51 +0100
Message-ID: <20261103111453.84804-1-mike.michalo@gmail.com>
X-Mailer: git-send-email 2.56.0
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

SMB 3.1.1 clients choose the signing algorithm in the
SMB2_SIGNING_CAPABILITIES negotiate context. ksmbd parses the client's
list, but init_smb3_11_server() then overwrites the choice with
AES-CMAC, so a client that does not offer AES-CMAC cannot connect.
Patch 1 fixes that and keeps each signing key paired with the
algorithm it was created for. Patch 2 adds AES-GMAC, which Windows and
macOS offer first, using the lib/crypto AES-GCM API.

Discussion:
https://lore.kernel.org/linux-cifs/D0F05F9A-5097-4A2D-9235-AE395961F456@gmail.com/

Testing:
- smbtorture 4.19 with each algorithm forced
  (clientsmb3signingalgorithms): without the series an HMAC-SHA256
  only client fails smb2.connect with NT_STATUS_INVALID_NETWORK_RESPONSE
  and an AES-GMAC only client cannot negotiate. With it, all three
  connect and sign with the forced algorithm; smb2.connect then stops
  at its tree disconnect check (STATUS_ACCESS_DENIED instead of
  STATUS_NETWORK_NAME_DELETED), as it does for AES-CMAC without the
  series.
- smb2.session (smbtorture 4.19, multichannel off): 21 tests pass
  instead of 12. signing-hmac-sha-256, signing-aes-128-cmac,
  signing-aes-128-gmac, encryption-aes-{128,256}-{ccm,gcm} and
  bind_negative_smb3signGtoH2X{d,s} need signing negotiation and now
  run and pass instead of being skipped. 26 other
  bind_negative_smb3sign*/smb3sne* tests now run too and fail with
  STATUS_USER_SESSION_DELETED, because binding needs multichannel;
  see the next item for them with multichannel enabled. No test that
  passed before fails.
- smb2.bench.echo and smb2.bench.read with each algorithm forced,
  smbtorture 4.19 (x86) and 4.23 (arm64).
- smb2.session.bind_negative* with multichannel enabled (smbtorture
  4.19): all tests involving AES-GMAC pass. Without the series most
  smb3sign* tests were skipped, as ksmbd could not negotiate anything
  but AES-CMAC. The four AES-CMAC <-> HMAC-SHA256 tests now run and
  fail on existing binding behaviour that this series does not touch:
  the *d variants because ksmbd rejects binding from a different
  ClientGUID (Windows accepts it), the *s variants because a session
  setup without the binding flag on an already bound connection
  succeeds instead of failing with STATUS_ACCESS_DENIED.
- Windows Server 2025: offered AES-GMAC, AES-CMAC, HMAC-SHA256 and
  ksmbd answered AES-GMAC (checked in a packet capture). A 1 GiB copy
  to and from the share came back identical (SHA256), with signing
  required and encryption off.
- macOS 26: negotiated AES-GMAC, 256 MiB copy identical.
- No "bad smb2 signature" messages in any of these runs.

End to end, smbtorture smb2.bench.read with 1 MiB reads, MB/s:

                               HMAC-SHA256   AES-CMAC   AES-GMAC
  arm64, Apple M4 VM, loopback        1354        924        797
  x86, AMD EPYC VMs, 3.56 Gbit/s       449        341        469

On arm64 AES-GMAC is currently the slowest because the arm64 GHASH
library code does not use PMULL for bulk data; I'll send a separate
lib/crypto series for that, as discussed in the thread above.

Not tested: multichannel with Windows or macOS clients (binding was
only tested with smbtorture), and SMB over RDMA.

An AI assistant was used to draft the patches and as an independent
reviewer. I ran the Windows, macOS and benchmark tests; the smbtorture
runs were done by the assistant under UML.

Michail Andreas Michalopoulos (2):
  ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
  ksmbd: add AES-GMAC signing support

 Documentation/filesystems/smb/ksmbd.rst |  2 +-
 fs/smb/server/Kconfig                   |  1 +
 fs/smb/server/auth.c                    | 60 ++++++++++++++++++++++++-
 fs/smb/server/auth.h                    |  4 +-
 fs/smb/server/mgmt/user_session.c       |  1 +
 fs/smb/server/mgmt/user_session.h       |  2 +
 fs/smb/server/smb2ops.c                 |  4 +-
 fs/smb/server/smb2pdu.c                 | 53 +++++++++++++++++++---
 8 files changed, 116 insertions(+), 11 deletions(-)


base-commit: af8c72f6550744fe948ef2dbc7ab8739c149aab2
-- 
2.43.0

