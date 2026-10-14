Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C8334E0B61
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 09:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970670; cv=none; b=plzDe1jNfQYCf1UuXfB+xdxg+eyIGj7WN+jIpcSL0RhZufYM7H1VYYwM+4SjPGN1BIdncMuNhhSSaDovmUxemOevHoo1xeUleZK+mCdIy3Gs5XpjAJaXyoUhXZ9gn+rVuPCh6Nj/2JpDaSeiGPb1R1D1Q79FxJK3IttHSJFXOzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970670; c=relaxed/simple;
	bh=2O/iMNJqoH7UyElUt7ICv1K7dgb27nZuWpr+bMknwbw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M3bo3zx7IxtxYM9HGAUfmch+TJIJ7XJre3vWAbGLBNjZ0BI4Krz5FyHk49QizyVARRcxPrrvt/Xjnnr9gQ/xOl5K7krGtRhoM94uylNfChmKtBHhVxo3Y+NpO10icuTUaVNuLMgC3AQL+j08BCgOBZbDupm+D2V/UNOHIoW0Yng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ilEzmITa; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ilEzmITa"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a022fee0caso36236335e9.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 02:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791970662; x=1792575462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2bE4GOYNuN0L2A43+aeT8XcVziQfGC7lOtj0K7aqEDA=;
        b=ilEzmITaoEE37e+FUnBnhOM2k6GUMNWp5SLEtQOdREEFQ3WCNu57mkHiA5g0ty5YFg
         WGVwgR87/XbObZyX59CVtImVf3W0hzv/Tb+HdfNReenDHbH9W51g+YrA6R1hmCFWw3lG
         k3IA499rKupej+1k0RrtpvwdHZLxQm/SPqVuonNJF6yftq1efBictUwLowlMZ+w0WvU9
         QIaEY1ky+PCf0G7Td2uH7EUTOk6U8BVpd0cE8tzRXgK+eIPQCM7aa7oQ3Qjm1L62W5Xz
         uXlpyBcsgIWE1/izlOW/4vPv4hcJnJO43wv1fDCF8g/VF7khno0h1Qqj1O2aanehMYr/
         D/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970662; x=1792575462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2bE4GOYNuN0L2A43+aeT8XcVziQfGC7lOtj0K7aqEDA=;
        b=hFXSl8rjEG4i/wtgItegsgWRtsTYoTb/X9xhpHyVOSvvd6NGHE/Xt2e1o2dfah+FOF
         I2xiA96f57wwBx0CjiW1MlppRBlYyHEcnMLRPfT8SHd3Sd389UsRuaYYBheSVoxXDtVo
         75l2ZRlKE1yNQgvrjawzM9+HlseDiP1PLJRe0uyYL1pzaYDDseBbRj3A6my0tDu5ELMy
         CBv+vjkQr1yFOqsrid2IojS7n3cMsBYTYFBfBSpDr2S7j3mAcfB5hs3nfB4zJiAcI57w
         tkYC+Nn0OnsIn4tOG/0RwrggtD3FgIsrLfcE7gwLzmENaTJaMiDlmLzabl/puRIsFhQS
         PTWQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+TYNGS8Tdt918cuhyubB+2ZGcHuy5KOMyVjPiM+FG79mJv6gF13x2DWS/iO6flWfbSb/P/2rNPSI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe3LQm46zLTPNnphvQ+6dWcY29lTeatefq0kPbMeACp0rva6o1
	u0WCpBE8KZD2uYJe1wJnsuskl8kwxUgI8Gnn25E2Tp+/F+NTjT/kEmdH
