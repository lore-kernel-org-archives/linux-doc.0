Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5738C331225
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 16:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764089980; cv=none; b=kDU21Wn3jp1p04A7nznLXMJIH/VRu1kQ4rUCPvsolJnvFsBKVOtrN+OxnUuEk0jnc+3hf2sO/nO1tmk74eiJTqxDubB3U2utb0JwOul5pOQJSTC+hb9zBc2cKcZPiQ3zrr0FY+6v/CvDVuc68uSW74bcb4T20f7Q4F73aPlXNAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764089980; c=relaxed/simple;
	bh=fychgt9nAVC6qlaQbGXvu+POyBVW9WjNWP+jjeOAE6s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwcrPPZKc3FdTNMUMF6hcUhPyXsbn2FFlWCgrJDozyzHx640kdrAaw0R/hWe65j8Vj6KF9ON2BsghNoQgIv6TVXZjC41UoQMbpo4MxvXOWENJsk3yo9+cDlC+bx3fHafKOyFWO7mps2ID2UWoO1W0kb8WIoW6NZ6iBrv2Xu9U/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=QFRoAdF3; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="QFRoAdF3"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-63f996d4e1aso6067489d50.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 08:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764089976; x=1764694776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RKFulOeeZC8khoIo0yKZZlpL1Ef0ob1cKcWS/buX2aU=;
        b=QFRoAdF3IFRPlbySoUDhL6X3A/qQ0oyijI7bkI/Dl/z7Cbhvia/AZ4zE3Ex6J6h6ro
         h3zKdjHMyfYexWkM1dHg690qtCGlpYwPNC1XkdQldRKhR5Nr29oZdxj5GD8r31Wa8iq5
         sTpZxldZSHHzGNHhNXiK1NVfWY09tPyCd6wDnRcmZQLPExPEf3JuTic5bOKQtsGFHYvA
         41SM3gDNZNKe8HgcqpGm8tkE9f1zzaVtWJPKE6QuHcye1wwgNNUV4sJDj8udaJl0Tpnm
         crXunP2f0rHlCq7vRIt8v3iS84L+37VEukQp5xyqK53ptQEBGgXb3vzpWK89maOJKs/A
         cbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089976; x=1764694776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RKFulOeeZC8khoIo0yKZZlpL1Ef0ob1cKcWS/buX2aU=;
        b=R8eszf54fowHjtp2P238SGPMaVoNBUT3/9Zn6lfyIOlsIe3OLOAzMki/BRmSQtdCi6
         YY91LDDP6VBTqmToUG4hCO9yho63/JNKGvo6c7swi817dHWKpvAhafETl93MsIBdkoZY
         QspkcWqXeZHuDoY2K7V6bh2eXCbilRwNj1bFupoET2QFcc2XqBj0eRUbzNEDchPlgKqS
         /4YVWv5EmDepuZYLRvXPtIClQu97wJJmpRj8DdadzoA/djI0xe+tBruBJIy1AD/lunkj
         MY5jT6YufaQYeu9nM4SlguzMFzfEwX98lBYeVAnGhK15dmYEn5Rmzu3JjRlfSpjdMiUM
         IoOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV4lehxUwT85D5fywM7Snk8zC9VR/3WZDq3kg1bL79BXdh9z61bXwrdnhrJAbyXUAomu0JJCq1H7Lc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9D9JxF/06sAFTTar4TcbhqYhy+saMqVVAWlAkiTiWZeiSlGxs
	Pk93kcPfNgnlCtS0eC3zJvk5jewlirHf6KsMcJkhh51LGArRMSilgZfmyIfv4szLeDw=
X-Gm-Gg: ASbGnctEa9AUd/YQ6XdBMc92VGZ2PAupo63LS9ct+hor0EiXOtMFaZCv9SPEcwsGEHA
	0wEa/wKYIOisDSsSYIljIBJO74MKJIhmS6x0xPaCnlCm44QvjoC+WXqzxrd0fa872PMoB7Sq3Rq
	W9J/FN5Bf5C0W3Wpf2vOsJ5quWWBLkEXnQh4jrMpJgXF2lZ85AvRtDFO0QjpS13Qy0GY0Ptdxy/
	hVeGY4Q5lxiFb2I/rAFl4AXRnlCWjq+4gZT99hXkZLYBDuwbrfxfWy4S7odCL2uXGkzAndsMUPc
	DRB+I2uZ+H7+m3PtQ88ZW4mp4znuIsMvhOJ/wMl3evhPTrFbVp4DjPwgUNS/SN5h7gPEhuwV/5P
	Bf16aXVQ7YQJkuIi69J1I8S1Ea3UNBe5fd0nM8xq857NCnZj0GOTB2YL493caHeIKcVLrgD2N9L
	o1Lsn4SEGphXKrGAkatU9IEd3k7jGPw5C1CBxBe+V96QydFY3VTVoxMGR/SjvkHZN8DTd3HDokH
	rs=
