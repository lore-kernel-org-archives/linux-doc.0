Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6586E2D5C67
	for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 22:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763850249; cv=none; b=CoLT5w9G4teATr+Qv4GPYS91zeRM9VqcgFJTM75MCp8xCUYROBL+Kh5Q2GrhOttDlvdNDe7oew+OqjoAmZJ4v0obegWLOiUYwK5SKdruTGNdxfBWtC7Ui20oza0GNQkT20p1myarCfmibOjjExD3kZ3EYeor/Z5zlmGr/vgPfSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763850249; c=relaxed/simple;
	bh=VdsRKJOPMGdFTmpnYFOjezgc7KmhFSw5nB5qgGoDEP4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dLFCYWLTyGCKnzaBcPJgq+LxHDI8J5MgnzZ5YkS2wE234T4Oa5M9NkHBPCluBkKlJfeH0xMqbep8ja91Nb+Zm+DZuBKxq49ANrguTja709JOgF1AZbSYHrYTau4nxdZO6rBzv8pzN1ayZomJ0ZP9VnwkyxwAyRDOK8Fv9VSUv9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=dWjh9IVJ; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="dWjh9IVJ"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-641e942242cso2515508d50.1
        for <linux-doc@vger.kernel.org>; Sat, 22 Nov 2025 14:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763850246; x=1764455046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/BoEmiu9zsrdP23VvEElLAx2sbpX8ex9ZCQjmSfNmg=;
        b=dWjh9IVJyy0qExkUBZl4x9+J5wzJ//lZEVnkFkFTv5nlafxNpMKt0qhqd8zqbH/zAl
         DDQwth40RLf0GmzyUOseeo4wE0Aik3OfPfW2DbJ7yVdUSvO9W3cCSdCbsghjnTWEWSR+
         5Zjap3PSPt/h4ObAmLlT34PU+cRPA3tKxyDuo/iUeEhjGV9ZSPR3dW8bwnPhmz2jezpg
         r+y5s1xJFJ6yK7IrZ/8q9cRhMx6Nbjw+9xk+1mnm0JcCIJgvPt9ECqOcX0loJowDfMWH
         aGS6+QPsHQAkwJm+tjVni500Pm/pzIsXm4jpPsUD8ASCstcLZjKPbfyDCQ4M2PixTENk
         LkyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763850246; x=1764455046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/BoEmiu9zsrdP23VvEElLAx2sbpX8ex9ZCQjmSfNmg=;
        b=Cw3HVsa9llOTOae9cl8T5bZTBEL84bcrPzc/UQvZNKPWRe0Sa34pSSFZaZicKRZ6v+
         yOWiCE/D2/Kb4IEbhG+JkOYOLRCFSTxSJ6N9AXV7GfeGqFmH4RSU0sv9Sq24qlZOjeRC
         cRPdd1aY0mEQu6B4DyTeAAogJ0UpU4oaP3kPTBHMY9RdES3JvDbLou1IdlI6Vx93RwV/
         jSmXLMFvyJGYj+XRpxhLOPpYNXZV7c6UKy5wqaIsANlAvWMm/9XYqDepB1cclth5F8xr
         z97h6OgRxis7HITz218ygg7dR4JwmeJEzhB3Vngn8o0E6wV+jmLF2QLbixqp5tm0MPs2
         Y8qQ==
X-Forwarded-Encrypted: i=1; AJvYcCXhQ/oHiw/AXGD5sEpP3gn6aLwtPrEI9RzOyLXOjI5HV35CvaqE22BSOOWy36ZaQWP1wVf8rQBTDao=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6PzlqD8L6SpZBVH3Ufnw0xSR1Pg7yJXisPeWWLlf2NxSaJdcD
	Eww49waB1vNvTXbxhgIJKyHdZqembQUvcJYnbcN9q3OrMMfuzt6L9b7uahP87hwuXwk=
X-Gm-Gg: ASbGncsXuGX9xxAMz6s2EzfCqiHpHh7Pl6lh5yz1Dj8H4sC20wJE+jMOp0QLxyGltQl
	OJTzMsD1Gs7Ef+P3HrKTq9oIlJRneWVMBJR6ExwFGgb/MPzsw0GQwSYrB1IuIe0lflE0ojv2AS7
	9YQbTq1/GoaIIamGmB8w15LBgOoS5D1JHBLnQJ4JLwjnh4BvoqpyLiaSIVWSI8lVYvOjqS+otNf
	37REKfPe5oaZsd8gxNPzLvo+AxAr0iYNvGPRVlywg1dxiJkRGNlvt3HqEEpr3ZIiOFbrViNjQo1
	FGTPodTtQIbgrVPvT8MmQPrgqoiCF5i30c/F1Eqst+RRQEtIc7ELtj9ipguGmQbRiBqEeqRNd/Q
	bhb1eqnXLCvBry+tIN8nHQtAapoAVhn2RK4Alkj4DOBdhwMXCjhqjyu56G3W0l0II/WPykHgV6J
	ZnWPZ3PHBFz/0PIaqO/9w9QF2roZIfrc9G0jLdL0L5MK+IaTCY2cBtqGinXa8/+IE6BETtm9UVo
	niBeEU=
