Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794030749;
	b=d41oHrHi43DYM/rxuPEyr2OHpPdY5qr+IRgzSITuNVi/VlRvPTarOCfLI3TeKAzFqwLl
	 YaPOl/CynfM9peoIqA2ZTFelxtC3eZIvAQFaXKM9mHB0skc6opo0DX5wtK558PRTMMVhW
	 zJcz6tTWWURMDie+vRUFKz14/vvqlVxaCISEjKrD4ZSI4TE4BQKsfFZO49u8Lo4T6pteT
	 31CZMsvvnUovyuXr/U3dVbLYJGVO50PhZviluYubfOitvQiy7vYDgzlB3Gqw906yWiQ4t
	 S6Lx/l+zrJJ8LRFDDg0l/YpSE1polTbvFNh4Asq5oik7i9MgUz1jCsTlnYsmtrkbLQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794030749;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
	b=igiVmqFcnaQU7mSW/V59073IdWAnukqDCyy1QDTcGK3+7m6rSUOaZrEUiS7gkemw8mCV
	 oZyTbDQTz2EWwWm5wBavmT0itf9c11b4o3hy+r+blPAoykIfSSA+ErEYiAOOXbyR+8cTg
	 KtenLxRU3b0FDWqyXQzus6dy008TKWTetZmgXkTmudblLShurDX7B2lD0oWdWx/sHS4uz
	 HG5tdHG7l0L4ujsNiOa5VZndNA8KBjw/TWTXciPIhSqtFMSIavePXQV36OggtANXhRBze
	 h8dFVEfvOIOTySYF7SviR/WP5UWX0OGGRgnxuQ+CRLaKaUhhBtAVYlJCUrSSSc8McHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Q+04sD;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF01F606A32D
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 05:52:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF01F606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d2Q+04sD
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e985106c0cso10070335ad.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 21:52:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794030748; x=1794635548; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
        b=d2Q+04sDghPVR1F3UVhddiZz7pesKLOBBSigk7Ra4fZEGOZtTB6EpIpYJ/LRXuSwoJ
         uhW/m7cISvvBspB+lR4UaBoza+8MtPrPIwYjsrUDG8GjTHXBEy9DRGQOOae4TP9hhPII
         9lgd8c8dJi7cNkPnbHRTCniZYbSY4KyhNZ7x+YEOS1qWTVeIiSshUnjcw3HvOkyZlsw1
         E4jLliOm567HpQnt8CaP51mIbc9d6X6T5HeErDsB34kW5dSQzSTTY7wklLOyqdKxXCwr
         LaSK3sAsHnFeYzN1Ew6HrqKlLZsF7hgzIf0eVRM4e2y0jYdD5p3U7g4sy/rm0xlm1exv
         EHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794030748; x=1794635548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cOkMQ7/E4scC+Fe1w2CQgNpHvbECQcUaydXqIgQCyRQ=;
        b=xwZKHTPFewcOvRmMStS4aVY5tiFoVTVQW89pdlLm+KPp1A+VzNQ2hnQntyZnpvCETo
         +hPcAjOK72IAue5NRL9TGNJx/FkrPI8sdszRiecMdYbidc7eBMXhBAex7w5jOq3RXPsX
         x4UmZI0zsIWLh7O5LdgcQP0+fbVevwgtoCQa7E2s/qCH3ZeC5IG/2tVBClWQaIZsvJnT
         /d6fHKTLVPtLDi6UY+OpaTLS2q6jMLyLvaAgrbYOmypcJcFUf6ReCPPZHBp/aUjk67UV
         kdxB1Zok+NcxixiWN9Pbnu3/Ezcy4sCjkUpDRwqGi1Net+O3Q5ktwqTpgxgWofHQrob1
         7AwA==
X-Forwarded-Encrypted: i=1; AL+hErFnnQkEvgR5I5YZyJwUXhT9r0eGEIwJujaq/FzqQRlmlU4x0iq7ScEZ+BmzTSSsCF0PIHek7mTR254=@vger.kernel.org
X-Gm-Message-State: APuU4Z+0EC0wbf+uYeVlhuI5AICqYavPjUsu9eeXzvVYPCA7A2amzRhW
	KBqgyd53CR84K/mw3cd+2grxv1RZGG2ENc54/ioo1xD5PqP3C7de41ar
