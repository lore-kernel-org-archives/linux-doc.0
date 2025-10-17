Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D879C334C14
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760732017; cv=none; b=Ti4I1tgrM4J3F0KnrBV+ZMZmYk21JMFTdRMtzAQOkPmf3+hAxodCjDogSKsjVlV2/9BshIHFHJhDvRF0rOPRg8+ogLmmQm3M+/6bQEDML0MI/ujHXNVA4vhgz4LqJTgvflhLbIjWpHiWSIZP0QbPxq2GXj0npEDcggL3/hnZk6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760732017; c=relaxed/simple;
	bh=qRKfLP0/YctV6FBW8xndwliTg6smlMO0A7iKjdufVBE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AVBLKgiGRCDXsQcb2JVFiqPqALZ+2+btPmJTRlORr71pXmMUSiRLuEUS9DN8uvqyajL63TMvDJLfuJwoo+Gri4aItYkXLD9i2hoJrJU4GRFeJ1LvgI8gjlml2+FeOWmjdxQAafXgok3o/XtfktHt9oeMgv5H2LvkoLV5O0ZFm78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mrIa+B4q; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mrIa+B4q"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-32ee4998c50so1882580a91.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760732000; x=1761336800; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=orndpBTxP9JNgsL+ZAOMK9xM6Hxdzt16XLD7BCy6nI0=;
        b=mrIa+B4qrJrO2fjcWOuYcWn0gAi0Xx6+Vb+NbNEso02TSpVUzS0Wf18XOv6A81jG/C
         CO4D90oppFZQh+T0x+JG8wU/ZkgfnwXw4bHAJtdC3iWSarib62xb89u3kqFGVDZlu3Y5
         COKRmO4P0AHdDKNNy8eVcnhUSHvH4Gj5i3MU4SeKe7XG5ZFYZbc2oejG/JI2AyQ+aIB4
         NLnLyZhEupgc6as8GJjxBtZKdySbuhu/5L7kThOSgyl022Krh+cLdPMfd81TR3582cnB
         XzMEhnnoQO2u7h5dc6ILRJiBdJXOFdW3LJfHs1oWxFkqvXqzzt1UMVhpEhf1N/xAaIya
         j5BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760732000; x=1761336800;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=orndpBTxP9JNgsL+ZAOMK9xM6Hxdzt16XLD7BCy6nI0=;
        b=TR/VcFiCPpTzKYsAZVxwaTeQqKtGZzTj9/936kg3qJZDxsTlEyDYO5/ro+CTNOnx53
         es5tCq1W7CTJutudGJVjyD1JvF/yw+sEi192Ijr3oQJUkeyH+oSf6uW/qZExv3vDww1j
         f3iYTp35/cN98rMtQo/XoHnNLr00ePmlteLiOY0RsOFmjpdanivFj1O46K9ab8uaov6f
         h0XVTYsWLa0wJ3U1XdStHfqtNpDdI0xBC0SkTuls3U7cAf6IApiGZcrQdfNFUEev2OsY
         T0q9tuxVCalBnbzIWqk5vjPELCUCbhzBrXuUchwNETBT2TbXJya7hiQOqRRO3cPVQF2t
         jSsw==
X-Forwarded-Encrypted: i=1; AJvYcCWiSelf6lzGeYelQ1+iQfBUBKPk2mM0G24a2hULejWcokVZVgPap8e/7cHXrshwUjU9CwrlGreGzrw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+rtIWLXNOvKdQHkOVEmn0PoJ2OuzYOseiuwfuWk8Cg5+DmcOf
	beOKV+8dwbqI3bOUrNk4C83djsnOHunS/XhATYUl3FYAeLkBNkEMs429E76e2G653RRf1NaQgQ8
	gF8AJYJvmNA1yk8Ls79z5yLsP7A==
X-Google-Smtp-Source: AGHT+IGeWtAhjkWefmdEnHuUzNA6r2JixiN55bt8CNgXz5dhA+P7k5CcuR+ogb7zE+Vv1FAI4nVZ4b3YH8H7OkxqhQ==
X-Received: from pjbft18.prod.google.com ([2002:a17:90b:f92:b0:33b:dbe2:7682])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2690:b0:33b:a5d8:f1b8 with SMTP id 98e67ed59e1d1-33bcf86ce26mr5766621a91.15.1760732000433;
 Fri, 17 Oct 2025 13:13:20 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:12:12 -0700
