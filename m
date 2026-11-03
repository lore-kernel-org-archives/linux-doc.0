Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793719108;
	b=dGdiHrCL3hwOcdc9eDA/Vf3egjs+0sWKFZok9L2DlSF5hmZSZ71MsdlUSuZ+4oepUUNH
	 nSKGl4HaTX4yRveRI9LGc8cJWB8Q1INC2I+fXLoi2DiwhhT7GSm9/8Hn1ic50i1dzQqbQ
	 KqpTZr92eCVeyGe2/2KBrHuUPUR7hIMw6lzIGTMKEltfpfnNWY+bGl0MKw39Be+sHYKii
	 jCeopQyeN3i6l1ennPbXHFmsrwDC0t129uLOg+KYjOZJP4jyfJECzwxKwh+bzPboA/C2U
	 aZeb16bQHYFk2nfOlUD1skBKwSdj21lKIrr5rJRlTKBR3VDIFirc3iX3VULObQwLF0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793719108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
	b=NMLYeCR1w2T9HF6qv2+iyx8Igadk2tKBbCgzb8hVgOq77mQeOjvwS++nMbA0D2NZQsZw
	 6bINf4T7YfL5tm9qyL43WFTVd4GbJcfoex/81nGZOoIvM5CZuk82F6yTQrdjm3PiUhOlV
	 7XTnfZerD6CJ+0tR2ou5Dt+XeUOYrIFOUMiZBwXgUjNZLKgQOfTemjNnZMZkPMjf29Pyl
	 FXWwQ0RAqpAWH9BMd7SeFRrTGNaUU4xkT/uNtMaRoAyL7OJjVnb02rokhmnDRM7QSvZur
	 +J0RnhuGiB8D20s+f/nrrJw68ClybRu/bgJ6KzfqAKJITzS8kN7pv/qhp7qJ77JLfHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iJQAdWul;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6227606EE87
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:18:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6227606EE87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=iJQAdWul
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e98798cbddso20813145ad.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719107; x=1794323907; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=iJQAdWul3W/CUJhIrS5dvX0eM6WuXTz1S48rZb7FrM5HAGY2k2eULG3UN7fMf2HesU
         BgcewLwYarj5CoCIUK0cf985AauuA6PTll3ljWMb/GhZikHr2S8DKVa6H7UHtVmQA1VC
         Y1mKhneDjNU802KN7Ay4+ex61G7mP1iOn6T9o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719107; x=1794323907;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=hRckbYKNZbnuPg03BW8b5pkdaYgJYOojtMFYi6IfatjM+Y5How4wsnf6Tve+AOxtMv
         CkYZaKvGC/X3xxJEWYtgHL7KjmCZrGcDMo68sOdmlGml857msFdy8L6RrU5+nbm7rE7z
         jhgTXhUhdttIOeIOD1mdzkWq5ZggOm1+E5P2MhmqYHHerSBt4KxoGtVk1wq6xfdvp8EM
         0CQ4WbCvZTBZN5UESOjkdmVXr9VfReBvShadpfztJrDtnWsh/nO3UgdSTX/MnQCpDb0y
         9bxGnHFh6QUuJbIV01VMSxPJL9qM8I1ju4aOx4nOIQ9OsCAh/tuEt988cBW06rxueDxe
         kobw==
X-Forwarded-Encrypted: i=1; AKwUvBzp5QYHc5+jiseA+zivCeCRhkqRqYkQ5AcSKEvR8ijo8w59lRiHKDdfj1Wfd3bRKVfnVto6deiFz5Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Uw8CkGzlTCNE7es71UQUfEdP+Nhlt9Jt9Nk93eTnSK1Z8CLQd
	n0Gaof0hBIYFaN2FoLPEZBieR6JfaqMgK+5e34v5ZjHdfw15KmuO1jwQ2dHxeJKzQ0k=
