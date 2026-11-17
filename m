Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949470;
	b=JwoQ7djSQMyu7NuGTKP68pHM8fctb4cNH0mqw2ObCjpTO1QL78cHNSxIE6mpP/C0F9Mb
	 uDQ5qYU7mMJ2lK2trTN5YdyYv5eNi1Qzqger62MeZwPRWWoDcvjArl5jW/+RzRMdMZ7rB
	 MswhW96Ur/rC7C78CnvI2dfZHUo2KOIXaKrHbvOAi1jYadH8LZ1Rvzi5PFn9pBCLKpxi9
	 NaFnAhEMUyjfyj4u+Uo1ZzXRwCJ7LFa2JgE+i3vEX3MoFTWDf+WZg5/PMkYAfUC9ap6BZ
	 WkZ6cRyIBOMvqRxTRdLQzxK/KPQDeiMZENNKIB4RK9gTYmH8c2/WU5gWNz+tyIg36rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949470;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
	b=n6+t5wDb4zEltFFwOmsZhucXnrXGDz7DoRaGlgmogI7p2EK7n0gU6nHmB0UHl8DTTKTu
	 3YnuEyIrZgcr/qVaYAUG1K1W+AZO6g/gNnU6ZS+T9mOnDBwSh0rWzLuQRdb3o5DWLbFi4
	 V3X2hEFpoiOUmIIvmRKmo9lI2+YgCjVzKCEFpGYCZE2p/Ge/6oD8DY8IJtCB7RXcbAdz1
	 rKxZtOz7vuWx8i3tJ3N74AWKdg9tjfaXnxKFXKaE261qGKIJYpWO760ZYuUUgdufVNOQK
	 YG5bF6pWYnwSrzlGX6NKAHn+ZnZy9kSoFjbfaqGI7AqUchwku83YUwImFDit3QGputA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdlF3F6h;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EFFF606A32A
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 21:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EFFF606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hdlF3F6h
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so2918235e9.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 13:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794949467; x=1795554267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
        b=hdlF3F6hlfaTBcKaXU98op7XPtSwO/hzqXy092m1pZkq+0XvRDWhrsMvWpEJ4h/5yT
         +4DPeis7eUTjKpfu6XnnpWYxw6fWV4WI1W9R5jaOq7pNcTtxYSBBV+7BjWL9f0HPDTsW
         ebFdOdO9dAqqhJ+s/AQOalJI01E7xMmRzihIhJoWtPMK4s5bCPUqfKraGDNltcUD8tQ0
         ByNbxT8se7e+55rxgLw/Q4MNztinCCyW7jqaDChLLn8Mm6ETqKd/rlajfHLcNswO5G0B
         hTFThcE28oaGqjcdgMJAQbhPJNO+ylrIW43whoD104Ki7EIZd6gzu5h7/qiJ7qLyrDzB
         VVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794949467; x=1795554267;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DClN/PQCUc+e7hhJbYiQYreXFIiImxiZvex/Oaj/4wo=;
        b=HhW2gxSWX7UqKT6bZ95FP133V6hh7kZ1uo0ExjslXJVEuf/T19MCbjUOj6ZPvKpB9A
         eV8cJcstlBZ5SVLPuYWjEciHvBDqadd+l0bgIRfLB5QEuW+BxCDBZilgcnIvCOXIKRJj
         VSQly5dEShWfs2aVoPMzRO4DxKexE35I0W4K1b+zy1bMJBYACh6FjT+xkcz/6xeJxKsS
         bYH6sqFcZOq80mT8SOHFQh8mgvhAA2RpLoMBn6GYHc8wepVqk15QpptwB6BymoH+p4wZ
         TxSzbAqjhCC6fqFKKWNTy3Gdb5uik+WWkulGoFCoQLquGYk2oU/nAEL0RTXc/4JU7U2F
         zFjQ==
X-Forwarded-Encrypted: i=1; AL+hErG5iFE1P26KVH0mh1yJjfCHzykROCi4Fj0oM6NmL4RTuuclpGgeSr9o/fjc20IYqaotc88LfIct7Cw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QodwGK9ZSt/he3102Tac4QgMc2CxjAWDC60q3JDT85d1MhFe1
	gb/3S2U7T8NeJ9i5YgTXt6neqVXmF0VoH6IMoF07/0IcbxqNuN0KjcGD
