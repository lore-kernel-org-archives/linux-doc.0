Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B5036921F
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567142; cv=none; b=eAc0l5dTQiib4Jhb82aLrHe7UhcL20ERq58p53NOHOlDEY3upTjXDTQyeRLu/x42zsTpuiW5jFg1DReaZpjwgPpwo2+DZZVtXo+nS2uXX+jc4vYJbc9f2JBXtkCeBPCY2s2EDidE/2JS0n3KGsqo8UH2/cYM8yYBJ4sMt9dR8JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567142; c=relaxed/simple;
	bh=3D6cMAtJFcH0eGhpLiRPBCAWIwBu4/DIokVo2lKhkeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sAlsDapMAw+IuWu7K32qYKeJbnowcYHLrtpUPZV8MDx9KXLOpTKbJu3I1P9F66ZUBMiQxpK2Wk/nR18ikmi1jOP4v9TnqEPN69MuYPLdidQ7H9jkAqP5t+go4m/F2Kcd7n3Ek/wFSD7IEjLPVb4WMqmcFek6rqhZzhwMYvlCDI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pYLbNjJI; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pYLbNjJI"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-42b379cd896so3987842f8f.3
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567136; x=1764171936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=pYLbNjJIY4xqxEIuEns8uXjvZ7F9isi/7jugo5Qj7mhP9MDL/QpwdMISZcJdNL9qP/
         y9ZVXz8oEfwgevPWLkpZcPeLF47jsOb/XLf6/K0XXuPwugKhs+phJYcFTU6ZYG5E4S/r
         o+Gp6z+r3MWbQ861Bcu8Uuld23esVOU+yE3rs15fEovLoc4dr+ngBE2HsPuDyaaBMk7k
         PRsZEYjW7PPvzzPVl2RzcO++pOHfy+eUzYEjW15SHSG2mnuw9/5gHaT85gJU5KvJyeWx
         dle+WOQC/9zPb3r7giPWeiI3kW7J2GODRp8Myf5WewGW6sR4l53Vhkhm3IGgtNkPpyaU
         tTVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567136; x=1764171936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1EgUtWpxUoehpDvVbPcVA+GkHlZFESzHxIeFdx8HGLc=;
        b=YJDdED9qXfAYwYebfONUMeVIobFQk5NxLWLRseqHAFALJdLTTH1ZNnB2efXaKfK8ED
         6Hg0+QnuBTgCfkWVR2dNouz6QyFpmFXolpGjaEzsn4DYax9X64AAYi/beLJ8Q9Y2fbum
         3awIarPe7Be/uhehCefv0YBFajAhspG7Dr9/4QBS+1Q8LoIcjQI5v5TgmuASf6ZXCX0L
         OBWf439bWw+M0olMbQzO2Vmm6K7s/UynbRyvudpZ1nOa3BgGK2i0H31beT4AwTMfmfcJ
         /bDlmfSckIwXF/FzuaUgjA/IKFCha9DW7E/bOazMuYNnbbhGGuiulDEDC8vULGu3mQKL
         iG9A==
X-Forwarded-Encrypted: i=1; AJvYcCXrMeRqXvzmF78x1SyEyo+5QVW18OLNCaOz3Ko+KGQ7N22xbTbMXHzXAAPwFx+T+2FvSTMsR4L0ZNo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdwsXzxN1S4O/AY/26/quASr7OwbVMldgwFUvmNptxUIi7sEb6
	taowYRLgkwekUgGNET7B/o6l6fyXVQBeSxfYNNR4UR4/k34zFEOUYlSQ6Ff4aWcUdds=
X-Gm-Gg: ASbGncuohBhQZqPSwDq/yLJVQWFln7s9OzQKE2DU25lQjQctix4XgENcMKWhngNO6Ek
	Af8FJUgO/Yl+vYQx3hXbFfPBpWUaXRgxYn8cln+YGsmfr6NWEOFb8opVsNAsczkMY/QFnDdzu17
	CrkVaLPXpbOPnxN8ONP6O/zMfFyPOVrZ8nBPiPPxumq6rUf1fm6KCBYt2MWX0pAxI+uihawULri
	+sE9T6fPeGXo6AKSndzGQ6qVfFkrIkQCa9wlPeSARmPTw72jSHHTeXTTqinWGSvZiPRd1bwu0xQ
	xmQJUFlCkq7ueIk0+t6lrw93aYfz4eVxy0Czs+dXXrrG5J/ufmmucnNJqzmwqUuIwNVKna1cd+O
	ndpSZXWpplabbeqlv69F1hxTiGU1qGthqg6BqaI5yoMlwes0w5UCCLHm6FlqSPVzUO0yPB6Dc9S
	WU/3MVSp/eLaYljMvp9CcXJXNRMc+4hA==
X-Google-Smtp-Source: AGHT+IGKFFWZ+AqolHJ3imLY6SMDSF30b2mMpFX+Q/YU64RzAj2P3ofwp9AZZn8blv/guB2oFBfRQw==
X-Received: by 2002:a5d:5f93:0:b0:42b:43cc:982e with SMTP id ffacd0b85a97d-42b595a497fmr21650580f8f.36.1763567135863;
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:35 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 11/26] kernel/vmcore_info: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:12 +0200
Message-ID: <20251119154427.1033475-12-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register vmcoreinfo information into inspection table.
Because the size of the info is computed after all entries are being
added, there is no point in registering the whole page, rather, call
the inspection registration once everything is in place with the right size.
A second reason is that the vmcoreinfo is added as a region inside
the ELF coreimage note, there is no point in having blank space at the end.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/vmcore_info.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f8..6a9658d6ec9a 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -14,6 +14,7 @@
 #include <linux/cpuhotplug.h>
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
+#include <linux/meminspect.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -227,6 +228,9 @@ static int __init crash_save_vmcoreinfo_init(void)
 	arch_crash_save_vmcoreinfo();
 	update_vmcoreinfo_note();
 
+	meminspect_register_id_va(MEMINSPECT_ID_VMCOREINFO,
+				  (void *)vmcoreinfo_data, vmcoreinfo_size);
+
 	return 0;
 }
 
-- 
2.43.0

