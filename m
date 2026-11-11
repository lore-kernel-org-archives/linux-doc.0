Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794368676;
	b=3WdqXgJp8MMHk5j95IklahsfqGDATkuXqdw8mhHQcZaLyX+T6w3CIXkLInBSE8X1is7I
	 Qyuakz+JJ5KL1Rz8DnMBUIaG+Sd87b8F6PO45L+1QlKam6wQcSWRicH7EakAjD6a4CkvW
	 ksh6RM7uVhz+ZwqDZJa/4LYIfhym1B/0ddiXUqEYYHhMzNrTwv+UvGbbd0QMOUzrFwxSF
	 dhBKa2RALIvjJpreca/3FTKovYUw7fp1VUCzYJ3aY+NQw1Xpg5dMYnEmMfokC4fM4XqYo
	 aqKgUkGRVpmma78wmT7BoTAP05diB8u6HlvdPCYty4qv9W4S0as1fbEmUZGTRbOBMag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794368676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
	b=xfFlGQz+yBqVac5rOjzhnk6ITF/vQNB5qwEeIyrQgveQD+g2AXans9NnUYeGegBYTNqV
	 6eHH3BEh+gNn4XRh2eUY7zjCQTlQZExvG4GB8x9C5gKMQeX/vN8bHC7+gVuLF8SgoiiDg
	 dkQqc/3T2CzbE90iSebJVj1S5Vyy94LMDviAG6azjchONELvYEPZrkY/itf+UU/W8CNOf
	 kGmx+P9XetKh/Rv+xlVgePaILuqUB9SNLZ57OTcGJjjP2AGHw/tbZOC1xectUIi93TkH2
	 PIS1X/+qkUOuIImmOrLm1la/rt0lNnUx0fIJM0cd4tatQO7Imt9UeGP8PZV7h8dqbTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIyqBdXK;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD38606A31C
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 03:44:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FD38606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIyqBdXK
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a3c08d6928so4725661c88.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 19:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368676; x=1794973476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
        b=lIyqBdXKGql3khtJNo74Hqj4TjQMXuuoxuhrMpLFYWjnDtGb8b4AaaXgnFjsD32cUO
         dnt4b1XGFfw/q3SPZhnl4Myui4WbMv+Es2IswVTKSPfbg6jqmWQm/BqmjX4SB8p6CEI0
         Ogmg8yyzC/AlWcVbL0ML32c5HjiPzvp0vyVxrck36MfwfBxcc1xryewy0JbNVuNGYb2q
         CsU3rvFG4zL7scIGYU2C3N+svp9U8d33bp7zvZreYcS2EKZ+WZ2bL3WF617d+kb4xNcW
         H1VGxMeQfLJ+EtYXHiRa9ANbQB/ikMZG9+/1FXsIWt2LYqjcZoJ8pp/TiegEfcsyA6oI
         IOyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368676; x=1794973476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Rx2xMMXNqFSdZ4hSTTgyPdyZObPE5Ic1lNABuktusY=;
        b=0kjyOtnd9o9oaNOSLjeMd38cQUOrjlNaVvDoFl/5SjaJMmwUNi+knjG3mKl83fyC5o
         YKaJE9jtvL4lbsZ3odbiDpG8fdZx5Gw82gpGSOTsvQVbXicHggsq5Aa+PRKmtlu13HuB
         cvINbRZkZyBUJbHoq7/+pngvdyO2MoZAUV7oc+0iUGLiSGbE6IYM9A+Z/mEw65AMdGN8
         ryjGt7ZWKqoeCGaOHMqM944mTkSzi+dJpVB6SFtF/3tXBNmNeju0mmhQ6KZPdBNlOwEl
         scTVBoeYkpkt6RG74fX7By/bt9OFtQdpQzVu6jZmxfqD6dCQLEZ1u/QUEjqJ0HS1uDQ7
         6Zzw==
X-Forwarded-Encrypted: i=1; AL+hErHHdOSjScVahDm3ArKW9a7CLkzImVp+//OYlOKizkGvqCjxnAKozL8Ear251Bh2hA//RVuJL+CF8vc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aevftC62yVDFRwujxAwuO7myU1lzil96tNFI/80TZM5khwVoC
	3CTyFV3g+fQqA7amDUlLDgR4hUClTFVCTxWHhujKFPhrqBwXmiOZggME
