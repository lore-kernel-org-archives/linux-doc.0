Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116024;
	b=jjunuLvY6+CfWHV/8ylBXpcMENTwrXU6n97mbeMuPd2bn+97SwUFDOaag0jYzRm+tdwr
	 cjIF9nrXTGPt9S1DoaVQzi3aHOrEmo1sF4SnMrrjvfl+Iq28oLbrU4SoAFprmByBvvl6N
	 I/uHweRjcOEqzJu0ikCj3TXD7k7RZF4sa4/zVC6aD9sSFwSWCNWA4kmwOJf3tpiYLLcWl
	 AjkyKceTta8YF6FKhH1fYkSVSHMN76D4qMDyC6RxqXBWpLULP+l26N/RUheTltpmcxO1A
	 un8uPwCurL14mss6K413A6pRUvnceIbceg+ALbJzUtdn+1E0ez3MbJls+pag1rmE1Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
	b=Ij0TqtzNVYMMb7mgEG/GFuZuWnBFOkzVAvODIJ4d9Gg3aNZ+MES3tdiAZa1BWyTw4qDI
	 dJo4FZlWX/HTdiLEOxm08VmxXr80TbT3pSrBY4RpeJTm9kVmpL7YD+etgiFW4LIyAP9t8
	 HnBSr4HiRL5nbvXN6dY2zOB0RzQX8u+oQC9yhWwdGPiz08sRCrQTUuUHmNtGEGyIe28GA
	 R0qraiDi3WV9WHPI5SbuDhLY6umMJCuW/+F+zkk2M3Ce761BxQVBOuGahYiRYR7xF9jpI
	 20n2xhpoUZMI5Dd5ZCFNlfSeafjOvYICE3R2S4t012YVIwcL2J3Vwe8dzPtvJynPMUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYgbAXpo;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17BA606AB4B
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 15:47:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17BA606AB4B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kYgbAXpo
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48c5358fc28so3887424f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 08:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793116022; x=1793720822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
        b=kYgbAXpozbCUdGlBS7i82c+HK8MQPHZLP6JTZwYIufdiodAlugvi+KaM8RIqPD2Sig
         R596RyoB8hOV1ttoXUMF6NhtygxqOn73iCeQM06LQSR0RBbsWmQPpSoxWdeuJ9vlxkGZ
         M7DHCeMXwNtebzXa2LsBwTU9y/3WCEu45ucigVcSwIjSXbQ064ClRw/arY3H5eECzHU2
         VJ7K/msDM71SNeqzjXofQeXV1Csvz8zpPoj7D49oii1p7ggUYjXsBFQUNllFRtAEPiDr
         E+8gtTFLGCBodk7j0bWSpqLCL34CwW6iGhS8jvu6lryOKJUKTxdlevPp5eIRazHVG1hc
         jkvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116022; x=1793720822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c+t2RCt7p+zsicFUGs0SiXsBnjjHZ+TU2eQo8OoRVfQ=;
        b=jZ2Q2bwnmliCN0X126PYj5DgGjaHn2oL1KRH4j3+q3mPUGancDyQiKPU9TV3B7PhNU
         qybGvj/WV5otqSIh9ZZR5Xm67Yrbk80+VALF3avOUAFD6OENARDYdHzoUpzve4unF4I/
         k/td41KkIB89P5wyt7elhzoaFBvlmhydNKFRiKEGCIuq+J+zumZd/FDB6EIVAL0wNAT2
         Bg/GWDxKz55P52cL7DXoRZ1hGoHpzoOiFe1NzeUReZAOPoX7psmXS124aINWfgASS0c0
         7/Upif1Z5lTE4OrjNi9KoiQflYEQWSlKeFBfUAf6+AL5MMgc4L3qDjVlH41SEKcZukQr
         yjpg==
X-Forwarded-Encrypted: i=1; AKwUvBxWYNbnE3Cz22NVfLupewLeFrnbUQgoEmwc1v49SEMwZOOuAHuKLQAgaR+r9mVdF1uVvDAK62GEVgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQ4JhYHkbcu1dLpg4YPD5hHUBFjd0TYb0+7Ja5uOqexaAlifC+
	xi67I9NfIO5KulwG43LIfw2tlu8zcOk94xExq6b8z1iCVhk9e2wuMATj
