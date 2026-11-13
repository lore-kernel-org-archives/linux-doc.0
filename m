Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559048;
	b=NNEonZnH0uNjd4Vpbbv/8UZnmQpUWYhfC+6GCbQroXXErMDKY9uT/l3e37bxrDuHeGyf
	 3Oxl+0jbTE2pEdwz8r2K4vVeC49cVEmMb9z8Thx0zsSfFitTl0UtWmU2Ug+klFBPuNeqR
	 56xbgGww5H6aGDdS62wRr7hSfPsTzVeB0EJAwgkTKrf0jD9aoiV9FZ7Oz3YZXrAj9/Hk9
	 +pZnbMBocikmEL3EVUFPYhKR2SZJgTgogAO/jCtXl7EthhtuMMcwgXWSU7HDGyi78LP9j
	 z1Pgvoxu/YHyM0hq+4Mtr/lZwBRf9KNSD/THVEBOfLRYMkV8f+xj5fMuAAQ8UJJjIrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:In-Reply-To:References:From:Subject:To:Cc:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
	b=tYPLRYjuEf/jacU9K3i5cUBzyZ6OSLWL0vekOs7Gyi1LK0p5zBNzmwaw8ACEokLqxAJd
	 dqmvkaGWYxv63mHIzYbnElgpZcnn87zTcqmVudbhZsyxWXSsrQ6/5yMWYj3SNnb4eT3ry
	 /0wVVk1Ck5AYsuctxB7TNZQcqzmxiuBBDo8DVuJa7zjgr4S02wpsahZQfmYa+SMLYtE4G
	 ld1CYwEUFADfr1eRdBoLYneSD1GmFEnfpS80cu0aV5SXhxb4YY1euBVMNVtNHE9iyQj4E
	 5rLDFF2H8rb7qy41Y3vFJX2Ue+d2CXtH3rAsqEK0x24D6eQlpGAxot6uGy0th98a42A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADC1E60A381F
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADC1E60A381F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=SgCe+KSs
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ed06b725fdso12684285ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559047; x=1795163847; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=SgCe+KSsRyjkOzf4OHsVlb3Hf9FWal04KpQVs268s1oTe1DFawntXydtZWS/qEKPBg
         IDuVfMnscTgBMqG0b3Wb9hVl35YjiXJtE7qxIdgZyfRnVDtmTiT1MI6nTVvsL6JVv2II
         aACYWV0ZTLjMgpNYMolodetslbD/vKtmC9+lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559047; x=1795163847;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:references:in-reply-to:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+eCsDnbhPqUbpA9xaS6S0ip6SewmaxOg+pnShqolIyw=;
        b=fsfJzmb5+d5CNk4ynW4tPSnYSzLUMLNKbpcig0UUJS2jc2T8N3eDXUKpLvUFNW+xrM
         Gi8lU8fB9r0Q2ifotQ3fUU5ytFEeIeXDOMaBvGabPqsPi2xzf1aoLmKq+ZYVA0sEt5YK
         567QGQ7QGlDTZnpSKSg48+GsgDRlN9NgkjLFAaGpsqrwCyk0nawhBXLT981emoPsq18S
         3hFseogfNoknJA2QO/dhLzMJXqFU+yYBMm8tEEpJUqeAj68lVLp4jaPM5asSr3+Gk9/q
         kMQO4EYEWxhEaaQL7CTCd2CV0u/IgdOtcXaOiv7lqDne2U+Xg9b3IeSbrtYCt+P+ixvy
         WD7Q==
X-Forwarded-Encrypted: i=1; AL+hErGAYedvjyDR6YBS7aK0mk5ugCFNndzVQWr/U70p2oZSPg080pBB1nun6vCpzCd9dbSKvkau/w8oL1M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/HK1/Q+rzJzSuJZEMi1NAhnfBl8POPwbObdHU+rxp+u0FmIl2M
	QSez4diuV+/654CN3mzmOwY4Gmy23V5iyVLm+XgShogY2mFaFsJZll7qt847gwWeuhs=