X-Gm-Gg: AYBFou26/83oqha9taGfzcNsi/qNKgoH6AoHh58ELPy3bAyILO+H6nul/fPYCXZrHUA
	fG44lcCG/Yi1uFhe8OgbAPjzDbFyrDZlyDHAby5apQvlABXmI2vN464XwDdL95Y4eMdpGdBMDca
	1keqsq1n7xqbxX+8mAJfVpRzGfo3/Hc/VDI3/akTM/1A6buASs+xs/6x8dVO2ZaRP65W7y2FPaW
	dzkLssoWE1HgLrytomol2978ywy3D7qf7HyvU+5HREglMxEubYFMkGDB1MQiGClAceodvPlOOUl
	uf1ZUNzgX9xYGwyio3bKN3GRnns+sAyQgT2OWy2ZPhDa1JthAcSaCQEHRruPOhMtW9abkzSvqtk
	HcaynW2A2YjfRETAlkbvaE3tcAdndYecoapSeaUCdVOnHby/gCm9kSF6MOBWFgfxqPi06VaWBSP
	zMz6Ly0uT5bVC4GfZpnW5FI73TFKtSwMcdusouvcpPOFeWP8WS33kFvHfboK9QTAMyEzYVf3IOM
	NSYanoFAJgYlVbDnmRBti7SNLt4xwy933qpPEfU0yiDTV/Mndwu0tl8DfRr+r6GEyfMGP0dqafX
	rYJRYclhDaY8mIFjq9ULinPFuu5sXJEs5XvKaK+lPK0HMuPYxbNTgRh5M4NhBJQihOh82Q==
X-Received: by 2002:a17:902:d584:b0:2e9:776c:d52e with SMTP id d9443c01a7336-2ed41c0ab5dmr51284825ad.52.1794030747981;
        Fri, 06 Nov 2026 21:52:27 -0800 (PST)
Received: from lipengfei28-ThinkStation-P368.mioffice.cn ([2408:8607:1b00:8:a1a:7bc2:20ba:a479])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d8949fsm11189465ad.62.2026.11.06.21.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 21:52:26 -0800 (PST)
From: Li Pengfei <ljdlns1987@gmail.com>
X-Google-Original-From: Li Pengfei <lipengfei28@xiaomi.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	mark.rutland@arm.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	zhangbo56@xiaomi.com,
	lipengfei28@xiaomi.com,
	lkp@intel.com
Subject: [PATCH v8 3/5] tracing: Add stackmap statistics interface
Date: Sat,  7 Nov 2026 13:51:37 +0800
Message-Id: <20261107055139.3138633-4-lipengfei28@xiaomi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
References: <20261107055139.3138633-1-lipengfei28@xiaomi.com>
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

From: Pengfei Li <lipengfei28@xiaomi.com>

Add stack_map_stat to report the map generation, the elements used, the
stacks recorded as a cookie, and the stacks the map could not store
because the element pool or the probe limit was exhausted, so that users
can tell when the map is too small.

Assisted-by: LLM
Signed-off-by: Pengfei Li <lipengfei28@xiaomi.com>
---
 kernel/trace/trace.c          |  4 ++
 kernel/trace/trace_stackmap.c | 78 +++++++++++++++++++++++++++++++++++
 kernel/trace/trace_stackmap.h |  1 +
 3 files changed, 83 insertions(+)

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index cdae2976d224..e58e7936c867 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -2197,6 +2197,9 @@ static __init void stackmap_init_tracefs(void)
 		return;
 	}
 
+	trace_create_file("stack_map_stat", TRACE_MODE_READ, NULL,
+			  &global_trace, &ftrace_stackmap_stat_fops);
+
 	guard(mutex)(&trace_types_lock);
 	stackmap_state = STACKMAP_INIT_READY;
 	/* trace_options=stackmap on the command line */
@@ -4399,6 +4402,7 @@ static const char readme_msg[] =
 #ifdef CONFIG_FTRACE_STACKMAP
 	"  stack_map\t\t- Stacks recorded as cookies with options/stackmap\n"
 	"\t\t\t  Write '0' to reset it, 'free' to release it\n"
+	"  stack_map_stat\t- Usage of the stack map\n"
 #endif
 #ifdef CONFIG_DYNAMIC_EVENTS
 	"  dynamic_events\t\t- Create/append/remove/show the generic dynamic events\n"
diff --git a/kernel/trace/trace_stackmap.c b/kernel/trace/trace_stackmap.c
index b02eb22c76a9..5d2a406f39b9 100644
--- a/kernel/trace/trace_stackmap.c
+++ b/kernel/trace/trace_stackmap.c
@@ -42,6 +42,8 @@ struct ftrace_stackmap {
 	atomic_t		resetting;
 	u32			generation;
 	refcount_t		ref;
+	atomic_long_t __percpu	*successes;
+	atomic_long_t __percpu	*fallbacks;
 };
 
 /* Serializes tracefs readers against reset. */
