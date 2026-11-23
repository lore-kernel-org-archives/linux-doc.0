Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477172;
	b=mh1s22aXAusB6+0XB6hYdfQ+CP/U2ZAq2LRmdjZoWLwzSxB3oR4nJOFM/pv5KTkJBnuB
	 mqgBDghZXYm/f4ZcyLYJY13x3a9VixQuB3f4CnmnyeQYh6RE0FPbh6zMQOwP/xAqmB6Vg
	 bYcgY7/1XqJh/mk9XsQyVezsOnDDCUbs9wLcMpUqVw6Q6I52CznpOniAuj/YtkqK1CHxr
	 quMRkjVbon7ay6yTc+je8NwxgsaXO+sd+JO765X+dUirBS9aIBD1UkOsNEtliyqaZorPV
	 zmvVrRVupKO9DvoFsQv8csD7bzYFV0a2c6itV5KHyqvaeH9oTWePMJhuk4cT4a3xDmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
	b=FVZF+mV24zVpWNqCV5zonkzKXM2RSfMiaaPv8tzx3sMT7b0gdKPm4QlWonT2tV+fQOUX
	 jeLHc2iH3bHkOSwwvhMdqJ6mjJGLePcjARZV3aCBWVBzbGcO1Mlp5BU+N+jE9i1Tt7gQn
	 5x7mlokHkBD2liDXwsmUem2ci9rkuTGolrweEndGBqx2bLWDenVTaWxq2cIDL5bsePEDd
	 CvPoSPEGosnEJLJ8ZprpAnpt+C/y5o+zVJD2A6tWTYzSufwjylgqZFnET4ng9xPNQ1cGj
	 22iP8PgMuWvD76O3GxAKFIUp4fpJXU+fGmlep4r5TRxDX3O7RBeAcr6qsbyYywy/mMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nl5Sf5CJ;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3344606A31E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 23:39:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3344606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Nl5Sf5CJ
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4a41f46d629so5746403b6e.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795477171; x=1796081971; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
        b=Nl5Sf5CJkUm3W9+jcd7iU6B9Cs+k4BUqPo8Wy8+bdX5qmWn6w6hnUYpzOWkGkpqu03
         iy4AI3elPN7Q93LX2/SdhiXUpzt7B+LSiLuFL7xGN0OYIuws+2K5qAUvIi7xOe5i58YY
         1hOiYCX5Tb5ghmTPkQ1PGBTmHdM6SU60uxVtr45Ol7tonZ/g5eyts6S2qm/W+8I2mkyj
         9fxXTrijZyy6nRC9f3MnGormjsekuNctZe2jU5kXqr+MitAmFcIgnNS25ow0vbcwep08
         TnWtcpCuGa9PEYsywjWSoCbEstgQCoozUXC5P7WLRx5tRH1DYqc+1OCn+6UUvJzKAHcH
         PurQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477171; x=1796081971;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NNY7sb7Lc3fUr2Yc/4c0jbyfUC5yRtKrBOqqupJLhM4=;
        b=pKEJ8vQ6SefvHc8HT25kby2qhAcA6WafWuv4X2UQpfR/7v37bQMlFAdRVHO72ojytV
         YtWyRCXpCcwnWXk2a63vvd2R9khQi1gEhYGQCGLMwi9vCQGRqZ/KnSEa/qbF7mrXJ9eG
         8x7rnn0LOM8Jy2Cn/HrGrqEScQ+OoVv+28c1txY+asWUbZoNTJK+fioQvjSgKBDXmLKe
         TTWYZ6tUzirbItAtEziin9fOw47DQCgZpJdhPjZcNzHOLV8kG80lJL2dP00miEPJbZXD
         orfZqYbIc9qCcwyUedma6oeQZ/EXl/GCiLnymhlu4btZ7w+Nidz7Nnlpd5dRddJFHl53
         22fg==
X-Forwarded-Encrypted: i=1; AL+hErFYGB1tL5/xksf+TEvKLkINQDUdnynGGmJEMaB36sStYsMXRK46HcnxJaEbWXKRHFewk5ZKeJZepTM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+KkG11m3aW5rtcEdTmP/Vb+ZkV+HCn6b8chcyJ28uws+i0+b3L
	khfb5HZ/vLPlKeCKHcQuJRQ6Fuhio04xgIfRyWNrtTpl9TRG6yaVg+/aZKpqQOfJGJr0ADqWwSc
	KMlmAfpDRNgbavA==
X-Received: from iobdo25.prod.google.com ([2002:a05:6602:4619:b0:9ca:bcca:dd8b])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:6615:b0:573:1dfa:f0cf with SMTP id 5614622812f47-57a0a404865mr13656920b6e.51.1795477170400;
 Mon, 23 Nov 2026 15:39:30 -0800 (PST)
Date: Mon, 23 Nov 2026 23:39:06 +0000
In-Reply-To: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261123233924.3970932-1-dmatlack@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261123233924.3970932-2-dmatlack@google.com>
Subject: [PATCH v5 01/18] liveupdate: Remove the list of steps from
 luo_preserve_file()'s comment
From: David Matlack <dmatlack@google.com>
To: kexec@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org
Cc: Alexander Graf <graf@amazon.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Christian Brauner <brauner@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	"Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Samiullah Khawaja <skhawaja@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
	David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

Remove the numbered list of steps from the kernel-doc comment of
luo_preserve_file(), along with the sentence that introduces it, which
repeats the first sentence of the previous paragraph.

The list only restates what the code does, and goes stale whenever the
code changes.

Suggested-by: Pratyush Yadav (Google) <pratyush@kernel.org>
Signed-off-by: David Matlack <dmatlack@google.com>
Reviewed-by: Pratyush Yadav (Google) <pratyush@kernel.org>
---
 kernel/liveupdate/luo_file.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index a39992da504f..a42b60356d52 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -214,18 +214,6 @@ static bool luo_token_is_used(struct luo_file_set *file_set, u64 token)
  * unpreserved or successfully finished in the next kernel, preventing the file
  * from being prematurely destroyed.
  *
- * This function orchestrates the first phase of preserving a file. It performs
- * the following steps:
- *
- * 1. Validates that the @token is not already in use within the file_set.
- * 2. Ensures the file_set's memory for files serialization is allocated
- *    (allocates if needed).
- * 3. Iterates through registered handlers, calling can_preserve() to find one
- *    compatible with the given @fd.
- * 4. Calls the handler's .preserve() operation, which saves the file's state
- *    and returns an opaque private data handle.
- * 5. Adds the new instance to the file_set's internal list.
- *
  * On success, LUO takes a reference to the 'struct file' and considers it
  * under its management until it is unpreserved or finished.
  *
-- 
2.56.1.809.ga0b61035b5-goog

