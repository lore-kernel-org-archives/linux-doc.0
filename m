Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655C3DEAEB
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729674; cv=none; b=TuTSSoYCBjDMKzZu6zy7wpy4S5Zu6KQUPRaW4a5aB++kuY1DOtbs8RjOTIOaYdyk6XzGKJHNza0K5i4FBKnCB2q2J8qkBZu2gtSFOZyHHNFIFYTbqnrQmQ0ox9boE+amk17FIum6tvuvkFHWoE/7B2BmKSBK+Erde+0RALi38mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729674; c=relaxed/simple;
	bh=A4U/FoOHtW+MFUPt0VllbbGZtdckI6pJiFlzK0SEzrc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=U15ZsEeONqEHV20GH9z8y4hyHqcWh629G2CTlZ1QMW8kcqgbtPOhzQcii3AMRjOnYM6Rg3VpByzIEEA5VKiLqbd7aH1Um/E4oFc9Uv+63KXeTnKCnDdv6BIiGnnS2Kzne0oNpaj1rir5gd//wp9UMJqhOs1UY24mYTClY90MkHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bi3L4yXV; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bi3L4yXV"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4837cee2e9bso64757425e9.3
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729672; x=1773334472; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=Bi3L4yXVqBG+Qh7C94FVT0WOLx+982NH3J+gIK9Av7uuplqWJ9Oa07mJjjIkgA+0uB
         97xbWBadoB0EZiAC6x+4EFkM8TT74n/46tIfORSfE9X0f0uSn7LgUNcbEvhjqk6byy7t
         VeMQiHGy/DrMdQDPxgX8fFtfj4ziLUX/Q6kScYxirUfBcojbqjQKUrlgNfJoZMoy5vOy
         dalvWwXK5YlU2pI3ZnlX291+Lg3CC8ZWHbJZEmW7gIz/ulalVH1NNMp85Y1nLW6k7A0T
         3gV0DTY2xTMplfALUBKhDsr+RHmoZnBl+eclpjJAYs17jkPj7SP+Rchxz1rGn0+SXMzo
         WG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729672; x=1773334472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=sbIvmSAydtuu9vPf/gm1MiupEZ4logF7eiM8jKKoMfOAfS9pMdS1sIWjtnM47luQ14
         PynR7598vwFXH9OE46yUqxTgtvUGySeL9WzaERbvPXbvlCNmlc8fSBubK5gOlMdeAH5g
         Zv7Eq1WB4VZSmJ6UUwSduWYGC2ezyYg55oeURt2ZX24oyUKfmKJby6DPnT7KGh+SzvRI
         DEOnJ90ZpyWAvn5t9Kmgrd+jk0oih1osp8auAan3jY9U3spsutDqDhNfgx1LZtUMUyxF
         J79U9tw662X4QGKp5mKDkuiT5av+tqpfaHLNo1BP3EZOReaBUxqS2eO6CyxTfdG1R2Fm
         gSLA==
X-Forwarded-Encrypted: i=1; AJvYcCUjVay/oByKUju8zSCXvtnumscYzL1JwMm1GsW6HwOtpMp9u+JfJLifhOm8pFIDfl1L7AWaOtf+S6o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtC/Oz5Uac/iZl1vsScVrZ8ritvr7PaGSLtz1uhGd1oXoWN7io
	kmm09fpuYhKQNAlc0aJ5Q/xa+ga8OMhYIWLeIoIPoNfLsB7pkP3V2GFhQ/vfJ8zrw3Etec5OsIG
	KQmgfDDWQA6eTtqPwpQ==
X-Received: from wmbjv25.prod.google.com ([2002:a05:600c:5719:b0:480:6a27:9ec2])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:529b:b0:47d:25ac:3a94 with SMTP id 5b1f17b1804b1-485198840ddmr115115695e9.17.1772729671507;
 Thu, 05 Mar 2026 08:54:31 -0800 (PST)
Date: Thu, 05 Mar 2026 16:54:23 +0000
In-Reply-To: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-4fe6eea27e30@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-3-4fe6eea27e30@google.com>
Subject: [PATCH v4 3/8] modpost: populate kflagstab
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

This patch adds the ability to create entries for kernel symbol flag
bitsets in kflagstab. Modpost populates only the GPL-only flag for now.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 include/linux/export-internal.h | 7 +++++++
 scripts/mod/modpost.c           | 8 ++++++++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/export-internal.h b/include/linux/export-internal.h
index d445705ac13c..4123c7592404 100644
--- a/include/linux/export-internal.h
+++ b/include/linux/export-internal.h
@@ -69,4 +69,11 @@
 	    ".long " #crc					"\n" \
 	    ".previous"						"\n")
 
+#define SYMBOL_FLAGS(sym, flags)					\
+	asm("	.section \"___kflagstab+" #sym "\",\"a\""	"\n"	\
+	    "__flags_" #sym ":"					"\n"	\
+	    "	.byte " #flags					"\n"	\
+	    "	.previous"					"\n"	\
+	)
+
 #endif /* __LINUX_EXPORT_INTERNAL_H__ */
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 0c25b5ad497b..1d721fe67caf 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -244,6 +244,11 @@ static struct symbol *alloc_symbol(const char *name)
 	return s;
 }
 
+static uint8_t get_symbol_flags(const struct symbol *sym)
+{
+	return sym->is_gpl_only ? KSYM_FLAG_GPL_ONLY : 0;
+}
+
 /* For the hash of exported symbols */
 static void hash_add_symbol(struct symbol *sym)
 {
@@ -1874,6 +1879,9 @@ static void add_exported_symbols(struct buffer *buf, struct module *mod)
 		buf_printf(buf, "KSYMTAB_%s(%s, \"%s\", \"%s\");\n",
 			   sym->is_func ? "FUNC" : "DATA", sym->name,
 			   sym->is_gpl_only ? "_gpl" : "", sym->namespace);
+
+		buf_printf(buf, "SYMBOL_FLAGS(%s, 0x%02x);\n",
+			   sym->name, get_symbol_flags(sym));
 	}
 
 	if (!modversions)

-- 
2.53.0.473.g4a7958ca14-goog

