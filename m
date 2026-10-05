Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C6BF4A2A4F
	for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2026 17:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791307215; cv=none; b=P0ui1r1W69ddUhACzr+KAe/hDimtbFGsdOZOGhzMiCt/Kyc3+stjtSKPtPbdv8LxokhLSe1cXuLH8Y0AmgqaMuAq/xmyEBd4ae9lBnWKEi225DGqnswOyhE+IWIRxdYiP8+w3Z5zCc/yzyZko6tApOmhSjRFkicjBDO7ZRNSHCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791307215; c=relaxed/simple;
	bh=8UrfGrgp42qNQU1NimZqWk+yfFirL0kYvAJnchl0BIc=;
	h=Message-ID:In-Reply-To:References:From:Date:Subject:To:Cc; b=UV0U9IdxFm/8gVhE9GupK9kkdGzRoK5zyzbe8EFblk29u+J+IEWhoX0653SxZHTWApApVeQK6T8YOhL3YsVqAremmJL7FN80RCEx1Oy4L5Zws7ybJq97BpA3422RPizi6JRg3iHablUdbW8lx8BLcUkcTzdZL4gpjL3u24QBWUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com; spf=pass smtp.mailfrom=toxicpanda.com; dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b=MjSgsyiF; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=toxicpanda.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=toxicpanda.com header.i=@toxicpanda.com header.b="MjSgsyiF"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-533778ab0bdso9055751cf.3
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2026 10:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=toxicpanda.com; s=google; t=1791307208; x=1791912008; darn=vger.kernel.org;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ulDmc4vWLYDEpDWER1pNlz3EcN+6UD7sdaSKpKBxXwg=;
        b=MjSgsyiFDYLLapM0B1YiwaXDUoZaA9fOvwLnqULqbFG2kK8KRpl+dR81ryRWm2datN
         Bm37feEsvoD28MdGM1ZT3FpHwsyetP7E+5J6z4itOhla8kvCOFedTGmHPCtQA/qudLqD
         gDZBGS1CDB5Bktp2Pn6gGHhw5Mh89SG497icuMYugF7Qi53vNrsOOCFvmQpePAU4mZSh
         1oE2IcPqAxpSe8FQ7dfoO+0IvdQ2RqXe8KdQ3asAlDn+npU3+nQTF+pzd0WIFksmiKWV
         AfaAmsLHxd33Cp5lpELgw0L1fFTRCTk2k546XqTmdFjjq3o6noym57QXn5AlK074aPL7
         7Ubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791307208; x=1791912008;
        h=cc:to:subject:date:from:references:in-reply-to:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ulDmc4vWLYDEpDWER1pNlz3EcN+6UD7sdaSKpKBxXwg=;
        b=jmj7u2YRZr3uxfkxVIXpnVhr0Ddy69zCk25i4/E8/yLpJaSUWOGRqdP2gAt1EdMKM8
         zMNsAaEuopHByCXpHpzFq8m/45YbwKFvMzE6yeob33XYfiBAnXscms6fKFCHWSy1fvdm
         2W9FuUuVJmfVy5K2TNtVAmCy1oGsqNjyVYdKNNdK1pxm6nc7CiYM0kh05kyBDRAXyd7j
         mXTQAa64l82Q5I9pS6unuDqVMQAZPdzgDXZw7uypcRrKtPNCbjKEgdN8R98hqJzvODtq
         t/oqW5Cu0KfJzI4wlolx82Rz0UEFsTF15QJbwm+cg/kSaTY/c4Aige/L1pz5zD+8O1dr
         xjNA==
X-Forwarded-Encrypted: i=1; AKwUvBxfpE4u0iWPhnk65LDHmQU84gbR7cmrTCr5v9kT/2Apcn4ycLR8LNubxGjB7PfGEPZvOGiUvWe8fj0=@vger.kernel.org
X-Gm-Message-State: AFuF++lrxcY+a+S65GbzhdnLAWpXvsu0koOAlm3g3fTXb6yfK+0QDnbZ
	KOyY8VSHUD3SAlNuKc5cAk52ASb25GBiiek2nf3U+YP18B7wkalAuKMrLeX0QIFa/v4=
