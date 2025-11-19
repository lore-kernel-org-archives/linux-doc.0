Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 585A536A028
	for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 15:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763567146; cv=none; b=Fs5pCgPjurErfcvClnZbcX+xCMCR6VBia+9cn9EZpnYwrOfXTZ77SSsj9mzq8CXLWSq+0k00ICmk4ccoobt1giaX7Yi3aUpWPPVnAtMSqyesMU8aoq2niV9Q8OxSLSTiTOHwi9KMh5PxUdztVkZldtR8/W08fGd38FrhY4l8n4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763567146; c=relaxed/simple;
	bh=bdt5n2rAVI8cStNvPmdZt8oM87hfXgPy8mlP/xL4jOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZaPIg8lyvtAFZ3Yltj90CfpP7AVjilaQgQJMcSyq3BrqRLzG5NrpVMWQCKAKhhGchMwrohKElazip6saZEXyw6ZlkDZln1Hd4Nt4aOk4lBFW8hFokMSC000b/xVDAmmmlzluaqtLkMYXjqP9j0SqvxDkMr0I4y+rOm1a+7pGGhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bz492DHl; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bz492DHl"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso3930699f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Nov 2025 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763567138; x=1764171938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=bz492DHl5yOzE9yJqimKdlgCFvBmcsPkvDkuBNCriAVZnkeSAqY3nP7LGbyBZvdxbW
         oc2HOPgDgVH18yyt6HjNfvydEL8GIuHXv2Pofai7w1UKXlmII3hPumvCXNOvOePSROSi
         e/2BiBnIWC2n2sNn+FoRECLcoeEkoo+4CnwCEhpQwBpUULBVqNYLT4F1hgITIZqkJLqQ
         bfeKsPz9KlTRqx2ZVlK2A6artCAtJV32H7NQpEOqVUMiDR1uo3umGlgdSfA+RVSV9ygb
         zLmQSslT7dn9MaSqtfyzoxsSoi+0bpd+NdlBvr5Az29P7gmjqheUCt9rGNgINWi3WwuL
         Kn/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763567138; x=1764171938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=slnZKLktel7FGULom0AhklQ/3aJdt8tuo66g65NOCPI=;
        b=jjAd7HCqn6BaQhmn9zcHbTzRbkEprU0j3npMMcapaTWuAt15py/ssI0ORRo003i3nH
         NXLkFS6FbjofWtwMV2SZnihDOMy0lmrFNIJAifK/FYXDdURmH+cumzV7sAET5yGA/z6h
         OaQygnPH+FhoJrQ41oOtV0om656RXS72XtdznhaimfzDHBbm3j+mtW8x7Xt4QvCybhWt
         FM3+OnQOTLbfGUhUO+BC7yj1hfSmLmH/zuw99HefSuEJ0ugn1HjeW88tQj4V0/xhfEQv
         r15upbQ7PuKKSeYS2qSaQMJBQWQTKTmr/JGFjHEpdZHH9rVvkM1QgX8dDNnPDOQNMTsX
         nuVA==
X-Forwarded-Encrypted: i=1; AJvYcCV0hBLWPi2M2ggajgBcGO8I9g1yYJLtmslRLnYMzsq4GJtS48Q6hWe6qrFo0PG6olpEUTo4bbzRD7s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6+J3DzB2EFZW5bXczHR8C6RmgRUvPk1hc53c1ZOpIXFzWFLTI
	mMTOH8zmDiokh7EREeLo+8PmvmMB+fLpa+Poko5rKToimTpCZH8eqv8gIbwI+iOW8Bs=
X-Gm-Gg: ASbGnctWIXiJITPet9ww95z0EHog/+2rDNskLYd2x4ts5JxxTJz30BLMQRLCp0ztyV2
	xw/cHwk5UoxsSL8dL9RNNeiGArgugYvLDyRcH5EnN8pt1YkkpLYoUEC+EcI1HfksbLiZXofRgrT
	VQ9XQESt0vm+DHPZD9kPgTXqG4et/DcK67xcgiRJh3iw1uQULz8saeLfCd8sElAL+TrqKyzOSzs
	fu7wG8STwcQseKZ4ZM66u9zmrx6NX5VNs+FNitYZqJnLKFW68xdDoDufLKby3HWxptfXatT8LEx
	nDd8HfwGqdTTqxEt6D2QLlVsvb/I9U9NAxWMud8+W19If44J3VBFn80P/1x1dmYIbZOMV1wUL/c
	hR9K8BMKgI4pLop39AxdENYAnAVELAItVgX2lRIUK9V0Wj6ElmYNQqj0w0nozLO/rZajfK6dxvD
	4nIw/LhDQtqNPWqxo78akJ/wY2a3ROehJQtjAUfux/
X-Google-Smtp-Source: AGHT+IH9XA5XKwB+eYd4P52AVjjtUkCjRx7TcK6UtIfvF/aP3IOPVELnIO3YhYk8yezAw62YpuQ83g==
X-Received: by 2002:a5d:64e7:0:b0:42b:47da:c313 with SMTP id ffacd0b85a97d-42b593395a0mr22250899f8f.3.1763567137600;
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
Received: from eugen-station.. ([82.76.24.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53dea1c9sm38765632f8f.0.2025.11.19.07.45.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 07:45:37 -0800 (PST)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	tglx@linutronix.de,
	andersson@kernel.org,
	pmladek@suse.com,
	rdunlap@infradead.org,
	corbet@lwn.net,
	david@redhat.com,
	mhocko@suse.com
Cc: tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org,
	jonechou@google.com,
	rostedt@goodmis.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org,
	tony.luck@intel.com,
	kees@kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH 12/26] kernel/configs: Register dynamic information into meminspect
Date: Wed, 19 Nov 2025 17:44:13 +0200
Message-ID: <20251119154427.1033475-13-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119154427.1033475-1-eugen.hristev@linaro.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Register kernel_config_data information into inspection table.
Debugging tools look for the start and end markers, so we need to capture
those as well into the region.

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 kernel/configs.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/kernel/configs.c b/kernel/configs.c
index a28c79c5f713..139ecc74bcee 100644
--- a/kernel/configs.c
+++ b/kernel/configs.c
@@ -15,6 +15,7 @@
 #include <linux/seq_file.h>
 #include <linux/init.h>
 #include <linux/uaccess.h>
+#include <linux/meminspect.h>
 
 /*
  * "IKCFG_ST" and "IKCFG_ED" are used to extract the config data from
@@ -64,6 +65,11 @@ static int __init ikconfig_init(void)
 
 	proc_set_size(entry, &kernel_config_data_end - &kernel_config_data);
 
+	/* Register 8 bytes before and after, to catch the marker too */
+	meminspect_lock_register_id_va(MEMINSPECT_ID_CONFIG,
+			     (void *)&kernel_config_data - 8,
+			     &kernel_config_data_end - &kernel_config_data + 16);
+
 	return 0;
 }
 
-- 
2.43.0

