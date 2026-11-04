Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811542;
	b=HCCdzjmXagSMH87OHpvSD8iCpt8VZXidxfn3isec1dbSOdvDGUzA3MwmI9wKC1+iuTTe
	 JKwGodYRHDGiiYFVT0ZiXWCZOWGxLFvq+219TmI1JRG0cxltU9y7mF91g+kUqW8jN6QBj
	 CeGP3yC5juWGO6f20mDNoRB2zDjbyqDKM+gRvzlwjHVvTDahtHASR7z0sHEMB8CkjCwgR
	 xPGtannckeN2iK9QdVzOdoSZ555iUbSrG3LuddfCkwpjwXM8xVArVjhbt2pGh4MSo1iEl
	 NnGHu1v/owUER+oBXdOiDp41NOb9J+QGG0YsPxoboi4nlq48Imx/q5z1U1mlL/cAZ0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
	b=sIcXpNhqaTddbGr5Lf9dbdhwe2YkPmoxq57jxMEgqVWHI9atSjWKEQbipjRS7aS4fXJM
	 gvSjD08VXxLTkV/WBqb7wofWBRqySB+v38S/xOofoanrwZoTFG+Qng7nSZ/F/VScNNo01
	 CtPdL0MR39kYG9ZSbo81XRKGJ2tS6w0JVZq5aiROqsuAToV5+tdB/1zD6EyvJjwWVj3yc
	 FNss2yFeu7qfBnUKP+BSeCcX0V27PKvfQeVMdD3PpZ0ltbFwheFP3b0j2fj5+jzFm/VHO
	 R7jhnx7fEKF1dPY1N5MS0r6cXDCydL20faQuwl6RAxSO4E0/tmCs0J5hYbM0msM8EyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1Xedtr0;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37E606D833
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F37E606D833
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B1Xedtr0
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-36a1947498bso2160971eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811541; x=1794416341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
        b=B1Xedtr0oAKyhCbOYUUZwGHRYObZGkVPHWJPMPMIfuUC5/bUN3NqmzVBJprCraIK40
         JTEK8LzXWQZxf61F0u3tPe4Nm4TEoPGlix7kdAMdgZcySlTtfMApc8UeXuNWP9vxaSIy
         SJO49qL4KJ+8JvhK9XnGNGDQ4ei95PivKYWnLlZvAETNe7Dqh7haPhnmKzz3azpKFVHz
         33Gd8j/nAuVaQSPU10VhOczxcvpukSc/hTfVxRrAzw0DX/c7muQZppleshBl211WxxPt
         GSnHLV0jUNNHql1FgT4Qo5xw7BrVFbQ8LmYadTb7As2JnbPKk/c7h7Nh/1NSBCR9EiOB
         sHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811541; x=1794416341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Udzi7e2m5bKSaRnWhIT7TQ2xIYgHoxZdlBCHKVgs+XU=;
        b=aehCQmpAcXB1Etmt0npMa138X/WtsgENFPgeyn7cbNbdVClYQ8ZEymXffntSCoSA6W
         dn2AyyhzM1q+MAk4AwmPMjVxUbyIWXh0WQAe0yWlG+9j1cCnXrguJMvd6G5zBBqf9yAT
         aHKej4HKEXJjysWpL7uHBUc2LHlpYsNMyd57uE2hxAsZupeQF9bNKGa2bHdoa6IhIXXr
         vd9eqHrsvPbuOoH3TG/n2LtfX69GyrtLibpjbn9PjKKTuxo+9GloxBhv8JALN1Sgtth6
         y7dEE9lFAdBFJnD+dFYHotH46Yx+IX6JUy6W32I9j51r9ainLgFg5+1KBg1VcQnS2ltz
         srBw==
