Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E418813DDA4
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 23:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711494900; cv=none; b=AmXl6PbT6vuSWbz13mcHT2WsHoJu5qhssqDO+zNe0lkn4YTnFXLBn/mgbEqWYdNyyAgPfTyzLYNebZY9CNG+UI2rsw3TZzOHRR3t7aTZYbJnlXhN9MuCg0Z3cmPQT8aUvynU6ro0FExLiBTSLOQ/k7RSF04Iui554FVmkQ6BAuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711494900; c=relaxed/simple;
	bh=NzgIE1Rh/KOBzAQ73H3jelY8pZu994zjvj10N12XaqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sk+eCMulz4HXwp3ANjW8uA5PpzBYckMZ19kgcJ0EG6Q1NktuXARnskv1gmQSaOdweeQRbySkJT/zzNrSyfzGRcQu/Aq/nUmcspcfIwJCu/GoCY+z3gGOPflwrYn0rubaqYBzWTiFg+EZMM24zXI89E3QhhzO6EMGgIFRoWGKxzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UY2wN5Jq; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UY2wN5Jq"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so7706466276.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 16:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711494898; x=1712099698; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=c2odR+gvA8sNOrt3e0IxQU+kOy08wVxcx+crcuSd5WY=;
        b=UY2wN5JqrC2yw8HwpS80Y4xVE6Il1n9pAhSFKhWuTIwkA340KTr6+kIs7vTKNAKvr/
         ZvfblRcqFmzGsTkjdxHc22p7Vcbpvf/ubbPYYLtlQQVyoGeoPFi5WjCCR42vImekVjnp
         rEM3QI174Zzqt3IYLZhqRH9OPeXzKxBZfwJL5HfuXslopQJInrDdJZiH4eLp4Piib1Ne
         TcbTRZJdpVur081KoaV43X/f0K8jN9F1Jm/jBjeKmHsUtIZronM+bAd1XXg5WbaSNBP9
         D2y4+tL3Be2MUUWdP8SGYHa41PgaDcLgowoVMXTL5rLRfuTEaxPj0ArVT5I9dinVyVJj
         tWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711494898; x=1712099698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c2odR+gvA8sNOrt3e0IxQU+kOy08wVxcx+crcuSd5WY=;
        b=F+g7m6lbaHIA1aNwQkiJE+YqbJj//fTuje5Z1H3gD0nMbdva9Jr+rqJGGaOq/w5Wmv
         teO4kfCyJmW+FU7CpEWnevxBMbzuzhwLv2geh2ESp4SZALjAsSE35CypB/jsfr10S2h0
         vVio/IccSfwa2RQOfxOz2WZObqXFx75BNi2ZCunHXIr9Aml8pT3CcVhZyATz3QG+v2bO
         fjsZxB9SI9/LNdG75GkMrhz+bJKd+35wpcnartgaHOS2284NFFfHqkRVXwxwEe3x7JKl
         rgqi8kNhlvOQsD5HxbQeZQyXlykrzHcJvp+3kj1KyauuwwnVsqgTy0oz5NnMolgEoyyP
         YbQw==
X-Forwarded-Encrypted: i=1; AJvYcCXYySFyUWNxYi0AAPZ5STEkQbUlrOsumPXuPgVTj5CRUTOULH9cPD0IJJRUNtIRmn6WeLQgkFLt26oC22k4FYYp21UIHXiqYFeE
X-Gm-Message-State: AOJu0YywCujeRwpK2bmudMtWz/r8ZbNeAvbYYMlv/n1t/44KukGbkSrU
	D3s03CYUZgOUylPaZURHYsS6B9dkhCKNiPVMveD8aftbjnhSV3x0a1OxKuOQYqbaypHExcY1B1C
	YKQ==
X-Google-Smtp-Source: AGHT+IFHYkY4cIWeIG5C7L3cVtTLvopmfj6ciQBc+eUr6sGVUl9PkI+oKLP5GmybkNhRmxFsc0JGuY8yjgo=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:cef2:761:ad8:ed9a])
 (user=surenb job=sendgmr) by 2002:a05:6902:150a:b0:dc7:82ba:ba6e with SMTP id
 q10-20020a056902150a00b00dc782baba6emr629440ybu.7.1711494898139; Tue, 26 Mar
 2024 16:14:58 -0700 (PDT)
Date: Tue, 26 Mar 2024 16:14:47 -0700
In-Reply-To: <20240326231453.1206227-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240326231453.1206227-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240326231453.1206227-2-surenb@google.com>
Subject: [PATCH 1/6] Documentation: rhashtable: undo _noprof additions in the documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

With kernel-doc script change to handle xyz_noprof() names, the previous
documentation changes and not needed anymore.

Fixes: 11c91be0e244 ("rhashtable: plumb through alloc tag")
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
---
 lib/rhashtable.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/rhashtable.c b/lib/rhashtable.c
index 35d841cf2b43..dbbed19f8fff 100644
--- a/lib/rhashtable.c
+++ b/lib/rhashtable.c
@@ -979,7 +979,7 @@ static u32 rhashtable_jhash2(const void *key, u32 length, u32 seed)
 }
 
 /**
- * rhashtable_init_noprof - initialize a new hash table
+ * rhashtable_init - initialize a new hash table
  * @ht:		hash table to be initialized
  * @params:	configuration parameters
  *
@@ -1085,13 +1085,13 @@ int rhashtable_init_noprof(struct rhashtable *ht,
 EXPORT_SYMBOL_GPL(rhashtable_init_noprof);
 
 /**
- * rhltable_init_noprof - initialize a new hash list table
+ * rhltable_init - initialize a new hash list table
  * @hlt:	hash list table to be initialized
  * @params:	configuration parameters
  *
  * Initializes a new hash list table.
  *
- * See documentation for rhashtable_init_noprof.
+ * See documentation for rhashtable_init.
  */
 int rhltable_init_noprof(struct rhltable *hlt, const struct rhashtable_params *params)
 {
-- 
2.44.0.396.g6e790dbe36-goog

