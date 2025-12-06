Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C5F2877DE;
	Sat,  6 Dec 2025 23:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765062182; cv=none; b=rzqWLD351a4Zc1UaWu5FAJCkY1LGQntm0GpofWqMBm5viGPpyGHY0ekMwqWp5ryVTa69S3t/uLHhVCiLfxoeDMu8mFdxpYoFnWNR3YgD0nEJHXCkfIjoBfa5oX7TMMYDPKZjwCR+rV8nO7SXH1yaIV+u7+XMzXlqyk1C/J4b4DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765062182; c=relaxed/simple;
	bh=YZifJ1dvIIR+mXezMnWNnfK3KMOuY+73A/Qwip8J2FI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WZMtMYyUTPLXCgMTkwcVphALzLLQIAUJzj6xHgw3BQdqDS5QU8LudYc3tvVpayhMTadMYgbO4JOw3JVUKLbxhp8VuLtecjNGgy9TbsenJ9aGJirsKOfdSnFCmbi9UBAeCck2V0rYQ1KQCgQB+a5b8cwa6VTqREpF1IsuPRSLONA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ml5Ukipu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ml5Ukipu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EF5C4CEF5;
	Sat,  6 Dec 2025 23:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765062182;
	bh=YZifJ1dvIIR+mXezMnWNnfK3KMOuY+73A/Qwip8J2FI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ml5Ukipu2YIRmfC2zWNaddAoSeT997AL8NgvuFYBfAl+b37rS4w9nWuzGNZoxFgMe
	 tv2qDqnGU3eYwsHM7C3pccFIoU3CqoJQTdYQcYgpyp8FPYjc4wvmEAKLHuBxTFJzw1
	 6dukN6uux6gsGXX3mMqy0ZIcODl5PAQ6EjwK9nog6kkER5K4xx8XDvSLxw+yme8qsS
	 ZjO5k7OvTyEFPOY0dtt+cLzux+zmWbbwHZtIOkdOZ4z0Meb9uIPVNPuWkuAMLFNIDH
	 L4v65ddsy8Fcy3wovhmFFJNavsXA3rv+KXK1nJZGXWMTGbi8EAUNAeJMbYzL1K6e8G
	 HN4m4uDjC8/ag==
From: Pratyush Yadav <pratyush@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Alexander Graf <graf@amazon.com>,
	David Matlack <dmatlack@google.com>,
	David Rientjes <rientjes@google.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Vipin Sharma <vipinsh@google.com>,
	Zhu Yanjun <yanjun.zhu@linux.dev>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	kexec@lists.infradead.org
Subject: [RFC PATCH 01/10] kho: drop restriction on maximum page order
Date: Sun,  7 Dec 2025 00:02:11 +0100
Message-ID: <20251206230222.853493-2-pratyush@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251206230222.853493-1-pratyush@kernel.org>
References: <20251206230222.853493-1-pratyush@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KHO currently restricts the maximum order of a restored page to the
maximum order supported by the buddy allocator. While this works fine
for much of the data passed across kexec, it is possible to have pages
larger than MAX_PAGE_ORDER.

For one, it is possible to get a larger order when using
kho_preserve_pages() if the number of pages is large enough, since it
tries to combine multiple aligned 0-order preservations into one higher
order preservation.

For another, upcoming support for hugepages can have gigantic hugepages
being preserved over KHO.

There is no real reason for this limit. The KHO preservation machinery
can handle any page order. Remove this artificial restriction on max
page order.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
---

Notes:
    This patch can be taken independent of hugetlb live update support.

 kernel/liveupdate/kexec_handover.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 9dc51fab604f..9aa128909ecf 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -234,7 +234,7 @@ static struct page *kho_restore_page(phys_addr_t phys, bool is_folio)
 	 * check also implicitly makes sure phys is order-aligned since for
 	 * non-order-aligned phys addresses, magic will never be set.
 	 */
-	if (WARN_ON_ONCE(info.magic != KHO_PAGE_MAGIC || info.order > MAX_PAGE_ORDER))
+	if (WARN_ON_ONCE(info.magic != KHO_PAGE_MAGIC))
 		return NULL;
 	nr_pages = (1 << info.order);
 
-- 
2.43.0

