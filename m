Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC96253347
	for <linux-doc@vger.kernel.org>; Thu,  1 May 2025 22:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140122; cv=none; b=hFWidXynJsAj/gfLYfrmk9l4C16/AEkDznzQUhx95Xn6VCg+lBTd9rF5NpYYNCdyNZX7S2XfGjb9eZn81MJ7Z9s0W+2lJQY3SLtllSCVYkwltohCCM59AhVoup+AAK52hc9Z7FqW5qQ2RkHH5PnB8NJQcMVdLww4KjmQyMrXhIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140122; c=relaxed/simple;
	bh=CflS9DpX77LUitaO4DYZ+bquWY1oNNmLL2exIL9Urqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BstPxrbAJwDgu+nM9K8448dMQZzq5IFbzh3pgMpQXIV9CoONl03iuuPHue8RDmZCThuNd5ZV1ijfKMa8j/SqN57k7UAEEliP6fWkwPGhQZWFEH99zZ18+0q8hHxMdtOpdLpD633ptXTOXgFrDKhOpqNMR8VKcBNUATNE4LTubnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WZK/5Xas; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WZK/5Xas"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7395095a505so1135505b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 01 May 2025 15:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140120; x=1746744920; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2HlkyQFbJOtIn7U2Rd16qUG9dEmKYGc2pG99S8bb4=;
        b=WZK/5XasTMruc/+VcS0YC1Y8MFKpiogclPP0WF+sJwjQS0C1MYgyUoYYptWLfPq4cI
         vhwRzmqL3szohkFETDUGqjLRiKVWKgLEFZEyRhSUow6MvIJDlIjd3d9y1tbSPEcG+i1C
         Gdz1DGLwe/25vY6zZxtWuv9ar2AZx8LcOxM3fJhkAEiQmnHoarNFRf2ozNyjh5M5EcWi
         MoNTS0RnLnSVZzRt9Nm2UdBJs5dp6gMIL9K8P4wJlQ6RKAzCh2q0nOWvybENW9Cv/vN9
         kOvYDeD6wjKBWWGDwQ06E2cCBIqTnhvcdCYjek6mSPI/8tGaCf2GHVzmFlY8uA/P8426
         /FXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140120; x=1746744920;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yI2HlkyQFbJOtIn7U2Rd16qUG9dEmKYGc2pG99S8bb4=;
        b=bg2HLCOYYMccOwW0YxSC39+p4oeOXEiryiMCcTC25MCiJmR7qoks9frCWo2MCnh1Z5
         RGQUraS6dQvcekUrnTLSD9m2mtQL50r8sDaWCfJDo0SIgXMTe+SC9S/iPw17Y4BqrSwt
         wpaJ+doWNFFu67InmlHgm6iI3aZBFpyaA2t7e5oATleHjvUTfLGEvignAlRIr2VEJbYI
         n1Kowl+oDDLJKEm77MLqjZiaUo6Ax4HaLxmKkwVqGCVeZw2EVhrmu/DTqe/CUr5QSA5f
         gm01FpeXJIplwDcX2mPdriAhlgOvOpElDhdxdcGvVfi1ryfeU+eYs+5D1SCml0H2HZiP
         Zk0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWZ3zRS53iAZjWTnp2RpapRyawNh1L9m3BD4l58xR+xFypBMnpNavENMhAv5jMot5/+mtWI28YF+sQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS5c/ckNSlKHOCUZ2cnhwi8sKQDDzdqB3jh51IZuW4OpleKi3o
	+M4XuLGcs0Sza2YOzmiNUOji8M95X2oRiYSudoSCHk8ox21cyRtuojGw+tEDjQsPRGMaYrNVehr
	81BQCJMNAnBkA3IMZEg==
X-Google-Smtp-Source: AGHT+IGmpHhKcBDrERp6231eQ29+jikWpthUas+M8P/VxY8mf6RZUuVX69nZyHTF3KiG68E/Ho9kug3/UNXn0GYw
X-Received: from pfbfe8.prod.google.com ([2002:a05:6a00:2f08:b0:736:4ad6:1803])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9cca:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-20cde371e9emr787243637.5.1746140120540;
 Thu, 01 May 2025 15:55:20 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:13 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-7-changyuanl@google.com>
Subject: [PATCH v7 06/18] kexec: include asm/early_ioremap.h
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Arnd Bergmann <arnd@arndb.de>

The early_memremap() function is decleared in a header that is only indirectly
included here:

kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1116 |         fdt = early_memremap(fdt_phys, fdt_len);
      |               ^

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 kernel/kexec_handover.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index a1e1cd0330143..59f3cf9557f50 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -17,6 +17,9 @@
 #include <linux/memblock.h>
 #include <linux/notifier.h>
 #include <linux/page-isolation.h>
+
+#include <asm/early_ioremap.h>
+
 /*
  * KHO is tightly coupled with mm init and needs access to some of mm
  * internal APIs.
-- 
2.49.0.906.g1f30a19c02-goog

