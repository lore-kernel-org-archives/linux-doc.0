Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811469;
	b=NJhHaxgltEpRjU04llIcJ6zOfJt7ycU65bDLv6D/LLcKJBwncaR/9LJOZ8Ywn1lO3KEM
	 uspF6ftAfcNhp6BkdFp+cneGm4aZCXA5LlYJVBu9yTs5Lb21geEKJW4yNxD7vRTzfP4Z4
	 Bgo9YcbBdZAa+sE39VYea8WAF7DSWB1kX+7hsGyhPyAAcKOTjypae8+YNLdrj40rmO78k
	 1qJbGX4c/uTJiwvN2ZqEIU2+R0L9B2wfixwXwixmbzeOc9wCrD4qCyvC1sadD5B2oUkBm
	 cUxGTTHjFA29nyL8OQhD6pugjH4KBVteVcU8AeKugxMHbFkicdurcOWF2uBu4urNrjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
	b=iz1cSsxaKtRi1rP3LqjwIGdH30G2ACeFFXZ9G7kxlOzPFGW+ggngcDfQM2vayXvb6pbo
	 9LS971v3FAX+G5l2UfWpY5I0814btQxz3piOaYnUOb3n6HmyWhYTx8OhlGU0z9H6bObTv
	 Zy8ex+2GfsGTNutI+p8Q9gkTYIrAMEASCmke3qh6c9UxKE73KxonOFUP09+GN04wDkz1T
	 rDoTmK6njt5AKhysONCicrRXRf2GelJBJbucVTlx7oqqdcw6tuJLJy77vsla12e9soUZP
	 +IpbYQRtWEwc9zqJ1XIV+HDH0traOkTUoffMZa6uvzG+a2ZNZ2+AtpNjdIOBh2E6xgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F559606D828
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 16:57:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F559606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H+yZfRyu
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso1208587eec.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 08:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793811468; x=1794416268; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=H+yZfRyu1YpjAqnbnHiKh5xNTmCDYDOnNqBVbKlooMK+sxvVJEQXqGJdt2ppEr1oHx
         t435KiYlxJLi6R2A+7xJQKVHU0bpd0p4PwvDNarn62o3341CZREK7JiPVkwmMKTVkZNz
         BPuL/XdarsAwqfDbJv8Ra0M5t2G1eDT8Op+OY5grEIwd/imbjAuY5jPGa59Euw6GYLM9
         GX5rT/byFl19eCTBAowU9TiUfPVTY8CrphI0yYByVAzBDZsS9lwj0htyPQuwfm1cCYSJ
         jFIBEzQv/l9itvS6ELOYrAx7w4GDmZWPFyGVpIPncbIFaiHeSVl0GE9j3rCjCkbMz4Zs
         sfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793811468; x=1794416268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HYFy8sOOELLyqP//oMKFGSpOITyv86S+D257oV2UNCY=;
        b=iCEXROtv/XXYQ7xyx3eR/9pu5BRGiA/mV5vjao3SOm7es5z5AEZiDl4A82lx+dEW5u
         u4+s4GxqmrZ49o+d45bWufTT3wcMrCfEHszYco0nzshJDofLPQbpwxYtf07SlOcBGvNp
         2CYCNGUq9OxPYASxLFUmXjJgFWnHL/m8vddQJsSXl02VUc/cahHF0RwAFXdyNXX2RV00
         SWdgSKxuow+lGBgn1yCd0Qaes1pCYb/nfXJ86qOltUxIgAQconNUxT4DQVuCPB8d3/pg
         +AVkF5J/ij7pbGgNn2LSKv/2ynsC+4L1NO1+XzPQdi3tHKbV4qvdUvs7Po9QFp4alYHd
         YTng==
X-Forwarded-Encrypted: i=1; AKwUvBzNDFoBq/UynYT2e/FAdywc2srOisUpo4AXus4wT+vh9KuGcU+rf5nLbx/D4YnF7AUIx37kKXeJI0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nbZeLkfbopm2EXl1tSYMRCIKQN8l8I0ymNSvYdFDgRclUJ0sS
	urVTBnIn/+fm18+sZgG+ae5M5KERQQl+yrQxgow76nx5r9uMOplBktW0
