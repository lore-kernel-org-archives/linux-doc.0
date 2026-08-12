Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939AE41B8CE
	for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786529094; cv=none; b=UNSXnLxE8J99MYKXTPq8/iqX7bePZegHsF+4qz6Vob/HIpafJ6YF5kY25Skv8xtLQvBLZHJZoWuwLYzVnd43DdNfznoIALw6vIX2Lqo9CHtAuguTz6d/R7lzDF7CBNyKidgzDoOH+Hr9/h1RPDQOVzFaFICp/AthGkrf2rdxq4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786529094; c=relaxed/simple;
	bh=FgV0EIRlXS2pNv/yLefwn1IDpSp+NZbkwedGH5rjvzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVmRGRFBxZVWGcMzP3mu9hanGsi1QmD2UxYNEdu6MH26YuV/9M2PmHF8x/yYe7cTvV9rY2D4v4TulMOFn6YpIxRqI0yot+YAr0yBDjbrMlkX+oreNWoOAwFtNhraLnx3+vDjuigdwG3shpNseQh4X7557BZ5EzCSqYA618HLJ+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlFbs+aj; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlFbs+aj"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cbedda4c154so452403a12.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529093; x=1787133893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JxZo8B7n4c14lfP0ZG1amHyFP5yaEQUN0LvXnBt5yBg=;
        b=BlFbs+ajbfDxVSy8XDqUOZTror6FP/RY+YB4scEP8UHoi5QMQOzdBj5z/x230anfg5
         nE+7DP8jbbhVBizsu/n8fGK7BssT+WNErO/TPPpruGEIy0nwt/JFBi8b0QVNUkIzm7Pc
         7L/meSZdIZJzoi9t83LLhKjRdemEJAlTU70Q9xXXn+aLJCv8+xqmw+UHFwQGKir2vp/n
         9KP5YRlFsMBwWWleEeKqatCAnLRBL04E7vv1u10jIdgIeblckObuE89HCevldgZIHYWT
         thWRnlVofBkprrcb22/bA/XPg6f3RUVgbGCEozOybM2RHps9BN6HmIozZe96CBktnthV
         qeRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529093; x=1787133893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JxZo8B7n4c14lfP0ZG1amHyFP5yaEQUN0LvXnBt5yBg=;
        b=bI6TN1G1wF4CWqkM89GE+TiJrwD8Iue/NPEna+WFMQ6vgdvlPoOe654vOMAsM7YkX9
         pObD4rhVwJY7j4j2ln1x61YNYuSmkaNGLB61oYvwT2mAYS9X3jFnePAWpjFeQj3znfr5
         1nRK1+rodOwcPw3ake+yD8LjU/R2y6i1cVjLXPf+B9IkZIYw0d4TYRWFigz+P5mjGQ2b
         kgMqdLKc3Fep1caOImAzJn/52YgTa2phw3fEiaY+AsokgcJYe8L+rvRQgWZErJvsfLA6
         Twrhi4lAZz8cFr6kJTyw7jJnA22vwWPW2OR034IpSE9fn6VQFhAFfdf8vI+PipWVpvnh
         Y4vQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQg4SahYXZlXt52LWnW+AR/viV4DsY3jBgxr0uZitKNm4feJaZlY8lpP7UbEU556xhnNsecmkRbME=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR2sCUjd7nsNZtoVbPOGoDY0qEDLT8CprSHqDoOhoDp2jrdg+i
	DxG8NcwkUbnpPVnr5f5a5QS/xXkcv7DAZXGc0/ZHddm/airIrpBNJrzx
X-Gm-Gg: AR+sD13z4E6HgQJAWIKDyQp26FLiV+NSEqW4BDQngFpBAf4yoeqnq74JmRBB05fVWQh
	cPIHjQ+HxxFo19MpnT4gfdh+icFedsUA2sCxN0HVb94WhSAGTwDWGeI3vNOULiqWDKZaplfq34e
	SUHjO+MBEMymMF9AatEfJqbCCqatTNjEVjFYrmxycmx7iS6wx/VUYz/2n6U6c1kjiEhZZI+q+6z
	r8U9IupEHcc2KAhiiNEBEFCH6Ncr8IAc7nZoU+may/4xZlwEi565X087vvlGzPAfpEg62uVfNEy
	ls13M9DYQo5g6pEWB1/lZ5CiOGnoJIAQTDu2EWbs59z2q194kR+WkXJD4Yyj5u0kuVD0OYl0pXU
	ZRRJDiZO/cdlcTN0pnEzriKvmP0CwAIeQxb2RSV2ZQxHp1T0AZ6rl+RIwvHJ6x1L98vaEre7NlB
	4BtmB44xMfoPv/i+ImFUG8P5JjU59lDhI37JqO4u9Pzi/LZ1sFc5aTm3kbYhv05+5rseyAuS5Xv
	hTcl9WXFe8tYY0=
X-Received: by 2002:a05:6a21:4d07:b0:3c3:a20f:f729 with SMTP id adf61e73a8af0-3cc3f51e8camr4663363637.7.1786529092842;
        Wed, 12 Aug 2026 03:04:52 -0700 (PDT)
Received: from celestia.taila51cc2.ts.net ([2402:1980:85a:5c46:85a5:ec7:8aa8:72be])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14124454d3csm8821247c88.2.2026.08.12.03.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:04:52 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liew Rui Yan <aethernet65535@gmail.com>
Subject: [PATCH 2/3] docs/mm/damon/design: difference between watermarks and nr_snapshots
Date: Wed, 12 Aug 2026 18:04:32 +0800
Message-ID: <20260812100433.6288-3-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260812100433.6288-1-aethernet65535@gmail.com>
References: <20260812100433.6288-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Explain the difference between nr_snapshots reaches max_nr_snapshots and
watermarks.

Signed-off-by: Liew Rui Yan <aethernet65535@gmail.com>
---
 Documentation/mm/damon/design.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 939298f2a9b9..1fcf0b8c044b 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -872,7 +872,8 @@ the action to the region will fail.
 
 Unlike normal stats, ``max_nr_snapshots`` is set by users.  If it is set as
 non-zero and ``nr_snapshots`` be same to or greater than ``nr_snapshots``, the
-scheme is deactivated.
+scheme is deactivated.  Note that, unlike watermarks, even if a scheme's
+``nr_snapshots`` reaches ``max_nr_snapshots``, monitoring will not stop.
 
 To know how user-space can read the stats via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:s`stats <sysfs_stats>` part of the
-- 
2.55.0