X-Google-Smtp-Source: AGHT+IFFyrvPeYSGKaZ2gflHxpJKasjuM+nfTPdri6fpn7nF6c9WwHVJYxBbdaTgAkmoqf3bueMENQ==
X-Received: by 2002:a53:d057:0:10b0:63f:a3d8:1b0e with SMTP id 956f58d0204a3-64302a3aa73mr10362858d50.12.1764089976255;
        Tue, 25 Nov 2025 08:59:36 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a798a5518sm57284357b3.14.2025.11.25.08.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 08:59:35 -0800 (PST)
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
Subject: [PATCH v8 15/18] docs: add documentation for memfd preservation via LUO
Date: Tue, 25 Nov 2025 11:58:45 -0500
Message-ID: <20251125165850.3389713-16-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.460.gd25c4c69ec-goog
In-Reply-To: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <ptyadav@amazon.de>

Add the documentation under the "Preserving file descriptors" section of
LUO's documentation.

Signed-off-by: Pratyush Yadav <ptyadav@amazon.de>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 Documentation/core-api/liveupdate.rst   |  7 +++++++
 Documentation/mm/index.rst              |  1 +
 Documentation/mm/memfd_preservation.rst | 23 +++++++++++++++++++++++
 MAINTAINERS                             |  1 +
 4 files changed, 32 insertions(+)
 create mode 100644 Documentation/mm/memfd_preservation.rst

diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
index cca1993008d8..7960eb15a81f 100644
--- a/Documentation/core-api/liveupdate.rst
+++ b/Documentation/core-api/liveupdate.rst
@@ -23,6 +23,13 @@ Live Update Orchestrator ABI
 .. kernel-doc:: include/linux/kho/abi/luo.h
    :doc: Live Update Orchestrator ABI
 
+The following types of file descriptors can be preserved
+
+.. toctree::
+   :maxdepth: 1
+
+   ../mm/memfd_preservation
+
 Public API
 ==========
 .. kernel-doc:: include/linux/liveupdate.h
diff --git a/Documentation/mm/index.rst b/Documentation/mm/index.rst
index ba6a8872849b..7aa2a8886908 100644
--- a/Documentation/mm/index.rst
+++ b/Documentation/mm/index.rst
@@ -48,6 +48,7 @@ documentation, or deleted if it has served its purpose.
    hugetlbfs_reserv
    ksm
    memory-model
+   memfd_preservation
    mmu_notifier
    multigen_lru
    numa
diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
new file mode 100644
index 000000000000..66e0fb6d5ef0
--- /dev/null
+++ b/Documentation/mm/memfd_preservation.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================
+Memfd Preservation via LUO
+==========================
+
+.. kernel-doc:: mm/memfd_luo.c
+   :doc: Memfd Preservation via LUO
+
+Memfd Preservation ABI
+======================
+
+.. kernel-doc:: include/linux/kho/abi/memfd.h
+   :doc: DOC: memfd Live Update ABI
+
+.. kernel-doc:: include/linux/kho/abi/memfd.h
+   :internal:
+
+See Also
+========
+
+- :doc:`/core-api/liveupdate`
+- :doc:`/core-api/kho/concepts`
diff --git a/MAINTAINERS b/MAINTAINERS
index 425c46bba764..cabbf30d50e1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14473,6 +14473,7 @@ R:	Pratyush Yadav <pratyush@kernel.org>
 L:	linux-kernel@vger.kernel.org
 S:	Maintained
 F:	Documentation/core-api/liveupdate.rst
+F:	Documentation/mm/memfd_preservation.rst
 F:	Documentation/userspace-api/liveupdate.rst
 F:	include/linux/liveupdate.h
 F:	include/linux/liveupdate/
-- 
2.52.0.460.gd25c4c69ec-goog

