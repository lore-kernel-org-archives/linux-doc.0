Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0154C1E0B72
	for <linux-doc@vger.kernel.org>; Wed,  2 Oct 2024 09:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727862594; cv=none; b=ON2lRDeyvrd678vci3ddHffL+AiO1VwyWKIsyjFGRZiFDKrGmQm4OVhKrs2NENH+JJgE9zltQsqrac2VnNwpVn0mbCLa2toVmS0GFRcWU8DJac+dweInCuC2+Ji0SONlF9OPSmHERTtdZGmQodqTZCJ35MZDhbqLfv8o1MPbfmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727862594; c=relaxed/simple;
	bh=1dDFjmKMO9vrCcacLIlCS/mDYkAo7OR0HjtA+XBKwxM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=M+VyCS82sdxNdsK8fB40CHY7J/Kwa1DhZ5jwsxVVGMsUxRPss/jJH0GM9+5YVaJlLn4mD6JkziTq/QPTPizspPR6Fw2YdzADnPkcoW0h2RQdRW6/D1BF6IWgxjpOYeov6fo14k4ypgP9nPNLY6n65C7kXdcbXyT/hbAVkD4EGHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KUqL/7x1; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KUqL/7x1"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-71b8d10e990so3178327b3a.3
        for <linux-doc@vger.kernel.org>; Wed, 02 Oct 2024 02:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727862592; x=1728467392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tnihw3sb3VGmUZFwHxGrK3Lpf3WXe1bOQ5reZibKIGo=;
        b=KUqL/7x1kGeKY37KP+e4ncu6uJNXKuHoHyaIo4GcSC664MSFk1guxfGHjXEMk0P6ow
         TyhTPbDzKZgwaTBTSLjWSjAeU+dMcA6PYif/NTTXE3WW95Jp4ZT0OhtKi7wKa12Book3
         s5Eau90bW9QS9PpX15crSrIelXlam0Svc5D9XUdZzwB9oGMWkEQWEaDIde+aqFPdD3KN
         URopOoX6iFgWLrGwVf6vyTRbh3fHFpDPV0Hm6iPXcZkFxbv/D25QrMnBxQlKNOJAreyM
         eDs/fCkUhkkaTSvQqG/mS69FWDWBgL7cAGn9NgiFoxmHpR8Qtk5KpFtILlgop2FeyYa3
         qyFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727862592; x=1728467392;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tnihw3sb3VGmUZFwHxGrK3Lpf3WXe1bOQ5reZibKIGo=;
        b=g8IaLgF90xH8w3uPe/thJMqfGypV3hLN//ksjO1jgvT+mnZY+hTB09vcpfOIrdqnxz
         O0DYJbGjou2anw0fchBaOJfSYfvmWdxKNiuUZvXLh/ij7zyWY5NmkpUtT6zgVb5vob3E
         w8dShjltb7C+U4V9BASA4qfaQ5NVxi+W/LZJztyc7N5wlcJdXIMLSRuxrDgJ/D5G0Uy2
         5mC1o9AXf1X0teyMfbjSi+lYVxFPUuKtvq0TUYf8+P3aDjdikDPUVZ5LP2t1UGeIRY4v
         9x3BNKfGaONUWNzFTbyL9+QCPNk1GapQuX29aiTS0qLAlJsbg++TmXee1cqtdAg9Nus3
         T68Q==
X-Gm-Message-State: AOJu0YxTnvP/BLDN1TjntNVJ7nge/a3vlwWOQ9zdSobIkV9ZQmtFV7I7
	WO77hoAwgc4ZaPwYbiKl/Pz8EHmtoAJk8jSHll493a7K097bc9mmQ/a86cJjdE9b8A==
X-Google-Smtp-Source: AGHT+IGlstoxziNyyA3CxGvU8FbKI2ebLTHoEA+l6SJ79nXW0FohJOxUzWVjDM4rFl2XiK+k4SrRFw==
X-Received: by 2002:a05:6a00:170d:b0:718:dc17:3b83 with SMTP id d2e1a72fcca58-71dc5ca935fmr4613007b3a.16.1727862592014;
        Wed, 02 Oct 2024 02:49:52 -0700 (PDT)
Received: from BiscuitBobby.mec.ac.in ([210.212.232.142])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b2653717esm9400460b3a.204.2024.10.02.02.49.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 02:49:51 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-doc@vger.kernel.org,
	john.johansen@canonical.com,
	corbet@lwn.net
Cc: shuah@kernel.org,
	Siddharth Menon <simeddon@gmail.com>,
	apparmor@lists.ubuntu.com
Subject: [PATCH V2 RESEND] Docs: Update LSM/apparmor.rst
Date: Wed,  2 Oct 2024 15:19:40 +0530
Message-Id: <20241002094940.55644-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After the deprecation of CONFIG_DEFAULT_SECURITY, it is no longer used
to enable and configure AppArmor. Since kernel 5.0,
`CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is not used either.
Instead, the CONFIG_LSM parameter manages the order and selection of LSMs.

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 V1 -> V2: Removed historical information and addressed review comments
 Documentation/admin-guide/LSM/apparmor.rst | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..47939ee89d74 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,11 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+The CONFIG_LSM parameter manages the order and selection of LSMs.
+Specify apparmor as the first "major" module (e.g. AppArmor, SELinux, Smack)
+in the list.
 
 Build the kernel
 
-- 
2.39.5

