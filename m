Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CAB387596
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774310359; cv=none; b=eaDUrBpu7gGlsXvsZak8ArSljk0rbLTLgVsF/MITrxi0jZfWcvFQbxgrQngFs35FxrdULfzFiWjau4L7+N1wiD19aqdEvUiYCz9esed+zT1Qti/JLHpq+P9QZb2c/TUIAfFmNXZpxLtyrl0IyFMnfcv+yq3o/w5s0RLJWtG72Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774310359; c=relaxed/simple;
	bh=XYunvBN/JOFiTVeFj3WUZep3oT3AVgN42lf66K2Tnww=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BPJGkwnGaYO8pT+k3I90GxSfPH4a7eYDYLalXBCM0w78gpCq3GuVnYfJFBooNLbMNCCpqwCsPxXmdIZR/Cg9jduDJit5QxN2fj1Iq8QC15ixWPXecPtjhSMnvsb8OSYTNj2aUuzZtbNKRBfhmsWOIkI5QcsE09pyynjgSwjYsy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M3osV84X; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M3osV84X"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-354490889b6so21889008a91.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 16:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774310346; x=1774915146; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCulrz/+ZC3yY//mGMCNHFkV5P7dfGgY4CJSUX7daUA=;
        b=M3osV84Xk+p/MMKFxwwAMN5wu3Crzw6Z1XVO86jMGaE7SQreQW6vHZXBv4bbbkv6YF
         8VTH5vWCCSYgICG7ZUB9hkKD0e8VGw5WRdw0/3wf9BgWcEeVA/LvlHCBWaZEzr+6z70F
         GC4JcmbZ3hTYr760jIYOqkFvCrHPfA+8ciQRYqL02OXzXb66zFAiYDOF7a6I2XaKJti6
         zzrxbid2UmCaxEIDZ3Wzsp93wyJ3v8/f2gEYUFe/VQ171Dt1rHlsSQqdc/PyvJOkZEa2
         8WOI22OTSTSnKVfQh0wBGEIUJn2l6l+lwYaisiy3BjYAreQQ3pFFFEljZSmgG8xHGyej
         RgRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774310346; x=1774915146;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCulrz/+ZC3yY//mGMCNHFkV5P7dfGgY4CJSUX7daUA=;
        b=YmoY/2KNjiC0wP6NOF42TIPzTy4uBAaNzUUnYXJ8zWgElCHI/hKKEc0IxlxTDIlPVI
         W1JBYNm6NngxaEM/oEFYX0CnGf01SJp+4Zq7AX6DTixrlBE0+bHUU0Q9grQ7BGtIesgG
         awePA8/zhnRjWiWDrVUXAyprgAEovjy23h2VJ7c73iB3vxQKrctZFfBthp2UP7ABX9e1
         Lv6mzzHQygGXboOJYT6wTvAPmDW9apIuuh2kbr5aewZuPf9MTBtf3HsQTGQHVIqNpiYP
         W2CBY+ujd9dUqRIcK3mZWXUHImI1rQoQXDKAuon1kl92APjqDEiUvszQnzVhvsihqjSM
         //Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUMMCdmkGDAjIFpv6tbXoX3BMfgiJilCkq0cgdjxDStK8EJV5Jc+50+eQYG4vK8Rsu09Vs4IzOXGKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZAU28b/N6bf3c7iVzKIDSFzI6Av/Ma/FejnqxtUJU1IRMN3q6
	Gw2DwYm4PnwJwQ3VsqYxVIDxgUxzlAlX//wbmq2GcLSJhVSus7Z7aZI0tBuSuClMTkR1tE+Pzdp
	m/UWtSETVJagemg==
X-Received: from pjvd16.prod.google.com ([2002:a17:90a:d990:b0:35b:a305:76f5])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:15c2:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35be4f87c2bmr4832204a91.11.1774310345696;
 Mon, 23 Mar 2026 16:59:05 -0700 (PDT)
Date: Mon, 23 Mar 2026 23:58:08 +0000
In-Reply-To: <20260323235817.1960573-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260323235817.1960573-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
Message-ID: <20260323235817.1960573-17-dmatlack@google.com>
Subject: [PATCH v3 16/24] vfio: selftests: Build liveupdate library in VFIO selftests
From: David Matlack <dmatlack@google.com>
To: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Mastro <amastro@fb.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ankit Agrawal <ankita@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, Askar Safin <safinaskar@gmail.com>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, Chris Li <chrisl@kernel.org>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	Feng Tang <feng.tang@linux.alibaba.com>, Jacob Pan <jacob.pan@linux.microsoft.com>, 
	Jason Gunthorpe <jgg@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, Jonathan Corbet <corbet@lwn.net>, 
	Josh Hilke <jrhilke@google.com>, Kees Cook <kees@kernel.org>, Kevin Tian <kevin.tian@intel.com>, 
	kexec@lists.infradead.org, kvm@vger.kernel.org, 
	Leon Romanovsky <leon@kernel.org>, Leon Romanovsky <leonro@nvidia.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-mm@kvack.org, linux-pci@vger.kernel.org, 
	Li RongQing <lirongqing@baidu.com>, Lukas Wunner <lukas@wunner.de>, Marco Elver <elver@google.com>, 
	"=?UTF-8?q?Micha=C5=82=20Winiarski?=" <michal.winiarski@intel.com>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, Pranjal Shrivastava <praan@google.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Raghavendra Rao Ananta <rananta@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Vivek Kasireddy <vivek.kasireddy@intel.com>, William Tu <witu@nvidia.com>, Yi Liu <yi.l.liu@intel.com>, 
	Zhu Yanjun <yanjun.zhu@linux.dev>
Content-Type: text/plain; charset="UTF-8"

From: Vipin Sharma <vipinsh@google.com>

Import and build liveupdate selftest library in VFIO selftests.

It allows to use liveupdate ioctls in VFIO selftests

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 8e90e409e91d..7f3c94da289d 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -20,6 +20,7 @@ TEST_FILES += scripts/setup.sh
 
 include ../lib.mk
 include lib/libvfio.mk
+include ../liveupdate/lib/libliveupdate.mk
 
 CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -MD
@@ -27,11 +28,15 @@ CFLAGS += $(EXTRA_CFLAGS)
 
 LDFLAGS += -pthread
 
-$(TEST_GEN_PROGS): %: %.o $(LIBVFIO_O)
-	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $< $(LIBVFIO_O) $(LDLIBS) -o $@
+LIBS_O := $(LIBVFIO_O)
+LIBS_O += $(LIBLIVEUPDATE_O)
+
+$(TEST_GEN_PROGS): %: %.o $(LIBS_O)
+	$(CC) $(CFLAGS) $(CPPFLAGS) $(LDFLAGS) $(TARGET_ARCH) $< $(LIBS_O) $(LDLIBS) -o $@
 
 TEST_GEN_PROGS_O = $(patsubst %, %.o, $(TEST_GEN_PROGS))
-TEST_DEP_FILES = $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O) $(LIBVFIO_O))
+TEST_DEP_FILES := $(patsubst %.o, %.d, $(TEST_GEN_PROGS_O))
+TEST_DEP_FILES += $(patsubst %.o, %.d, $(LIBS_O))
 -include $(TEST_DEP_FILES)
 
 EXTRA_CLEAN += $(TEST_GEN_PROGS_O) $(TEST_DEP_FILES)
-- 
2.53.0.983.g0bb29b3bc5-goog

