Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431723783BB
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785738119; cv=none; b=LZARQjDseEpK92w3xkIhcWNEv+Vq7AUoRmt3CLUF/QfVSURQj1hQpdIW6Vaaw3lwmUH8fcgM+yzT9iwRJQsqISJgpo+n0RxAPxAxBt1PqIlTWXYXA7m25Xt5WnejFB0wleW+J/Gz79HL45Q50/0EDsvIC4V4Kqk4nA81jFftl+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785738119; c=relaxed/simple;
	bh=4DyyJbipMEPACZ2LD/I923Gcn9JElwaTtLTVtkRNdnk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iGiSnNl3i0PRqMGOB9leiVWBIUE1gk1Qvzzip9QES5sZ40FgcfMqO+walf4NUf9Utn3mxSDEAb/u/LlFXLw4ialM5j4k1CFZOwcj/a/MEAkxbp/K7MVLmvnSDOqk3jAaoWOnm/0AyWxXHJ0VXz0aEIvGeBDNxQlEW25wGoQycgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=P06mjlhE; arc=none smtp.client-ip=91.218.175.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="P06mjlhE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1785738115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0NUjMF0YZdO+mWLr8nRUv6rJ891UqYSF7C3pZ4ivN0E=;
	b=P06mjlhEuN+V17oxIDVJfMATXr41BvX4ARgCP6fw47r45jdjZnHiVfGlCJmOyapK1ZEkIF
	eDeARBohXJIE+gxZUqW6eLr/vAVNmbtXx3aEKKGl9PPyCCUKK8uFTSBYoj2/MQpLgckMw+
	teIp1bU31RMRj+W+yBnFcP1bUJKZUvg=
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
Subject: [PATCH v2 1/3] tools/mm/page_owner_sort: fix --sort option being silently ignored
Date: Mon,  3 Aug 2026 14:20:54 +0800
Message-Id: <20260803062056.1518070-2-ye.liu@linux.dev>
In-Reply-To: <20260803062056.1518070-1-ye.liu@linux.dev>
References: <20260803062056.1518070-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

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
 tools/mm/page_owner_sort.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/mm/page_owner_sort.c b/tools/mm/page_owner_sort.c
index 35d3d254941c..3c86c8d0618c 100644
--- a/tools/mm/page_owner_sort.c
+++ b/tools/mm/page_owner_sort.c
@@ -821,6 +821,10 @@ int main(int argc, char **argv)
 		set_single_cmp(compare_stacktrace, SORT_ASC);
 		break;
 	case COMP_NO_FLAG:
+		if (sc.size > 0)
+			break;
+		set_single_cmp(compare_num, SORT_DESC);
+		break;
 	case COMP_NUM:
 		set_single_cmp(compare_num, SORT_DESC);
 		break;
-- 
2.25.1

