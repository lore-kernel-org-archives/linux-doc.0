Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431781;
	b=b9ZNT8AgrB1rt9CdTnX1uQWuTLTkGfBUEFJc6ONCKmkI98sqaMZccUPxNkInEYbQN57U
	 p3+n0LzjXiPASJlk3bXrmVHMmfgsOdyTQ57OCMP4p0axn7oBkil9Ifk6RBvp8robviU3z
	 YRfPuFsR48tHxnuKdPfvCu550aXaIswbx7x7CDOymRXdxXgDFvAvrLcyCSHPpeU/nTRvv
	 P7kr8fz9Mr9K/NEJnIz67XeAGIIkYB0PNAVmg+xZC5EQ0ehDeGgfMkO2+nK3PuPH26Jyz
	 TrmDQtGVpzSJOjp58+//WDekir9LAo5tLvLR1+ra1Tt9e07WYiojwmo3aDlzXagcOlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
	b=lrNyYKtRBKSoG4LC6NbDPnN8fIn2eV13YWX0i3r0S7Dl0W01X9Yzyx2A+11WAERo9h3B
	 mFUQ/dj1PEBnuRxzFWpvjW/0f8mZ70Il/bE7MlWh6TnvDsLwqSQmK8+DZYc4gzg2hRwK2
	 gKfcDmLzRYvH3fTqSeouN55V8fiFGyEDwZOiZ1Cbfzha6lRrYzWWUT+43O4LNm0f4aSKM
	 qtk07ohP+ZGmxsd/elOV8rOm+1dmPgXzDRFmPsNTfIWsgQCQcTyupzjJRNjAhopaQD7Ox
	 Ac6Nb66AP3FUrMA/DSPlh/ACkAzXEvq5rzGwmXYLikHRso+ObPUjTYuly0RakSHhWUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ocdymkwb;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B4F606A32E
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:03:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5B4F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ocdymkwb
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f07de402dfso668115ad.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:03:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795431780; x=1796036580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=OcdymkwbFaf5+YUkTOxt1yw8VEcsXE9K4oakwBcWEwMHvCj9EFNWD3IOcuaq5p464F
         8ept51muGSfoG1mcRnYlPu+zqJb0SQ7Ua0Bc+C0f1xw5g28AYuwUyx8UsSunGuT74XbU
         4alSkvX6LEaaEReOivbPnvkauTHKlrinZPcYKVCuio0jwTcbm7Yl0cLs2cBirJw9LQ8A
         CLsLEHxXI/wF7puAw3JH/rMtFaJoDS6ElwoDvbtTFyb92/9VYrtBvqeZH9P9SNtouUHa
         Jjxq0FyHO2LaA/gAILoVWh8AUuDN2f9oL4B19PD2UN8SFEbvc7zGq4GjND+tMFnVir7c
         LmVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431780; x=1796036580;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47jS88Ka87svuDyf0K4DC+GO0aBmX9P2j0Nyp9C+Ix4=;
        b=yDQNY3bVK/oZ1uot7zORz4Ieci2NshjSb4uLAF7PzA+X4IUn4TuTCx8zFNU4fW8z43
         pWCJV0QklQ7LDZ0E/UNtYVkvYLsyW2Iky1xl8aVSVh3y929qphPqv6yy87pu09nAWVkS
         neaGbpDV37V4lWX61t/K7mondOoBymH26Epo6JQNAfpF4XRTik8QP9+mysZb2TzpYCFm
         yV+1Vf8qgHoWxSgI6yMrvxFzD2ixITFKQEcYgs4s8TBYSJD8G2ycYaFTk+GdpWliO/6z
         Tl73cqNFTqxN7CtYUGcPFDz4WYmMlD++09WSXt3WdrHPKDPStzH7Wo1UMED0vl+idfZl
         QDgg==
X-Forwarded-Encrypted: i=1; AL+hErG9PUhcUC1GxiKTEytzmlfVFgaV+4D5eadohnY1rYTcKrqYdhpJlxJsOzYR4K5zzj2zyQIYam2z1P4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xbRNXhwB1oH3MQoyPd1FhdqqZOk+OgNE3rZKFgA6yRCNcQMsj
	J98j6qc8UkmuqICkU0+CNjCUP9gLxmp4XEErh3DtZwM815Mf/DayWWc1