X-Forwarded-Encrypted: i=1; AKwUvBz+k1Bu3h6dukMKSpA03SL4Ecb3a2NuvZteL9OXRqANlF8DcCMSjH884SW8Pur1BcADf6Qx4O9uwvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ogtSggQA53/QLU0sDRKE+MfpXmmoyRpabS/ZloWR8Mzg2gm7c
	6QWEfBzdgT4vl2+JKYiTphCJyQfQM1myDyg7jFt4ueOSd88ubxAwBg7w
X-Gm-Gg: AYBFou3FrCrVFoYScpf+7rVTUfxxUX9qbbe/ZxTThYWJQukBR6whv9i/fvRjSURN0C1
	MP9MmXLLRaB0sPexKuG6NyhHHRZeQrhd5AWGlukhRFtZV7R859g4QdKlVb6i9Mei/7bgt/HfhOc
	g6GaUXMz9CTWVgpuvuhJxDAm6oPZTRIFO74Osb75qm8SE2kWwn5ik9Gh1UdxvhwadTrTP2+/tWF
	zj0hDoXOASV4b7Dp9ILm6mggGQ5XUhrJD3uPPLIjoykdDRCetwAaf4dbm52+FE9jVHRQyHgPxdu
	VQTyc8p6q7YuBn1qI62qHPVtZXJL2cDaOdveHhBvBaISQzkHHJWn5RmYxdZLksxkd5EmCG4YAb3
	8nW+Mm/nxmRarOc6FdGVVL7mmqC/QIfA5MxpsEXih5KNHfUvLNRj6dUzY1oNUzzDSDJWu5mHFA2
	DMuZRq6PVN5GmzaobIId1t4y9s9go3Lg9tCNA2qGcAexwiLAqljE91MwxNH1fbwIokC95maQYKd
	Yq99JnmxF5B+Ee6ugR01+xiZ8/J+8vnVHlkyEYiG5LMVQmp8L633uVYeAue18p5SzrOW07SGT75
	FiHI5DECoDjpSyg/JwUL4gsWe+PSXZq+twNg6YU=
X-Received: by 2002:a05:693c:8110:b0:36a:1088:fb2f with SMTP id 5a478bee46e88-36a4236d027mr26652229eec.14.1793811540869;
        Wed, 04 Nov 2026 08:59:00 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:59:00 -0800 (PST)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	boqun@kernel.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	corbet@lwn.net,
	mingo@redhat.com,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	josh@joshtriplett.org,
	urezki@gmail.com,
	dave@stgolabs.net
Cc: stern@rowland.harvard.edu,
	parri.andrea@gmail.com,
	will@kernel.org,
	dhowells@redhat.com,
	j.alglave@ucl.ac.uk,
	luc.maranget@inria.fr,
	akiyks@gmail.com,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	longman@redhat.com,
	rostedt@goodmis.org,
	qiang.zhang@linux.dev,
	kunwu.chan@gmail.com,
	brads@mainlining.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-doc@vger.kernel.org,
	rcu@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 24/28] hazptr: Add runtime sysfs controls for stall detector
Date: Thu,  5 Nov 2026 00:54:42 +0800
Message-ID: <20261104165504.2430480-25-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261104165504.2430480-1-kunwu.chan@gmail.com>
References: <20261104165504.2430480-1-kunwu.chan@gmail.com>
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

Add writable sysfs attributes that let the administrator adjust
stall-detector behaviour at runtime.

Suggested-by: Paul E. McKenney <paulmck@kernel.org>
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 kernel/hazptr.c | 62 ++++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 61 insertions(+), 1 deletion(-)

diff --git a/kernel/hazptr.c b/kernel/hazptr.c
index 7d4273a44183..66954251c332 100644
--- a/kernel/hazptr.c
+++ b/kernel/hazptr.c
@@ -423,6 +423,10 @@ static struct hazptr_scan_state hazptr_scan;
 
 /* Sysfs counters, cf. RCU's rcu_stall_count. */
 static atomic_t hazptr_stall_count = ATOMIC_INIT(0);
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static unsigned long hazptr_stall_timeout_ms = CONFIG_HAZPTR_STALL_TIMEOUT;
+static int hazptr_stall_suppress;
+#endif
 static atomic_t hazptr_drain_count = ATOMIC_INIT(0);
 
 #ifdef CONFIG_HAZPTR_DRAIN_ASSIST
