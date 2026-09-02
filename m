Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB3C45348A
	for <linux-doc@vger.kernel.org>; Wed,  2 Sep 2026 23:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390092; cv=none; b=a7w4CFZiRhpa20+Q9ubFmJpBXcoNHsAOVEiwiF/RiyTyeUkE5QOVtgF7+PIaCe/4S47d30lhRMbMBCHrPzRG+5C+J74jHyCEF2bJjiLosCa4Z59j2bKwgRgUDCarj7Xect/MlzPjQgxa+gq7BkTyKHfTAEvFr/XtND7DIO12sco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390092; c=relaxed/simple;
	bh=jkKXEIPOwBCki7hEhUKs4g/CFbe6ChFGK0eVQgaU6nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVOPTtRELERUQwMnCn3JYdehAoCC+wHYtkrg1Do2rb+tXWeVFpOh7m5oSvWWz0Dlmv5uBIM7G7osRjeApzrVpTxqSYO1og/V3DV3TaEt3wGE+P19t2O7CTv68jBYJYGhQPGVxcPm1rWYj8q1A32oISRUgkhpJtbMXzecIR4bgkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hokODlGZ; arc=none smtp.client-ip=209.85.160.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hokODlGZ"
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-45e2fd33133so1062227fac.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 16:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788390082; x=1788994882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0SPSwC6FIuR2igZB1JOk61BDdzgs1mNnqoV9+SaxkZ8=;
        b=hokODlGZV9B+JuieLJ932AouOKFaQ2dpL1Lsn2rq5uRPMKbvjRfvde7JU/JkC8in4L
         FsqxSbBcjNrPdOBVtEZFbZZqL6HzxyWFgMnuVYpDO9ER0TXs6KBrv0ga02eMvZpUvs3O
         KkDPRQUSlr7SwCS+ddFo1PzFE1jlNNq7zrncaV9Msp3a/vC31kWygiNUMt5FBhsiqJBV
         olYX9MDYVrjSPFF/6a4Je4LPqi4IJCGAkMZ6Y04XKtuIK1GvSMiAqLWHAZODx8Ru8c9K
         3r8B62HofTd1NN1RU7U0Tb5TYiwUVBEGVtxCTqAJcENjd9c70vtmv/utkYStl9SObxxV
         LMhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788390082; x=1788994882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0SPSwC6FIuR2igZB1JOk61BDdzgs1mNnqoV9+SaxkZ8=;
        b=Vyb4XybmOnle4gyobZ5c9XRbcc5nvWiaroq1I7/xzm6rNoTvJ8l9VDmqYeQly7ClaN
         nDSiqe+jfxgCJrCx/2yHRGl8Su4GDyaASO15onXSBW4zBBm5Z3Otuh1TNAbE5MrkubON
         oFAvEUpRDIaizgOfmYOUOLdqp0SIXxkaSWUfyyE6Kd0G1FZVn4mTUAdpUesbDeVSvwBi
         lMPNnRqDYyEihE1GLQNzUWSuo7eS/7SKfh0wS0R9jIbfJEdAM9Qmijw3P98AqrQ0PDKm
         uokcsvkd/BSRanUZNEnfEFsbSZZryMoLLNKl7DeFOCDOYhz+X3jOqsqHn7J289c556kx
         VCLA==
X-Forwarded-Encrypted: i=1; AKwUvBwonwt6ngYk/mzyuBZNt7RcZltKeJ9O8uHYtCyDl1dFO8YSf0q7WlvH3e4jp90e6rCA8cUCovM5z2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kfCrDo6AD5gCAMaFogPLD0+t0twaPpoSw74baH1LchVnD4rTzU
	RxZdKjQvQtlVu/oARUXi0qXCrxa8CCsbLq9bD74vMoQlGwP3p0M4lDlg
X-Gm-Gg: AYBFou2+uvVcxBv/oXlgyoHXbum6E1yM45BRKY1dd7ggH9YekESEoXgQ9HbVJvbBnjD
	t1WibTi9V8d8GhX9sgKRAgxcAjzs0BbEheafEwkKycWyAUxiPvlYx5XwHC6oWL3DAGa/tz5gCRm
	tO6xgkl9uMTWwux6X+mLQNfRd4V9c8IvA0K4+amNi8l9NvAnrvCBouuNR7tyKwiQnIO3MqR8cNU
	oyQqgLias93W8tGtjmhq0CsS00QeLE2Kqzj8ychPwFWJMp197p/4o0MkziuRj1PPqLAkQzYnL9q
	qWekWi6Jsm4kd/1rAqcUzIQdi9c6wtRtmp/H5t14+ZvBgAqrJK7om/nV4TCFinzctkGWwf0JfOl
	oN262A/4NI6aQfwWepPdL/RVTtJ8aQBu7RAmgqqlXT/ARY2anlDPBfSUsM1BYcisDONFLHYrtEY
	14eLNI+o+4JxWqxXnJrosNr1kcPoXlhPcjcipch2HNkB/GU8htRyu+Cked
