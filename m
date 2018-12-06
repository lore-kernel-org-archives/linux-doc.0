Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6B8077D089
	for <lwn-linux-doc@archive.lwn.net>; Thu,  6 Dec 2018 21:13:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726038AbeLFVNS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 6 Dec 2018 16:13:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:40336 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726029AbeLFVNS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Dec 2018 16:13:18 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB6LAj35021518
        for <linux-doc@vger.kernel.org>; Thu, 6 Dec 2018 16:13:16 -0500
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2p79kx567k-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-doc@vger.kernel.org>; Thu, 06 Dec 2018 16:13:16 -0500
Received: from localhost
        by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-doc@vger.kernel.org> from <rppt@linux.ibm.com>;
        Thu, 6 Dec 2018 21:13:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
        by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Thu, 6 Dec 2018 21:13:09 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id wB6LD8QD50987252
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 6 Dec 2018 21:13:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 6A62811C054;
        Thu,  6 Dec 2018 21:13:08 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 79E5211C04A;
        Thu,  6 Dec 2018 21:13:06 +0000 (GMT)
Received: from rapoport-lnx (unknown [9.148.206.110])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu,  6 Dec 2018 21:13:06 +0000 (GMT)
Received: by rapoport-lnx (sSMTP sendmail emulation); Thu, 06 Dec 2018 23:13:05 +0200
From:   Mike Rapoport <rppt@linux.ibm.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: [PATCH 1/2] slab: make kmem_cache_create{_usercopy} description proper kernel-doc
Date:   Thu,  6 Dec 2018 23:13:00 +0200
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544130781-13443-1-git-send-email-rppt@linux.ibm.com>
References: <1544130781-13443-1-git-send-email-rppt@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 18120621-0028-0000-0000-00000327259A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 18120621-0029-0000-0000-000023E3392F
Message-Id: <1544130781-13443-2-git-send-email-rppt@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2018-12-06_08:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1812060177
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add the description for kmem_cache_create, fixup the return value paragraph
and make both kmem_cache_create and add the second '*' to the comment
opening.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 mm/slab_common.c | 35 +++++++++++++++++++++++++++++++----
 1 file changed, 31 insertions(+), 4 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index 7eb8dc1..dbf63d6 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -406,8 +406,9 @@ static struct kmem_cache *create_cache(const char *name,
 	goto out;
 }
 
-/*
- * kmem_cache_create_usercopy - Create a cache.
+/**
+ * kmem_cache_create_usercopy - Create a cache with a region suitable
+ * for copying to userspace
  * @name: A string which is used in /proc/slabinfo to identify this cache.
  * @size: The size of objects to be created in this cache.
  * @align: The required alignment for the objects.
@@ -416,7 +417,6 @@ static struct kmem_cache *create_cache(const char *name,
  * @usersize: Usercopy region size
  * @ctor: A constructor for the objects.
  *
- * Returns a ptr to the cache on success, NULL on failure.
  * Cannot be called within a interrupt, but can be interrupted.
  * The @ctor is run when new pages are allocated by the cache.
  *
@@ -425,12 +425,14 @@ static struct kmem_cache *create_cache(const char *name,
  * %SLAB_POISON - Poison the slab with a known test pattern (a5a5a5a5)
  * to catch references to uninitialised memory.
  *
- * %SLAB_RED_ZONE - Insert `Red' zones around the allocated memory to check
+ * %SLAB_RED_ZONE - Insert `Red` zones around the allocated memory to check
  * for buffer overruns.
  *
  * %SLAB_HWCACHE_ALIGN - Align the objects in this cache to a hardware
  * cacheline.  This can be beneficial if you're counting cycles as closely
  * as davem.
+ *
+ * Return: a pointer to the cache on success, NULL on failure.
  */
 struct kmem_cache *
 kmem_cache_create_usercopy(const char *name,
@@ -514,6 +516,31 @@ kmem_cache_create_usercopy(const char *name,
 }
 EXPORT_SYMBOL(kmem_cache_create_usercopy);
 
+/**
+ * kmem_cache_create - Create a cache.
+ * @name: A string which is used in /proc/slabinfo to identify this cache.
+ * @size: The size of objects to be created in this cache.
+ * @align: The required alignment for the objects.
+ * @flags: SLAB flags
+ * @ctor: A constructor for the objects.
+ *
+ * Cannot be called within a interrupt, but can be interrupted.
+ * The @ctor is run when new pages are allocated by the cache.
+ *
+ * The flags are
+ *
+ * %SLAB_POISON - Poison the slab with a known test pattern (a5a5a5a5)
+ * to catch references to uninitialised memory.
+ *
+ * %SLAB_RED_ZONE - Insert `Red` zones around the allocated memory to check
+ * for buffer overruns.
+ *
+ * %SLAB_HWCACHE_ALIGN - Align the objects in this cache to a hardware
+ * cacheline.  This can be beneficial if you're counting cycles as closely
+ * as davem.
+ *
+ * Return: a pointer to the cache on success, NULL on failure.
+ */
 struct kmem_cache *
 kmem_cache_create(const char *name, unsigned int size, unsigned int align,
 		slab_flags_t flags, void (*ctor)(void *))
-- 
2.7.4

