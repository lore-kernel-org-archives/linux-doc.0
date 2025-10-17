Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F148733FE31
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760731984; cv=none; b=qM73zssqjVih4cP3FNivQWEIhusAzNxqDESSpXjcov7gT7fQWwztN9jZ06aTRXU/IX8FbSEl+X5GfnmT604U1PfZc/KdMsVZhTQUx0UEeULVagtDia70h/m7WX7VScuZDCKVYHG3lR8ldRLyvGrqp0REbBJdoksvhsowR7r+tYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760731984; c=relaxed/simple;
	bh=pi5VSKfhBzaK0pja1AboLbydPX5/8PXDX0PMb0d86Ys=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=K6gkUPBsaFgtq8lh9Y1nNguQAa9+NMKxyA4qCmQEcMjLeP3TPJi/6pykjfMV00TELsug5jEL4Yj07BThJHe+JCKY5m2qnttSN2LMdZ26bkAy2RWn9asRyjRvkYpn0CBHNYfwk4eMrVrfbkHGVqIHA4HGKuJrH39k7QHhTGA9nlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YUrfYpR2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YUrfYpR2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b522037281bso1564750a12.3
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760731977; x=1761336777; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eBN6AwEHXD/aiISNDR8pg8faV6ZyO7L8ox+VpVWfPhQ=;
        b=YUrfYpR28q2og2vHBJ/6LmUYqRPznaJwmQDvvL/Q8pIjUblukhJWYwBbxCqdK+x7Fw
         W4M5b7c/+8prByWNCwRsvOP8v4dehJL5vmlGTOXBJorrSOE+8IL8axwYIOrHZoBWeSRJ
         Edl253qzPcrQCf/hxhlrG2ASd7hmUAuMvTSEjCWAqsAR6G2aD1ImNovainf0AtAiamZM
         zAtR9Eqm4VHfP973d5ghGT/y/qq6SCOvzwAXt3z9obYuvum0Qk4y9HY6e3Fu+q+88jT6
         g8kDkNeBTXBa3zkFzEFk7eSSxZA62p0CzBvPFJ/zgawgbJOR66qrnpyIrjGYDyY2KhML
         aeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760731977; x=1761336777;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eBN6AwEHXD/aiISNDR8pg8faV6ZyO7L8ox+VpVWfPhQ=;
        b=ES1mz2kMwgVKm1oEstQz6aPaV8vWSMlEFVooq7Q7CLzhl31pcJnUV3lxexSqFKbI2a
         dPx9y8lK0/Hd6agJuScz2FtmmbXxQEJYt+HqOPwUe5fDYvbIrerVxzZ0MiAfYJFdf8+4
         u17ack+C5wZO7vsYtrZ5jAicrbDIOZ48u5rKT0q7UO/d/Cqg6fRuNBpAkYGdjJWl8oqq
         RkiIrvRXAEddH1TPCwswuAXfCqsDC/WU1U3fo1IpSQWhyX1cLQw5tSaxX3GPVU4nJsDr
         66wC9SM+3dgasAt7Uoc8ZwtZesdyxF6Lxfyfd7NnV566Lv8k/k/P7vOI5NossFX+UEJQ
         NVyw==
X-Forwarded-Encrypted: i=1; AJvYcCWI2GBBlRz5odDNFpz6dE0HubzQV3+z1uRMtknyrsCUfTq8ttwg/5IRjhnii+oHEHH3QURsU2Zff9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7EGBJljd4S8cKs0lbW0uNvLuKf1EeYsSr7WNB3hyeS5QbdlCf
	d1LT3LqQMhZy2IqK+a5xjwbg+kLhahutac5WO2c/tZ0nmnkfehEUkBqtOr5JafBsKBqt3v5z62o
	q7SNNGUclNxEgtNHrMywG/kvwtw==
X-Google-Smtp-Source: AGHT+IGqSqDsWsx806j5fx5Gr2lF7zksRxZnbRglNYfztC6ik3n9V25acElVgVa649/iudD/hPxzJ8Jc0ivuaCEvLQ==
X-Received: from plbbf3.prod.google.com ([2002:a17:902:b903:b0:269:9358:ea3f])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e944:b0:290:b14c:4f36 with SMTP id d9443c01a7336-290cba4edaemr54722075ad.31.1760731977088;
 Fri, 17 Oct 2025 13:12:57 -0700 (PDT)
Date: Fri, 17 Oct 2025 13:11:58 -0700
In-Reply-To: <cover.1760731772.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1760731772.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <8fbb93e2ffc8e4bd42f931d460a26ef9392afe4c.1760731772.git.ackerleytng@google.com>
Subject: [RFC PATCH v1 17/37] KVM: selftests: Update framework to use KVM_SET_MEMORY_ATTRIBUTES2
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

Update KVM selftest framework to use KVM_SET_MEMORY_ATTRIBUTES2 and the
accompanying struct kvm_memory_attributes2.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 tools/testing/selftests/kvm/include/kvm_util.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
index de8ae9be19067..019ffcec4510f 100644
--- a/tools/testing/selftests/kvm/include/kvm_util.h
+++ b/tools/testing/selftests/kvm/include/kvm_util.h
@@ -394,24 +394,30 @@ static inline void vm_enable_cap(struct kvm_vm *vm, uint32_t cap, uint64_t arg0)
 	vm_ioctl(vm, KVM_ENABLE_CAP, &enable_cap);
 }
 
+#define TEST_REQUIRE_SET_MEMORY_ATTRIBUTES2()				\
+	__TEST_REQUIRE(kvm_has_cap(KVM_CAP_MEMORY_ATTRIBUTES2),		\
+		       "KVM selftests now require KVM_SET_MEMORY_ATTRIBUTES2")
+
 static inline void vm_set_memory_attributes(struct kvm_vm *vm, uint64_t gpa,
 					    uint64_t size, uint64_t attributes)
 {
-	struct kvm_memory_attributes attr = {
+	struct kvm_memory_attributes2 attr = {
 		.attributes = attributes,
 		.address = gpa,
 		.size = size,
 		.flags = 0,
 	};
 
+	TEST_REQUIRE_SET_MEMORY_ATTRIBUTES2();
+
 	/*
-	 * KVM_SET_MEMORY_ATTRIBUTES overwrites _all_ attributes.  These flows
+	 * KVM_SET_MEMORY_ATTRIBUTES2 overwrites _all_ attributes.  These flows
 	 * need significant enhancements to support multiple attributes.
 	 */
 	TEST_ASSERT(!attributes || attributes == KVM_MEMORY_ATTRIBUTE_PRIVATE,
 		    "Update me to support multiple attributes!");
 
-	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES, &attr);
+	vm_ioctl(vm, KVM_SET_MEMORY_ATTRIBUTES2, &attr);
 }
 
 
-- 
2.51.0.858.gf9c4a03a3a-goog

