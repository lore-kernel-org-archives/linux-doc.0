Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A4A3101DB
	for <linux-doc@vger.kernel.org>; Fri,  7 Nov 2025 21:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762549542; cv=none; b=OIXc2EUigVVyFu43GRailNrRopn3dk2c8MZUJ43Lrb7f4zrYoRLis315SDO19jlP98OPndzIn6vgdWjJqdmkOJIEaBLbaOdJpWNviqI95kJZCZpRMPeM/dWus2qUblA7Q0ZpguuWwNKLi9WGpQ+RkEAVni60+Dni3qJI7WWbH58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762549542; c=relaxed/simple;
	bh=2AXBG/P4zHHPE991SiFKrlF/2yl4Orgmw9rox7i8sZA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gIZ5psHR8iGc6RYbhdmTUgV+xFLF3z/chPd3/H7JA0dvPDZ/SK9E0fH1rDIpbezlPJOJCHk3sQL6sgB0RyUxoA9DMoCg+q2rP4izxfTz6WhYHZLKmsskee//v1QLY7rwwecXfBac5eH1diw3umZ1tjifm62qYsLcD6o4nX+QZII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KlrOE5Ab; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KlrOE5Ab"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-640d43060d2so186991d50.2
        for <linux-doc@vger.kernel.org>; Fri, 07 Nov 2025 13:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1762549540; x=1763154340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eG3KZj/IJ+feH5LNOQCm1I/xQEDt38CQ/0swaPI9wVw=;
        b=KlrOE5AbYBpsv4e2mhXSJRLmPj6kQUoPp8bfWosYQg1KcuemMvi+VqHr20Gs6IG7Np
         tROfxZpQI8C+VW3/ojJiRzQyNKxTV/977xFgNnfJyA2MQk2dvdlDF+TsDsYh6V77UJEc
         9OClbSPa4kE5JnGEDErFu+/uMY1tr902iyYZbMbRH7aNvGHIyAtIrwFU+3T5aSrUJsMB
         NppOm/UVb8f35QJA/XMDdnOe2yxintuvRrqY6dNvJLbkL4wkXpNqLAb59ZQehESpSCaZ
         CbvGZi3IC0cBOuESBiMXnkUAnGXCPp9eRvXeMC9NLQGPwY+y/ecIm6uohrUxkLeacJPJ
         c07Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762549540; x=1763154340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eG3KZj/IJ+feH5LNOQCm1I/xQEDt38CQ/0swaPI9wVw=;
        b=Vb80YVm/SIGPM4tEX+GeJ/+vUlW8XFxlma93KfsPd5QUcXBGRLDhayIVULRp+5vzuw
         3ds9L5uPjjhSLY+uIA3PzLYS9UNZWCwqtsqaCemS60NzV4k3ok8YubFBcf8D6IEorzYX
         qCrZV4OZJTaCMJ+sLdpLDg99yEct0EoBVI7ua+0EVAJG2DIMB+KXxqB8WYeh54xrhk8G
         rfkWkWo+NROv10/16k+uPZ6cWvOgW0RcBRMyAKL3ziytKQvjPKbKlObSFZA342FjRUxI
         pm/kwOezqqa8d4YzEf/nHCtbbqnNw4A1TSHU3mvdU9Jbp0LfrTMrjsx4hLdQVbL/WVhr
         b/Cg==
X-Forwarded-Encrypted: i=1; AJvYcCWYYSicrOWamohFQ8IMmjS8q0buPnaaFKhW4D85o6KAekhNbCCFXbMhKRDBRDp/7LC8J3t3LW/4XmU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbnKhugGn7L0sI/U1rk2R97FUvEeymhGmZ2CEfSnb2HiA+kb53
	Qkr2j6+hly1LXywnP0HwCSpGqrs0kfGaXLwwjDHxSFZapiaZtmR5rhF/Q3rRvve8eNU=