X-Received: by 2002:a05:6870:1426:b0:46a:dfdc:c77a with SMTP id 586e51a60fabf-46f86ce6964mr7916129fac.10.1788390081873;
        Wed, 02 Sep 2026 16:01:21 -0700 (PDT)
Received: from localhost ([2a03:2880:ff:10::])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-46f336c72fdsm4762834fac.17.2026.09.02.16.01.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 16:01:19 -0700 (PDT)
From: Bobby Eshleman <bobbyeshleman@gmail.com>
Date: Wed, 02 Sep 2026 16:00:50 -0700
Subject: [PATCH net-next 4/6] selftests/vsock: add a helper to assign the
 g2h device to a netns
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-vsock-guest-ns-v1-4-9995383e9a8b@meta.com>
References: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
In-Reply-To: <20260902-vsock-guest-ns-v1-0-9995383e9a8b@meta.com>
To: Stefano Garzarella <sgarzare@redhat.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Stefan Hajnoczi <stefanha@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
 =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
 Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>
Cc: virtualization@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvm@vger.kernel.org, linux-kselftest@vger.kernel.org, sargun@sargun.me, 
 jlinbox@meta.com, Bobby Eshleman <bobbyeshleman@meta.com>
X-Mailer: b4 0.14.3

From: Bobby Eshleman <bobbyeshleman@meta.com>

No shell tool can issue IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS, so anything
that wants to move the guest's vsock device from a script needs a small
program to do it.

It exits with the ioctl's errno so a caller can differentiate the
reasons for failure.

Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>
---
 tools/testing/selftests/vsock/.gitignore           |  1 +
 tools/testing/selftests/vsock/Makefile             |  3 +-
 .../selftests/vsock/vsock_assign_g2h_netns.c       | 45 ++++++++++++++++++++++
 3 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vsock/.gitignore b/tools/testing/selftests/vsock/.gitignore
index 9c5bf379480f..ffca0d9c34b1 100644
--- a/tools/testing/selftests/vsock/.gitignore
+++ b/tools/testing/selftests/vsock/.gitignore
@@ -1,2 +1,3 @@
 vmtest.log
+vsock_assign_g2h_netns
 vsock_test
diff --git a/tools/testing/selftests/vsock/Makefile b/tools/testing/selftests/vsock/Makefile
index c407c0afd938..d7170a15150f 100644
--- a/tools/testing/selftests/vsock/Makefile
+++ b/tools/testing/selftests/vsock/Makefile
@@ -11,7 +11,6 @@ $(OUTPUT)/vsock_test: $(VSOCK_TEST_DIR)/vsock_test
 $(VSOCK_TEST_DIR)/vsock_test: $(VSOCK_TEST_SRCS)
 	$(MAKE) -C $(VSOCK_TEST_DIR) vsock_test
 TEST_PROGS += vmtest.sh
-TEST_GEN_FILES := vsock_test
+TEST_GEN_FILES := vsock_test vsock_assign_g2h_netns
 
 include ../lib.mk
-
diff --git a/tools/testing/selftests/vsock/vsock_assign_g2h_netns.c b/tools/testing/selftests/vsock/vsock_assign_g2h_netns.c
new file mode 100644
index 000000000000..6f15629af607
--- /dev/null
+++ b/tools/testing/selftests/vsock/vsock_assign_g2h_netns.c
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Assign the guest->host vsock transport, i.e. the guest's virtio-vsock
+ * device, to the network namespace of the invoking process.
+ *
+ * Exits with the ioctl's errno, so that callers can tell why it was refused.
+ *
+ * Copyright (c) 2026 Meta Platforms, Inc. and affiliates
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <stdio.h>
+#include <string.h>
+#include <sys/ioctl.h>
+#include <unistd.h>
+
+#include <linux/vm_sockets.h>
+
+#ifndef IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS
+#define IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS	_IO(7, 0xba)
+#endif
+
+int main(void)
+{
+	int fd, ret;
+
+	fd = open("/dev/vsock", O_RDONLY);
+	if (fd < 0) {
+		fprintf(stderr, "open /dev/vsock: %s\n", strerror(errno));
+		return -1;
+	}
+
+	ret = ioctl(fd, IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS);
+	if (ret < 0) {
+		ret = errno;
+		fprintf(stderr,
+			"IOCTL_VM_SOCKETS_ASSIGN_G2H_NETNS: %s (errno %d)\n",
+			strerror(errno), errno);
+	}
+
+	close(fd);
+
+	return ret;
+}

-- 
2.53.0-Meta

