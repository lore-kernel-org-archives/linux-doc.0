Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719091;
	b=4+iTTiVRMeyV5l0LM+3jcU2hCJ6pIUoWWBGDbXgbW2kyWhOUIJWbzC61EpRrZkB8R5FX
	 1sVIK1/yMUIfnH8wkPYTienR/dbK7TodHLcXhSG5Me2KnaktzZq1NjMnF1tfhSzWB8lY3
	 Wtaiir/ErFUVS04hZSJFde/A5U6RXb0nO3JbyEXXkNrapswwVyHSjfFoncS+6eGK7aY0W
	 OkqcQzIH3sJ3V81PnxSN1UJV/bKCrvt0ZxutRPRv2K1iotoMnvBSFThIBz38O9QsMQKrx
	 bw5pfJkT4lI/xlwEcxwvi81W97k/Mw7Gyi119inSr426R6M34jAeaG18mEmPkI9ESwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
	b=HPXHgdNYP+Ev2bUnrUNn5L8p8GYBUDWkSUR3ifvbwbuYJS4rklGpz+LR74SXw/OSrlnZ
	 C04C/ctJdwZBcwwjvN3rA0RUYpj/+YXz4Zb4fimKEbhikfQxTdTeakEOePvSuSe+8UqAt
	 zMxgw4DQd7YIY65j9BGpqDdVkW1kAK+7d1W/itTN71qSty4NtlMcgvrEEyeh8i7dJOxKW
	 YW8ycZBIma40/l1ZMqG0FPKv8E6To/IkCdvEbgnMKwrFfPhFjjEesj5gbpNkIF5SymThm
	 6/Cp9VcHyv/MSBz3Tu74GpGY3CxIxZdaLkfN/vR42KkayOJlJ7qp5fPShj5hJbPAEpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="p/kCuN20";
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEC5606A7AB
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CEC5606A7AB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=p/kCuN20
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso552431a91.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719090; x=1794323890; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=p/kCuN20gyAkrSvljj3hdsphluitU8f5J8am+KboA8ZLs9tHk1gPwvR8KdkfAMjdm7
         10OwgpsxuZ5weZnwdFdepjEmZYfJ3mDeoPWjZWPSTjQ9u2KNp5OTXv+A8t6bfArOeZRp
         fp+8CF4kYPuQhEUcrVqcHLikxSKgicQY+GkUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719090; x=1794323890;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=NUbRZ6lMejEHMR37+72hB/HW874LGszK0gc/2tUnWq8WRCFLULIi7Znc4tJjS9XflZ
         Jr5CGn/FK11c28iNlDKgCtk82/j52btZlglubElt67hxTsXbMPhfKjjqOFtv8mWV07Co
         lCj0Qu9STd3g+uTY/kPkOXbX6zL+ownabC/b4dbyKoNQ4LLXAkfrypjcETS8NfQC/eFi
         gnezxkXN1yF0Ajr+KR8UOVxNWy+eUXrQxpmweojBMwiy8NDRB+oUw827roqo/2r99kVR
         f/IKdUMAi8WgAb+iFLswTY8NxGn7z6rYedKtZcnKDJF7Gl6G0kkQGJN0OWkC1/FBNF3G
         zhsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQxB1BFJiFE52rfvmMYX3zxOld0iX/UNU67Clp2/D5p80ShvDQDYAl24z5vKUTyVSQt502DW6ReBU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Oyy05cm9FCDFjqlMgvysMzz+FfbFnxOd8CzEATHCVgfR8N+5C
	CmWYwPkVBcOTgtWcMS/xVwXPfsIEN16zB1OYgxdbaE6o/SA3zunpR5rSfkiY7C7Pse4=
X-Gm-Gg: AYBFou3+jIrhamLAN9O+xB4lixCoMpvoX5CZrngGOThNJ/hzX8CWSqVVLfLp02jumXk
	p/dzwppgh+n8gsGW+BYBi7venE3DalbID5jaDDSIuiOrLz4znuVtrFEVPe2sZ+Oj1KnhJ3ru/FN
	3L2D+vzPjlVgTklzroQSb9OzgVa6w2fDoB2UFH4XCSn+Pd0B7Onl/ZqwryMATfhkNPLsCkd26DL
	nffUIdz9CRlI3gPZSU6xBkIDB8pLnGQJ2aa0L6lq8qIQRW57Ye/aJE2rZ2oZ/Rih7M1g/hrKptK
	CLImjopiKQuYe599KVIfdAsbV3ATDTq35d5jTruOhL71YV/CZG1qJeJ9B4L1VE4dt+vN5yxQeYu
	h+4x9TTvFz9ziuIq37i3GkS+1AhDlRop80YsKf4JGiRZKkDjchuKP9ukrj0N7+gzW/okx38u6qG
	zplrDOqsGF6tz1+CSUxTOBQeIJufYSRkh6bw0J/b+btln3LOUav2q/xcZddRU01SGzVhH79/wFb
	E7vX9jYTC+/w2mhDL1crfkzmucPLplAwPqj6Hcfxoogx0JeYaP40dEALRZ3UN/sLTcGZ6eKeJY5
	PBqQ1l+yJ8kgci0c4/F/FTrN+c+7npc7oBTfDjgCMmQTYU9oNpJeEAl0Kej4Pj2wVWPXcqyG42z
	Andsjx/eA35JX9FP0uTKabsSSnNgd482tvHdyxsvtxpSIE/MhyLUvrH/sYhHOnhFhPizeTo7B
