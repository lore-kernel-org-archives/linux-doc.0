Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604171;
	b=CUAJTyfMDKJePVCEsLvAJw0o1s/EsiF6VIo/dxgL2KrFzGFWKDdc2+URzqU8h6FwCAJ3
	 CMKSEdnW80GiYfqpF7GzF7j8aSZvCz6RbykWRD9LFKHs/tHXAcZsNl8ukFRzW3JbhuZCH
	 u7oBdubrpa2dcOafCU944qZ+qtuaPi3tTd9Bgh3N/RVkmFQ0aAonlKMbP9SmTxLzv3Oyw
	 iVLnGsMlLii3U/U04lmHQEPxKzb7pAVTHWeo8GCZ/PmTVdKKBNVJQoTs+VrGUK51CaQRq
	 PqgH7Gbb0alhzs8RsW8eUpKd20SdaBc77lhgGzH/NILwenl9Q4HNQzW9mKz5OFZPYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604171;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
	b=JZeahKEi/oAbY4jeces2KQMnM8rTR/y1U08LVxy+hjjP8k/BGlS85MdKSEql5Bu/JXw5
	 Ve+X9ll5LJyGo46uGQfBdWhsHVUrUN0XdGXd/2IE8HczDuuqJ+aExp9dacIPGKVwOdNJB
	 OVSNzed4eJLqX38pk1NM3VvIssVxa95su0Ar6PpELyGUQXoW56ZELLTLqJwLenqjn1eCP
	 PA/4eUBBQj4V5ygQ15Buq22RgghZNsQ/9yRIPhNs755Vp9YyWC6JBcgnuHKSc73ZfSKmh
	 De2nn5kAJeMORtpQ6GX2y5Qb6MdgK7Cr2tt8QozJrVn67uKKuXXHgb2sLHfYEg5L/vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b="byh/3nmq";
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE52E60A2610
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 21:09:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE52E60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=byh/3nmq
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so1745142c88.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1794604170; x=1795208970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=byh/3nmqI7QpjTJjL85XL36XrLVmQJX7b416OaueMm9iHjof1uYq2ZFN7Pfll3IAvV
         +X01S5m5HOaYZHlDiDaPuFiRmYKrPA+w+1JW7YhJqoVFFPJEGnEmqMTcrdwrPGVV8Zz4
         i1lGy4B/V1v3WY/ao6ofASJ8TCWkgzDrO6u/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604170; x=1795208970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TDfqGTP8ke2qJSswQYoFvsPR2S/uFXH/mhppiR2+WQQ=;
        b=BY6f664vuSdLPlBGLsknnyat9rQnMwanhAdpNaudpct1l37Yn4POOQ6foWngN6MWtz
         DjBoYPM0mLLdm/dqgG//8hhPoIGesve9FBEf5fUAa+FU5rECTKSHBPFvxYqpvt97kU4K
         MiTfcl85dAknBlO9kqu8936eh0HKlDWAdzK03ASldm4tvDnmDNvwbuqSI7SHgK4IUvVb
         gjwVBu/ihffoOjld2R5q1Bx+nt7/pwBpm8Aqa+9zbDFdmzbV5jOnGkrMiJ7ubri34KIl
         xN6jRtDJrrZfqexHf74sMmVcZlyjvMXIW4DqzRPOPCgA+VX7T5p6DUiH52Q+wmWluXm6
         P95Q==
X-Forwarded-Encrypted: i=1; AL+hErGtBEGZfYv2Oq606Ihj3udGIfDBzQvuQ7g864I3mVCoqzvGNBuuNe7lkjs2xRkRduUaqv0/N909klY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Oy3e+GJ1oTj9BddmvPQvNDTLhVHK3Gz+O08JPE2dTenYCjZNp
	EkWh9A4LOQWBuXmjw4gmljHI6eC/6kPQQ4W0G/7d7Cic1CRo2pSwcNYCPjnYq1066g==