X-Gm-Gg: AZFdTZcHyKFRsIyRoSj0xa0Y1PkC4LkMIBzqdhWUIR44K0bGZOU9sHzNhz/RUKHj5U6
	NDc2rzL9eSeqnf6zugqAgJS3pj/63rcsxhTXXc8SmPdhtH1tr36Fg3GUEcE6BW+Plux1aWDd4rE
	IerSC6o9q8VW+ZIMWvcYMvtH1uaxI5n4eOdCSQdAGeCFvro50Awtv1FVBoeNjPnOJZ8tokrbuCq
	4B8OowCZus5bi1jwJcXSpiS5b19MjgCHe1KY+sClX8HbZZ7TUx3GDwxs/Az0J8GXUHDf082mrK3
	FUIugVMyyxSlGVFR47Y4l64XQYCvF6Z/Sq+enFbKbj9RJoCJdTPXOIN0to78Exg0TZIlDmelM7f
	GIkKsrHx8dZo+N341u5UTeVHCuqEUh5KcbquQU/q8x/6+Qae7N/elppxNdnPnkGVaxliA/XSfCQ
	S9/sG/iZq+3qj+OSCoWLLRqTp0iojxtfgEMgDx4svy8142UnrdQQ8EgOIkr/APoDwTGeujQPC6p
	1IzZEufxC3mPQDmaJca/WiO3+AeDz5PMTtyeNCIwt7O4IBALoXDzEzJ4s9m52IFJ7UWjYyhppKq
	dR0h9FFdxqljksG/ofcyj2SGv+2S8uVlMj5c3vyTRtIoaIfMSskTQaPwLgn/WCVxJqUnLXUBe1U
	3KqJUZq9/TPBUz4V9GsmMh9fU
X-Received: by 2002:a17:903:32ca:b0:2e9:5c29:9955 with SMTP id d9443c01a7336-2f03f1e871amr179469315ad.4.1795431779972;
        Mon, 23 Nov 2026 03:02:59 -0800 (PST)
Received: from chenyou.ncku.edu.tw ([140.116.19.16])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1aa3sm50380785ad.21.2026.11.23.03.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:02:59 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: alexs@kernel.org,
	corbet@lwn.net
Cc: wy@wyuan.org,
	dzm91@hust.edu.cn,
	si.yanteng@linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH v2 11/25] docs/zh_TW: process: sync development-process.rst with the English original
Date: Mon, 23 Nov 2026 19:02:02 +0800
Message-ID: <20261123110217.170025-12-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261123110217.170025-1-chenyou910331@gmail.com>
References: <20261123110217.170025-1-chenyou910331@gmail.com>
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

The translation carried no "update to commit" marker.
commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction") moved the introductory paragraph above the table of
contents, but the zh_TW file now has that paragraph twice: once above
the toctree, as in the English text, and a second, older copy left below
it in simplified-style characters (軟件, 裏, 瞭解).  A comparison
against the current English text brings it in line with the full current
original:

- drop the stale copy of the introduction below the toctree
- retranslate the introduction and the title with zh_TW terminology
  (內核→核心, 文檔→文件, 社區→社群, 編程→程式設計), and rephrase "in a
  way which is accessible to" instead of the literal "可以訪問"
- wrap the :Original: line and the introduction to keep them within
  80 columns, as in 8.Conclusion.rst

update to commit 2b7703e15a55 ("docs: use toctree :caption: and move
introduction")

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 .../zh_TW/process/development-process.rst            | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 1d22aa0d3711..906e635cf830 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -2,14 +2,18 @@
 
 .. include:: ../disclaimer-zh_TW.rst
 
-:Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
+:Original: :ref:`Documentation/process/development-process.rst
+           <development_process_main>`
 
 .. _tw_development_process_main:
 
-內核開發過程指南
+核心開發過程指南
 ================
 
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟體開發）的人可以訪問的方式工作。雖然這裡有一些技術資料，但這是一個面向過程的討論，不需要深入了解內核編程就可以理解。
+本文件的目的是幫助開發人員（及其經理）以最少的挫折與開發社群合作。它試圖以
+一種讓不熟悉 Linux 核心開發（或者說，一般的自由軟體開發）的人也能理解的方式，
+記錄這個社群的運作方式。雖然這裡有一些技術內容，但這基本上是一份以流程為主的
+討論，不需要對核心程式設計有深入了解也能讀懂。
 
 .. toctree::
    :caption: 內容
@@ -24,5 +28,3 @@
    6.Followthrough
    7.AdvancedTopics
    8.Conclusion
-
-本文檔的目的是幫助開發人員（及其經理）以最小的挫折感與開發社區合作。它試圖記錄這個社區如何以一種不熟悉Linux內核開發（或者實際上是自由軟件開發）的人可以訪問的方式工作。雖然這裏有一些技術資料，但這是一個面向過程的討論，不需要深入瞭解內核編程就可以理解。
-- 
2.43.0

