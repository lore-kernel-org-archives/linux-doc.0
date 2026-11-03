Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719120;
	b=gsmCrRVZic6I2tS4tqRQ29ULhG4Cjn6RUL6wXFP0DERFEBakQ6zi8zBrt5sNTrOgjde1
	 7wWpYywBK2EKcW7tYg3a3n6JiPmH/dUx4glg5A72zzQpVAbQuM9JeGKu0jNyOk0wY0AOi
	 tLdZDBfoPEacZeYBIWiGDoyOayiYu3lTcrrpX14qH3wi1IanZv6vIZ5oQfrns/xszYrvA
	 2N1px8o8uyXXiHiHGuXW9SYUdqEgbymRjsS17IDKS6uf6Gicp9u0tGRV57wU8oxn9qHo7
	 LyamzGFdl2+Rm26nUhPOO9g6FrRwQZwnqq1Hj4vq90WYf9XsFSn4CKgJMdb/sxq2ImQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719120;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
	b=5IiOilX0TEi8AVJYEeeA4Jz+kArguNrdM9RgLCUzHkZO2g1Ao9jrvlV1Du6LxTAfvlNz
	 YyC8rw9FB5Fw1zRXohPYeu6PE1LZdvoEnftiNdFOg0vWT8hdgX08ajtNhY+zNN8b2/7n1
	 GrRAJgD6UxD9+I+kdRFYDXeu64cdoZO+kInrHHuyt5CZmn/pMIIW69rsA6zMxUalJbWAl
	 BisFlx8A6MpWM4oiyaeIFhlFkIz1wv4zVKAbsao4+sBSUmkDSujy59Um+PSz4kM1KzQpQ
	 N+Kwxi6oDIc7iIDQuzXJx1jgnclOrKsqfmm0WzyHSeu4AqyfAXSiWFdzthf2fad9UIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vXDo8nSw;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DE5606FCEE
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:18:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58DE5606FCEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=vXDo8nSw
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a070781f63so1783690b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719119; x=1794323919; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=vXDo8nSwX07T4u0WugVxJxGRVpDQBKjCmW8vlUTIAwRjrgaJDV95kxZZdbYwykUsv4
         oGQ2zZup5suQNxowaPkPUPCG0SLqX5utDtZWnwiuOd/TTj0F1PqMXls4v/o8+UQxVM9X
         v4Mfrlii/4TkboHCyVh2dS6LupQKAnMukFfqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719119; x=1794323919;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wslCY1XSUoR3v4P9N4tk1erDlQSR29c2WrcvV4W33z8=;
        b=l4BjOVKv+O5fnZDI2+XxSTKbj8Hqi20GEkHrL0eIujDsEMaoZccUW1WP50EYszcNwy
         0ZgIshatdseLyGAgyIHRwJvm+T+2ERPYV6NyZyl/JMSVGJUZ5XfRvdRlEZ6uku0dwzQ2
         X57OEZCeNsKMQ9XIIAMgxmN2NxCSR9fn6pQ5LWwGo61afI1l/eK7ble8ISVPUcxjkYxX
         EUf7h9PyuTyPFsFuaEFElAdKNxNw73Hek8Hnwa9t5EEIFWOeVd7OUbuRVX4QDNr+C52Z
         e/gHG/dYwhFjqRPw55U7OB4payK1JA6Xd4LQKI8ZKprShWvmHe6LAVANVMtiU3dkYdSt
         o4IQ==
X-Forwarded-Encrypted: i=1; AKwUvBxx1PZ+iSqTs2gztn7vbrY3QZChhRbaojYeIm8Xie5pKlr7WcOj00PK18ryBb7qvNqjuNNmKFn6uvo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/07HqOMZ2DoMrWNotexS8yPO94kmKIbNoWHBtI0oabAqz/ti+H
	CdSH74ngmrEsHDbOFSKBftnVPeHsMRpvvaQ/4QCpaZ/AtYMz2lIjARbIhelBiPIh+jE=