X-Google-Smtp-Source: AGHT+IGsBnZ08fwT+U7ONzjkXoJcTJprClMLwp+I60RQ2LQQg/g7R6+ZP/xtQp7fP65yvXwFKSrR1g==
X-Received: by 2002:a05:690e:848:b0:63f:b590:2e5 with SMTP id 956f58d0204a3-64302a7cb9emr3717590d50.22.1763850246138;
        Sat, 22 Nov 2025 14:24:06 -0800 (PST)
Received: from soleen.c.googlers.com.com (182.221.85.34.bc.googleusercontent.com. [34.85.221.182])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78a79779a4esm28858937b3.0.2025.11.22.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 14:24:05 -0800 (PST)
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
Subject: [PATCH v7 05/22] liveupdate: luo_core: add user interface
Date: Sat, 22 Nov 2025 17:23:32 -0500
Message-ID: <20251122222351.1059049-6-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.52.0.rc2.455.g230fcf2819-goog
In-Reply-To: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
References: <20251122222351.1059049-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce the user-space interface for the Live Update Orchestrator
via ioctl commands, enabling external control over the live update
process and management of preserved resources.

The idea is that there is going to be a single userspace agent driving
the live update, therefore, only a single process can ever hold this
device opened at a time.

The following ioctl commands are introduced:

LIVEUPDATE_IOCTL_CREATE_SESSION
Provides a way for userspace to create a named session for grouping file
descriptors that need to be preserved. It returns a new file descriptor
representing the session.

LIVEUPDATE_IOCTL_RETRIEVE_SESSION
Allows the userspace agent in the new kernel to reclaim a preserved
session by its name, receiving a new file descriptor to manage the
restored resources.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 include/uapi/linux/liveupdate.h  |  64 +++++++++++
 kernel/liveupdate/luo_core.c     | 179 ++++++++++++++++++++++++++++++-
 kernel/liveupdate/luo_internal.h |  21 ++++
 3 files changed, 263 insertions(+), 1 deletion(-)

diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveupdate.h
index 40578ae19668..1183cf984b5f 100644
--- a/include/uapi/linux/liveupdate.h
+++ b/include/uapi/linux/liveupdate.h
@@ -46,4 +46,68 @@
 /* The maximum length of session name including null termination */
 #define LIVEUPDATE_SESSION_NAME_LENGTH 64
 
+/* The /dev/liveupdate ioctl commands */
+enum {
+	LIVEUPDATE_CMD_BASE = 0x00,
+	LIVEUPDATE_CMD_CREATE_SESSION = LIVEUPDATE_CMD_BASE,
+	LIVEUPDATE_CMD_RETRIEVE_SESSION = 0x01,
+};
+
+/**
+ * struct liveupdate_ioctl_create_session - ioctl(LIVEUPDATE_IOCTL_CREATE_SESSION)
+ * @size:	Input; sizeof(struct liveupdate_ioctl_create_session)
+ * @fd:		Output; The new file descriptor for the created session.
+ * @name:	Input; A null-terminated string for the session name, max
+ *		length %LIVEUPDATE_SESSION_NAME_LENGTH including termination
+ *		character.
+ *
+ * Creates a new live update session for managing preserved resources.
+ * This ioctl can only be called on the main /dev/liveupdate device.
+ *
+ * Return: 0 on success, negative error code on failure.
+ */
+struct liveupdate_ioctl_create_session {
+	__u32		size;
+	__s32		fd;
+	__u8		name[LIVEUPDATE_SESSION_NAME_LENGTH];
+};
+
+#define LIVEUPDATE_IOCTL_CREATE_SESSION					\
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_CREATE_SESSION)
+
+/**
+ * struct liveupdate_ioctl_retrieve_session - ioctl(LIVEUPDATE_IOCTL_RETRIEVE_SESSION)
+ * @size:    Input; sizeof(struct liveupdate_ioctl_retrieve_session)
+ * @fd:      Output; The new file descriptor for the retrieved session.
+ * @name:    Input; A null-terminated string identifying the session to retrieve.
+ *           The name must exactly match the name used when the session was
+ *           created in the previous kernel.
+ *
+ * Retrieves a handle (a new file descriptor) for a preserved session by its
+ * name. This is the primary mechanism for a userspace agent to regain control
+ * of its preserved resources after a live update.
+ *
+ * The userspace application provides the null-terminated `name` of a session
+ * it created before the live update. If a preserved session with a matching
+ * name is found, the kernel instantiates it and returns a new file descriptor
+ * in the `fd` field. This new session FD can then be used for all file-specific
+ * operations, such as restoring individual file descriptors with
+ * LIVEUPDATE_SESSION_RETRIEVE_FD.
+ *
+ * It is the responsibility of the userspace application to know the names of
+ * the sessions it needs to retrieve. If no session with the given name is
+ * found, the ioctl will fail with -ENOENT.
+ *
+ * This ioctl can only be called on the main /dev/liveupdate device when the
+ * system is in the LIVEUPDATE_STATE_UPDATED state.
+ */
+struct liveupdate_ioctl_retrieve_session {
+	__u32		size;
+	__s32		fd;
+	__u8		name[LIVEUPDATE_SESSION_NAME_LENGTH];
+};
+
+#define LIVEUPDATE_IOCTL_RETRIEVE_SESSION \
+	_IO(LIVEUPDATE_IOCTL_TYPE, LIVEUPDATE_CMD_RETRIEVE_SESSION)
+
 #endif /* _UAPI_LIVEUPDATE_H */
