Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6392222B2
	for <linux-doc@vger.kernel.org>; Fri, 30 Jan 2026 04:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769746906; cv=none; b=o2Qz3a60lwVKlLMCzixUQuFYLQx4b4HkvTG16iCkxDu7VU4Szuc2f0ll+O7bwxMMGoxtDfK5mjCatTM9Odpe52uko6w5Fa65zTV2Sd6+iofj+/vyiJk1s8BZYQcDCFill45IAphj8zdTv7V5LIJWG+xajClWqHLVusgV6tb6OOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769746906; c=relaxed/simple;
	bh=CYL4AfP5NIYabfXAY3UHwSusYN/W7j0M4uqwhQBmPS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JMfiAveKBkKkyW6FAbD07O4H43inP8sGdZrGulhN/6cs6yrPmsw6yx1uMaLK381x58udNK9atjCNd9/4Q8KeH34zcoktTFmu7sMmHUvFMSsJ0R+QkSqdvAQH/O8rtrciWY5hrd/Ig9r/7NDNp33EbDMwYp98MN0D12Qx+xFSjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cIdaWqR8; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cIdaWqR8"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfcb5b1e2fso967922a34.3
        for <linux-doc@vger.kernel.org>; Thu, 29 Jan 2026 20:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769746903; x=1770351703; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gki1vS8bTtNa/7DENC2lltOwIakLJODhHuPRufCBB6E=;
        b=cIdaWqR8aIr1Gxwx/x4ZeIF5Bb+2w97AGUBUFVr8LXhza2KNM97S9QdrOHyeKkcvPH
         twfI5dYaifh445zCWVdCkHWT+dgi6j0tw87gBjINW7cDbstf7E/1qZcZQiPQH0Ai7K1y
         PJ81hPYpPclwQyIAtixq0zBh5vftXdPc839NnpFcxx5xFMEE700JO113aKeb3JpIE6Vj
         zQDzTLsTPSBMXsa4KVyOSd4+b08PMbJJxb+lIyKjBdhScYb0cmEcGboAWUSxXwtWdl6O
         4izWR9WAKcntiibS1C50+goXMlnyFyJm5FMFgEFeDF0UnR0laEMLKVwOgrnKBFXlsKch
         fDLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769746903; x=1770351703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gki1vS8bTtNa/7DENC2lltOwIakLJODhHuPRufCBB6E=;
        b=EPk1C861rCxhLVq1oHqe3A8s5DZkFm1wUuA52tfk0RItV8ofVfIuwS6qgd4X5kPSBP
         rqD5Bp9QON1w1kpE1A+hzCB33yjStwm+kDp+K73ziRZ5WR5Uqzpd42grU+BhxOGWyL8I
         OBqrmYtZk/DjLm/2CoX0+pOD/oldigZEHGwufAg/pHHgUDjn6piDcZ5kBm069JtqCV0n
         8YjhPkJQejtN8TMpdkd3gkAwkkgk1QTtKRu/RwNTwFXHBWAvOFPfknmB0DfYdOHQIJc8
         GANs7xU2GVep4i/ZK/5AJDeZb7Q0LZo4IR742/LCo180kfDrKsP5nbavXP82mg5SacoD
         sajg==
X-Gm-Message-State: AOJu0YyqgH3fwaykW/s/Ve5m9gMwYlx48CeuDo/6vuLuouP0AgWr1rCJ
	KtAG4DNV2LSD+yBqmf2ogeP4OVCuXV3n1t9JoUgJIGhvbbJystcZRb7dMzrl6Q==
X-Gm-Gg: AZuq6aLwb7ylnniZV3yrEisawn1WLuqfvu3hqwo63njNAUI/5nk//gCiGqYmmIBO/Dn
	iJ3ZitNWp+WZDWBkoVGRLxhHZngW3/UX/tOEX6BfVmvdtSzMebyyH/4bw6Twue4yqZ4bUjpynVX
	ePXy2NGD5zue2yWOXLGkICRthfYJq2qlZV4AWfONOoGPEre9TsMDafMZo8b5QzGN+/Ishp34Vm8
	jscBWiSERRNanehsf5F486bswYBP8ovjYeZINKYjAQWcTAYKMwKxNqgcmhVhk6VEl+IBRk6WH49
	aXXLQUxAsWdoOWGvDaDDpdBsn1SPV3dLucbTYWghr25UNCYXyPZD5FSylJxGcBeLU8hEwwOUURL
	JCZV1qszNxtVbHAXIlZ8qKbHGeUqJuJEnvPsyGsFYwrqTtN927eEACSgSveRBfQubDP+OWme59a
	7QgWv2EXUy56i2ESlZ72c5RCN216TneIaKOUf4AfXlEF3rjJBO5hOyhnd1XwA=
X-Received: by 2002:a05:6830:6abc:b0:7cf:e60a:f67d with SMTP id 46e09a7af769-7d1a52e1c8bmr963157a34.7.1769746903221;
        Thu, 29 Jan 2026 20:21:43 -0800 (PST)
Received: from gabes-framework.lan ([2607:fb90:cf21:856f:6fcf:9837:4067:b678])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d18c67100fsm4995020a34.3.2026.01.29.20.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 20:21:42 -0800 (PST)
From: Gabriel Whigham <gabewhigham@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	Gabriel Whigham <gabewhigham@gmail.com>
Subject: [PATCH] docs: ioctl-number: fix a typo in ioctl-number.rst
Date: Thu, 29 Jan 2026 22:21:31 -0600
Message-ID: <20260130042131.51975-1-gabewhigham@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"userspace" was misspelled as "userpace".

Signed-off-by: Gabriel Whigham <gabewhigham@gmail.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 7232b3544cec..b5c6447455fd 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -15,7 +15,7 @@ macros defined in <linux/ioctl.h>:
     ====== ===========================
     _IO    none
     _IOW   write (read from userspace)
-    _IOR   read (write to userpace)
+    _IOR   read (write to userspace)
     _IOWR  write and read
     ====== ===========================
 
-- 
2.43.0

