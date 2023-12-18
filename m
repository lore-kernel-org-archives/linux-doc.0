Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E2F3FF4
	for <linux-doc@vger.kernel.org>; Mon, 18 Dec 2023 03:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IgNz2JSl"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d075392ff6so18902045ad.1
        for <linux-doc@vger.kernel.org>; Sun, 17 Dec 2023 19:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702870836; x=1703475636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rz8IcWFPrYshTIpMuCdGWLpKzFo5rZN3OabmtrFosFs=;
        b=IgNz2JSllyH7g39D72AVpAQL1dpnj69vxoFoyrDJ4MPXGC12zvSjQJOTj/pstbwegn
         8Q0e6te6WpxnOlkSsidg1bipoT6rje7CeW7KT096+/DVsdmQqhF4TGVxA0c8JUt3NWJ7
         4K37Z1mztxrOdo9Sl2xZUEZTCeE4/wvq2WemSArbUFy1v/HE651VypL3VcGgvyXwLN3y
         VLREUWn16adaN4q16kgo8O9rHlvVhr9FpZguZHi+D2M1mD3698KIe2KhEAE71Mc09BMM
         lQ3voR1HjYmnJG2/FE5XxD6qb0YtcA9qj/ZTsP9UQCwUqf5pVVZbUnNWIIMknGlCRsz9
         4b7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702870836; x=1703475636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rz8IcWFPrYshTIpMuCdGWLpKzFo5rZN3OabmtrFosFs=;
        b=soRMrl66+X6/BG0ThpMITcOsT7kR+UOhigwYljaCo4EHF5LmRLbFK+XcUb6QrVSwAF
         kCIHouI8b43YwcUyVKcihmHN0HSy+Uv0ZW0eftMF181Q20Fqats237z0tehFnDl9LT0P
         Fkzy+q3ycpg+s3FtX2oX9t8QMAuzVTSfy/+QQ3b3wH3oiodOhEJaxprGgqS0EoYOrCwl
         rEM+JPwsx4UrpEBqObcrdyFSKG/JYXnd/y1osk6yM0mOxeefx0JqNW42oMq9R9EdLs3y
         4jHIrdFRvZEE6YDOitJsCn4mAQD0Yg/jWN43WSeVmFmPZDhPUkRNky5SxlLCIxhIrasI
         32Sg==
X-Gm-Message-State: AOJu0YyR/LuDPh8ymN35xFE9weLIV3V/+xzVRry+DmcE5gL6KY+BMF79
	MY7i8pbywtmmBjYJSfVTfg==
X-Google-Smtp-Source: AGHT+IFahCfvx1/CbJczzX01ofVsrnySeJPh7YvA2dXKNATCrPA4pKLR6p82T8cydA88fmMHdz/nhA==
X-Received: by 2002:a17:903:32c5:b0:1d0:6ffd:6118 with SMTP id i5-20020a17090332c500b001d06ffd6118mr19113719plr.58.1702870835855;
        Sun, 17 Dec 2023 19:40:35 -0800 (PST)
Received: from piliu.users.ipa.redhat.com ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id x5-20020a1709029a4500b001d340c71cc8sm8557804plv.128.2023.12.17.19.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 19:40:35 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org
Cc: Pingfan Liu <piliu@redhat.com>,
	Baoquan He <bhe@redhat.com>,
	Dave Young <dyoung@redhat.com>
Subject: [PATCH] Documentation: kdump: Clarify the default size of memory reserved by crashkernel low
Date: Mon, 18 Dec 2023 11:40:20 +0800
Message-Id: <20231218034020.15341-1-kernelfans@gmail.com>
X-Mailer: git-send-email 2.31.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pingfan Liu <piliu@redhat.com>

The default size reserved for crashkernel=,low is decided by the macro
DEFAULT_CRASH_KERNEL_LOW_SIZE, which is based on arch.

Signed-off-by: Pingfan Liu <piliu@redhat.com>
Cc: Baoquan He <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
To: kexec@lists.infradead.org
To: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/kdump/kdump.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kdump/kdump.rst b/Documentation/admin-guide/kdump/kdump.rst
index 5762e7477a0c..a021ff155012 100644
--- a/Documentation/admin-guide/kdump/kdump.rst
+++ b/Documentation/admin-guide/kdump/kdump.rst
@@ -310,8 +310,9 @@ crashkernel syntax
    region above 4G, low memory under 4G is needed in this case. There are
    three ways to get low memory:
 
-      1) Kernel will allocate at least 256M memory below 4G automatically
-         if crashkernel=Y,low is not specified.
+      1) Kernel will allocate a chunk of default size memory, which is based on
+         architecture, below 4G automatically if crashkernel=Y,low is not
+         specified.
       2) Let user specify low memory size instead.
       3) Specified value 0 will disable low memory allocation::
 
-- 
2.31.1