diff --git a/kernel/liveupdate/luo_core.c b/kernel/liveupdate/luo_core.c
index a0f7788cd003..bc90954252a3 100644
--- a/kernel/liveupdate/luo_core.c
+++ b/kernel/liveupdate/luo_core.c
@@ -41,7 +41,13 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/atomic.h>
+#include <linux/errno.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/init.h>
 #include <linux/io.h>
+#include <linux/kernel.h>
 #include <linux/kexec_handover.h>
 #include <linux/kho/abi/luo.h>
 #include <linux/kobject.h>
@@ -52,7 +58,6 @@
 #include <linux/sizes.h>
 #include <linux/string.h>
 #include <linux/unaligned.h>
-
 #include "kexec_handover_internal.h"
 #include "luo_internal.h"
 
@@ -246,12 +251,183 @@ bool liveupdate_enabled(void)
 	return luo_global.enabled;
 }
 
+/**
+ * DOC: LUO ioctl Interface
+ *
+ * The IOCTL user-space control interface for the LUO subsystem.
+ * It registers a character device, typically found at ``/dev/liveupdate``,
+ * which allows a userspace agent to manage the LUO state machine and its
+ * associated resources, such as preservable file descriptors.
+ *
+ * To ensure that the state machine is controlled by a single entity, access
+ * to this device is exclusive: only one process is permitted to have
+ * ``/dev/liveupdate`` open at any given time. Subsequent open attempts will
+ * fail with -EBUSY until the first process closes its file descriptor.
+ * This singleton model simplifies state management by preventing conflicting
+ * commands from multiple userspace agents.
+ */
+
 struct luo_device_state {
 	struct miscdevice miscdev;
+	atomic_t in_use;
+};
+
+static int luo_ioctl_create_session(struct luo_ucmd *ucmd)
+{
+	struct liveupdate_ioctl_create_session *argp = ucmd->cmd;
+	struct file *file;
+	int err;
+
+	argp->fd = get_unused_fd_flags(O_CLOEXEC);
+	if (argp->fd < 0)
+		return argp->fd;
+
+	err = luo_session_create(argp->name, &file);
+	if (err)
+		goto err_put_fd;
+
+	err = luo_ucmd_respond(ucmd, sizeof(*argp));
+	if (err)
+		goto err_put_file;
+
+	fd_install(argp->fd, file);
+
+	return 0;
+
+err_put_file:
+	fput(file);
+err_put_fd:
+	put_unused_fd(argp->fd);
+
+	return err;
+}
+
+static int luo_ioctl_retrieve_session(struct luo_ucmd *ucmd)
+{
+	struct liveupdate_ioctl_retrieve_session *argp = ucmd->cmd;
+	struct file *file;
+	int err;
+
+	argp->fd = get_unused_fd_flags(O_CLOEXEC);
+	if (argp->fd < 0)
+		return argp->fd;
+
+	err = luo_session_retrieve(argp->name, &file);
+	if (err < 0)
+		goto err_put_fd;
+
+	err = luo_ucmd_respond(ucmd, sizeof(*argp));
+	if (err)
+		goto err_put_file;
+
+	fd_install(argp->fd, file);
+
+	return 0;
+
+err_put_file:
+	fput(file);
+err_put_fd:
+	put_unused_fd(argp->fd);
+
+	return err;
+}
+
+static int luo_open(struct inode *inodep, struct file *filep)
+{
+	struct luo_device_state *ldev = container_of(filep->private_data,
+						     struct luo_device_state,
+						     miscdev);
+
+	if (atomic_cmpxchg(&ldev->in_use, 0, 1))
+		return -EBUSY;
+
+	/* Always return -EIO to user if deserialization fail */
+	if (luo_session_deserialize()) {
+		atomic_set(&ldev->in_use, 0);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static int luo_release(struct inode *inodep, struct file *filep)
+{
+	struct luo_device_state *ldev = container_of(filep->private_data,
+						     struct luo_device_state,
+						     miscdev);
+	atomic_set(&ldev->in_use, 0);
+
+	return 0;
+}
+
+union ucmd_buffer {
+	struct liveupdate_ioctl_create_session create;
+	struct liveupdate_ioctl_retrieve_session retrieve;
+};
+
+struct luo_ioctl_op {
+	unsigned int size;
+	unsigned int min_size;
+	unsigned int ioctl_num;
+	int (*execute)(struct luo_ucmd *ucmd);
+};
+
+#define IOCTL_OP(_ioctl, _fn, _struct, _last)                                  \
+	[_IOC_NR(_ioctl) - LIVEUPDATE_CMD_BASE] = {                            \
+		.size = sizeof(_struct) +                                      \
+			BUILD_BUG_ON_ZERO(sizeof(union ucmd_buffer) <          \
+					  sizeof(_struct)),                    \
+		.min_size = offsetofend(_struct, _last),                       \
+		.ioctl_num = _ioctl,                                           \
+		.execute = _fn,                                                \
+	}
+
+static const struct luo_ioctl_op luo_ioctl_ops[] = {
+	IOCTL_OP(LIVEUPDATE_IOCTL_CREATE_SESSION, luo_ioctl_create_session,
+		 struct liveupdate_ioctl_create_session, name),
+	IOCTL_OP(LIVEUPDATE_IOCTL_RETRIEVE_SESSION, luo_ioctl_retrieve_session,
+		 struct liveupdate_ioctl_retrieve_session, name),
 };
 
+static long luo_ioctl(struct file *filep, unsigned int cmd, unsigned long arg)
+{
+	const struct luo_ioctl_op *op;
+	struct luo_ucmd ucmd = {};
+	union ucmd_buffer buf;
+	unsigned int nr;
+	int err;
+
+	nr = _IOC_NR(cmd);
+	if (nr < LIVEUPDATE_CMD_BASE ||
+	    (nr - LIVEUPDATE_CMD_BASE) >= ARRAY_SIZE(luo_ioctl_ops)) {
+		return -EINVAL;
+	}
+
+	ucmd.ubuffer = (void __user *)arg;
+	err = get_user(ucmd.user_size, (u32 __user *)ucmd.ubuffer);
+	if (err)
+		return err;
+
+	op = &luo_ioctl_ops[nr - LIVEUPDATE_CMD_BASE];
+	if (op->ioctl_num != cmd)
+		return -ENOIOCTLCMD;
+	if (ucmd.user_size < op->min_size)
+		return -EINVAL;
+
+	ucmd.cmd = &buf;
+	err = copy_struct_from_user(ucmd.cmd, op->size, ucmd.ubuffer,
+				    ucmd.user_size);
+	if (err)
+		return err;
+
+	return op->execute(&ucmd);
+}
+
 static const struct file_operations luo_fops = {
 	.owner		= THIS_MODULE,
+	.open		= luo_open,
+	.release	= luo_release,
+	.unlocked_ioctl	= luo_ioctl,
 };
 
 static struct luo_device_state luo_dev = {
@@ -260,6 +436,7 @@ static struct luo_device_state luo_dev = {
 		.name  = "liveupdate",
 		.fops  = &luo_fops,
 	},
+	.in_use = ATOMIC_INIT(0),
 };
 
 static int __init liveupdate_ioctl_init(void)
diff --git a/kernel/liveupdate/luo_internal.h b/kernel/liveupdate/luo_internal.h
index 05ae91695ec6..1292ac47eef8 100644
--- a/kernel/liveupdate/luo_internal.h
+++ b/kernel/liveupdate/luo_internal.h
@@ -9,6 +9,27 @@
 #define _LINUX_LUO_INTERNAL_H
 
 #include <linux/liveupdate.h>
+#include <linux/uaccess.h>
+
+struct luo_ucmd {
+	void __user *ubuffer;
+	u32 user_size;
+	void *cmd;
+};
+
+static inline int luo_ucmd_respond(struct luo_ucmd *ucmd,
+				   size_t kernel_cmd_size)
+{
+	/*
+	 * Copy the minimum of what the user provided and what we actually
+	 * have.
+	 */
+	if (copy_to_user(ucmd->ubuffer, ucmd->cmd,
+			 min_t(size_t, ucmd->user_size, kernel_cmd_size))) {
+		return -EFAULT;
+	}
+	return 0;
+}
 
 /*
  * Handles a deserialization failure: devices and memory is in unpredictable
-- 
2.52.0.rc2.455.g230fcf2819-goog

