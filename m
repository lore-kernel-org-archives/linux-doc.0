Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5EFEEBA
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 03:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775444645; cv=none; b=fyrF6zeRTUV6oJZvEJkRDRfMyhH0kvHa9Hf34sktqONEf3R1WLgG72IspQQtiHqdfCv6apdIV32H16Lnu0ZNoyvhKJCoSCrN/c3iDp07N88XI90Fn7lksZr8sMxzO/5rMNkPWeR1t2blCWvCCW98YJOzoitzjMVJDD9Uj4+hHkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775444645; c=relaxed/simple;
	bh=NieBmPzWXIkFmhI4KYWuemqUlcQD8teyFT556btQEwo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PjSi9efFCLkOOSAL4kPGxdrs55siqK31H2ZE0n7vZw3IuSo/qKmakXL+wtzOMtzCMSTCI/xmwp821LJ358vZRbHflRd2FxyWlLnkRf7TDVvO7LUVcWwPvCFo3XGCHRGESkV64zeBQ3iMNJfY292nFW+LBA1Kl0YTUhNb2zNT5xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIw1SSk9; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIw1SSk9"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-42306f82341so1749283fac.2
        for <linux-doc@vger.kernel.org>; Sun, 05 Apr 2026 20:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775444643; x=1776049443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d15VWi4XhQT15Gfi7fM+Taj4AdGQh4mAG+FpOc6EeJw=;
        b=tIw1SSk9gApgcN/wjDXPHE+Y9ilqx0fcHB2ug7WYnIcS6WG+VowX4AdGElpw99zgt1
         vkpzpWs5paXbeGum6J3JHHJiFgXwxXdjf9jae05Hh/N9ixmebtSqG5TdRp8zOfOtzBEs
         yOH7t8j3Sp7cs2gDVcgjQoxBXf+WUDWyL2cC0HyagR35UK3i6dIiu45w52maAh4TRlLO
         2BZz2BU4N+n66G/4wZbalu4eBrP4eEq5arnMF0zbmIycajfXG7Eme0FIryANy09OhY31
         RH7f/A3uiJN7A5AUVE6QZl9cGd1O/wXZW894DFca7nHoIHjQCabeKFhb2yjcTCtJq7yF
         LSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775444643; x=1776049443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d15VWi4XhQT15Gfi7fM+Taj4AdGQh4mAG+FpOc6EeJw=;
        b=Zqddi9QK9EKOqIlHWSElsn3VrjiTBL6UfptjRSUL2pbQwg77n1OiRlv0KstHFR47ky
         pvS3dYflQKNDZ1BPWijazpErBU0gTL4lncu7mtGIWQD2j9Vn+PDuhdygrWeYmPuDKVfm
         kNSQtUjMHBYg4I5yo7Kjcp26kfrFbqrO0Hs+xWC9+uXGRZVnbCEGHeHlC1V3NGnFryHw
         fzwO9UcGybpnAcA8WL9rfyxgbGc2ThEqayClSBOd3qlfqy6mBCfjuHPeUNgR1eAnz6CD
         AS+L2sp5lxoIlbUENypCOt4gf5VQvnBKw1/H0ra4Aaym7QCLK/sKa8ArQJIRgz3oBlna
         WhWA==
X-Gm-Message-State: AOJu0YxBDRq2Sd2OoSLmYTt2wcwhQBa8mIJ7k3opxjH+yFLzabt8EHE2
	+Zi4rwLC9m2KlIVr94ptm3qmAsgaawz1Ry0S8rUkXF++ej9febhaLOf0mKj6EeE=
X-Gm-Gg: AeBDiesrpp/n7icAyZt1dVfcqhj75FoQ02FqM0Kl+Vf+Ov4LUAo3H26AUNav9Pp0Drr
	ueBBHSMRplCJfQEFl8iymxYW0+3bpq0yZ01I/oR3pnU0J45ykJNZM6Ce1VNHGaYhmYI1ynvr9pv
	WAaieSxueB7X195HNHQBmvinRlHPBUSjgwHLTgPovcjacgvGHj95YlrONLgeFwBw+3/M/Wh0/ce
	Ew5qaZwSMMwN/MbD9Gzkhr92xpRblK040ZrqTjBpef3K50nM5TGKdHM/Wt61FTUbjd+zO5pJyt5
	X5TJ+eXPdCfjD152a7o8eLyhyHS1ixMKJLsq+/OWJYCPDCXKJCDjACkfL62bPGKQSdSo3HSkeDK
	MFb/1vyQxjI/ESMZ7EEYwMN9VJ/QJAbGaQK2ZCQvJljy51/nXNu4+ThAejEWq7CF+wsZXGhQzYP
	mDAGTn7QarEOcdJ8LE6OMeqPO9/wfXE6k06S20S7i4UxMN3HPrAdufWUPHjVmYyA==