X-Gm-Gg: ASbGncsgcL/7Sw+tjDYJxt9VXZqPprBZOvc6O0sc8EYyNZUNrIzA40r5l++xbYVDqSA
	s/k+AfpCqcVAOWvWs0hZgoubWpNrei9b8Fa5z+hNryqX+Z40ukcLkI7BAr0NcAT/7jOsqD2C9z6
	oNUwlnTAyM+JCqlDJqSHEbn/Uupd2l7G8tikKhU4YKIqlwXw+vvC4hoZUkP2y0l4USBLLrhbuz9
	UTmUQZbHQfqesF6NqiBzmQ88SWkB2FiR45HBs5fRNtPcZO2sbELZlCjpE+rKKu1eLn5/agqcUuC
	hcs1G8CxII04i8ILhYe0dC0Ph6wDiCxxRKI9KaXfn48S8lEOKhTgVgQPhMoVare9iVTKttvZyqi
	NwFqCxBTmAQ0H9xHPSZZwLCeN8DeancC6nkjUK14Ax/wda3DtbyjHDvRf4JTU/8+rzvkhtQkRH6
	Kin8BZWhu0BhKtsKW+nUel1T/wSvSdiMhq5oHIrWCILHCrKfcvnc+Y976Y1vnE8mY=
X-Google-Smtp-Source: AGHT+IGgi833lso4oL9ECYqCcFQNiRqXoYUWKz1MoKHjJMaptGXdg+WJ5uxd88A3KFV7TB/Wv9G8Zg==
X-Received: by 2002:a05:690e:431b:b0:63f:a524:1f93 with SMTP id 956f58d0204a3-640d45ff3e1mr344048d50.68.1762549539784;
        Fri, 07 Nov 2025 13:05:39 -0800 (PST)
Received: from soleen.c.googlers.com.com (53.47.86.34.bc.googleusercontent.com. [34.86.47.53])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-787d68754d3sm990817b3.26.2025.11.07.13.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 13:05:39 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	pasha.tatashin@soleen.com,
	rppt@kernel.org,
	dmatlack@google.com,
	rientjes@google.com,
	corbet@lwn.net,
	rdunlap@infradead.org,
	ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com,
	ojeda@kernel.org,
	aliceryhl@google.com,
	masahiroy@kernel.org,
	akpm@linux-foundation.org,
	tj@kernel.org,
	yoann.congal@smile.fr,
	mmaurer@google.com,
	roman.gushchin@linux.dev,
	chenridong@huawei.com,
	axboe@kernel.dk,
	mark.rutland@arm.com,
	jannh@google.com,
	vincent.guittot@linaro.org,
	hannes@cmpxchg.org,
	dan.j.williams@intel.com,
	david@redhat.com,
	joel.granados@kernel.org,
	rostedt@goodmis.org,
	anna.schumaker@oracle.com,
	song@kernel.org,
	zhangguopeng@kylinos.cn,
	linux@weissschuh.net,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	gregkh@linuxfoundation.org,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	rafael@kernel.org,
	dakr@kernel.org,
	bartosz.golaszewski@linaro.org,
	cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com,
	quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com,
	ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com,
	leon@kernel.org,
	lukas@wunner.de,
	bhelgaas@google.com,
	wagi@kernel.org,
	djeffery@redhat.com,
	stuart.w.hayes@gmail.com,
	ptyadav@amazon.de,
	lennart@poettering.net,
	brauner@kernel.org,
	linux-api@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com,
	hughd@google.com,
	skhawaja@google.com,
	chrisl@kernel.org
Subject: [PATCH v5 04/22] liveupdate: Kconfig: Make debugfs optional
Date: Fri,  7 Nov 2025 16:03:02 -0500
Message-ID: <20251107210526.257742-5-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
In-Reply-To: <20251107210526.257742-1-pasha.tatashin@soleen.com>
References: <20251107210526.257742-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now, that LUO can drive KHO state internally, the debugfs API became
optional, so remove the default config.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 kernel/liveupdate/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/kernel/liveupdate/Kconfig b/kernel/liveupdate/Kconfig
index e1fdcf7f57f3..054f6375a7af 100644
--- a/kernel/liveupdate/Kconfig
+++ b/kernel/liveupdate/Kconfig
@@ -54,7 +54,6 @@ config KEXEC_HANDOVER_DEBUG
 
 config KEXEC_HANDOVER_DEBUGFS
 	bool "kexec handover debugfs interface"
-	default KEXEC_HANDOVER
 	depends on KEXEC_HANDOVER
 	select DEBUG_FS
 	help
-- 
2.51.2.1041.gc1ab5b90ca-goog

