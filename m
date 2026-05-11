Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D043A75A1
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543325; cv=none; b=e8ymSk81hRUBi5MyrOqk4ZKToOlagGXdcMQwRMgwdRYr4UJDV8CPJsxPqK5GLrQXTJIYRZsxxf10po7dF+EEWeXUUID9frzYPHM4CkfQrPsjSRAYKnQ/+NVNK08RqPUouR4ElA0zXdI39E9REG7PqrUYouIzQaL4Ionis22tbqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543325; c=relaxed/simple;
	bh=9DBA5wHS1wz1qD/m2QL4eJhMj91b/joPGTcCpT2+Eks=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RHtwfr3UZiOIJbNFQTu0Ky17/vZOEfRd0F6DKgM28Itpn7GKy3UPn9kt85EES8awYHjNbIA6Zmbp9ntMFxBHGj9cWIBIeHGYbnDMgrStZ4+YbFnpxG1vkcpTDaVzGP6M+OpVUiW07vMaX5wzsnS5SEWa1EmFnrRzQP2/Wtt4r2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z3TGi4A+; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vipinsh.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z3TGi4A+"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c828659ecd4so1029917a12.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778543322; x=1779148122; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PEYeyguTQfOyWF9RyPuRLLMirOfxgeWU3fHWlC7AITo=;
        b=Z3TGi4A+laRAaDSxy3l9o55UVSOAbIbhFxmFJ9lmnpuPGDoSGtFdiJgymbhPdI8MFL
         VBkSCt7Bu9XAdELJ8wbnJZ34dTIJi391+3g/gmGDgMrVTI+ijFYKcgYtTAqpQSs+7Nl9
         tWa+aBdV4cNr74Q0kq0BhVK2o+zh6O9I1uMiQWSVid2uoVms4iycS6MS9ybDDin0HyHB
         lcyaR/dPWbs9zIBxyFP651OuocVDDuTOCwo9/xkLz3Ths2blfgmNT/YcbxHsANOULY3H
         GHYHOcLswiPDVPF5qexFRkvbR6a3LnjT+vceL93rTEdz5rqzycmHzRwtAlqBUJUcKjmS
         6fbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778543322; x=1779148122;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PEYeyguTQfOyWF9RyPuRLLMirOfxgeWU3fHWlC7AITo=;
        b=mJv8jsT+5WYk9GF1h5Bb+BCFRZSujvhj2T9/k4SAoqOoxVMKn35vlB4ESGxtsACT1U
         SgqOyd1iznRdoDF7lZ3rCMsYZplwA14vI07WyET/uhIu+WOLrVRDxFpu3ZQoJkrpMk/e
         Mb+CEcEYMAE6lIwPjEaokIhm177FrA7ZSuUA7Jd6dbie/yADHuLGHZdnSLnFCoUNOl55
         qGnCcR+ymEphrZdwz2OFeu5zw8djHPu55NOMOtJjMf2toLtlJV06W8ur1JxflNMhZwJ2
         iPR9lC1IsoBFpbXAPa7ApY98kXLNX7KnisHZWnw47aBqZnxL6e1Q4OOevbx9i6R72D7M
         kV4Q==
X-Forwarded-Encrypted: i=1; AFNElJ93t+dyuPdm0TqbTtfGya6yraKY+OJeDz+qNj0hc8KNKp3dcmFEprcv5LdaILJvPDAOYj61PcSkapw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTuh92igLglxWVUaP3Fgxm8+fozcKuLUV5I6tOBeXxf2JuZ6zm
	QOiSZnGsmW/HdW65v4pEWkvpavcSQBKi1Xm/vsapK/lu0HNnMeFRl8UQsanyvv/rds46R5OBMNv
	dqBmO5To1Tw==
X-Received: from pjtl10.prod.google.com ([2002:a17:90a:c58a:b0:366:22a3:3078])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc4:b0:368:b4a5:c4dd
 with SMTP id 98e67ed59e1d1-368b4a5c615mr642795a91.2.1778543322159; Mon, 11
 May 2026 16:48:42 -0700 (PDT)
Date: Mon, 11 May 2026 16:47:59 -0700
In-Reply-To: <20260511234802.2280368-1-vipinsh@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260511234802.2280368-1-vipinsh@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260511234802.2280368-14-vipinsh@google.com>
Subject: [PATCH v4 13/16] vfio: selftests: Expose iommu_modes to tests
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-pci@vger.kernel.org
Cc: ajayachandra@nvidia.com, alex@shazbot.org, amastro@fb.com, 
	ankita@nvidia.com, apopple@nvidia.com, chrisl@kernel.org, corbet@lwn.net, 
	dmatlack@google.com, graf@amazon.com, jacob.pan@linux.microsoft.com, 
	jgg@nvidia.com, jgg@ziepe.ca, jrhilke@google.com, julianr@linux.ibm.com, 
	kevin.tian@intel.com, leon@kernel.org, leonro@nvidia.com, lukas@wunner.de, 
	michal.winiarski@intel.com, parav@nvidia.com, pasha.tatashin@soleen.com, 
	praan@google.com, pratyush@kernel.org, rananta@google.com, 
	rientjes@google.com, rodrigo.vivi@intel.com, rppt@kernel.org, 
	saeedm@nvidia.com, skhan@linuxfoundation.org, skhawaja@google.com, 
	vipinsh@google.com, vivek.kasireddy@intel.com, witu@nvidia.com, 
	yanjun.zhu@linux.dev, yi.l.liu@intel.com
Content-Type: text/plain; charset="UTF-8"

From: David Matlack <dmatlack@google.com>

Expose the list of iommu_modes to enable tests that want to iterate
through all possible iommu modes.

Signed-off-by: David Matlack <dmatlack@google.com>
Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/vfio/lib/include/libvfio/iommu.h | 2 ++
 tools/testing/selftests/vfio/lib/iommu.c                 | 4 +++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
index e9a3386a4719..4b9cbe262159 100644
--- a/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
+++ b/tools/testing/selftests/vfio/lib/include/libvfio/iommu.h
@@ -15,6 +15,8 @@ struct iommu_mode {
 	unsigned long iommu_type;
 };
 
+extern const struct iommu_mode iommu_modes[];
+extern const int nr_iommu_modes;
 extern const char *default_iommu_mode;
 
 struct dma_region {
diff --git a/tools/testing/selftests/vfio/lib/iommu.c b/tools/testing/selftests/vfio/lib/iommu.c
index 035dac069d60..95a494f829d2 100644
--- a/tools/testing/selftests/vfio/lib/iommu.c
+++ b/tools/testing/selftests/vfio/lib/iommu.c
@@ -23,7 +23,7 @@
 const char *default_iommu_mode = MODE_IOMMUFD;
 
 /* Reminder: Keep in sync with FIXTURE_VARIANT_ADD_ALL_IOMMU_MODES(). */
-static const struct iommu_mode iommu_modes[] = {
+const struct iommu_mode iommu_modes[] = {
 	{
 		.name = MODE_VFIO_TYPE1_IOMMU,
 		.container_path = "/dev/vfio/vfio",
@@ -49,6 +49,8 @@ static const struct iommu_mode iommu_modes[] = {
 	},
 };
 
+const int nr_iommu_modes = ARRAY_SIZE(iommu_modes);
+
 static const struct iommu_mode *lookup_iommu_mode(const char *iommu_mode)
 {
 	int i;
-- 
2.54.0.563.g4f69b47b94-goog

