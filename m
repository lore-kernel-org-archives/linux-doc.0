Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795711215;
	b=IMMkJ+hqojJa2nDu14lcV7beArRVs6B0tI9FlnlSdfXlZlJqofm3BX5PufaNiGwqRwJT
	 ZWDEUnXam9HqIHhnNKBRRmgBzkASkKj+uXoqhP8ObbfLTk7C/4iPFAYdSGX4LJXOkDJQd
	 clmbP7JnSjBfW97eBIN/mQQsIcbI/GPoyIqK2bLZ6Rig8Sx0JFRgxbvjgp53nvokF3WJj
	 2Akw7s6LvKWCFtbwc2ukE2chqFIQMgS38Z4QTPImRQmD+ItP6ILk/vdQHTilJ7yU1+tXe
	 6vOO5wNRnAVY7aVAggYoiKRkHZ7vHiyu65d0WWbubGGfx7oh+ufuuQ7z6w4mDGzPlkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795711215;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=E8O7WWNKkoQQEdjDwXx7NGol23PVosBpBg3kNF7U/ng=;
	b=FfAfNpzCysq+u4Xf6z+bVe6LHG/Q8MayKeb0tOGiyaIG+BH1QuUghpk08y8HsWGadouL
	 9AwEnMIBq0SQ5F7KMHVSGvrMCn9mNoQAhBQgTAAsrMjVWjHykCeclDEZWqSIFrSJAi56y
	 y/kaEtIih9G5d/pXFVu8RUgN4s1yfRVtfa7tjdzkYssLKpFS3VOk8URFWR2HxW3JwFtsh
	 gpjd/My7E05/bbh0MD+S6TMh24I46SI2XkOqS9o/Y0IdPY4KkQdoqvSYCm3aAxFT6+E+g
	 4R4uKnPmYxx535GAQFTVCuW2k5fsORQvB2/Wqbq+8PidJ+7bdMbU1eIcftHLD2p6x/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=k6FSWlGF;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF55606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 16:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FF55606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=k6FSWlGF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Cc:To:Message-Id:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Subject:Date:From:From:Reply-To;
	bh=E8O7WWNKkoQQEdjDwXx7NGol23PVosBpBg3kNF7U/ng=; t=1795711214; x=2111071214; 
	b=k6FSWlGFrPMyhjXiETt1M6RhLDqMK/7pbDdrbwYF9RdYsYSVRlRWO0f/3SLwt8kHcuMryrUGAfy
	d1c9zKm96bQzsbSyo6kAKaS+vkDavTiptF3qADGTIZ33iNPIJbT2puD4QIJuK2kk8xjtTWYXwxX6I
	jgiyueszxJRsMFNcMF3gHZyDA2VvSF3iyxDD+QOzBtPV/DbEIohmilyhnMA57/MvPy0yP5dosoMxX
	ssLZQSW4MNhq6urI33J8YR7P24TL6WmBMg8+sDDGzTzBQ+6/0s8hRW9Y/mRL3bXRVx0LRJePmOEay
	L8cxch8hfHf/oWcp6Rc1LTiUb9/Q6vIfdnMQ==;
Received: from 186-249-145-105.shared.desktop.com.br ([186.249.145.105] helo=[127.0.1.1])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1xWcW1-00000004U25-14Ux;
	Thu, 26 Nov 2026 17:40:09 +0100
From: Mauricio Faria de Oliveira <mfo@igalia.com>
Date: Thu, 26 Nov 2026 13:40:02 -0300
Subject: [PATCH] mm/page_owner: document shell usage of page_owner filters
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-page_owner_filter_shell-v1-1-cbbcff2fcb08@igalia.com>
X-B4-Tracking: v=1; b=H4sIAOFgCGsC/x2MUQqAIBAFrxL7nZBbSHSViIh65oJYaFQQ3T3pa
 5iPmYcSoiBRVzwUcUqSLWTRZUGzm8IKJUt24oqN1mzUPq0Ytysgjlb8kZEcvFewM+rWcgOuKNd
 7hJX7P/fD+34xbEk7aQAAAA==
X-Change-ID: 20261126-page_owner_filter_shell-efce38f24e20
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Zhen Ni <zhen.ni@easystack.cn>
Cc: kernel-dev@igalia.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
 Mauricio Faria de Oliveira <mfo@igalia.com>
X-Mailer: b4 0.14.2

Document how to use page_owner filters directly from the shell,
without relying on the page_owner_filter tool, with an example.

Signed-off-by: Mauricio Faria de Oliveira <mfo@igalia.com>
---
Tested with `make htmldocs` and checking the change in a web browser.
---
 Documentation/mm/page_owner.rst | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/mm/page_owner.rst b/Documentation/mm/page_owner.rst
index bd027377dff6ee8f06462884baee458d621686b7..11fdde0ab77d6610dc3ad2234e30238bcdf1f226 100644
--- a/Documentation/mm/page_owner.rst
+++ b/Documentation/mm/page_owner.rst
@@ -343,3 +343,21 @@ terminals you can run different filters simultaneously::
 
 	# Terminal 2: Filter node 1 (runs concurrently)
 	./page_owner_filter -n 1 > node1_output.txt
+
+The shell can also be used instead of the page_owner_filter tool, as long as the
+same file descriptor is used to write filter commands then read filtered output.
+For example, using file descriptor 3::
+
+	# Open file in read-write mode
+	exec 3<>/sys/kernel/debug/page_owner
+
+	# Write filter command(s)
+	echo 'mode=handle' >&3
+	# (and/or)
+	echo 'nid=0' >&3
+
+	# Read filtered output
+	cat <&3 >output.txt
+
+	# Close file
+	exec 3>&-

---
base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
change-id: 20261126-page_owner_filter_shell-efce38f24e20

Best regards,
-- 
Mauricio Faria de Oliveira <mfo@igalia.com>

