Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A440F3290AA
	for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 22:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781562527; cv=none; b=B5xhRxpjVEjDRWmDHd1CEHCKSI5AL28X3wdCXulFCFZhS9RmQAQCx0kpBhI9WKK6dzZPko10EPLbGY7rAzmEOavS4ADjXzyPxOw9U69iS6BkSoUmy/IgotTV+mO4EnLOoC/l4SK9Hk5ZhHipTD/MYEQp+kKU043hswtfwLM96Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781562527; c=relaxed/simple;
	bh=VVIGAVYILp85wyXYd3axvdjQv4Rrk4Tug+Q9xTwAm4M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KhqSCUVb+pM9jZzbRfY1701OS8YK6ayaP8Zd35wSyYorBO8T/pauXEfje/G93xmXXWoA1INFO3r04Z1NoEWKzF25QlhtCIStTaPuyKaQwPOkavnil9YNlPiSyv+2LD/D5EnbULTpQU2pHMvB4TqdtSDjP9v9HCeSsfebAEQ+fVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ptd8kmiK; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ptd8kmiK"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1384ebe7a10so5913530c88.1
        for <linux-doc@vger.kernel.org>; Mon, 15 Jun 2026 15:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781562526; x=1782167326; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ckYJXybkDDHA1lNWSm7+oH2tXTMBHSRx7YzgTwl5GAk=;
        b=ptd8kmiKLGUNZi39t4F/UIF2TDf9ENbFb9+bePXn/e6J2Ko57yILI/eqeKDuwrKx9y
         1xTByEc0t+BLGrcpLLAgzbi881Hccfx6HJSVj99adq1C6myqrdIMn6NT9BHmM+YbzyP8
         RRMY6PGp+yw192Ohf7vgYrk3VlXQAD0GSqiroJfj3E7k4mUV1hsb5JKl8dor1cEQGh1k
         JUyu/QtJ75kXxfZ54I9oHw8DXp6zeQFhzjMk55hohw6REBsvkefP/+IsYQjAxLbeLIf/
         utrfRiFF8GuJrzenCBkttmEqM65P1YNQZXQPCQ/YkE8+ekxXqVOwdalO3BO1Vi2MWich
         n+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781562526; x=1782167326;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ckYJXybkDDHA1lNWSm7+oH2tXTMBHSRx7YzgTwl5GAk=;
        b=WRBOY25xuC38GbaJVdBA6O3tSR3/qYIYl+qGCmHSRq5N7IOGuLy1DVmPf5dwqX4A4Y
         mahrOHL2cB0m/4xh1DkuLyKEDPNsMiwFrHyp3BcRBj9gB8MffnfMAw9GHCBTBalJx82O
         50grdxR8CgT64pj4CxA+EDKzUSWJn6/HYWwG7X3nkdI1WJSMHg0n52aSqJAg6oCzVCLF
         /9psljj1IRK/VbY58j5nXaE41zqwwtseP8SmeGBSa3Sahy2Z6SvCi706ZRSy/K8nZJ41
         DpQw5tufs5Sn/dHwC1UjyEWGyG2U+4aQiM+S5JFl3FarHvzBK1VT3yuD4uyUMwp35jzQ
         nXLg==
X-Forwarded-Encrypted: i=1; AFNElJ+ttAjN0lIqQtlfSVYKGa2QZpeatSTI1xMmGIBhFUGkW/n1PuAhdXFgcszPTkUn2ef+iKvWoCRLJXI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHXr3YgOCqgWINn92Fp7woYug7TjdWqAWjLzYsT5SjHYb15TKl
	xoBQQrSKt88PH4cf9+6cC+VAXScLTCjLUbMgy6RyBH7Ovrni07l8c/id
X-Gm-Gg: Acq92OFYLLT4EWFdkSVDGRp0cIL9T9Yoi0lP+lIPPrnEl8MJmPW4K8wTeMK7cCHz/4B
	RI39buhrD6Bhs92tG6KJVMS34TmK3Da2jwsnAQsMqN3XQWsu1CWvKoGDG9TtV26NsX4aNzOOXD3
	NoViGvAbUCxdqkabCPO/5so809nxFi1qWGiNDx+gL68szQ1uCLsBJNS39FMmPk+wNv7ikX9Yj9G
	H/WbLk0yBZd/LMU/xrplJmaIi84BMKcq8UP5Cds6ZG20Y0oHVxnCpTpPKIqxkEZuazzCL0Z1O0D
	fk7LiweBjrjLUzfdI+LKWXaHRgZvHnysWMYSZHNl+x+OwXBIqF6z7iMAly3PuDZXUjFTKT4kaK8
	28nK1l67bumevqHLwBJNX7IcstSXTMLrHv0PEwTAmqwuellRuRT1o6G9H7u6595AUeYOAUNWajN
	7f5BmPByETKLp4o0V6UQEYzPCQVktgd6lT5VKLjqT3y6Zp6yEMcC1v3Jfvb9ZcNdpBLB+aN1Wxv
	MVptiuyB23ofKovmJg+QUtYchA2Gpfa451upYcXGQv2vaQl16UbQgQI6i8v5iSCGLLLO9F/gHyo
	DbqJcNjwL9fyNmBywg==
X-Received: by 2002:a05:7300:501:b0:2d8:97d6:6abc with SMTP id 5a478bee46e88-3082009bf1amr11070447eec.22.1781562525458;
        Mon, 15 Jun 2026 15:28:45 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d810fsm16792470eec.12.2026.06.15.15.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:28:44 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2] docs/mm: describe current criteria for enabling split page table lock for PTE tables
Date: Mon, 15 Jun 2026 15:28:29 -0700
Message-ID: <20260615222829.17420-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mm documentation regarding split page table lock for PTE tables
refers to the CONFIG_SPLIT_PTLOCK_CPUS config option, which was
superseded by CONFIG_SPLIT_PTE_PTLOCKS in commit 394290cba966 ("mm:
turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig
options"). Update the documentation to refer to the current option and
document that it is not supported on some architectures.

Discovered while searching for CONFIG_* symbols referenced in the
kernel but not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Remove list of unsupported architectures for conciseness

 Documentation/mm/split_page_table_lock.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index cc3cd46abd1b..3a35988f3c16 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -37,8 +37,9 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pmd_lockptr()
 	returns pointer to PMD table lock;
 
-Split page table lock for PTE tables is enabled compile-time if
-CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
+Split page table lock for PTE tables is enabled compile-time (via
+CONFIG_SPLIT_PTE_PTLOCKS) if NR_CPUS is greater than or equal to 4 and an
+MMU is being used. However, it is not supported on some architectures.
 If split lock is disabled, all tables are guarded by mm->page_table_lock.
 
 Split page table lock for PMD tables is enabled, if it's enabled for PTE
-- 
2.43.0

