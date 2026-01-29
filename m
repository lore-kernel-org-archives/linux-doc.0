Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8535DD19
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721965; cv=none; b=iyNT/ARzqsFqU4QUnO5gaPoEpUfQLyOqvatcALe4NicCo8n4K669BgLg7TnzWgqCdMVjIZLX//bQamibkRrY5UA5BtR/3we+Jw5u0V6FhlFCl5s2qxOktvE3+mzZYTJsNi4x27i0lOFSsB7xMxhp3wrFVY1bR2fUOGKXRfN9LBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721965; c=relaxed/simple;
	bh=Cb9Y8KWzYaZZbnWLogkDgrwZwr7o6CbuJ0QS3Pv10oU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=llVFpUvYgaBYCq2xj90j2g3Xoi5rFJg3f3XrdGc6MxD45eT2t4RYr3Comk20L3Is35/X5LDOKHzxA3nK/QD7e37vfQ07FElyHenv97sstXrEETUESIBHX/822tFbs2L93UMqE+2LXgBMaOj3f+SLmVw6MtG+U+oXpTk61wd7uZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y1MvxdcS; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y1MvxdcS"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a377e15716so35010255ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721962; x=1770326762; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BqEhbyqURPyKNgE6Ne2XGuBboHLh1jY5l9yG8cIgxTg=;
        b=y1MvxdcSHAA2tv1IsyzFmRw57KM/wXj1R1ZdYWaSIzlN1RSmx2DZC/lY7CimLxCBCS
         0vK9SoPcz8XrCFytWn1qKRZdDSdeZ2t6R/Z91DQq/Tpgpc7vbc8pNHwoXbibrUy4JtUd
         XRvw/ZkDVaWbdWDB8xoDlo+9pCWweFVIIAB9EwHkW1wCjh98cRA9acf88FsvMfg6F7V4
         eOA4JZ1Xwkh9rCClweXAF4K4BDHCeLPr55MISxcyzWjgfkaiXXuW4QyrTxZChFoFlnTe
         u8lC+qyEk85GD92i475reauTgqevO+KpL/a6ENkj51ChBaphwulFIdpnaq0r957wLCDr
         8FGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721962; x=1770326762;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqEhbyqURPyKNgE6Ne2XGuBboHLh1jY5l9yG8cIgxTg=;
        b=JSO/Le5LC/0F5kPJbw+XvcFAB8vCMsC5C2NtqOoxVUJFA3M89SKHQOgQCISozhmg9b
         A1rh9luOpfjPaif8P+wXgxF7ymJjpmn9bMv0Xf04SUHNBZ8nhaZQRnGL2S3qqKMro2XF
         3IDeYH1U14ZmqVGNwuoE7RDY7eBznbQotfZROFA+o9gtQppvTqLjxCaaunAKsXzO6fyd
         FPMVFo7jSD4+fvBPsF5t7rYljthn4fPIvtJg8EcXDQYXos8TfKWlgT62WGzk++CLpZON
         VdmYNlC9mncQpIEvUBW/gH0LE7QWztTeT3J/UGWKgyYYjZuP/F0nd8KLN8XZ/mRw9qik
         lecA==
X-Forwarded-Encrypted: i=1; AJvYcCU99HGz2f9ZukAbhM3EQaKIUxw+E3OSIPTGUvwAEGOtvpvc5uG+lfaGbBxT8SAic3wyRilxaZ4UZzk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDe4uOk7tCB+VaLlm63maqPnTLHQlkLF17v2xEd1IpnWP+ITja
	/+NaLeCaWAKA4iVyHK7n90w5GaNlsNZJt7XVUCM/bIsRqh0n7glKEmwOrEsksqXbFhVXNdaQ01E
	6wcDQCF/81e/cUg==
X-Received: from plot3.prod.google.com ([2002:a17:902:8c83:b0:2a7:78b9:f962])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:bd03:b0:2a7:a9b8:ebb0 with SMTP id d9443c01a7336-2a8d96a7ff3mr3875585ad.19.1769721962280;
 Thu, 29 Jan 2026 13:26:02 -0800 (PST)
Date: Thu, 29 Jan 2026 21:25:02 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-16-dmatlack@google.com>
Subject: [PATCH v2 15/22] vfio: selftests: Add Makefile support for TEST_GEN_PROGS_EXTENDED
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Alistair Popple <apopple@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Ankit Agrawal <ankita@nvidia.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Chris Li <chrisl@kernel.org>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, Josh Hilke <jrhilke@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, Lukas Wunner <lukas@wunner.de>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Raghavendra Rao Ananta <rananta@google.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, 
	"=?UTF-8?q?Thomas=20Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>, Tomita Moeko <tomitamoeko@gmail.com>, 
	Vipin Sharma <vipinsh@google.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>, 
	William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

Add Makefile support for TEST_GEN_PROGS_EXTENDED targets. These tests
are not run by default.

TEST_GEN_PROGS_EXTENDED will be used for Live Update selftests in
subsequent commits. These selftests must be run manually because they
require the user/runner to perform additional actions, such as kexec,
during the test.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 1e50998529fd..f9c040094d4a 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -23,12 +23,15 @@ LDFLAGS += -pthread
 LIBS_O := $(LIBVFIO_O)
 LIBS_O += $(LIBLIVEUPDATE_O)
 
-$(TEST_GEN_PROGS): %: %.o $(LIBS_O)
+$(TEST_GEN_PROGS) $(TEST_GEN_PROGS_EXTENDED): %: %.o $(LIBS_O)
 	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBS_O) $(LDLIBS) -o $@
 
-TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
-TEST_DEP_FILES := $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O))
+TESTS_O := $(patsubst %, %.o, $(TEST_GEN_PROGS))
+TESTS_O += $(patsubst %, %.o, $(TEST_GEN_PROGS_EXTENDED))
+
+TEST_DEP_FILES := $(patsubst %.o, %.d, $(TESTS_O))
 TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
-EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
+EXTRA_CLEAN += $(TESTS_O)
+EXTRA_CLEAN += $(TEST_DEP_FILES)
-- 
2.53.0.rc1.225.gd81095ad13-goog

