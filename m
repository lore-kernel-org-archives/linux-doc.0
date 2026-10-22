Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792677619;
	b=L4QFROfFzPywstTdAGVoDAJxHWIPotSuRrr8IKDCvnpdXVdnPghxNknc9vLVjt6MQjZ4
	 piE1tAMCjC+W95KuBQDDH5RLoX7MKb3BTIshHPxv/QSmDMyHbkpmCyjEJHlko/jtQCaRQ
	 Yx1t6EV9bQTJeVC1NMkUj9oquINeQOVlwFbkN9uvI6V1Q++uxsfe5i9tYp4prGfr5el/x
	 v4w0JRtVhB0sI40gDl+2fyro/ylol3flWdzGy36MclxGfSlemAqfvKfby3HWUhFsjQ59d
	 MRz93oASl+fWXeEZHIYr88z48YAgIo2nEnyQgW4SPem06xvNTZGEwLvsoCifT2TCsqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792677619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=R88a9RiIx+ZBHt7JCPx3JO6amy3Zdnstjp8CaJTf9jA=;
	b=kavwDkn8Wg6TVnIg4PyVP6QePE1gUxBhGMN+koGATztVPNO4SBzS7IFCqJqKWakZV9y/
	 gItYfpotp3+Ktg4VgW8n1LunrA/SHqop4KP8Rriq9DZNokYYTXVmDPzm9fqFwjgA2Dgr2
	 Ur0KFx9k5uek74boDuv3+dCZU+HMESNffEqt0RYCQKpajnAO8L486mC7oYcLBMcVx9Y/P
	 fNUKBZ/e4/HWvLvM2UCTpec5xL1m+OBiIDYrXJAVQt1Ms4nqOZh6YjrmyAi6vn2oP7Yts
	 sHpcwUH2PntcCaz8Eg93ULxEnpwjPnWHmQgoU/u39Ezx88ptFxz1aC7iSzSpfqAa+uA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iggQ1wqX;
	arc=none smtp.remote-ip=74.125.229.136
