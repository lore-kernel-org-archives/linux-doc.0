Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383615;
	b=HeiQYfSOZEqaEgASEo0JeDIDNbC3xfdrCAkugTToGqYcmNYHiip0Y2XGyF7lYjOwo2ik
	 zO4rMECsJNM7zOLuhbxF2sp2nwJmvKLD9JKIITS6j6amS8cgpG4m8lJyhR/a2axPdKqvA
	 ulWRKY1W+6wUV+XBB0bxuxPo5DSkxfOvCw7WVzALvuwWIAF8+zCQyIBbxMMC7+zmV8REq
	 PtYanuNDoU6yi90CeQf1jw/ELD/80+avOxA0udGwxikKQbsbBsKyO85A3ENz1ZIXOZ2YD
	 U9f+fnNW0rBDUvvkGVatiJYnw9Ebhqyvyj8Orhv7ogaJdxmpsQOJORGCmKrFZyDWxPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383615;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+8ppAZ4kI36SkHC2JSY1XPhx8Cnr7U+W7X/gURi12I4=;
	b=bXNnJgdJOBQQYbwfp6NE9nM++7tBKryuuNMSXyCq8nheILD4WHuERwPhUkABo/Z89ExS
	 gp8MaV1PH2lo5tAdgKioRMpS3KsRvTzxJ2Sig+J+T6q9JzthCKeFUH7OWB0HXz5QAK5eU
	 19QhUHmtjk1EFujo1p+75gRSy8M2zl1/C0mfHBeiGD4JVFou0UvDnA+z+fWgDE529p/+H
	 /QC1hxWVzdPcSdy3RA1UtExVcVojN+vBR3c7FKBAgFGJKa3pbgluaZs+Sl2yn/izAODPo
	 Q48Cqu1N+Hh5vg31FUcjkNBKoAAgnYXXI6hVoK7Nll+Q/uY82X8spBW7CHC0NSfG0NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GTCbL3hh;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017AF60A2602
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 017AF60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GTCbL3hh
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e9eb579c0eso16360825ad.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383614; x=1794988414; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+8ppAZ4kI36SkHC2JSY1XPhx8Cnr7U+W7X/gURi12I4=;
        b=GTCbL3hhGoh0IEuShmnZd0s6MpqUCVHMB28hFhie2IoVPHfTrh9csg+/ol4FMk/vpn
         VBxAigtfoJooFSpDVd51SAHCavWTI7d7qeZX5xhLt+m6+d4cHlB5lsCeYZM80IX+3Ud0
         OZLaVEH1zoIDQRNm6u/krQdNirI4zfBn1IqHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383614; x=1794988414;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+8ppAZ4kI36SkHC2JSY1XPhx8Cnr7U+W7X/gURi12I4=;
        b=xJtj2ioKujFN55O1I19ynkjcj2JfeH8+M6FDXNVXmYh74Cyo/bmmUS8sQGlMQ49wn2
         +d72MMB2tIeW6CG8pS6GngKkOP5VDdlfHVAYeCZUzMpiDgptavuSJNMS5NQN772EY91T
         9L+2aSg99ugt3TsMmwYhXqUJkaLYYMqzqWaaafJu/cEseen4uFF1t47PA2/AeSvnWF0a
         mAFG0yxtRsk71IW9ABJ7C6GNVUzrmgCwcF+jMyuIrmWOnnLOJhBZmT5SOGE95p4aoST0
         wz3/2EmOJHPghyJeiUimAXKw21fc741zj+kSFet/qL1fa3LRhi8jvSTYNTzX1JSM8VUO
         PjPQ==
X-Forwarded-Encrypted: i=1; AL+hErG7pwsDtJVQc/KxGRub66DNOCPhlj31o3AXhHOuXQAJ8OSogacuJ4urIkLWJ/1TkKkZTmUu7KTN+Wo=@vger.kernel.org
X-Gm-Message-State: APuU4Z98MJjViQ1nCcJdvEloDWEC1f8ormmogkwxSlZ351h7yWX7y0q9
	mOKtz4iITCjryqk6afhu3mKN5VkCIvHNZ0PTI86kQtibBv4dZ55vMBDXzoUbEc2HmpY=