X-Gm-Gg: AYBFou3heFaKp0j3Bj1Sob5ikwolM1xaTz8kq6II8FJjq17dzQT9qvlJOkj6MlX6V1F
	HyMdiODNelIAjmPNylAqeB5y24bdYmMY06TGzTQ/2WyST9WF5JuqhNnwJsXISCPBl69ukimY4UP
	6TlIIKCckmfhpPiwJOSxz20j77LLkEEspMoATrx1/vYtk171cNKysc/CQc4GiuAWufjQI01VjmK
	FAHS2vRQ3+3zcW84IzQCVpbV0Bj+sOYv3PwAFAN6p2ZQ8aQY3UfK955RLnb26RHz20KU5bXMYfK
	w22BxvI/jnCjcA6JVX71PqUqZpy6Av5xyT3NGlVKyD+65aIgIHpubfPexZK3C3oT2S/bONk804X
	E+rN/FN7QEN6/vx5ohGpQ+iqrC8QjSH5DiBkOzQXK/S0/fHqjUXnIo/DcqZHdQM3OIkeuwT8y4k
	z7o3vC9m1FH5yb4JraPlf5TlzLJv6ciK2UUraBihxI3pL9A0RNtZWYXK853nJT7SzRfOKn4Miq7
	zLdVuNbIPyzzlTLB3jbLArOT09hpqJm72uPgxSkc8pIuh+n7CQAQxplUcfM98sZU3rEuUeNZliZ
	RP6Ef9DRl7ZFB10gswR4XzNcAS8JFrLaSRH0y5G3IsPP1s5SEJax5xzGb+NlHz+wXkQtTHFZ1up
	8dcYkx4RpaqutSPwX1C7f69+CUDwZrGEY3aexnw==
X-Received: by 2002:a05:6000:469c:b0:488:5d44:6680 with SMTP id ffacd0b85a97d-48e3eb9161fmr12046915f8f.36.1793116022012;
        Tue, 27 Oct 2026 08:47:02 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb958sm23845574f8f.21.2026.10.27.08.46.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 27 Oct 2026 08:47:01 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Ackerley Tng <ackerleytng@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>
Cc: Alex Williamson <alex@shazbot.org>,
	Alexander Graf <graf@amazon.de>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alexey Kardashevskiy <aik@amd.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Baolu Lu <baolu.lu@linux.intel.com>,
	Bill Wendling <morbo@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Connor Williamson <connordw@amazon.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	David Hildenbrand <david@kernel.org>,
	David Rientjes <rientjes@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Erdem Aktas <erdemaktas@google.com>,
	Frank van der Linden <fvdl@google.com>,
	Gregory Price <gourry@gourry.net>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Hugh Dickins <hughd@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jacob Pan <jacob.pan@linux.microsoft.com>,
	James Houghton <jthoughton@google.com>,
	Jan Kara <jack@suse.cz>,
	Jianxiong Gao <jxgao@google.com>,
	Joerg Roedel <joro@8bytes.org>,
	Joey Gouly <joey.gouly@arm.com>,
	John Starks <John.Starks@microsoft.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Justin Stitt <justinstitt@google.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Michael Roth <michael.roth@amd.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Oliver Upton <oupton@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Tarun Sahu <tarunsahu@google.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Tycho Andersen <tycho@kernel.org>,
	Vishal Annapurve <vannapurve@google.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Will Deacon <will@kernel.org>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	x86@kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org,
	llvm@lists.linux.dev,
	iommu@lists.linux.dev
Subject: [RFC PATCH 04/14] KVM: guest_memfd: Keep truncated folios until the exports are updated
Date: Tue, 27 Oct 2026 15:46:39 +0000
Message-ID: <20261027154649.91571-5-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027154649.91571-1-griffoul@gmail.com>
References: <20261022-gmem-alternative-providers-v2-0-5dd1dc6c660a@google.com>
 <20261027154649.91571-1-griffoul@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

A punch hole frees the folios it truncates at once, but an export may
still map them, since it holds no reference: a device would then write
into freed memory.

Truncate a folio mode range batch by batch, holding a reference on each
folio until the exports are updated, so that a folio goes back to the
allocator only once no device maps it.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 include/linux/guest_memfd.h | 28 ++++++++++++++--------------
 virt/kvm/guest_memfd.c      | 30 ++++++++++++++++++++++++++++--
 2 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/include/linux/guest_memfd.h b/include/linux/guest_memfd.h
index fdf7f8404d6c..ba3eebb1ed1a 100644
--- a/include/linux/guest_memfd.h
+++ b/include/linux/guest_memfd.h
@@ -89,14 +89,14 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * A subsystem that maps guest_memfd pages, such as iommufd, can neither pin
  * nor fault them.  It attaches to the file, looks up the frame behind each
  * shared page without taking a reference, and guest_memfd calls its update()
