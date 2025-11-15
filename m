Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6710B30C620
	for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 23:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763249693; cv=none; b=uUjVq8ysJQh5GOLoqmLaxD8wGItVU8FMx+4VZU74DIMSE0ym8ab7zkVH194+JSxMQVdnpjM3jPI4a48SEnXYLpVbrDo9lPWXhMGCuUUhXSlWXlPSV5Ugu2SJ/bhpDa/jqT2ZOggNCDBpHv9hrr+tdZEzGK70HFGsXb4ETXcaoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763249693; c=relaxed/simple;
	bh=xccKVGMJ06tz/lkKn64u87jb4PRZGDO1HSTw7IKUbOs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUFcF1St0RxuCmnlkAmwppk/M5nolsVhd0MIkBAso6X4paz1j6TFQUxTaU2jQOQpZvFng00D3OxzlzJjOl5va5CAs+XTg2VocZoVB6tdWGeEdzmBG6q2XRstObiNZ20iRj7ozB6cwaInXJSUsEZ7bZ+QTH/TJ0OOvyvvPrM9bpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=C3iCx/rG; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="C3iCx/rG"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-786a85a68c6so31781237b3.3
        for <linux-doc@vger.kernel.org>; Sat, 15 Nov 2025 15:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763249689; x=1763854489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VyQXl7tWXRV/YETkSwjN2Plb4i1qeg0xlo6fhXkHNVA=;
        b=C3iCx/rGV582hC4pEfJpW/VhjJ52sbI6jrHAV/ts15eo/ss0O/5uY9h42uFZ+GvVtS
         mUzRTu2/FHfMi7gspOsL2/p7doxgbIZkmGFRm3i6U09Vf6Y7ChbtNVa9OiStJCc3pRHc
         9DNU8tZX6OKA+ksAFGUBmaGYgl4W6wvoGEPj9VEB/9TWiCqUU+FkOzroBO1tdLT8sMXe
         Nr1NTwePJ6L8QbueNIVx73is9waW/AM4duOUe+l1L+NFfPShFwjPE+4jIc8Av2hlkRHd
         B6wrOHskrO+V/KCuaqtRqLHT3BqA9RmwxXdLNYXU5WjeFh3njfIKdH2Bv4Q/754yf0Mf
         Mr6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763249689; x=1763854489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VyQXl7tWXRV/YETkSwjN2Plb4i1qeg0xlo6fhXkHNVA=;
        b=YnU9eAxLOqCZrU7KDMGt+z1e8Fz9ZGtH9Ssi51vQ0+7QmUmWDBu+hroDYovwFiO2KP
         Yzw/wcnqA3aOq/S+aXPt/D0E+INmaH61SFbrpOYcgWoCaQrRCuU5dSAwDL+mzSGcOODu
         S3Pgk8GrDREHI/FqXTrQJfMhLP25nv5izEgtgdaMAqhEUb0ys4uIWcYpSjYwfVGcUKQH
         la4gQcUWBsPe/e8s4MF/pc/o24p3RSFyN9vQm5yEZiv66wSFR3ov2YAIYZdpstfN1PgB
         77+9qv19BHw80P+5pzW8XY9MTLlcdZwT9woNZYoNkwsCjlQs1wl0aB9kc+BLgGRy9m3a
         nrQw==
X-Forwarded-Encrypted: i=1; AJvYcCWMX1Hzx+t7hSRR34oMWqJMPh5IYsSDBoB4XeH8QI7cW2ByHSx+cFLMTYYOhDr8zdCz0TiZ3OGYRy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwsWrEEje243ft6XxK2gAg6EUQcjzVRRDK4Yz1myZbXPARtqyC
	sRLQLE5eew3X7fKahzcxyoia1l/PkkSh2nP9UMe1GItMjkH4Dz49NxIDO9y8av+x/do=
X-Gm-Gg: ASbGnctdtOwBm1u12UJVeyYUtDA77Ko8tYbpXhoVRFs1bH0DkXCw80XzRwNwuKWACwC
	Zbf7Oa3/uqe8y1kiJ1X1f3RDYgFR+rqv3ZJROPP2MvKUqcbCLkkEw3OnNwDQQrISPh90h0N47cP
	2zm+bZ6VFGmwFxXg8MiL4J9L/6fU1H4lSQ7CEQyLmJMFQCVHMYmfGNJojG6bXLSuRZwlOH68W4f
	PBPAFA9K6DmhSNFhwSXehiTXDvi2BwBTnJtuVYdLmYYUWc4BbJ7A/pLrvP/0kq+tWGDexd3jQIk
	F9PdDJ0vTqVzmg0mCfbgmjEEZt8xh1Ed2ePC84hOloXlfc0utXzU0qPl0ipTZhUjvGUBWCmZLMQ
	wK+0MASVrMVOHfCezgSVDgXuKfpBpqKrkQDWlwInrh0HZac/umcXDfVKaxahdga8oHjgGl5T0vC
	3W7bIs6znpYRtNjAd1A1f/AO7s3gET5VBHhnMGAKJEG4IFkKsDDoh35Kowy2ZdfNI718ZX
