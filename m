Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A3E33F5B3
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788602227; cv=none; b=rM/K9TiHn7f7KaNqeMmB+3RbxNgfJ7qK48nzX9VibH5AG9tzSDfxd28p80svt3gyI4GynTtaQKW2W7rov2HZ3lrU3Y2hlV2hSRUxs50Gyi8FFPMKu+1BGpBOMfHsVIJ/yLcyiGXJ2gBKRugImayKY8f/8HC2XjJjKoae/0XE5iI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788602227; c=relaxed/simple;
	bh=fM50RelpZlPxGOz1H09/Lq54iXhKsyPkRZjYqpWNmCU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=kPzlCd4sTFqi8O6yuuJP/WIYXdHV0w/F8BKQ/QGSICnF3ciye5QMy8xXfMT8o2yAWvAj+ScwiuMOVFRQrtJbji3UuGNI1ZLfsJut3UHnlvCnUaHwxNEDOCvu84diUAL+kg9HpxqIwVn9XVIkIXWRNvzhD6Zc0offjb8j1NiEu8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FeYmdCdD; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FeYmdCdD"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so22814765e9.2
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788602219; x=1789207019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ayz/e09YuiQeSDHoY+u/lzDfVtJfvbORC9PNu8Y4WPc=;
        b=FeYmdCdDM3HycuN6kG0lAtQMnWyhzZChHRcURAZwGacmlKF57187eEakaVhFU9Uj02
         3owSNZECHgZ5GNjSbRGA1UDT+DFVPSc90AIsoxgdlw35UPtv3uhV4o9Xpp+LGjgyE80b
         RIb7LkWR5tvZATBIXU/zB/W9nqPGfrY71FJnpGeJjAN6LFMuRSuThBI6I7+GEETQukrj
         poNcR1vEVVb0SYLdJECrnTmeWpZqbvZt3YZXBwqkt7WPgxVMWHAgZdJFGWS6h9iGLDOG
         eTcWmMLWzaqY1rOJ3VOAKZK0eo80rO4OkA3bpLLhrjghN3lmA2sEWIJnNP78y8c+YuV8
         kuEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788602219; x=1789207019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ayz/e09YuiQeSDHoY+u/lzDfVtJfvbORC9PNu8Y4WPc=;
        b=cQ33gHElkHoaWTqpkVHopg8G8Sqkcr9dv3dnC5XIYRWxym3ZzAwCJvGEcnh/r8GKGe
         K7MRrmJMEA771WN9KQG8XWtWGxBCsj185xKDmSaRFHNVnk2pjEkMK6fsMmT8hWbrhHuL
         xKXx9MulFhv95XZkkibPpmPzyfeYBexBIf3GVNKZWFRL8FsgoFtDS2v2+ffS9X1wduCU
         ep6pTPFG8tUs9vZu+aNMX5E2aJ3/rj8LlCOpe5lQtd/TJ2rkagWKlzNsI6gXSzNs+2a/
         YtcJxy4tkU4yjCHbCWNJ6ZX1feCuOJlJ1DOhwsnt9+ukZuq0zIl1AHXzb6KNP0olWrrJ
         QV/Q==
X-Forwarded-Encrypted: i=1; AKwUvByU7SArDiSQcMoYL6dSJKnRdAzir72qKhXz0WBq3mr0iuY6q/EqIxq5Tk5BCQ91m1PiRb9J3sU+/7o=@vger.kernel.org
X-Gm-Message-State: AFuF++mNZRl3LPGvEPvRfu/vPesCtQO4ASsAmVacn/6JwqpRWEzvk3RP
	/l1HqVlgSmaRzmcWG4GGofXLO5nEVihuGsuNVWQIVRtkx6DQDN//vvdq
X-Gm-Gg: AYBFou3p8OhucZPtxKp/g+/Mr1/2UcWwzCf0EDAHfgjtcHPiZdh2OYeqaTOnslngxC8
	NJjpeerWYU4p+yJM7B9n/MqNv6ZvLnXSSFlgwX8YG0IWG1KG6CZlSAkcu9F19TFaiEFlGD/7jVp
	CBv+ezuw99JrdSbh4HpdlHXSc0g2Wx4lva+1vV4KlhynptmR84do5jZmRJ1iUGsc5L0vFcHDTTg
	OqWeqD0NGJu4dBFk1UqHv2wKdO9cdiobzQzDwiVTHEM4BfMyf30XZtm1uD9Kx9yNHYoFPRP4eNJ
	MJrFZAtelxkiyt9a2R1UYprX/UmdvIaHorkWOuBtjj+B9VJuVoRqWuyLyU03SNtA5cC4E1pHu52
	Qi+Le2VgPnO8QZbq0tJwjvT+DwTW1pg1NQTD05/JoXQN7/FZP/vD54VAb47hM9SI/l0ITRsZ+q4
	SqK31MHu+471fhnc36WbB2LGnlQGCpYewW26bZTmTEtg6v4X/KdHsQ2ZiDWc7hS42riX5YFUNbd
	mmVPhiFzjZmLDJEYkNnllyAWL/p4k/yuQGf32gFbSCxtoMWdngYi2oVgDyT9UZ2+sYx+wqcreux
	Nd/3InI8Czu+Zd2QJCcCzbG9m6pLJJ8+Ml3U19XRnbQwsxSFiYsh12Ne4ZksFOB8xBDdBevOElg
	/rw==
X-Received: by 2002:a05:600c:548b:b0:49b:92df:87be with SMTP id 5b1f17b1804b1-49cf81f3655mr113590565e9.4.1788602219327;
        Sat, 05 Sep 2026 02:56:59 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d057f4778sm32077245e9.8.2026.09.05.02.56.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:56:58 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	bpf@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH bpf-next] bpf, docs: Fix the struct btf_var name in btf.rst
Date: Sat,  5 Sep 2026 11:56:49 +0200
Message-Id: <20260905095649.42351-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct btf_variable does not exist; the name is struct btf_var.

Use it.

Fixes: f063c889c945 ("bpf: add specification for BTF Var and DataSec kinds")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/bpf/btf.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/bpf/btf.rst b/Documentation/bpf/btf.rst
index 3f05f17990ad..004aa1058d85 100644
--- a/Documentation/bpf/btf.rst
+++ b/Documentation/bpf/btf.rst
@@ -416,7 +416,7 @@ If the function has variable arguments, the last parameter is encoded with
   * ``info.vlen``: 0
   * ``type``: the type of the variable
 
-``btf_type`` is followed by a single ``struct btf_variable`` with the
+``btf_type`` is followed by a single ``struct btf_var`` with the
 following data::
 
     struct btf_var {
-- 
2.53.0

