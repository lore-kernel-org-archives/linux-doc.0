Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793633841;
	b=SVG522PM8q5nMhDAk85sI2tI9M625A1teKvPoiDSFTjb9bxAZl33BKA85s4Sc70uf4zg
	 UMzq+BYdOqV/7xVC4EQueatIL0YEUuMhq46f4tfFIBBFfxubc5+PdPNPK+DAuDKe/5itL
	 YVqSkGkEAhuAfx3+56UU+hAtFxp0ibtpEz+2z7tESr7ZYZTEEciyrmvnlRaDwgvfswyRL
	 +y/hStBb1lZq28Of9BStg+WKezEVx5qayrVaICX6GAu9o8mJ2nAwxnJvqzwF5wxqUPF2V
	 1YCNT6XLTMTzNu6leNFqmrYIk0hWPxa/aq6UOXuvJScNOEEoy5QT1Z3qi+AKMfG2X1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793633841;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=tylWbFCUgeCOXBn9trkYSMBYVlhA9mV6Qs1lbXsCOco=;
	b=5r18GCFYl7yqTwr5djxifbU5HDC9Xl6stQe4kcz4EUDVLjntcaSVJoHMeV4LhADIgiAS
	 lZzci8Xla/X+s0uRYTC4YfPhpDwiloJfIF3bFW1Pphba6Hsr5tKx2+Of6f+MrSBJvY6+w
	 j0bI6MBi1OwgQsUBixIuYxdcgQLJnyllWnw9eqqi87prz7KBab4LZRmrk7sLevlgxHZGx
	 NS85/5SpJ5rIVzPzcnnzmcDFtbngIpu25ik7AqTpRduDSPcf4MGjGX+BRK7q0zvFibgX+
	 5zWHN1/uVt9WNNk9QTNEpZ+aN3Cm3jeDwH98sEqWSrFWjGckgphKRnZnpy9FktbtORw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NSzJydZv;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C3260EA5F7
	for <linux-doc@vger.kernel.org>; Mon,  2 Nov 2026 15:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7C3260EA5F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NSzJydZv
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2eb2437d752so46915085ad.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Nov 2026 07:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793633840; x=1794238640; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tylWbFCUgeCOXBn9trkYSMBYVlhA9mV6Qs1lbXsCOco=;
        b=NSzJydZvMVXYxTC62CIB6ze6cmzNxnlcYaAgAV5q0w8GPnprJgO1rjDotE1ldsqVF7
         id7VY8rj8sVMHSKlTmzi/PwHWNeII+QwqojnCqdiqX3PxCO2GIn3vjlHmseHkMN5XYqg
         BYPAspktX6r0+V8A2/zX1+AyJq1DpXHLE0LDtoRiJxXMg8DAr6vPt8WXhLgLQF8ebD15
         QcofgRuBHeqjWN5y9E3jlhTLHW98sFut6vpM+lSkpNsQsFyL3sjc0/ACce80N8Qbe8HF
         sfB8sbQFa0HOWibvXSBBCPqGq5tFavtJkOEq49CN4uJoCYR6CeAVMFVKwOily0i0nNoJ
         IFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793633840; x=1794238640;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tylWbFCUgeCOXBn9trkYSMBYVlhA9mV6Qs1lbXsCOco=;
        b=cU689R7qXToBFIpq2voldon6VoeD8X2BNlhEkPamFf92M1eIAQADt0rumzZqXFZOxx
         VUhBS8aWSUYgSclKBAxnXNozeGoVt0FXybxkvikVPXlJboQ32WxMFH9XrEdA62kb0g8E
         hyrbeH+4P9iO4FUh/ojpgq0NCzVc17jmeGhpcA9eQmBAKUTB537EBdaIsuIfPPXOEoLJ
         eyoz+S3WD0+1rHN1vPflf28UZk3kxdXeGSZgrhr2O5H4wpGvR4CBdz7KPbHQ9ReGhvRl
         4bqySno+RoHmN1j9ltUm+zZne59QbNQDAmwUn8ZkQ+fXDCmKpInOk+mSGcON6dH2tbV6
         keRg==
X-Forwarded-Encrypted: i=1; AKwUvBz8GF89uv96OATVuOeG0UdrHbvbnw4erXObTNjz0Pd7xD/PGHe4stD4DkEDoPluC0N4yhlcyet4j/I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+eVPVXnaCmmUEVlbFf+B1tWbye6phvhgtjYBt5x6rE0XzUt8yk
	oC6N7ZDnOYGBNjrw+E5tII/uuYZOcVPVLHNr2ZxWZSt5Z3KId2EciNfstKtPd0lRbaf2YyzPwfJ
	i6A6n0NTa7A==
X-Received: from plbix15.prod.google.com ([2002:a17:902:f80f:b0:2ea:a5c1:240f])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:37c7:b0:2e8:b5b2:a9f9
 with SMTP id d9443c01a7336-2eb364e9f75mr92959155ad.37.1793633840266; Mon, 02
 Nov 2026 07:37:20 -0800 (PST)
Date: Mon,  2 Nov 2026 07:36:48 -0800
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
Message-ID: <20261102153656.1431701-20-vipinsh@google.com>
Subject: [PATCH v6 19/27] vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
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

From: David Matlack <dmatlack@google.com>

Add Makefile support for TEST_GEN_PROGS_EXTENDED targets. These tests
are not run by default.

TEST_GEN_PROGS_EXTENDED will be used for Live Update selftests in
subsequent commits. These selftests must be run manually because they
require the user/runner to perform additional actions, such as kexec,
during the test.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/vfio/Makefile | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index c2764fcef31d..ece2a3618f2b 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -34,16 +34,18 @@ LDFLAGS += -pthread
 LIBS_O := $(LIBVFIO_O)
 LIBS_O += $(LIBLIVEUPDATE_O)
 
-$(TEST_GEN_PROGS): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBS_O)
+$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): $(OUTPUT)/%: $(OUTPUT)/%.o $(LIBS_O)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBS_O) $(LDLIBS) -o $@
 
-TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
-$(TEST_GEN_PROGS_O): $(OUTPUT)/%.o: %.c
+TESTS_O := $(patsubst %, %.o, $(TEST_GEN_PROGS))
+TESTS_O += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
+
+$(TESTS_O): $(OUTPUT)/%.o: %.c
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(TARGET_ARCH) -c $< -o $@
 
-TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBS_O))
+TEST_DEP_FILES = $(patsubst %.o, %.d, $(TESTS_O) $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
-EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
+EXTRA_CLEAN += $(TESTS_O) $(TEST_DEP_FILES)
 
 endif
-- 
2.56.0.317.g454f8302e1-goog

