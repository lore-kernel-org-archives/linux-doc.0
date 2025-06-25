Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC22F2F0E3F
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750893567; cv=none; b=VTBsfq5jycEnS7jcpfJebqBl6FYMzMh4NoQ9Gh5mOZjwnE4a4xdWGPvkQELK9yTRHszE9lqQIOdJp7DrtwlRtKB98lckxy6DNF2nyuqZt4Sa4QN1T3Dzc7UKSVE3KmbM/Uh/oO3eR+0j3vPCzioDBPx3otZ43khL1TN2UCaajt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750893567; c=relaxed/simple;
	bh=RcNYbs1efhmf/4u7FSKyFDgmK+5VrQkZtAduMmc72no=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RhgCaKpKf+tKHVYUt+lNwir+KP4PqDMCkJIvVo4p9ExQIQq7j6e1Jx7XkxB/0OzD0/gYfwQUSv51DWODGB51LmJycPMKSSpEjOgk7cpN19R7VGVeQUaD1kT0FxZbP5eeTDDfiGE4Je7nSXTvQktlRE7r8KE8hFgYTRLFoFji5tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=UhfLI+L4; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="UhfLI+L4"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e8600c87293so281408276.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750893565; x=1751498365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRo4ArwTr+rzDEl5s/rKZCEUFMQwNFwkQlgwE4JalXY=;
        b=UhfLI+L4w2vOEShq7dx+0k68PsM69ZJuJnolkQJVf290inX4WSHRoaWnWTbcGALG2s
         xErwEmK4mGFriWQbwjiWxMSFCiSMEJbogQglUhdxgThTEzk20e/ktQrYgJurtBbbn3Mc
         7qgUg5tBOweM99VcAHl+WRTsT3h6lSdEYah5jD5Q7IlqEHzA0VDRO46r5wHLYixVuepu
         Uzz1tS2iVPFVKYPX4MMPUj3Qm65wqOLP41uT4MeYbDYsv2PPD6qhbEMwcZgMcK69jzuC
         ZDdVn/rJB60PiwgmoFcYgEEK6SjHE8CdJAaSL5CPPrPieRxOrFQIkReKQ07zMYOGQmy1
         p2Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750893565; x=1751498365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iRo4ArwTr+rzDEl5s/rKZCEUFMQwNFwkQlgwE4JalXY=;
        b=n2sX0kG5ueudlvybx/KgIktk3TqAuSEsqBFigLH5Oo2m5NiH3AHIrqDU4zP51HtNzj
         ZbbsJwlL4ng1MfooVu/lk9VRcdpYXD1fM2XqdsTAk6tFgKeItrLHtRxzbeRWq6BBUtZa
         EgpBBz4w3Y/MVErVL4QsyRav2qgS0gK1oZv8tCSm75nzMuv9HOQijDxHb/JDZ/71PN56
         /SGVtWYb9QNSfQ+wAM3rvR81JcBIDxr5kogpQsEvQGJD6RJpv2dUmWARzmXqTRpSBBSM
         EStq+ThivdBX6mSYi6Fryz6vj/DlWRCCYY4v4iX2Gkyciq2gXNdflzZQUFWZbe7pP6Iq
         7ovA==
X-Forwarded-Encrypted: i=1; AJvYcCXfJ566opXTihHN+qHpmpA1vIevDVS0MGsJAYTnePvMyEAjaSOu9o5CX1tq1bcfIbnuTnfFHgEJX34=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmplLPhVq7F95LS3tCCAGMMH4HyIANo1FKV6Vbae9WxUZlCmxS
	aQMjgAByLsYRbUkQtZ5K0UH1kzZG6pYgSSbPqRol1PIa2cnVep4ng6Z1plHoP6eWfb4=
X-Gm-Gg: ASbGncvjqWep8yTYbk7MNqTJHmnThqCZmRh93DtrcliY7SPL1h8ljYwye0m9OnX0Hi3
	SV+tnvMtzG6fcNprOJgyuYSIsRyX0a1xLHJw8whwbBccr0orjqci84se0xkKvzp4Cr6/jjbL+wo
	z82bVpA634jLo+CIofVLhadQMXXAqVQAgzhwudiW+lE/18tbqBavl6a0pHugjwLa2qawSWDltQV
	5K85cjkcL1pTbQ1BSpgMIJDTOoa1+fZc+chlpExbCwdI5I3OdOOV1zySTWQGgeMd7j1U9bASZcH
	Nj32gOlSYeCj4x4X9BofTygtH7Bt/kWsqA798ROKaC3GAudMAOXbwdyUmIZRZD30gbfnUm+jStO
	beFYt+eayvuCFvD6jyyph1hToduOgFDGyiFvUsw8JF9FXbmg0D21Z5C3TEzGqKpc=
X-Google-Smtp-Source: AGHT+IF/QqEmdOGEafHDFkdYh+DPEw7yVChLh5FM2HcZlMuGRDD+U97tQzodPIWh00zLYdSn83m6tg==
X-Received: by 2002:a05:6902:1790:b0:e84:4b7f:5b67 with SMTP id 3f1490d57ef6-e86017258b6mr5603267276.1.1750893564869;
        Wed, 25 Jun 2025 16:19:24 -0700 (PDT)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac5c538sm3942684276.33.2025.06.25.16.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 16:19:24 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: pratyush@kernel.org,
	jasonmiu@google.com,
	graf@amazon.com,
	changyuanl@google.com,
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH v1 24/32] MAINTAINERS: add liveupdate entry
Date: Wed, 25 Jun 2025 23:18:11 +0000
Message-ID: <20250625231838.1897085-25-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
References: <20250625231838.1897085-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS file entry for the new Live Update Orchestrator
introduced in previous patches.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index fd097e53fff2..90554f3a1bec 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14009,6 +14009,19 @@ F:	kernel/module/livepatch.c
 F:	samples/livepatch/
 F:	tools/testing/selftests/livepatch/
 
+LIVE UPDATE
+M:	Pasha Tatashin <pasha.tatashin@soleen.com>
+L:	linux-kernel@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-kernel-liveupdate
+F:	Documentation/admin-guide/liveupdate.rst
+F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/userspace-api/liveupdate.rst
+F:	include/linux/liveupdate.h
+F:	include/uapi/linux/liveupdate.h
+F:	kernel/liveupdate/
+F:	tools/testing/selftests/liveupdate/
+
 LLC (802.2)
 L:	netdev@vger.kernel.org
 S:	Odd fixes
-- 
2.50.0.727.gbf7dc18ff4-goog

