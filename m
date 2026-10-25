Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792950029;
	b=zZh8NbcBT8M5Y0rvL47rNrKe+8s75nV1QXBK72V5Zf2cfeA0JYh1zHm5WrK/DCRnsa5z
	 UT+ROyz2iQtpVU9viuN1PvwE1DgCj4qj1kCFZNTm2plFv7da0T7pWbDdPQ7CpKZZs+kRy
	 F/BLwplQ/c2xQxGq7ZpFkyDPFGCgpUdZ9xhBXe10BTdEuIfTMHqwESmb31SrqBdsbwrvx
	 /4CeCTVcDY81htKaX6+MqeiuEIGT7BQnmcwAobZNWZhEVoNTpu8jgsLAqY2gIy5E5GxH+
	 /+nNMLQvIuN6BQvV3RN/Sy9IyxXGlNX9Qmn0PTgZSAhxODFuzYueuVEyYSGVdaCOC6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792950029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
	b=bd1MQHBHjv6hvKBUznHfIOW241Ju6wOGsHv8Exr4Ba+YUpoIiWhL/GQU0CvDmqyzFkpX
	 EXK8J/Zcwurkn8V+WNVHMeiTbILRartKYy0seCFy1hErDN7/0uShWMRh7jbut39eoUawQ
	 j3se4fShcRYGCIMk2IfpHkKcPUI1+frsf188n5iMHdUNl0RTwBUnrPf9+QWbJBl7RHzpM
	 pjzPzABDyHCCyNhktyFpHS00XGVvD/9sQJ3l/RO6KLwD4UqZFIP4wLldzW/BgpcX/eXj4
	 AtTlGzUmOfT3ojXJLfpB0lwWQFzT4cgWEgjhXlMEFvr+u/mWbJL9us468GezVq1+Czw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU;
	arc=none smtp.remote-ip=209.85.221.176
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE5E60A2606
	for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:40:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BE5E60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=kThEKxFU
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5eafb65e169so1728480e0c.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792950028; x=1793554828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=kThEKxFUrqmeaZ5Mk6vciR8rP2LVT4S5jo7RRtIro4YklfgsI06MKzt6CM5C698Gup
         yaBf7w5cgU7nNd3L0xe4jGsl2RTN8n4bzx+QqO5uqg1MpCFAkeU73/5kisEDGP2CRoSg
         AViw4qdfFio6tUcGYQXvctYxEvmhiLMVhFA5HulzHBjErF3h5Bt82MXGoJIe1OzBvgIl
         D38QrZk1dchWoPYT7olZLi5gEg0/RvaNnXeBT6K2mPuD5QBfHf7js/l0jUpSTMDGTC8i
         mqtX++20uNhM14LdVr5Vpqp+jrAHLVf8Tu5N97E65WrdA9PxQZ9lZgE/salRpmwtPnI2
         uSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792950028; x=1793554828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1V5FDGF/e6SVBVJsOb1x0mGzHREcuT+Gfnqc1J4W+DU=;
        b=noRPTiX8Sy2RmIoHj071EZSIquaczWhdy9+j0zg7gQb39BKuI/zm3ZOunq+yF07Tf/
         adyLpFZ4pJM65UORW1FJUqYmP1Qh4jDqjBa3jHGYhtpQEHRK2csRpUfzvG/klsFlr/yC
         7XLqypUzXkajh3hZxtqlNbpgHwP5RvXKvZFV9d4eqpfyfxLEE+49vXlwkpFI2BMblEj/
         YhPO5XVAF6AxDWHOB2NB6q0QcNsWv+RWvNDoX4XYvxXWWddZeUHD9wwRPhbKJAqYywrj
         HMJxHKIQDH8dWcFOfKFKlElLOsMMZq8thQy7WJYzrBPmQyu9i09qtfsWxpSfxnoLudTM
         W/Yw==
X-Forwarded-Encrypted: i=1; AKwUvBz7/y5K0QYaC4xNcFXXD+CTAYoKqSV/rrG1i1Lox+SQX/WdrACMCieURZ2S3b7XRpn9Ktr3WKynHsI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLdDJrIZS7c+OSqhGnLgSys8JDXa5T1IwtuCmJVANeBZpiH5NwU
	pOmA51rXO/gmPEFyBrcG/hWKKO2TzE5B9Qs9C8dUl27ZeEGBC0urRmQd4TZ/aIt5WtE=
