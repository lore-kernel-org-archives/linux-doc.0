Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1476D29BD9D
	for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 20:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755031831; cv=none; b=NEuhy0eEF8x2s81j4aZSW1iO8Yd0RqldQU1VnfeYlE/HhK+8YmWkRXNw6iGub4BiVpStCoKM2TS3tfPcwZs9GZgnikEQFQ7KA6mBPTWnOssFMBeKUvZnfuZdbGrGVaZ2p8dNHPE6dwIceGmMpa4GGvXB4d47BxakrQedE+pnRII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755031831; c=relaxed/simple;
	bh=al/6/16eT2vH4AdQRcPEwqIs5sRmNDd6EAUnIiSPUlM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ehLZ9xm/dnMnSxhA0TiKwZjkQAHXBCDP2kx7ZaEHPzxPFgw7L5QxJDzv7kygac61xCtLPpUM9jZGHAiD7FNhxumiligbk7EWijRilqw3NsIImXQHJQR2RsoGcoe3dqmBiMqisCtiVUFeMMhU0jgUZy5/mK9SsfLx7Nv+1pskvn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtpqEHhy; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtpqEHhy"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-321c4bc62b3so828438a91.1
        for <linux-doc@vger.kernel.org>; Tue, 12 Aug 2025 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755031829; x=1755636629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bsA3iRJ7B2vjUVSq+560Moe0TKpjqqTO4eEiulS8O4Q=;
        b=QtpqEHhyYnSZsua7IvH/CbQfUzoPOXFJ62iRlwmV2k2P+SNgskZShWxeemsmJgtPNy
         Z/2kdalCj8lCmEw5Y8O5sgUJGBSCC74suoa5Azyt+vHb62GWQaLjwxiz34FT2GWOBYCE
         tqOEwR4eSEAjj7Dp432Ml/KpXEqnxeXAPGDHlCVp4Ep0js2KpY9mmNn7IH6p9OGI+Eef
         abh3v1w6KKBBjXKyE1iXxSrMC6McE3VllS6Wz8VtbWh+ncPAhmRoubHkBrtEt/JJo7DF
         gIdPUQ6um53U/e2f99B9orGh7k/qTdckAUv0lvbMiiqDJZsutWuFSeoJ7L/ptFCO7UEf
         Suag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755031829; x=1755636629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsA3iRJ7B2vjUVSq+560Moe0TKpjqqTO4eEiulS8O4Q=;
        b=IR56l32BGz9GAPR0GTGUkPUqx0f4Z5p/IvI35zRUGlpAWDNuxVImffmWiX/tfhY5yk
         1dNrMi7gkqfC+v7wfFLZlJPINMyxggF/ZbOI9YC5VhyBFdNlcmhdhl88vJuMBpO/DcVZ
         DXGuq+414DMkWXPyfRHeWQp7PSGLM20FFmOU/gQCUrrnwmPJM0AdZT+AhwrA9hd0kwWb
         rcVwH7OBnRV19089/3VGvII7WrS/QheRJUNAVO2qnd5TMezJ5WkQDYbaWryp2f+nfsBB
         BTzwpobS6CGpOswGgoJ2/cVvNZ7JoPsbaUJQLCchB5+V4XAuDrBumxYmmElxGwqc/GxT
         yXlQ==
X-Gm-Message-State: AOJu0YyryQhKZE6Q4x3YK1S63P4A+C5GvodycdbgB9qqWZDXxMhE6zl0
	2VnPjtb6QkkmREg3y7SAR1duljJR79MyqvreTHXa5S7GNe2aWdsq4botkZ0Pll1TLds=
X-Gm-Gg: ASbGncsdXBRhXA0S/vBegEuUolwpGmvVs9LvWAgCokpMgJqF5cikAsEd5LZnvCQ0aOf
	3JVmmzJJwDXnC1pCu2HorFq9qV66ssNh9mSz8mNSzZ/vpOnVJs3HjPC5FXiv2X7Sfa2H58OsyJw
	4Z4tgUvVcRiMadupQLyTynAwJDsTpgN8tzqHqHgyQTOwPpBKnACQxhhhswT2sFWNbyOMCh44/Wu
	CljvVYCOpD8f26ct7nq73YtF4HK0fWBCVa4wV4yIvfD7udgPNTSwQPLFCINh31ttg8s0KD8U5Xr
	flm+JUpDQMDf/h5iqPepGkjJAc+/gm3Fgu2cXxGU8PefUeKV+Dzpq5MsEASRw82odjuxo45PXyo
	ZImadzuMOfBAjaNPplvtb8juCNvLRLP8=
X-Google-Smtp-Source: AGHT+IEMd5X/NZITl5GMZS7P8hBm4ung6Q7CDxTJj+kP/B5/fg8CbQ4kXJWN3De5dPmu9AkDHSjDnQ==
X-Received: by 2002:a17:90b:3b46:b0:313:15fe:4c13 with SMTP id 98e67ed59e1d1-321d0eb205dmr607962a91.27.1755031828829;
        Tue, 12 Aug 2025 13:50:28 -0700 (PDT)
Received: from soham-laptop.. ([103.182.158.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5cccsm76048a91.18.2025.08.12.13.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:50:28 -0700 (PDT)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	Soham Metha <sohammetha01@gmail.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/9] docs: cgroup: fixed spelling mistakes in documentation
Date: Wed, 13 Aug 2025 02:19:46 +0530
Message-Id: <20250812204952.73136-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812201523.69221-1-sohammetha01@gmail.com>
References: <20250812201523.69221-1-sohammetha01@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

found/fixed the following typo

- Availablity -> Availability

in `Documentation/admin-guide/cgroup-v2.rst`

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index d9d3cc7df348..51c0bc4c2dc5 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -435,8 +435,8 @@ both cgroups.
 Controlling Controllers
 -----------------------
 
-Availablity
-~~~~~~~~~~~
+Availability
+~~~~~~~~~~~~
 
 A controller is available in a cgroup when it is supported by the kernel (i.e.,
 compiled in, not disabled and not attached to a v1 hierarchy) and listed in the
-- 
2.34.1

