Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158305;
	b=fm68S6iEh7nMi9hZfSktZmuM4IapbDscGKdwE7/aek2Im4yXvdvDpdoqny1bo9qKbeh4
	 xzAtJfOcHYI8KbOkB7Pu2mlceEJ/EGd5hJS7uWAwP+9jIEkklFseSHNAPCAW62Pf5gD9O
	 OAc3s8GdpqYwCsJWsnLyXtH3UTxxO+03H+7P116X83AgLhujtvk3yo33nMRlzDBTrkYYV
	 TbUTpUH+4kRvbFNWQO9p1lFDNwIaB7pfNxFwnnqhYg3ODZodz3Hgp82COQA75UChzW3DX
	 y6LOEbFCDvBMs7NCKZIYDPbi2rlR9Kqv9UFdD4kokDuGRzy3nYJ3xMvqZ/RI1hDB06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158305;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
	b=qP1HY/7hJP1CKmnfi7zU60On9+62NSQysA3ihm+Gsbsls3OkmQzX6qFEbY9s1iDk11fg
	 yV3V7EBDG6qBxF0bWUcQmIGUZyzDG90DyokT0DvHgPwGBgqxYPzfd2JvVGZ9BrQw3Q8d0
	 BBR5azQto/80iM2tz2C/K9vXlzmdJ4aMasnDR2MrLlli362qUuWaDYHtXJu0gHLIEErAs
	 IfF/iW5p4irgmDbhtH94oYSWWI2geF2HXIq2oi0Q8vUiad6WLjBJTXqDEXGw7rKoKBY8r
	 pfoJGXrjOwYVntXwTDLwQXwxoaCKmKrIbL6zxVXdzmVHdllmXOhXTA+wgX7o2yqpf/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ism9fz3i;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA60606A322
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:31:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA60606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ism9fz3i
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so5004735e9.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158304; x=1793763104; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=ism9fz3iddL8+FiO9jcwvJueqXy51UdSpEHoZ+RaRyPHfAv6q7SnK61TCZBa9qIT6f
         L+fzMna4qndMiioKJV4ZVWatZmEhyXc2+EmhNQHW3l6vP/I7Wo9zSf0STFjilhh9tWCi
         eLLdlj19UpxqCfQ4ax6CfVTaHnOyFzN0xnAApBKB9pf/kWmKiAmODe2Kww12drjmPg9K
         4oruhUAJoSw/kKC6em2VdQKVmH1fStmxgJzGO6JIXxsXov3UIGgyk+k9iwdLIWCDmWwB
         c43UjWt5W8pH1LCgxlOHt/79KuWbGnpbd5vUpJlXlpwdBi7Wg8jk8P4xabHqYZWdm4NX
         n9oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158304; x=1793763104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MfmoCWntxjvUsJ5jQdE0fli1C/EPjSIgsdskzAxULLU=;
        b=SxxIXFYl4KyAyQh5+hOBXY46HhFRfVOKgX5/SKa+gU5RFoQZ0ULs1756X7Y+8C8H1a
         EOx87+571RMbjsi19SB16fY9X4uik/LdZh2cBPl9k4k3Hk81SAKUkdalZGycIcYDUI72
         sAZoip2o6SpSOXpB74G/QtfNWSlrJU+3zkn2Zomgj9VwaTCY7ok9nntF/LXuD1QmnACf
         w+4eRHyK3eZyffP4ycIHgD0RHvHMyibdGez7qgEl7KeB+s3KjjJq4Un9c9THNqq69KRT
         EdPlbSB9zvjXQTzr/XSsVG/uGdgXA952PrdBe03QRkhDfKDYAtiJgJpNkyNtC1djP7ZG
         khyQ==
X-Forwarded-Encrypted: i=1; AKwUvBxa1j5JLk5ji3uq0k+u3yLk8j5/l+5kLtRTf8WSVCdYMwPhnQHbjm+LsZoBAkXb3hggWIrPEY321pk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtuvLBeczcH8Z9DvQBPza48MeYAWwbo/TomrK4rRUUEC6vlGgt
	NYTP4wtLiZsA981r80oLNFAz8NaSshqMCdklDTkZHhC8WmCXUgfnRB1B