X-Gm-Gg: AYBFou0JneroPaeFD5OsM+2dTRdYnCiBMxz2K6oYrn+rJs5z8MH4rEnE+y8KuTqAAE4
	4in2w4Q3evbmDS0H48nACBbP+ZssYPT3PiDV8yvvPYpVp5y82ueLiJGW0aA8Zo99GPBYrDxZPZn
	zQHCKGhPZwGeCkcvfalPMv/uuJms7w6oB9UZxMapmoAH8H8BW77E2FAQLtRNb+yCzZOxvK0Mpdu
	y2qXo1WY82IGoizxeQ/HBN4tbLRIt/3Ex/02p3liq3MPpy7AgXHHUuDh8LvpiDbNnppgvinxqKr
	ia+za6zL18eI0jDDwcS87CnJjukltO8I7vb84SLdPOq4GOLWf6Kl3QSAIwctqzjnM5srsm+bVag
	B0nIaCM868QIuAb91Kl+Xejl2o0ptP2vJF0G9jgd42BX4vPHr0hfcUJ5EC8vqgKrc7gZ4whDpD7
	WLJ7+jIr6kugdYp3dBxqRGHAObvcu53/6MijrB+j4i71Wlc2tMmgWidM1slqRjVryeP2+GabfHi
	FLa39VRBjJXnGke9FOqLue7YbxhR6Xc6g82XlHVEiOnFtxk/++oOA8so3Vxds290Hxshglm29jN
	Ra9Zp4lX2SKq88sgAJkWxxDRNZMdFG2Mj2E=
X-Received: by 2002:a05:600c:5493:b0:4a1:78da:d271 with SMTP id 5b1f17b1804b1-4a18e4ee976mr332971435e9.30.1791970662375;
        Wed, 14 Oct 2026 02:37:42 -0700 (PDT)
