Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9038149DF0
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 08:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737361848; cv=none; b=n6rtRSLfXuevfd0vfoIu0HlIA3rtia0AesA3mkOJcJyllV3b8kbVXDMTpS7Hl8QjjdGAuZXLmoHHsYJn2kEKTk63zqPb6HvlowTJWlqas/NVJXzWgVvO53S0C7E4AdJ8rnOXKj0amJNdAlD0luWp4CYQvbObZ+5VSVQstXamLa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737361848; c=relaxed/simple;
	bh=Ifr8kmS+xgu8jqJ7KY32n3Xb65a54Kqn+G/zRvJYEjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 References; b=MloJqclJunieUpIE00ahSS1ZpfMRew3VYESVtF+pywdK8tr0LOflTNUn/JSv4bKoWn+my2DdWjIjWqazZbeSbnGHEkcuZ+AaeaYU7W3jiRd5VgJqmT56LZHjd7GVJbFVY8iYAGGtXCVATTdnfbNzMfzUhptUc8SgssF571hAZVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=JD1OJC+Q; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="JD1OJC+Q"
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250120083043epoutp014389ae36afa73dd8e74617777655a625~cWWRTj1w13210432104epoutp01V
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 08:30:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250120083043epoutp014389ae36afa73dd8e74617777655a625~cWWRTj1w13210432104epoutp01V
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1737361843;
	bh=3PYU2sGKDkvK3vauHzhh02ZTxx2C9+M0hGcyaEnRtA4=;
	h=From:To:Cc:Subject:Date:References:From;
	b=JD1OJC+QeyJQFBzDqbxspFNs7PxpWwUnqSFZpNXZUNep/nVHcNHiZS1Fce16q7nsZ
	 ek6VKxkMSrjEnz8BZQZsrgX4xSx6DV3FiYZs20ILiCRQMeaVtMelwx8+s5yoinhayU
	 ekdQjK3IekUwKKI/vFva5n1jNhXnVbyfAFTl/VOM=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20250120083042epcas2p189b0cdd9883e51f38e65634011f1e5ee~cWWQfJ0TH0924809248epcas2p1J;
	Mon, 20 Jan 2025 08:30:42 +0000 (GMT)
Received: from epsmges2p4.samsung.com (unknown [182.195.36.90]) by
	epsnrtp1.localdomain (Postfix) with ESMTP id 4Yc3Sf35Rqz4x9Q5; Mon, 20 Jan
	2025 08:30:42 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p4.samsung.com (Symantec Messaging Gateway) with SMTP id
	62.70.22094.2B90E876; Mon, 20 Jan 2025 17:30:42 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f~cWWPXElYv2561725617epcas2p3z;
	Mon, 20 Jan 2025 08:30:41 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250120083041epsmtrp132c24d16aaeaf3104f63d371ec91751c~cWWPWRdS82069020690epsmtrp1I;
	Mon, 20 Jan 2025 08:30:41 +0000 (GMT)
