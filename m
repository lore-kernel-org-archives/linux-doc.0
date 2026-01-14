Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F5035772A
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 23:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433860; cv=none; b=Tus6PYPaj/kxR6qXPln48s1RyhNwg4J7AI5Y5D7eg/4gFKcQwGgNuOHlbgi4bO8PruUjaGxgixQHKEH8SuVrBv0FDOJ076mKQW5UTbvkKzfqys900pugyR1z6mLXDxgpYZZTKLgXk+vJJnwbAVwps6yd63W2U54t/i6uqMY9irA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433860; c=relaxed/simple;
	bh=r9IqegKKXF0hOodqnrc7EmAalu0NN7c//lGhFFS/Wr4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ACRlPuRggC50JhggnXMZIp2iyswWuSN66nDlJNO0k0lAHvdc6jd/NfZ4tMt7WSdB9Gw9ZfnWjMsFD82dieINcz/leamo5qBbeuHtuLjmEZXyJQNIRcApw/SyNold/NQ1NYdJovhBQ4B1UQc4bQ/XR6Kwn9mWSaEmr6tP/8IOtqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cdbz3Yeq; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cdbz3Yeq"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-88888d80590so3597286d6.3
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768433838; x=1769038638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ1yqTOSIYfzgCIPomxp4mh5lXIFW6Vqr0XKillgvQc=;
        b=cdbz3YeqbPEJkqDkbUHTdRK8rPDjRnERM41UGRHccvwYb5wexDQrZiFqTzME/vyFmB
         kIKI8hHRmTomFnrq2zdYOZod4VKVzQRmDp5derN0hiVxuJLnjPsYe23Qd5g4YLnsqVLN
         sjvQH9GkEWT9celeL6mOa1ppuyiVXgkDsvXKs4o2VQ16DNvlwI8leni/15c1pv27Ab2c
         t9zBIY6dQLNG+CyROnDyUhcb0W4S2g12QF+WDMZW9RaXZfEz/vPcCydWdREkudVLwgQW
         Vl8nQTQzWT+nShBPaSDI4ZbXWN4r8a/SXntnh59TfWSfNXEmjWErUGeRexbpmzxKrFM0
         k7zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768433838; x=1769038638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJ1yqTOSIYfzgCIPomxp4mh5lXIFW6Vqr0XKillgvQc=;
        b=i060do/ghBL3YUzWCIBHEnreLDhBSdHNQ+3Wd4BR1bp7OXkXh7G3Y0/Hlxwgs9TXXe
         gP6W/mYhdlmeURIi8kDy0HZQLpQnR1nW/2yWkcc0BwWn5amm4JiOExQRalmu3SBdHxkW
         Ec1F9NIzjHR5tZxNOjUIO6Yt+PfURReRrz/l4tyi/x+7J5SU6uLNcJZ2G14i/cgx7sSL
         qZCZHyyg/iB1gYwFT7tPun8Bl0dvNwbR8TBZaG0M19+UsoTHPmMh4oqpd9vSg8w7k2YU
         7+yb9/KbcD767n9QqWuHhPV050xqA/2yMKQj5WRMajMqb/8s44hjmW0iFxgKd8t40XT0
         IUeA==
X-Forwarded-Encrypted: i=1; AJvYcCW7OdK/1gLMTQhQ03qYJroWuAaP82U1yI4ab/fA4Zz9Mm/pC9TVZp1ttm3lkgMKBqpKA6zD0TRkkR4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyertfEeQV9zwFQLwK0rVBvdN+/1JKKMTO5DcPm7hJ42Oom9mfX
	nntzPrwJuH6xWDEQoY+K0diya7q1LPfuNF4ZnH83sR5cEM7iTBnzcUf7
X-Gm-Gg: AY/fxX4+FtXmVlHsSo7r0IRLT+E9TxFj+E7FZ9EE0kBYaCinmml8FaWSjOgTSU42tby
	EXqPD/CExcq2yNH8izgLS2aQg0dflubPVuTJKblLT6iLsnfPnoalwedAIdqDlCJ4R4+oKrg6J6Z
	ZXptw1J5CdR7yfe5wWGVwt3pmzFteInFGpaxjEy6Z+tzO9dBAzMcw++/mWGkCcZUEBJ2ZCBTM0S
	ree0koq4Ob7ljADifOfu5hw0PZ0TAeZwLEjg7k3gBESobsJ2OnlIGtW/YWWluO0ZW31Scoxm2Dg
	2N3FppaPfLo3RjxhDoQufQ5TGerffeV9OC/0sY2SUSSGtQEBU+5lxuGtMQVn96jKhpoyXT+FzBt
	mD93YGwGtRn+h/a1m7I4hw2qM8q6Y6wzuf1ieZlUXpyDier9xS6xgsZe6YOFJy7yRYEIlJmT7rz
	UJlUhtRNX29nXBbHW1y05qjZpb4+iMUP0Df6L4n3Oz/cyV
