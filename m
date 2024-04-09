Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5025F156C5D
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712685078; cv=none; b=fG4TYX6TAPzyxaimfBuepgj+siAhJKBJ1sIIHbdtEhR6MgtaIdfn3ncZuwuL1l3XaRKUrv1KxOqrc5dhqNfatH5a45mRzo0Y8Bimo3xjLJhzpfo/JWnx0cZoJnyt3xb5ou5A9YlcjAMugzkLgBboG5PyeJexs1A+5LXjmiL66vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712685078; c=relaxed/simple;
	bh=4Mv4JnaamEMFtqjppXQOdNnTp12kg+C/D7qGCSJVY+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=m9ELzIP6FS8STgriN4QHptKRGRlXc8Xp8Gk7L5A1yuTOFgYAA54wbI+Gjv+aE2AA1Db8+pULcW6OskdP1WTV8hI6+boiQ6L58Ng435VngYDKGGvErlUmr/QY1rqj77wv9T5wyJt9+oKaOAPoFTNF0onS+CvpLcs4Q9JZwVWLWS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CuBDkDVy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CuBDkDVy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-6ed4203cafdso1599216b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2024 10:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712685077; x=1713289877; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=qSb1EMKIyurI6CZqrBQhbOzp5bKMnooWMDlfmCQHkvY=;
        b=CuBDkDVyvnYV65R62JtrzAncdWzBNd+OxfSnfDLeunsyaH6WMcuplmieKR0/UEffl4
         6lTZIdzqMKz5tyuniZAp7seVDIS+lmOwQWdMCRrLZJGHC56HoyT5+zTZvD41+uvEG02Q
         IYLSEnRUS7DUDSdzTDyo3vLFPeoSD0oPEBQ+MVIUbTnaeC2xneSK+38kJlDsp4tlI5jQ
         bS4zNOL6dgouOw8ybh0gSWPZm4gd5aeYyITBgvizoxRO3epFUtB/8Ay3miWILAQq0JHL
         dfUTFLBH3qbjp18Wgd7UU+jvLpv8QMjcuVgpxeAWlIdAWrBkA8KaGx5cCC6EoKhM1xo9
         JE5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712685077; x=1713289877;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qSb1EMKIyurI6CZqrBQhbOzp5bKMnooWMDlfmCQHkvY=;
        b=XY7RydjwDKcz5VXPeXgdHENM1PuPDaOyKRaM0u7NbTuWXyIgwbioQeVNuIYzAdduQf
         tKdYenAWbz7Z3+EyG972CB0yaKMUuIQnrl+3bo09t+mYB12BYglcewuJZjGA+DMeU75X
         P32MQDwv/09QDgLvkRXXLQPpoEFAV5GZK+Ox/zBwIqkfocRLXmOgcTtQcQtBtkik/6r1
         UdktqNI+a525eJGQ0zopzyNflNPJetYt40GVIFoEr7qGJRDS7wYCc3ABlDZi9dmnR11x
         4M3BoZYYCPVj0Qv2S+8sOGtMCJkj87yXYV9+OIRZ7wyb0RoFJ5wuJyEAFntsmcTgdSPW
         +wSA==
X-Gm-Message-State: AOJu0YxhjHVuUNZzInbOZjSdMKPHf/AT854EtRSfkAcojAt3vyYeSL9Y
	cy48GZzxxNM2gjwS2kPcfKqbGbjWCTztSJhoUsnYDRijKdrUCFtsRU1HiUKNCp3b+OsySZFc1Ac
	ERg==
X-Google-Smtp-Source: AGHT+IFBk9SVlkSEc4xukn3nQNTD/u4a73A5Zc/qt1mZJNwu/MInQ+Oti0Aw/jqgBed6aGrOn/f0orNgOzQ=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:4fca:b0:6ea:baf6:57a3 with SMTP id
 le10-20020a056a004fca00b006eabaf657a3mr4590pfb.6.1712685076626; Tue, 09 Apr
 2024 10:51:16 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  9 Apr 2024 10:51:07 -0700
In-Reply-To: <20240409175108.1512861-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409175108.1512861-4-seanjc@google.com>
Subject: [PATCH 3/3] x86/cpu: Ignore "mitigations" kernel parameter if SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Explicitly disallow enabling mitigations at runtime for kernels that were
built with CONFIG_SPECULATION_MITIGATIONS=n.  Because more Kconfigs are
buried behind SPECULATION_MITIGATIONS, trying to provide sane behavior for
retroactively enabling mitigations is extremely difficult, bordering on
impossible.  E.g. page table isolation and call depth tracking requrie
build-time support, BHI mitigations will still be off without additional
kernel parameters, etc.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/x86/Kconfig                                | 10 +++++++---
 kernel/cpu.c                                    |  2 ++
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 70046a019d42..7d623df11a1a 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3423,6 +3423,9 @@
 			arch-independent options, each of which is an
 			aggregation of existing arch-specific options.
 
+			Note, "mitigations" is supported on x86 if and only if
+			the kernel was built with SPECULATION_MITIGATIONS=y.
+
 			off
 				Disable all optional CPU mitigations.  This
 				improves system performance, but it may also
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 10a6251f58f3..f4e4dd360636 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2493,10 +2493,14 @@ menuconfig SPECULATION_MITIGATIONS
 	default y
 	help
 	  Say Y here to enable options which enable mitigations for
-	  speculative execution hardware vulnerabilities.
+	  speculative execution hardware vulnerabilities.  Mitigations can
+	  be disabled or restricted to SMT systems at runtime via the
+	  "mitigations" kernel parameter.
 
-	  If you say N, all mitigations will be disabled. You really
-	  should know what you are doing to say so.
+	  If you say N, all mitigations will be disabled.  This CANNOT be
+	  overridden at runtime.
+
+	  Say 'Y', unless you really know what you are doing.
 
 if SPECULATION_MITIGATIONS
 
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 07ad53b7f119..d445763d8047 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -3214,6 +3214,8 @@ static int __init mitigations_parse_cmdline(char *arg)
 {
 	if (!strcmp(arg, "off"))
 		cpu_mitigations = CPU_MITIGATIONS_OFF;
+	else if (!IS_ENABLED(CONFIG_SPECULATION_MITIGATIONS))
+		pr_crit("Kernel compiled without mitigations, system may still be vulnerable\n");
 	else if (!strcmp(arg, "auto"))
 		cpu_mitigations = CPU_MITIGATIONS_AUTO;
 	else if (!strcmp(arg, "auto,nosmt"))
-- 
2.44.0.478.gd926399ef9-goog

