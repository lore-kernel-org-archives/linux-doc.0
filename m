Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811487;
	b=s9qJh1GRWreI+32pgw/X41T5FNSqcX2WhAKM8ssHB2+ZerHHhBII0YD42vMOFBg4iB8k
	 ijPYQcdlgN8VKkqypF91KTzp472CNOff7dI68R/ZH4PD2U/r+wSfd6TMaFCIGYExHDek3
	 7a/qFkzeW11xr/0XC3sSgWZFIGKZMDwStg4pfZgspVzy3IFBGjvdEm/NOZ2grGd1nvjNe
	 Dw1+JizY7/PDh0IDh/mMI3bSNwsKWGAH4EAKwL6/7n9yPWUuCJKRaLtF6JTItU1AznJH0
	 UV8PfihjHJRnCME4Cxu3EsVNtcIJ6uJ7meK7lkbF2WSW85ROm/2RgTLPofRicThf2KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811487;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
	b=FLe7FxG/AZzSsWgcu96LwMD15vhZLKmrGe/c5+1GUyykXOiU2PQ93HINrWpOZeezMMb1
	 7tD0M5LFGOWLOjV+AXtacs92F5NCeUAOGStVQCUpxF72NP/9oYUmU8PuJsRtl5Ky9QhVh
	 0qmANz3UY8dCx6O1zruDI1rSGE5cfb69Eo+ikJ/PmxvM40v4mb9nY+UGfj3xgerQYlqXi
	 6eJBSHrvvPeI7LX8wLWIWaUbF+pcWQtzE/R6KKveWfu9YW4y5/WHxWDdV1L0eV4h1WRzl
	 Y3Cjn0yxH4/CtPLIYesSlJMAA4rhfOXSBo0wIkfxo13Lk1UwqyKS/Bcc9G3prs5qTMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF8F606A331
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BF8F606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lotFQVZd
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36cedf1bd63so973676eec.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:58:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811486; x=1794416286; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=lotFQVZdNFhgVBDY7gna/kQwMt63LK8lZz7tMqJUIb8zH+l9m73GQU6xHgD8P4ZvZr
         1OS5T920Lqtt5GrJdQI/O7A/6fmemqaErhCNIlByN/wbXf/1XFlPVuCPkBuVcHrspK7l
         h3axa2N4YUH/YCY5LW1xycCedkvGXaq+AfvA7G+sdphoY7zT9z147BkTQr5zcfQaGlLK
         txraV1kFET4Rk4EEZPaTRDD/LKciGdu0jFc1pqCztMxzKSExFygfUyHNWNADpSIHVKQA
         jg1Ytx+JWO03LhIPjRtRyt+v8z5i1u4FBwFF4KovX6GB812JLN5y62qTJhVW97+uhY6Y
         YAeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811486; x=1794416286;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MX5bYyRBv2xWDRuJgCQ6Y/+Akj3zDi4J3TbhhKtB2VQ=;
        b=24JmmlRRUp+yBxwQn5Jcav7nZFJqlB5AA1Wpnf7x62GcgsCLZesBR8OuixXwOEAjNn
         4HNPnq5WbCMc4BqfJmO7SNRI1nJYddX3NAu7JOuYVpL5rtP20CKc0pEzybD+Wu4GPdZP
         bcpjQRoS1JlUqrmupPa+jTr7gOmagQD83hc4Wgu/2980Dx8j49x0P0aAPHP5gBoHHm49
         pM4+kWC8U4IoBSd4Xqj7zCHJcqsoDLk+Yh53q3wSXk5oQQkn3GxCiILEczRWvk0rfl77
         gIen9Uv+qLx1QLNiGHOfvso07v2nOlkcttyY6Awu5G7mgxP7XFDNYCtRrPi5MR7Uigr8
         hLZg==
X-Forwarded-Encrypted: i=1; AKwUvBxPFOGEzTh0rxmf26oN62OIad30fDh43/lNtxPZJqQIpLJPZVRM9LGFQ4z+ozDbkC+iH8PryiZSX0g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p1GaucA71Gs4dwPSMgj6cezE6dl+CCw3SSOqh0sbbDFnpD2qo
	ebia4wR6PqfQE6fbLbtd5MjMyPXHApPqeyESP8SZEQW4LD1/WBLAmLvj