X-Google-Smtp-Source: AGHT+IEy3rWCZZa0SeOLBQxT1yFnRWPZjFkRUtPU+kVtuy5howb5ZMUGXRB8KQbRbOWcLX2jr1XF1w==
X-Received: by 2002:a05:690c:a003:b0:788:161c:722e with SMTP id 00721157ae682-78929e81770mr63042867b3.26.1763249689113;
        Sat, 15 Nov 2025 15:34:49 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7882218774esm28462007b3.57.2025.11.15.15.34.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 15:34:48 -0800 (PST)
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
Subject: [PATCH v6 14/20] liveupdate: luo_file: add private argument to store runtime state
Date: Sat, 15 Nov 2025 18:34:00 -0500
Message-ID: <20251115233409.768044-15-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc1.455.g30608eb744-goog
In-Reply-To: <20251115233409.768044-1-pasha.tatashin@soleen.com>
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Pratyush Yadav <pratyush@kernel.org>

Currently file handlers only get the serialized_data field to store
their state. This field has a pointer to the serialized state of the
file, and it becomes a part of LUO file's serialized state.

File handlers can also need some runtime state to track information that
shouldn't make it in the serialized data.

One such example is a vmalloc pointer. While kho_preserve_vmalloc()
preserves the memory backing a vmalloc allocation, it does not store the
original vmap pointer, since that has no use being passed to the next
kernel. The pointer is needed to free the memory in case the file is
unpreserved.

Provide a private field in struct luo_file and pass it to all the
callbacks. The field's can be set by preserve, and must be freed by
unpreserve.

Signed-off-by: Pratyush Yadav <pratyush@kernel.org>
Co-developed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/linux/liveupdate.h   | 5 +++++
 kernel/liveupdate/luo_file.c | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/include/linux/liveupdate.h b/include/linux/liveupdate.h
index 36a831ae3ead..defc69a1985d 100644
--- a/include/linux/liveupdate.h
+++ b/include/linux/liveupdate.h
@@ -29,6 +29,10 @@ struct file;
  *                    this to the file being operated on.
  * @serialized_data:  The opaque u64 handle, preserve/prepare/freeze may update
  *                    this field.
+ * @private_data:     Private data for the file used to hold runtime state that
+ *                    is not preserved. Set by the handler's .preserve()
+ *                    callback, and must be freed in the handler's
+ *                    .unpreserve() callback.
  *
  * This structure bundles all parameters for the file operation callbacks.
  * The 'data' and 'file' fields are used for both input and output.
@@ -39,6 +43,7 @@ struct liveupdate_file_op_args {
 	bool retrieved;
 	struct file *file;
 	u64 serialized_data;
+	void *private_data;
 };
 
 /**
diff --git a/kernel/liveupdate/luo_file.c b/kernel/liveupdate/luo_file.c
index 3d3bd84cb281..df337c9c4f21 100644
--- a/kernel/liveupdate/luo_file.c
+++ b/kernel/liveupdate/luo_file.c
@@ -126,6 +126,10 @@ static LIST_HEAD(luo_file_handler_list);
  *                 This handle is passed back to the handler's .freeze(),
  *                 .retrieve(), and .finish() callbacks, allowing it to track
  *                 and update its serialized state across phases.
+ * @private_data:  Pointer to the private data for the file used to hold runtime
+ *                 state that is not preserved. Set by the handler's .preserve()
+ *                 callback, and must be freed in the handler's .unpreserve()
+ *                 callback.
  * @retrieved:     A flag indicating whether a user/kernel in the new kernel has
  *                 successfully called retrieve() on this file. This prevents
  *                 multiple retrieval attempts.
@@ -152,6 +156,7 @@ struct luo_file {
 	struct liveupdate_file_handler *fh;
 	struct file *file;
 	u64 serialized_data;
+	void *private_data;
 	bool retrieved;
 	struct mutex mutex;
 	struct list_head list;
@@ -309,6 +314,7 @@ int luo_preserve_file(struct luo_session *session, u64 token, int fd)
 		goto exit_err;
 	} else {
 		luo_file->serialized_data = args.serialized_data;
+		luo_file->private_data = args.private_data;
 		list_add_tail(&luo_file->list, &session->files_list);
 		session->count++;
 	}
@@ -356,6 +362,7 @@ void luo_file_unpreserve_files(struct luo_session *session)
 		args.session = (struct liveupdate_session *)session;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 		luo_file->fh->ops->unpreserve(&args);
 		luo_flb_file_unpreserve(luo_file->fh);
 
@@ -384,6 +391,7 @@ static int luo_file_freeze_one(struct luo_session *session,
 		args.session = (struct liveupdate_session *)session;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 
 		err = luo_file->fh->ops->freeze(&args);
 		if (!err)
@@ -405,6 +413,7 @@ static void luo_file_unfreeze_one(struct luo_session *session,
 		args.session = (struct liveupdate_session *)session;
 		args.file = luo_file->file;
 		args.serialized_data = luo_file->serialized_data;
+		args.private_data = luo_file->private_data;
 
 		luo_file->fh->ops->unfreeze(&args);
 	}
-- 
2.52.0.rc1.455.g30608eb744-goog

