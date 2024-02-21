Received: from mail-yw1-f201.google.com (mail-yw1-f201.google.com [209.85.128.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149A413B296
	for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 19:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544495; cv=none; b=cmCWk9PdV0e+8BxYimlxPRgSZ5hr9aMyJMKupxCkrexEK9XIpV+4OMo9a/mX/teGk0ypYZBUo6HViRn0EvHBakVu/8scRhh1LuKiTvMuuOt953cMYIf9q90sncgMpdlI1IzOF6hSKGM2G5msC0uSvRH572vhSeP54ioq9WbLBAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544495; c=relaxed/simple;
	bh=V79ceBwKz2YCfA8gxo6SKRHzpt3BUXzSbfgGLHuE1lE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uPDVMmBCbuke1q21h2TTSSqA1kTtRubm4qor9Ej9ZhMK4zDHBVHN0XdGqD6cRyPcAZtsnxKyAiznnj3ohuEgF4Iy83KHDvJHqL8ACMA2OQyiGs0iJDNQQi6s0MbDyeMY/CQKT2KA0slciPEX2FnZJn32c1Keytj/+sKG9w6vW+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g3tJ4svK; arc=none smtp.client-ip=209.85.128.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g3tJ4svK"
Received: by mail-yw1-f201.google.com with SMTP id 00721157ae682-608749ea095so2232717b3.0
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 11:41:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1708544491; x=1709149291; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GoE6bGSaoBD7i3pA8lR/Run1pysn6CP5hI9CoxzKmn4=;
        b=g3tJ4svKRkruRydasV1YYH+fielfjBLg86kHjY7DU5Hf9oDEzsdO6hP93n3q3QWZ7L
         czpgd9Fj1eLnc5y7qgBaT4cmOWb6h6VN/ArUYRE3T7ziqGTdp573ZX1yujVOx7GaCLKz
         EeofaPOD3DxqcghC7r9lHrMK+DVa4MmoV6KnSwDpSMeG4w+wL+eeuzuRzkrtrtyv7sOo
         YiXIvf3RIOm25J1Y0sO+87l0aSe27ukv4uDMKP/EJuiRvnSPQLDTuGD9WTX/yuP2jukq
         Qjx8E55GUUGCX8fh/68K4InzY0q/3c1gMdVcjVQPFr64mX8PNUNi3WzTV/DDeMPV+q4m
         70wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544491; x=1709149291;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GoE6bGSaoBD7i3pA8lR/Run1pysn6CP5hI9CoxzKmn4=;
        b=rzEa4slW5pkrUqH+NdJaiILP939TepHdbA9Qok1sraF0v+opCbvkDDYg+l3rt6GJFQ
         cAWjsu4A0ey2S+jIIb4E1RRuWGcToU2aDapW6m0FW7IlMrzqeq2Tl/fKsCE8WPNeZMsZ
         KjnDUB4Pg8L5yGcaZLLKaf594k5MJ5Y0lnqc1ZGcptlLc1QVQ2/aAcrLN2/DzWsOq6tw
         7bex8JdEjBcTLwxEAZZRGDDakovxt1XxMdAf45cDxJTnhSuBBG64bBs/fv0dWMZ9qwhj
         AZQu8LzOKFwYtBYOXUPzNoEXN2yRyFTVh2Ud/2/fYB6ZkCh/vk1EXZBGxSYPHV1uAkK0
         jy+w==
X-Forwarded-Encrypted: i=1; AJvYcCVY4flD3uCAlQEoku2Jiq1Urz3AUX+09g8tbk1pc1CblKXoS+SEu4y4ZvbxIIwkm6d8lre+T0RfugA6BSLL03/1KJvmY/IPqiZH
X-Gm-Message-State: AOJu0YxEQrtaGi1CCiS2q2JcI3rQhTAv/kqEeB1mgJcGvD/2Okq74Rvw
	NCJyaJi4DIfkYCjO4AVbgr/5pJ+Fuz1qIk9BwlFuBvBWin9WHdT69BVG3I1oL6ejkhU15UtemFQ
	Pfg==
X-Google-Smtp-Source: AGHT+IG2dizM99WzNXjXCm4NRVCQCOVTKSh+Pv+zsrsy5Io1Fqept1ZOsQ0OERnmDAPF2nVohKm6aRgWd5Q=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:201:953b:9a4e:1e10:3f07])
 (user=surenb job=sendgmr) by 2002:a05:690c:fce:b0:608:7c19:c009 with SMTP id
 dg14-20020a05690c0fce00b006087c19c009mr105006ywb.0.1708544491160; Wed, 21 Feb
 2024 11:41:31 -0800 (PST)
Date: Wed, 21 Feb 2024 11:40:29 -0800
In-Reply-To: <20240221194052.927623-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com>
X-Mailer: git-send-email 2.44.0.rc0.258.g7320e95886-goog
Message-ID: <20240221194052.927623-17-surenb@google.com>
Subject: [PATCH v4 16/36] mm: percpu: increase PERCPU_MODULE_RESERVE to
 accommodate allocation tags
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: kent.overstreet@linux.dev, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, surenb@google.com, 
	kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

As each allocation tag generates a per-cpu variable, more space is required
to store them. Increase PERCPU_MODULE_RESERVE to provide enough area. A
better long-term solution would be to allocate this memory dynamically.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Tejun Heo <tj@kernel.org>
---
 include/linux/percpu.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/percpu.h b/include/linux/percpu.h
index 8c677f185901..62b5eb45bd89 100644
--- a/include/linux/percpu.h
+++ b/include/linux/percpu.h
@@ -14,7 +14,11 @@
 
 /* enough to cover all DEFINE_PER_CPUs in modules */
 #ifdef CONFIG_MODULES
+#ifdef CONFIG_MEM_ALLOC_PROFILING
+#define PERCPU_MODULE_RESERVE		(8 << 12)
+#else
 #define PERCPU_MODULE_RESERVE		(8 << 10)
+#endif
 #else
 #define PERCPU_MODULE_RESERVE		0
 #endif
-- 
2.44.0.rc0.258.g7320e95886-goog

