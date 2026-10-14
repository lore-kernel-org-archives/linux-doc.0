Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6C45625E8
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 15:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992802; cv=none; b=n/7uTw+2d7dRYOa2Ln6DDC5ro3A5FNdxnasfUFieJzs8ougLIJ4oby/kpkGzVmiHEprEJdMB332Ym9xBu7nu6ZHMFmPZFdCa4najDi2N0Nx6P1ung/H6gG/3kpVzuDaoE7XyWU2Uex2n9pPyfy42j/7mZ4i+sSIzTIdbtap+QHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992802; c=relaxed/simple;
	bh=IYTAljIE09eUQdv5gBp+pN3vSrMjNBjKLSQgelcAn4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=do82jyG04N6JW6b+6iPoJfIqIDOH95OU2JlNSx4qWUHDf10jiaNHXsL92hAjDTOCU/t/hwdvzPEdog3gQF/eL62H4TIt56TeuE80XHxFCf4dvmhSZ+VqEEs5/bY8xods1a8MAnkwtJtOG9afAEkPJpSoHGi7YBRQYTLbJGIvfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTBF60/9; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTBF60/9"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-872024e2b4eso1767839b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 08:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992791; x=1792597591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=CTBF60/9/N1GfDNEXzwBGYjI5IaaV0EmdhC/pOhR1aIgdkkDlzEHL48Iy3IUdv+AoS
         z0lrXeYzR7ekLolw1hm6VSWJLjb/6VlDvqYwwieCb0mxmePQTcdFzsMMo0YLCENOOL5o
         y00ctXyf1dPydQe1WX/CvHF8HVvgbYrBRrg31R+4wAa5GMmrYJCAGgT+WHO+OSS5EFnh
         5LwJT4WOp8ii456LMSvvKdRmhUOx5T5pvKnkD5OckHKjEym/VRKdRkiA6RATFdv6Cv1R
         A6fcXRRoT5Aeh1MbXQcWZ8V7cV6cywWEbSnDq7Z9DiLYcylMB5XF8FFVyo6Sm1/cfx39
         F+Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992791; x=1792597591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZIBM6OQ5GTAEXrN98yT6rtm+n99DbEWIcKJB9r7iPc=;
        b=kkH2TLL2S7K3ZoSr717999onEqwBHAPOMfm4OPwPw0v65XD3f7iUToLep/85yo+ERF
         47XVZBtXHZlTswx9sy/sWx1BC2dEOUSZYrrnLsgP+4HXDozHFyquh/HqSPBbVJyAKCRF
         iyO7eNJgodvSXq0asFga2dZvwwlr5BmzJIA6SQnkFDU9+aqzlbInltMd0M57Fvshe09x
         VeCuWLdSthSARYTdrcSbiMz/D2i1+XVLSrCNrRsJgum+vOQzrPpfcbmOBawkGtLMkXPa
         PKy1j4dBkyE5HG+sAs/vQ/RcPH/daHYKTB9qyvDcRIY+N/bbtfVSw1SjUqOFrcKjZsws
         pAPw==
X-Forwarded-Encrypted: i=1; AKwUvByQVt0DE6wyqRJCKol1bZ8rTtGtskuf4DnEioLbJYjf3pFIIJzPQGbEHg5UmZgd31n2IhhYSPcTFsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRFRSbbsWDkqDTN8fFSMvJbu+odyj3etIDNA5NyCIJY9JsHsNG
	aReAvyUtOBtgAQz85lR7VvUUSpByWwPJtc7PEzvdN9dDioEH3nYrA258
X-Gm-Gg: AYBFou3cNdfS+OefiiygYnf1q5hsOU8UZwtIyTPwyi5HE5489ClrYdtrWv8jJVYFsUe
	6j5wx1DVd3noeaRdhFNLYcuq49pw6HpWaz50NsdRSprtjY3tSXCwfuIjupihpyVMSbWYBcBZGJp
	fYbupWlfTm8COGqYUU+lMsbU+ob14752OlB+Of+Lc6+JzQiqWui7J0KNMynMWhkWNfB9s8H/RCV
	ntfeRAj5cD0YoJyt+FRPC637SZjKinaY8OcZfS9KvYPHrvPcCr12OAPl2HR3XWnF4UKCX9Gb6ZQ
	VkTjak4TLn1+06vbcliulCDzMj47Ea+S+0BHcIshHVBU/rnOhrcRt10bEq5EAvgCbxzRgyphiuR
	KRt9LgiMJU2trIrNJDUCxH81IEN8Dm3D1NbmT9LoCTCpSFQ11pmcbbM8dJfNe4H2bzRNV9TqSfF
	/40FT2gnWDUN4EgrU4SA6lQAkXHrMogdtDHDIJzUB8BtwGqteAv4vSSeaUMOKtyKvDVKeYzFc92
	Sco
X-Received: by 2002:a05:6a21:6813:b0:3e1:bb35:476c with SMTP id adf61e73a8af0-3e1bb354babmr5956800637.72.1791992790646;
        Wed, 14 Oct 2026 08:46:30 -0700 (PDT)
Received: from localhost ([37.22.102.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89d80511db9sm1300598b3a.56.2026.10.14.08.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:46:29 -0700 (PDT)
From: Vladislav Zaharov <vladazaharova2018@gmail.com>
To: dakr@kernel.org,
	jhubbard@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	ttabi@nvidia.com,
	gary@garyguo.net,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Vladislav Zaharov <vladazaharova2018@gmail.com>
Subject: [PATCH v6 3/3] Documentation: nova: remove completed GSP log buffer task
Date: Wed, 14 Oct 2026 22:45:54 +0700
Message-ID: <20261014154554.231015-4-vladazaharova2018@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261014154554.231015-1-vladazaharova2018@gmail.com>
References: <20261014154554.231015-1-vladazaharova2018@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Exposing the GSP-RM log buffers through debugfs is implemented, and with
the gsp_keep_logs module parameter they now also survive a failed probe,
which was the part of the task that was still missing.

Assisted-by: LLM
Signed-off-by: Vladislav Zaharov <vladazaharova2018@gmail.com>
---
 Documentation/gpu/nova/core/todo.rst | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a01c362b1be0..28fc7329d56b 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -141,18 +141,6 @@ Implement support for instmem (bar2) used to store page tables.
 GPU System Processor (GSP)
 ==========================
 
-Export GSP log buffers
-----------------------
-
-Recent patches from Timur Tabi [1] added support to expose GSP-RM log buffers
-(even after failure to probe the driver) through debugfs.
-
-This is also an interesting feature for nova-core, especially in the early days.
-
-| Link: https://lore.kernel.org/nouveau/20241030202952.694055-2-ttabi@nvidia.com/ [1]
-| Reference: Debugfs abstractions
-| Complexity: Intermediate
-
 GSP firmware abstraction
 ------------------------
 
-- 
2.56.0

