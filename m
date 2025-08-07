Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F75B1C862B
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 01:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754531118; cv=none; b=p5OyiZuFEoYaqkeaVJwHVMewyEnXmZ9xQWv1Z4XIeYNk6GNmGUjMhxJssSTYuMbgPPZcaM7XS6oqrgabIPnKNfPdwjeK84+Nr3RKrOy39CW/alqdqPEPBhgOIShkWVc5yj3t0tQo0bo9V7XUTZda/EC2MaIUiN608BFG8UJKO0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754531118; c=relaxed/simple;
	bh=Hl2OWzV5OeCMKSdYvoQ+GWIuxcx97TV+rOlqTWLKO9U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZSNNC07a/ajOuBvatU8zADAHvffFcJv1snzmZ5psXDOXQWVSBteHhiARkXTE+UZi1H04z/wEf4zm+C0kDUJowefxRinEIjrikSzT2KLsKeUyfYLYEL2QqmB7iQHL85Xl8UVnTzXMOWMC6moqf59eiXeJgcx2U57/qOfIkeEAKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Nw1EKecB; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Nw1EKecB"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4af123c6fc4so5509381cf.0
        for <linux-doc@vger.kernel.org>; Wed, 06 Aug 2025 18:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754531114; x=1755135914; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hwgDrFusb37owy5fF2KCZv/M9EocMOsOhnKlUYr6eI=;
        b=Nw1EKecB07eeizFO10GuFjzXY5fqX6xehIIoLU+3BP8Igtv9HlnIfQtwawRhgPTpCr
         qNaUomW/zI0lrmxaqSj1cZgvpZNfypFxXbYaH0kw6PTg/1O3y+bdj6tl99wGaFcJhmEW
         77n0eEQ1ZQnNlxrG6KwDCPmN9hAwGNbr+X0eFR3ne89J/zqhf1CMVqAY9gjqY1iCeCNb
         g9cciSw0GflbS1PVDYKYj2cmllY2cOhUpm35E01xfyxeHNIh7HxZKSFD7uJOElmZCl9t
         5CYvAdxiC6nefRNzNbdSa3cbV2S+CU+OqxzwyUo7aJQnfwEKFnk1Mj5+POj74EBRGRME
         LqUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754531114; x=1755135914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8hwgDrFusb37owy5fF2KCZv/M9EocMOsOhnKlUYr6eI=;
        b=Oe1/QzbAXFykQ4LSQfycF/43ofvLRky3B0tOTmM4reBkXSQ9JWk46DrPUbFQ2jTjnV
         lVt30A4rLqVd9AJKfYNqj6MuCJqAKigGOf2WD40r5paeP7yMsBzlQx5TFjQiNs0o2L2U
         04agp/LHzsR1hJx51Zb4a/lj9l/qBnQZ+4uXoS5Npi4+lOtUvpHPqd0MOUba0Io1u4aR
         q0rZ5pgp+jyeKM+OwHjh/krYpHKWZOscDaQoGm25nqdN0lV429kt5pgwpS8P2ry9qPAT
         h8+e3Fw/hmTYYCUHa8/swVXbprrvFpaBKdG0bVyTLKnfqXaaoZ+K7Yj8WQKEXqsU6/fK
         RYNw==
X-Forwarded-Encrypted: i=1; AJvYcCVdUyekGMkWOhu1Wrbo2Dd0eUtz9EMpez+7bcvaeBGnAVNGG0JwlnbDQBuagM7mf/XW7pOnG+ThNaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTYojPt4rL6hPmYytF+71gCgIVO3g5QJI8w6+74Clru8R+P+J5
	LOIYM2C1OD+7tdMgNrNf1o2nMoa/kfVlWbNtAwK43U4uRuHOBBu68ajx871mDDe+E5s=
X-Gm-Gg: ASbGncsbv/PzHgbYmkgXfUD1iACaVRIIPDF0IxSFc68OLB9vilY/Ovbhx0RN7pYM09w
	AmJK1CYpWsnvWvm0puscggzf7IiGqC2WmdUeXNfhNgPUP99qi5B+u1TY98rwBzeA2p6mQrRaOXS
	zL8a6HHwhXKrNGHD2pdfpunVCetAAJwAbKQ92773wdK5TWXhHb/A9eDN5Ksv/Xrr2cB/+KXbyNz
	Xr9cHOhdIOsrG9izTcfRcLenalKO67nw0B7gCFdex/d0fvNcA7gkrjOCWggzEU+jN8pIDsakocd
	Nkenm+WZMEh5ulVA7smAI0PT01rPLxZBL0tdy2h5tcGksWJ+J2kvHFxurA/avpeRB3ovODGLSep
	LKnygfchth0Y9wnYiaD8NQM7uA9W85yPx9+eJGf86ctDHJIVf0rXwXFZtYo4xJXnq0QbanvyQFQ
	ci0NYQ5BReyOwO