In-Reply-To: <cover.1760731772.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <e1e189b70461a6bf0cb8e71c1a18e0f9b553fee2.1760731772.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 31/37] KVM: selftests: Provide common function to set
 memory attributes
From: Ackerley Tng <ackerleytng@google.com>
To: cgroups@vger.kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: ackerleytng@google.com, akpm@linux-foundation.org, 
	binbin.wu@linux.intel.com, bp@alien8.de, brauner@kernel.org, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@intel.com, dave.hansen@linux.intel.com, david@redhat.com, 
	dmatlack@google.com, erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, 
	haibo1.xu@intel.com, hannes@cmpxchg.org, hch@infradead.org, hpa@zytor.com, 
	hughd@google.com, ira.weiny@intel.com, isaku.yamahata@intel.com, jack@suse.cz, 
	james.morse@arm.com, jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, 
	jhubbard@nvidia.com, jroedel@suse.de, jthoughton@google.com, 
	jun.miao@intel.com, kai.huang@intel.com, keirf@google.com, 
	kent.overstreet@linux.dev, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, 
	maobibo@loongson.cn, mathieu.desnoyers@efficios.com, maz@kernel.org, 
	mhiramat@kernel.org, mhocko@kernel.org, mic@digikod.net, michael.roth@amd.com, 
	mingo@redhat.com, mlevitsk@redhat.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, peterx@redhat.com, 
	pgonda@google.com, prsampat@amd.com, pvorel@suse.cz, qperret@google.com, 
	richard.weiyang@gmail.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, roypat@amazon.co.uk, rppt@kernel.org, seanjc@google.com, 
	shakeel.butt@linux.dev, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	tglx@linutronix.de, thomas.lendacky@amd.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, wyihan@google.com, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

From: Sean Christopherson <seanjc@google.com>

Introduce vm_mem_set_memory_attributes(), which handles setting of memory
attributes for a range of guest physical addresses, regardless of whether
the attributes should be set via guest_memfd or via the memory attributes
at the VM level.

Refactor existing vm_mem_set_{shared,private} functions to use the new
function.

Signed-off-by: Sean Christopherson <seanjc@google.com>
Co-developed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/include/kvm_util.h  | 44 ++++++++++++++-----
 1 file changed, 32 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index e9c2696770cf0..9f5338bd82b24 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -435,18 +435,6 @@ static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
 	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES2, &attr);
 }
 
-static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
-				      uint64_t size)
-{
-	vm_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
-}
-
-static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
-				     uint64_t size)
-{
-	vm_set_memory_attributes(vm, gpa, size, 0);
-}
-
 static inline int __gmem_set_memory_attributes(int fd, loff_t offset,
 					       uint64_t size,
 					       uint64_t attributes,
@@ -507,6 +495,38 @@ static inline void gmem_set_shared(int fd, loff_t offset, uint64_t size)
 	gmem_set_memory_attributes(fd, offset, size, 0);
 }
 
+static inline void vm_mem_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
+						uint64_t size, uint64_t attrs)
+{
+	if (kvm_has_gmem_attributes) {
+		uint64_t end = gpa + size;
+		uint64_t addr, len;
+		off_t fd_offset;
+		int fd;
+
+		for (addr = gpa; addr < end; addr += len) {
+			fd = kvm_gpa_to_guest_memfd(vm, gpa, &fd_offset, &len);
+			len = min(end - addr, len);
+
+			gmem_set_memory_attributes(fd, fd_offset, len, attrs);
+		}
+	} else {
+		vm_set_memory_attributes(vm, gpa, size, attrs);
+	}
+}
+
+static inline void vm_mem_set_private(struct kvm_vm *vm, uint64_t gpa,
+				      uint64_t size)
+{
+	vm_mem_set_memory_attributes(vm, gpa, size, KVM_MEMORY_ATTRIBUTE_PRIVATE);
+}
+
+static inline void vm_mem_set_shared(struct kvm_vm *vm, uint64_t gpa,
+				     uint64_t size)
+{
+	vm_mem_set_memory_attributes(vm, gpa, size, 0);
+}
+
 void vm_guest_mem_fallocate(struct kvm_vm *vm, uint64_t gpa, uint64_t size,
 			    bool punch_hole);
 
-- 
2.51.0.858.gf9c4a03a3a-goog

