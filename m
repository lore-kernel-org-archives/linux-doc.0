Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F7231DE4C5
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435765; cv=none; b=sK89ZdpUDSlDCw5NIBkVVbwYrOwcrBIx16vddMF3nbBdUHZRrqnooJlGPu0dvpty4WEkOiC9Y5V9U1OAI5NimCCJ/uSwmm7X1JM6cCt66YjKPuqBLPA6KRwF+F/ncFCvATYA5/PwjqUTihFRgbbgsd89KOhF3MxMiHD5lOtAGr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435765; c=relaxed/simple;
	bh=XtZM1W7Vhek+FlKle8HV/b1w62G+SFaboeOkqwxl/xA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZYvAKp47F4qopbITvQ185nBgD1CrsSATfx53iwK9sSOlR/h4gnys28+Moi4xFDITqdmpjQrviwJ7PtDOTRJ61EUWC026BcimJtLDPy7a7e3o1DmT4IZp4r9YhWwoshdwnXUKoJGBI9WkFGFRTBezBgNs5XD6jMXQxsNrZKyXa00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sYUvc6Tp; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sYUvc6Tp"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c93so394221a91.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435763; x=1743040563; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ilsQeNiRJnAcOliWxyBDLHi9DId7Z2YXJm9lAmFy6DI=;
        b=sYUvc6TpsOePjiXhVb953erSZpLaIfTrPyggjZEBf8AfC4sBwHCh2dRHWuXLeU6JLg
         y9LCWpeQgw1ww5lY1EM+prEXwRFNkP95SIr8kDYJsXEUeQT7ZGgGAoO2+Nm1itN8/zN+
         WB3VneXsKU9YFgappTEd56uDNne4qG/JDbmYagTgifIgWUOYj5agJYJIdrP6/h2PZvQH
         zJ0LrfTbFaXNmqjKG3H7q2OR9sgcSzPOa/XnBIPPgKAtO7D8Fs2blEW78Xfc6XEwEZ0t
         S3keHl6iNF+hMKbzkNGzYBbKSwqwmzItOM1RSIjCzK0ZlRdiM3xwaxQdCX2NGcV7A3Jp
         jxfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435763; x=1743040563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ilsQeNiRJnAcOliWxyBDLHi9DId7Z2YXJm9lAmFy6DI=;
        b=H4dtHYaot8iWQvK2/FhfXNltk81zKTJ6Y4zfls42w7cacxair45ffiLeiFO0MWZJLD
         GjSzSZTqtugl70G72YvgZBDBnf3x1wUdeSjapqyC812Y7WWGncHqoc7llzPPMnk2mh7z
         v8X+3s9xU15EAJvFuhmVCdVmLEttMTcdh0J9EOrWJRMIi5adH2O+X3DvwosBrHO2Kbxf
         e1Bs2x4NS3LoqqI/HMtbeFNghakYWdGTTN1BgjhQkEoAF62mMnrm8827N/cgIuhPHJDA
         n2fC4venHXc0i+7cj5+KQvXwJztUSmGxetDBVQRyHcTYQWBstrsHwnm85MxUKx08SxYp
         h4gg==
X-Forwarded-Encrypted: i=1; AJvYcCUd+3/p+9LftxXegTXH6G9a0cNybbJqRrFcGWo4Jn0WP/e3AlOLvpmBCRd3AxPJIfCQTdoArBgT/lI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwIxzT+Wv3DlUcJo/dORp3P7zxHlGhfjYzjVYhs9pvkbbRVX9iW
	3Ng5RDzH4TsuMQShsPi2/yGWMLUeJusnIaCqtbRd+3847v3W+BUitto9xBAdCPkcKjCnf8fPLMO
	QhaETdny2/7sWLNqfJQ==
X-Google-Smtp-Source: AGHT+IHLp0TM25605mfB4iWKOjzImtCB+u2sC+62Tcd+2pSs/X0minmUzplavXz6x1NXqtyXk3N9lUuGrg30J6Xe
X-Received: from pgbdo13.prod.google.com ([2002:a05:6a02:e8d:b0:af2:8474:f67e])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:594:b0:1f5:7b6f:f8e8 with SMTP id adf61e73a8af0-1fbeae9141bmr8613381637.6.1742435763548;
 Wed, 19 Mar 2025 18:56:03 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:37 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-3-changyuanl@google.com>
Subject: [PATCH v5 02/16] mm/mm_init: rename init_reserved_page to init_deferred_page
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	dave.hansen@linux.intel.com, dwmw2@infradead.org, ebiederm@xmission.com, 
	mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, krzk@kernel.org, 
	rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	pasha.tatashin@soleen.com, hpa@zytor.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh+dt@kernel.org, robh@kernel.org, saravanak@google.com, 
	skinsburskii@linux.microsoft.com, rostedt@goodmis.org, tglx@linutronix.de, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, will@kernel.org, 
	devicetree@vger.kernel.org, kexec@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

When CONFIG_DEFERRED_STRUCT_PAGE_INIT is enabled, init_reserved_page()
function performs initialization of a struct page that would have been
deferred normally.

Rename it to init_deferred_page() to better reflect what the function does.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/mm_init.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 2630cc30147e..c4b425125bad 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -705,7 +705,7 @@ defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static void __meminit init_reserved_page(unsigned long pfn, int nid)
+static void __meminit init_deferred_page(unsigned long pfn, int nid)
 {
 	pg_data_t *pgdat;
 	int zid;
@@ -739,7 +739,7 @@ static inline bool defer_init(int nid, unsigned long pfn, unsigned long end_pfn)
 	return false;
 }
 
-static inline void init_reserved_page(unsigned long pfn, int nid)
+static inline void init_deferred_page(unsigned long pfn, int nid)
 {
 }
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
@@ -760,7 +760,7 @@ void __meminit reserve_bootmem_region(phys_addr_t start,
 		if (pfn_valid(start_pfn)) {
 			struct page *page = pfn_to_page(start_pfn);
 
-			init_reserved_page(start_pfn, nid);
+			init_deferred_page(start_pfn, nid);
 
 			/*
 			 * no need for atomic set_bit because the struct
-- 
2.48.1.711.g2feabab25a-goog

