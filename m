Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D07C03A1A22
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488372; cv=none; b=IpYgHhPlwYJ1zpNPz5XJpHDSWOfB7Onh51OZki2AmdQ4xBxYPgRAPSw3tjKJDkrAeWOzZrd2FeTbPnzeyMOx7bYUBB42uSDHeziY2YPNXVRF4q+p/o7hE6TWR69Wl/nUaTXlBWZ+KuDjwJC5x5+3ccUvwuFi+ezMf9L8tjqvoLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488372; c=relaxed/simple;
	bh=h2aVQ3ENQjj9ztxIwRYvM4dkt+By0RfpKKj6zYgSlLw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIpqFphaUI3RM9v1KMRzYXil84OwlcIqtrTr0nRC/nno+LsHOQTLwno6wL33MXBwGwnix96R1QIZ6w43CqJeZiwACbndz9ku0JymfGlpcQiGcong32bKUceH49i59A3zD93mUHDeDMxsIc1EqVj1lgOKGaHw6dn9kuBLh3C/+DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i9Netuif; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i9Netuif"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01AC1C19423;
	Thu, 15 Jan 2026 14:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488372;
	bh=h2aVQ3ENQjj9ztxIwRYvM4dkt+By0RfpKKj6zYgSlLw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i9Netuifl0YR/4BxtFdfMrYyCXF4B/jBbWTmhyyatFuOJHTRs/w5mpC1sU+GxeFMJ
	 0Woll9vOjlUOQDO0geV9OwfhU8/PPo8qQqtxi7HRNU582F5opZ7VBJvpXzBJ/Er7yU
	 jYZSIN5Ohlw8AvEj+efT20/UcXoQofWQpzxErBIo8V7elS/IWalbVLDuGpLqpMIqLh
	 EaHKqFXPESFncv/Eb+IChWRHIyFUjS3fNvw5bzxxw0lRykHswxGEVelSYnhxP5Eqax
	 Y8vcmnDm0t2vPFmYjo77hqhBGN1k8ob6LClc3Z4aL+kVDmQ87e0cd9FYW2ePYomBPV
	 WHpp/3MqDEs/g==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 19F0EF4006B;
	Thu, 15 Jan 2026 09:46:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 15 Jan 2026 09:46:11 -0500
X-ME-Sender: <xms:s_1oabPvP328C8QJhsdvftsXZlxBDY07Rg49HK8Kl0k_aWs3P3Tv4w>
    <xme:s_1oaUXLCkyOVxELPOHQMsMDp-y-_m_zmiDommX40jaij8aAkgB-TTRlHshJdAy5r
    2Ba1s4z8cAMNYy6dhJLPAJyWP6d6_CR78F9Cb1am5XYL8yu73KzYxk>
X-ME-Received: <xmr:s_1oaWRDQMgWadXE4IzlHNRqYBj4Fo67GGiWtdmapI5FCfSEy1kyY4dYPXviqg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdev
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepvddupdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoh
    epmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:s_1oaS0gdJic4XkVgirKJOx43tM6uDjXzLTdYzibAHljfROdktH3nw>
    <xmx:s_1oabhCoPfzxxc1mRLqYBISskW1uFcCd453tURSDP8S08srym2GLQ>
    <xmx:s_1oaYZs3EZ9P06fRUDUmnNaSo1DtW5Kl5eqSDwmEC_Sr2RlM__uKg>
    <xmx:s_1oacOmnPNPQeXa9nu3Cij79UQOq0l3SC1gAHNrscl7o-OUexZQAg>
    <xmx:s_1oaUTkG-v00HfMZ7Cs7AORxD71IgJYQPXFdJGFHa_yCAW5AfNFcIbA>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:10 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	x86@kernel.org
Subject: [PATCHv3 01/15] x86/vdso32: Prepare for <linux/pgtable.h> inclusion
Date: Thu, 15 Jan 2026 14:45:47 +0000
Message-ID: <20260115144604.822702-2-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260115144604.822702-1-kas@kernel.org>
References: <20260115144604.822702-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 32-bit vDSO for 64-bit kernels is built by faking a 32-bit environment
through various #undefs and #defines in fake_32bit_build.h.

Upcoming change will include <linux/pgtable.h> in <linux/mmzone.h>.
Without preparation, it breaks build of 32-bit vDSO because of exposure
to more 64-bit things.

CONFIG_PHYS_ADDR_T_64BIT triggers "Missing MAX_POSSIBLE_PHYSMEM_BITS
definition" error in <linux/pgtable.h>.

And CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS leads to "shift count >=
width of type" errors in pte_flags_pkey().

Undefine CONFIG_PHYS_ADDR_T_64BIT and CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
in fake_32bit_build.h to fix the problem.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
Cc: x86@kernel.org
---
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
index db1b15f686e3..900cdcde1029 100644
--- a/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
+++ b/arch/x86/entry/vdso/vdso32/fake_32bit_build.h
@@ -13,6 +13,8 @@
 #undef CONFIG_SPARSEMEM_VMEMMAP
 #undef CONFIG_NR_CPUS
 #undef CONFIG_PARAVIRT_XXL
+#undef CONFIG_PHYS_ADDR_T_64BIT
+#undef CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS
 
 #define CONFIG_X86_32 1
 #define CONFIG_PGTABLE_LEVELS 2
-- 
2.51.2