X-AuditID: b6c32a48-e72eb7000000564e-59-678e09b23cdb
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	4C.18.18949.1B90E876; Mon, 20 Jan 2025 17:30:41 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.95.142]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250120083041epsmtip2479bf5d24daffca06f48b1765600b1f9~cWWPFfv3D1114911149epsmtip29;
	Mon, 20 Jan 2025 08:30:41 +0000 (GMT)
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: 
Cc: janghyuck.kim@samsung.com, Hyesoo Yu <hyesoo.yu@samsung.com>, Andrew
	Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, David
	Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
	Vlastimil Babka <vbabka@suse.cz>, Roman Gushchin <roman.gushchin@linux.dev>,
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, linux-mm@kvack.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] mm: slub: Panic if the object corruption is checked.
Date: Mon, 20 Jan 2025 17:28:21 +0900
Message-ID: <20250120082908.4162780-1-hyesoo.yu@samsung.com>
X-Mailer: git-send-email 2.48.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmme4mzr50gxUvRC0m9hhYzFm/hs3i
	+rc3jBZPDrQzWvztvMBqsbK7mc1i85xii4VtS1gsLu+aw2Zxb81/Vou2z/+AxJKNTBYT14ha
	zG7sY3Tg89g56y67x4JNpR6bVnWyeWz6NIndo+vtFSaPEzN+s3g8uTKdyWNhw1Rmj8V9k1k9
	+rasYvQ4s+AIu8fnTXIBPFHZNhmpiSmpRQqpecn5KZl56bZK3sHxzvGmZgaGuoaWFuZKCnmJ
	uam2Si4+AbpumTlAjygplCXmlAKFAhKLi5X07WyK8ktLUhUy8otLbJVSC1JyCswL9IoTc4tL
	89L18lJLrAwNDIxMgQoTsjNu/ZzKWnBTtuJ3w0bWBsZJEl2MnBwSAiYSnybsZO9i5OIQEtjB
	KNG55AoLhPOJUWLj1zdsIFVCAt8YJdbds4Pp+LoEJA5StJdR4uica1Dtnxklfi68yA5SxSag
	LnFiyzJGEFtEgEVi5ffvYGOZBV4yS/w5fQ+sSFjAVeJmwxsmEJtFQFXi+pVe1i5GDg5eARuJ
	pvc+ENvkJW6vOckCYvMKCEqcnPkEzGYGijdvnc0MMlNCYC2HxMr5IHM4gBwXibtTqyF6hSVe
	Hd/CDmFLSbzsb4OyiyW2LT7MBNHbwCixueM+M0TCWGLWs3ZGkDnMApoS63fpQ4xUljhyC2ot
	n0TH4b/sEGFeiY42IYhGZYn9y+axQNiSEo/WtrNC2B4Sr2d9YYGEYazEpFmHmCYwys9C8sws
	JM/MQti7gJF5FaNYakFxbnpqsVGBCTxOk/NzNzGCk7KWxw7G2W8/6B1iZOJgPMQowcGsJMIr
	+qEnXYg3JbGyKrUoP76oNCe1+BCjKTB0JzJLiSbnA/NCXkm8oYmlgYmZmaG5kamBuZI4b/WO
	lnQhgfTEktTs1NSC1CKYPiYOTqkGJtOTvJ2179jzd78IuSZSVF7i2h/RoFp/V+jTRXfblAeT
	N/ecPekXM5d9UpLmFbXXM2aX6pXdbxSc0mqk3ioz79m0kwEC1kXsx98z+Su0/oxtW+68Vt/r
	SPrvjwub/1Vc6P9ybIPZR/23ov26amZzXh05cf5fA/+0m5c+OWcuid83pVhwxYfGhB/vKxmK
	Np7esrt7sWK0x6KSvn/3TIOrg0U3Zqmk7XAW3dnOxub744vAEosEn90bp77O7VyjlrhD03KK
	h5u6tyB3dIH3FV7WlNipB/9Oinb6NvHH9uL0d+1vdWfEVIVd+VTAG98iUXHi1pnkKfHu1f5v
	VFd62weoaDeIRre+2MOrGh1+z/aoEktxRqKhFnNRcSIAKly9FVMEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRmVeSWpSXmKPExsWy7bCSvO5Gzr50gxOTpS0m9hhYzFm/hs3i
	+rc3jBZPDrQzWvztvMBqsbK7mc1i85xii4VtS1gsLu+aw2Zxb81/Vou2z/+AxJKNTBYT14ha
	zG7sY3Tg89g56y67x4JNpR6bVnWyeWz6NIndo+vtFSaPEzN+s3g8uTKdyWNhw1Rmj8V9k1k9
	+rasYvQ4s+AIu8fnTXIBPFFcNimpOZllqUX6dglcGbd+TmUtuClb8bthI2sD4ySJLkZODgkB
	E4mvS96wdTFycQgJ7GaU+HPlJyNEQlJi1ueTTBC2sMT9liOsEEUfGSXmnzwBlmATUJc4sWUZ
	WIOIAIvEyu/fWUCKmAW+M0vsX74IrEhYwFXiZsMbMJtFQFXi+pVeoEkcHLwCNhJN730gFshL
	3F5zkgXE5hUQlDg58wmYzQwUb946m3kCI98sJKlZSFILGJlWMUqmFhTnpucWGxYY5aWW6xUn
	5haX5qXrJefnbmIEx4qW1g7GPas+6B1iZOJgPMQowcGsJMIr+qEnXYg3JbGyKrUoP76oNCe1
	+BCjNAeLkjjvt9e9KUIC6YklqdmpqQWpRTBZJg5OqQamogtrdj04Uqx4+WrA3EafUJ9Dhrr7
	GB/wXa9RvGzUqbSUoTDuZ1iTxeyVe0LenTQ9v6HirZylz1PVlqOv4jYk6S8VS3rfxfrPUdtm
	QrWV5d74s4t6rwmms+UpXSk6dZbhd+nd9O6/hy3v7W6IWxJlZ5r7eMP0qLireYX3vi7xfPz+
	wpPTV04Z7tvmcKHTf3Z6mmtKzaUj+0/acXnpXX/Y8W7e9JT9j5fV+Z6aoJ890craVOPR3Y5I
	8y8lGUnx7DWumzuO39uWe3J/j43wnUe67ZOmvGh/3aix4c/KS4lrmm7lFO27yqx9yYRz08ad
	DfpXFz25OF82L9Ox0dHaOnjz3OsxGulZIp/z3bYL7rphr8RSnJFoqMVcVJwIAHavHXgEAwAA
X-CMS-MailID: 20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f
References: <CGME20250120083041epcas2p30d61ee801c1db5a7ebdf26fdc642883f@epcas2p3.samsung.com>

