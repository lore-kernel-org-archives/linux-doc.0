Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC893A7832
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 21:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774560100; cv=none; b=ksKUZNYeI4Vtrz3ZGeYvCaHKdNgVGxxQmMAc0KCLzy4VknKwRhYaCVRS+668QZ+Nbu7dao9hMEkY7rzm7bxPQ+bdNpFToVDlrz7HsnlFtCQXz2D+ctS17atE+Yl0LN5L4gqjfgT/68k+dTeB/7PGXFKs5vd5FWYFxkE2g8dRiP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774560100; c=relaxed/simple;
	bh=IMqZKd1uN1FnLrufR1Vtu+d5jfNCK7QjuAG3cXhKCg8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PCWVfJQhhwMwfoE6iE/k87Or+LBWle/kwzMAR3ZnUjDRUFC1Yz01BgdZjIDBD/lCa6/oW/PsENj8zjx1iUqMIuj5wRS5y87py4Bd/y1+4NBNxk7kM6yWKl7nioAHKruak52E7lafscKTqTqf4pIRDObNlcwFTCEoS6TXFGUbank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWEcxSo/; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWEcxSo/"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43b8f23bdc7so199989f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774560096; x=1775164896; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=woqFHYkUrW1f2z9oyqhnpwQO2sR6jhXkFvm21NeDZng=;
        b=YWEcxSo/tPc9oj+YnbOhlWr1z0FwJQyLh02QsQ0r3w7o6I1/YTeC+L/0xHPPKh6D7T
         PWef0TPxfGOeBf0TKgRx0fWbM8GXXgAxuWF7MHuoZIcdRHALuVeJVU/jjRRa1NS0i82F
         oFuV7kFXQqRYkDBcQewLoDfEORopc3wY8cH7W5c+WnRW33TZCsNmWwO43OzyROx1P8oV
         /weYJSoMMEcjiTiMv5eVwN6z7BHzOGNFUW1Zjy3Sfy4I9ET8Zymib4v1RJG6+Vb1/umg
         8WUihadGguTBACOa4B85Eg+Vh+/la/5B2GxXiKYOJt8iCQbOJai7efSM/CqEkk0HuGUD
         7UXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774560096; x=1775164896;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=woqFHYkUrW1f2z9oyqhnpwQO2sR6jhXkFvm21NeDZng=;
        b=r9XuEBS+Mh95nyfk/1ftemOs5sIYVhcxxKZtXBfjYIHPdVQPVL3dn9yINy7amgk0lW
         KyBZw/FcgA3MFzrgyVxwiRP/cWXs6lXXYrJyjdXIKUvu2jNHgAKrANKIPrEd8Cyl4Aj8
         xzkrkhRAMCIKit5PU+r53ioUKFKdEsjS/x6IRJgh7Ckz+c8dqgT5SZFhbmoGy/2+F0Ep
         kFLNcPKmYPAhF9Geuuh399stlRR42h7X5jUUOZMn1bRgngwkRcGXsv83TAxIhLBRr2Ro
         lKXgxVJzv6xQRnIP3Gy0PUyPDUeBPBF5beE4aLXf9TBbH43vr7YRnlrwEyi8tVrDw7z3
         JDwg==
X-Forwarded-Encrypted: i=1; AJvYcCU9gslsWEUdPkMTohmiOVAyYCATQZmTkkq2tB7qaebP6xTHw0YecNFkBzZSB+y29ZU8tsSxPPoapqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzA3KWtzWjSE1BcZMiEpi4UfwooOqK7yndEXjpYiYgyFyVFo3nw
	1dwB55JFYmViAWZLhUl0gHYnHqguUCz++VvhHY4pEmRUXxXlOtB3ZbrH5fbiR9FFOd6Gr8TMuj/
	1TLIMq0GkPbr9DRHo6g==
X-Received: from wmog14.prod.google.com ([2002:a05:600c:310e:b0:485:318b:96c6])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f53:b0:486:de04:5906 with SMTP id 5b1f17b1804b1-48727eda749mr2852285e9.19.1774560096155;
 Thu, 26 Mar 2026 14:21:36 -0700 (PDT)
Date: Thu, 26 Mar 2026 21:21:31 +0000
In-Reply-To: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326-kflagstab-v5-0-455cd723dddf@google.com>
X-Mailer: b4 0.14.3
Message-ID: <20260326-kflagstab-v5-3-455cd723dddf@google.com>
Subject: [PATCH v5 3/7] module: populate kflagstab in modpost
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

This patch adds the ability to create entries for kernel symbol flag
bitsets in kflagstab. Modpost populates only the GPL-only flag for now.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
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
2.53.0.1018.g2bb0e51243-goog

