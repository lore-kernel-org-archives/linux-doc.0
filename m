Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C518D3A6F17
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560098; cv=none; b=C1YpsXWMnoI5FXnbQla/S9GLhNfuvuHWfkMJ8zFlVdcLzwR1VFmaPaLftnTQt6GeNjmtgSaPH2pdGXUn0dNdyfe/+Sxe43mAqS2HVpexdRRWMBPt7NcpBN5iZf3pGe79oPylLHv4pvI9gl7OLnXURe9mkqzevPJyqtjPMnucjz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560098; c=relaxed/simple;
	bh=o/kOrCCo+fMsG/zyKbK9sMlBZ4cdbWSoTsj4GMMdO14=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=OHcC/rc9cpJmmN8C65GPbRwRLmh2QaQF1GyEIEXFdPPcMCAorIUAqTuSas6ghvJf8IqgUdn9gxcOE59RdfGq510poKaepg5bBHk6ydqK1O7t0t+Z7Hz85sAmhS8YN9tP0SMiwUzydrPf8xuKjyenLh8ussRu53PNYi4QNhaJBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g9Az6fUD; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g9Az6fUD"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-486fa35b005so17366145e9.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560095; x=1775164895; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q64ZpAFewOF3l9iLTHkbHOl134UR/SzN3vMtwvmgNnI=;
        b=g9Az6fUD/tX91QXDXr23H+svxrUB4bL4ew0s7PmzM6z/LttWAG6npjOpOSv4HQNo5J
         n8ofyLK0tfJVOi/LEX0UUEgS52VQNd83VxmK7p3Edlmf21yF4RjCw4LgDPBr/19+hJV8
         weZXye5CXCZthRv29dp5bI541X8KW19KLpaN1r7UjeE7P7oExOKn7KAPE7B6XX8QjWRo
         UXr2rDucNvAWYj8cwWxc+yM+yfZitdLPQu2WrCecahl2RXweNBq826x04YqG+oEww25+
         R3AOBoXqL4Edz+VJ7Jasy6D15NsVDrm2pCuBcr44/Vc4MFMtS937M+8/xZGC8c4kfukU
         1jaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560095; x=1775164895;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q64ZpAFewOF3l9iLTHkbHOl134UR/SzN3vMtwvmgNnI=;
        b=DbaenVd84cb050RzVuN4rLSffShXxIiGn9H2FfX3olptF9RGAhNtWxFKI4AunuDyj7
         Wuum8hOcY2uEEhm7nCQDdLSBp3OBB3GgQ7HF1X/ika9chBgsftiO5GlOXhm6RWYnHcKx
         m/hhHlPoPH9irBSQ85g9ywZzPstAo1TUOs+eIU2XpQBNOMFMoYZx3oYD5Og8B9YSBcpw
         8WWZyXoIDxfieKA4XaBGLqMkU9p4D3k3HCed+ToiNQpuiF/MIFPUO3XC1CPpG9cirnkX
         o6MMSFtYDv4NVTAncEVZVgshIy/va1IJGogNjp0B+8/BCjpBb/vDjjWwZP3x89cbKGwm
         SOAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxn1Gu3MDgE0wnUrL5jQFB6xMyvtkz2XX+GrFaru9L8U3+8TvmAAOMol95m9D3Fmvy83Q5BvFd1TQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvQzA28jpFk+lGEqUaEe72hmZZh63LXkUNcEGNlHYTuwGsZB0O
	ukV8m2KXJdOFTkuN7xW/IGPUrHx72lqpd1/c+2VZ4izCbbE0XmfdNOmtTIfEGgU9qlrnwzkCgh9
	gM9UbF10xuss66nhiqA==
X-Received: from wmi4.prod.google.com ([2002:a05:600c:204:b0:486:fb09:30b1])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a00a:b0:486:fcc7:d6a with SMTP id 5b1f17b1804b1-48727ea275emr2896295e9.13.1774560094966;
 Thu, 26 Mar 2026 14:21:34 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:30 +0000
In-Reply-To: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-2-455cd723dddf@google.com>
Subject: [PATCH v5 2/7] module: add kflagstab section to vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, gprocida@google.com
Content-Type: text/plain; charset="utf-8"

This section will contain read-only data for values of kernel symbol
flags in the form of an 8-bit bitsets for each kernel symbol. Each bit
in the bitset represents a flag value defined by ksym_flags enumeration.

The kflagstab section introduces a 1-byte overhead for each symbol
exported in the ksymtab. Given that typical kernel builds contain
roughly a few thousand exported symbols, the resulting memory increase
is negligible.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 7 +++++++
 scripts/module.lds.S              | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 1e1580febe4b..d64a475c468a 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -536,6 +536,13 @@
 		__stop___kcrctab_gpl = .;				\
 	}								\
 									\
+	/* Kernel symbol flags table */					\
+	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
+		__start___kflagstab = .;				\
+		KEEP(*(SORT(___kflagstab+*)))				\
+		__stop___kflagstab = .;					\
+	}								\
+									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 054ef99e8288..d7a8ba278dfc 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -23,6 +23,7 @@ SECTIONS {
 	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
+	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }

-- 
2.53.0.1018.g2bb0e51243-goog