X-Received: by 2002:a17:90b:3ec7:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ae896d7a1cmr6969572a91.15.1793719089722;
        Tue, 03 Nov 2026 07:18:09 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm4842349a91.12.2026.11.03.07.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:07 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:04 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 2/8] selftests/mm: Skip sysmap_is_sealed when system
 mappings aren't sealed
Message-ID: <6b11e9f77d8ede7ef2f16fef173970a7fa1978e5.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Now that sysmap_is_sealed runs with the other mm tests, it also runs on
kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS, where it fails.
Userspace can't tell whether the option is enabled, but a sealed [vdso]
in a new process means that it is.

So let's use [vdso] as the reference: skip if it isn't sealed, and
otherwise expect the other system mappings to be sealed too, and [stack]
not to be.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/run_vmtests.sh     |  7 +++++-
 tools/testing/selftests/mm/sysmap_is_sealed.c | 22 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |  5 +++++
 tools/testing/selftests/mm/vm_util.h          |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 573da5006268..1134a2e82610 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -307,7 +307,12 @@ fi
 
 CATEGORY="mmap" run_test ./map_populate
 CATEGORY="mmap" run_test ./droppable
-CATEGORY="mmap" run_test ./sysmap_is_sealed
+if gzip -dcfq /proc/config.gz "/boot/config-$(uname -r)" 2>/dev/null |
+		grep -q "^CONFIG_MSEAL_SYSTEM_MAPPINGS=y"; then
+	CATEGORY="mmap" run_test ./sysmap_is_sealed
+else
+	CATEGORY="mmap" run_test ./sysmap_is_sealed -T expect_sealed
+fi
 
 CATEGORY="mlock" run_test ./mlock-random-test
 
diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index cb0ca6ed7ebe..d5ab2b0d8ca7 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -10,9 +10,11 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/auxv.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
+#include "vm_util.h"
 
 #define VMFLAGS "VmFlags:"
 #define MSEAL_FLAGS "sl"
@@ -46,6 +48,23 @@ bool mapping_is_sealed(char *name, FILE *maps)
 	return false;
 }
 
+static bool sysmaps_sealed(void)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	return vdso && check_vmflag_sealed(vdso);
+}
+
+/*
+ * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
+ * mappings either, so check_sealed skips if they aren't sealed. This fails
+ * instead, so run_vmtests.sh only runs it when that's set.
+ */
+TEST(expect_sealed)
+{
+	EXPECT_TRUE(sysmaps_sealed());
+}
+
 FIXTURE(basic) {
 	FILE *maps;
 };
@@ -107,6 +126,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
+	if (!sysmaps_sealed())
+		SKIP(return, "system mappings are not sealed");
+
 	if (!has_mapping(variant->name, self->maps)) {
 		SKIP(return, "could not find the mapping, %s",
 			variant->name);
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 8ef226107d78..6732f76b7e61 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -785,6 +785,11 @@ bool check_vmflag_guard(void *addr)
 	return check_vmflag(addr, "gu");
 }
 
+bool check_vmflag_sealed(void *addr)
+{
+	return check_vmflag(addr, "sl");
+}
+
 bool softdirty_supported(void)
 {
 	char *addr;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index d32cb79d9905..0e94793b0d21 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -117,6 +117,7 @@ int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 bool check_vmflag_io(void *addr);
 bool check_vmflag_pfnmap(void *addr);
 bool check_vmflag_guard(void *addr);
+bool check_vmflag_sealed(void *addr);
 int open_procmap(pid_t pid, struct procmap_fd *procmap_out);
 int query_procmap(struct procmap_fd *procmap);
 bool find_vma_procmap(struct procmap_fd *procmap, void *address);
-- 
2.54.0

