Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236092C028C
	for <linux-doc@vger.kernel.org>; Wed,  8 Oct 2025 18:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759949911; cv=none; b=GIZ7ppBKb/J45c2USzIn2kCOL610R5f7nkiRslnNlmzJZBOPNkwtjM63yPnhSMELkfmziBD+U7b7b3zUgjEcZu2EVwMD84sXxsC8WWyrPBvzYe4ebAZAXR4jdBZnipVeqNlU7M84kmKwRqpiyUUGA45xoqPe1omRWKIvCuokr9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759949911; c=relaxed/simple;
	bh=TYq9VoRcLXA9kbxCY/pbpd/mmhsJc874jIXXCR7fgco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j2uyM8FsT5EMxioMuzkDiYX9NQZtjYygDogWEFuYUa8uKKib6iNbjVoIg2GypiVBPRaYCwjT97Ltjk5IchPr7ogzbqYG3fei3PpmO9QVCEiEjpRL+7SB7HdElIoeJvgAGxIGwjeuDM9P9ZzZWi3SfvmZaySt1WWYH0uleFOG4B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IfCjrhai; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IfCjrhai"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4dfd1f48d4cso1066761cf.0
        for <linux-doc@vger.kernel.org>; Wed, 08 Oct 2025 11:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1759949907; x=1760554707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CgUP0/WmGKx+IVOsX9zNZJUjUIw/PkapcpGfi4V2VtU=;
        b=IfCjrhaiI3VNQeTXzTH7vicL6G1s40jiNuBn4ZAm9saidURQGgbkt9PpUbAl1C191Z
         7rC20W6rASFifwYEUfYSoPoyxT5otKhwLBwR58bA+RUsN29ithJ1xMLG8iLwEuLMdQVG
         68nhWXZQeFFoPW+Mi4En+yiI78STI4cft8tvKWKYvesrBGfLl2Ge1AiagAXbWnYQfnJ2
         LpCY4fD3HWG7XuG28aJIg5LKUyb1oOF4NVnupBKOWxcmTGs5FiOTseYxCe6MT2aYQUX1
         x6Y3MYVHyBxOJyPLNrUS38w+YRO1xyWHvhHbUBlNiZkfXc14gaXKK4GVeUmDRFvKI8Su
         DpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949907; x=1760554707;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgUP0/WmGKx+IVOsX9zNZJUjUIw/PkapcpGfi4V2VtU=;
        b=UJXwPlxPNvTIYOET5wAv0SH4whnpmj+j58u/09wHuGhFXTEGpWn6H2v0kOKL79HjKe
         D73v/EZE1O8xo2+KcIg4F/+xmaCwYT2sRzayzyezf9hYTZmHJbUkbi32XfnBB4nwJYvQ
         U8RCTqq2mJKhuRGIjTbIoMlxi4PdrEePLKWhxaKX1iMnnX5XnLNDNu7Kcr/aThiyAifb
         S9kbam2R8GC1Hd4FTADDQ/wlyQPWQyCL9wXqlNyp916id73OKVqzRtSJRWFJjqG8lD6g
         og+Uw5dYFOpHpMHyxo4MCnEvuZKQw4YchWCAMQYScvIX8EiaYwqOt44R16vxZ2+EVy/9
         c8eQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaMpdem/jt/Iz/vqcTik79ATpPZ26n6M/57qBWnebhyUU+p/6glAykh1y8OXpCnfkdBRTHxNPhFv8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnRfMfB2Me8xuWtbmPJu1VWAMrIFcWgfuJQSWjEmgD1ea4wzk
	rN6ixm6z/3fJdL7/d/xiQiGAGt8LgZ/sSnb0JmXcPseZ7MtOFRvkPxyoURQsKgqUpTg=
X-Gm-Gg: ASbGncuZKS76M9qE+2Dk4DK3+HvUGBKju2ECBTUUN+GNpnOZLU1f1bubG5ELq/tGQc8
	ogwbX07WVkvhjBiFp5uup5oB3IE4QPTW/Vr7QrWSPVmX7kjbmPBkng7k3sKI70Cm49EydzjSHwd
	1EJ/uG2AVUnIZYE/brFY4jiTHBHseJcj589GkZH/0WpOHqYqgW5pnwCs3/7zymZWFF3hJD6hgYp
	By3Fb9VR/OD0sBrCkRk2Dzw90V3GaVd07rfXAA4foEYqUBI88UZ31aW5dn/zo1eTIrc+61PIkc+
	KazhXRqJPy875/AdCnddbooWNz2nXNbF/INCDd7tBzKqhVTa4ssWQ9u+QUQW9fS5uxmWvgyLlMQ
	fXhRn/NmF8G0SF2gYnpn+1B+XLXKXhRC+KSA9x07mz/OBqZ2bTaHX+2Ziy4Xh4GnDRRxyMwB+M/
	hZ8Px1Cz4NQwbJ/bTa52iHy+u9XIUV9zin+sYG6cSo
