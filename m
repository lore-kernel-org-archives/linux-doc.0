Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559042;
	b=hKABCJ1C0SrgHA59UqsrlRQJI4CLs3FHZYjS1EYTwfHzpwyvw69RbnxJleg99b+SQoFi
	 R/JxhG4bubkxFc0LBcBQJN8B5WFdwgv64EF3FCTi7Fedg+KVd24TwXolTb5dOcg5KFTNP
	 hlLZOsqy8JjyT8GIpQBojf+zQuPveloJV7Z4B7+a1GER3MBIHMBGrJdEUQOz9NGJ6mpyy
	 Dj1r+WepIPzlsqZ1Q1V9CGDjLDB3VDXA7R8QU0XKPkGG6XqtSgNnCNn5I9xVQJd7ubsgI
	 5lRBJTE+q3Q2TvanNTbE5KP0q4gel0FvBefrw5EWiiOg8b6uQ6ZQbR4sk79z0aXtdVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559042;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
	b=i66u3xEDgk4TDhOHC96p3p96XGEVrFdeFBQO4neADg+BxZVXThDsMZYxI8H5JMXA5a1e
	 ZgojZsTscChHDA6unRY/5VGB6M2wZ/2h/sWeAwrxHr3novAYs+WzKNko6cRxYnYsb0cVu
	 lTrowgORrAo8aRVWM59g9bwG/B1qbnW6CBmocMDRFtmBP/JPFC8oYgwGAvDQF2Jqv5i88
	 wLbDDu7ZJuyqQpyWBkQXOPFgfDUmOevlnEV+GZQCXUT9TGPrBCiYYzBpSDTe9HiUQbte/
	 lsJgcXrhSxaxV46Ps4/n/Wz9JSNLJDBx3Gl0Iuu0jUkdNYG2xyeKgQAO1bcJ1q8lqCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73917606B1CE
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73917606B1CE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ami1KE7P
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so552352a91.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559042; x=1795163842; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=ami1KE7P5QavEDOGMp60eQrXNRJgwmjS0vs05yvlrW1EqIwdZckNLm5O1zXxO5j2nP
         F451yYIFwPl+eEzS408uV3WZLxSDOjKVtEiD7hphLYbylW4kSeGGadDd2Afkyns7ZdgU
         eaVXAs8bUQ6ydMKgNm4qbha32qqeFrsDoNXrc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559042; x=1795163842;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EwMHpSevVZJc3LGGji9zq4te1/1ENtsYUuV/5eNMPz0=;
        b=2lT9UriKrXUm2G7KLswhM0yZ1+iNa/ZFWK3g4gx1z3iTlCSTziZkwvXAQZAqfvrvBl
         +c0P5ubsRJRxyX399EPfxryPdwTdkZ2XGHImB72fEVHd80NWrhS8j3tTzv+gufu0DPLg
         psqovw2BSf0S/SqRlpLmIP00D3Lj5BrUs2iEqFmTzPsA8DyGQ6xTCqiJinGbbqWUEQ7Y
         xJnVvJxIY8F5NBzi8WZgL/ZcaAJMvPOE6f/mmk/jLvtyPyFaGro2rJV879DjIXttmQoC
         MARpSdcF19MEtWXQigUlEw5RfYsVfcWUnnGSFmeS23uD2Z2ujoxnSA5SmmcpQVhx76cA
         OKgQ==
X-Forwarded-Encrypted: i=1; AL+hErGIpVx8xBq+4Sugb1CQH6Sxxd1LcNfTLbFwAygN5O/st5gb7amrlfpRZBZhrEygWuP9svLttIiQXLY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9FPBLydEqURDTIQwXfPWA/gYYIPlbih/dm4vZun9kVAULNdGdE
	eUqtH7BMxanJfK0vwVPCDQy40avegOykvs2Tkyunwp4uUXp9tUYAKrDGsiPtuC1WA9M=