X-Gm-Gg: AYBFou2UXZ68BK5ctkQl5OJERqH5UEU3fK2bKuBLj2S+8e8SrlmeWp2Du/BZ+ja/fGX
	OznACJ+QF7wXpJIGfLQBuNmvv0/koJsEDnWefnJjxf6uQm9EwzfW7ZLradqdcKdarbzrWGpbD6L
	AJ8DkxMG7L3/Fay8htlptXXfWiaxi65Y45zgL73T8FeflzQg/u7S4dzImt4G6wXWPTpSP4mG00u
	BHhB1m27A0Iec+YRPhPKJ3SsWgeN6zmsw3REOg03+FmoSJdGf1x6Z2+qi+UCUcCl+noDNGqtPuQ
	RTXlvbAm+406yk6lRBbgJiHbSi4rN0zzkDBSNVL3oTTuELNZqOBD1eR9RwCksutVwn/zeSS4uhv
	FqX8kP7eFYcyEyCurYbkbAFhyyBGDFKI700CVVCccZFJprFsEbX2hpuCiCdb3g3549HSEp1/jfp
	WFEKWMI3PRfp2qcMaQ39k0IatID9Xtg2SpM63frS8q26ZPKedDTg0mJaskkMh6ctkXPbZJ7ms9S
	dMy/dEMccD+KP2IR8xs7JpVlSY7MWj3LGRgNLMNReVmD1W9cPbnrnoS+HQyQO/bHYTID0VcqdR9
	ZyeS9/pousDIIdOHiH8D1WlDufRcM2xePpo=
X-Received: by 2002:a05:600c:6208:b0:4a1:da58:1ee with SMTP id 5b1f17b1804b1-4bb7da46178mr7111145e9.31.1794949467262;
        Tue, 17 Nov 2026 13:04:27 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7ddd4614sm3902895e9.6.2026.11.17.13.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:04:26 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Peter Xu <peterx@redhat.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>,
	Tal Zussman <tz2294@columbia.edu>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH v3] Documentation/userfaultfd: document RWP behavior when the PTE is dropped
Date: Tue, 17 Nov 2026 22:04:10 +0100
Message-ID: <20261117210423.11598-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

"Scope of protection" lists only the PTE drops requested by the user and
says the range has to be re-armed afterwards. On shmem the kernel can drop
the PTE at any time (page reclaim and collapse are examples), and RWP has
no marker by design: the next access is a minor or a missing fault, and
the user is expected to register for those. Document this, together with
the modes that sync and async tracking need.

The VMM example registers guest_mem with RWP and MISSING only, so a vCPU
write to an offset that is not mapped there can be lost during eviction.
Add MINOR to the registration, describe how the handler treats faults on
offsets that are being evicted, and fix the step 1 comment, since minor
faults block even in async mode.

Link: https://lore.kernel.org/linux-mm/856cdf21-7982-475a-b244-a7ceff4eb6aa@kernel.org/
Link: https://lore.kernel.org/linux-mm/avWnaR7VVEGa7yNp@thinkstation/
Suggested-by: Tal Zussman <tz2294@columbia.edu>
Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
Changes in v3:
- registration is not fixed. MINOR can be added before switching to
  sync and dropped after switching back

Changes in v2:
- keep the migration sentence out of the anonymous-only paragraph, it
  applies to shmem and hugetlbfs too, and say "uffd bit", not "marker"
- state the rule instead of listing the operations that drop the PTE
- say that a context switching to sync with UFFDIO_SET_MODE needs the
  sync registration, and fix the step 1 comment, since minor faults
  block in async mode
- add {} around the comment-only if body in the example
- make RWP and minor faults on any offset this pass will evict wait
  until that offset is punched

v2: https://lore.kernel.org/20261116101004.15322-1-azpijr@gmail.com
v1: https://lore.kernel.org/20261113112806.109578-1-azpijr@gmail.com

 Documentation/admin-guide/mm/userfaultfd.rst | 89 ++++++++++++++++----
 1 file changed, 71 insertions(+), 18 deletions(-)

