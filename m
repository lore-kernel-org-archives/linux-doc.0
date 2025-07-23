Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF1E2F5C47
	for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 14:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753282070; cv=none; b=Kr0gk3Fho36eIiExCAE15xBIpB1z11hnWK0KFbjeDrH7SnbbklNl0K44UHAAL7K5EZGARARkXy3NwWFwdY43LdZXjusXNIUXmZiA4svwV65VAr/hWX00lqwFOQi58YnU52pRaRHAYCLgFH+vNdnRirpJQvBnucpDbevi1OChFco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753282070; c=relaxed/simple;
	bh=p6mnW8nHz5mmsnmxHLqpu00m8RR2v1Mvzx5SXmQ28YA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+xUnT9zTGQ5p3TbBAuNEPGWVH1+DdatJKFu2hlxKUtjFCqv20NR3vwQBEdG2vCmAguv/SwHK05GOS6S9i1EIURTZ6YTBj4xI4UWD+hF/HBGyQ+hrzc/wXxjGgHu8byQa1mol+fCtIXpOR4iXP0QOg3HAgyHyEoz4wDaJHwsWUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=fNJQNMa6; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="fNJQNMa6"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71840959355so25797b3.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Jul 2025 07:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1753282063; x=1753886863; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vA7LYlc82x3WwgY57zmotOihPt8s/pKmtJ2MhRkxfkk=;
        b=fNJQNMa6f1p8o9RygaADlwqx7OSnnaJFpIl/A6sRVgQasSvGeE3vggpKgKDHD85bwv
         qeEsuTGhhJFZopgjYe4ZAXcJ8xRjNE2KyT8noqLdunAzs1gAY8jVByk/v2NPbB29WIAB
         wFvy/Ty9RWKmNNwMDyWI+ytsL0YUvnJ9h7peQU9F8WE8xD+GsmYKXNtzsSqolNlAHhoN
         cT7/yWvkxRp1wV0b5aVebw3uvBs2OxxPF2gc5yy8wXQUmoG0jdvUTeJsVyrbBXvtCH5j
         RMRYi8uCufah4jhbvTMMHME+1+VwUtfaSZx6HdznbqEaAyYHq+EMYO0RiBxdepMlZ7FY
         V74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753282063; x=1753886863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA7LYlc82x3WwgY57zmotOihPt8s/pKmtJ2MhRkxfkk=;
        b=TS2GLvor+0yAU1uWVQaia1lcl5hH1G8AIglstm/ExCLaAnDIZMGdKCnaugCOaZ4Ywy
         9eNio/1phYMXHj975MHc9Lu7YX9bXX2tdeG/+FCka+1Y1+u1WWzqavaRQfzGq3Uid9pi
         Ge+KXcJayy7+ocWoc7z/8kVoF5k0kL6zxbIbq3qArJ5Vg+PikPWgk3Bb6BYihfrzKxCQ
         hW92qrlAs1KEGouGn/IF1yqOm/nFtUb5jWqy5tZjRdCM4zD8GKG8VhLgyr0wfAMaTCWH
         Jr3qzpWOTO0R3OZrxM2bMDX9lML8bBoyNDlVumJ3TujuRu6++T2pUH0O6qBpIRiclOFR
         JFPg==
X-Forwarded-Encrypted: i=1; AJvYcCXraRUU2IBf1Vv3FccA3EEXFZkEOktJCggmnMPGolOXyQZrbldDb5yK30d05jF78rvpM7OglKiwF1U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jQRDln1TJmk7GODYPbfj0DwTgCyojk/nJ9gVsn4Ec1+vWfmF
	V39BesSeQzrroMYsAN/iSrCdu8HP5AkQGQLB0lRizUm1OIiAkLdLJBAXJXG4MS3hrmg=
X-Gm-Gg: ASbGncuC2RKjcY86fE2Ek8vNKMzTdnvda0Epg4K0GmKYHD92S4luYaZcTclCcDPuQLJ
	ubPt4K2xoEspJ9rv9TAHcA8eRxTlyfD11nfxwVtFSuTs9hebcHIUhMXgCjrxzV/fpGjrEhg2Yfx
	4TkVVNOwnPsouGh6nUh7eOiEBQIufNIYceaz1SDRE1HBmZzLM1LVPGkhnEg46axmYE+AiIJ4HKi
	mpmakoiDnVH9sEmzfuA9kd5TPvN3hhs05B34RJ3fGQ+HmXtcwpurVrQ91rHIINQVa8Az8Cirj4B
	IvuhSqbTm+amCoUA7t7OQKGMCm4OOIiMwoWGLIcGAEBOlN+SfZEp5zesYhSMUoia1PtZzTSiIQg
	vUBrguHBsasj4rEdSNffodmZQjMaRkXcJ7qxMGKqDo1rmG11fP1W5ap7j2F+1iqT4+1WIglPm+Z
	aJHQKuItI1/YT8kw==
X-Google-Smtp-Source: AGHT+IHqS70M03S5he3NvWDhoQuPFBoBKoEYJVBTcn9mZuJ/zrlY+6jXwnz4jOOosBMr5/pOQwUPow==
X-Received: by 2002:a05:690c:480b:b0:719:4c68:a713 with SMTP id 00721157ae682-719b4b26117mr35918287b3.2.1753282063460;
        Wed, 23 Jul 2025 07:47:43 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-719532c7e4fsm30482117b3.72.2025.07.23.07.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 07:47:42 -0700 (PDT)
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
	linux-fsdevel@vger.kernel.org,
	saeedm@nvidia.com,
	ajayachandra@nvidia.com,
	jgg@nvidia.com,
	parav@nvidia.com,
	leonro@nvidia.com,
	witu@nvidia.com
Subject: [PATCH v2 24/32] MAINTAINERS: add liveupdate entry
Date: Wed, 23 Jul 2025 14:46:37 +0000
Message-ID: <20250723144649.1696299-25-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
References: <20250723144649.1696299-1-pasha.tatashin@soleen.com>
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
index 3b276cfeb038..711cf25d283d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14012,6 +14012,19 @@ F:	kernel/module/livepatch.c
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

