Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795403395;
	b=1i+4U5rbZsinrVtPcXCpauhTQLt7qoombjcLIqz8mK2Kk4imyDP7iGoc1Hw87ZgAgzCw
	 aX85gV6hEAUD/iW2cAPKlYwmbw8gaHIlvjglXXrXp4VgX0giElvX7EBvyQcZvtjAiUK2y
	 Tldn+0b2n+YJBoGS+ueNDeHLL+1CSDHgJMntbxTjDQvrIYaG3W/Hz32cFIrwDfL7IZJNs
	 wm/stcyBuxlvJxI+ZNnzKwF0AAqWbZZwZ7PmQS/qVuZmTPUa9yq1s4Vb82dXBcxy3rZz6
	 PBpf3CRsRmwIJBPXwFULwAONTx9WJt1kOKhjvZFdUBPq8pAXAuotgzXZNRgTzDKXIMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795403395;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=oNfCshgfylwcbv5xC9TWUsVsDyDxPcrICrC9vT/UFVQ=;
	b=L3c5fscJhe8n++pjIBvNG+WLR2640YLWLhZ8AED9VBXU02q9I4QRk/c9N4/40oEZaszi
	 rPHT675sGmTuSOYD6h1bLkLym9OfmR3rwtMeXG+JsiYmsjP9V6beNZLGH1KEJyvETQKKC
	 Ygjui8UDv6zrXw/7KmUMfc38Ds3CkQPiffADS5MHUFdN8UQ+oTCyaqXweMRvO9yatXHEh
	 Hf8fQeRwtAlRd6ssPA6Y+gK3r4PY1/fWNhiT4evEBwVQy3owG+k/hLYNHPGNtLVUYDKuA
	 LqLQBwIRIsuH5BA03JjZ2j4SiKvD+4o6tYEHBVj5VL2HmReODrOsCIT69J8oQMZVxMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=V+h2ShV3;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ABC606A31A;
	Mon, 23 Nov 2026 03:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7ABC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=V+h2ShV3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795403358;
	bh=oNfCshgfylwcbv5xC9TWUsVsDyDxPcrICrC9vT/UFVQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=V+h2ShV36q7W84wvDn5DE9l7+VNJFpAcIwzbLn/qbNVafCAvu2CeSHyCL8XjdJ7aq
	 935Y9QkCNxv5hg4/H6kaNoTNA/OxnXPwliIovTtd2WsSDJdjwMCtMATIZVNG3UlSm1
	 hCRoOFIRNlb6HvLppob1oJTsx6E4PEgr1ABW4abw=
X-QQ-mid: zesmtpsz2t1795403352t73ab4d9c
X-QQ-Originating-IP: oyGw9ttpeTpeqils+8yDH5/B7JsCcA7IMaplBy638c0=
Received: from PECI3347 ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 11:09:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 919220475888949696
EX-QQ-RecipientCnt: 18
From: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
To: linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	zhaozhengzhuo <zhaozhengzhuo@uniontech.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Subject: [PATCH v2] Docs/mm: fix stale split page table lock references
Date: Mon, 23 Nov 2026 11:09:03 +0800
Message-ID: <6E11B4A6A6E0DCF9+20261123030904.57369-1-zhaozhengzhuo@uniontech.com>
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
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz5b-2
X-QQ-XMAILINFO: NHDJBjaQv4EtxhMPydh/IDyd6L3yTQRF632UhwULb8u7W6ttwPhUXYZ8
	Xhog0MU7BoOZnJYpJN74QU0ZNoOyZc+qN1g4Zu4xSqYlK1yXVg49MqF8WfaVrYrDiWSeMiJ
	tLD/64XejCu9gWyyRO620jkXJg13snvgoyCYIbp8+OyQfzPrSFwXz4f8MHa5FCUE+8b/jDG
	P9DLsF7ViPEyCG6ae0kL0E+K40Qo+rB18rHS/6Msp/c4T0iwthqexrHrn/Q8RsFjYds1TEw
	yQ8bWmpG0kJ3m133u5sQ8RQl0Avs2AVdXf1vzkaO0epOr6+qd2HC+4eHfmT62aEkWZ4IVmc
	Gmj+IqMoYwFhrYBbnfw10AdS7O91VeiP44jPyecty/2foeHQELZ2uz6YgnQ4uWNsCLfQrH+
	43gqO8X4fB/cjyJW/E2WUBXorc9xg177x6X5HfM3uR7YDTRrxHEaYbK05Fx6rzYuwM2vtZR
	g8u3oiE1c7XnbMlgwZA9Hv8qt3vCdj00BhjellhJ1H1gFmbLG0gTIgJ2v7RBew8cTewFD+q
	CnWpITN2FdbLig/0l+MuGVsS0RHJR8v3rmZEhryWDOpZY9DXqfFMDU9REeuZe8/z6OwSGmp
	cCUD7yL+XfJZOtFtEzDc8/STFh5S0tucu97NYtJVoXqwtIQq0RNTZ4nekufKym5JmPLIfYP
	LtGi78/R3d6b7XiNKryzcZGb4qE0EmwEQAr6hiof/eqvcfOipc3FX7xO5mQqsC0mWL1guYq
	Bg+mcOswXb0QYuWhaPoOyzvFIg0Zq639cEPTJgHDNHYmma9im7kcvQlKSIAAs8kOeQobvxR
	D3VhDcRu46+0p3ShZR0sQOCZtpvMoMrbWaNcrEsEU8l+fKzkj51EKgTzn917KDCSEnz0Wld
	bVjegBKqeAFyaZNsDe3GxO5b0PzoCpSuu15rjZ4acreq8dDIXHTCt1lAZ8CWAhPXCjjs8Ls
	yINfGma+4VJmE1y4lqZ9ziiPSZ650VGWNYflqXXELEBjCxg0KjmdWosbXwOby6EowvDUwnv
	upES0xnP7ctQg9Dz0hL+syJG7FC2I=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
X-QQ-RECHKSPAM: 0

The USE_SPLIT_PTE_PTLOCKS and USE_SPLIT_PMD_PTLOCKS macros were turned
into Kconfig options, and CONFIG_SPLIT_PTLOCK_CPUS was replaced, but two
Documentation/mm files still refer to the old names.

Update both references.  Point readers to mm/Kconfig for the dependencies
instead of restating information that can become stale.

Fixes: 394290cba966 ("mm: turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig options")
Suggested-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
Signed-off-by: zhaozhengzhuo <zhaozhengzhuo@uniontech.com>
---
Changes in v2:
 - Point to mm/Kconfig instead of restating SPLIT_PTE_PTLOCKS dependencies,
   as suggested by David.

 Documentation/mm/process_addrs.rst         | 2 +-
 Documentation/mm/split_page_table_lock.rst | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

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
index cc3cd46abd1b..52c992b6bcfa 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -37,8 +37,8 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pmd_lockptr()
 	returns pointer to PMD table lock;
 
-Split page table lock for PTE tables is enabled compile-time if
-CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
+Split page table lock for PTE tables is enabled at compile time when
+CONFIG_SPLIT_PTE_PTLOCKS is enabled; see mm/Kconfig for its dependencies.
 If split lock is disabled, all tables are guarded by mm->page_table_lock.
 
 Split page table lock for PMD tables is enabled, if it's enabled for PTE
-- 
2.50.1