@@ -73,6 +75,8 @@ static struct stackmap_elt *stackmap_get_elt(struct ftrace_stackmap *smap)
 
 static void ftrace_stackmap_destroy(struct ftrace_stackmap *smap)
 {
+	free_percpu(smap->fallbacks);
+	free_percpu(smap->successes);
 	vfree(smap->elts);
 	vfree(smap->entries);
 	kfree(smap);
@@ -100,6 +104,14 @@ static struct ftrace_stackmap *ftrace_stackmap_create(void)
 	if (!smap->elts)
 		goto fail;
 
+	smap->successes = alloc_percpu(atomic_long_t);
+	if (!smap->successes)
+		goto fail;
+
+	smap->fallbacks = alloc_percpu(atomic_long_t);
+	if (!smap->fallbacks)
+		goto fail;
+
 	smap->hash_seed = get_random_u32();
 	smap->generation = stackmap_next_gen;
 	refcount_set(&smap->ref, 1);
@@ -149,6 +161,7 @@ static void stackmap_put(struct ftrace_stackmap *smap)
 static void stackmap_reset(struct trace_array *tr)
 {
 	struct ftrace_stackmap *smap = stackmap_locked(tr);
+	int cpu;
 
 	if (!smap)
 		return;
@@ -161,6 +174,10 @@ static void stackmap_reset(struct trace_array *tr)
 		memset(smap->entries, 0, sizeof(*smap->entries) * smap->map_size);
 		memset(smap->elts, 0, sizeof(*smap->elts) * smap->max_elts);
 		atomic_set(&smap->next_elt, 0);
+		for_each_possible_cpu(cpu) {
+			atomic_long_set(per_cpu_ptr(smap->successes, cpu), 0);
+			atomic_long_set(per_cpu_ptr(smap->fallbacks, cpu), 0);
+		}
 		smap->generation++;
 	}
 
@@ -194,6 +211,11 @@ static int stackmap_free(struct trace_array *tr, struct ftrace_stackmap *self)
 	return ret;
 }
 
+static void stackmap_count(atomic_long_t __percpu *counter)
+{
+	atomic_long_add_unless(this_cpu_ptr(counter), 1, LONG_MAX);
+}
+
 bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 				unsigned long *ips, unsigned int nr_entries,
 				u64 *cookie)
@@ -254,8 +276,10 @@ bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 		probes++;
 	}
 
+	stackmap_count(smap->fallbacks);
 	return false;
 found:
+	stackmap_count(smap->successes);
 	*cookie = ((u64)smap->generation << FTRACE_STACKMAP_COOKIE_GEN_SHIFT) | idx;
 	return true;
 }
@@ -415,3 +439,57 @@ const struct file_operations ftrace_stackmap_fops = {
 	.llseek		= seq_lseek,
 	.release	= stackmap_release,
 };
+
+static int stackmap_stat_show(struct seq_file *m, void *v)
+{
+	struct trace_array *tr = m->private;
+	struct ftrace_stackmap *smap;
+	u64 successes = 0, fallbacks = 0;
+	int cpu;
+
+	/* Reset and free also take trace_types_lock. */
+	guard(mutex)(&trace_types_lock);
+	smap = stackmap_locked(tr);
+	if (!smap)
+		return 0;
+
+	for_each_possible_cpu(cpu) {
+		successes += atomic_long_read(per_cpu_ptr(smap->successes, cpu));
+		fallbacks += atomic_long_read(per_cpu_ptr(smap->fallbacks, cpu));
+	}
+
+	seq_printf(m, "generation: %u\n", smap->generation);
+	seq_printf(m, "entries: %d\n", atomic_read(&smap->next_elt));
+	seq_printf(m, "capacity: %u\n", smap->max_elts);
+	seq_printf(m, "successes: %llu\n", successes);
+	seq_printf(m, "fallbacks: %llu\n", fallbacks);
+	return 0;
+}
+
+static int stackmap_stat_open(struct inode *inode, struct file *file)
+{
+	struct trace_array *tr = inode->i_private;
+	int ret;
+
+	ret = tracing_check_open_get_tr(tr);
+	if (ret)
+		return ret;
+
+	ret = single_open(file, stackmap_stat_show, tr);
+	if (ret)
+		trace_array_put(tr);
+	return ret;
+}
+
+static int stackmap_stat_release(struct inode *inode, struct file *file)
+{
+	trace_array_put(inode->i_private);
+	return single_release(inode, file);
+}
+
+const struct file_operations ftrace_stackmap_stat_fops = {
+	.open		= stackmap_stat_open,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= stackmap_stat_release,
+};
diff --git a/kernel/trace/trace_stackmap.h b/kernel/trace/trace_stackmap.h
index 6699988da390..a18e41c08494 100644
--- a/kernel/trace/trace_stackmap.h
+++ b/kernel/trace/trace_stackmap.h
@@ -18,5 +18,6 @@ bool ftrace_stackmap_get_cookie(struct ftrace_stackmap *smap,
 				u64 *cookie);
 
 extern const struct file_operations ftrace_stackmap_fops;
+extern const struct file_operations ftrace_stackmap_stat_fops;
 
 #endif /* _TRACE_STACKMAP_H */
-- 
2.34.1

