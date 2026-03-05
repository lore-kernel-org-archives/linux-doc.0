Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7D03DEAC2
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 16:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772729726; cv=none; b=JOesTxmOjVgREA/5W5r8m/+qsbpDWXewzemk+fHISk+zY60sp0Vypfugt0VZrYNp0B1DdD1y0fZw9LD7f6Y3RHzgoEhKwa5wB7x+U1Wnp5uZ0HHvVDnDkDdUn411ebP5cnkD6z9SuHJmjtT6WaEvszGSTVzE818tvJC4nkS15n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772729726; c=relaxed/simple;
	bh=A4U/FoOHtW+MFUPt0VllbbGZtdckI6pJiFlzK0SEzrc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dhOay6YJWcNftjNFoTpYmPQ8Dn8ohE3XHaTvTFxKZXVqDJa/TP5JzUEhKgl3j0/A84KwkdAuke8qmzWP18uYetz33XpCFCKNhOefUa7+2QM3XaA0BR9RM7l/AG79CnlQOpYV0dUa0PfCNZ6wFaraZYA0QJW0VGd58v0NycHxNGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=faBc76hZ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="faBc76hZ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-439aa1d898cso4906807f8f.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 08:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729723; x=1773334523; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=faBc76hZf7er+kQakhk31TRbyvy5B52oCxLafSwDTcLqrzNBQn5ErtfD/DbLutxbQR
         BBZLZWvNzqqWOPQm4R4j3sk41iVqWM+nGGkFajiGYagdbShoHWoJcqWmEggJGgcS5hTo
         MjrKpwegdhJHKUDT+1mXN2jSEjwNEyLFEfex84n6EIkyTDy+Anjgv7xstIMtPjm8SARe
         VCLbO/1Sf10UquBdbNP68mp3NyTrcH5aB0YEs+rpmFlMKtLzS6wepp4fry0VnNJFLYMO
         RzhcvOZXyx6UBEMD3FWKn+8j8vS4YYatbIa71SAhZVtMb3/c2h96McD9g5BudVEWpZGK
         x1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729723; x=1773334523;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V+WoAPEi01xLPG9zvw+lWYQpkS4zZIu+aKoCdLedeNs=;
        b=R51rZ9PdJlmrK6ykadvSzRaVVW7wES/wNOKU5GWrlEvv+JEegUYk5x5eb6GU9m+ZdE
         QuswfK0IX+9WyKac4k417qeZguwp5Hui4yjKKuLbM+h7LAC4g4ciQoAQJiS2jLJ5SEZl
         INzK18e4qaq3fBJ5njk5DTQ60pcCQRjuLNegdqtlmBei5igXrWYeN8i/H7sEY6Bb3tnk
         fB/kyUQoNKZh2s8c1ZalGFLY6303iTXH8nHpji5NOYuDZ2eSQzeGYV1Ddf5dIiJzO9C9
         B1dd8SKt9rSf6EC+cXkwsySftIrzOCc3k83j+9/ruOW0fPeIx6XLSx6KaU6IG1d1jKRG
         RsdA==
X-Forwarded-Encrypted: i=1; AJvYcCWFVardnIChynVWqvQCUYaJal3uLw2yH4iOXLUwzCHL9q8tDPJix3npBTTSL0zl11HmV9aC0IoDgHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJUklaqR1J/ltI2ROE/07knQ+Er0xGeSEF5ZxrnPsq+c6lC60i
	E9p6hYXNrMylQjaQni/N7si6UqiVtpD34tS3acmCMXTjDdGzsG0dDktszNH4CQpBuurCL9eIWu9
	g5NI0GwDdgDTGVBrCpg==
X-Received: from wrbbh8.prod.google.com ([2002:a05:6000:5c8:b0:439:adde:b305])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:608:b0:439:b62d:be86 with SMTP id ffacd0b85a97d-439c800fa23mr11367518f8f.47.1772729722667;
 Thu, 05 Mar 2026 08:55:22 -0800 (PST)
Date: Thu, 05 Mar 2026 16:55:19 +0000
In-Reply-To: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260305-kflagstab-v4-0-6a76bf8b83c7@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260305-kflagstab-v4-3-6a76bf8b83c7@google.com>
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