X-Gm-Gg: AYBFou1rYEy5k281G/SVrbiZ3tTj++QPxSHOCJS+TiKSnpyhjhzoA7mCPHhGwqOdCYI
	31WJ8gYxkt9yjfxqEDR3VsJcuqih60n+fkpgxtDZBQ8CHXVR6CRyM0d4PzifuV2puKZ8Bt28pGG
	2ZTkS/T8ol0CqTO41VKmtrc6CWkRy77Lyu3KZlNKJhP8OchJOPpQ/hfhnrUiUSGj5xI2DjwOj9m
	JvnTW9E0JU6JzNpg0ZzkWzl9Ju64JEwGTTIm9/Vf/raUWUWQNkjEJI8IB3S4SFLXejEvAN29Y2N
	H1PRnjW5T07Rt/DDyo+bdGjrhVaHDyhGVP8Fq/PkohlggP9bWngOqY9msLvbEzEOnzjm2hchsta
	xVuRa1NB64LaBSoyiTKJCFRwKluOVcmS+LN2fE6vYGdi6yYHN7AcOT/bvmIBkMgKazOqC6kz9hL
	ukPea284q3DHvjsSKTEVBeg8opBMDIrJqbzHHCpU3DgUykDbubn0dU0/hTLV6hWnItVOdFYp6bP
	UkXFZTYkYQeDdpwMSKh6MCDY4RATrJTTzYP6Mjv1nCzWmuu0qDgm5idJX8Pxq8JCIp6XCQUgEqk
	9/R1Qs06NMWg3V/W6IKdFSYlLz0AUTWiCC0hGCwH9xKWx4Ng19WZiCWseFpVqJ2VItaBhnmDu0l
	OazC+VpMb12BSDf1/IImv/lHfIh0ZZI5yhr2PU7Se1p5IHRtCRhjCD3AKUSktjFdQQtMs7qRsJK
	8BlxBoo3zDR1xl6LUzeYQ/C52Kg5WpaFUXtP9tDCaWcmiGNovWHT5y
X-Received: by 2002:a17:902:da87:b0:2ed:294c:2b9c with SMTP id d9443c01a7336-2edd7ac1ea6mr21231125ad.51.1794383614325;
        Tue, 10 Nov 2026 23:53:34 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6a3f730sm18051095ad.5.2026.11.10.23.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:33 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:30 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 6/9] kho: Expose rejected handovers that look like cold boots
Message-ID: <abfe907e8da92802cd5e0c843d8013e4d229aab3.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, our rollout needs to stop if the new kernel rejects the KHO
handover. For example, if it doesn't recognise the handover FDT's
compatible string, it can boot normally with all the preserved state
lost. LUO's incoming/state reads "none", as on a cold boot. We log
"disabling KHO revival", but our fleet collector reads procfs and sysfs
and can't rely on kernel logs from every host.

Let's add /sys/kernel/kexec/kho_incoming/state so the collector can tell
a rejected handover from an ordinary boot. "revived" means the kernel
accepted the handover and completed the preserved memory map walk. LUO
reports the outcome of restoring sessions separately.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../ABI/testing/sysfs-class-misc-liveupdate   |  3 ++
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 12 +++++++
 Documentation/admin-guide/mm/kho.rst          |  3 ++
 include/linux/kexec_handover.h                |  2 ++
 kernel/kexec_core.c                           | 13 ++++++-
 kernel/liveupdate/kexec_handover.c            | 34 +++++++++++++++++++
 6 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-misc-liveupdate b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
index 25e3b49d7aeb..608f788ef0fa 100644
--- a/Documentation/ABI/testing/sysfs-class-misc-liveupdate
+++ b/Documentation/ABI/testing/sysfs-class-misc-liveupdate
@@ -19,6 +19,9 @@ Description:	read only
 		"deserialized"  The sessions can be retrieved.
 		"failed"        Deserialization failed. Opening
 		                /dev/liveupdate returns -EIO.
+
+		See /sys/kernel/kexec/kho_incoming/state for the status of
+		the underlying KHO handover.
 Users:		system monitoring
 
 What:		/sys/class/misc/liveupdate/incoming/sessions
diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 80941a7d8a7c..5636cd060cb2 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -67,3 +67,15 @@ Description:	read only
 		Total size of the KHO bootmem regions in bytes. Returns 0
 		when KHO is disabled.
 User:		system monitoring
+
+What:		/sys/kernel/kexec/kho_incoming/state
+Date:		Nov 2026
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Status of the incoming KHO handover:
+
+		"none"     No handover was passed to this kernel.
+		"revived"  The kernel accepted the handover and completed
+		           the walk of its preserved memory map.
+		"failed"   The kernel rejected the handover.
+User:		system monitoring
diff --git a/Documentation/admin-guide/mm/kho.rst b/Documentation/admin-guide/mm/kho.rst
index c329d720bf25..9d74d4ce18b5 100644
--- a/Documentation/admin-guide/mm/kho.rst
+++ b/Documentation/admin-guide/mm/kho.rst
@@ -88,6 +88,9 @@ sysfs Interfaces
     Total size of the KHO bootmem regions in bytes, or 0 when KHO is
     disabled.
 