X-Gm-Gg: AYBFou2cln0xjzhWDjpoX8er7DYCXaTHHohw6u/5jLfZloW9Xs3/7OOm7O68MaZtLFh
	c7UzzvLLlgDtI6lEqxQrHqXCVlpxHjjPK+/e1nvp4a6h0pKwMXfQL5KwP3zui8DY/4/mtv2j/i3
	1aPN+L+QofoMUFP8MoQmwn28VsyX53+NFputd5fIPjXPZld/upHwaiFAwXR7BLhG4meBHklzd2+
	6O3MSnaimRU+vAQRUnTsZQMGW06J6VEu/LtqGNWrgLaSfbdsAooSpOOAy27t/WAZhXm1BlUICZ9
	VXwLrIAD+4Xf0qA9R1+yh4g/TXLdaugMvS8hphZ17odUYO+9fcfi2q3+O2XNed3jqP20IykfPaF
	1QT7Zvl9xCYYzKOQfyp/pMdVzBRuDHoElyETDf2F2dWT0eof6YEalIqj/rukH58hIx1ZtKe8q/l
	VWXSCkDiT9uru0+soy/ZYelm+Gzy0IqCBIT/98Gtx0mieprivUcCrugFyKKEe7KUlXiNRGDncY6
	pPKZsnt2idYXliXeirQRTUZVyJTbLxrD43dOa3gRbt0gyHxx0mFN0Q/JVbl6LlNN8SvTL/zIFrJ
	4qCXrjSPHbAjaLsboqRhOlEyZb6G8Q1RdHzp9E093oAWxYnFZ7MLlTDphoB+45BXq2jKQkr7e7n
	OylTx8DrGw4sbgFHF8ZkhN8QtfImwXXsZDz3ukbkpfWNWZaxNQg6yb7ST6K6IXeqQAse2HyXTzY
	R0GakW4+7RGn9Qp+iP+/NRbgqQAFznPWqnLIe9x/awF2s8m1FkQDBYxTQFUaY=
X-Received: by 2002:a17:90b:5585:b0:3b0:ae41:2711 with SMTP id 98e67ed59e1d1-3b1b0a12f15mr1404120a91.24.1794559041771;
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0fdbdsm8749569a91.10.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:21 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:18 -0800
Message-ID: <35b84656fe82fe1cff0ba3bc55ddc72dde70b089.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 1/3] scs: Skip the shadow stack end check when SCS is
 disabled
To: Peter Zijlstra <peterz@infradead.org>,
    Ingo Molnar <mingo@redhat.com>,
    Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
    Vincent Guittot <vincent.guittot@linaro.org>,
    Dietmar Eggemann <dietmar.eggemann@arm.com>,
    Steven Rostedt <rostedt@goodmis.org>,
    Ben Segall <bsegall@google.com>,
    Mel Gorman <mgorman@suse.de>,
    Valentin Schneider <vschneid@redhat.com>,
    K Prateek Nayak <kprateek.nayak@amd.com>,
    Ard Biesheuvel <ardb@kernel.org>,
    Will Deacon <will@kernel.org>,
    Sami Tolvanen <samitolvanen@google.com>,
    Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    Arnd Bergmann <arnd@arndb.de>,
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
    Paul Walmsley <pjw@kernel.org>,
    Palmer Dabbelt <palmer@dabbelt.com>,
    Albert Ou <aou@eecs.berkeley.edu>,
    Alexandre Ghiti <alex@ghiti.fr>,
    linux-arm-kernel@lists.infradead.org,
    linux-riscv@lists.infradead.org,
    linux-doc@vger.kernel.org,
    linux-kselftest@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

Make task_scs_end_corrupted() check scs_is_enabled() itself. It is a
static branch, and it folds to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 include/linux/scs.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/include/linux/scs.h b/include/linux/scs.h
index 4ab5bdc898cf..29ec2b8cf7bf 100644
--- a/include/linux/scs.h
+++ b/include/linux/scs.h
@@ -45,14 +45,6 @@ static inline unsigned long *__scs_magic(void *s)
 	return (unsigned long *)(s + SCS_SIZE) - 1;
 }
 
-static inline bool task_scs_end_corrupted(struct task_struct *tsk)
-{
-	unsigned long *magic = __scs_magic(task_scs(tsk));
-	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
-
-	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
-}
-
 DECLARE_STATIC_KEY_FALSE(dynamic_scs_enabled);
 
 static inline bool scs_is_dynamic(void)
@@ -69,6 +61,17 @@ static inline bool scs_is_enabled(void)
 	return scs_is_dynamic();
 }
 
+static inline bool task_scs_end_corrupted(struct task_struct *tsk)
+{
+	unsigned long *magic = __scs_magic(task_scs(tsk));
+	unsigned long sz = task_scs_sp(tsk) - task_scs(tsk);
+
+	if (!scs_is_enabled())
+		return false;
+
+	return sz >= SCS_SIZE - 1 || READ_ONCE_NOCHECK(*magic) != SCS_END_MAGIC;
+}
+
 #else /* CONFIG_SHADOW_CALL_STACK */
 
 static inline void *scs_alloc(int node) { return NULL; }
-- 
2.56.1

