Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=52.59.177.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074625;
	b=MP0Fs2clidzEUpKeWnyTIl/kpS79DNvGRmUxVDfPFepOTFR0YCZu2w3UvSt1L55rqKth
	 EhVhxBGvDKyONRni06GIiq5yL4hV9Uhh3mBqDx7CgyONXK6IZDzMFRORsNP+lvg9yGZr5
	 joWtgtLAUZzo2dwfWo7xTdKj2Vj9zAt8ALh4Z5hb9kfWbEyUTSsCnewoDf/Ve0GurNEcW
	 ed6NqYvzKYYbZwa4yLgLXEoB+Wa6jfSz1dwRxJX6vIR5xJg1cloAMpYOalReiqHcJsMsn
	 OdRms0J68F/MCmauagYC8yA4vWe60AiCme8X3FDOVdqBfmKFcvB9WZZ2xK1ThWerJWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074625;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=Ba+Nnv4ioOHEAc+i4gjL1aVglKq6uZ57iPLZC0JP+/0=;
	b=D8/GTi/zSn0C2OOWXRfgIcvPOggjbCZsCuAZx2ZZ8JURTLUrNxarGA6eRacv9yzWLsrt
	 aySlHqiKIDk3lk8T/kAJ9qnZI5IocCZ0wJpeztOduVEmM+WqXSc1B/DhlfPbVoI0op2aR
	 aqzEiEl0LMXiRs+aTOY6BSqB4c0H6A5ZEkx1WhLftOC3ILtVUlsR20F2FEWHYQynrwlUA
	 Z2TDJd3ltp//JikulfQAMbQ3lt71ZWMlX2LovGd/rKPNhFVylnNYS+Wymxd297H4Yvm2Y
	 S+g7SJHtnPlcQRGgXC4NvhwsiXrCmD9Lzr/CmDEr0sBP7wuI2QK3hk6MWhHxgbcDvdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=mSQMNIms;
	arc=none smtp.remote-ip=52.59.177.22
Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E487606A320;
	Thu, 19 Nov 2026 07:50:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E487606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=mSQMNIms
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795074578;
	bh=Ba+Nnv4ioOHEAc+i4gjL1aVglKq6uZ57iPLZC0JP+/0=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mSQMNIms6b2a847Jv0CgJNJV6Yl+BsggwHWjh9g2APDz6npLJmeQTsJjoBAl8zBU9
	 6xlhSRnv4OXGNVqp4Rjxep8LZXJJtV7C4cr3+MsaSsBBmZVkxxPZ9Ow0BOQKbOlRIJ
	 /KjHyZtvBlohbGVHlBemOYJe/2lyZpuolJq54c3w=