+``/sys/kernel/kexec/kho_incoming/state``
+    Status of the incoming KHO handover.
+
 See Documentation/ABI/testing/sysfs-kernel-kexec-kdump for the sysfs ABI.
 
 debugfs Interfaces
diff --git a/include/linux/kexec_handover.h b/include/linux/kexec_handover.h
index 736d51e79fd2..1f37d2300e26 100644
--- a/include/linux/kexec_handover.h
+++ b/include/linux/kexec_handover.h
@@ -42,6 +42,8 @@ void kho_populate(phys_addr_t fdt_phys, u64 fdt_len, phys_addr_t bootmem_phys,
 bool kho_bootmem_overlap(phys_addr_t phys, size_t size);
 phys_addr_t kho_bootmem_size(void);
 
+extern const struct attribute_group kho_incoming_attr_group;
+
 static inline enum migratetype kho_bootmem_migratetype(unsigned long pfn,
 						       enum migratetype mt)
 {
diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index ed105e6351eb..c1085a53b7f4 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -1372,7 +1372,18 @@ static struct kexec_link_entry kexec_links[] = {
 };
 
 static struct kobject *kexec_kobj;
-ATTRIBUTE_GROUPS(kexec);
+
+static const struct attribute_group kexec_group = {
+	.attrs = kexec_attrs,
+};
+
+static const struct attribute_group *kexec_groups[] = {
+	&kexec_group,
+#ifdef CONFIG_KEXEC_HANDOVER
+	&kho_incoming_attr_group,
+#endif
+	NULL
+};
 
 static int __init init_kexec_sysctl(void)
 {
diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 21d77e29d2bb..dfd6fa7e4a71 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -19,6 +19,7 @@
 #include <linux/kexec.h>
 #include <linux/kexec_handover.h>
 #include <linux/kho_radix_tree.h>
+#include <linux/kobject.h>
 #include <linux/utsname.h>
 #include <linux/kho/abi/kexec_handover.h>
 #include <linux/kho/abi/kexec_metadata.h>
@@ -97,11 +98,18 @@ static struct kho_out kho_out = {
 	},
 };
 
+enum kho_incoming_state {
+	KHO_INCOMING_NONE,
+	KHO_INCOMING_REVIVED,
+	KHO_INCOMING_FAILED,
+};
+
 struct kho_in {
 	phys_addr_t fdt_phys;
 	phys_addr_t bootmem_phys;
 	char previous_release[__NEW_UTS_LEN + 1];
 	u32 kexec_count;
+	enum kho_incoming_state state;
 	struct kho_debugfs dbg;
 	struct kho_radix_tree radix_tree;
 };
@@ -957,6 +965,29 @@ phys_addr_t kho_bootmem_size(void)
 	return size;
 }
 
+static const char * const kho_incoming_state_names[] = {
+	[KHO_INCOMING_NONE]	= "none",
+	[KHO_INCOMING_REVIVED]	= "revived",
+	[KHO_INCOMING_FAILED]	= "failed",
+};
+
+static ssize_t state_show(struct kobject *kobj, struct kobj_attribute *attr,
+			  char *buf)
+{
+	return sysfs_emit(buf, "%s\n", kho_incoming_state_names[kho_in.state]);
+}
+static struct kobj_attribute state_attr = __ATTR_RO(state);
+
+static struct attribute *kho_incoming_attrs[] = {
+	&state_attr.attr,
+	NULL
+};
+
+const struct attribute_group kho_incoming_attr_group = {
+	.name	= "kho_incoming",
+	.attrs	= kho_incoming_attrs,
+};
+
 /*
  * Look for free blocks of 1G. This is a heuristic chosen to work efficiently
  * with large systems with hundreds of gigabytes of memory. It will work poorly
@@ -1753,6 +1784,7 @@ static void __init kho_mem_retrieve(void)
 	 */
 	kho_in.fdt_phys = 0;
 	kho_in.radix_tree.root = NULL;
+	kho_in.state = KHO_INCOMING_FAILED;
 }
 
 static __init int kho_out_fdt_setup(void)
@@ -1992,6 +2024,7 @@ void __init kho_memory_init_early(void)
 	 */
 	kho_in.fdt_phys = 0;
 	kho_in.bootmem_phys = 0;
+	kho_in.state = KHO_INCOMING_FAILED;
 }
 
 void __init kho_memory_init(void)
@@ -2090,6 +2123,7 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 unmap_fdt:
 	early_memunmap(fdt, fdt_len);
 report:
+	kho_in.state = populated ? KHO_INCOMING_REVIVED : KHO_INCOMING_FAILED;
 	if (!populated)
 		pr_warn("disabling KHO revival\n");
 }
-- 
2.54.0

