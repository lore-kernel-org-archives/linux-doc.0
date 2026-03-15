Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73E40DFAD
	for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 15:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773589324; cv=none; b=om3/CfVwss2M9IS+/YHEdMe616yVMV0q7zkhvXXXC+HJh2K89mKUz8pZiD/+GWCO4za9PpkkW1A5evjlfbEwAvyrYhbcqaLtIwT0xFso8OsClqVMdsOfRwMQreDOxk04rrD/yra0ZOsLfo5Qrfap/NQx8lZcfqdwS7HZsf5rhL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773589324; c=relaxed/simple;
	bh=mL0cWsvJPN0WPsxa4TVp11Y8J/h+tNQQaFBUywYRP6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AMOLMZn1/Qxz+EQufeQZLWLIoc9LQCcNW1192R2tB1lZX4QKWYfuSgsHkTiId+ni+FX7e5tmZz4S/eEFWKdMfkReXgtb8gNv83XSE3x85C5XQbPVAbfdjaL38DfFUlaRNYYrldueHjlX0YfMkjRHqj8HbbM1UuXjBvlM1t1gfX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeLnjviv; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeLnjviv"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso32808275e9.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Mar 2026 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773589321; x=1774194121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spmvKhvGdNHHwWOJecm1pD4yXwF2QcJ3DZJBOQGxfrM=;
        b=aeLnjvivVctwybM4Ha9CJK1s0HnA2OCSv91Qj0UvJWmImE/NGP/y76lxWHcznXTDx8
         IJj7Figuylc+KDIZhtyV2wJ+musE+JD/FGqL8rABBnLdk8r7JDeh3VdTUMfrrf5bnxx6
         N685/YB7a4WdaekkKniEVgFpP8SeqoVqTaU8kZ2zapRpLmHRraZ/S7Vc0dZGV4nkBWnH
         bidZqisl9Q9hWet8CIqB8VlH7KInMZsZeLxVqwiWDQ3sPn5Z4hcSrw3J+LLpOMO7ouET
         0NhPV4XaCpRa4usbMtTqXuhrcuOj2tZqD26/PWo5hOA4PQ935u96WskGm/NzYnm4o/sF
         4VNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773589321; x=1774194121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spmvKhvGdNHHwWOJecm1pD4yXwF2QcJ3DZJBOQGxfrM=;
        b=XWXJQTzPjatULTbhF8TB4zY+jQetF7Dn44D/iSFfv44bikLPld1X/15LuPGo6OKjeF
         GSXrpNJ2sj4x9vZv0O2I0ckA5xsHeu91E5uNQx0RFNManOYuEj8c+X6algYrqVhmdxJP
         mGuyAvSSt9fh0wzeQ+pXkiMQiHLhu4QCd2YUcGWvijd1mmCvPjd/SJ7oYObf19Sb5SeO
         HzE8Yh+8nrrnUQRZGvMDIvRmfKhLqrZSrgDbrGZiKnMhkc74+J8/T5cVpjw0kSDtbEZ8
         EA4eOYTtAAwgcqKFw1VvgI6OYHDktAR13qLVr6qZ1+QpzN5C/iW+rsBffu8edXZ/adga
         ettA==
X-Forwarded-Encrypted: i=1; AJvYcCWsB71yPfO6ytaMd94M6Zk7QjXkVuTqDoUy03u4p35AtzdPKcJVIHeBbEF64qK7h9pT1pX8pCH2GJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9gL/UOUs3O3hTS7BRLNQ2QNLr2UEHZeCnpLtEnLpYoM5WSuJ
	JMAGJoXps97W9bN6NPCpQdlNni0GUzR8d5Ls750Bh3RYN5J1mkQ2zjAP9n0O6GYxXgw=
