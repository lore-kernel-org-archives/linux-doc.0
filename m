Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF45D347BCC
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963852; cv=none; b=LSzTjanAY2tKmxzmmNYDyPA4eYrvv8l0QmiHN8MlC/7buJg5sl1ed29FkZmbpIN4VJByBaQq3o3G1F9FnbazD3HgXYxkSZ2xdQlGig92cP3bVx0uGX8zE36obJCP2Qzz4zr8r53LEHDZQnKhC9HethArnR8HWc5Rky5bOvBrXt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963852; c=relaxed/simple;
	bh=qHJKjreeIB8u6+GC7KtXgFelYE26+ueZzxyId6y/BHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TsPU0VltQl45JDtgTPRwUUjghYhzCm/MdruXvdK9E5KQQxw/c6Wosa5SKJn7sFqbz0WFubK/vUhTKwDslwvWEe52Wpsx4iRZFEnsno3znBH0tvnsYpC/C/24j4mKiXM3jZ4NOjAoeYoX6E9Dr0agHrN9gAgwNByInRoExvYB3SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DHWLD6d1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DHWLD6d1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46245C4AF09;
	Fri,  5 Dec 2025 19:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963852;
	bh=qHJKjreeIB8u6+GC7KtXgFelYE26+ueZzxyId6y/BHA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DHWLD6d1Z7oESwvFbqfNgCIibMctqywL2juHc9sRMr8PMC8PgxrNHpo0yAvXwFWrz
	 awJ12+wQGLrrfKmypUPg6SvkxT69k9S8wVE0vIOPNp8UqjT7Qdo+aCV0M+d1ZedKnD
	 JX9BD1ympFEI/b09lGMVb1CHXODC8BAUJ45qAVnehlEtAlR7kpMeNUmdwiMaxkwr4X
	 RA6ijljTbB6ZPHr/jntjwlmYWoL7aXRJAwgXBgwERFHINLbozvISzPOJXgda81869P
	 TJdJO2yq971Y0gEtq9qZTKF65/SoJedDOC/fD2V3M6mU4mqXF8hoG/aV+QyhUK3tiT
	 ocngojj1nvPjg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 91C13F40070;
	Fri,  5 Dec 2025 14:44:11 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 05 Dec 2025 14:44:11 -0500
X-ME-Sender: <xms:CzYzacuEDobpd0dd8jwjISI2iocJ5NUG65dqIAF7L9fUSVCP3PgjJw>
    <xme:CzYzaa2Du_apaQOvKv0oqRifNs-71e6vc-XDroseY0Gy-7ndFMwOrsW_APu5vLkV6
    fTY1i1W73inQqdiTkEEq83sv02pJeHKo9SZujMs3VRKzMeUcTavMY8>
X-ME-Received: <xmr:CzYzaRA-V4uXYWNkj72EKMSUtPlB6w21f1Vd_teFOR1wC6fdqbJGJM2jW_6IkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeffkefffedugfeiudejheefleehteevtefgvefhveetheehkefhjeefhefgleejveen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeduledpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvg
    dprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggs
    khgrsehsuhhsvgdrtgiipdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesoh
    hrrggtlhgvrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhr
    ghdprhgtphhtthhopeiiihihsehnvhhiughirgdrtghomh
X-ME-Proxy: <xmx:CzYzaXeDntB38jw0Vf1yF8pPBmq6qMF6evx7z-aUKyC5HTY_REF3sg>
    <xmx:CzYzaTzt9LabJkaD0ji25niHES210gpkgCYmSK8ev7dKtFinKkRNxw>
    <xmx:CzYzaSNIoMNoSxElwtkEgVBiva09vHqKWy9CLqBH417nwiievLSqVw>
    <xmx:CzYzaSZ7QdggY1ALRSw5JvTpKdp9wsP1-urPY3hrq6Mi7ajskLoaYw>
    <xmx:CzYzaUrLQ4jhnBUc5B-W8Q0vLRGK0irdmr6OqxtxJQJvlYiO8f6nND6t>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:44:11 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Usama Arif <usamaarif642@gmail.com>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH 11/11] hugetlb: Update vmemmap_dedup.rst