diff --git a/Documentation/admin-guide/mm/userfaultfd.rst b/Documentation/admin-guide/mm/userfaultfd.rst
index 97daea83b7f1..cdc92b40aa65 100644
--- a/Documentation/admin-guide/mm/userfaultfd.rst
+++ b/Documentation/admin-guide/mm/userfaultfd.rst
@@ -384,17 +384,54 @@ normal missing path (``do_anonymous_page()``, ``do_swap_page()``,
 the population itself, co-register the range with
 ``UFFDIO_REGISTER_MODE_MISSING``.

-Protection is preserved across page reclaim: a page swapped out while
-RWP-protected carries the marker on its swap entry, and swap-in restores
-the PROT_NONE state so the first access after swap-in still faults. The
-same applies to pages temporarily replaced by migration entries.
-
-Operations that drop the PTE entirely — ``MADV_DONTNEED`` on anonymous
-memory, hole-punch on shmem, truncation of a file mapping — also drop the
-RWP marker: the next access re-populates the range without protection.
+Protection is preserved while a page is temporarily replaced by a
+migration entry: the migration entry keeps the uffd bit, and the PROT_NONE
+state is restored when migration completes. This holds for anonymous,
+shmem and hugetlbfs memory alike.
+
+Protection of anonymous memory is also preserved across page reclaim: a
+page swapped out while RWP-protected keeps the uffd bit on its swap entry,
+and swap-in restores the PROT_NONE state so the first access after swap-in
+still faults.
+
+Any operation that drops the PTE also drops the RWP protection. On shmem
+the kernel can drop the PTE at any time while the page stays in the page
+cache or in swap; page reclaim and collapse into a huge page are examples.
 Unlike WP (which persists via ``PTE_MARKER_UFFD_WP``), there is no
-persistent RWP marker today. The user needs to re-arm the range with
-``UFFDIO_RWPROTECT`` after any operation that explicitly frees PTEs.
+persistent RWP marker, and this is intentional: once the PTE is gone, the
+next access takes a page fault that userfaultfd can deliver, and that fault
+is the notification. Which fault it is depends on what happened to the
+page:
+
+- The page is still in the page cache or in swap: the access is a minor
+  fault, delivered if the range is co-registered with
+  ``UFFDIO_REGISTER_MODE_MINOR``.
+
+- The page is gone: the access is a missing fault, delivered if the range
+  is co-registered with ``UFFDIO_REGISTER_MODE_MISSING``.
+
+WP cannot use the same scheme — a minor fault would trap reads as well as
+writes — which is why it needs a marker.
+
+Without the matching mode the page is mapped back silently and without
+protection, so what to co-register depends on the tracking mode:
+
+- Sync mode: the access would be lost. Co-register shmem and hugetlbfs
+  ranges with ``UFFDIO_REGISTER_MODE_MINOR`` (and
+  ``UFFDIO_REGISTER_MODE_MISSING`` if the file can have holes), and
+  anonymous ranges, where minor faults are not available, with
+  ``UFFDIO_REGISTER_MODE_MISSING``.
+
+- Async mode: neither is needed. A page faulted back in is mapped without
+  the uffd bit, so ``PAGEMAP_SCAN`` reports it as accessed.
+
+The registration does not follow the tracking mode: a context that
+switches to sync mode with ``UFFDIO_SET_MODE``, as the workflow below
+does, needs ``UFFDIO_REGISTER_MODE_MINOR`` while it is in sync mode.
+Minor faults are always synchronous, so keeping it registered makes
+them block in async mode as well. Re-registering the range to add
+``UFFDIO_REGISTER_MODE_MINOR`` before switching to sync, and to drop
+it after switching back, avoids that.

 **Fault Handling:**

@@ -484,17 +521,24 @@ never traps on its own ::
         .features = UFFD_FEATURE_RWP | UFFD_FEATURE_RWP_ASYNC,
     };
     ioctl(uffd, UFFDIO_API, &api);
-    if (!(api.features & UFFD_FEATURE_RWP))
+    if (!(api.features & UFFD_FEATURE_RWP)) {
         /* RWP unavailable on this kernel/arch -- fall back. */
+    }
+    /*
+     * MINOR: an offset in the page cache but not mapped in guest_mem
+     * would be mapped back without a fault, and a vCPU write between
+     * the pwrite() and the hole punch in step 4 would be lost.
+     */
     ioctl(uffd, UFFDIO_REGISTER, &(struct uffdio_register){
         .range = { guest_mem, guest_size },
         .mode = UFFDIO_REGISTER_MODE_RWP |
-                UFFDIO_REGISTER_MODE_MISSING,
+                UFFDIO_REGISTER_MODE_MISSING |
+                UFFDIO_REGISTER_MODE_MINOR,
     });

     /* Tracking loop */
     while (vm_running) {
-        /* 1. Detection phase (async -- no vCPU stalls) */
+        /* 1. Detection phase (RWP faults async, minor faults still block) */
         ioctl(uffd, UFFDIO_RWPROTECT, &(struct uffdio_rwprotect){
             .range = full_range,
             .mode = UFFDIO_RWPROTECT_MODE_RWP });
@@ -544,11 +588,20 @@ never traps on its own ::
                   .enable = UFFD_FEATURE_RWP_ASYNC });
     }

-During step 4, a vCPU that accesses a ``guest_mem`` offset being evicted
-blocks with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault while the eviction is in
-progress. After ``fallocate()`` punches the page out and ``UFFDIO_WAKE``
-fires, the vCPU retries the access, faults as ``MISSING``, and the
-handler resolves it with ``UFFDIO_COPY`` from storage.
+During step 4, a vCPU that accesses an offset this pass will evict blocks
+with a ``UFFD_PAGEFAULT_FLAG_RWP`` fault, or with a
+``UFFD_PAGEFAULT_FLAG_MINOR`` fault if the offset is not mapped in
+``guest_mem``. The handler leaves the fault pending until that offset has
+been punched out, even if step 4 has not reached it yet: resolving it
+earlier would let a vCPU write land between the ``pwrite()`` and the hole
+punch, and the write would be lost. After ``fallocate()`` punches the page
+out and ``UFFDIO_WAKE`` fires, the vCPU retries the access, faults as
+``MISSING``, and the handler resolves it with ``UFFDIO_COPY`` from storage.
+
+Faults on any other offset are resolved right away: RWP faults with
+``UFFDIO_RWPROTECT``, minor faults with ``UFFDIO_CONTINUE``. A page mapped
+by ``UFFDIO_CONTINUE`` does not carry the uffd bit, so the next scan reports
+it as accessed.

 This workflow targets shmem and hugetlbfs (both support a private
 ``io_mem`` mapping over the same fd). Anonymous-memory backings need a
--
2.56.0

