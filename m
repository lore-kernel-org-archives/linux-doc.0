Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA1B231C91
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531116; cv=none; b=UfrlpYmCkqShw+hbDG6vaR+4n0t7RFZoZxDEVlSVqKzXva9gI/wikg1JOwC2lBlhC0b5yRdNDFTvlNACEDw5BWXX/1v1khKJVmSaTCkm+juGkRXdnhmsdApxVwNodOFd8idjSvpnPyKrCuKcC0zSYwsAR3Ay/wNqpFfvQlyMVzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531116; c=relaxed/simple;
	bh=6IaJ4oC3HjSKXEwPPmdg9sH4w864pWwsUqoUlC5zX5s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=grY4owH3lXnMLTP7tS4eJgkWv7wwogmYSArG9ygeIYfAeG3x5sVJ5uFqUkNmxzW9V4BxHELvWhHT7L/9F/AHXXyTRUmnk1duLm/YbaK8GKqDBzlR4c89wGUAyE3JXSbLMVVLll3XvDQExl1xPJ7Rapm5SUuGWTj4v80Cg+l/P5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gF8WDCKl; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gF8WDCKl"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4b0739c6557so7727851cf.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531112; x=1755135912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5k1U17r+PzRIJkOEWEh69D1nNoyfvJ+I2xTfX4gnP+M=;
        b=gF8WDCKl7lSirbpvxjc3A32RPgzd74XttEyW4Jsd9Z6qD9CFDGpLG0/QILyXXGq6vT
         VNiyCx4dGT1VKH/hnutlzijUDovc7kjUOthswMqgzUg1ye+DZ9jMuMRg7DCDA2CTqT36
         cqA1XAcrRYZQQP5shvw6qmosaZrxu3hSUJ61vheEB1frWbRQe6P1R1THj6RnxhCYd66A
         TXgv255p0lm0iYpnnkQFZawB3cQ7QI+W2N5gQdE0oZ0phIA4xiZYLXMr0rvTH9shEj83
         HIR5EtNMEaKq4fn5+hGPW0phYNTQd8bTCRTPCrSm4Y26aOQAFJYt0DjVae44Yr0gYQsg
         AgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531112; x=1755135912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5k1U17r+PzRIJkOEWEh69D1nNoyfvJ+I2xTfX4gnP+M=;
        b=oYtpF22Z6lESQO90Ihu0UbanmXre8G6PBqeCrPrNolt4PoT1ogzjhdZYc69Du+jGQq
         A+0dhbM5y6yeFSSY+bqB+VvOx6TfzlAFwg1C1kReStSAQyLO/qTdz5ssuzUzXS44qYXr
         xDMMGddbMxj6x5sCU2hgdBppV3Emt+DDMUyK2iutsimyKe53DJbenC79fS6Xxk+TFPZB
         vyXsZz/jFKsjrxpec2AQsaRHsMUM2Smb/Xf0JPNYg+yktm73rmKZrvOSHRHCJjtnGknD
         S91CCkIerEOlNKvJxPs0IKbuIX4V70aGiD60KWNqhsmdUbDQfdx5Fn4JTQgoCZ9aVKQW
         BG4A==
X-Forwarded-Encrypted: i=1; AJvYcCWm9UpRpZFIibXlbDeQXkGF2FG2DXpyUrj2un5vrCYo4XPDP0aU4qAhBw25wkcqH6CE2pG6YJQlxQ8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiUGclJE0GeOjBKKfwiYSQ9B/a4eLj0ias8qIlkc01rBker63w
	lXf4vmJJ3Q80WNOooh/gDwFlcAC2vBhEZr6jdPg/piMDWZRxV1k5gzmCQFRvX8v6cOg=
