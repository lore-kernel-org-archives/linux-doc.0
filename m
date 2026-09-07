Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E83238CFE1
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 05:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788760743; cv=none; b=knMLgfklSiN777gEaLEV7HH5O6WU4dG85Ms1R72UJkugmEVRy5kC071jR1YrsoEELL1eNodpCU81aL5XnmA5PCQuR/Qk2hhyiQrdYgy6498IHdZtL7nU4mmL5fY/PTRbzuPPlRwCqVegWTytItGhhqdZKu3UJhRKhOh8nwcY+3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788760743; c=relaxed/simple;
	bh=8u6RWBOwh83tvvZc3TLwaNX9CvVkv4tyJSo+YHIMMYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eIwEnbMa0DzuOs15dJhwEhTQgvJxFGNNAEWMlYTC2b4uwQgn92X86C14p8K2t3gmON7C636W8QunTm7NIfNl+OxcZ5E5DxuJeyMA9vYJFJGHjBETl5XHccJHYXX9CBaFYtGNn86DQe4rSnt98xt6w8dhDoS5Lh0IaKfHE4zwEJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jZuQL3cf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jZuQL3cf"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso46808705e9.2
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 22:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788760740; x=1789365540; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GZO1sjKeCa3nKTO3K84gQ7ryyzwmNZ3acfbok1I6tKA=;
        b=jZuQL3cfGj2saBmHeg8kujPA/7EMOHotqYz0/bdmRVwaTrfXm4HRKx0/04K5TdlkKG
         FN1fBc5DwKzftmOjzfZfR/PR4mQKOXL9b71Q6vOLeIWm+nYHAXNlhkL0PvF4C6cQBcWD
         6jk9RSwPNf49VLb7JJskzuIGhAhHX9s9QX7NZiE3vdGVuLbss8sIBFQNa2uVrk4aAdfv
         R8Mmnfmx4pciJNfMAf7V8BdsfTSCBOLXVWYXEtmnHqFBcM1IzwtYDF2QL1gp4L8td6As
         reiySdVv4O5hgr63TcON7tJx9KjFn84G4/RiCMXxBYsh7u8g1JDFe326Pyrliuq2QGAW
         7b+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788760740; x=1789365540;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GZO1sjKeCa3nKTO3K84gQ7ryyzwmNZ3acfbok1I6tKA=;
        b=YqmxmstYnnFdZFsB0dvA+cUxMJ35bpW1IMJg48gCyoSPLglHgH3Ed7EHNuSJLft4gX
         bNAe4gSoHI0Ay4WefP94GwJ/4hDDqfLgch9q0RuORXsSbmEkjeKeHHQ5VWP9867Y7ksd
         8grIG71/G3cB+591nB5iGO/+YKgHE60Y1HbkEKQF7lUl1XFuo8SSAzjVfQzI25N1hMzZ
         WQV/bcKpVKEkly1a6i8wOAM4bxLWOhQYc8bcBbefyVKTBgZECBb/aRTiAOCV2CXm4MwS
         DdRnjTydORBnoCsAdyjljRe3ewHDgpJr+xKaDK69vAyZOAmRM+3QG3s9iRMZUzCvi80C
         ARZw==
X-Forwarded-Encrypted: i=1; AKwUvBy3t4CcorpaFA1IoW7FohmwZvJcX3V5sxCHjxcxjVhi1oYfsNvDbfuWwaoRfzGS6p/dTkvjfXj1DPU=@vger.kernel.org
X-Gm-Message-State: AFuF++mU5jYI07Er/jnaLsec9iNRT7g0uGNtdyokgcjGaw2h1IysYww+
	/0rMIz6gk66jRE46QDh6Mk82H/FTBdmSG7aGpQcqyyphs+OX90Zr9cxM
X-Gm-Gg: AYBFou0HJCdvEy4SrXon3S0s9zrhjqlXok7pp38Jx5W0UIb2KwvX8XAEjh2k6eni7e6
	Hl8nj1FpLo/xCAtWQxXyCBVlSxTvTh+9GUNWfA+krcPtPcZyR8Ws3Jb1GqL+Ybm9KtPjlDO3yK5
	P+b1yBmye+Z8QosG7675049PXpuSprYd9LHMRqA7T+VUO+Vbf4HykRqOvQPVrvhNVKNkqKBMqr2
	10lrVl1zfyNO3Fiz7ZSClczz5lRnqBFalO3TrXP2/kx2WpShYswrqSifytL4ybR8tZKi2k5GnyI
	LffbfKsxOolahilbaWIX4AZF6D7o13paAnN3/E4v8EhkpRfU2AgfhsTeij63b7bX+Tz5WZ7WzAl
	vXF5SaHItE1RyNQQ9XU/953ee8L0S+Hz3bV0ku4keBYkLogEFOCEcLeEeYgEDSBkaQFHdxMlN6+
	/CfRIuIumNBMGccRLOrn0m/DSH05OcECyiwa2G2PfxCG1udzqNAx8+cNg985VV+Oltpziy0/H7n
	Pow/W3IFN4u0aby+DkEJNA6UoesTbENEoKxfIAuBDAlZikWxqYf5F2GfjO41hTREMEb5NIR7QAd
	aq56c9vPPsiwBcfrsdxLrT+CSFVrmpcNlDRgGespv/sa7c3grrpnfeiKqmyAtKLu81L/3Tx9
X-Received: by 2002:a05:600c:5303:b0:49c:fa21:1c85 with SMTP id 5b1f17b1804b1-49cfa211d81mr158899595e9.26.1788760740303;
        Sun, 06 Sep 2026 22:59:00 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b0c9-3601-9daa-d59e-970b-f46c.310.pool.telefonica.de. [2a02:3100:b0c9:3601:9daa:d59e:970b:f46c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee80eda4sm362494915e9.15.2026.09.06.22.58.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 06 Sep 2026 22:58:59 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>,
	Gerd Bayer <gbayer@linux.ibm.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Pierre Morel <pmorel@linux.ibm.com>
Subject: [PATCH v2] docs: s390: pci: Fix the sriov_numvfs attribute name
Date: Mon,  7 Sep 2026 07:58:47 +0200
Message-Id: <20260907055847.27992-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The attribute is sriov_numvfs (drivers/pci/iov.c); the document names it
sriov_numvf, which does not exist.

Use sriov_numvfs.

Fixes: de267a7c71ba ("s390/pci: Documentation for zPCI")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: name the file that defines the attribute, drivers/pci/iov.c (Randy);
    Reviewed-by collected
v1: https://lore.kernel.org/r/20260905091627.40946-1-kmehltretter@gmail.com/

 Documentation/arch/s390/pci.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/s390/pci.rst b/Documentation/arch/s390/pci.rst
index 80f4ba193159..565434626fb5 100644
--- a/Documentation/arch/s390/pci.rst
+++ b/Documentation/arch/s390/pci.rst
@@ -67,7 +67,7 @@ Entries specific to zPCI functions and entries that hold zPCI information.
 
   A physical function that currently supports a virtual function cannot be
   powered off until all virtual functions are removed with:
-  echo 0 > /sys/bus/pci/devices/DDDD:BB:dd.f/sriov_numvf
+  echo 0 > /sys/bus/pci/devices/DDDD:BB:dd.f/sriov_numvfs
 
 * /sys/bus/pci/devices/DDDD:BB:dd.f/:
 

base-commit: 986c24e0fe44f844b44d365b71ce831947f50298
-- 
2.53.0