X-Gm-Gg: AYBFou19zls4TwKFlt+VXn8TtsXudkz7wVfxaFy7IbfcOHJ63m8OWHMfbn3mHnb9vdx
	js9P8YLsxyuTJMSIdX56QgiVX1Orz6v3C1L/FPipX3P32O2pgPt+Lt+ufibnFzQ58zAsy1QHS09
	GDqA8otl40rH7hpongxSrME0oCieO7NtiAr/rgXrHLfQsdUVoMuhOJ64rSGyalJTOZpcIo5D0pg
	6f8oQZhfFMNhayCCDCRVqI250wl14wsxtx+WkQb2dxOKjSeByxMSHTtTQ7pNiJJ7SYDbYXro0El
	JZoOVQOt2QPYhCcVQBFOsOg7ZbxL8+iSNY8R6Iae9ijxDO2qo0OTgicbNCLWusoMRj8lCySarA1
	5FvZkyRsIOQo0pD27/+EYIfDgkN/xAk/Owt6eLmTgkXJLwvE9E2l2DU0p9I/AzuYxjwUHK/DMPv
	BPVAZ6/Q9jh3HDLf3FS86ebqmqRVJkyZVuRVmHGeHfCJsHL5DEONi46ABwv6ykgRt9L9t26rFMp
	wpDN/K9yh8/ztnduutZoGxlenAkr6j/stZB1WhjwVgMXu7TascWopHkJZrLONnOYjlG+Mqyhw/6
	YUUt0rokwB9B2/VWmdTlMQr3rgn+aljhRjoOhyzuHetXZuAc31a/gv0W2P6utErcShYpreay4CL
	hwUZbHweuiWRi
X-Received: by 2002:a05:701b:2402:b0:143:868a:20c1 with SMTP id a92af1059eb24-1b503193011mr3160476c88.46.1794604169766;
        Fri, 13 Nov 2026 13:09:29 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:38c:b779:3be9:e682])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm8463040c88.0.2026.11.13.13.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 13:09:27 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Devicetree-compiler@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	Julius Werner <jwerner@chromium.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-kbuild@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Will Deacon <will@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Devicetree@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org,
	Saravana Kannan <saravanak@kernel.org>,
	Brian Norris <briannorris@chromium.org>,
	Douglas Anderson <dianders@chromium.org>,
	David Sterba <dsterba@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Manuel Ebner <manuelebnerli@mailbox.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Nick Terrell <terrelln@fb.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [RFC PATCH v2 1/5] kbuild: fit: Document FIT_COMPRESSION and FIT_DECOMPOSE_DTBS
Date: Fri, 13 Nov 2026 13:09:10 -0800
Message-ID: <20261113130858.RFC.v2.1.Ic9a4337a7740a76d78fb68d3763d36a35a3231a0@changeid>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261113210918.356261-1-dianders@chromium.org>
References: <20261113210918.356261-1-dianders@chromium.org>
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

`FIT_COMPRESSION` and `FIT_DECOMPOSE_DTBS` can be passed on the `make`
command line when building `image.fit` (see `cmd_fit` in
`scripts/Makefile.lib`), but neither variable was documented in
`Documentation/kbuild/kbuild.rst` or mentioned in
`arch/arm64/Makefile`'s `make help` output.

Document both variables before adding new FIT Kbuild variables.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- New preparatory patch documenting preexisting FIT_COMPRESSION and
  FIT_DECOMPOSE_DTBS variables (Simon Glass)

 Documentation/kbuild/kbuild.rst | 12 ++++++++++++
 arch/arm64/Makefile             |  1 +
 2 files changed, 13 insertions(+)

diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
index e71a692a559a..744a32ccbd1c 100644
--- a/Documentation/kbuild/kbuild.rst
+++ b/Documentation/kbuild/kbuild.rst
@@ -364,3 +364,15 @@ LLVM
 ----
 If this variable is set to 1, Kbuild will use Clang and LLVM utilities instead
 of GCC and GNU binutils to build the kernel.
+
+FIT_COMPRESSION
+---------------
+Compression algorithm used when packaging the kernel and device tree blobs
+into ``image.fit`` (for example, ``gzip``, ``lz4``, ``xz``, ``zstd``, or
+``none``). Defaults to ``gzip``.
+
+FIT_DECOMPOSE_DTBS
+------------------
+If set to a non-empty value when building ``image.fit``, decompose composite
+DTBs (built from a base ``.dtb`` plus ``.dtbo`` overlays) into their component
+blobs and deduplicate them in the FIT.
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index ed28f94be428..8818d6a2015b 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -223,6 +223,7 @@ define archhelp
   echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Image.gz)'
   echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/Image)'
   echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)'
+  echo  '                  Configured by FIT_COMPRESSION and FIT_DECOMPOSE_DTBS'
   echo  '  install       - Install kernel (compressed if COMPRESSED_INSTALL set)'
   echo  '  zinstall      - Install compressed kernel'
   echo  '                  Install using (your) ~/bin/installkernel or'
-- 
2.56.0.611.g1030f0b940-goog