X-QQ-mid: esmtpsz20t1795074573t21a8dba9
X-QQ-Originating-IP: g/JHC0RTM9WfBbnsRPMGVVkJ0qD18o0qUXMwBFz46jY=
Received: from PECI3347 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 19 Nov 2026 15:49:25 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 6967146943735712994
EX-QQ-RecipientCnt: 18
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Qi Zheng <qi.zheng@linux.dev>
Subject: [PATCH] Docs/mm: fix stale split page table lock references
Date: Thu, 19 Nov 2026 15:48:53 +0800
Message-ID: <32FBD023F945BCCE+20261119074854.252609-1-zhaozhengzhuo@uniontech.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: Mm9+kw7CRHgtaCNgk3Cgk5q5SSsOeK9N31OUB2j7DF06rfUIfU1wYusX
	WYQkII7pOcehQX/2q2x6URQ1FDXX0NZXm0jtQqLY0SexuaLw8zIwe4lx/xS0WKQxRYeDRSA
	fQu5jV2405FbF5MvvpHFjLNtmZ24/C3twZlMeQBh/DjljXiXMqZ7vUaMZUBJj/R3hjmIBlP
	Aon5bsYoo70VBVoOzVxgGpTQ+vSUUZfonrWPIxKJctLJfJ+a03VzO4+ymT+NfcwvsaR+6nY
	boJOe/qffO8UoOvoinGK9cVInPLUKD8Mb5TJd8+05i6rXuhwqNiCNd8AHCXN5guL54PQXNO
	gbLyspD3NxhwLoaFxVuHx4sSHQq3DalPdAFJCmBMI7+V2b2GxRH/TZY84VXFHPSdc7cAv/j
	kcPQRzP4CIBt6UeDmy4kQHqTrTcAE3EwPAvhIqI+/LpvdkkG1TOgKvl62Z8JL87OoDv/O63
	Lw1/obeutwP39p08hBd9qAT4hXicfKIbBSwQtDSlIuk0W6KWh1Dnf5eS2jc2A7P3lGlZjk9
	vS7tt+esDw4pV2F5dme0yDbaR/76xa63CfxnvB7+hypsHzTMouzk/rwIp+QKf6eIgP4tMLf
	1IBF1KOxevb65AETcq4tt01wYN5zi4oDEw+Sb1qe5v2WHfdFlT6E61l4WiiMGsvn0M1yUl+
	qJ2cdjpafxSFM20FZz+yKAr8YMcqru1AicOKRejqUx6z+wBiiMugXEZBptT+Awtqd5cCQMW
	PO2EjxKUC4VJin7736tJbDSc3JsiocsaQbTl4wSYzy6/9234WNCuwA2o6rJkJAXtAk/1D6v
	uKqNYpTUKffhbx1yjVZJOZeUbJl9+KXr0PsO9xEMRBmhlOTaC+m8ncdTuLKvq8nulBwcWh4
	8XLQHv3dkczdNLIwBB39+jXl5s8PZlMOkrbG/aQIJHVOuIF0XQAGa8CTRT10fu5yB+J1p9c
	NrfF9+voXwhs9XvFIQyI2clGN9ygztyiz9vg6kX1lRv6+f0AWH+YOih0EZfjEnKbPyISLiK
	ugknwHLaftJKQXnfINn6daH2eHN7DrOGJeJCY7NnN3z8VsH7zCG1KdtAIdsujrTel8Kq6zr
	xTzMxdN7n6ZUS0lDRXnohD5pdRxiCZGLszBEJZIOdIgBOJnfWy1xX7Y7bZhylqSl0ac5k+x
	Lpq1
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
Documentation/mm files still refer to the old names.

Update both references.

Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
---
 Documentation/mm/process_addrs.rst         | 2 +-
 Documentation/mm/split_page_table_lock.rst | 8 +++++---
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/Documentation/mm/process_addrs.rst b/Documentation/mm/process_addrs.rst
index 04b649818cc1..0b6355e6d1d5 100644
--- a/Documentation/mm/process_addrs.rst
+++ b/Documentation/mm/process_addrs.rst
@@ -659,7 +659,7 @@ acquired in :c:func:`!__p4d_alloc`, :c:func:`!__pud_alloc` and
    references the :c:member:`!mm->page_table_lock`.
 
 Allocating a PTE will either use the :c:member:`!mm->page_table_lock` or, if
-:c:macro:`!USE_SPLIT_PMD_PTLOCKS` is defined, a lock embedded in the PMD
+:c:macro:`!CONFIG_SPLIT_PMD_PTLOCKS` is enabled, a lock embedded in the PMD
 physical page metadata in the form of a :c:struct:`!struct ptdesc`, acquired by
 :c:func:`!pmd_ptdesc` called from :c:func:`!pmd_lock` and ultimately
 :c:func:`!__pte_alloc`.
diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index cc3cd46abd1b..ce7908bebce9 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -37,9 +37,11 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pmd_lockptr()
 	returns pointer to PMD table lock;
 
-Split page table lock for PTE tables is enabled compile-time if
-CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
-If split lock is disabled, all tables are guarded by mm->page_table_lock.
+Split page table lock for PTE tables is enabled at compile time when
+CONFIG_SPLIT_PTE_PTLOCKS is enabled.  This option requires CONFIG_MMU and
+CONFIG_SMP, with CONFIG_NR_CPUS set to at least 4 (see mm/Kconfig for
+architecture-specific restrictions).  If split lock is disabled, all
+tables are guarded by mm->page_table_lock.
 
 Split page table lock for PMD tables is enabled, if it's enabled for PTE
 tables and the architecture supports it (see below).
-- 
2.50.1

