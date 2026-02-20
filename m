Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C94B346E58
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 13:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771594205; cv=none; b=nVD5QNMYaXo6I0/dvaprY1vOTwX+ioE2BRh9nsTfkSoz7YI3Hs0CMRH2efo8gJq48vuZgfUB4GClADTqDk4uyEOujbT9GIuW7hTB4UPDpPwlE4rjUMSeavHwr8Kojxh2dQefz6753Y3Uj64e4zY1jitISK/c1New9gt8LxKYubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771594205; c=relaxed/simple;
	bh=LGPe+usfcJCKf/UAlz7Wan07KA1SbhndzIWG9nbBskM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iH4PrG8HBJkfAEDzZ1x9QUfMQvcLkzv0DBQYxSPANMrmA1gQ0m/93LQIJErtdug5caD5/GGnUH+PSOH8GWFnf1+A6Kk5DibU/cCG/4QIBG3h3K891kV/j5VShTa6yOsk7mAWgtsLA0kZFQw9TMpEeEYWEZS6td8a0yhZfPZV2iU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SiJFrT/k; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SiJFrT/k"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-c54f700b5b1so1326019a12.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771594203; x=1772199003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0o/RmLTUMvz6io+AT/DPftRCk0iXRLPXeaFhwBdO5I=;
        b=SiJFrT/k6Yi5dOd8e7opIncHECRsXwfXsaF5A0G8duyyom8krpgdWJIt7O5LG5rI0I
         VnDAoKyp3/R1J9JsuAThGfz1v96J0KMxVTcFD1cWQzH6h2cRKmxq5pmGS42LIaTK21YQ
         +Xdp4DxDN1+XiOf37oxJfBfS0q3c/Ncs3q94fhzZNknqYg9aqJMv0ak864gDTBB+Jrdm
         DFODLuk4HYNPV9AG7rQG5FqEd4VfOUrU+mg+NdpZDRt3p7CBGyVmwTeBv2XwHF1bEhux
         MnHtFRLGWy4uAIe/dqsoRL6a6cdlxrHApT759d0lj+5IUI4IlwGmXpwZFBmTuA+n4Ow0
         nUAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771594203; x=1772199003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0o/RmLTUMvz6io+AT/DPftRCk0iXRLPXeaFhwBdO5I=;
        b=mHZ6RL6AsOduRKDZWzGjSdU+bLw4ZYtEkWQ6O/p+5puqW9xK+3pOtSSfM4Ah2AglOx
         ohIzZkmYEWckUm8bxjeCM4AvMwLVf5JCUHBhFgNSYsgoSlRotNwvk4ysNmMpEh8kvku0
         CGwnkYVRjU5Q1NrxirFXHi+r8k+CAVww+otmf5iHpsdD6z7uye4gHioy5q4X4RuALZnz
         NE2+i33uKNLLSCvSlSK4v+76/2Dt0/ck8l7heesi3RCHseeiOegiDpLg2GEEa+c1KflN
         H0oWuGV5Moo81hHSVfNL5GAweb3d/yozQmOkkVz8uw2AAqDPihe06QRbqx9Zvc4GcoTN
         ku+g==
X-Gm-Message-State: AOJu0YzIPVsoUSJnBHmSFne5OObysRPp8bXGT53h1V0TSkLSO4oQMSZ1
	n+EAgKZd9Um0HPsoDOv23+lJCq8xf0U7RF7oFNLFZ77f7B5/aDa3faknpoMKnvbqm4I=
X-Gm-Gg: AZuq6aITfrQPc3reSUNRft9alxR9pA8nV5ixZMqvCYKNJm+FJ4RgXk+UCnEXk3HeWxd
	JBSqgfwgXoe8SfhMc9um6AAwMAvKoVrrreXkzeCiwueOmW1wf2r6n18NKhQ/X5Q4UGkWK4ZgCWP
	uwxIYatYPfTDs+0t3Dtvp119MTTovCwTafS2LJTcqDGb6LSaSDl0WaQv7lrzqc/19gYqaKg4lrz
	4jX3TBdmluwqUkDHbuKFL94o4o54NeAoU/EctzVYjfnJ4QBQejH/TUMuoOmvfaC8cpYXWRKX6Ch
	aLp1OzhKvlnN05gRT902Da7ZD1IyOfPcNhXe03DymiFKYjlrKzeYp+Vel4JlM59BZdZJdZZCQTJ
	WNeDuSyQCG3gh2J8NNkKNZgxZKD3b74RWUlMRnQlaDsxnC3J4n0fCViBn64HRqqim9oSozX9GxY
	9W65jK18OaAJOOCaGiLwNQ61DKMJIOwMJvDIA=
X-Received: by 2002:a05:6a21:7a4a:b0:394:5ae0:2921 with SMTP id adf61e73a8af0-39483aa0b89mr19127593637.62.1771594203427;
        Fri, 20 Feb 2026 05:30:03 -0800 (PST)
Received: from localhost ([103.251.247.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824cc22f4d9sm21119904b3a.39.2026.02.20.05.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 05:30:03 -0800 (PST)
From: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
To: linux-doc@vger.kernel.org
Cc: greg@kroah.com,
	Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
Subject: [PATCH] Documentation: polish Executive Summary and Intro in stable-api-nonsense.rst
Date: Fri, 20 Feb 2026 19:29:09 +0600
Message-ID: <20260220132910.9645-1-islamarifulshoikat@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ariful Islam Shoikot <islamarifulshoikat@gmail.com>
---
 Documentation/process/stable-api-nonsense.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/process/stable-api-nonsense.rst b/Documentation/process/stable-api-nonsense.rst
index a9625ab1fdc2..120c10ec2ab1 100644
--- a/Documentation/process/stable-api-nonsense.rst
+++ b/Documentation/process/stable-api-nonsense.rst
@@ -17,7 +17,7 @@ kernel interface, nor does it have a stable kernel interface**.
 
   The kernel to userspace interface is the one that application programs use,
   the syscall interface.  That interface is **very** stable over time, and
-  will not break.  I have old programs that were built on a pre 0.9something
+  will not break.  I have old programs that were built on a pre 0.9 something
   kernel that still work just fine on the latest 2.6 kernel release.
   That interface is the one that users and application programmers can count
   on being stable.
@@ -25,13 +25,13 @@ kernel interface, nor does it have a stable kernel interface**.
 
 Executive Summary
 -----------------
-You think you want a stable kernel interface, but you really do not, and
-you don't even know it.  What you want is a stable running driver, and
-you get that only if your driver is in the main kernel tree.  You also
-get lots of other good benefits if your driver is in the main kernel
-tree, all of which has made Linux into such a strong, stable, and mature
-operating system which is the reason you are using it in the first
-place.
+
+You might think you want a stable kernel interface, but you really do not - and
+you may not even realize it. What you truly want is a stable, running driver,
+which you get only if your driver is in the main kernel tree. Being in the main
+kernel tree also provides many additional benefits, all of which have helped 
+make Linux a strong, stable, and mature operating system - the very reason you 
+are using it today.
 
 
 Intro
-- 
2.43.0