Received: from dev-dsk-fgriffo-1c-93421965.eu-west-1.amazon.com (54-240-197-234.amazon.com. [54.240.197.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de3f7f8b8sm9365477f8f.35.2026.10.14.02.37.41
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:37:41 -0700 (PDT)
From: Fred Griffoul <griffoul@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Kevin Tian <kevin.tian@intel.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 05/11] iommufd: Track the domains of pages that are not pinned
Date: Wed, 14 Oct 2026 09:37:27 +0000
Message-ID: <20261014093733.90312-6-griffoul@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261014093733.90312-1-griffoul@gmail.com>
References: <20261014093733.90312-1-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fred Griffoul <fgriffo@amazon.co.uk>

Memory provider pages, added in the next patch, are not pinned and can
change under the domains that map them, as a dma-buf can. They need the
same list of (area, domain) pairs that the dma-buf revoke uses.

Move that list from struct iopt_pages_dmabuf to struct iopt_pages.

No functional change.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Fred Griffoul <fgriffo@amazon.co.uk>
---
 drivers/iommu/iommufd/io_pagetable.c | 24 +++++-----
 drivers/iommu/iommufd/io_pagetable.h | 33 +++++++++-----
 drivers/iommu/iommufd/pages.c        | 67 ++++++++++++++--------------
 3 files changed, 67 insertions(+), 57 deletions(-)

diff --git a/drivers/iommu/iommufd/io_pagetable.c b/drivers/iommu/iommufd/io_pagetable.c
index 24d4917105d9..bcd531acc9dd 100644
--- a/drivers/iommu/iommufd/io_pagetable.c
+++ b/drivers/iommu/iommufd/io_pagetable.c
@@ -1008,14 +1008,14 @@ static void iopt_unfill_domain(struct io_pagetable *iopt,
 				WARN_ON(!area->storage_domain);
 			if (area->storage_domain == domain)
 				area->storage_domain = storage_domain;
-			if (iopt_is_dmabuf(pages)) {
+			if (iopt_pages_tracked(pages)) {
 				if (!iopt_dmabuf_revoked(pages))
 					iopt_area_unmap_domain(area, domain);
-				iopt_dmabuf_untrack_domain(pages, area, domain);
+				iopt_pages_untrack_domain(pages, area, domain);
 			}
 			mutex_unlock(&pages->mutex);
 
-			if (!iopt_is_dmabuf(pages))
+			if (!iopt_pages_tracked(pages))
 				iopt_area_unmap_domain(area, domain);
 		}
 		return;
@@ -1033,8 +1033,8 @@ static void iopt_unfill_domain(struct io_pagetable *iopt,
 		WARN_ON(area->storage_domain != domain);
 		area->storage_domain = NULL;
 		iopt_area_unfill_domain(area, pages, domain);
-		if (iopt_is_dmabuf(pages))
-			iopt_dmabuf_untrack_domain(pages, area, domain);
+		if (iopt_pages_tracked(pages))
+			iopt_pages_untrack_domain(pages, area, domain);
 		mutex_unlock(&pages->mutex);
 	}
 }
@@ -1065,15 +1065,15 @@ static int iopt_fill_domain(struct io_pagetable *iopt,
 			continue;
 
 		guard(mutex)(&pages->mutex);
-		if (iopt_is_dmabuf(pages)) {
-			rc = iopt_dmabuf_track_domain(pages, area, domain);
+		if (iopt_pages_tracked(pages)) {
+			rc = iopt_pages_track_domain(pages, area, domain);
 			if (rc)
 				goto out_unfill;
 		}
 		rc = iopt_area_fill_domain(area, domain);
 		if (rc) {
-			if (iopt_is_dmabuf(pages))
-				iopt_dmabuf_untrack_domain(pages, area, domain);
+			if (iopt_pages_tracked(pages))
+				iopt_pages_untrack_domain(pages, area, domain);
 			goto out_unfill;
 		}
 		if (!area->storage_domain) {
@@ -1102,8 +1102,8 @@ static int iopt_fill_domain(struct io_pagetable *iopt,
 			area->storage_domain = NULL;
 		}
 		iopt_area_unfill_domain(area, pages, domain);
-		if (iopt_is_dmabuf(pages))
-			iopt_dmabuf_untrack_domain(pages, area, domain);
+		if (iopt_pages_tracked(pages))
+			iopt_pages_untrack_domain(pages, area, domain);
 		mutex_unlock(&pages->mutex);
 	}
 	return rc;
@@ -1315,7 +1315,7 @@ static int iopt_area_split(struct iopt_area *area, unsigned long iova)
 		return -EBUSY;
 
 	/* Maintaining the domains_itree below is a bit complicated */
-	if (iopt_is_dmabuf(pages))
+	if (iopt_pages_tracked(pages))
 		return -EOPNOTSUPP;
 
 	if (new_start & (alignment - 1) ||
diff --git a/drivers/iommu/iommufd/io_pagetable.h b/drivers/iommu/iommufd/io_pagetable.h
index 27e3e311d395..ba539bfaac31 100644
--- a/drivers/iommu/iommufd/io_pagetable.h
+++ b/drivers/iommu/iommufd/io_pagetable.h
@@ -70,15 +70,14 @@ void iopt_area_unfill_domain(struct iopt_area *area, struct iopt_pages *pages,
 void iopt_area_unmap_domain(struct iopt_area *area,
 			    struct iommu_domain *domain);
 
-int iopt_dmabuf_track_domain(struct iopt_pages *pages, struct iopt_area *area,
-			     struct iommu_domain *domain);
-void iopt_dmabuf_untrack_domain(struct iopt_pages *pages,
-				struct iopt_area *area,
-				struct iommu_domain *domain);
-int iopt_dmabuf_track_all_domains(struct iopt_area *area,
-				  struct iopt_pages *pages);
-void iopt_dmabuf_untrack_all_domains(struct iopt_area *area,
-				     struct iopt_pages *pages);
+int iopt_pages_track_domain(struct iopt_pages *pages, struct iopt_area *area,
+			    struct iommu_domain *domain);
+void iopt_pages_untrack_domain(struct iopt_pages *pages, struct iopt_area *area,
+			       struct iommu_domain *domain);
+int iopt_pages_track_all_domains(struct iopt_area *area,
+				 struct iopt_pages *pages);
+void iopt_pages_untrack_all_domains(struct iopt_area *area,
+				    struct iopt_pages *pages);
 
 static inline unsigned long iopt_area_index(struct iopt_area *area)
 {
@@ -194,7 +193,8 @@ enum iopt_address_type {
 	IOPT_ADDRESS_DMABUF,
 };
 
-struct iopt_pages_dmabuf_track {
+/* An area of the pages mapped into a domain, for pages that are not pinned. */
+struct iopt_pages_track {
 	struct iommu_domain *domain;
 	struct iopt_area *area;
 	struct list_head elm;
@@ -205,7 +205,6 @@ struct iopt_pages_dmabuf {
 	struct phys_vec phys;
 	/* Always PAGE_SIZE aligned */
 	unsigned long start;
-	struct list_head tracker;
 };
 
 /*
@@ -246,6 +245,12 @@ struct iopt_pages {
 	struct rb_root_cached access_itree;
 	/* Of iopt_area::pages_node */
 	struct rb_root_cached domains_itree;
+	/*
+	 * Of iopt_pages_track::elm.  Pages that are not pinned can change
+	 * under the domains that map them, so every (area, domain) that maps
+	 * them is listed here.  See iopt_pages_tracked().
+	 */
+	struct list_head tracker;
 };
 
 static inline bool iopt_is_dmabuf(struct iopt_pages *pages)
@@ -255,6 +260,12 @@ static inline bool iopt_is_dmabuf(struct iopt_pages *pages)
 	return pages->type == IOPT_ADDRESS_DMABUF;
 }
 
+/* The pages are not pinned, so their domains are tracked in pages->tracker. */
+static inline bool iopt_pages_tracked(struct iopt_pages *pages)
+{
+	return iopt_is_dmabuf(pages);
+}
+
 static inline bool iopt_dmabuf_revoked(struct iopt_pages *pages)
 {
 	lockdep_assert_held(&pages->mutex);
diff --git a/drivers/iommu/iommufd/pages.c b/drivers/iommu/iommufd/pages.c
index 03c8379bbc34..660af3d46f5e 100644
--- a/drivers/iommu/iommufd/pages.c
+++ b/drivers/iommu/iommufd/pages.c
@@ -1384,6 +1384,7 @@ static struct iopt_pages *iopt_alloc_pages(unsigned long start_byte,
 	pages->npages = DIV_ROUND_UP(length + start_byte, PAGE_SIZE);
 	pages->access_itree = RB_ROOT_CACHED;
 	pages->domains_itree = RB_ROOT_CACHED;
+	INIT_LIST_HEAD(&pages->tracker);
 	pages->writable = writable;
 	if (capable(CAP_IPC_LOCK))
 		pages->account_mode = IOPT_PAGES_ACCOUNT_NONE;
@@ -1434,13 +1435,13 @@ struct iopt_pages *iopt_alloc_file_pages(struct file *file,
 static void iopt_revoke_notify(struct dma_buf_attachment *attach)
 {
 	struct iopt_pages *pages = attach->importer_priv;
-	struct iopt_pages_dmabuf_track *track;
+	struct iopt_pages_track *track;
 
 	guard(mutex)(&pages->mutex);
 	if (iopt_dmabuf_revoked(pages))
 		return;
 
-	list_for_each_entry(track, &pages->dmabuf.tracker, elm) {
+	list_for_each_entry(track, &pages->tracker, elm) {
 		struct iopt_area *area = track->area;
 
 		iopt_area_unmap_domain_range(area, track->domain,
@@ -1557,7 +1558,6 @@ struct iopt_pages *iopt_alloc_dmabuf_pages(struct iommufd_ctx *ictx,
 	pages->account_mode = IOPT_PAGES_ACCOUNT_NONE;
 	pages->type = IOPT_ADDRESS_DMABUF;
 	pages->dmabuf.start = start - start_byte;
-	INIT_LIST_HEAD(&pages->dmabuf.tracker);
 
 	rc = iopt_map_dmabuf(ictx, pages, dmabuf);
 	if (rc) {
@@ -1568,16 +1568,16 @@ struct iopt_pages *iopt_alloc_dmabuf_pages(struct iommufd_ctx *ictx,
 	return pages;
 }
 
-int iopt_dmabuf_track_domain(struct iopt_pages *pages, struct iopt_area *area,
-			     struct iommu_domain *domain)
+int iopt_pages_track_domain(struct iopt_pages *pages, struct iopt_area *area,
+			    struct iommu_domain *domain)
 {
-	struct iopt_pages_dmabuf_track *track;
+	struct iopt_pages_track *track;
 
 	lockdep_assert_held(&pages->mutex);
-	if (WARN_ON(!iopt_is_dmabuf(pages)))
+	if (WARN_ON(!iopt_pages_tracked(pages)))
 		return -EINVAL;
 
-	list_for_each_entry(track, &pages->dmabuf.tracker, elm)
+	list_for_each_entry(track, &pages->tracker, elm)
 		if (WARN_ON(track->domain == domain && track->area == area))
 			return -EINVAL;
 
@@ -1586,21 +1586,20 @@ int iopt_dmabuf_track_domain(struct iopt_pages *pages, struct iopt_area *area,
 		return -ENOMEM;
 	track->domain = domain;
 	track->area = area;
-	list_add_tail(&track->elm, &pages->dmabuf.tracker);
+	list_add_tail(&track->elm, &pages->tracker);
 
 	return 0;
 }
 
-void iopt_dmabuf_untrack_domain(struct iopt_pages *pages,
-				struct iopt_area *area,
-				struct iommu_domain *domain)
+void iopt_pages_untrack_domain(struct iopt_pages *pages, struct iopt_area *area,
+			       struct iommu_domain *domain)
 {
-	struct iopt_pages_dmabuf_track *track;
+	struct iopt_pages_track *track;
 
 	lockdep_assert_held(&pages->mutex);
-	WARN_ON(!iopt_is_dmabuf(pages));
+	WARN_ON(!iopt_pages_tracked(pages));
 
-	list_for_each_entry(track, &pages->dmabuf.tracker, elm) {
+	list_for_each_entry(track, &pages->tracker, elm) {
 		if (track->domain == domain && track->area == area) {
 			list_del(&track->elm);
 			kfree(track);
@@ -1610,36 +1609,36 @@ void iopt_dmabuf_untrack_domain(struct iopt_pages *pages,
 	WARN_ON(true);
 }
 
-int iopt_dmabuf_track_all_domains(struct iopt_area *area,
-				  struct iopt_pages *pages)
+int iopt_pages_track_all_domains(struct iopt_area *area,
+				 struct iopt_pages *pages)
 {
-	struct iopt_pages_dmabuf_track *track;
+	struct iopt_pages_track *track;
 	struct iommu_domain *domain;
 	unsigned long index;
 	int rc;
 
-	list_for_each_entry(track, &pages->dmabuf.tracker, elm)
+	list_for_each_entry(track, &pages->tracker, elm)
 		if (WARN_ON(track->area == area))
 			return -EINVAL;
 
 	xa_for_each(&area->iopt->domains, index, domain) {
-		rc = iopt_dmabuf_track_domain(pages, area, domain);
+		rc = iopt_pages_track_domain(pages, area, domain);
 		if (rc)
 			goto err_untrack;
 	}
 	return 0;
 err_untrack:
-	iopt_dmabuf_untrack_all_domains(area, pages);
+	iopt_pages_untrack_all_domains(area, pages);
 	return rc;
 }
 
-void iopt_dmabuf_untrack_all_domains(struct iopt_area *area,
-				     struct iopt_pages *pages)
+void iopt_pages_untrack_all_domains(struct iopt_area *area,
+				    struct iopt_pages *pages)
 {
-	struct iopt_pages_dmabuf_track *track;
-	struct iopt_pages_dmabuf_track *tmp;
+	struct iopt_pages_track *track;
+	struct iopt_pages_track *tmp;
 
-	list_for_each_entry_safe(track, tmp, &pages->dmabuf.tracker,
+	list_for_each_entry_safe(track, tmp, &pages->tracker,
 				 elm) {
 		if (track->area == area) {
 			list_del(&track->elm);
@@ -1656,6 +1655,7 @@ void iopt_release_pages(struct kref *kref)
 	WARN_ON(!RB_EMPTY_ROOT(&pages->domains_itree.rb_root));
 	WARN_ON(pages->npinned);
 	WARN_ON(!xa_empty(&pages->pinned_pfns));
+	WARN_ON(!list_empty(&pages->tracker));
 	if (iopt_is_dmabuf(pages) && pages->dmabuf.attach) {
 		struct dma_buf *dmabuf = pages->dmabuf.attach->dmabuf;
 
@@ -1664,7 +1664,6 @@ void iopt_release_pages(struct kref *kref)
 		dma_resv_unlock(dmabuf->resv);
 		dma_buf_detach(dmabuf, pages->dmabuf.attach);
 		dma_buf_put(dmabuf);
-		WARN_ON(!list_empty(&pages->dmabuf.tracker));
 	} else if (pages->type == IOPT_ADDRESS_FILE) {
 		fput(pages->file);
 	}
@@ -1749,7 +1748,7 @@ static void __iopt_area_unfill_domain(struct iopt_area *area,
 
 	lockdep_assert_held(&pages->mutex);
 
-	if (iopt_is_dmabuf(pages)) {
+	if (iopt_pages_tracked(pages)) {
 		if (WARN_ON(iopt_dmabuf_revoked(pages)))
 			return;
 		iopt_area_unmap_domain_range(area, domain, start_index,
@@ -1917,8 +1916,8 @@ int iopt_area_fill_domains(struct iopt_area *area, struct iopt_pages *pages)
 		return 0;
 
 	mutex_lock(&pages->mutex);
-	if (iopt_is_dmabuf(pages)) {
-		rc = iopt_dmabuf_track_all_domains(area, pages);
+	if (iopt_pages_tracked(pages)) {
+		rc = iopt_pages_track_all_domains(area, pages);
 		if (rc)
 			goto out_unlock;
 	}
@@ -1983,8 +1982,8 @@ int iopt_area_fill_domains(struct iopt_area *area, struct iopt_pages *pages)
 	}
 	pfn_reader_destroy(&pfns);
 out_untrack:
-	if (iopt_is_dmabuf(pages))
-		iopt_dmabuf_untrack_all_domains(area, pages);
+	if (iopt_pages_tracked(pages))
+		iopt_pages_untrack_all_domains(area, pages);
 out_unlock:
 	mutex_unlock(&pages->mutex);
 	return rc;
@@ -2024,8 +2023,8 @@ void iopt_area_unfill_domains(struct iopt_area *area, struct iopt_pages *pages)
 		WARN_ON(RB_EMPTY_NODE(&area->pages_node.rb));
 	interval_tree_remove(&area->pages_node, &pages->domains_itree);
 	iopt_area_unfill_domain(area, pages, area->storage_domain);
-	if (iopt_is_dmabuf(pages))
-		iopt_dmabuf_untrack_all_domains(area, pages);
+	if (iopt_pages_tracked(pages))
+		iopt_pages_untrack_all_domains(area, pages);
 	area->storage_domain = NULL;
 out_unlock:
 	mutex_unlock(&pages->mutex);
-- 
2.47.3

