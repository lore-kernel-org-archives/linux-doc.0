Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F165935A948
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 10:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772448996; cv=none; b=FQ6Q4m1LTsU0fH2wa2btRh+ela0hq48+JBG4AbulMmi5elnfkpDdnbLSyyBxYZFqHb9gR1lhjzjfzg5OSe+tKmcCzUt2zMk2ZEzE7KCgFM54TOsPf70cTzlwDBntVsydz45kAYTowvJ9SvUDXrP5YqzVMVw2BUna9cT/nM1XWX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772448996; c=relaxed/simple;
	bh=QIorwtQv/JYtsIRrCdeqpsv5dj2Fg5DePeC8vwGY8zk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uRV4mKTnwQBQZF1uXGWRnplBXBobbD3Gl4cSMeN67CcWNgUCEnHmBTLriX2Dm1gT2GL2BDM0p2ZchT7RhC4QdoA7w0++sGsVm14DzN2Vo1Vf9g7zXqOZR+WxclS7Q7VT29bqXoaeSxCpTJksnsowCTlOFWwDjUJLOfJw7kVStBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MceG+ZEc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MceG+ZEc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2511FC2BCB0;
	Mon,  2 Mar 2026 10:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772448995;
	bh=QIorwtQv/JYtsIRrCdeqpsv5dj2Fg5DePeC8vwGY8zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MceG+ZEcp3/SuWG3t4ZJKUbTlcyKR9LQl0gmjP34KPmM1OPcpJ1jT8FA55hODX/4L
	 AJaIDVM9ISd1REbQj31AJSXJ6mgqV7dO39fYKTD72i5OSI59HlX7/ws/s88h1Vs9hT
	 fWIU+rQVC6tOrQ9fKp7AAVhOq/8Pe4N3GvBE7rbrZzLnzDK4efKsY3qsaFdk/B44i9
	 TGfQMIWfs0PuBOIFl+qyLinNrr1bARru7CjCwNCMBx91f8qA7CboXDT9kyYjZNXXFb
	 nKd/9BWu0Ydc2CnUDlNVSEaVw7rcPdfAcNh4kX0g9Bg0p52D9Pe6tsHrDrTwOlwO/q
	 7XwQMPB8jcVng==
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 245B7F40068;
	Mon,  2 Mar 2026 05:56:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Mon, 02 Mar 2026 05:56:34 -0500
X-ME-Sender: <xms:4myladjV01iWsOUtjtzcj3vZupj1Y1XZ52NB9CTcS42N2KVYqebmBw>
    <xme:4mylabMmI-f6TLtFwjswwP2yHngZCaAvMI2sOn5bsBZjXBTfu-1Owz5vCGlXXgrHJ
    5XA2TBeo-AvKsI4gmrM5H1M3Hu7R75Og4XdJj_eyAdhgwPDGrdE78A>
X-ME-Received: <xmr:4mylaXMtbuPsATgmuxJHjV89K0zt3CuvIB_boPi7x3NPTZBs0D_CosHxgsWlog>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheejgeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucgoteeftdduqddtudculdduhedmnecujfgurhephffvve
    fufffkofgjfhggtgfgsehtkeertdertdejnecuhfhrohhmpedfmfhirhihlhcuufhhuhht
    shgvmhgruhculdfovghtrgdmfdcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhephfdvfedvveejveehhffhvedufedujeefuddvkeehleduhfeihfehudej
    ffffiefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epkhhirhhilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudei
    vdeiheehqddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvg
    hmohhvrdhnrghmvgdpnhgspghrtghpthhtohepvdekpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopehkrghssehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslh
    hinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheprghlvgigsehghhhi
    thhirdhfrhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupd
    hrtghpthhtohepsghhvgesrhgvughhrghtrdgtohhmpdhrtghpthhtoheptghhvghnhhhu
    rggtrghisehkvghrnhgvlhdrohhrghdprhgtphhtthhopegtohhrsggvtheslhifnhdrnh
    gvthdprhgtphhtthhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehf
    vhgulhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:4mylaTL_5a_Tm5FcC4DkzFyVnPOUD7NWAMruXiJ7cLUt4G70LqyDxg>
    <xmx:4mylaWt-BwsGNwvyb1I9YB3jtaA0LQ2aYs58v6i_bSjprG2Qy9v14A>
    <xmx:4mylaVF5tD6lw22TzAR11tltaMNEpftkfceacgzzxR6iJ7oYNXtewg>
    <xmx:4mylaVPV5xjJwdJ_j2BWUtR4lUjIQ7DmcR0whs3UjzW6Fbzus43HZQ>
    <xmx:4mylaYFG6vRkUEa9tC7J99RSubdP_bO__GGYLVU8KE4yvCzo4jTLrzXq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 05:56:33 -0500 (EST)
From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
To: kas@kernel.org
Cc: akpm@linux-foundation.org,
	alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	bhe@redhat.com,
	chenhuacai@kernel.org,
	corbet@lwn.net,
	david@kernel.org,
	fvdl@google.com,
	hannes@cmpxchg.org,
	kernel-team@meta.com,
	kernel@xen0n.name,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	lorenzo.stoakes@oracle.com,
	mhocko@suse.com,
	muchun.song@linux.dev,
	osalvador@suse.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	rppt@kernel.org,
	usamaarif642@gmail.com,
	vbabka@suse.cz,
	willy@infradead.org,
	ziy@nvidia.com
Subject: [PATCHv7.1 17/18] hugetlb: Update vmemmap_dedup.rst
Date: Mon,  2 Mar 2026 10:56:28 +0000
Message-ID: <20260302105630.303492-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260227194302.274384-18-kas@kernel.org>
References: <20260227194302.274384-18-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Kiryl Shutsemau <kas@kernel.org>

Update the documentation regarding vmemmap optimization for hugetlb to
reflect the changes in how the kernel maps the tail pages.

Fake heads no longer exist. Remove their description.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
---
 Documentation/mm/vmemmap_dedup.rst | 60 +++++++++++++-----------------
 1 file changed, 26 insertions(+), 34 deletions(-)

v7.1:
  - Add missing period (Randy);
  - s/per-node/per-zone/ (Muchun);

diff --git a/Documentation/mm/vmemmap_dedup.rst b/Documentation/mm/vmemmap_dedup.rst
index 1863d88d2dcb..9fa8642ded48 100644
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
+The optimization is only applied when the size of the struct page is a power
+of 2. In this case, all tail pages of the same order are identical. See
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
+    HugeTLB                  struct pages(8 pages)                 page frame (new)
+ +-----------+ ---virt_to_page---> +-----------+   mapping to   +----------------+
+ |           |                     |     0     | -------------> |       0        |
+ |           |                     +-----------+                +----------------+
+ |           |                     |     1     | ------┐
+ |           |                     +-----------+       |
+ |           |                     |     2     | ------┼        +----------------------------+
+ |           |                     +-----------+       |        | A single, per-zone page    |
+ |           |                     |     3     | ------┼------> | frame shared among all     |
+ |           |                     +-----------+       |        | hugepages of the same size |
+ |           |                     |     4     | ------┼        +----------------------------+
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

