Received: from mta1.migadu.com (out-123.mta1.migadu.com [95.215.58.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB483BAD9F
	for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 02:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787105784; cv=none; b=SJZ4EO8VM+2tOrhU38bY3j56YVJVX4SO0p9uqc5caflwGHbfiZz7ZBpZB4uKwMwmZBFWso+3wxHG/K5D0f8NdOJ/qTk9xR2UeUnACf1iFZ12Gw3wzcskC4zGmxZ7POE+6bLzkXkT9sV2LaP3C3L+JAszqrvpYovIUhVEji29Yck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787105784; c=relaxed/simple;
	bh=sR4GxnwUvygzIy4Ll7R5HI5CwDGDRQKts4PxllPhnAU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qSMlAMXVTILsyNSjAUolDbADBY/ZMG43FoRpqYzkHFOixILTSIjkCqYZqKPulklM1KbvTnBnFEJ02vatHcH03HdYrmhvLuexBSSxfDgBWFmMbJEmL1jlyAtPEL/oG1rfHyrdO1jGJpcAV49Sk/KQr18NhjvKYcUZN8lPxdd8L34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mIhZ8GMA; arc=none smtp.client-ip=95.215.58.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mIhZ8GMA"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sR4GxnwUvygzIy4Ll7R5HI5CwDGDRQKts4PxllPhnAU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787105780; v=1; x=1787710580;
 b=mIhZ8GMAE6i2gPhFUjScBnoKlrOd+K9afaNpvuyUPV/c82b4gzLEyXlHJUQMtUJz5HbMeb8Q
 xeaLekDa8lH0Sdrdl1U4c7MpWAXv9jtRQAxGs2AEIK5kLBCqyDActNeFx/GaPVVEe2SJvnLj7JE
 p4ic5enRE14MwXiXvslx6Fh8=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from localhost.localdomain (223.70.159.239)
	by smtp.migadu.com with ESMTPS id 3b6440fd5a123c30;
	Wed, 19 Aug 2026 02:16:20 +0000
X-Migadu-Flow: FLOW_OUT
From: Ye Liu <ye.liu@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Ye Liu <liuye@kylinos.cn>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] tools/mm/page_owner_sort: fix --sort option being silently ignored
Date: Wed, 19 Aug 2026 10:16:09 +0800
Message-Id: <20260819021611.2910835-2-ye.liu@linux.dev>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260819021611.2910835-1-ye.liu@linux.dev>
References: <20260819021611.2910835-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ye Liu <liuye@kylinos.cn>

When --sort is used without any short option (-a, -m, -p, etc.),
compare_flag remains COMP_NO_FLAG.  The switch (compare_flag) then
falls through to the COMP_NUM case and calls set_single_cmp(), which
unconditionally overwrites the sort conditions that parse_sort_args()
already configured.  This makes --sort silently ineffective unless a
short option is also supplied.

Split COMP_NO_FLAG out of the COMP_NUM fallthrough so that --sort is
respected when no short option is present.

Reproduction:
  # Before fix: ascending order (ignored --sort=-pid)
  ./page_owner_sort --sort=-pid input.txt output.txt
  # After fix: descending order as expected

Signed-off-by: Ye Liu <liuye@kylinos.cn>
---
 tools/mm/page_owner_sort.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 35d3d254941c..3b957b654f00 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -821,6 +821,9 @@ int main(int argc, char **argv)
 		set_single_cmp(compare_stacktrace, SORT_ASC);
 		break;
 	case COMP_NO_FLAG:
+		if (sc.size > 0)
+			break;
+		/* fallthrough */
 	case COMP_NUM:
 		set_single_cmp(compare_num, SORT_DESC);
 		break;
-- 
2.25.1