X-Google-Smtp-Source: AGHT+IH5XZl1zP5WV2H5vB1vEumTSPp138/9F+4pHEKVvEJpneB5APkZUlKul8CuzBvyHU3k2KlKsQ==
X-Received: by 2002:a05:622a:4c18:b0:4d9:f929:1531 with SMTP id d75a77b69052e-4e6eace963bmr71897761cf.23.1759949906731;
        Wed, 08 Oct 2025 11:58:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-96-255-20-138.washdc.ftas.verizon.net. [96.255.20.138])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bb53d91fsm166731966d6.23.2025.10.08.11.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 11:58:26 -0700 (PDT)
Date: Wed, 8 Oct 2025 14:58:24 -0400
From: Gregory Price <gourry@gourry.net>
To: David Hildenbrand <david@redhat.com>
Cc: linux-mm@kvack.org, corbet@lwn.net, muchun.song@linux.dev,
	osalvador@suse.de, akpm@linux-foundation.org, hannes@cmpxchg.org,
	laoar.shao@gmail.com, brauner@kernel.org, mclapinski@google.com,
	joel.granados@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Alexandru Moise <00moses.alexander00@gmail.com>,
	David Rientjes <rientjes@google.com>
Subject: Re: [PATCH] Revert "mm, hugetlb: remove hugepages_treat_as_movable
 sysctl"
Message-ID: <aOa0UPnxJVGvqc8S@gourry-fedora-PF4VCD3F>
References: <20251007214412.3832340-1-gourry@gourry.net>
 <402170e6-c49f-4d28-a010-eb253fc2f923@redhat.com>
 <aOZyt-7sf5PFCdpb@gourry-fedora-PF4VCD3F>
 <f4d0e176-b1d4-47f0-be76-4bff3dd7339a@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4d0e176-b1d4-47f0-be76-4bff3dd7339a@redhat.com>

On Wed, Oct 08, 2025 at 04:44:22PM +0200, David Hildenbrand wrote:
> On 08.10.25 16:18, Gregory Price wrote:
> > On Wed, Oct 08, 2025 at 10:58:23AM +0200, David Hildenbrand wrote:
> > > On 07.10.25 23:44, Gregory Price wrote:
> > > I mean, this is as ugly as it gets.
> > > 
> > > Can't we just let that old approach RIP where it belongs? :)
> > > 
> > 
> > Definitely - just found this previously existed and wanted to probe for
> > how offensive reintroducing it would be. Seems the answer is essentially
> > "lets do it a little differently".
> > 
> > > Something I could sympathize is is treaing gigantic pages that are actually
> > > migratable as movable.
> > > 
> > ...
> > > -       gfp |= hugepage_movable_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> > > +       gfp |= hugepage_migration_supported(h) ? GFP_HIGHUSER_MOVABLE : GFP_HIGHUSER;
> > > 
> > > Assume you want to offline part of the ZONE_MOVABLE there might still be sufficient
> > > space to possibly allocate a 1 GiB area elsewhere and actually move the gigantic page.
> > > 
> > > IIRC, we do the same for memory offlining already.
> > > 
> > 
> > This is generally true of other page sizes as well, though, isn't it?
> > If the system is truly so pressured that it can't successfully move a
> > 2MB page - offline may still fail.  So allowing 1GB pages is only a risk
> > in the sense that they're harder to allocate new targets.
> 
> Right, but memory defragmentation works on pageblock level, so 2 MiB is much
> MUCH more reliable :)
> 

fwiw this works cleanly.  Just dropping this here, but should continue
the zone conversation.  I need to check, but does this actually allow
pinnable allocations?  I thought pinning kicked off migration.

================== test =======================

# echo 1 > /proc/sys/vm/movable_gigantic_pages
# echo 1 > /sys/devices/system/node/node0/hugepages/hugepages-1048576kB/nr_hugepages
# echo 1 > /sys/devices/system/node/node1/hugepages/hugepages-1048576kB/nr_hugepages
# ./huge
Allocating 1GB hugepage
Binding hugepage to NUMA node 1
Faulting page in
Resetting mbind policy to MPOL_DEFAULT (local policy)
Migrating
Migrated pages from node 1 to node 0, pages not moved: 0

================== patch  =======================

commit 395988dc319771db980dab3f95ed9ec8f0b74945
Author: Gregory Price <gourry@gourry.net>
Date:   Tue Oct 7 10:11:51 2025 -0700

    mm, hugetlb: introduce movable_gigantic_pages

    Signed-off-by: Gregory Price <gourry@gourry.net>

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index 9bef46151d53..1535c9a964dc 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -54,6 +54,7 @@ Currently, these files are in /proc/sys/vm:
 - mmap_min_addr
 - mmap_rnd_bits
 - mmap_rnd_compat_bits
+- movable_gigantic_pages
 - nr_hugepages
 - nr_hugepages_mempolicy
 - nr_overcommit_hugepages