X-Gm-Gg: AYBFou2teGN++whI5CwAg6sMZNs7Dq+NlP77rFkSBwTc/K3bu0O7R42mUyKqhTFQp88
	lvwcgcsvOXK8vfkrf6lnnCFGO6dPqFf5iLHVqBxbTclvuA0P0hUZMARSwnxIRJLqH8LJ++MbdST
	bujDaMNuxxcA/EXiPRzZ9Q2ENQNYlz5GkKd4dLikQzcAN+QJaBw9TB2bsr1bCJrCkJ5u55TMvqb
	WrT9en9f33kJazIsGX3LgzMrP3uOenfVkN5Pbzzw6XJSK2OpCMsL26oMw+LJdQ4b2cr3klVA9Tv
	mV28mgwhcCAq+VlcCgeCCGOEl2lEDKLdETFmmcVW9HzrSI1q+rk+l4olHYMvLq+eeu+JgiM5ugF
	mJ7jMxVdlBmt/DWRG74EfFxEfTHMloeqQNdB4kDC24x0EMTxfPbwsETmgTIjDQJ5NCI/qGbEF6c
	Icwd+q/ZZfZrkNBEDN3zHFBJD3ZoYuERuc5w8nMA0suqNdLxFD8eOiF1CSzD8aK+2+35bkmEdLI
	CBGoACCOVl94YW6K/W8gcl44nQn4UT4//s6YHhXb8Y/W+ME/RtkMyORfJff0rt7EzKtKWkDI/3b
	ACDGTFXoIRVVPE7Lj4eprH9i3a2hrEJWB1bwKtyD/VE/yutKJ3xoDm5rECqjkS73ZV/hAnev5XZ
	+UFuCXNUMeM7N4l937ztWqpgZJPjUwrk7bxwLvN3nOwKHdvHYc5ECRcxrdKg3cyKf8MY4w7VEQv
	tVq3q5u2mkfsiRY6tqTTs=
X-Received: by 2002:a17:903:1aef:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2eb364bc076mr131151785ad.39.1793719107092;
        Tue, 03 Nov 2026 07:18:27 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392613bbsm43426035ad.37.2026.11.03.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:25 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:23 +0800
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
Subject: [PATCH v2 4/8] mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
Message-ID: <6d72b96fdd36c8870393d8d6e67a811a9bce9e4f.1793718940.git.chris@chrisdown.name>
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

MSEAL_SYSTEM_MAPPINGS is in security/Kconfig, but it's an mm feature,
it's implemented in mm, and changes to it need to go past mm.

Let's move it to mm/Kconfig, next to the other VMA features. No
functional change.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig       | 21 +++++++++++++++++++++
 security/Kconfig | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..40172787dfa7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1355,6 +1355,27 @@ config ANON_VMA_NAME
 	  area from being merged with adjacent virtual memory areas due to the
 	  difference in their name.
 
+config MSEAL_SYSTEM_MAPPINGS
+	bool "mseal system mappings"
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
+	depends on !CHECKPOINT_RESTORE
+	help
+	  Apply mseal on system mappings.
+	  The system mappings includes vdso, vvar, vvar_vclock,
+	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
+
+	  A 64-bit kernel is required for the memory sealing feature.
+	  No specific hardware features from the CPU are needed.
+
+	  WARNING: This feature breaks programs which rely on relocating
+	  or unmapping system mappings. Known broken software at the time
+	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
+	  this config can't be enabled universally.
+
+	  For complete descriptions of memory sealing, please see
+	  Documentation/userspace-api/mseal.rst
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/security/Kconfig b/security/Kconfig
index f7bf6cdc6229..1679e8d009c3 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -49,27 +49,6 @@ config PROC_MEM_NO_FORCE
 
 endchoice
 
-config MSEAL_SYSTEM_MAPPINGS
-	bool "mseal system mappings"
-	depends on 64BIT
-	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
-	help
-	  Apply mseal on system mappings.
-	  The system mappings includes vdso, vvar, vvar_vclock,
-	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
-
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
-	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
-
-	  For complete descriptions of memory sealing, please see
-	  Documentation/userspace-api/mseal.rst
-
 config SECURITY
 	bool "Enable different security models"
 	depends on SYSFS
-- 
2.54.0