X-Gm-Gg: AYBFou2z1QDuzxjISmzpuAVLI97p9O4xy8AylxZK55gCTkd/vPcio7Vp03tDkOmPX4u
	oebaZAyIcraAbcW+abvGvLCSCiuJoc6i7f5vsyS4RMqFMiGxrNI66cMZiZZrHhf7RrB1l9eGnag
	pzn7baBhoO+scJsMrgqyTxBWW3it41sbYQcfEtTlhWsZIHkMUfzg3IU99+bNKeJE5YBq59/pic5
	VzOSF1ck7b2x9tXkvX4HtxF7ZbikSJlu4XQy0xpPQ0JP2vXAvT8fnplE8ryi/cib8rIcNdF5k1M
	YUOeK5I8Lts9fVgtSwYp/Iwe/0nzltzwdpOvjHNZDDPeLbjhjsU4uq9Ek37YF9xzL4Hd1I7BhCY
	E89Xs09bMQHc/ePgoHGnDyoWUR+niCo4spQPpZao6NpMvm8juoVdWndr1jbXKfR3InQ5uJqY90B
	qCc1w5qiEdWhryIWvoab1QADg/LAB/Hhec3H5z+p+wAiGlvM9oV/AOaqfK9gzN3k1vFAA0GpUKq
	TsP01hw1T6DmdZT6Qu0EqmVD58/meKSWsRAjlqwkNQfqQiqi+Rm5McLZe9cYnEoodc+QpAvbiJp
	v6NyZp4x/JLv5JARnn8m/B7MRaeXzPS6sHxKshudl2c7E1AQwxJr/LCkNENp+VHxUo800ipBsdp
	2GStZJNXEqOFa5kv4tTQHNU2kVBeTGxVHFkbh14nVLS+DGoDAsqxvX0UA4x2unGHjSx7QcvuuTM
	T28RR+/rESbY+p27El0g==
X-Received: by 2002:a05:6a20:914a:b0:3dd:a009:3182 with SMTP id adf61e73a8af0-3e928e2909amr12529216637.42.1793719118513;
        Tue, 03 Nov 2026 07:18:38 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb362ab313sm1592131a12.0.2026.11.03.07.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:35 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:33 +0800
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
Subject: [PATCH v2 5/8] uprobes/x86: Leave sealed trampolines in place on
 optimisation failure
Message-ID: <eafd3da2cd2c3e2c4d137a46f50351dc6290c5ea.1793718940.git.chris@chrisdown.name>
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

If swbp_optimize() fails, __arch_uprobe_optimize() unmaps the
trampoline it has just created. The next patch seals all special
mappings when CONFIG_MSEAL_SYSTEM_MAPPINGS is enabled, which includes
uprobe trampolines, and then this do_munmap() would fail with -EPERM
and warn a second time.

Nothing is really leaked if we leave the trampoline mapped in that
case, since get_uprobe_trampoline() reuses any existing trampoline
which is in reach of the probe. So let's just leave it in place when
it's sealed.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 arch/x86/kernel/uprobes.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/uprobes.c b/arch/x86/kernel/uprobes.c
index 0f60c0d076b6..fb895bfc09e0 100644
--- a/arch/x86/kernel/uprobes.c
+++ b/arch/x86/kernel/uprobes.c
@@ -1183,7 +1183,7 @@ static int __arch_uprobe_optimize(struct arch_uprobe *auprobe, struct mm_struct
 	if (IS_ERR(tramp))
 		return PTR_ERR(tramp);
 	ret = swbp_optimize(auprobe, vma, vaddr, tramp->vm_start);
-	if (WARN_ON_ONCE(ret) && new_mapping)
+	if (WARN_ON_ONCE(ret) && new_mapping && !vma_test(tramp, VMA_SEALED_BIT))
 		WARN_ON_ONCE(do_munmap(mm, tramp->vm_start, PAGE_SIZE, NULL));
 	return ret;
 }
-- 
2.54.0