X-Gm-Gg: AYBFou1vaOMsRrOeYDMpY7fdQNkOuX+6dHh5+a41PgUP1aje/NUtGvOVGC8qxx2eBVM
	/rigRUGm2Cuiqo1X2xjfs/FhYesPba3ILSxVNRbVieu+guKAGBwzOG5a2JHO5hDbtQw6iWvit56
	WIbP/uIj8QUAdT4b9kSKOAHjI3IJeVxZKxNC6+UeN9125Z0XMIVRk3JJDJXqlQ+cDJTiZpSjuBS
	K/v2n2bdfaqmZSrLbLoQFHNpTLW5RS3GOmXyhvK8TEle8QN1Sp7E63mklan6rp0zCKqFmRrJzBu
	CQsRSTNWYan955ticL3AtWhARGQxqsXgywt82IsZ9P84j+cvF6xBTCCxUVUJgILs9uvove1r2g+
	/ENCQ7x8vjS/tsLmF0Ftt2tbLIz5En+zsu41lfYmJBbTkRMJ1Kjve0HTgpRvi4pu3ZD3HSg3YoB
	d4JQcNbMJ7FJh0nTUyJDbEQKGlcqCCgP51Fpkv6XgnKrzPVVWqOqNvwTe+bk1J/aRgDLEE/I23m
	LrIB9gjVOCz0VY=
X-Received: by 2002:a05:622a:11c3:b0:535:e77:e37c with SMTP id d75a77b69052e-535671e2e35mr35390061cf.57.1791307208137;
        Tue, 06 Oct 2026 10:20:08 -0700 (PDT)
Received: from toxicpanda.com ([153.61.196.248])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53571f162e7sm762851cf.1.2026.10.06.10.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 10:20:06 -0700 (PDT)
Message-ID: <fa008e794e050059f67469ddf006298ea028ce24.1791307183.git.josef@toxicpanda.com>
In-Reply-To: <asUCWjKXMxXFwBNQ@fedora-laptop>
References: <asUCWjKXMxXFwBNQ@fedora-laptop>
From: Josef Bacik <josef@toxicpanda.com>
Date: Mon, 5 Oct 2026 16:23:51 +0000
Subject: [PATCH v2] ublk: refuse to go live after an io command was canceled
To: Ming Lei <tom.leiming@gmail.com>,
    Jens Axboe <axboe@kernel.dk>
Cc: Caleb Sander Mateos <csander@purestorage.com>,
    linux-block@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    linux-doc@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>

Since commit "ublk: keep a canceled FETCH round canceling until the
server is gone", a device whose FETCH round saw a cancel keeps its
queues canceling until the server goes away, but START_DEV and
END_USER_RECOVERY still bring it up. Without UBLK_F_USER_RECOVERY, or
with UBLK_F_USER_RECOVERY_FAIL_IO, every request of the new disk fails.
With UBLK_F_USER_RECOVERY, requests are requeued and never kicked: after
START_DEV the partition scan hangs under disk->open_mutex, and after
END_USER_RECOVERY every read parks while the command returned 0. The
server cannot fetch the canceled commands again, so the device can't
serve I/O until it restarts anyway.

Return -EBUSY from START_DEV and END_USER_RECOVERY while ub->canceling
is set. In ublk_ctrl_start_dev() check it and publish ub->ub_disk in one
cancel_mutex section, and have ublk_start_cancel() read the disk in its
cancel_mutex section. Today ublk_start_cancel() samples the disk before
taking the mutex, so a server dying during its own START_DEV can mark
the queues without quiescing a disk START_DEV published in between, with
its first I/O past the canceling check. Now either START_DEV sees the
cancel, or the cancel sees the disk and quiesces it before marking. The
END_USER_RECOVERY check is best effort: the disk exists there, and a
cancel after it is the ordinary death of the new server, which
ublk_start_cancel() handles by quiescing and marking.

Assisted-by: LLM
Reviewed-by: Ming Lei <tom.leiming@gmail.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
---
v2: -EBUSY instead of -ENODEV, the device isn't gone (Ming)

This applies on top of Ming's "[PATCH 0/8] ublk: don't dispatch to
canceled io commands" and needs patch 1 of it for ub->canceling to stay
set for the whole FETCH round.

 Documentation/block/ublk.rst | 10 ++++++++--
 drivers/block/ublk_drv.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/Documentation/block/ublk.rst b/Documentation/block/ublk.rst