If a slab object is corrupted or an error occurs in its internal
value, continuing after restoration may cause other side effects.
At this point, it is difficult to debug because the problem occurred
in the past. A flag has been added that can cause a panic when there
is a problem with the object.

Signed-off-by: Hyesoo Yu <hyesoo.yu@samsung.com>
Change-Id: I4e7e5e0ec3421a7f6c84d591db052f79d3775493
---
 Documentation/mm/slub.rst |  2 ++
 include/linux/slab.h      |  4 ++++
 mm/slub.c                 | 14 ++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/Documentation/mm/slub.rst b/Documentation/mm/slub.rst
index 84ca1dc94e5e..ce58525db93d 100644
--- a/Documentation/mm/slub.rst
+++ b/Documentation/mm/slub.rst
@@ -53,6 +53,7 @@ Possible debug options are::
 	U		User tracking (free and alloc)
 	T		Trace (please only use on single slabs)
 	A		Enable failslab filter mark for the cache
+	C		Panic if object corruption is checked.
 	O		Switch debugging off for caches that would have
 			caused higher minimum slab orders
 	-		Switch all debugging off (useful if the kernel is
@@ -113,6 +114,7 @@ options from the ``slab_debug`` parameter translate to the following files::
 	U	store_user
 	T	trace
 	A	failslab
+	C	corruption_panic
 
 failslab file is writable, so writing 1 or 0 will enable or disable
 the option at runtime. Write returns -EINVAL if cache is an alias.
diff --git a/include/linux/slab.h b/include/linux/slab.h
index 10a971c2bde3..4391c30564d6 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -31,6 +31,7 @@ enum _slab_flag_bits {
 	_SLAB_CACHE_DMA32,
 	_SLAB_STORE_USER,
 	_SLAB_PANIC,
+	_SLAB_CORRUPTION_PANIC,
 	_SLAB_TYPESAFE_BY_RCU,
 	_SLAB_TRACE,
 #ifdef CONFIG_DEBUG_OBJECTS
@@ -97,6 +98,9 @@ enum _slab_flag_bits {
 #define SLAB_STORE_USER		__SLAB_FLAG_BIT(_SLAB_STORE_USER)
 /* Panic if kmem_cache_create() fails */
 #define SLAB_PANIC		__SLAB_FLAG_BIT(_SLAB_PANIC)
+/* Panic if object corruption is checked */
+#define SLAB_CORRUPTION_PANIC	__SLAB_FLAG_BIT(_SLAB_CORRUPTION_PANIC)
+
 /**
  * define SLAB_TYPESAFE_BY_RCU - **WARNING** READ THIS!
  *
diff --git a/mm/slub.c b/mm/slub.c
index 48cefc969480..36a8dabf1349 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -1306,6 +1306,8 @@ slab_pad_check(struct kmem_cache *s, struct slab *slab)
 			fault, end - 1, fault - start);
 	print_section(KERN_ERR, "Padding ", pad, remainder);
 
+	BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
+
 	restore_bytes(s, "slab padding", POISON_INUSE, fault, end);
 }
 
@@ -1389,6 +1391,8 @@ static int check_object(struct kmem_cache *s, struct slab *slab,
 	if (!ret && !slab_in_kunit_test()) {
 		print_trailer(s, slab, object);
 		add_taint(TAINT_BAD_PAGE, LOCKDEP_NOW_UNRELIABLE);
+
+		BUG_ON(s->flags & SLAB_CORRUPTION_PANIC);
 	}
 
 	return ret;
@@ -1689,6 +1693,9 @@ parse_slub_debug_flags(char *str, slab_flags_t *flags, char **slabs, bool init)
 		case 'a':
 			*flags |= SLAB_FAILSLAB;
 			break;
+		case 'c':
+			*flags |= SLAB_CORRUPTION_PANIC;
+			break;
 		case 'o':
 			/*
 			 * Avoid enabling debugging on caches if its minimum
@@ -6874,6 +6881,12 @@ static ssize_t store_user_show(struct kmem_cache *s, char *buf)
 
 SLAB_ATTR_RO(store_user);
 
+static ssize_t corruption_panic_show(struct kmem_cache *s, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", !!(s->flags & SLAB_CORRUPTION_PANIC));
+}
+SLAB_ATTR_RO(corruption_panic);
+
 static ssize_t validate_show(struct kmem_cache *s, char *buf)
 {
 	return 0;
@@ -7092,6 +7105,7 @@ static struct attribute *slab_attrs[] = {
 	&red_zone_attr.attr,
 	&poison_attr.attr,
 	&store_user_attr.attr,
+	&corruption_panic_attr.attr,
 	&validate_attr.attr,
 #endif
 #ifdef CONFIG_ZONE_DMA
-- 
2.48.0