X-Gm-Gg: AYBFou2kz8n9DbmYLdqHL3C+g4uBjT75xR0E9PbD6jcIMLX+DjQIknjqaBtAzYsCWns
	B8mhKHLoiGZ+Wo9D/tUS8Mqy3b8+1rGdBc8GMmkCI0ve8A65DwpLW72j3EfmUOtf78GWtpiKKJr
	B/obOdTNU0gOvWDHGQJ0QLw7Xad1pY+GfXzk6G6UdQL23Q8gHHbSkl9P0ZSUGioENztrJIhXUEC
	EB9hEJhJORFbddE0hMjtGv0rhKEImOImDT26OkdKAA6ORFmDkwLn9M11Z7RG5h2X46yHXyH6lj8
	f9QX9rBV+RxdZjkLQt31dPbe/Jplv2/FwpoR2+QCBk3Y/rsHJ01kJ5Wei0R8g8xImi5HOFQ86Gs
	pZWuX0k/s5lkwo7J40ejSa2mlisPC4zr2Nd4eKgBZ14Tz7FbpfsvzakjN6S89THTnzwGTmuHPrv
	RaNPHQRezHae2rk8ssAwE66KTDbHg2u3MBwci3MYmKK+4MAFWyNwP21eLIH+RBYT3nBMOHqxlQe
	Qgui4aK0Eet2ARA5NbYtE2d+8aHpbwCyEu4CgCV/XVNPNZF0oo9CobGV+7CBU96vT9k0vt9t5AC
	V5HMEYqWiVB/oI6/7HRL
X-Received: by 2002:a05:701b:261c:b0:1b2:46ca:242e with SMTP id a92af1059eb24-1b3c02f34camr1200137c88.14.1794368675565;
        Tue, 10 Nov 2026 19:44:35 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm23664862c88.10.2026.11.10.19.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:35 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Namhyung Kim <namhyung@kernel.org>,
	James Clark <james.clark@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v3] arm64: perf: Drop the example the userspace counter section points at
Date: Wed, 11 Nov 2026 03:44:32 +0000
Message-ID: <20261111034432.2020955-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111023550.1971639-1-takano32@gmail.com>
References: <20261111023550.1971639-1-takano32@gmail.com>
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

Documentation/arch/arm64/perf.rst points at
tools/perf/arch/arm64/tests/user-events.c, in the text and in the link
target, but that file is not in the tree and no commit in the history
leading to this base has added one.

The section already describes how to use the libperf helpers and points at
tools/lib/perf/tests/test-evsel.c as the example, so the sentence that
sends the reader elsewhere is redundant.  Remove it and the link target
rather than pointing at another test, and move the instruction for running
the example into the How-to section, next to the reference it belongs to.

Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v2: drop the reference instead of pointing it at another file, and move
    the instruction for running the example into the How-to section.
v3: the v1 history moves here, so the commit log is the change alone; the
    sentence about the missing file is stated once.  Raised by Sashiko.

 Documentation/arch/arm64/perf.rst | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/Documentation/arch/arm64/perf.rst b/Documentation/arch/arm64/perf.rst
index 997fd716b82f..5b9cc2aeb642 100644
--- a/Documentation/arch/arm64/perf.rst
+++ b/Documentation/arch/arm64/perf.rst
@@ -131,7 +131,12 @@ changed.
 
 The userspace access is supported in libperf using the perf_evsel__mmap()
 and perf_evsel__read() functions. See `tools/lib/perf/tests/test-evsel.c`_ for
-an example.
+an example, which can be built and run from the source tree:
+
+.. code-block:: sh
+
+  make -C tools/lib/perf make-tests
+  tools/lib/perf/tests-static
 
 About heterogeneous systems
 ---------------------------
@@ -140,14 +145,6 @@ only be enabled when the tasks are pinned to a homogeneous subset of cores and
 the corresponding PMU instance is opened by specifying the 'type' attribute.
 The use of generic event types is not supported in this case.
 
-Have a look at `tools/perf/arch/arm64/tests/user-events.c`_ for an example. It
-can be run using the perf tool to check that the access to the registers works
-correctly from userspace:
-
-.. code-block:: sh
-
-  perf test -v user
-
 About chained events and counter sizes
 --------------------------------------
 The user can request either a 32-bit (config1:0 == 0) or 64-bit (config1:0 == 1)
@@ -160,8 +157,6 @@ userspace must treat the upper 32-bits read from the counter as UNKNOWN. The
 and should be used to mask the upper bits as needed.
 
 .. Links
-.. _tools/perf/arch/arm64/tests/user-events.c:
-   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/perf/arch/arm64/tests/user-events.c
 .. _tools/lib/perf/tests/test-evsel.c:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/tools/lib/perf/tests/test-evsel.c
 

base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.53.0