X-Gm-Gg: AYBFou0ijxpe3EyNkRS52ZhC1gifs7mg4IeTW6/ACBWY6/bObX/n2CY2oAeBCIa+FVN
	zWnE/REO/OVk5/7or3ux/twjG84N8rSWvhOT6wKX+6NFY5fWsQbQIHUt9g3XzuIp32O3Y45TYvT
	GlLgHHAmAElc/uLwQAKqUr3MskTfCDAojkVzrvUB+aSAU8GgTxV1tFbRwKrngAzdQ/dGkM8hp8T
	EVrHOHQ1rt/9thZw5KaIlOERHAcfZwAJxQCfFziPEu9QVbCdwtqHXqy8oMeu3/tQMmPRAeOvmp0
	FX5Xv+qjqJmcRWdWxaio9s7682zaqG7/rOijCm/HcZGTfUisWk4F5qnwuco4bAzZkYDUMTWG8Za
	6w4RslOfYMGe34qlNfzVoc2jb+wD5fbxNEN0hfJWN+hy1sTPf6vdgB/SMB2tTf6O5OBTrxQwn9z
	Cn+gwTkeOgz7612i5yRgFy/jE0XOY+ccjMzeeFFjIJuu7EvZufltx4jqROrhUS7ccumjSzCNHqk
	7gNfp+4n7+GxeF88p+UqfrsLXkXLcBvq2swlE6cZ4caMQod3Bg6RJMtP6UVY1tPOdhca7M5VthT
	5B+d4+gMmhqHxSeO3TjNBT5Rr33ufGlvZJklV+ZGbgwfTbR00RXuZMwKPDqXIXGp6bFmw1Bjnlm
	RDKayGmSvu2E4Eg8CC73KsQN5c0RIHVHvZ1pNl/KAsEo2bE0ZVtIvlqH8NqYynm9T8HaLfd4sX8
	0UsUQ9uy9bIfg/XWbILf0EGNMH5se1msJM
X-Received: by 2002:a05:600c:6206:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4a967e8c07cmr16606825e9.34.1793158303715;
        Tue, 27 Oct 2026 20:31:43 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.31.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:31:42 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Hongyan Xia <hongyan.xia@transsion.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 01/13] arm64: Always inline raw preempt count updates
Date: Wed, 28 Oct 2026 04:31:15 +0100
Message-Id: <20261028033127.82193-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hongyan Xia <hongyan.xia@transsion.com>

Clang can outline the raw preempt count helpers from noinstr callers into
ordinary instrumentable text. Force the add and subtract operations inline
so entry code performs the count update in its own noinstr section.

This is the preempt-count hunk from Hongyan Xia's pending Kprobe noinstr
RFC. Keep it as a separate prerequisite so the early-hardirq work neither
hides nor claims that fix.

Link: https://lore.kernel.org/all/c3a90368dd6c096af9d918e036a27728696fb8a4.1786603168.git.hongyan.xia@transsion.com/
Signed-off-by: Hongyan Xia <hongyan.xia@transsion.com>
---
 arch/arm64/include/asm/preempt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/preempt.h b/arch/arm64/include/asm/preempt.h
index 75a592b7f47f7..f3a5c2cd1936d 100644
--- a/arch/arm64/include/asm/preempt.h
+++ b/arch/arm64/include/asm/preempt.h
@@ -41,14 +41,14 @@ static inline bool test_preempt_need_resched(void)
 	return !current_thread_info()->preempt.need_resched;
 }
 
-static inline void __preempt_count_add(int val)
+static __always_inline void __preempt_count_add(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc += val;
 	WRITE_ONCE(current_thread_info()->preempt.count, pc);
 }
 
-static inline void __preempt_count_sub(int val)
+static __always_inline void __preempt_count_sub(int val)
 {
 	u32 pc = READ_ONCE(current_thread_info()->preempt.count);
 	pc -= val;
-- 
2.39.5 (Apple Git-154)
