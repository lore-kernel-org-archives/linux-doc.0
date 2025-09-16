Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DF22D6E55
	for <linux-doc@vger.kernel.org>; Tue, 16 Sep 2025 05:42:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758001347; cv=none; b=FQmEiDcoNC3C350/1llvLuQ9+2Jn/LqBK0I3u1tWQAkeAWZ3ryd17184yER7ZuQKJwTisrVA1s8JvDuCSpE6+izqCu/GmTTqdG9Mu5/tIXD8qmg5c7f3vGP+xIz4oNDibgcqqhOdo0JkVx0IbQpga0jmt7kI9SZhyFCHATvHZh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758001347; c=relaxed/simple;
	bh=8NBytuejkgmSFrqx+1YX5XgCxvOHNVzzXPSqQWyrZzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f3DdasYP1GOkn8lox16tWwzQu8/FH/DDxgVlBL0V6p8lsrgLoezs6uG57HCrGCMKUiegvCmLAeAONJvOtdsRDIkNG1DxeMPnZG/JrqCyg8xT7ouWJJWX8FYsIPLN8TKjvGOeCb2pRPbGLo6UnNXAqtdLkQs7k1Cn+P6w0/l8ub0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0f8yKj+; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0f8yKj+"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b4fb8d3a2dbso3560990a12.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Sep 2025 22:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758001345; x=1758606145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KA+efhhVzcVIxn2rganxCwFW/bnQtqIpNxQbWngi1b4=;
        b=A0f8yKj+jaxcoCmllZ2x5eXF8IMyM7xTtOWs2/ZicTp/+e9Q3vSHOh3x6xOSxJT8Mw
         PiSb1XdaYPFF5qslnsUEVZpaUkpNZi20VbfSIb+4W9udajEeGc84DLarOqc/50gQNytc
         1gG3zFP74XD9Skx4I8hfI2kNujqnbGHYx5970/cxVXsgOlRSihtnZDySeUz4HRsALh0J
         WlU43lm3I6/29StbJaHPgttID3niFtNBUrl5nsIQOYHs80hlwJF/Y/Juzm23aY0uhq7w
         KOzEBX008GHkLV45jiMVW8sskl6/ui6EBbZM7JYgBmVqPoQfCpKcJ4nfM9hvGGjc5Qyk
         IGOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758001345; x=1758606145;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KA+efhhVzcVIxn2rganxCwFW/bnQtqIpNxQbWngi1b4=;
        b=EDWJ+xL/Av5aSDSLsEJaSccHD8S8MGTxHahR7pyF3YUyS6Zhy83cGBW/DFSYALzXdi
         7r5Nv2ZAHLzQ7Ajd+tZBRiKXxCLhpt+4TGyANdksZb2uCLMReZYjY09PEWmX6LwwVQQm
         FlT9QV/Tlg1f5ROgixM78JG/GEFYcPTeZS8vOjCP8c7rmR+Kkd8eW7SsJBo9ugk0EvkV
         kBCLMHyGdv0nwcCteVb6952MY9eOlKfU/vGP9rOmPuqDIWcKdrVHw3K1dYdYy8yKWpuE
         TcFJBVgIdRdHv6jIypeF7IFOygsx9CEQE9QS3HRpsngIZ670tOJToY6TU9fD6Xip/YVZ
         82Dg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhRqcE2Nvux8A4LP9jS1TmCn6xMaCJA8dwqp1sB29sOhu3j1nMwlsTqDUEdYxG/8sN2B6SWk4qFo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8IOzfyUhsvoAIV1HiwR06O5dHOujx1y1wukSxthlbaiDI3AH0
	crKa9+fKk6ci9+l9g31xgceSnXd7RNeGnB6aC3Nwy08SAVMOCsYAl25b
X-Gm-Gg: ASbGncvigh5s2FpA8K/UXhTG4nZv6KGwKxls8hEfUjUBYXc4Xi8h6kELN+/m/6jKu7x
	VDt3potKK0lEOfc3woIPnrNENSwjxm5ior+LRxOwIeKW1A0Y4PEiQwc/nZIp/CWw0B+L5e5+sqJ
	TdJcPdXdbR2A43NeudMiSZEQLkzAdydvGqy2aO7sr7b1KHjw1gjwPWoRhKxEKeTgNSy5XYoXeOX
	VjlojLSkPU7r6XOopsYAVyvy0m2yg97Lpo2p8ZNrwgEgf2nJQNS9TvOvLV0d9oVHSzpiwen4cwO
	wejJsBsOe+TZzxlCXym5IJXeg5nk81RNYU/U3r0tgMKN0uncRxWemcpKecfzG/r/kwFZdi1iBRc
	7WiCOIlnxfRADPYBrltGCaiZFwg==
X-Google-Smtp-Source: AGHT+IFrvIySj9YPlWQ7FIJlVK7g2Kv/lcrzGY3U0M775dmnSq64Cf2O4rtx9zaA9FHckbb8B+VGPQ==
X-Received: by 2002:a17:903:2a8e:b0:265:8a76:4b0e with SMTP id d9443c01a7336-2658a764cc7mr81319825ad.53.1758001344772;
        Mon, 15 Sep 2025 22:42:24 -0700 (PDT)
Received: from archie.me ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32ea41d3e19sm420977a91.11.2025.09.15.22.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 22:42:22 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id D7949420A809; Tue, 16 Sep 2025 12:42:18 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Kernel Tracing <linux-trace-kernel@vger.kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Tom Zanussi <zanussi@kernel.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v2 0/5] Histogram docs formatting cleanup
Date: Tue, 16 Sep 2025 12:41:58 +0700
Message-ID: <20250916054202.582074-2-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149; i=bagasdotme@gmail.com; h=from:subject; bh=8NBytuejkgmSFrqx+1YX5XgCxvOHNVzzXPSqQWyrZzo=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDBknfhicfRauZvBo4uYlLUIb20Nvtl0TDdOsWM48iYF3M dOSwzqPO0pZGMS4GGTFFFkmJfI1nd5lJHKhfa0jzBxWJpAhDFycAjCR916MDI+19HuUF1g8Cmj5 nM4xi6Wo3dhrWX5D4OZahUjvUCXfp4wMdz4IRZx++SphzznlPz/r4jX/BatGHomaefLr4ev32wO yGAA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

Hi,

Here's a formatting assortment for trace histogram docs. The shortlog
below should be self-explanatory.

Enjoy!

Changes since v1 [1]:

  * Apply review tags (Masami, Tom)
  * Reword patch description for ftrace cross-reference link (Masami, [5/5])

[1]: https://lore.kernel.org/linux-doc/20250911042527.22573-1-bagasdotme@gmail.com/

Bagas Sanjaya (5):
  Documentation: trace: histogram: Fix histogram trigger subsection
    number order
  Documentation: trace: histogram-design: Trim trailing vertices in
    diagram explanation text
  Documentation: trace: historgram-design: Separate sched_waking
    histogram section heading and the following diagram
  Documentation: trace: histogram-design: Wrap introductory note in
    note:: directive
  Documentation: trace: histogram: Convert ftrace docs cross-reference

 Documentation/trace/histogram-design.rst | 151 ++++++++++++-----------
 Documentation/trace/histogram.rst        |  38 +++---
 2 files changed, 96 insertions(+), 93 deletions(-)


base-commit: f44a29784f685804d9970cfb0d3439c9e30981d7
-- 
An old man doll... just what I always wanted! - Clara