X-Received: by 2002:a05:6820:2224:b0:65f:6582:6b23 with SMTP id 006d021491bc7-661006caf9dmr3084461eaf.38.1768427154787;
        Wed, 14 Jan 2026 13:45:54 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65f48cb03d4sm10935674eaf.12.2026.01.14.13.45.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:45:54 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH V2 1/2] daxctl: Add support for famfs mode
Date: Wed, 14 Jan 2026 15:45:18 -0600
Message-ID: <20260114214519.29999-2-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114214519.29999-1-john@groves.net>
References: <20260114153133.29420.compound@groves.net>
 <20260114214519.29999-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: John Groves <John@Groves.net>

Putting a daxdev in famfs mode means binding it to fsdev_dax.ko
(drivers/dax/fsdev.c). Finding a daxdev bound to fsdev_dax means
it is in famfs mode.

The test is added to the destructive test suite since it
modifies device modes.

With devdax, famfs, and system-ram modes, the previous logic that assumed
'not in mode X means in mode Y' needed to get slightly more complicated

Add explicit mode detection functions:
- daxctl_dev_is_famfs_mode(): check if bound to fsdev_dax driver
- daxctl_dev_is_devdax_mode(): check if bound to device_dax driver

Fix mode transition logic in device.c:
- disable_devdax_device(): verify device is actually in devdax mode
- disable_famfs_device(): verify device is actually in famfs mode
- All reconfig_mode_*() functions now explicitly check each mode
- Handle unknown mode with error instead of wrong assumption

Modify json.c to show 'unknown' if device is not in a recognized mode.

Signed-off-by: John Groves <john@groves.net>
---
 daxctl/device.c                | 126 ++++++++++++++++++++++++++++++---
 daxctl/json.c                  |   6 +-
 daxctl/lib/libdaxctl-private.h |   2 +
 daxctl/lib/libdaxctl.c         |  77 ++++++++++++++++++++
 daxctl/lib/libdaxctl.sym       |   7 ++
 daxctl/libdaxctl.h             |   3 +
 6 files changed, 210 insertions(+), 11 deletions(-)

diff --git a/daxctl/device.c b/daxctl/device.c
index e3993b1..14e1796 100644
--- a/daxctl/device.c
+++ b/daxctl/device.c
@@ -42,6 +42,7 @@ enum dev_mode {
 	DAXCTL_DEV_MODE_UNKNOWN,
 	DAXCTL_DEV_MODE_DEVDAX,
 	DAXCTL_DEV_MODE_RAM,
+	DAXCTL_DEV_MODE_FAMFS,
 };
 
 struct mapping {
@@ -471,6 +472,13 @@ static const char *parse_device_options(int argc, const char **argv,
 					"--no-online is incompatible with --mode=devdax\n");
 				rc =  -EINVAL;
 			}
+		} else if (strcmp(param.mode, "famfs") == 0) {
+			reconfig_mode = DAXCTL_DEV_MODE_FAMFS;
+			if (param.no_online) {
+				fprintf(stderr,
+					"--no-online is incompatible with --mode=famfs\n");
+				rc =  -EINVAL;
+			}
 		}
 		break;
 	case ACTION_CREATE:
