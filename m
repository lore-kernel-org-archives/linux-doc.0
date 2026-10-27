Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082994;
	b=26mpakVwQBdLUeszJkoZi16afVBFU29XUcmD8yxPfKdECCZVtNFzf0o+376jzttYoCQz
	 leyMVgg1ucgoc4gKQFZQo5UEwVYb8phFZfyx+Ew2jjdwYlDCq0hrFI5r5ucV0d2JHvbrh
	 5tFxrTNAiWNIAqxE5in7L9q+wNP63+ENUnHElb+GtxqJIdsKeRqMLRr5BXwJSf8PLAENb
	 t4WTmE8RhNK708B6Ebe524QXVFGeEdMF9VMLQkZlKZk8coUuplT5YK3Jr6y2XBb0fPXKM
	 m/1cCHZiQjAqHo9UU+QHNicGm6mXE/M9sEPEKq8HnUOFsgudtrxYElJ3jwRax65Nq/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
	b=Q4/BmHKJshwyQvvkyXhBcvq9GIktPViwHv5VsfDNmsvakL+++S/HyvGc9TBu6HrDHktc
	 lwxEZ/7kFCad/13Vj+uLeVZHVyLuChMTBrPalwVeLX0dyRIDz6bq4m13UMyzmqbj3U5DQ
	 oqPRO+oGgDvWvgX7V+zLcy3Ydyj4d+wKPbOarX5Zru46Vwsy7LaNXRsjeajsXqAxqM4Mm
	 s1kiN+eqeppWtOaVJ3vIyphmAdIquzV2OhXZaFXt3LqPTwsScPFq4oROGRhaEX5FteEtq
	 RK7IY39y8gSSntHhIzU62JT6PXFwV1g//CrtjrLakVwf+nr05R5rJ22cRXkjZUHTDxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF4F606A31E
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:36:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECF4F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=CSpdWQ5s
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso1354751a12.2
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082993; x=1793687793; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=CSpdWQ5sW1tM9TEYi7fzC1hlNCiQyd5Sxmr/vYfmVU2KSb+XVcPTsiehoQ5jknIMuF
         JTP6RgKoJAV/cshortkM393JqA4eFHgzst3osKjj6xSzVB93VoeGsdI/7zR6ZwdlpbNv
         ccNchm+EY8fwa76i84kMtlSxGKBXE2C6bXW24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082993; x=1793687793;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dYFbbcr2uYZUTl7G/v0LoaX9lneqHtmhHpczJAH5sbg=;
        b=A0jys/suKDIC51aTQndWIYBxSKSwAr6OuCaBZLl6rQAkLJIvpw+Y09mM336buDMw0+
         RHfz5cJj3FaAxTFe/0N4zXsS6pSM2z4+LO6ndwvkhGmcR1IrprEvZWsKu6C3zY4v0iWP
         u6o5SIwonYPYTuwO8+PPzVflroBYVEfxH7FKIvpqowD4FOW54IASfXDXzkoemXggz2dR
         +QCA798rgfJ6qiiUedKOcFX6447wkMjkFqDfl9Wq0xv/ihKTin4lGiij7EYXRJJGEskQ
         MQviG1IL5hDm3QULkjWRoEaFVT36VT8g8H4pifCBzwrtdAWSF2lcKPCesikHP2XItHPL
         hxsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLghnXooGcjz0eTPgrmdOV3sMLRzVxYhTiRX0VjIEkvkuLUwtBiDfoW9DpWxAu0dk5ddt+qfuQwIg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLC/YmAdHmGhqqIos/PvLVbXwXCPJukuVVl2is9HDuH//dnEK75
	b8gYZEd/+VaLgCKtd5yJDZQsh7Ds4Jlc2MaeFLiUtaXw7gfBVHcMTBK6MyN6F/ojmbM=
X-Gm-Gg: AYBFou0cFBMZg7XfpGTwYO2mpXpDXdBAPhueJMrGHYotd5//x6ewAxzsGsqUK/JBz4e
	zW6Rp+LzEPQETzLWn54kwgOJYGBSqcVyGvXyFajs1kZY6Xvk8mVTjnIcbwq0sFBBLNveOdNAsZe
	nU/0CIE7VwthvcX854wgDUGPDATxoYvVgP8V3ZOy7XLK4NWbEJakogHGN+wV4YGrhlk7yzaV/5I
	/U6FQsozBTdcI+DcOdnCc1p0tjuXJrkZvChdqCTuMBeyNKaN1q7jY+HjzlEl0CdX43ReN7TSTLG
	V0NxdXF33jPCmBc/O2EafD3oyvqzKk2OYuCmiI4QUsxrUgfHv0oq/SfuI1tBZlL6SS73hJsSuWE
	vE3/6ftd8G8ZuvXkCVedU84YXqdgvjk7jUKaKPL2j5Y1tg4XyCk1iaKyhd3gwokOjfgJ5ix/Sx3
	NjUNfQQZAih/b4qYUFIS+WhXspnhrkey8aAbAjeBsj1Pwu1aZULjXiz4UM2TdfL7RUNZ2Dj2lxv
	kP5H5kcJtvIXz0NhDzjJFM4QrBm1LELu3H3yti0/X2Ijxoll8Cwz9yCg3CZJFoXC5dvuRVKO8mg
	gXwIK9Pl+pDtg0wGu7cwLzBmnc541RxQig2XsRc8XxKEU0Zv9XuwLTgO/K2wvu/5KsJ/oWi7eT+
	SNWsHJGYvurridN2pRwxGcJY=
X-Received: by 2002:a17:90b:3ec2:b0:3a8:1a1a:7895 with SMTP id 98e67ed59e1d1-3adeae6d30bmr6210081a91.18.1793082993200;
        Mon, 26 Oct 2026 23:36:33 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40456f65sm2331529a91.13.2026.10.26.23.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:32 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:28 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 3/3] lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler
 stack end check
Message-ID: <7c4627a57202b505bc03837680f6b43c2683bc07.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

There's no existing test for this, so let's add one.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 drivers/misc/lkdtm/bugs.c               | 21 +++++++++++++++++++++
 tools/testing/selftests/lkdtm/tests.txt |  1 +
 2 files changed, 22 insertions(+)

diff --git a/drivers/misc/lkdtm/bugs.c b/drivers/misc/lkdtm/bugs.c
index 3eca2ef64aff..929a60db00d6 100644
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
 
@@ -854,6 +874,7 @@ static struct crashtype crashtypes[] = {
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
2.54.0