X-Received: by 2002:a05:6808:c117:b0:450:aba0:f006 with SMTP id 5614622812f47-46ef5fede77mr5851716b6e.17.1775444643164;
        Sun, 05 Apr 2026 20:04:03 -0700 (PDT)
Received: from Mark-1.localdomain ([189.195.72.254])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46d92f66ca2sm7423182b6e.13.2026.04.05.20.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 20:04:02 -0700 (PDT)
From: Manuel Cortez <mdjesuscv@gmail.com>
To: linux-doc@vger.kernel.org,
	corbet@lwn.net
Cc: rdunlap@infradead.org,
	Manuel Cortez <mdjesuscv@gmail.com>
Subject: [PATCH v2] docs: fix typos and duplicated words across documentation
Date: Sun,  5 Apr 2026 20:03:23 -0700
Message-ID: <20260406030323.1196-1-mdjesuscv@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260405030359.7392-1-mdjesuscv@gmail.com>
References: <20260405030359.7392-1-mdjesuscv@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following typos and duplicated words:

- admin-guide/pm/intel-speed-select.rst: "weather" -> "whether"
- core-api/real-time/differences.rst: "the the" -> "the"
- admin-guide/bcache.rst: "to to" -> "to"

Signed-off-by: Manuel Cortez <mdjesuscv@gmail.com>
---
Changes in v2:
- Dropped the networking/switchdev.rst change as "is in in" is correct
  per Randy Dunlap's review.

 Documentation/admin-guide/bcache.rst                | 2 +-
 Documentation/admin-guide/pm/intel-speed-select.rst | 2 +-
 Documentation/core-api/real-time/differences.rst    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/bcache.rst b/Documentation/admin-guide/bcache.rst
index f71f349553e4..325816edbdab 100644
--- a/Documentation/admin-guide/bcache.rst
+++ b/Documentation/admin-guide/bcache.rst
@@ -618,7 +618,7 @@ cache_replacement_policy
   One of either lru, fifo or random.
 
 freelist_percent
-  Size of the freelist as a percentage of nbuckets. Can be written to to
+  Size of the freelist as a percentage of nbuckets. Can be written to
   increase the number of buckets kept on the freelist, which lets you
   artificially reduce the size of the cache at runtime. Mostly for testing
   purposes (i.e. testing how different size caches affect your hit rate).
diff --git a/Documentation/admin-guide/pm/intel-speed-select.rst b/Documentation/admin-guide/pm/intel-speed-select.rst
index a2bfb971654f..dec2a25f10bc 100644
--- a/Documentation/admin-guide/pm/intel-speed-select.rst
+++ b/Documentation/admin-guide/pm/intel-speed-select.rst
@@ -287,7 +287,7 @@ level.
 Check presence of other Intel(R) SST features
 ---------------------------------------------
 
-Each of the performance profiles also specifies weather there is support of
+Each of the performance profiles also specifies whether there is support of
 other two Intel(R) SST features (Intel(R) Speed Select Technology - Base Frequency
 (Intel(R) SST-BF) and Intel(R) Speed Select Technology - Turbo Frequency (Intel
 SST-TF)).
diff --git a/Documentation/core-api/real-time/differences.rst b/Documentation/core-api/real-time/differences.rst
index 83ec9aa1c61a..a129570dab5a 100644
--- a/Documentation/core-api/real-time/differences.rst
+++ b/Documentation/core-api/real-time/differences.rst
@@ -213,7 +213,7 @@ to suspend until the callback completes, ensuring forward progress without
 risking livelock.
 
 In order to solve the problem at the API level, the sequence locks were extended
-to allow a proper handover between the the spinning reader and the maybe
+to allow a proper handover between the spinning reader and the maybe
 blocked writer.
 
 Sequence locks
-- 
2.51.0

