Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14DA154426
	for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 21:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718142955; cv=none; b=RX52gqof7icjoyryrn5H0+0BMhrhDCdV0zdXm9ct9DskyZpLmGnCfMHfkCgD9WCcEhICsNL4losZMcC/xUHKtoFLtNMQSx7pAfwxYKu1yIhJCxkIWI7AQlQd8wV4RVb4Ru68zbTc9caALGONDO6UbMIV3gLdQiKv6Z8dJHxeV1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718142955; c=relaxed/simple;
	bh=M8ixCXnJy/op/03sAWshle8LFOVsdt5mEX96fhYZ3tI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ivU6iX+bzPQmM5SmHM2JD/ETDHyEeGHOXrmNs/0rL3hzkFvhNAdL3vKZEEdKh2Jc9RfvRBH/zVJjvcOneYG1IMnKxX0tBVZQZzbTx0V0o78HUn9ij3rRA1y+rizRvb1IBQP70Sse803mWpS1ma7c7H/7eOgkxvFPVYjl7CDm0rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hDZASKO5; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jiaqiyan.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hDZASKO5"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-6e231ed9e5aso3910155a12.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2024 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718142953; x=1718747753; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WHQrsHsxDopyLkSSwJmPkWDGR/C1iA1OobsIIfIGPV4=;
        b=hDZASKO57jsQmxgDQTpAc2CA5Fzc5fG7fYI/lj6fg7tAv2QUw53qiIQyX2M+YdmrCk
         yh3weVCYEdomXFCN4+VHqhEpd3I3Ws/ZjktdCFaYqQA8xNFV2I7QIpAyU9ksMAeEUdca
         m0GWn5wwWjUEArUIjjXZLtobGDPQMW8I/3ilOlaeuqrEXX6DDgVsK7+8UWh19U95gBd8
         La4sgQ+fEpEdQ6oQ3kKRDNGfPtuHYLG9rs9WZHDqH3lHsl+vNfqarBn6fzwyXFWC9A7W
         t++XFbJoxX+ZFSMMv5I+6/mqeLSJ10nFghcFrOdmZ7QjuClgGpbqqbpb9io16BBPhzU8
         s6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718142953; x=1718747753;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHQrsHsxDopyLkSSwJmPkWDGR/C1iA1OobsIIfIGPV4=;
        b=uo9vd/AuxjaWaxkhAb2tmPys47zhBOtca98njS5PmmYT5nJD8akvkKIrHs1i46tA8Y
         3yl/PNOHUAoQDcQKNz5FisEh2LP19Z+8cVM7EY6Ev49JbBx7O3/rK38Q94/DMqQEuERS
         ySACLo5SbCXJQ5qdC5PAu8SiJg0Q7Ro1je2Bpl/isnEiLSqYzucwy1kGXciS/GGJmoKL
         6CoLb/L9+hItptP5dcC3uaw5F/yySNwUOWMenGRxndYn0BCIgXAuWBidNR6gcMj24lV2
         IBjeADY3+2Xnr7EZ3eTB8RyxxhX1Km5envgV/kXUwqRGR8asMK+cShCawm/bnDU+nmo+
         XHnw==
X-Forwarded-Encrypted: i=1; AJvYcCWYeax5jIKKGAKmr5vpa2UcVlDo9ilcfWq6zsa4gu80Y3TdB3IOfS5Jv6ArPwSE4wX0sZsS+bpCiG1F0Z8gbMB6YM2vuegvFXq2
X-Gm-Message-State: AOJu0Yz6iinIxkAHbnsfDH1A3ys30YVlsmkpPZXU3jAxMKmUxJHGaesT
	O+OqVx/3e+Y896nA6Vq2kelK2A7YCrRaIJhThj1ycgtlDU0TFZjo+UjUS5zbzt4zhd9ht938wSv
	YgzX3NQpLqw==
X-Google-Smtp-Source: AGHT+IE7Hu1Utk6hKZYc2/5v0BAUMc85WtlS2vZJkVYtta2I3YTIOk0Jt9c2VGJfWWlmwXFp1yRF39LVPqKQZw==
X-Received: from yjq3.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:272f])
 (user=jiaqiyan job=sendgmr) by 2002:a63:20a:0:b0:673:9f86:3f23 with SMTP id
 41be03b00d2f7-6e156ce6eccmr32320a12.3.1718142952846; Tue, 11 Jun 2024
 14:55:52 -0700 (PDT)
Date: Tue, 11 Jun 2024 21:55:44 +0000
In-Reply-To: <20240611215544.2105970-1-jiaqiyan@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240611215544.2105970-1-jiaqiyan@google.com>
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611215544.2105970-4-jiaqiyan@google.com>
Subject: [PATCH v2 3/3] docs: mm: add enable_soft_offline sysctl
From: Jiaqi Yan <jiaqiyan@google.com>
To: nao.horiguchi@gmail.com, linmiaohe@huawei.com, jane.chu@oracle.com
Cc: muchun.song@linux.dev, akpm@linux-foundation.org, shuah@kernel.org, 
	corbet@lwn.net, osalvador@suse.de, rientjes@google.com, duenwen@google.com, 
	fvdl@google.com, linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
	linux-doc@vger.kernel.org, Jiaqi Yan <jiaqiyan@google.com>
Content-Type: text/plain; charset="UTF-8"

Add the documentation for what enable_soft_offline sysctl is for.

Signed-off-by: Jiaqi Yan <jiaqiyan@google.com>
---
 Documentation/admin-guide/sysctl/vm.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/vm.rst b/Documentation/admin-guide/sysctl/vm.rst
index e86c968a7a0e..856bb17c07bc 100644
--- a/Documentation/admin-guide/sysctl/vm.rst
+++ b/Documentation/admin-guide/sysctl/vm.rst
@@ -36,6 +36,7 @@ Currently, these files are in /proc/sys/vm:
 - dirtytime_expire_seconds
 - dirty_writeback_centisecs
 - drop_caches
+- enable_soft_offline
 - extfrag_threshold
 - highmem_is_dirtyable
 - hugetlb_shm_group
@@ -267,6 +268,20 @@ used::
 These are informational only.  They do not mean that anything is wrong
 with your system.  To disable them, echo 4 (bit 2) into drop_caches.
 
+enable_soft_offline
+===================
+Control whether to soft offline memory pages that have (excessive) correctable
+memory errors.  It is your call to choose between reliability (stay away from
+fragile physical memory) vs performance (brought by HugeTLB or transparent
+hugepages).
+
+When setting to 1, kernel attempts to soft offline the page when it thinks
+needed.  For in-use page, page content will be migrated to a new page.  If
+the oringinal hugepage is a HugeTLB hugepage, regardless of in-use or free,
+it will be dissolved into raw pages, and the capacity of the HugeTLB pool
+will reduce by 1.  If the original hugepage is a transparent hugepage, it
+will be split into raw pages.  When setting to 0, kernel won't attempt to
+soft offline the page.  Its default value is 1.
 
 extfrag_threshold
 =================
-- 
2.45.2.505.gda0bf45e8d-goog

