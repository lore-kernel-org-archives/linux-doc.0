Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793964754;
	b=MY444EWsixgID/PqRvARs9NBvL3PXrdXci7aerkfbxOUlOe00a9U6+NP5Trn3orx9gPL
	 mGr8MLZq6hWir5387a6+skMenqUSA/rlE1uFYKy/M9mM4kFA/Ny/NTFTC9OFXNbGxlVjx
	 RBjX/z/JPk1MPOPiaqpDoja8V/Ik+0/+n0tsRi1xcWudTRq4XwgiRAIdJNw3EKYTK+wG4
	 uG03y+I1am04Wn02iF8IYR/DCoOKenl085+NuMZfjLPxRJH4r/lpsxicEle6cdg/jSHG4
	 7OAgAxx6DV4J+L1e2Hzz6XtMSykz1g5xv9dqUwQMdbuEQdIROLnVFBpq66kS2clds0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793964754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
	b=gxviqPLI2yGroqyA6h741ZcWFFJeLM3tuT9lKtDJU53sNLhepPrro2zYEOWk8V8dmh7A
	 5Q7vmqtgTWRqcueaO+t/mAQhgbLI/WlXW1BABvSqdAta2rvRbs/BJbvTT/YZUlye4q5PA
	 k1DmBbCjYn2nmQQqgIou24oW9Xxx8Mx6ZfT8L7/FHLJkVERroGC60HKTHTORFXEPNeBLu
	 07Yf+qI/t9HOmYm75bv/zBH0m1tagl8R7OowWvkl6rqMey7AYFzCVF34aac3AW41ZL2yK
	 Sbrt9zZlzFabIdqO+Sk8rMIAtYPC4T1CK5ijpARJnZP0i1TrFK0y1qd3wOg789ktm/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtJ9a41C;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565CF60A6F55
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 11:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 565CF60A6F55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XtJ9a41C
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0ac1900efso41938a91.0
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 03:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793964754; x=1794569554; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=XtJ9a41CZGIxLZLGdBMex33BufyVPRCqOQcDaU4a4vAu5igU29IQIdhzTnkIUY+lQ+
         2yUl9vCmWL7QcarNeGcK+oHzzlv7hN9bT5C/zcphLfhNpqAgeu+3CZO14yZ6q2Pxx1g3
         b70KQOa4MSVBaCj+BJnD+YN74Mt3IeLdtUEc49pEBb7fY3qsFsduT2DqnWNpcEH3zyva
         hJ3nXpelMbq8s7LKkHmNry+Oll9s0KLj0+lgYQxZ1WueMLPM6WvBlvSi7iPzpYWVjycz
         dgXEDHKhHz0m2FdnarJRuK9j0nDbGHMveDs5oKDmnzMsogasydrwZN4UHt61S1nVTWJx
         qRdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793964754; x=1794569554;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oVA97Gg0MN3pZcfI+vtW4RWyLQjxD9ulAusUkaPOVrg=;
        b=b4ayQQ+ALYyH3Ehj3Kwj/ICDGnnLSSwp/bt16TVnIMulCTe34rcAAVb50aAJFOfoV3
         dNYvb+OChlyjiu7SnPpr6i88IgGMYUVDoFlkLnt+VaINwQ6LbVHa2On9+0cRP1NS2iLt
         V671Ygy2BSrvLmY83cP6peOMTXysvR6YHTINvm4vRz1dM+JZxAjTVyz/6Ja4pW1y8W9E
         sjpvyUwku1ha7Kqa3NxamHqgJlDb/praxxu9vWaZJFPWLaKfRJSJjAQi0kzkKcT8PPxh
         WS1MjCMWuMJDSONQGv7lSSM2Gu43Ed0o64Wpo6HJBLEjjAOz9YIzJo6bxvEFfkWQEjbb
         uuWg==
X-Forwarded-Encrypted: i=1; AL+hErGDOgwQCluRRxta6MPYXn8C+KAmdbA4XuzQEcHORuI5F8ADOGLCYNpUtWXmktGxWjTHKxQ+N7WhPIQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QRoALMeoqfLBgswuynElbcSfKFZuAZlJVclNqW53VlvSqSxJA
	5m0NfN6UvZGXO5mZAPjJJ/mXzPO9LClMQY9Myt/eXOl23a2y13QfI0FK
