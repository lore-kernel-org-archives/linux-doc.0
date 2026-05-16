Received: from mail-yw1-f193.google.com (mail-yw1-f193.google.com [209.85.128.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2C37C10A
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 21:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965446; cv=none; b=GrlK8Y/B4+4EqIuSCeoMuUwPyjwQYE1DmoeEdo27xYW6Fz4c3YOVC47PQqwmz2Wucdowoe8f8Tznk00VvpkLm7vtP+Ke2Nu+w9rGMxhB5D66iYX8dIrrUUlo3ka4otVjgb3Qd6SHI1C7nLgAu7PxBKX/EnZKP9eDcCM4+rVDVlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965446; c=relaxed/simple;
	bh=9ehoVGHCch2YDXFpAgGWGiRbcBZMIbDp0HeIrubwg+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuwW2/De281P1ElNwk3yQuUdXL5NIvqdouN9CwD9MaRmkZt0px97HqnL5/WoFEHZ+O9JNjB3LMKZf6CqmgDztns81AYic8FHd7oTq409479M3zCKLqE0rlkFCAfBslDU15qRxXoAxlo87ex7CyclU+PP2OFLSqXPTKkhMhOVjJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GlCZE/16; arc=none smtp.client-ip=209.85.128.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GlCZE/16"
Received: by mail-yw1-f193.google.com with SMTP id 00721157ae682-7bd65714dcaso4914037b3.3
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 14:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778965444; x=1779570244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHb6DjRXqj9xDQrypI0jK8ctMTDK6O2uioTTtx6jNrM=;
        b=GlCZE/16pFOKeErCrhmEmpO7nMBG8qrsunEUO9E14hquTV0Ew2Ty5Hi9PZP2pNqsZa
         WCpBM1Sb74N9URMSESPHT6GW7aCwhE9cFri610Kw9O5rUe0QXGWC5M3cHg+8b4riX78j
         XGZcoXXC5idfI9Y5BDR/OJtCVWP7k47af78gc797xdhi/NCFg3gFAiRCHS08pmFywKkt
         VD8HLRVStvkBb9bVBIRLYcjQWHbQHkHfSiLjV/9FlJ+Aa88cMUmy5F4ZdpP8ZskKifJO
         MrNDQnQCw3nDd84teTws2kHsPYXluDBkGQ7XGgn/cIAihG3JUUGyIDMRZB8BoYa6VDFl
         y3ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778965444; x=1779570244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BHb6DjRXqj9xDQrypI0jK8ctMTDK6O2uioTTtx6jNrM=;
        b=O++koIH1AE0R95Jxg5tcnY3bmr+VucnfPyiltu2pOGopCZPiY/Iig39RPWsxsviUvW
         6wZtayLT7vyAKL88AvJnuxEMBjZUDnzK+YV5HtuTw74S2hrTHs1WO0VOsc7WiQlbYKz2
         TR7XEokqrMg8SuqEpCQ3Ne+j4KmOfmKeEBSarFflIxgAgL6XQRdWJJAvt1u96ZYFUeDt
         XQ0kXp5siSD8gk4KkfrkIO/n/vdV+R4Dc74RcJwl1qWZFISXeuLHl1GdvQlYKntk9RjW
         YGE/QNOYxCXlZGnIeluq/KBe1la0S5w47MGlWLJ+nHfKa2Bx2jU5n66v5otcKP+4VeDt
         3VrQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sN/egUqtpqI+Tp03xntoitukGnRHzQqnyI4KJPwKWi43xVYhkxYzXzpFXdC/iyo6nTAtx+Xr9AGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxC4joVDp2UBcI+mMtCeoQc2NdZKJQ5SchBbMGvOR6mIsnRrX3r
	mc6Vt3S+YbGaNJjHVeHsFeMorydB5vjreA/Vkr1LbJZXScpuvKVXCZOM858Xzk0=
X-Gm-Gg: Acq92OGEMA/yYEDCrhg4UFWP8BDT6FTfvjfPHyne7On0cOaJtjnMQYQcCrMwFUtFgA4
	4wK4o+cSXcfhSmeIvPBUkbqcUZrzjSziAVU40HdqzG9VKr1haWnNslPhyWCRy/fMk7DsVOn0O+i
	g1MELDBqUpuPIdNUL0LWrMCQTUdGCWCQb/5M7Tx84vioZeDlOWmXnELUVunsmWqqTdFfcAcUKQ/
	nBbiPsmusRyjgkA+2Iv/DbXhlbNQwZReAe9BYAO5pEFLTJ+mk8dTGOdKO1ZGEtwPsD4c0HgzsUw
	Z6QXb2n9i4/kZhd9C3/oJVvCBqAiM1gnk1gbeBaF/W6FA/w768M0o2+gXS5cTBwmnM9wURb50qu
	gZllCdR2Ogqvb+IPzek/ZbqQOoQOcYTzi9mM4FtdC5lGiyPdMH4mWtCLEqL7A2EAg7MZoexfFlB
	8W9S/GRwgi/sefI7pYwsLk0yTiMxrbBfSa1peiT7nGxRd8SS4eQLgRFJEpaTkuDp9VwudevkIV5
	A==
X-Received: by 2002:a05:690c:c4fa:b0:7b8:1b67:2571 with SMTP id 00721157ae682-7c95d1da54fmr102587527b3.42.1778965444167;
        Sat, 16 May 2026 14:04:04 -0700 (PDT)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7c7f54c29ddsm48585327b3.34.2026.05.16.14.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 14:04:03 -0700 (PDT)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: sj@kernel.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	honggyu.kim@sk.com,
	yunjeong.mun@sk.com,
	ravis.opensrc@gmail.com
Subject: [RFC PATCH 1/5] mm/damon/core: fix nr_accesses_bp underflow in damon_moving_sum
Date: Sat, 16 May 2026 14:03:53 -0700
Message-ID: <20260516210357.2247-2-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260516210357.2247-1-ravis.opensrc@gmail.com>
References: <20260516210357.2247-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Guard against unsigned integer underflow when nomvsum/len_window
exceeds mvsum.  When that subtraction wraps, the moving sum returns a
near-ULONG_MAX value and corrupts nr_accesses_bp.

If subtrahend > mvsum, return new_value: this clamps the moving-sum
estimate to the current observation rather than wrapping.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/core.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/damon/core.c b/mm/damon/core.c
index 3a8725e400c6b..9975f3d9ebfe9 100644
--- a/mm/damon/core.c
+++ b/mm/damon/core.c
@@ -3449,7 +3449,11 @@ int damon_set_region_system_rams_default(struct damon_target *t,
 static unsigned int damon_moving_sum(unsigned int mvsum, unsigned int nomvsum,
 		unsigned int len_window, unsigned int new_value)
 {
-	return mvsum - nomvsum / len_window + new_value;
+	unsigned int subtrahend = nomvsum / len_window;
+
+	if (subtrahend > mvsum)
+		return new_value;
+	return mvsum - subtrahend + new_value;
 }
 
 /**
-- 
2.43.0