index 28300fee22bf..6c5536ebd987 100644
--- a/Documentation/block/ublk.rst
+++ b/Documentation/block/ublk.rst
@@ -118,7 +118,11 @@ managing and controlling ublk devices with help of several control commands:
   After the server prepares userspace resources (such as creating I/O handler
   threads & io_uring for handling ublk IO), this command is sent to the
   driver for allocating & exposing ``/dev/ublkb*``. Parameters set via
-  ``UBLK_CMD_SET_PARAMS`` are applied for creating the device.
+  ``UBLK_CMD_SET_PARAMS`` are applied for creating the device. The command
+  fails with ``-EBUSY`` if an I/O command fetched by the current server
+  was canceled, because its io_uring is gone. The server can't fetch it
+  again, and the device can be started again once the server has closed
+  ``/dev/ublkc*``.
 
 - ``UBLK_CMD_STOP_DEV``
 
@@ -195,7 +199,9 @@ managing and controlling ublk devices with help of several control commands:
   command is accepted after ublk device is quiesced and a new process has
   opened ``/dev/ublkc*`` and get all ublk queues be ready. When this command
   returns, ublk device is unquiesced and new I/O requests are passed to the
-  new process.
+  new process. It fails with ``-EBUSY`` if an I/O command of the new
+  process was canceled already. The recovery can be started over once the
+  new process has closed ``/dev/ublkc*``.
 
 - user recovery feature description
 
diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index f57d544c1da2..015aff07703c 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -2759,9 +2759,11 @@ static void ublk_abort_queue(struct ublk_device *ub, struct ublk_queue *ubq)
 
 static void ublk_start_cancel(struct ublk_device *ub)
 {
-	struct gendisk *disk = ublk_get_disk(ub);
+	struct gendisk *disk;
 
+	/* sync with ublk_ctrl_start_dev() publishing the disk */
 	mutex_lock(&ub->cancel_mutex);
+	disk = ublk_get_disk(ub);
 	if (ub->canceling)
 		goto out;
 
@@ -4575,6 +4577,7 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub,
 		.dma_alignment		= 3,
 	};
 	struct gendisk *disk;
+	bool canceled;
 	int ret = -EINVAL;
 
 	if (ublksrv_pid <= 0)
@@ -4665,8 +4668,24 @@ static int ublk_ctrl_start_dev(struct ublk_device *ub,
 	disk->fops = &ub_fops;
 	disk->private_data = ub;
 
+	/*
+	 * A command of this FETCH round was canceled and can't be fetched
+	 * again, don't bring up a disk over it.  Check and publish the disk
+	 * in one cancel_mutex section: either this sees ub->canceling, or
+	 * ublk_start_cancel() sees the disk and quiesces it before marking
+	 * the queues.
+	 */
+	mutex_lock(&ub->cancel_mutex);
+	canceled = ub->canceling;
+	if (!canceled)
+		ub->ub_disk = disk;
+	mutex_unlock(&ub->cancel_mutex);
+	if (canceled) {
+		put_disk(disk);
+		ret = -EBUSY;
+		goto out_unlock;
+	}
 	ub->dev_info.ublksrv_pid = ub->ublksrv_tgid;
-	ub->ub_disk = disk;
 
 	ublk_apply_params(ub);
 
@@ -5238,6 +5257,7 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 		const struct ublksrv_ctrl_cmd *header)
 {
 	int ublksrv_pid = (int)header->data[0];
+	bool canceled;
 	int ret = -EINVAL;
 
 	pr_devel("%s: Waiting for all FETCH_REQs, dev id %d...\n", __func__,
@@ -5261,6 +5281,20 @@ static int ublk_ctrl_end_recovery(struct ublk_device *ub,
 		ret = -EBUSY;
 		goto out_unlock;
 	}
+
+	/*
+	 * As in ublk_ctrl_start_dev(), a canceled command can't be fetched
+	 * again.  Best effort: the disk exists here, and a cancel after this
+	 * check is the ordinary death of the new server, which
+	 * ublk_start_cancel() handles by quiescing and marking.
+	 */
+	mutex_lock(&ub->cancel_mutex);
+	canceled = ub->canceling;
+	mutex_unlock(&ub->cancel_mutex);
+	if (canceled) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
 	ub->dev_info.ublksrv_pid = ub->ublksrv_tgid;
 	ub->dev_info.state = UBLK_S_DEV_LIVE;
 	pr_devel("%s: new ublksrv_pid %d, dev id %d\n",
-- 
2.55.0