X-Gm-Gg: AYBFou16zmvjAbbwuZaKMaYUP31rKNsgaKQ1meoEfKf/0D24ioRGsBTdY/8LZcA3Uve
	TSNP+Mxi6X2DosNAMXMxmgzBNP7074zq4ZX13QjwjR24VkynS0K8By0CAs4SMprh8CGTsJ/r9/5
	gvZLc4VCl9dPh0iyb3ALXr70CyLhzLC4rnbrWgVcxXTqQSjRrd0QuGf19CsTncxUi4Ymuswrynx
	z3st7/8q2N4IBRwK89iVZ4JZYk+EpIo3XS21KNkIg1gBVhsQ4Ck8HRcOVwzc3NOHk1Vj+ThGhbx
	Za7huPpaeLkkfr690Bd444XzueNPDo96PLKh5QyyPMmlA9l3Kk/FVC3VWOGacmF8KRs+09Ln6Nu
	7xgereV+i6gA9G+rUx3Oo7NM8yhZK/RQa9ocE5V/sQtuKIVJwlhieGMDm0fTv9Rm97Wtt9Jd4Ly
	vQAuq0Xp8IFJo7Q5MufeRTtNtaQ02XzFhhBRh+eFG97VCX2aPJxakAzcmyYkrSLzEJPNY3O8BsQ
	mgneoyLIjEDozjwW4aX5zSDshGomus2lVouEzl3b5f6piTCaFKQ5JabGARd4Z5kKXUHTqQnCwtE
	fTqbnOLU6aBBz2HGArE+yRZL9k+rRaOJ2Jde5hmCkoXkZcD3WaFsSxx2OLEmM6XyI2sZKHclMb+
	t3tlwICK0slpULZq4yixndUaR
X-Received: by 2002:a17:90b:2d0d:b0:3ab:be66:ddc5 with SMTP id 98e67ed59e1d1-3b0db7056a8mr3470200a91.6.1793964753661;
        Fri, 06 Nov 2026 03:32:33 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7ca4b03sm3116477a91.14.2026.11.06.03.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 03:32:32 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Alex Shi <alexs@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Weijie Yuan <wy@wyuan.org>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Yanteng Si <si.yanteng@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 13/25] docs/zh_TW: process: sync kernel-driver-statement.rst with the English original
Date: Fri,  6 Nov 2026 19:31:28 +0800
Message-ID: <20261106113142.706783-14-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261106113142.706783-1-chenyou910331@gmail.com>
References: <20261106113142.706783-1-chenyou910331@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The translation carries no "update to commit" marker.  A comparison
against the current English text shows the content is complete: the
signer list matches all 177 names, including Aaro Koskinen from
commit b13267ba579d ("documentation: add my name to kernel driver
statement"), and the process_statement_driver label from
commit edba5eecfd6e ("doc:it_IT: add some process/* translations") is
referenced. The prose, however, was converted from zh_CN and still reads
in mainland terminology:

- localize terminology (內核→核心, 模塊→模組, 驅動程序→驅動程式,
  用戶→使用者, 社區→社群, 代碼→程式碼, 支持→支援, 靈活性→彈性,
  封閉源→閉源, 爲→為)
- render "adopt a policy of supporting their customers" as a policy
  rather than "taking measures", and make "We speak only for
  ourselves" read naturally
- wrap the :Original: line to stay within 80 columns

update to commit edba5eecfd6e ("doc:it_IT: add some process/*
translations")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/kernel-driver-statement.rst | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 34bcb6f164cb..11de92a7bcf3 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -4,22 +4,24 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
+:Original: :ref:`Documentation/process/kernel-driver-statement.rst
+           <process_statement_driver>`
 
-內核驅動聲明
-------------
+核心驅動程式聲明
+----------------
 
-關於Linux內核模塊的立場聲明
+關於Linux核心模組的立場聲明
 ===========================
 
-我們，以下署名的Linux內核開發人員，認爲任何封閉源Linux內核模塊或驅動程序都是
-有害的和不可取的。我們已經一再發現它們對Linux用戶，企業和更大的Linux生態系統
-有害。這樣的模塊否定了Linux開發模型的開放性，穩定性，靈活性和可維護性，並使
-他們的用戶無法使用Linux社區的專業知識。提供閉源內核模塊的供應商迫使其客戶
-放棄Linux的主要優勢或選擇新的供應商。因此，爲了充分利用開源所提供的成本節省和
-共享支持優勢，我們敦促供應商採取措施，以開源內核代碼在Linux上爲其客戶提供支持。
+我們，以下署名的Linux核心開發人員，認為任何閉源的Linux核心模組或驅動程式都是
+有害且不可取的。我們一再發現它們對Linux使用者、企業以及更廣大的Linux生態系統
+有害。這樣的模組否定了Linux開發模式的開放性、穩定性、彈性和可維護性，並使
+其使用者無法獲得Linux社群的專業知識。提供閉源核心模組的供應商迫使其客戶
+放棄Linux的關鍵優勢，或是另選新的供應商。因此，為了充分享有開源所帶來的成本
+節省與共享支援的好處，我們敦促供應商採取以開源核心程式碼在Linux上支援其客戶的
+政策。
 
-我們只爲自己說話，而不是我們今天可能會爲之工作，過去或將來會爲之工作的任何公司。
+我們僅代表自己發言，而非代表我們目前、過去或將來可能任職的任何公司。
 
  - Dave Airlie
  - Nick Andrew
-- 
2.43.0

