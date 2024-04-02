Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC09715AACD
	for <linux-doc@vger.kernel.org>; Tue,  2 Apr 2024 18:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712081321; cv=none; b=FEP1AE/itYLCliX7Lm2h72FrGPefxiMVr1CQSI0o3YYE8DjidlAXCgV9tEp4MhzJSNhjncoy69iJdhfHaqg17d7foqwswMZahJhsrGtr/PRJ++MGcYKZBclYJjfXjslj9SIZtC/VLjrtFNhuUL+btEovOVqjgFbyl0vfnklI/8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712081321; c=relaxed/simple;
	bh=6lI9VNiSXumgy0lIFnQbruvwbZ1Z01+DeNNrabaoY50=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=dR0hNAHzvDABtKlAKV+OLq5G/yiLw4jhsRV3od4MTEd+xCajSpghJMxb6bAJwvLoPWm98Q7Ff4dR4wHMy72g0R9N0j6NnOmKwUDsk41mOIQUBYeN5tgRHlwW8C8iIb9QrVoTRm7LBbKVnqVZkCCh3BuNumUZnIJX/HoAzc9nkxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=amBSn08b; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="amBSn08b"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-6144de213f3so71751207b3.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Apr 2024 11:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712081319; x=1712686119; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DgQmUs6HhPB39/8zfW/Zv0dW3hKDHFfzMOS/PR5/wFQ=;
        b=amBSn08bcELoWschEMG6TKrSRuLWI+qRMZfe74SlqgkgJv6Idzo68jDUtPR2XH4d37
         a52PIfg2miF7o4OuDCjqwjfjgr/O6LQg2EO5D0+DEhZ16XQIgXnHr6+vEIM6aR3R/OpY
         NyvV+XXzXMt4kmatp1xvPmMxhrAHcG1iU/dMElmueLDzEa/EUR1Bn3lSaeLcljbjHVdt
         A1vUkrlTP14nlC7jjygP1t7tqojCS9wFeP5AJl76r6SwDc79iYS60Ifj7qjmgLtKflpS
         C5hgxT2QkXXfgm5Gbd+//eANPYsySsVz49ySj6cKM2kmlT6qplHpN0oTae0lyaW9cTbk
         k6RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712081319; x=1712686119;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DgQmUs6HhPB39/8zfW/Zv0dW3hKDHFfzMOS/PR5/wFQ=;
        b=TKfAtwkOL/VyiCpTlEv1vcdQj2+v6v2nPXcmXD4rjveeZE6Q2PwRp1Wi2/xB5zEVWW
         KovFm7IPFdoZQAXCuQKbdcWreJiMEoTC3zx9KTPhHJRtyTvPhDLY1kHNsEJyWoAPZTiP
         9P8jnbltsUWJx8ZPMekuuJW1r8YOdkHvl/TI4zs1RLWVRBWi5SjgxKlTKG52PDe7EvaO
         yu9AADkamHywX0P6HdDceEJGAjvipEYgvVWjcqKnc5MUOGNkW73qjqNPM610hqvK6njK
         iQHIixQPIsWrsxSC7duZih0m75BW0yri1shlMQXPZuY9/rYBzbiI7SdFPd2iXjwRhkmG
         cWWg==
X-Forwarded-Encrypted: i=1; AJvYcCWkRHsohf/2pRlW9zx+cjbTggohWkT6xfsKvfQ7kIG65fi8hYFs5AMUPWNSdUax23QspsVWxp1dOYTJ7gYDzFwQMO4jNQFshAEK
X-Gm-Message-State: AOJu0Yxkl3nc6Ptu/lB0hQpy7haEhHs4iysGy+4lqpLwhAW2PqT6L8lc
	SbPtXErRwSY1jr7tg49DhBCNErL2/BQC2zO7ZcpBbRYLdFs2R29/j15cJEySfJYjYHVLA7RZAFC
	faA==
X-Google-Smtp-Source: AGHT+IGGv7DZZG+G95d+JpoihdeoHeoF13q18CEnx6sVaUBqbMNIOKCbzzB4wbYOoZHrUg+qy8rHvqYGjeE=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:61fa:96f4:c395:2882])
 (user=surenb job=sendgmr) by 2002:a0d:d753:0:b0:615:1fe7:298d with SMTP id
 z80-20020a0dd753000000b006151fe7298dmr538853ywd.0.1712081318834; Tue, 02 Apr
 2024 11:08:38 -0700 (PDT)
Date: Tue,  2 Apr 2024 11:08:35 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240402180835.1661905-1-surenb@google.com>
Subject: [PATCH 1/1] mm/mempool: Documentation: add missing
 mempool_create_node documentation
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: rdunlap@infradead.org, sfr@canb.auug.org.au, kent.overstreet@linux.dev, 
	surenb@google.com, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"

mempool_create_node documentation for two of its parameters is missing.
Document those parameters.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404010132.6v0zt6oa-lkp@intel.com/
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/mempool.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/mempool.c b/mm/mempool.c
index 63d4e3778bbd..6ece63a00acf 100644
--- a/mm/mempool.c
+++ b/mm/mempool.c
@@ -256,6 +256,8 @@ EXPORT_SYMBOL(mempool_init_noprof);
  * @alloc_fn:  user-defined element-allocation function.
  * @free_fn:   user-defined element-freeing function.
  * @pool_data: optional private data available to the user-defined functions.
+ * @gfp_mask:  memory allocation flags
+ * @node_id:   numa node to allocate on
  *
  * this function creates and allocates a guaranteed size, preallocated
  * memory pool. The pool can be used from the mempool_alloc() and mempool_free()

base-commit: d4cd6840d1dc25963aa10ef5e5b1d01876baebf2
-- 
2.44.0.478.gd926399ef9-goog