- * whenever what a lookup returns for a range may have changed: conversions and
- * memory failure.  update() makes the consumer's mappings of the range match
- * what a lookup returns now: a frame, or a hole for a private page or a page
- * without a frame.  It may be called for pages that did not change, and for
- * ranges that do not follow the blocks that lookups report: the consumer may
- * then remap whole blocks, also outside the range, e.g. to merge them into
- * larger mappings.  A consumer that can fault may instead only remove its
- * mappings of the range.
+ * whenever what a lookup returns for a range may have changed: conversions,
+ * punch holes and memory failure.  update() makes the consumer's mappings of
+ * the range match what a lookup returns now: a frame, or a hole for a private
+ * page or a page without a frame.  It may be called for pages that did not
+ * change, and for ranges that do not follow the blocks that lookups report:
+ * the consumer may then remap whole blocks, also outside the range, e.g. to
+ * merge them into larger mappings.  A consumer that can fault may instead only
+ * remove its mappings of the range.
  *
  * Until update() returns, the frames it replaces stay valid, so a consumer
  * may switch each mapping to its new target in one step; once it returns,
@@ -104,12 +104,12 @@ static inline int kvm_gmem_revoke(struct inode *inode, pgoff_t start, size_t nr_
  * that needs memory to apply one, e.g. to split a large mapping, reserves it
  * beforehand.
  *
- * guest_memfd calls update() with its invalidate lock held, exclusive when
- * pages convert and shared on memory failure, possibly with a folio of the
- * file locked; so update() may only call kvm_gmem_export_lookup_pfn().  Under
- * the shared lock, updates may run at the same time, also for overlapping
- * ranges.  The consumer holds a lock across a lookup and the mapping it
- * installs, which update() also takes.  Lock order:
+ * guest_memfd calls update() with its invalidate lock held, exclusive when it
+ * takes frames away or pages convert and shared on memory failure, possibly
+ * with a folio of the file locked; so update() may only call
+ * kvm_gmem_export_lookup_pfn().  Under the shared lock, updates may run at the
+ * same time, also for overlapping ranges.  The consumer holds a lock across a
+ * lookup and the mapping it installs, which update() also takes.  Lock order:
  *
  *   guest_memfd invalidate lock
  *     consumer lock
diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 81031483a1f1..65a951fa49c2 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -424,7 +424,7 @@ static void kvm_gmem_invalidate_end(struct inode *inode, pgoff_t start,
 
 /*
  * What a lookup returns for [start, end) may have changed: exclusive lock when
- * pages converted, shared on memory failure.
+ * frames were taken away or pages converted, at least shared on memory failure.
  */
 static void kvm_gmem_update_exports(struct inode *inode, pgoff_t start,
 				    pgoff_t end)
@@ -437,6 +437,32 @@ static void kvm_gmem_update_exports(struct inode *inode, pgoff_t start,
 		e->ops->update(e, start, end - start);
 }
 
+/*
+ * Truncate [start, end) of a folio mode file.  The exports map the folios
+ * without references, so hold the folios until the exports are updated.
+ */
+static void kvm_gmem_truncate(struct inode *inode, pgoff_t start, pgoff_t end)
+{
+	struct folio_batch fbatch;
+	pgoff_t next = start;
+	unsigned int i;
+
+	folio_batch_init(&fbatch);
+	while (filemap_get_folios(inode->i_mapping, &next, end - 1, &fbatch)) {
+		pgoff_t first = max(fbatch.folios[0]->index, start);
+		pgoff_t last = min(next, end);
+
+		truncate_inode_pages_range(inode->i_mapping,
+					   (loff_t)first << PAGE_SHIFT,
+					   ((loff_t)last << PAGE_SHIFT) - 1);
+		kvm_gmem_update_exports(inode, first, last);
+		for (i = 0; i < folio_batch_count(&fbatch); i++)
+			folio_put(fbatch.folios[i]);
+		folio_batch_reinit(&fbatch);
+		cond_resched();
+	}
+}
+
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_RECLAIM
 static void kvm_gmem_pfn_reclaim(struct gmem_inode *gi, pgoff_t start, pgoff_t end)
 {
@@ -499,7 +525,7 @@ static int __kvm_gmem_revoke(struct inode *inode, pgoff_t start,
 		if (put_pfn_range)
 			gmem_provider_put_pfn_range(GMEM_I(inode), start, nr_pages);
 	} else {
-		truncate_inode_pages_range(inode->i_mapping, offset, offset + len - 1);
+		kvm_gmem_truncate(inode, start, end);
 	}
 
 	kvm_gmem_invalidate_end(inode, start, end);
-- 
2.47.3

