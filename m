Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865E31E5219
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 01:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742435771; cv=none; b=SlNebYg3mcnkucw+zotOUo9jygLbgxe3n4Jpa909tBNQfUIGljHCuBVJ/eY/zRTcxmeVy+/A+Ow6+ApzCrxL+7uYxwKStF9xZrFYEuk69FiWFi8cme0iQl0g9066b12SUqqX+RFYx8kPN0dd4MIAMZHsu29U9Vt7bJBQonWMbMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742435771; c=relaxed/simple;
	bh=7oZEWfUMoqXZIdbIu3x88udCPkEeHCGdOzdraE/jqeE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aYe+8OSixb2T0KHSbFPHmvRNigFVJE24ljjC04N/g+pH71BdkBq7QAU6ic3+XZFgzLxNkbcnDFzeWCtysNQZYXffnh2utlElLc2ZgsS0nvDPd68yhFBJEFB4XaBMKsSBESJBaAfiDa1bLJ3ySC2BdmkXwAtu5cSbXIntN3ka3U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=trJaNCwi; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="trJaNCwi"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224347aef79so4640295ad.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Mar 2025 18:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742435770; x=1743040570; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8yL5b2WTU5WHGZETUIu4ND+tiGH8mntIZf0oxmIMUMA=;
        b=trJaNCwiCRNMJ0q8wlwQAtrfaIwhO/5YpwxIDHIB3sUkH8Ix+DviASWJIZzz3qsBxf
         mYU46vQfCs5O7ajvr1YKO16SGoUXTTMQ21hesajdv9Lkyg/bTgOy+wwrifYCiAVJ4D+v
         Giqo2X30ZPXp6g57fTSjO33Ddag7T4jiNx2Op2pLWrhfIZQzgovCIA21BuTUmFHsushj
         LbPNe8ZtdrS8WZCDs4OvPm8YV904B3d9i0af7ab3eBMdPg3by/73I2jvpg7xsECan/mT
         ZlnYBgKNXDSqur8MRz4eaTm1Gw/FLLNz0AkmiCEoQPcvlztYjemlSxh0H5tFnHDrC6IL
         MASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742435770; x=1743040570;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8yL5b2WTU5WHGZETUIu4ND+tiGH8mntIZf0oxmIMUMA=;
        b=TapnWFAsfjYnxi9Qn+5jK5OY4CkcgBvTWyrqeSMaPo0EM/XRONQ0NqdIz0vo3TDtG1
         MrLluYbaPMl9JzzuIAp3VC2gs6ENQgxo00R5exX3F3MkF67vUOd5n5G+y0WgYAmgZDrw
         JeeikXMMuiaZBXlkqvwY78ewr91EX8mO3lAINJr/RGAtKZoT0DfGG6XsRbyF9pVDQZb1
         ctTOVaebv4OB6G9hWh15QIo2VfHiBRkplWs/7o8iMDE08FepAT2PQ4ChYooe78UDBs83
         ABNrpHxo6102hUxbq0JF5unPOEz1vGECGfQVkizOArJ2cL/sXopWwfahqut+n+LY9Kvw
         DuJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3mY75utZJXUdGytJog+GnbnvA6eVa3yQc+Wi48l+My/3VWylNw2I5YeU6zJKWp3sVpJ1Ot381X6A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8+Pt6zwZOpqfqoDwliXDnC1C67j89SNr16+azukiczApOS5uz
	tZ0GVksV1lLaZ/DM0MWrQ1EGfIe+0qBmo+W1f9G1w0QL6mJ/ssRoNuok+4bNTrW8+UDDMBc52yf
	X03yUHhqb7c8zrGm/5A==
X-Google-Smtp-Source: AGHT+IHW15FvPpMLWn1HKaL85qfGSHpQDCxTWGFYK6N/65irCZHXzpE1wn1H8XnTV124IW6pqODmzO2IIQUyBB4r
X-Received: from pfbna11.prod.google.com ([2002:a05:6a00:3e0b:b0:730:4672:64ac])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:4187:b0:736:fff2:99b with SMTP id d2e1a72fcca58-7376d6ff535mr8193650b3a.23.1742435769805;
 Wed, 19 Mar 2025 18:56:09 -0700 (PDT)
Date: Wed, 19 Mar 2025 18:55:41 -0700
In-Reply-To: <20250320015551.2157511-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Message-ID: <20250320015551.2157511-7-changyuanl@google.com>
Subject: [PATCH v5 06/16] hashtable: add macro HASHTABLE_INIT
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
	linux-mm@kvack.org, x86@kernel.org, Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

Similar to HLIST_HEAD_INIT, HASHTABLE_INIT allows a hashtable embedded
in another structure to be initialized at compile time.

Example,

struct tree_node {
    DECLARE_HASHTABLE(properties, 4);
    DECLARE_HASHTABLE(sub_nodes, 4);
};

static struct tree_node root_node = {
    .properties = HASHTABLE_INIT(4),
    .sub_nodes = HASHTABLE_INIT(4),
};

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 include/linux/hashtable.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/include/linux/hashtable.h b/include/linux/hashtable.h
index f6c666730b8c..27e07a436e2a 100644
--- a/include/linux/hashtable.h
+++ b/include/linux/hashtable.h
@@ -13,13 +13,14 @@
 #include <linux/hash.h>
 #include <linux/rculist.h>
 
+#define HASHTABLE_INIT(bits) { [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+
 #define DEFINE_HASHTABLE(name, bits)						\
-	struct hlist_head name[1 << (bits)] =					\
-			{ [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+	struct hlist_head name[1 << (bits)] =	HASHTABLE_INIT(bits)	\
 
 #define DEFINE_READ_MOSTLY_HASHTABLE(name, bits)				\
 	struct hlist_head name[1 << (bits)] __read_mostly =			\
-			{ [0 ... ((1 << (bits)) - 1)] = HLIST_HEAD_INIT }
+		HASHTABLE_INIT(bits)
 
 #define DECLARE_HASHTABLE(name, bits)                                   	\
 	struct hlist_head name[1 << (bits)]
-- 
2.48.1.711.g2feabab25a-goog