X-Gm-Gg: AYBFou2ER79NuUgkOKjlHx3FiYuQK7bSJY68jBB0X6GOK0V6JzZacpdDSsVvOcVYTzO
	inFB8BnqpQpWjCsqZOFh3HeukrdyOaQJ91N0tllTZlTrW9YLmu5MZTI8yJo2XNYC4NQ6S4nYQWI
	5CDBLc4RzW/gUZumCqNWkwIMbqAbs/byYevBUHS9Rt0vyMLpu/Ng6XJGpnGKtaCy/LDC0hfF8d+
	uAxp3zsQAeNZMCq/CN6TzUYQC7W9U9vlh8Pbw3Y2LrL7BnetvEVoX5ajuVoyBP/D566lnCpqmgU
	mjMl6AMJx4Lr6irXi00ACgc4cHLRtc0o9R1Z+IrcKK1q5Xlfakg2zhm3yoQZIpWWQm09iHX51uL
	fiEHoxYKrSw/TWv/OGrdFe3gtMnSrZ1fgWsDEtC7xJGZQ3EXpN9pVrNMpFjs6xgFHkVGlpY8kRr
	YuHnbCDsnE2V07D/rn1vRTy5dlDNW72ZKaLaPUbpDTOzbRYjrFyKkOIJTvmNLG7YXUnOLEdTF1W
	IIbsSx6kuIjXyBXQuw4lho7UvyekxZfJRO35NQTko9XMtRohWuQEWF2xEwFUMDS9uWVXPexmOow
	s55/tyluJmW4g34zxZN42V2zIFu1oQm8mZM3uVP74LW9tnGqPOrBHoYvoMHw
X-Received: by 2002:a05:7300:f78c:b0:35e:af84:bf1e with SMTP id 5a478bee46e88-36de479614fmr127613eec.7.1793811485795;
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:58:05 -0800 (PST)
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
Subject: [PATCH 18/28] Documentation/litmus-tests: Add hazptr drain safety test
Date: Thu,  5 Nov 2026 00:54:36 +0800
Message-ID: <20261104165504.2430480-19-kunwu.chan@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Model the drain engage snapshot race: the engage may read a
slot as empty or wildcard while an in-flight slow-path acquire
still sees the pre-unpublish head.  The Sometimes result
confirms the window exists; the engage's wildcard check (see
the engage-wildcard test) closes the gap by deferring
(herd7: Sometimes).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  4 ++
 .../hazptr/hazptr-drain-safety.litmus         | 43 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index 02c26d6bea50..604c2c0025d9 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -119,3 +119,7 @@ hazptr-drain-engage-wildcard.litmus
 hazptr-drain-resnapshot-slot-race.litmus
     Test the marker consumption race between the resnapshot recovery
     path and a reader release: only one path may consume the marker.
+
+hazptr-drain-safety.litmus
+    Test the engage snapshot race: the engage can miss an in-flight
+    slow-path acquire, so completion must defer on wildcards.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
new file mode 100644
index 000000000000..a0ec1a063642
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-safety.litmus
@@ -0,0 +1,43 @@
+C hazptr-drain-safety
+
+(*
+ * Result: Sometimes
+ *
+ * Models the drain engage snapshot race: the engage (P0)
+ * unpublishes the object (head=0) and reads the slot, while
+ * a slow-path reader (P1) publishes a wildcard (1), then
+ * replaces it with the target address (2).
+ *
+ * The engage may read 0 (empty), 1 (wildcard), or 2 (target).
+ * Reading 0 or 1 while the reader sees head=1 means the
+ * snapshot missed an in-flight acquire — the Sometimes result
+ * confirms this window exists.  The engage's wildcard check
+ * (hazptr-drain-engage-wildcard) closes the gap by deferring
+ * when it reads the wildcard value.
+ *)
+
+{
+	head = 1;
+	slot = 0;
+}
+
+P0(int *head, int *slot)
+{
+	int r0;
+
+	WRITE_ONCE(*head, 0);
+	smp_mb();
+	r0 = READ_ONCE(*slot);
+}
+
+P1(int *slot, int *head)
+{
+	int r1;
+
+	WRITE_ONCE(*slot, 1);
+	smp_mb();
+	WRITE_ONCE(*slot, 2);
+	r1 = READ_ONCE(*head);
+}
+
+exists ((0:r0=0 \/ 0:r0=1) /\ 1:r1=1)
-- 
2.43.0

