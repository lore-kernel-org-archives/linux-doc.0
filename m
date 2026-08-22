Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6114639734A
	for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 12:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787401026; cv=none; b=r+UtV+87ypCA4HEFZwbwzVKJqHCkem89y6/P70kpaVsLOcLs3bkA5KX6G6vHy9GDI2EUXkYO4RBI80zDXXsycJmfm3Nw197rNOKB7w5FBO2KTg1qkpqQVSa0F4a94s+i8IvSW13n3xvLqoIVTju8MNyX7V3PEUCEr8096hulKXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787401026; c=relaxed/simple;
	bh=zAR5xcwzNFmHM0U6B06whose7P93OcldQYIG0S4DIis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jh4BEZvPtc7oDqfppaa/aSbwcbcnRxgDuooM03QOkTIfeRnCUzmWRcLuD2jsl0oecG95lo2JARbdCB0ayGP0agtgt2VcIg25B40a57K7kZwlDy05boKr7hsn2PGNYszIJmyz9bK0zeM/l6CZibin28ZGigIctSt/L51JoGAzR6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ArD632Gh; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ArD632Gh"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso3454297a12.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Aug 2026 05:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787401022; x=1788005822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDQl0QFr+CVOpsxDW+qwQjndljswVmu894qFs3wIGt0=;
        b=ArD632GhH227cgrXBoKw2BpRVgtmeXduFSWCaWh510M02/XDi7DQGeM+odUweNcI2F
         JIc72vK1sMJiEgPChcfTyPLD+N2a8AZXGocWXpHzNZ5iKiYr9ISOIRXDbI9iz5q1voO3
         GE0LEd0rZ2AyefbPgDzWNvLUEoD2Bll7QadzV8CP04eNpsfh2dW0NFFWKEiDzR+2XQC/
         Iwa669P3Wfxhx024Fak98DKpeOymF5yre0RzLorTbv7mEZgRvgx0h237H035Ro04xjx4
         H7S3GCQAQlx/jqDpk7Ukg9eyKovbLGQFORt5R0mRxjIBMEDi5xy7aj1g8/o40Oxv4MyB
         KEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787401022; x=1788005822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDQl0QFr+CVOpsxDW+qwQjndljswVmu894qFs3wIGt0=;
        b=NZ/FN53QJAuF3Jmc22jJ46Q8FCrpgmK2Ctl3H1/ZnE4QQQ6vAkBBn9Bk5MTVZfNn7o
         nwoqe7AQGmQQVau99zdRGHW3YfAeuGHZfcyvmK5HHhrjfKMY7upAgmNsUn0eHRT1Uud8
         60ihSDHRg9Jd2Chb4EutszDTAvBkgRTEsRbONi4OJvZW3ycUqAOndbi/Zd+vJ6GwlR3d
         zHJ9t7KjjNs8cF98gxjN4AybClBdBY+2Z/oizAYa5I6rVGD3tFOqL+92hlBqSxBeUSL4
         /iuUxtsLmpBUeqtLH36UnS8TgFL/qYqk+q4/6DFtLOG+hR7C62kxa8gpG0aL1ko+op4A
         Uwxw==
X-Forwarded-Encrypted: i=1; AHgh+Rrktv0QRd3bjv00cnm297yBedX6QE39TAsCpLTmYQh1hGSENuVbqehQ/z9xIP5gZohZrBahWbj4cnM=@vger.kernel.org
X-Gm-Message-State: AFuF++nmfAI9W2//Ufcq9Hi/uCWHLBF2E0SoXhIcNA1DKVaYm4715TID
	CLPzBuJdMpbQI+uirpcSB2RE5QJzvBSAcroiNkhXB53t+zQweHLpxq5I
X-Gm-Gg: AR+sD13QzsZb94nRSoAxwOScd39VNsMDtNPxMNDN7nX+VTaFXPMMgulh4yRJtbnXb8U
	kOrFJIoGxT/DYBAQEnM4OIOeia0b6tvl2opKDUp1PEPIPpOm+OrTawisLY74TEARF7sQ6bd5NmA
	PTZkdgQbhaYcDNzNfyKv3hgnicxaolEl3DHo4FCrMk4M5cBnToSSglCj8oAufKkaFHu4POd5JYi
	jeqD39f8O86nqDHFSxSC5pRc7XE0U53E0vE3X2ho8ythEBgqFw3jiRoj45DaWKseAG65R2mwvSF
	I0YRztpgWLz2HTqnnRgqnzosDB2ql3bDeLK+8Kw+AmWdqCMNDLRM7PxePmjaBDQz806mvatf9dC
	/Of5fIf3VdVVDR0Cu8sP9/hMAFE5LsbtMw/6ugh/GrwTu6iSyfUR426RkV/WVdcLagl7CQ7ojhw
	HXzfJj1axyY/LqWjPGAVEFtY01nwSjvltVeybzBNL92nVTeT4KFy8s2rBsCQ80GHwAsJY2tOSuP
	hBlH7ilToUwF3ww/FlCKYlr3OLDifxfevUu9ZyVcsA/J+wsoFpTUnb0iNFVoTflrDLpuUOwGvBb
	By+RvEq5QTeFLZ+iEK1zxJuyMT8wk2ndRKzghRjEu2lHydyxnnlN9NLEx1TKxCZC3/5j
X-Received: by 2002:a05:6402:2356:b0:698:e614:e4bf with SMTP id 4fb4d7f45d1cf-6a5829790b0mr4918019a12.0.1787401022267;
        Sat, 22 Aug 2026 05:17:02 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a0f5-8c01-3de3-cd62-aa6f-2fb0.310.pool.telefonica.de. [2a02:3100:a0f5:8c01:3de3:cd62:aa6f:2fb0])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff0c30casm10998322a12.7.2026.08.22.05.17.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 22 Aug 2026 05:17:01 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] docs: irq-affinity: Restore grep in example
Date: Sat, 22 Aug 2026 14:16:46 +0200
Message-Id: <20260822121651.1559-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822121651.1559-1-kmehltretter@gmail.com>
References: <20260822121651.1559-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command is missing grep between the pipe and its pattern.

Fixes: 18404756765c ("genirq: Expose default irq affinity mask (take 3)")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/core-api/irq/irq-affinity.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/irq/irq-affinity.rst b/Documentation/core-api/irq/irq-affinity.rst
index 9cb460cf60b61..671604c7395fe 100644
--- a/Documentation/core-api/irq/irq-affinity.rst
+++ b/Documentation/core-api/irq/irq-affinity.rst
@@ -53,7 +53,7 @@ Now lets restrict that IRQ to CPU(4-7).
 	--- hell ping statistics ---
 	2779 packets transmitted, 2777 packets received, 0% packet loss
 	round-trip min/avg/max = 0.1/0.5/585.4 ms
-	[root@moon 44]# cat /proc/interrupts |  'CPU\|44:'
+	[root@moon 44]# cat /proc/interrupts | grep 'CPU\|44:'
 		CPU0       CPU1       CPU2       CPU3      CPU4       CPU5        CPU6       CPU7
 	44:       1068       1785       1785       1783      1784       1069        1070       1069   IO-APIC-level  eth1
 
-- 
2.53.0