X-Gm-Gg: AYBFou0UTkA9SI3df4+uccPlgXrXVbUIdv/CTAt4rZBEOwnLV9F3AxxgtDkKHw6KAbK
	1xQLJemZ7OMGsGBjXjb6/hCuaanbxBIL6zJqxwWXe5NzfpvNLdOVgGZOOoxfcQghedZnWkGq19v
	14cBrBY3UmK3KjJ+Dlv8hRgSE5ivUekjtLh8jTdJ4vP0rVVRmgm8DEwyb5yWT9bN/gydnZiii3A
	U//xcOYs9M9oLy1CgileGTYEowvly4tpptD+9zlP184hatqTTuOzKULLXBbxx/z3l2TAx8fBdG7
	pS5E1hGFblkfHpwPwZx17JotAk0y0xlt4k0mWGqLmZzVAW/EVwLxz3IhklsIQj4oRiV0gmml62t
	3W+q8zdnd5vxO+JJ3oXJ/TdCl/chZKX9H0vbxDg0qpAC6SDcuP6HEZppPSTLaEYnslVpM4NlxmS
	HfAgXZH9AzaqBG76ZUHyfgMsoPazkFgHrKHhQt6h5UGHw4pe45zqYJPrf9yPLJ508avT4RFGz6G
	G72NP4ovJ0JZTMfTIKBkC51E45PZFwLJJvFVEEEBRmfr0eg55O8wV7cFhF9kLCCUdiIU0By9w5B
	kFB5qMes2CgBnqm7H7H2OeOJwUo7sGwWK9ZrXsnt0bgnJ+ZopN2DHUV6NYHnwYKx1UodrY+aEFa
	JZGjRaTLd+F/GC28oCdtDFJFnEHQTUABJgqIn6ye3o8NAaoaE8zTZpTF2/nKRmnFY26biy0UmJE
	CznR+jhsTtRGS8SSGsDnH+gC9s9oIfkA94qypDHul6OiGSWyKsxdUaphCVb/wo
X-Received: by 2002:a17:903:9cc:b0:2e8:3b2d:c0e1 with SMTP id d9443c01a7336-2edf224a995mr38643685ad.41.1794559047053;
        Fri, 13 Nov 2026 00:37:27 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f7e48e2sm6802375ad.36.2026.11.13.00.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:26 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:24 -0800
Message-ID: <a8bc6ee26d1cf35df5b0a13e971d3726a1a51042.1794554867.git.chris@chrisdown.name>
In-Reply-To: <cover.1794554867.git.chris@chrisdown.name>
References: <cover.1794554867.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the
 scheduler stack end check
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

There's no existing test for the stack end check in schedule(), so add
one.

CORRUPT_STACK_END overwrites the magic at the end of the current task's
stack and then calls schedule(). That should panic when the check is
enabled. When it isn't, the test restores the magic and uses
pr_expected_config_param() to say whether that was expected.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 2761685cf4f8..a39cde7495d3 100644
--- a/drivers/misc/lkdtm/bugs.c
+++ b/drivers/misc/lkdtm/bugs.c
@@ -215,6 +215,26 @@ static noinline void lkdtm_CORRUPT_STACK_STRONG(void)
 	__lkdtm_CORRUPT_STACK((void *)&data);
 }
 
+static void lkdtm_CORRUPT_STACK_END(void)
+{
+	unsigned long *stack_end = end_of_stack(current);
+
+	if (READ_ONCE(*stack_end) != STACK_END_MAGIC) {
+		pr_err("FAIL: stack end magic is already corrupted\n");
+		return;
+	}
+
+	pr_info("Corrupting stack end magic and calling schedule() ...\n");
+	WRITE_ONCE(*stack_end, ~STACK_END_MAGIC);
+	schedule_timeout_uninterruptible(1);
+
+	/* Still alive, so let's restore the magic so nothing else trips over it. */
+	WRITE_ONCE(*stack_end, STACK_END_MAGIC);
+	pr_err("FAIL: corrupted stack end was not detected by the scheduler\n");
+	pr_expected_config_param(CONFIG_SCHED_STACK_END_CHECK,
+				 "sched_stack_end_check");
+}
+
 static pid_t stack_pid;
 static unsigned long stack_addr;
 
@@ -885,6 +905,7 @@ static struct crashtype crashtypes[] = {
 	CRASHTYPE(EXHAUST_STACK),
 	CRASHTYPE(CORRUPT_STACK),
 	CRASHTYPE(CORRUPT_STACK_STRONG),
+	CRASHTYPE(CORRUPT_STACK_END),
 	CRASHTYPE(REPORT_STACK),
 	CRASHTYPE(REPORT_STACK_CANARY),
 	CRASHTYPE(UNALIGNED_LOAD_STORE_WRITE),
diff --git a/tools/testing/selftests/lkdtm/tests.txt b/tools/testing/selftests/lkdtm/tests.txt
index bec57a02913a..2d856ed77a64 100644
--- a/tools/testing/selftests/lkdtm/tests.txt
+++ b/tools/testing/selftests/lkdtm/tests.txt
@@ -10,6 +10,7 @@ EXCEPTION
 #EXHAUST_STACK Corrupts memory on failure
 #CORRUPT_STACK Crashes entire system on success
 #CORRUPT_STACK_STRONG Crashes entire system on success
+#CORRUPT_STACK_END Crashes entire system on success
 ARRAY_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 FAM_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
 PTR_BOUNDS call trace:|UBSAN: array-index-out-of-bounds
-- 
2.56.1

