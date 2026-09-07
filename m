Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949851E3DDE
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 00:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788742178; cv=none; b=U8Kpl2HlwB+VlZb0KVDGR4Iz//h5QzK2BJuNLkHJRWQ6KEtH1/4cr5HjfSPWGPy9tHlbPVS44NvwqZDX1dsHckztxsScblZ2VnnCTWd/Y5Sn22RL87ICN9zrT9FRcLvX2TwKb5xztDU5Re620szMkhzPg1i8KDFTS3xCy+PnMdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788742178; c=relaxed/simple;
	bh=atynppnDH+l/8XS8gTtLmz9ni0GXMz3SAMZVNJgXE/M=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c9WTmPIoPiV1fbDcrjytrQN3EUFFWa18/7nYQXpm/tmfK1ye+WCjtS5Zt/LkMh9UxLcwzxLKsMxp4QdnGbVYmUepBRo8EAfL+fPaGV17wyujcZRRvS/QSW7mWW/28dyhBklcbcGC7uhua8M1stWniKYc5WX55KTyprLqoPexSs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0ipIkPL; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0ipIkPL"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4858595f997so1645815f8f.1
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 17:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788742175; x=1789346975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9LVmuTrLSm2/9tHtDWTw4c0WbiPr4Nr8ick0kaPHngQ=;
        b=b0ipIkPL+aldgKs6p/NTyb5VLAzRUj1i0gMTcaxTlHDLcDxlmWhKvdH9jgIsNHBlRR
         S0tti/Iixr6kj3zr4L5cIWJ553eefYac7JQOxUn5UV2ojmPtNKJH51tST+I2vnTiFb5D
         KlPbkZFJoGWE+esghtsS269RlgFCtN4q4ofw24ntaRXPWr2CnwStR2fWSQj/AMKNKwXN
         6wvuXXsV0u2u0teqL6NjtMEEHuwSMyOV/Ej4GofR+1iifPAD/GB5BfEJZH4YeUJ4vDNR
         BwYJYuXExukeXmIHEdG2hJ/VIyaV88ZMrSOI4sdRMlNigx1W6tRvDhZ5Aw2n0U/OwZzL
         sX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788742175; x=1789346975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9LVmuTrLSm2/9tHtDWTw4c0WbiPr4Nr8ick0kaPHngQ=;
        b=pFNagNhvkHWSWb5qna+lZBSoK1cZEusMzOULknHCK8XsiPZrb9Jr9yzv8zb92WTGIW
         CQJhqE8oEL5FOiy6W1sOj+r2I/+XAUmhSMNXpSapq56zPZGd/m6qLlLJDv45owGINyTh
         ZJerCgKMjp00EdtFFqpMYa+052/F/gQVlv6mubUndKTUcNBYz3mjIXHmYUzdcQnJd3Hy
         3XmTZrvzs+IM2Dl3kULlD3rqtC8NeF6eWojdDEJSrJ+CRnfka94Dd7ZFqj5qRQq7hlNJ
         QsJW1HlCS2U79I2BaMWDJp8dbVDTz5R0WVErt/0ydgTRyxiHjX/jHmeIHmKSy+C93MMp
         0U0w==
X-Forwarded-Encrypted: i=1; AKwUvBwArCn3xqz4kYqVmvu79ZygEx1x4u+L2vroQbLhBzmXWfO/i6pTOCae+m+4qV5SoRx4ygqynjVrmL4=@vger.kernel.org
X-Gm-Message-State: AFuF++mQJ1ldeuvhCKNII5LUrSbrEF4pCrm3B//2mncVYKCBygXoYhMp
	WYPlSGS195DqgffpFdBL71OI4uwdX4+HjVqIBQMQ2ew+FePxh50yQMBo
X-Gm-Gg: AYBFou2IE6R+kIuNXzPpsWLnEcHhwyzJzpvCEXavaA9zClqZT0ArirwgPfEO19JSK+s
	3gj5YSvyAPE7LQFR8vMziPE61RNKJeNqWoSIAszTdlD3S4i7Y1O6izdo0uMp6kOblkcuDGUVRQB
	CA663T6BRFeTopGgFgzU2+FGGyvlWlI+IpCol12KCde+jP2IoP15NY683QHGs7B8BeqYVHuMiRZ
	x3q2aIuFCzrj1PcEJwebrKb3mPQioHEqj49UPIq1tdAGKhwACE+Faq/Imm8p2WcQ0FWQgUaueRh
	FrWp3xvcbG/oHuVecylDTdomGQXa8hYDPabk8prFCATYn7XuqNv/INg76vYcn0kVWVszUXmN2w9
	8wqkIETmrxhT7G0MCCiGiluGUZsS3dG4h8ldKT9muIq9mMiE2tOzFNEkdENLAwVjGTUmOhndXa+
	g8J8l8bbfFetVJgKqCFH3KFaKYChTtBYn7qeN3NhFplQzEEgzQ0cxhWxf26lF3jogjGGr3IXpLe
	7x/0t9zIsZboHETgw5KtHk/Y5UJehy0w34mlQqvJZr04ppN4MNRVUVvwZ1kZsxzUiyk52NoRNLV
	hsqtJyzmuiBZfzA6PHwLdxRLapJ8MaDUikKoKL0ihT5ub99Nwc8ek6vi4zgqOB9mlt2je8yZjfc
	+uw==
X-Received: by 2002:a05:600c:c4aa:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49cf8241a84mr334204825e9.9.1788742174581;
        Sun, 06 Sep 2026 17:49:34 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9d84-5101-9c80-d25b-14b6-410c.310.pool.telefonica.de. [2a02:3100:9d84:5101:9c80:d25b:14b6:410c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7736132sm263462605e9.12.2026.09.06.17.49.32
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 17:49:34 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Haren Myneni <haren@us.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Ritesh Harjani <ritesh.list@gmail.com>
Subject: [PATCH v2] docs: powerpc: vas-api: Fix the structure name and the ioctl number in the example
Date: Mon,  7 Sep 2026 02:49:25 +0200
Message-Id: <20260907004925.10948-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct vas_setup_attr does not exist; the name is struct
vas_tx_win_open_attr. The example also defines VAS_TX_WIN_OPEN with the
request number 1, while arch/powerpc/include/uapi/asm/vas-api.h has used
0x20 since the ioctl was added.

Use struct vas_tx_win_open_attr and 0x20.

Fixes: c12e38b1d52e ("Documentation/powerpc: VAS API")
Suggested-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
v2: also fix the ioctl request number in the example (Ritesh)
v1: https://lore.kernel.org/r/20260905104313.43620-1-kmehltretter@gmail.com/

 Documentation/arch/powerpc/vas-api.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/arch/powerpc/vas-api.rst b/Documentation/arch/powerpc/vas-api.rst
index 1d0d055356e3..f74ea9fbc8a0 100644
--- a/Documentation/arch/powerpc/vas-api.rst
+++ b/Documentation/arch/powerpc/vas-api.rst
@@ -136,7 +136,7 @@ a connection with NX co-processor engine:
 	follows::
 
 		#define VAS_MAGIC 'v'
-		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 1,
+		#define VAS_TX_WIN_OPEN _IOW(VAS_MAGIC, 0x20,
 						struct vas_tx_win_open_attr)
 
 		struct vas_tx_win_open_attr attr;
@@ -265,7 +265,7 @@ Simple example
 		{
 			int rc, fd;
 			void *addr;
-			struct vas_setup_attr txattr;
+			struct vas_tx_win_open_attr txattr;
 
 			fd = open("/dev/crypto/nx-gzip", O_RDWR);
 			if (fd < 0) {

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

