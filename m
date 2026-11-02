Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633838;
	b=CeXWqpNi3pfOqFbXUjdA36QY6JvcWST1DqhhpKnbDjsa32KO2efjz7CSIVQ1QnmoE8uA
	 1vjjO8FK68WMtRIuJ8KF+kzxA8xdzP74Vj7gxmoxFP9+k10HA8owcIUSEDkVKT5NvTEHr
	 5afMxV0C5kx+0nuCaM/iN5VEV27baeFAc8gaPtupna9/A1VWw4LP7cuQy2SUh0RVxxKrO
	 qDEkVJZt9rH1Mju6LQn7WMokAlRrE0f6FhD+30MsUV+TLxqN3G/OiYC5+p9cPOP3Q18ZM
	 BrlC8yLzzG97aiVQRjlj1BIW1EE2bMvO6rx/WwqTtBL6GL3ZCJKMSOsfMNivI8vkaew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=Ms8itCh4PfqJV6uxhFhSbZGdhGd+gOvwo6FEHxIUACI=;
	b=Br2pXM1unAGPQXT1LEnDFbfz4vVL8mnCFEiorvrWvHe/E0B9tDU6U0t3pJlKu2cyZzU/
	 ctklAey+Ugmxf9HRfz6VIaCWTfx5B5Kxh0/s1h6OkCj1Rox0c3aPATT35tDNhY9XDuSS/
	 XAYUeBW9xZmDeU2T2wgSnCX/8a1knW/4PDZwRTGbdM9C7D8LkQUrOLEN2YywNd5r6qqqn
	 +f7pwRR71qDtUilBW/Z7GQTAE3vtvDQK3Mqb1ErSlQfkSxoumqLvaBlWXXKcH8mkNvxOB
	 l7mPzfnRDhO0B7JhNnyekRltj30g7xkOG0vHWkflt5nqXhPTuG8LtHKm5NAVG9y5Wcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldmIxEXD;
	arc=none smtp.remote-ip=209.85.214.197
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D416960A7F30
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D416960A7F30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ldmIxEXD
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e601800e58so51289015ad.2
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633837; x=1794238637; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ms8itCh4PfqJV6uxhFhSbZGdhGd+gOvwo6FEHxIUACI=;
        b=ldmIxEXD39zl4nBLfBA+4rAPOuHPhzzCv8bFjZBy6+XbPfYx4KLkY3ZU2wjDon5s+y
         niIiQ9IQm1w/Ilca+JlCoAy3hAXaDazpIOx3PPjC59/CzetAivWxfiHjkJx4mt9TCekG
         c+4ZdKaNMqTaXnCTL8k7Rrl7u2Wype1jgmXrs3vQTja/vWfLH7fn4ii2bNkjUjNhOCxV
         IsVYc8FWgiYai326JH9uRsrCg4jS9JUSDC7XCFPMzrEC5UOYE04Z2aSDYRCL+FzuZJZd
         SQjCUC9T4o0BHYtyKRmOZyw/dxcB0sqBFKb6NNqIRdYjOf2p9Ut6wbWM0Adpzk638EPj
         w5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633837; x=1794238637;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ms8itCh4PfqJV6uxhFhSbZGdhGd+gOvwo6FEHxIUACI=;
        b=Dm3NB3CEN74wSsZgcUzQAgGBS7nWqbt12HrgWTALNm2Bt54iy88TJyJR0B0+Ts2fob
         N/vSz4NdYvIBX1cqBbttEnmaOMw6vmZcsXNNF6ihybD3wBNg53HSDiUehF5IfcvGU3mc
         6iuW9xS4wx25WfGp9lYMLxJHnnpscZx9az94zy3o7GshZJz8L5eML2O7vk0Cf9Cj2J8Z
         mI3l/+R59bqcA8S55a05D+0F1cKy/bskCDH98ECyg868L6IvwtE80Rbk41zJzCqpqFi1
         wrxZi0lzjIcNrspHTHrpRqrOEjFa5hhcn0CIl/rwm9N17YGw/FwWF+oHRKqI5XD/T+lO
         tFNg==
X-Forwarded-Encrypted: i=1; AKwUvByhdwVzcghfZKsHIpJtdgaSzdMqKRqQwCuoBBW09yTaq9O9ui3FTch/i1bOtsJPvguP/HRkFrI50lQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gt2AizEQa3okaUAdGelA5wcB/9bdaT6j35s3ESfieBWvx2wwD
	VXG5Knyi44UsqYaOuuESt8sOoqcpeYWSlr22hYPSHqFYfl45SXwA7iUTMDAlVvu5OJ7ClTQtbD1
	yzqbgITVUXw==
X-Received: from plhs10.prod.google.com ([2002:a17:903:320a:b0:2e9:6b18:1067])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1b23:b0:2e5:db61:e5d4
 with SMTP id d9443c01a7336-2eb3653906emr104135025ad.62.1793633836956; Mon, 02
 Nov 2026 07:37:16 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:45 -0800
In-Reply-To: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261102153656.1431701-1-vipinsh@google.com>
X-Mailer: git-send-email 2.56.0.317.g454f8302e1-goog
Message-ID: <20261102153656.1431701-17-vipinsh@google.com>
Subject: [PATCH v6 16/27] vfio: selftests: Build liveupdate library in VFIO selftests
From: Vipin Sharma <vipinsh@google.com>
To: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, kvm@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, bhelgaas@google.com, chrisl@kernel.org, 
	christian.koenig@amd.com, corbet@lwn.net, dmatlack@google.com, 
	graf@amazon.com, jacob.pan@linux.microsoft.com, jgg@nvidia.com, jgg@ziepe.ca, 
	jrhilke@google.com, julianr@linux.ibm.com, kees@kernel.org, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	mattev@meta.com, michal.winiarski@intel.com, parav@nvidia.com, 
	pasha.tatashin@soleen.com, praan@google.com, pratyush@kernel.org, 
	rananta@google.com, rdunlap@infradead.org, rientjes@google.com, 
	rodrigo.vivi@intel.com, rppt@kernel.org, saeedm@nvidia.com, 
	schnelle@linux.ibm.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

Import and build liveupdate selftest library in VFIO selftests.

It allows using liveupdate ioctls in VFIO selftests

Co-developed-by: David Matlack <dmatlack@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/vfio/Makefile | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 2c32c48db509..55e1e1843090 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -21,6 +21,7 @@ TEST_FILES += scripts/setup.sh
 
 include ../lib.mk
 include lib/libvfio.mk
+include ../liveupdate/lib/libliveupdate.mk
 
 CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -MD
@@ -29,14 +30,17 @@ CFLAGS += $(EXTRA_CFLAGS)
 
 LDFLAGS += -pthread
 
-$(TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBVFIO_O)
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBVFIO_O) $(LDLIBS) -o $@
+LIBS_O := $(LIBVFIO_O)
+LIBS_O += $(LIBLIVEUPDATE_O)
+
+$(TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBS_O)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBS_O) $(LDLIBS) -o $@
 
 TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
 $(TEST_GEN_PROGS_O): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
+TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
 EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
-- 
2.56.0.317.g454f8302e1-goog

