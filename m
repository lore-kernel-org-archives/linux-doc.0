Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375A345731
	for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763144514; cv=none; b=Ifiz83fRH5u/4135r3ZH+JVKDlFv3iCoIdThsDGIZCeNbcAZH9mtQ01aoyVE4lrMLw4OU4L+Fo3JPXlCgKz3cdsVm6relqc1VKgOq7tMdvUaxRzX4BEdtBvTCKkDYwk3Pw3V1K7S7SbScEKd0umgpcawGwAOVsMbGCEGyLHCdek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763144514; c=relaxed/simple;
	bh=8qNH+bv6qnOKRk8Ht91oNJxRGlDhaipub/m6U+pzcsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e39h/agdFgYNz9cBKIJSa/2k8ocyQAbb9pIwtfvxMNGUhgfcIrB6+K66B+jR0KQMflvsOO4awq8pBBIpkJl8NZwrI0SAXuc0d75U6RpHrLrW8OF6TUQhQQFlYH5VL4y90GBIrV/FwsAQUgSRQ0JXniPcPWGNp4EE2nxn9L8rL9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cJetZ2j2; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cJetZ2j2"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-47758595eecso12860205e9.0
        for <linux-doc@vger.kernel.org>; Fri, 14 Nov 2025 10:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763144511; x=1763749311; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOShTwAArIFHr3R9C6zEKOQttwiCluYdM1UARxYplgk=;
        b=cJetZ2j2/PRUXdkMxuHGwFMqEhhoA0QBzmSX1u4hlsG2zvCHALbT1d7zqfA3Rqnw8Y
         2VZyI0+WYL0W+00ADBCXPpeCWfFtLYi2Nwxq3sVVBk1GWMi7UtWeiiscgsqoqRjK5sk3
         PgCuUIf74lmHyPOQ0uHISOETrtD1KcciKS8reZdMnYWr60PURfj5Ji7Yoj7XoRX92pHD
         66nYzgQXFAtyH4ZyHxssA4bqhrOSHX8MctNf7B1yauginputyJdhmcydpl8/6aHHSa89
         jXy1/LrtpXlOKXNv16LnfxbQx+iCtcFRJKDwJ2Jz+Dn+GfCeMpetevQbYHgMd94WRxQS
         miLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763144511; x=1763749311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MOShTwAArIFHr3R9C6zEKOQttwiCluYdM1UARxYplgk=;
        b=LPcr133OoJQIIEVbehJdifvxd1SV9LMwzo9oJGVIjnqFKpAJiWqLvWEBJTF6Xt/ajq
         0Fi6IDqqX+BI3awXkDFVAtISHec96rHMaJffTIpG+rx5Sn1bq3dltAeRew4LZva4bWs9
         0adNcHfZuRfX97JMv6wnq9bvKf+owgKOzkEMzf8ifL4yMJBnJ64cDYIw70+01sgxFODc
         e13FnwMSlos8FwcoMP4H1AQWsd0cO3mB6l+sZ1/EU+jNTITV7mdrUxPZ6jiTzENvvWhq
         b2x7nRM2PcLdtih/pKmjvvdcNejai0AabZde1DxzH5JaWbAYYKfbOsLXyU/GY9skUPta
         12Gg==
X-Forwarded-Encrypted: i=1; AJvYcCVpPMMf41pEu+kQTV7N6dy8Tzce/dLGE0N6reubzZb0q2VUNbpsBHs4VnZJoaXyNGDhS1knkvg4bwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCChgqpYW78HInxAXPJwz8vsy5jjRd04vEMpJdSFzWhHI/uH9v
	65Gc5SepaAyoqpgJnUXhfH2tX8/wDEIsVR8SATAqJELbWD/rps1mLe+VFzbbbTQ557gkaxuNydE
	5MTwA
X-Gm-Gg: ASbGnctdxor01EeDRJiaxgElq57eDvbSUSqVDNsCK/mmQCEg3xFmSQgOkbNL4Oc9zGn
	13IhmifCgFRGCcfcteG6D4uINimKCk5lBBeOkUzctmQvKLX+eREF3/4dwIOgNCHYx24F2FnX18+
	OvdxsblJYoTk17rCaY04mcgU6HWlLAAZZ2YI+Ouc7I2gfvZcJq33WKZlO2gzX5A11vc1nHhxgpm
	auNyi2LOnPRexCNvLSW1Ffz30YOIh2/YP5EawMTQcZs0xTysBo2kEcy2WOMJNzoE17CvTDSVYiJ
	c7OAoVx/JK8Rys31ZoEn53oVzHl1WTQOv7wk20MTVfRT7+EQj4Zel/OZ6xiHaylDJ6RRqbHMG4n
	u5zTaOkRWDsk8nVrCQhut6PNZaXcT8r/omE8biFDySNqp4WgprimNu4FnOfQBByp5l03hsh9ihP
	BGmQ62tOHsOHU41FJf4yfD
X-Google-Smtp-Source: AGHT+IEi672ocN9HJOjDk4mkON5X1Kwc+vDF8kTUOrO8ZZ/Mjdjg3mnnnul14tWFLNhxG+MPCcczKQ==
X-Received: by 2002:a05:600c:4f93:b0:477:bb0:751b with SMTP id 5b1f17b1804b1-4778fea1056mr38183415e9.27.1763144510774;
        Fri, 14 Nov 2025 10:21:50 -0800 (PST)
Received: from blackdock.suse.cz (nat2.prg.suse.com. [195.250.132.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm163601805e9.3.2025.11.14.10.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 10:21:50 -0800 (PST)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Natalie Vock <natalie.vock@gmx.de>,
	Maarten Lankhorst <dev@lankhorst.se>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 3/3] docs: cgroup: No special handling of unpopulated memcgs
Date: Fri, 14 Nov 2025 19:21:27 +0100
Message-ID: <20251114182130.1549832-4-mkoutny@suse.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114182130.1549832-1-mkoutny@suse.com>
References: <20251114182130.1549832-1-mkoutny@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current kernel doesn't handle unpopulated cgroups any special
regarding reclaim protection. Furthermore, this wasn't a case even when
this was introduced in
    bf8d5d52ffe89 ("memcg: introduce memory.min")
Drop the incorrect documentation. (Implementation taking into account
the inner-node constraint may be added later.)

Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 Documentation/admin-guide/cgroup-v2.rst | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index e0a659474fa47..4c072e85acdfe 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -1327,9 +1327,6 @@ PAGE_SIZE multiple when read back.
 	Putting more memory than generally available under this
 	protection is discouraged and may lead to constant OOMs.
 
-	If a memory cgroup is not populated with processes,
-	its memory.min is ignored.
-
   memory.low
 	A read-write single value file which exists on non-root
 	cgroups.  The default is "0".
-- 
2.51.1