@@ -624,6 +625,22 @@ This value can be changed after boot using the
 /proc/sys/vm/mmap_rnd_compat_bits tunable


+movable_gigantic_pages
+======================
+
+This parameter controls whether gigantic pages may be allocated from
+ZONE_MOVABLE. If set to non-zero, gigantic hugepages can be allocated
+from ZONE_MOVABLE. ZONE_MOVABLE memory may be created via the kernel
+boot parameter `kernelcore` or via memory hotplug as discussed in
+Documentation/admin-guide/mm/memory-hotplug.rst.
+
+Support may depend on specific architecture.
+
+Note that using ZONE_MOVABLE gigantic pages may make features like
+memory hotremove more unreliable, as migrating gigantic pages is more
+difficult due to needing larger amounts of phyiscally contiguous memory.
+
+
 nr_hugepages
 ============

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 42f374e828a2..834061eb2ddd 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -172,6 +172,7 @@ bool hugetlbfs_pagecache_present(struct hstate *h,

 struct address_space *hugetlb_folio_mapping_lock_write(struct folio *folio);

+extern int movable_gigantic_pages __read_mostly;
 extern int sysctl_hugetlb_shm_group;
 extern struct list_head huge_boot_pages[MAX_NUMNODES];

@@ -924,7 +925,7 @@ static inline bool hugepage_movable_supported(struct hstate *h)
        if (!hugepage_migration_supported(h))
                return false;

-       if (hstate_is_gigantic(h))
+       if (hstate_is_gigantic(h) && !movable_gigantic_pages)
                return false;
        return true;
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a0d285d20992..3f8f3d6f2d60 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -54,6 +54,8 @@
 #include "hugetlb_cma.h"
 #include <linux/page-isolation.h>

+int movable_gigantic_pages;
+
 int hugetlb_max_hstate __read_mostly;
 unsigned int default_hstate_idx;
 struct hstate hstates[HUGE_MAX_HSTATE];
@@ -5199,6 +5201,13 @@ static const struct ctl_table hugetlb_table[] = {
                .mode           = 0644,
                .proc_handler   = hugetlb_overcommit_handler,
        },
+       {
+               .procname       = "movable_gigantic_pages",
+               .data           = &movable_gigantic_pages,
+               .maxlen         = sizeof(int),
+               .mode           = 0644,
+               .proc_handler   = proc_dointvec,
+       },
 };

 static void __init hugetlb_sysctl_init(void)


================== huge.c =======================
#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include <errno.h>
#include <sys/syscall.h>
#include <linux/mempolicy.h>
#include <stdint.h>
#include <time.h>

#ifndef MAP_HUGE_SHIFT
#define MAP_HUGE_SHIFT 26
#endif

#ifndef MAP_HUGE_1GB
#define MAP_HUGE_1GB (30 << MAP_HUGE_SHIFT)
#endif

static long mbind_syscall(void *addr, unsigned long len, int mode,
                          const unsigned long *nodemask, unsigned long maxnode, unsigned flags) {
    return syscall(__NR_mbind, addr, len, mode, nodemask, maxnode, flags);
}

static long migrate_pages_syscall(pid_t pid, unsigned long maxnode,
                                  const unsigned long *from, const unsigned long *to) {
    return syscall(__NR_migrate_pages, pid, maxnode, from, to);
}

int main() {
    size_t size = 1UL << 30; // 1GB
    int node_from = 1;
    int node_to = 0;

    printf("Allocating 1GB hugepage\n");
    void *addr = mmap(NULL, size, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS | MAP_HUGETLB | MAP_HUGE_1GB, -1, 0);
    if (addr == MAP_FAILED) {
        perror("mmap hugepage");
        return 1;
    }
    printf("Binding hugepage to NUMA node %d\n", node_from);
    unsigned long nodemask = 1UL << node_from;
    if (mbind_syscall(addr, size, MPOL_BIND, &nodemask, sizeof(nodemask) * 8, 0) != 0) {
        perror("mbind");
        munmap(addr, size);
        return 1;
    }
    printf("Faulting page in\n");
    ((volatile char *)addr)[0] = 0;
    printf("Resetting mbind policy to MPOL_DEFAULT (local policy)\n");
    if (mbind_syscall(addr, size, MPOL_DEFAULT, NULL, 0, 0) != 0) {
        perror("mbind failed to reset");
        munmap(addr, size);
        return 1;
    }
    printf("Migrating\n");
    unsigned long from_mask = 1UL << node_from;
    unsigned long to_mask = 1UL << node_to;
    long ret = migrate_pages_syscall(0, sizeof(unsigned long) * 8, &from_mask, &to_mask);
    if (ret < 0) {
        perror("migrate_pages");
        munmap(addr, size);
        return 1;
    }
    printf("Migrated pages from node %d to node %d, pages not moved: %ld\n", node_from, node_to, ret);
    munmap(addr, size);
    return 0;
}