Date: Fri,  5 Dec 2025 19:43:47 +0000
Message-ID: <20251205194351.1646318-12-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
References: <20251205194351.1646318-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update the documentation regarding vmemmap optimization for hugetlb to
reflect the changes in how the kernel maps the tail pages.

Fake heads no longer exist. Remove their description.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
 1 file changed, 26 insertions(+), 34 deletions(-)

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 1863d88d2dcb..a0c4c79d6922 100644
--- a/Documentation/mm/vmemmap_dedup.rst
+++ b/Documentation/mm/vmemmap_dedup.rst
@@ -124,33 +124,35 @@ Here is how things look before optimization::
  |           |
  +-----------+
 
-The value of page->compound_info is the same for all tail pages. The first
-page of ``struct page`` (page 0) associated with the HugeTLB page contains the 4
-``struct page`` necessary to describe the HugeTLB. The only use of the remaining
-pages of ``struct page`` (page 1 to page 7) is to point to page->compound_info.
-Therefore, we can remap pages 1 to 7 to page 0. Only 1 page of ``struct page``
-will be used for each HugeTLB page. This will allow us to free the remaining
-7 pages to the buddy allocator.
+The first page of ``struct page`` (page 0) associated with the HugeTLB page
+contains the 4 ``struct page`` necessary to describe the HugeTLB. The remaining
+pages of ``struct page`` (page 1 to page 7) are tail pages.
+
+The optimization is only applied when the size of the struct page is a power-of-2
+In this case, all tail pages of the same order are identical. See
+compound_head(). This allows us to remap the tail pages of the vmemmap to a
+shared, read-only page. The head page is also remapped to a new page. This
+allows the original vmemmap pages to be freed.
 
 Here is how things look after remapping::
 
-    HugeTLB                  struct pages(8 pages)         page frame(8 pages)
- +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
- |           |                     |     0     | -------------> |     0     |
- |           |                     +-----------+                +-----------+
- |           |                     |     1     | ---------------^ ^ ^ ^ ^ ^ ^
- |           |                     +-----------+                  | | | | | |
- |           |                     |     2     | -----------------+ | | | | |
- |           |                     +-----------+                    | | | | |
- |           |                     |     3     | -------------------+ | | | |
- |           |                     +-----------+                      | | | |
- |           |                     |     4     | ---------------------+ | | |
- |    PMD    |                     +-----------+                        | | |
- |   level   |                     |     5     | -----------------------+ | |
- |  mapping  |                     +-----------+                          | |
- |           |                     |     6     | -------------------------+ |
- |           |                     +-----------+                            |
- |           |                     |     7     | ---------------------------+
+    HugeTLB                  struct pages(8 pages)                 page frame
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +----------------+
+ |           |                     |     0     | -------------> |       0        |
+ |           |                     +-----------+                +----------------+
+ |           |                     |     1     | ------┐
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------┼        +----------------+
+ |           |                     +-----------+       |        | vmemmap_tail   |
+ |           |                     |     3     | ------┼------> | shared for the |
+ |           |                     +-----------+       |        | struct hstate  |
+ |           |                     |     4     | ------┼        +----------------+
+ |           |                     +-----------+       |
+ |           |                     |     5     | ------┼
+ |    PMD    |                     +-----------+       |
+ |   level   |                     |     6     | ------┼
+ |  mapping  |                     +-----------+       |
+ |           |                     |     7     | ------┘
  |           |                     +-----------+
  |           |
  |           |
@@ -172,16 +174,6 @@ The contiguous bit is used to increase the mapping size at the pmd and pte
 (last) level. So this type of HugeTLB page can be optimized only when its
 size of the ``struct page`` structs is greater than **1** page.
 
-Notice: The head vmemmap page is not freed to the buddy allocator and all
-tail vmemmap pages are mapped to the head vmemmap page frame. So we can see
-more than one ``struct page`` struct with ``PG_head`` (e.g. 8 per 2 MB HugeTLB
-page) associated with each HugeTLB page. The ``compound_head()`` can handle
-this correctly. There is only **one** head ``struct page``, the tail
-``struct page`` with ``PG_head`` are fake head ``struct page``.  We need an
-approach to distinguish between those two different types of ``struct page`` so
-that ``compound_head()`` can return the real head ``struct page`` when the
-parameter is the tail ``struct page`` but with ``PG_head``.
-
 Device DAX
 ==========
 
-- 
2.51.2