Received: from mail-dl2-f8.google.com (mail-dl2-f8.google.com [74.125.229.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2518606A323
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 14:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2518606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iggQ1wqX
Received: by mail-dl2-f8.google.com with SMTP id a92af1059eb24-1379d236149so351264c88.1
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792677618; x=1793282418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R88a9RiIx+ZBHt7JCPx3JO6amy3Zdnstjp8CaJTf9jA=;
        b=iggQ1wqXN7s2+CQ5fyVecHf/SzyX7UCihtwEr73FJBbTveWFBTqHIUKt9Fbvc4hzud
         sFqHXd6Pd+dL7cE0l7t0UmK8HO/Po5J2dkDnbiAg7hmwDXOgZycSMB5qDegNRv+BPSyq
         WCwUYBPy7fJQHGkQWH2dPKKk3aTseswsZ9WFbXyQyfCXbXUf1zl3wUkbXGczBvEJK+Rv
         rO8za7ne9A9t2U1ptz+yMp6GT+l7kWKpFZWRcc2/pjRUG8kEOg6bSyrhlDk1KppTcny3
         bDPk1GN9FeHJbLOfu1yypQqdxMbSWqF1orvVHiaEC1txI7gPGWmWLknFYoSxyPsGOuPn
         xESw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677618; x=1793282418;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R88a9RiIx+ZBHt7JCPx3JO6amy3Zdnstjp8CaJTf9jA=;
        b=CUyjkwgaCtj5U4XJmQxANAzkqGSsd/Mn0Hy5HkjULubX85DugiiCOHPPJDrtoje2i7
         fvwta+Yv+erHYEudn/cLiCUi/v455lNUEnfZ6OM9Eg1rIY6GAX5ZWnxsztoo/FY2lb5m
         OQFjPTVzPuyyuNjOvFyM673/2eumX0gMQ4UKGONGkgI4cXTFWJ/hcYJzEY1gKO2I9kaY
         qwEAG10WlAZNzrHAjfMKm7SW/IB85lPgkyZ1QLPSwJZrHkHOwOO5HbWVvuI6Gltx7rRb
         PXLKeEddNBkcK1rrHsql7vc72uDCtE5j8UCVp4FWtNDx8OvV/sg2oLYElMeuDkW6d/+B
         rTCg==
X-Forwarded-Encrypted: i=1; AKwUvByuBaGif2YavNcPrap1s1U27LKrJQtRAkAtGKEm6Fpxr6XQ0dULGjs2TJP1gxbzG4JPzM2oDrhOqZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNmmQFhDRB1uq/xC52L5ykamIYr7eEMmj00ZDL5c0Qlopeeo8Y
	OaG6hYP/R0LOFDF+fwY4rnTn4YD8y8sDoQabn/sD26uzCNRc+zLjHo9Z
X-Gm-Gg: AYBFou3pTIsEYB7jT9lyVsbf4olpLAAgGsPxh8LUlbFaO84y1vOcL9wyzmysuQa3cqZ
	TeolrMuAcWOr6ta9BOC3U++PeOVP9kDFBwupqrThqWtCbP64h16VGAOD41S0t58RT3cCa+fjZHz
	tv2VPFN48WFeIcCo4JXV8cJKSCzZ8ljgHfJkljVw62J2Y9w7ofv0vTuyac9nWMmE0VLGom90MfP
	Qo7qmr9Y1NTpqrNfTCjLWUxWiTEnbokA/J8thgeIR5NE6/z+1hhEWqKHbVb1pqRbSyRy3oh6GWr
	zHekgel9C6OwMyE7ZW7VnRjya6nsL/5wJzJzd+IuSmeElDvLxr4xsSNhmIImtJ8JCDL8IOrO6p2
	I6P6elsm6TXlsVE/7qUAWdYHXYYywcw7NRLFTl8pjrAKZdxvB/8BjRib6FJ7H2I/vl3nm9iZzuB
	LRmzHZy3banc1aZxcDaGf584NqZGWy+fxvOUHnrULC2qlQwj8nEOucsD3bAIbmEk5WDmFeeVJ6Y
	cgZtBrjpZPq5Nq+uEH9VoFu9Tw8z5Cnb63JrxIFqmaSt4nZHHeQdXf5FLXJPrp4XKiJgi8NZwyZ
	Pu9GQ2wP3ZLpoN3fMl5mnwM9iQLPdqRKm8BWjo0=
X-Received: by 2002:a05:7023:d04:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1909a9e9328mr7052626c88.0.1792677616684;
        Thu, 22 Oct 2026 07:00:16 -0700 (PDT)
Received: from blue.tailcc13ef.ts.net (104.194.64.109.16clouds.com. [104.194.64.109])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d61csm15124464c88.15.2026.10.22.07.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:00:15 -0700 (PDT)
From: Yao Yiqi <yyaqia@gmail.com>
To: alexs@kernel.org,
	si.yanteng@linux.dev,
	corbet@lwn.net
Cc: dzm91@hust.edu.cn,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	yaoyiqi3@huawei.com,
	linux-doc@vger.kernel.org,
	Yao Yiqi <yyaqia@gmail.com>
Subject: [PATCH] docs/zh_CN: fix typos in admin-guide/README
Date: Thu, 22 Oct 2026 21:59:49 +0800
Message-ID: <20261022135949.361566-1-yyaqia@gmail.com>
X-Mailer: git-send-email 2.56.0
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

From: Yao Yiqi <yaoyiqi3@huawei.com>

"内个" -> "每个" and "愿意" -> "原因", matching the English
version: "the reason for the rebuild of each target".

Signed-off-by: Yao Yiqi <yaoyiqi3@huawei.com>
---
 Documentation/translations/zh_CN/admin-guide/README.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/admin-guide/README.rst b/Documentation/translations/zh_CN/admin-guide/README.rst
index ee6dd3782f4a..32bda8f3e088 100644
--- a/Documentation/translations/zh_CN/admin-guide/README.rst
+++ b/Documentation/translations/zh_CN/admin-guide/README.rst
@@ -244,7 +244,7 @@ Linux内核6.x版本 <http://kernel.org/>
 
      make V=1 all
 
-   如需构建系统也给出内个目标重建的愿意，请使用 ``V=2`` 。默认为 ``V=0`` 。
+   如需构建系统也给出每个目标重建的原因，请使用 ``V=2`` 。默认为 ``V=0`` 。
 
  - 准备一个备份内核以防出错。对于开发版本尤其如此，因为每个新版本都包含
    尚未调试的新代码。也要确保保留与该内核对应的模块的备份。如果要安装
-- 
2.56.0