X-Gm-Gg: ATEYQzzlQhEAvhe1CPeVgGXxdX5pjmNZYpxtby3ffBxIWWgJc5TeqBRjE6mJ3/P9+aB
	GbuCsg3YAg8cBA2S/WO8bIdye5MWAOIoey/TqXkNReGaWhUmyEfYYf1uI5BYMzMIhWSCAZS+Vj4
	01cjNrgRguBNXlnTUHdBs2F2ZGLyENk1ZbrTFe+2DKFBS0+BIRYK5u3s8A1kc7XwxfmRM02rCx1
	bn3EQXRj5+um9DmCLmBGwA843F3bN4erBAjZ5qfj32Fqw94/4MPzhJ5ifQLoy+BcXlsqF9p5xub
	7SoaGVZ4iqLFskCoTNVvJoDDWkoHtJ491X0s19UpBVXacP6XKaGmjKZ11Q5hh4pZgm8Kul9UO1u
	IwUJ0Q+UlDv7fteo0gRIevVDucDXEXMqtbfpf+PJalgJNXtunfV/lNwJTUj96H1gj2/F01xKtGU
	28LFTZbp/UhORd1M58n1h6VoqYraMVqQpTbOwmYBFIla6xXg6dVNBy3KN4JLk/W6F1td0VypI69
	lP5dsuCL0Ed9CHtzGic7/jGj/yz+g==
X-Received: by 2002:a05:600c:8b29:b0:47a:7fd0:9eea with SMTP id 5b1f17b1804b1-485566e314cmr165669945e9.3.1773589321132;
        Sun, 15 Mar 2026 08:42:01 -0700 (PDT)
Received: from DESKTOP-TILNSD1.localdomain ([139.47.104.103])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48557c7c514sm71047225e9.32.2026.03.15.08.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 08:41:59 -0700 (PDT)
From: Kit Dallege <xaum.io@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kit Dallege <xaum.io@gmail.com>,
	Claude <noreply@anthropic.com>
Subject: [PATCH 3/3] docs: process: fix grammatical errors in 2.Process.rst
Date: Sun, 15 Mar 2026 16:41:49 +0100
Message-ID: <20260315154149.49940-1-xaum.io@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix five minor grammatical issues:
- Add comma after introductory phrase "At that point"
- Add comma before conditional "if at all possible"
- Change "close to ready" to "close to being ready"
- Add article "a" before "more extensive review"
- Add article "the" before "volume can reach"

Link: https://bugzilla.kernel.org/show_bug.cgi?id=214931
Assisted-by: Claude <noreply@anthropic.com>
Signed-off-by: Kit Dallege <xaum.io@gmail.com>
---
 Documentation/process/2.Process.rst | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index 57fa8cac58a6..81dddf0c6ace 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -63,7 +63,7 @@ As fixes make their way into the mainline, the patch rate will slow over
 time.  Linus releases new -rc kernels about once a week; a normal series
 will get up to somewhere between -rc6 and -rc9 before the kernel is
 considered to be sufficiently stable and the final release is made.
-At that point the whole process starts over again.
+At that point, the whole process starts over again.
 
 As an example, here is how the 5.4 development cycle went (all dates in
 2019):
@@ -156,7 +156,7 @@ The stages that a patch goes through are, generally:
  - Design.  This is where the real requirements for the patch - and the way
    those requirements will be met - are laid out.  Design work is often
    done without involving the community, but it is better to do this work
-   in the open if at all possible; it can save a lot of time redesigning
+   in the open, if at all possible; it can save a lot of time redesigning
    things later.
 
  - Early review.  Patches are posted to the relevant mailing list, and
@@ -164,12 +164,12 @@ The stages that a patch goes through are, generally:
    process should turn up any major problems with a patch if all goes
    well.
 
- - Wider review.  When the patch is getting close to ready for mainline
+ - Wider review.  When the patch is getting close to being ready for mainline
    inclusion, it should be accepted by a relevant subsystem maintainer -
    though this acceptance is not a guarantee that the patch will make it
    all the way to the mainline.  The patch will show up in the maintainer's
    subsystem tree and into the -next trees (described below).  When the
-   process works, this step leads to more extensive review of the patch and
+   process works, this step leads to a more extensive review of the patch and
    the discovery of any problems resulting from the integration of this
    patch with work being done by others.
 
@@ -398,7 +398,7 @@ There are lists hosted elsewhere; please check the MAINTAINERS file for
 the list relevant for any particular subsystem.
 
 The core mailing list for kernel development is, of course, linux-kernel.
-This list is an intimidating place to be; volume can reach 500 messages per
+This list is an intimidating place to be; the volume can reach 500 messages per
 day, the amount of noise is high, the conversation can be severely
 technical, and participants are not always concerned with showing a high
 degree of politeness.  But there is no other place where the kernel
-- 
2.53.0

