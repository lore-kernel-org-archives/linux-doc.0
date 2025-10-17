Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745F533C536
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731970; cv=none; b=NoyTN3IvesI0eYTM6FAYbsd0j7k+cnXFujirBdUA0PjFuF+J8CWlJoceDFQHAOZZ1IDdlDialX7jCBIb2gt89k+zXn8hzY2w4mmulPIHjV8fCtDPz6iJLz4kk44B20nI79HY/na7j2G7A99EN1LLQoPxy+/glbXfF49SsdJq8aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731970; c=relaxed/simple;
	bh=cwrAgKoOfoFmDzsB8GfouVjdDaQE4lrV8AsgVEuqlvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=A042bR8pgdaQmPVHArOVtlsqiIsWlGt4MsG/NFRVjDJWeeILDERVNU1r6eiVdXNshcaTyAqP0Wg+DRe1Jgr0A49dv0siyVr7WjNdg+3v7BTto2Unb5iBpzbHX8opV3gXCM/Ngk84gn5kvEZi7XImVbewB8Vpxz4CAlgen8/80Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MXn6fijT; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MXn6fijT"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-26e4fcc744dso15393805ad.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760731965; x=1761336765; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kctxz4bkwPEMxjAo5uv7zMkhZ7DomPYpJw8TjHTwuwc=;
        b=MXn6fijTk5zfppuhelhljX6A3t/1mAok4nn+OItA1YOiK7sNzRcgeMZam9Y3wAuO9x
         DiXbL8Py+OICYKWM2mJQ9XiITrVZST62sEg+hVfxIBr9Q7Q4WesD8WU19UXwlFf/uhtS
         9nFc7VIrLLcsMpA5iNIiPScP/NbPFM20N78M5CuMIJTDwdiIhBL3hqOZZLWPDebvDG4T
         10J+dSm2KqBdWBsjM3maHkHIoLh8rWcDR3ZBFR/ypecLBbbKTQ4p8yh1aY0pTWIaBWJD
         KSn/9zT2SgnYebDpEsOPirPIEBzP2OkZ55eZCZrIqS1YKgPy4xAamUvwfVCZU9crPKG/
         PX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731965; x=1761336765;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kctxz4bkwPEMxjAo5uv7zMkhZ7DomPYpJw8TjHTwuwc=;
        b=MDQej8pNS8DUS7O3esbz4sx2rIRZW9MGBszDEeSWYRVwg7VKug+U1ri6KFR8YRKoDS
         wkyeytAYufpObgpZ4YJJLiOxWyB2q6apq/9r3Px2g31/eZrsMqMMDnz1WdeQp8yVpvmz
         O/FYd5Jc7g5xJ/bsoegYvKTLP8Ej1lbgYZuZobeQsRd/2TjSxEJJR+G3aYk2OFaUm0Ac
         5iabN4DOO16WtJBFqRdKRjjGr6OFSrtS1kwitOq8D1mst9arMc3uk3Jeijtv9ZOn1QMR
         ELPvkaOQZu4kvJyuN8jR0f3+FQ5bIVMB5mtW8dlGe008EZe7pfAxQOIASY5zsBkyhpH7
         B+Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWemml1xISL1O4Q2Dn3inJG/1I6EWT0U5/h6GFuVCT3r32PcKu6vslGnQcNe7B5dkd6xnO8hOGx2I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZUxRS9h61lCpR6ZDj9Hz5oWEcj2v3q9aWqkvw4UKe1VzVQ2oc
	Feo7CJH1xQs0ZpqDOxgIdsQ1s+Qu6QniynTbtwQe4JsStMB/posEgzEA/7nOGdH8a89J4cD25+E
	0QXAO9xDntZIjcrMm+Q3XjCl82g==
X-Google-Smtp-Source: AGHT+IFw3NgbtgTZNOENDz2gBk436xq9cSXbkfHKeXAn9g3NU8+yq1Zt0gAdx01FZUaxcKcWB1HdYR90j/8QeZ03Wg==
X-Received: from plar10.prod.google.com ([2002:a17:902:c7ca:b0:27e:4187:b4d3])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ce8d:b0:290:52aa:7291 with SMTP id d9443c01a7336-290cba41df2mr57184855ad.53.1760731965412;
 Fri, 17 Oct 2025 13:12:45 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:11:51 -0700
In-Reply-To: <cover.1760731772.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <98bee9fff5dcd28a378d81f8b52a561bca8e7362.1760731772.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 10/37] KVM: guest_memfd: Enable INIT_SHARED on
 guest_memfd for x86 Coco VMs
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

Now that guest_memfd supports tracking private vs. shared within gmem
itself, allow userspace to specify INIT_SHARED on a guest_memfd instance
for x86 Confidential Computing (CoCo) VMs, so long as per-VM attributes
are disabled, i.e. when it's actually possible for a guest_memfd instance
to contain shared memory.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 5e38c4c9cf63c..4ad451982380e 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -13941,14 +13941,13 @@ bool kvm_arch_no_poll(struct kvm_vcpu *vcpu)
 }
 
 #ifdef CONFIG_KVM_GUEST_MEMFD
-/*
- * KVM doesn't yet support initializing guest_memfd memory as shared for VMs
- * with private memory (the private vs. shared tracking needs to be moved into
- * guest_memfd).
- */
 bool kvm_arch_supports_gmem_init_shared(struct kvm *kvm)
 {
-	return !kvm_arch_has_private_mem(kvm);
+	/*
+	 * INIT_SHARED isn't supported if the memory attributes are per-VM,
+	 * in which case guest_memfd can _only_ be used for private memory.
+	 */
+	return !vm_memory_attributes || !kvm_arch_has_private_mem(kvm);
 }
 
 #ifdef CONFIG_HAVE_KVM_ARCH_GMEM_PREPARE
-- 
2.51.0.858.gf9c4a03a3a-goog

