Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77611CAA79
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560327; cv=none; b=lf3z0Lu5UbTqeJ4OAUoKtj03S+ck7s0aMMrg3UxlGkD3lEbcDds81otCAH6ZgcCLD7LhQCuUlb3ZOlzZQAe3z899dTrDFt+wn1fV+fTCB5/p64HHsAJQpcDfYOmicPJ/bKB4xzMFXYtw488DBj9iWuFvzsCau2tnJZFlPQEn7Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560327; c=relaxed/simple;
	bh=yxWFKfFkKHmuOpsxGuTO4vPY99a8JR43U1hClfLdqBk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=l1xW0bROqthj88Y5o42sq8biU0c4VmOzLnzxGbYoUTLQmUHcjEfslgSM6gejCiRS0jN1d4nWaP3StXeCyOIHMQSblDneSmNOqO30E2f4FXQCV/VptYq5eIZgsoxbnL+JAI1OnHjWwNOOXXD0HWemCpukrwUpinbcIwARNaiv5U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JrnCHHLB; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JrnCHHLB"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-66aab34ff9cso1651996a12.0
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560324; x=1775165124; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=JrnCHHLBnnSdj37f/7KmfJMneZEXt24dNLLaqP6aGRkUHDGp2Q1x/BzSMmGO/QKwFL
         KtadSgexEhD+xdjaMztTmCEXOLINZmEmuWfhQsjZ7iAPaNeXfuRJRVdUWasIywOjShZM
         J4CZ6KhcQv1v2301sVyyhQ06RclkaPtVuToP3CzhWJB/FYaNXXxWSDFAjaFz2YJiqTDl
         CJQs8ZJZrN2VloBEB2PTcAtLitArxDRDKZXNYfr98NRKbVw95wkCzNdF9O/b0ApPVyuN
         SA+Sr7qmjydMEnSGbOf0EY4OFwp5UBDXesNjR9813fui0iqU6tJ+c0s2m3LanlE2Stvn
         EMNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560324; x=1775165124;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KWI54gUN+/1z0II7jAJ2ytcdqsD5FtTzHZqzZAkbnP4=;
        b=nmCZmGaY1T4fYACoNnEwC2anT6GIl9sYIRsag0sdBz0CgBDMfgoFWVhAU8BTu/BrwI
         g2basn8hGcZG7rGd1xZQQ9nlak2x/scUB7bfMLsNcwPLgNf50zlZUUmdHMHHjDcWM19T
         oYeTBwbqOKfbN67olqbgPGsrIq5lS7rLqyK1GemrQoI7cJEAwAZRPAgeRmqvNrfZIxAS
         ortGdc8TehkHsj5nTKb0TZs/QkSTCpnc+qNWhMJPt8thSl0TxmGHGnV53CUdzgY16Tgg
         e5htDK4AgL09jExqpfrWLXI2LZtS4vNEKLoZi74kcMFSmDiHy+PuxwWYxhD9S+Oco44b
         T65Q==
X-Forwarded-Encrypted: i=1; AJvYcCWV8J0+As0BAxsokoXwmvHzXc+uK4GXXd5f9z0nXFWvcDenwQwIkX9xeS0ojpwOwu0BRRBhbjb88/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBKXj+/cQWSACwuBvU+ch8w0rhB2mPqgPdRVbeuVv8oxNqoxct
	dZ1OPfJG/0olMcdFAX7B4vrkgCUnl8B3YsSB0Mv+FEZ2i1oSewBFAo0VwkpMvsSMTMsL2tcGL1X
	cXvltBksAPFWjieRIvg==
X-Received: from edf13.prod.google.com ([2002:a05:6402:21cd:b0:667:53b3:300f])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:458d:b0:669:2043:ec13 with SMTP id 4fb4d7f45d1cf-66a82672771mr5923271a12.21.1774560323929;
 Thu, 26 Mar 2026 14:25:23 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:25:02 +0000
In-Reply-To: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-fa0796fe88d9@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-1-fa0796fe88d9@google.com>
Subject: [PATCH v5 1/7] module: define ksym_flags enumeration to represent
 kernel symbol flags
From: Siddharth Nayyar <sidnayyar@google.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-doc@vger.kernel.org, Siddharth Nayyar <sidnayyar@google.com>, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="utf-8"

Symbol flags is an enumeration used to represent flags as a bitset, for
example a flag to tell if a symbol is GPL only.

The said bitset is introduced in subsequent patches and will contain
values of kernel symbol flags. These bitset will then be used to infer
flag values rather than fragmenting ksymtab for separating symbols with
different flag values, thereby eliminating the need to fragment the
ksymtab.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/linux/module_symbol.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/module_symbol.h b/include/linux/module_symbol.h
index 77c9895b9ddb..574609aced99 100644
--- a/include/linux/module_symbol.h
+++ b/include/linux/module_symbol.h
@@ -2,6 +2,11 @@
 #ifndef _LINUX_MODULE_SYMBOL_H
 #define _LINUX_MODULE_SYMBOL_H
 
+/* Kernel symbol flags bitset. */
+enum ksym_flags {
+	KSYM_FLAG_GPL_ONLY	= 1 << 0,
+};
+
 /* This ignores the intensely annoying "mapping symbols" found in ELF files. */
 static inline bool is_mapping_symbol(const char *str)
 {

-- 
2.53.0.1018.g2bb0e51243-goog

