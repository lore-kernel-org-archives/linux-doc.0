Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACEB156996
	for <linux-doc@vger.kernel.org>; Tue,  9 Apr 2024 17:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712685076; cv=none; b=jjv0ZRxwTjuYh0VTU/oPgDPf7RyDJPuq+66g6Rf1kQIhQcwZvZO3CK1wyS/0dGln5F19TfR0Mg8hIA6/n4dM3h2ALesXqFNc0ZObzIZe5VnMk1JV0BVkS/ezrMknfEoM/IcUatcSAuD10UcPTYZ4NvrJQtYptmXySwrIqvNsW/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712685076; c=relaxed/simple;
	bh=QVtEQp4/Pcfuor0ucORpy+mLoe+0G9NQLRsGApm4biU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B+/KbfDB+6GsOfhO3f4oKJ2+BMm30cu/ezjM4Wg0zmf5xuRw+PcyYbER+81XV+Y+69YyJM2Q/r+9kUWMENwM0J5sSXhycMOY6dtS0SlvcECuwBBkPAE499TTN67mOXXnMQrxo75KsUwK4cFyqAHK4c2BwhY/a9yPMLrpq/SkHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=itkF8bUI; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="itkF8bUI"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-5ce67a3f275so3921614a12.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Apr 2024 10:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712685075; x=1713289875; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=A7D9RJgwpQ1W8M/aA/vuUOPVBx7m9VVMSR4azYK+r2U=;
        b=itkF8bUIabXOiKwdBCbeeKobhWElxIjYrJNzz526HLsXUB4YJyUFvtlf9irtdKrGJN
         sU4lz+itK40DWd6VluXd3Cqk3StVNb+rbnGQ02l2F381EX0kQcW1yjQQ5yAwnjYC5Zff
         YSLS/OuWJCQ/WQ5xi916NnQD8d4P75LlyqekEzVMvKf70TJ4n8zBXloWAtMAmCd9hapM
         Nh+Vdp+TrPSk2r+W80MGduWh+HCHuEZj0IM4U9IvdXnWW53jtsLTG1u+SPOO76eyab7C
         VS0Y2kZPPVs4oN4mdFKSNQDR9u0BooXAYn7L29wdLetkqur41XLZRH3Dl9P2vM7snd2h
         DoBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712685075; x=1713289875;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A7D9RJgwpQ1W8M/aA/vuUOPVBx7m9VVMSR4azYK+r2U=;
        b=ZSFc6/qcpYWyrzeGYIaO64hkZXlhJKcEnNh4fH/A4mEHbWG7Dgr3dvkEnRFo0VfYos
         6AyfRatCPL3ASUEtv9zKWL4pJFrlLAdGJ4Cs31L3CvMWdhnp6Dn0/MvNKGyHwhHoaZ+G
         hc9WzjT33pf2e4Y6uJotD3zvws9GIzTTepSDnanzJGARyox9nHbVBgQVyyKV/Fe8nqeo
         EUD7EJWB2dvwHGuPHCdqbVSnbZoVbpFRwROmKmqbm7r9DwRQqbMG/6btQ79g0qBIg7l0
         oU4ZccZ9g0/tmwwz0scbtG5AAljkyKzjU4hFWdIAABu2/aO0DE28Qq3iXwQaauzEFFqJ
         G6ww==
X-Gm-Message-State: AOJu0YxPuSvEfQ0MBk/oIn4avs3UQq/J+8opTI6nHI2kls+5mgM7u+gM
	iVu4qWcfCoH+Kuv9w0KZML5UqGcaFpLXO/9s9qEvzmLb3qXjSh20C7ci2irHgHT7gtLLGqM+hpY
	hTQ==
X-Google-Smtp-Source: AGHT+IH/KQ46x00AZLl2fd+Lf61jBhBT8o2VrRznGwLDVKKAWw/UNewgQ/kzIVWdr4XXtJVvXT21E0kiGIY=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a02:682:b0:5cd:8454:38b2 with SMTP id
 ca2-20020a056a02068200b005cd845438b2mr10850pgb.11.1712685073964; Tue, 09 Apr
 2024 10:51:13 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue,  9 Apr 2024 10:51:06 -0700
In-Reply-To: <20240409175108.1512861-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409175108.1512861-1-seanjc@google.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409175108.1512861-3-seanjc@google.com>
Subject: [PATCH 2/3] x86/cpu: Disable BHI mitigation by default when SPECULATION_MITIGATIONS=n
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	Daniel Sneddon <daniel.sneddon@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Rework the initialization of bhi_mitigation to use positive CONFIG tests
for the ON/AUTO cases so that lack of *any* CONFIG_SPECTRE_BHI_* #define,
i.e. when the kernel is built with CONFIG_SPECULATION_MITIGATIONS=n,
results in the mitigation being OFF by default, not AUTO.

Per the help text for SPECULATION_MITIGATIONS, the intent is that 'N'
disables all mitigations.

Fixes: ec9404e40e8f ("x86/bhi: Add BHI mitigation knob")
Cc: stable@vger.kernel.org
Cc: Pawan Gupta <pawan.kumar.gupta@linux.intel.com>
Cc: Daniel Sneddon <daniel.sneddon@linux.intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/bugs.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 295463707e68..e1775debeafe 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -1630,9 +1630,9 @@ enum bhi_mitigations {
 };
 
 static enum bhi_mitigations bhi_mitigation __ro_after_init =
-	IS_ENABLED(CONFIG_SPECTRE_BHI_ON)  ? BHI_MITIGATION_ON  :
-	IS_ENABLED(CONFIG_SPECTRE_BHI_OFF) ? BHI_MITIGATION_OFF :
-					     BHI_MITIGATION_AUTO;
+	IS_ENABLED(CONFIG_SPECTRE_BHI_ON)   ? BHI_MITIGATION_ON  :
+	IS_ENABLED(CONFIG_SPECTRE_BHI_AUTO) ? BHI_MITIGATION_AUTO :
+					      BHI_MITIGATION_OFF;
 
 static int __init spectre_bhi_parse_cmdline(char *str)
 {
-- 
2.44.0.478.gd926399ef9-goog

