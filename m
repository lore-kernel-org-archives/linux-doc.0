Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE72279DC9
	for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 22:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179586; cv=none; b=mTqRaQdu522w794J7tzpQFry4tw5oldcLDhXq2WNFvUgqPp/ny3+BlljNw5t9LlAuf6Qj4guPMgWfqmNNds2/l2GWFVvdv5GcxlrE/u02WrkoAfSIGhu2IFqyWYqBv8DFuhNVOO7TPotieuD6ypy0ENr+VaeGhyzlhYLCiffhks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179586; c=relaxed/simple;
	bh=dq6VJL19bx4fk8daGhAlZmCEZx9LJQRuBBgg8TWS9rQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u+mAqI8RPMnFy/w+nXPW2rnxo7kpk1S5rpDFpexrsW9kSbDlwe0sIbgg0yQmb/eLDdkF8kdyiTN95hAKpoBEPJ96fo/er2iMSoiW/3gwOiRodI8oaXTbHs/HVI2YkT7qYA8g4yEfWgO938ROO6GpFXoAUGpfmaHMzz9qPge7VOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=cvuTZsH/; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="cvuTZsH/"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-914a90b69a3so1047694185a.3
        for <linux-doc@vger.kernel.org>; Sat, 30 May 2026 15:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1780179584; x=1780784384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=087/smJrDH1Ri/FmSC9bbtTtLl+ESvDrae9U9V2wtSI=;
        b=cvuTZsH/od0mvFzcMzuphLBK2Gi0IRpU7tj7/MlSSWKVugWSdrJ0uRdC8Z9//oJpNP
         ipABiRbvbdAuwcP2e8s+ku+TwCTv75lXIgagypyJuGXjuyBP66f7wg4vopz04GeHpkdM
         ht2yzN3xqnqtSZcRJciz6AHH1924BEAnlBhFxTZQqgZAmfNoBALuWauv8SMMhbC4fgtx
         COvpCTeQWLulqHgVPixW4O79r1f4xedYKhim7RxkuJkAM6al31lIlvhjtxuQe78U00uH
         y9MxQyVjDqzYmYuWXatebpZO6uqUr9EKkvzqpqZf599/OpqDyZnN2Jqn2TqYnZqpeCDC
         guVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780179584; x=1780784384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=087/smJrDH1Ri/FmSC9bbtTtLl+ESvDrae9U9V2wtSI=;
        b=Jxyz1DfV8rlEJry4QPTILKyQ3BBAKm1A3MSkKG7NOGKAMLTaRCuAflyn9JPCdyLTeX
         1hkagSAIchH87xW+F/jFqmo3Km+CnImRNbIGuw1ow2wgp9uh7miOh32p3a/C+e30KXiP
         +1HE7yBL6SEjUQVVIG5vTTx2VLoYa+qsg/nCBhMUOoRnXl9uIGtRwOhKeqaBaXZ4bgjB
         gkWUiNnXlDFTxDWhRof9BewU65+e2ts3UZmt6dbyu5sjrn2Q38jiv75WZIDsbTV4Anly
         aQxi4rFKZEVC7r2eta7ydWsdg4fQf3d8HLeTaKczoGTtvsWsW4i1npUh6Nu0oKriae1m
         dYbQ==
X-Forwarded-Encrypted: i=1; AFNElJ96YOsrjibEY8LI4khpPGybheWYP/t1th7KHIVLgb4b7/HbtOHii+ZZMunxbi69SEhb7TVu/nb/OCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrJj+Me3WFxmhth7vDCJLAD7KFu9A6NJSas47BySPkJYVTCFuz
	Dk06iPz6emcprsYcguoKGCzgywhCNNuChptje17ZqdJbTFujn7auvAfUlJiKQFq7ceat96sBKDL
	7yOBK
X-Gm-Gg: Acq92OHGGY0AdMYX63jd1jgkpCzoZkE+79V33V9qPbsC2y80LgT+DHsi/CxZAxy3XQO
	SX9WmOOaL9Akdlo1KcCYLgFRmpTyIHRJMqOpLmmb5oDB3qyC8MdjRVgGQfrc/SASE9jPTMvY9+a
	1nK7eVCb32wCsRlIntXxaxr3ozWvrWnJrQHWdXRrkXzd5cfm+Swha1CrKYD976Mw9SFlcygBbEH
	vxcsd7MkvobAH4wec9T2XFkVIYm04WaUMOF3zeP0r0xcY25WeZhj+8BZyN8kabRnOxDIxAl1dEo
	zVbxG+3PnZ/kiEofb4xLm/HJTcnOTMsZFLm22BIwQ1yMGlmbGl2fs34gVtyNo1qw75v+lnnAwd3
	QDaX+XSRHo/Ui3ouKJYljc1rxTWQmbKWNqMjKZRRj0Gw2CJpDTVboE/xKvP/19t4Sg5eRJZRLVM
	EW57J9eXPjuS01eQKNdznyNCdCgu3L9oymBE04Dz94fkOHFd77nmOE4KOjpkG2OQ==
X-Received: by 2002:a05:620a:4053:b0:911:449d:98c0 with SMTP id af79cd13be357-9153d9cb08emr793370385a.7.1780179584086;
        Sat, 30 May 2026 15:19:44 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-915324868a0sm651790085a.18.2026.05.30.15.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 May 2026 15:19:42 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	skhawaja@google.com,
	graf@amazon.com
Subject: [PATCH v4 01/13] liveupdate: change file_set->count type to u64 for type safety
Date: Sat, 30 May 2026 22:19:26 +0000
Message-ID: <20260530221938.115978-2-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260530221938.115978-1-pasha.tatashin@soleen.com>
References: <20260530221938.115978-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This improves type safety and aligns the in-memory file_set->count with
the serialized count type. It avoids potential truncation or sign
conversion mismatch issues.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/luo_internal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index dd53d4a7277e..ae58206f14ac 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -52,7 +52,7 @@ static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
 struct luo_file_set {
 	struct list_head files_list;
 	struct luo_file_ser *files;
-	long count;
+	u64 count;
 };
 
 /**
-- 
2.53.0

