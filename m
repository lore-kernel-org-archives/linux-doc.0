Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D146E332638
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401032; cv=none; b=IwV3kJhSWtg86Szqrw5RLWe5CxR0jK/rUfWWzYXbNSjbPBcOL1JUqyzjgtZcFIku/3HxM2LLne+SPIXVPxZu0vUFZj3GKVzEVTsoJa+plynd/p22EuqSbPpsg2RQmg1KW50yrZ+N4qTRnkIcFiRVaX3jCRYBzUixQskbZCFogHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401032; c=relaxed/simple;
	bh=FSHFaf84+K1WEeLxw+lt7p4CyHZ1xmh8ft4DVc489SA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lwaHmMXPFXjNKlgMtf//XoLPzfVVDbUhHtKFM2LbBzQiJRt0/yJauxL66LI9xWttjtGSPpAlIYps5RcII0ee8HF+3FIsHrpCNHfUm4Z7NcsIWPeklDCyHp1T5XVKtnc37DHDUlI7k5ytUAw61H0lPUxnFy5/WkJCAyasxfB+dqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtpacSKD; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtpacSKD"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a3efa2b38aso3595065a12.2
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401027; x=1788005827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MCK7+BAcRGf3cJd5hC9mXgWW8o3rf0I1eoOWIWB/QlM=;
        b=ZtpacSKDpcbVkxoyRlaCUvy76+YPFFw4UrZjHGK72wiLRpM7z9Zb9CSY/KPrbrkYLz
         vtuO6j2VXTWORMser2fCN6Oy/c0qMR3/twyX6iuXMZYgicg9ytSbB+gTeE4FETmSP6nb
         Mg6ZbLHhhkwhcAIBB5QnnhVPgAQpAPLq+tYz2JHFsdiC/emVsojxCN2lkPmAWdlT12RU
         2mV3+UiIeT8xti6Fc1MXEXM92F/ZVN297FDRBxeWDP8eE2dHUiige/B9dfbFj78TZcHs
         oRCHBAkOW2zHpirOkL+oeqhW/U2UT3NfN93eW7brBMXs9Gbj1mOS17K5WKEIebot5MPg
         Ey0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401027; x=1788005827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MCK7+BAcRGf3cJd5hC9mXgWW8o3rf0I1eoOWIWB/QlM=;
        b=EXigAJ1ZAyMVkYwO29v/ZUP4cV+T7yixWF28w3/5VMgJ+1zFIBQeRg/+NrzDLxkgBx
         8ZOPq1JmwN5dNZkGLKVm/L00POpzrXwky7xIwIRNC4yESdpw8Ygy6L0vZoGmWSD9w06j
         tWIWYkmlqZxsxyQWMZxYTa8G21E5Weaom9TQHauyxFtfGR9/UA646Oz0DDBl0wKEYP+i
         28SHjkowojcP1VObYkxbmXewqj+jKPrUz4sT6FhiAr0iSpzVtQIFeIFRzGNdjkCYOftp
         Yeooj3PRMY+n9Ja5t9tY63X80DONRMue54016/jNvaA2k57rK+B46vH/iakpEsx2jUQI
         70ww==
X-Forwarded-Encrypted: i=1; AHgh+Rp18BdhSWi7vdl0PQkyg4SBOyrK4DuVAaK13ynZ7PuqaOfXObps4ST3TzvK3Bvp9HFzdUNsifisLU8=@vger.kernel.org
X-Gm-Message-State: AFuF++nNtXjmc99LXqBfKpRqQs5+COM3NUUcJnkQuSRywAL3jj61/1nC
	1FxlkzZ8ZQTHLhZX2T0nPvoxcIvzY9RA8xOIIBbhiqw1vpyEPTSXrHfVCLmiIIr5
X-Gm-Gg: AR+sD13vdr8+9wJDaf9QmQcm3dfuihFGBxrmfbPD8T4XYNyc+YtRPTplMVKNzcamh8N
	LSFdqsBaETKrrSHTCmnaujc16rxZOGotkCtekYRUY+ddEjSF5MR5FBIGU2RFkaKu3xmSGUMb8c9
	Qi7bbWUjaW9TWu0v0fk3XP7X4mmIR6mAIglCV4pvfsw5MEPBzQhkj92WFYFActQ1xsK2Sg6EBLh
	TMTo62hGTQFCUav+yDWK2j9FTWx70EnWwVyfdmx1qV7p25cBiUIPtKfMBgUrSjnyLSsoLi875nz
	NwTQiR+Hz0UPWd+u+oaZfhdWvETPe904Rv6jC3TwWGCb4Wj/Y1olszlHDF9RYOmN+qikgckDfjc
	JyzZEiohZMC0XDSm2j/tcEb1c4o3zNya5Cef0LXsGHGRqBBv53biHzXgtO9eADQrHywhMofWO2a
	xu9TXHuNFx3fmdulGgW3A+j/2oxYZKcXH+1F7FdsuKIRFBsVcZOy+I6beVrtIJx1NfVHyZbXel+
	5XHpAzrlZVa47nyUOn4o4JSn0dBeqNbvfZhh5NAxXpY1OMi82K/o0k+Tg/ckP9Le7HQVlaaVeo2
	M6rv1QalbQP7/eknoat52YUhngMBiRlQ1TrrCQ6++0Wrbh7BukFG/iPorv90kb26aUME
X-Received: by 2002:a05:6402:4613:b0:698:9e5e:5df8 with SMTP id 4fb4d7f45d1cf-6a42f1aca88mr12849258a12.7.1787401026969;
        Sat, 22 Aug 2026 05:17:06 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:06 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] docs: this_cpu_ops: Fix SRCU helper names
Date: Sat, 22 Aug 2026 14:16:49 +0200
Message-Id: <20260822121651.1559-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the actual srcu_read_lock_nmisafe() and atomic_long_inc()
helper names.

Fixes: df0cee43114b ("docs: Improve discussion of this_cpu_ptr(), add raw_cpu_ptr()")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/this_cpu_ops.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/core-api/this_cpu_ops.rst b/Documentation/core-api/this_cpu_ops.rst
index 533ac5dd57507..367706d1714b1 100644
--- a/Documentation/core-api/this_cpu_ops.rst
+++ b/Documentation/core-api/this_cpu_ops.rst
@@ -150,10 +150,10 @@ preemptible code are addressed by raw_cpu_ptr(), but such use cases need
 to handle cases where two different CPUs are accessing the same per cpu
 variable, which might well be that of a third CPU.  These use cases are
 typically performance optimizations.  For example, SRCU implements a pair
-of counters as a pair of per-CPU variables, and rcu_read_lock_nmisafe()
+of counters as a pair of per-CPU variables, and srcu_read_lock_nmisafe()
 uses raw_cpu_ptr() to get a pointer to some CPU's counter, and uses
-atomic_inc_long() to handle migration between the raw_cpu_ptr() and
-the atomic_inc_long().
+atomic_long_inc() to handle migration between the raw_cpu_ptr() and
+the atomic_long_inc().
 
 Per cpu variables and offsets
 -----------------------------
-- 
2.53.0