@@ -1115,8 +1119,12 @@ static void hazptr_waiter_stall_report(struct hazptr_waiter *w)
 static void hazptr_waiter_stall_check(struct hazptr_waiter *w)
 {
 	unsigned long now = jiffies;
-	unsigned long timeout = msecs_to_jiffies(CONFIG_HAZPTR_STALL_TIMEOUT);
+	unsigned long timeout_ms = READ_ONCE(hazptr_stall_timeout_ms);
+	unsigned long timeout;
 	unsigned long deadline;
+	if (READ_ONCE(hazptr_stall_suppress) || !timeout_ms)
+		return;
+	timeout = msecs_to_jiffies(timeout_ms);
 	w->cycles++;
 	deadline = w->reports ? w->last_report + 2 * timeout
 			      : w->enqueue_jiffies + timeout;
@@ -1275,6 +1283,46 @@ void __init hazptr_init(void)
 }
 #ifdef CONFIG_SYSFS
 
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static ssize_t hazptr_stall_timeout_show(struct kobject *kobj,
+					  struct kobj_attribute *attr,
+					  char *page)
+{
+	return sysfs_emit(page, "%lu\n", READ_ONCE(hazptr_stall_timeout_ms));
+}
+static ssize_t hazptr_stall_timeout_store(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	unsigned long val;
+	int ret;
+	ret = kstrtoul(buf, 0, &val);
+	if (ret)
+		return ret;
+	if (val > 3600000)
+		return -EINVAL;
+	WRITE_ONCE(hazptr_stall_timeout_ms, val);
+	return count;
+}
+static ssize_t hazptr_stall_suppress_show(struct kobject *kobj,
+					   struct kobj_attribute *attr,
+					   char *page)
+{
+	return sysfs_emit(page, "%d\n", READ_ONCE(hazptr_stall_suppress));
+}
+static ssize_t hazptr_stall_suppress_store(struct kobject *kobj,
+					    struct kobj_attribute *attr,
+					    const char *buf, size_t count)
+{
+	int val, ret;
+	ret = kstrtoint(buf, 0, &val);
+	if (ret)
+		return ret;
+	WRITE_ONCE(hazptr_stall_suppress, !!val);
+	return count;
+}
+#endif /* CONFIG_HAZPTR_STALL_DETECTOR */
+
 static ssize_t hazptr_stall_count_show(struct kobject *kobj,
 					struct kobj_attribute *attr,
 					char *page)
@@ -1291,12 +1339,24 @@ static ssize_t hazptr_drain_count_show(struct kobject *kobj,
 static struct kobj_attribute hazptr_drain_count_attr =
 	__ATTR_RO(hazptr_drain_count);
 
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+static struct kobj_attribute hazptr_stall_timeout_attr =
+	__ATTR(hazptr_stall_timeout_ms, 0644,
+	       hazptr_stall_timeout_show, hazptr_stall_timeout_store);
+static struct kobj_attribute hazptr_stall_suppress_attr =
+	__ATTR(hazptr_stall_suppress, 0644,
+	       hazptr_stall_suppress_show, hazptr_stall_suppress_store);
+#endif
 static struct kobj_attribute hazptr_stall_count_attr =
 	__ATTR_RO(hazptr_stall_count);
 
 static struct attribute *hazptr_sysfs_attrs[] = {
 	&hazptr_stall_count_attr.attr,
 	&hazptr_drain_count_attr.attr,
+#ifdef CONFIG_HAZPTR_STALL_DETECTOR
+	&hazptr_stall_timeout_attr.attr,
+	&hazptr_stall_suppress_attr.attr,
+#endif
 	NULL,
 };
 
-- 
2.43.0