X-Google-Smtp-Source: AGHT+IH4YzyGG4XPLy7NZ5fSOZd1AAebDYYOaRO7tsFemVfq331RBpfgGYjTHTH3NPqkKUhiEWNpgA==
X-Received: by 2002:a05:622a:1211:b0:4b0:6965:dd97 with SMTP id d75a77b69052e-4b0915b344bmr63492861cf.44.1754531113855;
        Wed, 06 Aug 2025 18:45:13 -0700 (PDT)
Received: from soleen.c.googlers.com.com (235.247.85.34.bc.googleusercontent.com. [34.85.247.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7077cde5a01sm92969046d6.70.2025.08.06.18.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 18:45:13 -0700 (PDT)
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
Subject: [PATCH v3 18/30] liveupdate: luo_files: luo_ioctl: Add ioctls for per-file state management
Date: Thu,  7 Aug 2025 01:44:24 +0000
Message-ID: <20250807014442.3829950-19-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
In-Reply-To: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a set of new ioctls to allow a userspace agent to query and
control the live update state of individual file descriptors that have
been registered for preservation.

Previously, state transitions (prepare, freeze, finish) were handled
globally for all registered resources by the main LUO state machine.
This patch provides a more granular interface, enabling a controlling
agent to manage the lifecycle of specific FDs independently, which is
useful for performance reasons.

-   Adds LIVEUPDATE_IOCTL_GET_FD_STATE to query the current state
    (e.g., NORMAL, PREPARED, FROZEN) of a file identified by its token.
-   Adds LIVEUPDATE_IOCTL_SET_FD_EVENT to trigger state transitions
    (PREPARE, FREEZE, CANCEL, FINISH) for a single file.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/uapi/linux/liveupdate.h  |  62 +++++++++++++
 kernel/liveupdate/luo_files.c    | 152 +++++++++++++++++++++++++++++++
 kernel/liveupdate/luo_internal.h |   8 ++
 kernel/liveupdate/luo_ioctl.c    |  48 ++++++++++
 4 files changed, 270 insertions(+)

diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 37ec5656443b..833da5a8c064 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -128,6 +128,8 @@ enum {
 	LIVEUPDATE_CMD_FD_RESTORE = 0x02,
 	LIVEUPDATE_CMD_GET_STATE = 0x03,
 	LIVEUPDATE_CMD_SET_EVENT = 0x04,
+	LIVEUPDATE_CMD_GET_FD_STATE = 0x05,
+	LIVEUPDATE_CMD_SET_FD_EVENT = 0x06,
 };
 
 /**
@@ -334,4 +336,64 @@ struct liveupdate_ioctl_set_event {
 #define LIVEUPDATE_IOCTL_SET_EVENT					\
 	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SET_EVENT)
 
+/**
+ * struct liveupdate_ioctl_get_fd_state - ioctl(LIVEUPDATE_IOCTL_GET_FD_STATE)
+ * @size:     Input; sizeof(struct liveupdate_ioctl_get_fd_state)
+ * @incoming: Input; If 1, query the state of a restored file from the incoming
+ *            (previous kernel's) set. If 0, query a file being prepared for
+ *            preservation in the current set.
+ * @token:    Input; Token of FD for which to get state.
+ * @state:    Output; The live update state of this FD.
+ *
+ * Query the current live update state of a specific preserved file descriptor.
+ *
+ * - %LIVEUPDATE_STATE_NORMAL:   Default state
+ * - %LIVEUPDATE_STATE_PREPARED: Prepare callback has been performed on this FD.
+ * - %LIVEUPDATE_STATE_FROZEN:   Freeze callback ahs been performed on this FD.
+ * - %LIVEUPDATE_STATE_UPDATED:  The system has successfully rebooted into the
+ *                               new kernel.
+ *
+ * See the definition of &enum liveupdate_state for more details on each state.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_ioctl_get_fd_state {
+	__u32		size;
+	__u8		incoming;
+	__aligned_u64	token;
+	__u32		state;
+};
+
+#define LIVEUPDATE_IOCTL_GET_FD_STATE					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_GET_FD_STATE)
+
+/**
+ * struct liveupdate_ioctl_set_fd_event - ioctl(LIVEUPDATE_IOCTL_SET_FD_EVENT)
+ * @size:  Input; sizeof(struct liveupdate_ioctl_set_fd_event)
+ * @event: Input; The live update event.
+ * @token: Input; Token of FD for which to set the provided event.
+ *
+ * Notify a specific preserved file descriptor of an event, that causes a state
+ * transition for that file descriptor.
+ *
+ * Event, can be one of the following:
+ *
+ * - %LIVEUPDATE_PREPARE: Initiates the FD live update preparation phase.
+ * - %LIVEUPDATE_FREEZE:  Initiates the FD live update freeze phase.
+ * - %LIVEUPDATE_CANCEL:  Cancel the FD preparation or freeze phase.
+ * - %LIVEUPDATE_FINISH:  FD Restoration completion and trigger cleanup.
+ *
+ * See the definition of &enum liveupdate_event for more details on each state.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_ioctl_set_fd_event {
+	__u32		size;
+	__u32		event;
+	__aligned_u64	token;
+};
+
+#define LIVEUPDATE_IOCTL_SET_FD_EVENT					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_SET_FD_EVENT)
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_files.c b/kernel/liveupdate/luo_files.c
index 63f8b086b785..0d68d0c8c45e 100644
--- a/kernel/liveupdate/luo_files.c
+++ b/kernel/liveupdate/luo_files.c
@@ -740,6 +740,158 @@ void luo_unregister_all_files(void)
 	WARN_ON_ONCE(atomic64_read(&luo_files_count) != 0);
 }
 
+/**
+ * luo_file_get_state - Get the preservation state of a specific file.
+ * @token: The token of the file to query.
+ * @statep: Output pointer to store the file's current live update state.
+ * @incoming: If true, query the state of a restored file from the incoming
+ *            (previous kernel's) set. If false, query a file being prepared
+ *            for preservation in the current set.
+ *
+ * Finds the file associated with the given @token in either the incoming
+ * or outgoing tracking arrays and returns its current LUO state
+ * (NORMAL, PREPARED, FROZEN, UPDATED).
+ *
+ * Return: 0 on success, -ENOENT if the token is not found.
+ */
+int luo_file_get_state(u64 token, enum liveupdate_state *statep, bool incoming)
+{
+	struct luo_file *luo_file;
+	struct xarray *target_xa;
+	int ret = 0;
+
+	luo_state_read_enter();
+
+	target_xa = incoming ? &luo_files_xa_in : &luo_files_xa_out;
+	luo_file = xa_load(target_xa, token);
+
+	if (!luo_file) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	scoped_guard(mutex, &luo_file->mutex)
+		*statep = luo_file->state;
+
+out_unlock:
+	luo_state_read_exit();
+	return ret;
+}
+
+/**
+ * luo_file_prepare - Prepare a single registered file for live update.
+ * @token: The token of the file to prepare.
+ *
+ * Finds the file associated with @token and transitions it to the PREPARED
+ * state by invoking its handler's ->prepare() callback. This allows for
+ * granular, per-file preparation before the global LUO PREPARE event.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int luo_file_prepare(u64 token)
+{
+	struct luo_file *luo_file;
+	int ret;
+
+	luo_state_read_enter();
+	luo_file = xa_load(&luo_files_xa_out, token);
+	if (!luo_file) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	ret = luo_files_prepare_one(luo_file);
+out_unlock:
+	luo_state_read_exit();
+	return ret;
+}
+
+/**
+ * luo_file_freeze - Freeze a single prepared file for live update.
+ * @token: The token of the file to freeze.
+ *
+ * Finds the file associated with @token and transitions it from the PREPARED
+ * to the FROZEN state by invoking its handler's ->freeze() callback. This is
+ * typically used for final, "blackout window" state saving for a specific
+ * file.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+int luo_file_freeze(u64 token)
+{
+	struct luo_file *luo_file;
+	int ret;
+
+	luo_state_read_enter();
+	luo_file = xa_load(&luo_files_xa_out, token);
+	if (!luo_file) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	ret = luo_files_freeze_one(luo_file);
+out_unlock:
+	luo_state_read_exit();
+	return ret;
+}
+
+int luo_file_cancel(u64 token)
+{
+	struct luo_file *luo_file;
+	int ret = 0;
+
+	luo_state_read_enter();
+	luo_file = xa_load(&luo_files_xa_out, token);
+	if (!luo_file) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	luo_files_cancel_one(luo_file);
+out_unlock:
+	luo_state_read_exit();
+	return ret;
+}
+
+/**
+ * luo_file_finish - Clean-up a single restored file after live update.
+ * @token: The token of the file to finalize.
+ *
+ * This function is called in the new kernel after a live update, typically
+ * after a file has been restored via luo_retrieve_file() and is no longer
+ * needed by the userspace agent in its preserved state. It invokes the
+ * handler's ->finish() callback, allowing for any final cleanup of the
+ * preserved state associated with this specific file.
+ *
+ * This must be called when LUO is in the UPDATED state.
+ *
+ * Return: 0 on success, -ENOENT if the token is not found, -EBUSY if not
+ *         in the UPDATED state.
+ */
+int luo_file_finish(u64 token)
+{
+	struct luo_file *luo_file;
+	int ret = 0;
+
+	luo_state_read_enter();
+	if (!liveupdate_state_updated()) {
+		pr_warn("finish can only be done in UPDATED state\n");
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	luo_file = xa_load(&luo_files_xa_in, token);
+	if (!luo_file) {
+		ret = -ENOENT;
+		goto out_unlock;
+	}
+
+	luo_files_finish_one(luo_file);
+out_unlock:
+	luo_state_read_exit();
+	return ret;
+}
+
 /**
  * luo_retrieve_file - Find a registered file instance by its token.
  * @token: The unique token of the file instance to retrieve.
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 189e032d7738..01bd0d3b023b 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -8,6 +8,8 @@
 #ifndef _LINUX_LUO_INTERNAL_H
 #define _LINUX_LUO_INTERNAL_H
 
+#include <uapi/linux/liveupdate.h>
+
 /*
  * Handles a deserialization failure: devices and memory is in unpredictable
  * state.
@@ -39,4 +41,10 @@ int luo_register_file(u64 token, int fd);
 int luo_unregister_file(u64 token);
 void luo_unregister_all_files(void);
 
+int luo_file_get_state(u64 token, enum liveupdate_state *statep, bool incoming);
+int luo_file_prepare(u64 token);
+int luo_file_freeze(u64 token);
+int luo_file_cancel(u64 token);
+int luo_file_finish(u64 token);
+
 #endif /* _LINUX_LUO_INTERNAL_H */
diff --git a/kernel/liveupdate/luo_ioctl.c b/kernel/liveupdate/luo_ioctl.c
index 7ca33d1c868f..4c0f6708e411 100644
--- a/kernel/liveupdate/luo_ioctl.c
+++ b/kernel/liveupdate/luo_ioctl.c
@@ -127,6 +127,48 @@ static int luo_ioctl_set_event(struct luo_ucmd *ucmd)
 	return ret;
 }
 
+static int luo_ioctl_get_fd_state(struct luo_ucmd *ucmd)
+{
+	struct liveupdate_ioctl_get_fd_state *argp = ucmd->cmd;
+	enum liveupdate_state state;
+	int ret;
+
+	ret = luo_file_get_state(argp->token, &state, !!argp->incoming);
+	if (ret)
+		return ret;
+
+	argp->state = state;
+	if (copy_to_user(ucmd->ubuffer, argp, ucmd->user_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int luo_ioctl_set_fd_event(struct luo_ucmd *ucmd)
+{
+	struct liveupdate_ioctl_set_fd_event *argp = ucmd->cmd;
+	int ret;
+
+	switch (argp->event) {
+	case LIVEUPDATE_PREPARE:
+		ret = luo_file_prepare(argp->token);
+		break;
+	case LIVEUPDATE_FREEZE:
+		ret = luo_file_freeze(argp->token);
+		break;
+	case LIVEUPDATE_FINISH:
+		ret = luo_file_finish(argp->token);
+		break;
+	case LIVEUPDATE_CANCEL:
+		ret = luo_file_cancel(argp->token);
+		break;
+	default:
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
 static int luo_open(struct inode *inodep, struct file *filep)
 {
 	if (atomic_cmpxchg(&luo_device_in_use, 0, 1))
@@ -149,6 +191,8 @@ union ucmd_buffer {
 	struct liveupdate_ioctl_fd_restore	restore;
 	struct liveupdate_ioctl_get_state	state;
 	struct liveupdate_ioctl_set_event	event;
+	struct liveupdate_ioctl_get_fd_state	fd_state;
+	struct liveupdate_ioctl_set_fd_event	fd_event;
 };
 
 struct luo_ioctl_op {
@@ -179,6 +223,10 @@ static const struct luo_ioctl_op luo_ioctl_ops[] = {
 		 struct liveupdate_ioctl_get_state, state),
 	IOCTL_OP(LIVEUPDATE_IOCTL_SET_EVENT, luo_ioctl_set_event,
 		 struct liveupdate_ioctl_set_event, event),
+	IOCTL_OP(LIVEUPDATE_IOCTL_GET_FD_STATE, luo_ioctl_get_fd_state,
+		 struct liveupdate_ioctl_get_fd_state, token),
+	IOCTL_OP(LIVEUPDATE_IOCTL_SET_FD_EVENT, luo_ioctl_set_fd_event,
+		 struct liveupdate_ioctl_set_fd_event, token),
 };
 
 static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
-- 
2.50.1.565.gc32cd1483b-goog