@@ -696,8 +704,42 @@ static int disable_devdax_device(struct daxctl_dev *dev)
 	int rc;
 
 	if (mem) {
-		fprintf(stderr, "%s was already in system-ram mode\n",
-			devname);
+		fprintf(stderr, "%s is in system-ram mode\n", devname);
+		return 1;
+	}
+	if (daxctl_dev_is_famfs_mode(dev)) {
+		fprintf(stderr, "%s is in famfs mode\n", devname);
+		return 1;
+	}
+	if (!daxctl_dev_is_devdax_mode(dev)) {
+		fprintf(stderr, "%s is not in devdax mode\n", devname);
+		return 1;
+	}
+	rc = daxctl_dev_disable(dev);
+	if (rc) {
+		fprintf(stderr, "%s: disable failed: %s\n",
+			daxctl_dev_get_devname(dev), strerror(-rc));
+		return rc;
+	}
+	return 0;
+}
+
+static int disable_famfs_device(struct daxctl_dev *dev)
+{
+	struct daxctl_memory *mem = daxctl_dev_get_memory(dev);
+	const char *devname = daxctl_dev_get_devname(dev);
+	int rc;
+
+	if (mem) {
+		fprintf(stderr, "%s is in system-ram mode\n", devname);
+		return 1;
+	}
+	if (daxctl_dev_is_devdax_mode(dev)) {
+		fprintf(stderr, "%s is in devdax mode\n", devname);
+		return 1;
+	}
+	if (!daxctl_dev_is_famfs_mode(dev)) {
+		fprintf(stderr, "%s is not in famfs mode\n", devname);
 		return 1;
 	}
 	rc = daxctl_dev_disable(dev);
@@ -711,6 +753,7 @@ static int disable_devdax_device(struct daxctl_dev *dev)
 
 static int reconfig_mode_system_ram(struct daxctl_dev *dev)
 {
+	struct daxctl_memory *mem = daxctl_dev_get_memory(dev);
 	const char *devname = daxctl_dev_get_devname(dev);
 	int rc, skip_enable = 0;
 
@@ -724,11 +767,21 @@ static int reconfig_mode_system_ram(struct daxctl_dev *dev)
 	}
 
 	if (daxctl_dev_is_enabled(dev)) {
-		rc = disable_devdax_device(dev);
-		if (rc < 0)
-			return rc;
-		if (rc > 0)
+		if (mem) {
+			/* already in system-ram mode */
 			skip_enable = 1;
+		} else if (daxctl_dev_is_famfs_mode(dev)) {
+			rc = disable_famfs_device(dev);
+			if (rc)
+				return rc;
+		} else if (daxctl_dev_is_devdax_mode(dev)) {
+			rc = disable_devdax_device(dev);
+			if (rc)
+				return rc;
+		} else {
+			fprintf(stderr, "%s: unknown mode\n", devname);
+			return -EINVAL;
+		}
 	}
 
 	if (!skip_enable) {
@@ -750,7 +803,7 @@ static int disable_system_ram_device(struct daxctl_dev *dev)
 	int rc;
 
 	if (!mem) {
-		fprintf(stderr, "%s was already in devdax mode\n", devname);
+		fprintf(stderr, "%s is not in system-ram mode\n", devname);
 		return 1;
 	}
 
@@ -786,12 +839,28 @@ static int disable_system_ram_device(struct daxctl_dev *dev)
 
 static int reconfig_mode_devdax(struct daxctl_dev *dev)
 {
+	struct daxctl_memory *mem = daxctl_dev_get_memory(dev);
+	const char *devname = daxctl_dev_get_devname(dev);
 	int rc;
 
 	if (daxctl_dev_is_enabled(dev)) {
-		rc = disable_system_ram_device(dev);
-		if (rc)
-			return rc;
+		if (mem) {
+			rc = disable_system_ram_device(dev);
+			if (rc)
+				return rc;
+		} else if (daxctl_dev_is_famfs_mode(dev)) {
+			rc = disable_famfs_device(dev);
+			if (rc)
+				return rc;
+		} else if (daxctl_dev_is_devdax_mode(dev)) {
+			/* already in devdax mode, just re-enable */
+			rc = daxctl_dev_disable(dev);
+			if (rc)
+				return rc;
+		} else {
+			fprintf(stderr, "%s: unknown mode\n", devname);
+			return -EINVAL;
+		}
 	}
 
 	rc = daxctl_dev_enable_devdax(dev);
@@ -801,6 +870,40 @@ static int reconfig_mode_devdax(struct daxctl_dev *dev)
 	return 0;
 }
 
+static int reconfig_mode_famfs(struct daxctl_dev *dev)
+{
+	struct daxctl_memory *mem = daxctl_dev_get_memory(dev);
+	const char *devname = daxctl_dev_get_devname(dev);
+	int rc;
+
+	if (daxctl_dev_is_enabled(dev)) {
+		if (mem) {
+			fprintf(stderr,
+				"%s is in system-ram mode, must be in devdax mode to convert to famfs\n",
+				devname);
+			return -EINVAL;
+		} else if (daxctl_dev_is_famfs_mode(dev)) {
+			/* already in famfs mode, just re-enable */
+			rc = daxctl_dev_disable(dev);
+			if (rc)
+				return rc;
+		} else if (daxctl_dev_is_devdax_mode(dev)) {
+			rc = disable_devdax_device(dev);
+			if (rc)
+				return rc;
+		} else {
+			fprintf(stderr, "%s: unknown mode\n", devname);
+			return -EINVAL;
+		}
+	}
+
+	rc = daxctl_dev_enable_famfs(dev);
+	if (rc)
+		return rc;
+
+	return 0;
+}
+
 static int do_create(struct daxctl_region *region, long long val,
 		     struct json_object **jdevs)
 {
@@ -887,6 +990,9 @@ static int do_reconfig(struct daxctl_dev *dev, enum dev_mode mode,
 	case DAXCTL_DEV_MODE_DEVDAX:
 		rc = reconfig_mode_devdax(dev);
 		break;
+	case DAXCTL_DEV_MODE_FAMFS:
+		rc = reconfig_mode_famfs(dev);
+		break;
 	default:
 		fprintf(stderr, "%s: unknown mode requested: %d\n",
 			devname, mode);
diff --git a/daxctl/json.c b/daxctl/json.c
index 3cbce9d..01f139b 100644
--- a/daxctl/json.c
+++ b/daxctl/json.c
@@ -48,8 +48,12 @@ struct json_object *util_daxctl_dev_to_json(struct daxctl_dev *dev,
 
 	if (mem)
 		jobj = json_object_new_string("system-ram");
-	else
+	else if (daxctl_dev_is_famfs_mode(dev))
+		jobj = json_object_new_string("famfs");
+	else if (daxctl_dev_is_devdax_mode(dev))
 		jobj = json_object_new_string("devdax");
+	else
+		jobj = json_object_new_string("unknown");
 	if (jobj)
 		json_object_object_add(jdev, "mode", jobj);
 
diff --git a/daxctl/lib/libdaxctl-private.h b/daxctl/lib/libdaxctl-private.h
index ae45311..0bb73e8 100644
--- a/daxctl/lib/libdaxctl-private.h
+++ b/daxctl/lib/libdaxctl-private.h
@@ -21,12 +21,14 @@ static const char *dax_subsystems[] = {
 enum daxctl_dev_mode {
 	DAXCTL_DEV_MODE_DEVDAX = 0,
 	DAXCTL_DEV_MODE_RAM,
+	DAXCTL_DEV_MODE_FAMFS,
 	DAXCTL_DEV_MODE_END,
 };
 
 static const char *dax_modules[] = {
 	[DAXCTL_DEV_MODE_DEVDAX] = "device_dax",
 	[DAXCTL_DEV_MODE_RAM] = "kmem",
+	[DAXCTL_DEV_MODE_FAMFS] = "fsdev_dax",
 };
 
 enum memory_op {
diff --git a/daxctl/lib/libdaxctl.c b/daxctl/lib/libdaxctl.c
index b7fa0de..0a6cbfe 100644
--- a/daxctl/lib/libdaxctl.c
+++ b/daxctl/lib/libdaxctl.c
@@ -418,6 +418,78 @@ DAXCTL_EXPORT int daxctl_dev_is_system_ram_capable(struct daxctl_dev *dev)
 	return false;
 }
 
+/*
+ * Check if device is currently in famfs mode (bound to fsdev_dax driver)
+ */
+DAXCTL_EXPORT int daxctl_dev_is_famfs_mode(struct daxctl_dev *dev)
+{
+	const char *devname = daxctl_dev_get_devname(dev);
+	struct daxctl_ctx *ctx = daxctl_dev_get_ctx(dev);
+	char *mod_path, *mod_base;
+	char path[200];
+	const int len = sizeof(path);
+
+	if (!device_model_is_dax_bus(dev))
+		return false;
+
+	if (!daxctl_dev_is_enabled(dev))
+		return false;
+
+	if (snprintf(path, len, "%s/driver", dev->dev_path) >= len) {
+		err(ctx, "%s: buffer too small!\n", devname);
+		return false;
+	}
+
+	mod_path = realpath(path, NULL);
+	if (!mod_path)
+		return false;
+
+	mod_base = basename(mod_path);
+	if (strcmp(mod_base, dax_modules[DAXCTL_DEV_MODE_FAMFS]) == 0) {
+		free(mod_path);
+		return true;
+	}
+
+	free(mod_path);
+	return false;
+}
+
+/*
+ * Check if device is currently in devdax mode (bound to device_dax driver)
+ */
+DAXCTL_EXPORT int daxctl_dev_is_devdax_mode(struct daxctl_dev *dev)
+{
+	const char *devname = daxctl_dev_get_devname(dev);
+	struct daxctl_ctx *ctx = daxctl_dev_get_ctx(dev);
+	char *mod_path, *mod_base;
+	char path[200];
+	const int len = sizeof(path);
+
+	if (!device_model_is_dax_bus(dev))
+		return false;
+
+	if (!daxctl_dev_is_enabled(dev))
+		return false;
+
+	if (snprintf(path, len, "%s/driver", dev->dev_path) >= len) {
+		err(ctx, "%s: buffer too small!\n", devname);
+		return false;
+	}
+
+	mod_path = realpath(path, NULL);
+	if (!mod_path)
+		return false;
+
+	mod_base = basename(mod_path);
+	if (strcmp(mod_base, dax_modules[DAXCTL_DEV_MODE_DEVDAX]) == 0) {
+		free(mod_path);
+		return true;
+	}
+
+	free(mod_path);
+	return false;
+}
+
 /*
  * This checks for the device to be in system-ram mode, so calling
  * daxctl_dev_get_memory() on a devdax mode device will always return NULL.
@@ -982,6 +1054,11 @@ DAXCTL_EXPORT int daxctl_dev_enable_ram(struct daxctl_dev *dev)
 	return daxctl_dev_enable(dev, DAXCTL_DEV_MODE_RAM);
 }
 
+DAXCTL_EXPORT int daxctl_dev_enable_famfs(struct daxctl_dev *dev)
+{
+	return daxctl_dev_enable(dev, DAXCTL_DEV_MODE_FAMFS);
+}
+
 DAXCTL_EXPORT int daxctl_dev_disable(struct daxctl_dev *dev)
 {
 	const char *devname = daxctl_dev_get_devname(dev);
diff --git a/daxctl/lib/libdaxctl.sym b/daxctl/lib/libdaxctl.sym
index 3098811..2a812c6 100644
--- a/daxctl/lib/libdaxctl.sym
+++ b/daxctl/lib/libdaxctl.sym
@@ -104,3 +104,10 @@ LIBDAXCTL_10 {
 global:
 	daxctl_dev_is_system_ram_capable;
 } LIBDAXCTL_9;
+
+LIBDAXCTL_11 {
+global:
+	daxctl_dev_enable_famfs;
+	daxctl_dev_is_famfs_mode;
+	daxctl_dev_is_devdax_mode;
+} LIBDAXCTL_10;
diff --git a/daxctl/libdaxctl.h b/daxctl/libdaxctl.h
index 53c6bbd..84fcdb4 100644
--- a/daxctl/libdaxctl.h
+++ b/daxctl/libdaxctl.h
@@ -72,12 +72,15 @@ int daxctl_dev_is_enabled(struct daxctl_dev *dev);
 int daxctl_dev_disable(struct daxctl_dev *dev);
 int daxctl_dev_enable_devdax(struct daxctl_dev *dev);
 int daxctl_dev_enable_ram(struct daxctl_dev *dev);
+int daxctl_dev_enable_famfs(struct daxctl_dev *dev);
 int daxctl_dev_get_target_node(struct daxctl_dev *dev);
 int daxctl_dev_will_auto_online_memory(struct daxctl_dev *dev);
 int daxctl_dev_has_online_memory(struct daxctl_dev *dev);
 
 struct daxctl_memory;
 int daxctl_dev_is_system_ram_capable(struct daxctl_dev *dev);
+int daxctl_dev_is_famfs_mode(struct daxctl_dev *dev);
+int daxctl_dev_is_devdax_mode(struct daxctl_dev *dev);
 struct daxctl_memory *daxctl_dev_get_memory(struct daxctl_dev *dev);
 struct daxctl_dev *daxctl_memory_get_dev(struct daxctl_memory *mem);
 const char *daxctl_memory_get_node_path(struct daxctl_memory *mem);
-- 
2.49.0