X-Gm-Gg: ASbGnctgpJhbRTwrhgroKUMfUc6GPPXu+FbKMG6kOr81aZLBb8JfYlavo49eMTGEzTx
	Qmm392xZd8WdZKLU2Xfhv4RqdWwd++TMdZ7jrNzLs0p9Qv3SgckJI5YV5FFPq5si68tl5/bWqK5
	VGwh3+M0xwq9lJBBJp27Tc5GKQQsXVVCThuowsR6vQo/ZtG+q/emGCOvSHXpZ8RXEPk1Qv2lrvS
	gxV+GEFJPXLaSV6+ENGy8s52uxHq6oMZfgfIm67IRjhUlcVZpL9bfk1OdzjcM/DzNhgEP2Ul9vU
	LqUEy2p/bOFmwZNEdUgY8c2n7sm5yAe/Gy4HcUO2MaxvCWjCnXpB1asxUOv7tb+zXCt4sXCp4pL
	nQkIU0xs20/jELIFPbhZfhWZcvZvnQ85u+NkCHDmtErKfQRQ+1CG02VHiBQ27RBSceeb1Gzk3zd
	9auYGczFhsIPb+JEL7I1gCWXs=
X-Google-Smtp-Source: AGHT+IFGhloL5+wAzqGLxdMTz2N8jTfQVk0LrudTV42eJiPSBl97ww3SO5T1gQQT1i9NRyGQ/H+ydQ==
X-Received: by 2002:a05:622a:10d:b0:4b0:7e72:9f05 with SMTP id d75a77b69052e-4b09157a420mr93793331cf.29.1754531112392;
        Wed, 06 Aug 2025 18:45:12 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:11 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v3 17/30] liveupdate: luo_files: luo_ioctl: Unregister all FDs on device close
Date: Thu,  7 Aug 2025 01:44:23 +0000
Message-ID: <20250807014442.3829950-18-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, a file descriptor registered for preservation via the remains
globally registered with LUO until it is explicitly unregistered. This
creates a potential for resource leaks into the next kernel if the
userspace agent crashes or exits without proper cleanup before a live
update is fully initiated.

This patch ties the lifetime of FD preservation requests to the lifetime
of the open file descriptor for /dev/liveupdate, creating an implicit
"session".

When the /dev/liveupdate file descriptor is closed (either explicitly
via close() or implicitly on process exit/crash), the .release
handler, luo_release(), is now called. This handler invokes the new
function luo_unregister_all_files(), which iterates through all FDs
that were preserved through that session and unregisters them.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_files.c    | 19 +++++++++++++++++++
 kernel/liveupdate/luo_internal.h |  1 +
 kernel/liveupdate/luo_ioctl.c    |  1 +
 3 files changed, 21 insertions(+)

diff --git a/kernel/liveupdate/luo_files.c b/kernel/liveupdate/luo_files.c
index 33577c9e9a64..63f8b086b785 100644
--- a/kernel/liveupdate/luo_files.c
+++ b/kernel/liveupdate/luo_files.c
@@ -721,6 +721,25 @@ int luo_unregister_file(u64 token)
 	return ret;
 }
 
+/**
+ * luo_unregister_all_files - Unpreserve all currently registered files.
+ *
+ * Iterates through all file descriptors currently registered for preservation
+ * and unregisters them, freeing all associated resources. This is typically
+ * called when LUO agent exits.
+ */
+void luo_unregister_all_files(void)
+{
+	struct luo_file *luo_file;
+	unsigned long token;
+
+	luo_state_read_enter();
+	xa_for_each(&luo_files_xa_out, token, luo_file)
+		__luo_unregister_file(token);
+	luo_state_read_exit();
+	WARN_ON_ONCE(atomic64_read(&luo_files_count) != 0);
+}
+
 /**
  * luo_retrieve_file - Find a registered file instance by its token.
  * @token: The unique token of the file instance to retrieve.
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 5692196fd425..189e032d7738 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -37,5 +37,6 @@ void luo_do_subsystems_cancel_calls(void);
 int luo_retrieve_file(u64 token, struct file **filep);
 int luo_register_file(u64 token, int fd);
 int luo_unregister_file(u64 token);
+void luo_unregister_all_files(void);
 
 #endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/kernel/liveupdate/luo_ioctl.c b/kernel/liveupdate/luo_ioctl.c
index 6f61569c94e8..7ca33d1c868f 100644
--- a/kernel/liveupdate/luo_ioctl.c
+++ b/kernel/liveupdate/luo_ioctl.c
@@ -137,6 +137,7 @@ static int luo_open(struct inode *inodep, struct file *filep)
 
 static int luo_release(struct inode *inodep, struct file *filep)
 {
+	luo_unregister_all_files();
 	atomic_set(&luo_device_in_use, 0);
 
 	return 0;
-- 
2.50.1.565.gc32cd1483b-goog