X-Gm-Gg: AYBFou19Br8AhzbIC/W7R62RAam6Xjq6ktvo3TlizVCDbR8rwmH5XszuKAKNfApsCGq
	zQdIo6JVeHmPksprUMlumxKU7mZl1bUl5AJb0w0gv5xzxslnYJbCc3GRA0PPn49KRmfuyhWrgE+
	J03YEIh5ugnPDRNidF4qRXYXQ4PmbaDTzs54hWS0OOF8lYJ9O47/1y65h8KQbEAYYIxuA1KRTi8
	mDse5DrMjsrB7J7MYeO1Wc1BwR6LBNIWQ/MjU1HdoSMB9CjLNE8SiO0Hy9M9QGOXebjqEHoUeLS
	0+iOzEhpeK04Gc/Lf+UHpQ/Tca78IvZDej0cm2fj2gFWQy80wxEkYb7fchE1qo4YAzyN0iSuIAl
	2mWLcfekPIctm+6b8o7o0SWft+JS397jMYKbL5udu1HZjM50vu/XrLsMb8HXn8DXH0JJ3G5GlXn
	BHMLvKOHbKcDSiCs4XF5dB81r9q769EaZNnxSzKn6J4Nh1MJOLs33hBzHvfMf+zvsM3zu10DSo+
	ftXZXt9B8ahJTkZXt2lborG/dHvrR0ozCL+TPB8kk1HgRsGLWqtIsy9IkeIG2H0gwYl/fvG/MIO
	IIn5zN7kp2XX5N+9iQYK6tkhVlEVE5nvFwdoXF8=
X-Received: by 2002:a05:693c:87d5:20b0:35e:7bfd:4613 with SMTP id 5a478bee46e88-36a42425470mr24210020eec.40.1793811467022;
        Wed, 04 Nov 2026 08:57:47 -0800 (PST)
Received: from kernel.. ([216.195.201.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d46fcsm9019567eec.13.2026.11.04.08.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:57:46 -0800 (PST)
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
Subject: [PATCH 16/28] Documentation/litmus-tests: Add hazptr drain engage-wildcard test
Date: Thu,  5 Nov 2026 00:54:34 +0800
Message-ID: <20261104165504.2430480-17-kunwu.chan@gmail.com>
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

Model the drain engage's wildcard defer: if the engage reads a
slot holding a wildcard (an in-flight slow-path acquire), the
engage must not complete for the target address.  The smp_mb()
pairing between the reader's wildcard publication and the
engage's slot read forbids the completion interleaving
(herd7: Never).

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 Documentation/litmus-tests/README             |  5 +++
 .../hazptr-drain-engage-wildcard.litmus       | 44 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus

diff --git a/Documentation/litmus-tests/README b/Documentation/litmus-tests/README
index c2bf20fa4092..daab126e45a2 100644
--- a/Documentation/litmus-tests/README
+++ b/Documentation/litmus-tests/README
@@ -110,3 +110,8 @@ hazptr-wildcard-flip-escape.litmus
     Test the in-flight wildcard window of the single-pass wildcard-flip
     scan: a straggling acquire that published the old wildcard after
     the final walk cannot still load the unpublished object.
+
+hazptr-drain-engage-wildcard.litmus
+    Test the drain engage's wildcard defer: an engage that reads a
+    slot holding a wildcard (an in-flight slow-path acquire) must
+    not complete for the target address.
diff --git a/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
new file mode 100644
index 000000000000..0cee89893dad
--- /dev/null
+++ b/Documentation/litmus-tests/hazptr/hazptr-drain-engage-wildcard.litmus
@@ -0,0 +1,44 @@
+C hazptr-drain-engage-wildcard
+
+(*
+ * Result: Never
+ *
+ * Models the engage's wildcard defer: if the slot holds a
+ * wildcard (transient value 1) at the time the engage reads
+ * it, the engage must not complete for the target address.
+ *
+ * P0 (reclaimer): unpublishes head, then reads the slot.
+ * P1 (reader): publishes wildcard (1), then replaces with
+ *              the target address (2).
+ *
+ * The smp_mb() pair ensures the engage cannot observe the
+ * target (2) while the reader still sees the pre-unpublish
+ * head.  This verifies the publication ordering that the
+ * engage relies on to defer when it sees a wildcard.
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
+exists (0:r0=0 /\ 1:r1=1)
-- 
2.43.0

