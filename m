Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE706361657
	for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 21:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769721973; cv=none; b=FvBG8q1tQotfV0ae3z7oV5wp0pVS4wKRe4WZA5uLnwl8fMES2PazjOrKeg7djQnKpmNGgXJBNi5p/hWndKyukK+VYeHWQGIRpXIls/7QvCyT90pIyxuyAOppCiKAXks/5LX6XpIJuOHrUKak6Ky+AnRFSAFTjJzHS6/MDlBn3K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769721973; c=relaxed/simple;
	bh=Jis9QmSRTC6AxZZguKb1BxVkXKYzE5EgFNnbHekO2IA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PIwnpYWRqDi6NFNHVH+ONgu5Or1a6Nzsht+7unL2Rvof01nN7arpyGkIWWOjLdbd1eCqyY7vRhtdJ6uYaXtJh+n4b67T+2eMWTZTGN4+AV+6c1LD0Pb6/gRxxt6zADhvuE2d3pFX/6snP1yZ4ZsMbPBu3xJv7BjILHGo8l+f4d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oqTfR/f3; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dmatlack.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oqTfR/f3"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2a0bae9acd4so10813805ad.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 13:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769721961; x=1770326761; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dy0UJfAzqC2Uv0TXXgbyaGP8I7SQ7WbjV2I2sUTFK/o=;
        b=oqTfR/f3sqqiJ4FsX88tf5lJRqyrnV9wLcLhcRoljtXnLfCrOFKWavxNkiKmIH6Lf/
         obTwP9dc1q9yI06Uco2+Eio3WlraRyysYY2O1uiNFNel7ZR8K2xJkeTcWT6n1paa9OUt
         bwLmvpaxrIo4e7NtHZrSikfRWtxgW2mSE2an0DyCG61PBkn4A3SJsMaLPSAjagp70Ce1
         NZys+z5B4PRKdU4v+k+MjDrJzXE/10hNDhraM2qxClOrwvsY76Ye99wMUCNaZSLLKDTk
         Kz2D44wxl29hiOchwksRPp9xMSXXOvAS6xY4a/qelLonzm6D3VybaFCyDqQCUzD0p+xA
         c9Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721961; x=1770326761;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dy0UJfAzqC2Uv0TXXgbyaGP8I7SQ7WbjV2I2sUTFK/o=;
        b=fhcdMxM+DVJbt7UAB+vul0Yt3oMNQlNS9Hdl94MHzqZ3IfcC3P1ty6336isHOYrlNF
         v2Ozi07TL7O0euNYL0guRvMbdF9hzTI6c++AfuYgmw6LXcYJ5/PYINaDfSVjeYzCXa3V
         gCSatS/AC50NY2CXZxIhhWaLxZn07oN7WNZHcBfh1RJx+bfrYMrxcD1UGlJuqr4Qgbei
         FJn9pQkKN/jpAFmPGjnIjpix9BrlcFtBYYHCorh4dPsgE0URNhDobWDaZMSPLfUlEtE4
         ybaomU9tKa08sXNo11YA4/7WfVOs+srL7bOccTmXLnulMjMLcfV3+TpQ1Yq81oHzOfLt
         7oFw==
X-Forwarded-Encrypted: i=1; AJvYcCXyUby4fKmVUGVK2fXnM2dKWYpWchYPPj4KLiEtbxM1mlT7/xMKPM5sFLizpTHJ6FWh91PClej8dhQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjyerBVGN1dCpH9+F4ZWr1V9l7wCDIj6ML0uD7tXyr+iJNO2kb
	6VR8rciywTBTzb2BBm+CdA2x+jP2I100mDnxtau3W+y/kbIMPLYWLGQ6atYk27FoOFw5HGxcwVZ
	9c7dKczeWWVfP9A==
X-Received: from plrp10.prod.google.com ([2002:a17:902:b08a:b0:2a0:8ca0:1e55])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:290d:b0:2a0:dabc:1388 with SMTP id d9443c01a7336-2a8d990adfcmr3786725ad.28.1769721960616;
 Thu, 29 Jan 2026 13:26:00 -0800 (PST)
Date: Thu, 29 Jan 2026 21:25:01 +0000
In-Reply-To: <20260129212510.967611-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260129212510.967611-1-dmatlack@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260129212510.967611-15-dmatlack@google.com>
Subject: [PATCH v2 14/22] vfio: selftests: Build liveupdate library in VFIO selftests
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

From: Vipin Sharma <vipinsh@google.com>

Import and build liveupdate selftest library in VFIO selftests.

It allows to use liveupdate ioctls in VFIO selftests

Signed-off-by: Vipin Sharma <vipinsh@google.com>
Signed-off-by: David Matlack <dmatlack@google.com>
---
 tools/testing/selftests/vfio/Makefile | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/vfio/Makefile b/tools/testing/selftests/vfio/Makefile
index 3c796ca99a50..1e50998529fd 100644
--- a/tools/testing/selftests/vfio/Makefile
+++ b/tools/testing/selftests/vfio/Makefile
@@ -12,6 +12,7 @@ TEST_FILES += scripts/setup.sh
 
 include ../lib.mk
 include lib/libvfio.mk
+include ../liveupdate/lib/libliveupdate.mk
 
 CFLAGS += -I$(top_srcdir)/tools/include
 CFLAGS += -MD
@@ -19,11 +20,15 @@ CFLAGS += $(EXTRA_CFLAGS)
 
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
2.53.0.rc1.225.gd81095ad13-goog