X-Gm-Gg: AYBFou2V9PFu+COapTUkGjujZXoVC/5wxnvj9eFwWuw3irPqUcp1lXQsijujS6KATBO
	3+rleQjrhsmWqDJdrZ/H+fYGn1j2/m8AtxT/yBxw/Ec8z5jHZ7GidX/w1C9HCVMJ67IG4DrcibH
	xWI/ON/lZ2nNGea/64VQah4zT6obLIN0ed1pgqbynOqstU1ogyDFHHa3QkpL1iv5uavVS70mio4
	aFg57V5oDfjlG98eCbThOa7TRLXSxxqWvB2i0/llK//qeA4zFpM8K76R6A/pZNSRQiym0oZEXpq
	sLdmdOOUc/7lSRdavuzagW6BLj+0WeeCIWZqA+cBJPNckW2HX/JM863zv1ymsLLe1SaG/Q30dV9
	8HJwRm2T9OkTt2ZeWJXwqaF30A5rCMJnaEzyPKF1C/JW8ZqYucuK7bBQG5yAV6JBik2x03no0yT
	b3sRar5YljRNX/8SCydIc5nvD0y9EPRq+mTTmM1GId8P62TwB+Ea7famfjCPWVrYW6oNnEcPmMq
	aTqM+1TfoUYqcjwyBkIQhDleyQhSTzOxwy++3ehPgqrda1rg85aXdf5cY0qpAsAP1PpKtXBoVAX
	WHhDkAxoDiqfdn8omrC0gEjIUTqMDd4POx0M2MMGDAdRMUfAg9BHSpgv5CBbjKv457a8wWIVNUP
	Pc1Uh5xpjOhKLKgICVlSPiQ==
X-Received: by 2002:a05:6122:50a:b0:5ea:be1b:1b66 with SMTP id 71dfb90a1353d-5ec22ecf5f6mr1525623e0c.0.1792950028135;
        Sun, 25 Oct 2026 10:40:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec234673ebsm5783333e0c.13.2026.10.25.10.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 10:40:27 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	kuba@kernel.org,
	enelsonmoore@gmail.com,
	bp@alien8.de,
	shuah@kernel.org,
	david@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	mhocko@suse.com,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vbabka@kernel.org,
	dapeng1.mi@linux.intel.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	surenb@google.com,
	pasha.tatashin@soleen.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	elver@google.com,
	graf@amazon.com,
	lirongqing@baidu.com,
	liam@infradead.org,
	jlayton@kernel.org
Subject: [PATCH v2 6/9] kho: support read-only KHO mode in KHO core
Date: Sun, 25 Oct 2026 13:40:13 -0400
Message-ID: <20261025174017.3870481-7-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
References: <20261025174017.3870481-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When booted with 'kho_ro=<pa>', skip standard KHO bootmem and FDT
ingestion in kho_populate() before early_param parsing runs, disable
standard KHO in kho_memory_init() once early parameters are parsed, and
use kho_ro_get_fdt() in kho_retrieve_subtree().

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/kexec_handover.c        | 8 ++++++++
 kernel/liveupdate/kexec_handover_common.c | 2 +-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/liveupdate/kexec_handover.c b/kernel/liveupdate/kexec_handover.c
index 67efbdd39439..cc56caeecba7 100644
--- a/kernel/liveupdate/kexec_handover.c
+++ b/kernel/liveupdate/kexec_handover.c
@@ -1819,6 +1819,11 @@ void __init kho_memory_init_early(void)
 
 void __init kho_memory_init(void)
 {
+	if (kho_is_ro()) {
+		kho_enable = false;
+		return;
+	}
+
 	if (is_kdump_kernel()) {
 		kho_enable = false;
 		pr_info("disabled in the kdump kernel\n");
@@ -1841,6 +1846,9 @@ void __init kho_populate(phys_addr_t fdt_phys, u64 fdt_len,
 	bool populated = false;
 	int err;
 
+	if (kho_ro_cmdline_enabled())
+		return;
+
 	/* Validate the input FDT */
 	fdt = early_memremap(fdt_phys, fdt_len);
 	if (!fdt) {
diff --git a/kernel/liveupdate/kexec_handover_common.c b/kernel/liveupdate/kexec_handover_common.c
index dc25cb4c08af..a9bc8d45d3ba 100644
--- a/kernel/liveupdate/kexec_handover_common.c
+++ b/kernel/liveupdate/kexec_handover_common.c
@@ -263,7 +263,7 @@ phys_addr_t __init kho_get_mem_map_phys(const void *fdt)
  */
 int kho_retrieve_subtree(const char *name, phys_addr_t *phys, size_t *size)
 {
-	const void *fdt = kho_get_fdt();
+	const void *fdt = kho_is_ro() ? kho_ro_get_fdt() : kho_get_fdt();
 	const u64 *val;
 	int offset, len;
 
-- 
2.56.0.307.g5fe7bd680c-goog

