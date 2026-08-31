Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF9B44E038
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 14:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186760; cv=none; b=eAAu/VMbBAFoPlrNls7oMUq3xIVmFU0S4+f9nRhY83yU15RAy7Kg1qYHChD8/1k/idx/exJzsWzug00/jMCPWbr2oGSiyr2pNXL9U228Zf7OFz0PBCwojMZRSv1YtEDC2b3Ygjh6kgQPkvn85fiTRhtBebtR83kEIxiRpMyCWMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186760; c=relaxed/simple;
	bh=sfikze6+gZ+EsCWAIYm+ZSac24RursuN4Dou+8L9PbQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qLtx6aQj7MI0Q3Rc+ioR5qG8nmGtNn1iWHdj5GRwI1WEo4XNEdUe1/oqHp/5ORk3CzH5TGy7S1BYmeK/sG4ckgWic8mTSVcB1jMfUeechlPdUsfaEi+thGKmtV7DfdGQHHtHovJ+pcR1dbFCQ9+SO9WLikD+CsA9OWoLGgpbtnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jq/IZcF3; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jq/IZcF3"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49b0d78a801so27636695e9.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186757; x=1788791557; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1zuj9/JVZ1cDk7VZA+4erdxKCKl7cu9pGDcl0kl4ePs=;
        b=Jq/IZcF3R08hI+MwFgCrYpkcIOPhbeXbwseqGCz2fytVFqmai9Ei7ARh2eOC/r3mMp
         qosaltlmmXsGTP9Pq5TtptZev+EvwOGDx71X3SA+BvNwwGU27v+PxTKJGSmYQyWUnRkp
         nHHnbEaH+017xc8Og11BhE+tyoc2ZZSIArAUkbUnRgBftL/N1OiOLQSc0bTP/Cj/Veqi
         sCmEl9bhQXM8Udy/F6h2wDmAno67TSWHhrDBFWZPHx70TiKRlr84ax6XIAsYbybvlBeX
         PBv0VeZ00EnmDCoH48fuXpiMMPMuhdCKYgz1Mfs99j8CXCuEPbOthnpjfEtxbIWS6jbn
         W/pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186757; x=1788791557;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1zuj9/JVZ1cDk7VZA+4erdxKCKl7cu9pGDcl0kl4ePs=;
        b=OkuU0n8m4ZMHYiZ/+luLk9wnpc8QTpcTH64jkab2yt2ImUwbtY4s4wf12kHopRQcZZ
         peep8G/sDURFLCMGRuC7vD/dwcy1nM0WYr3Ty/DkMwr+zUMnrL/BI4zI2bjbGsBcEFKO
         74UvPAMGywH3rjNlumKz2hI/Ds94jLUxoPnms+ICsvoXpFVIxpU7zar9Z9WBd2tfU1ot
         AXWdCH0aCsSuAUCUoIzl3JUGO9HVLhvsUiQ/jaAP0VyX5PZcLy9rqbOZeQY8AIggZbDv
         bY0RWLUMiuDNVJ1cqFFpfL3XSKfuAg//pDCusT7ThyM+B/yJMvXZ2yBv9Z+DICrpcl/M
         +Aaw==
X-Gm-Message-State: AFuF++l8eGnhCYRmekvX1m/oON4bSQ83I/YzfgNna9558C00XNWv/zBk
	YbgN8BDRaYD351QtzT4BmxnJcV0ykfOW0TR+8hQz9qekjPtyCwg10mOK
X-Gm-Gg: AR+sD11Ut/BzRY7o+nE8YWnxpmZgeEjr6pZmzC6K1LJZ1ax3l8Yh0KrHRf2xUM+mVqq
	ncy9ys38FoIa17Pq3xKKbx9g9qbt1oZlXXopKdSU4zT0T9Vtt7lFzKXAy6vlVQAZd3qRsD+XeLK
	E3DmgwnN927A12aijMNWb8Ceq41HL8op+E+AsinFGSOEDw5Jots0kfuRClS6tORiS9x1D20NYWm
	52QJng2QmLsKGYunIR58KbHvZFX2pCtOtqTb5AefRbH4X4EZ+S47QWBLD+E4Vl74C5A7Qf6Tka3
	A6RQrSOQ3R2fYZMfU7AsGBQV67N+h3WCPBmKtqnKu6/JNRGDoc6TbyYeF+OmqlWKQScDNMtAigz
	j4p5Y2gXdUh4zXbvF0rzuqs9uY3PkSCVDejUTLOeF+Q6N+hpyRxuevfKoO3B4l8JOjiiUVeANvB
	yPd2xoSDh6NthmYTNuDzsuoWabGtQTlqLIhRGBjxwvIGuteRJI3emIPPWg1pFvE9Bkkw/Wov42o
	4nl6xnHxqSQ0jLWiQcX9Plx
X-Received: by 2002:a05:600c:3549:b0:49b:5521:785d with SMTP id 5b1f17b1804b1-49b91c1e9d8mr389591765e9.4.1788186756314;
        Mon, 31 Aug 2026 07:32:36 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:35 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 5/7] docs: vduse: align documentation with current uapi and driver
Date: Mon, 31 Aug 2026 11:31:23 -0300
Message-ID: <20260831143125.151360-6-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Update supported device IDs (block, net, fs), all six read/write message
types, the VDUSE_VQ_INJECT_IRQ ioctl name, and VQ_SETUP group vs asid
usage per include/uapi/linux/vduse.h.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 Documentation/userspace-api/vduse.rst | 33 +++++++++++++++++----------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/Documentation/userspace-api/vduse.rst b/Documentation/userspace-api/vduse.rst
index 81479d47c8b9..d316857ca5bd 100644
--- a/Documentation/userspace-api/vduse.rst
+++ b/Documentation/userspace-api/vduse.rst
@@ -11,11 +11,10 @@ to make the device emulation more secure, the emulated vDPA device's
 control path is handled in the kernel and only the data path is
 implemented in the userspace.
 
-Note that only virtio block device is supported by VDUSE framework now,
-which can reduce security risks when the userspace process that implements
-the data path is run by an unprivileged user. The support for other device
-types can be added after the security issue of corresponding device driver
-is clarified or fixed in the future.
+Note that virtio block, network, and filesystem device types are supported
+by the VDUSE framework. Other device types may be added after the security
+implications of the corresponding device driver are clarified or fixed in
+the future.
 
 Create/Destroy VDUSE devices
 ----------------------------
@@ -135,7 +134,8 @@ module as follows:
 		return 0;
 	}
 
-There are now three types of messages introduced by VDUSE framework:
+The following control message types may be delivered via read(2) on
+/dev/vduse/$NAME:
 
 - VDUSE_GET_VQ_STATE: Get the state for virtqueue, userspace should return
   avail index for split virtqueue or the device/driver ring wrap counters and
@@ -151,6 +151,15 @@ There are now three types of messages introduced by VDUSE framework:
   IOVA range, userspace should firstly remove the old mapping, then setup the new
   mapping via the VDUSE_IOTLB_GET_FD ioctl.
 
+- VDUSE_SET_VQ_GROUP_ASID: Notify userspace to change the address space of a
+  virtqueue group (API version 1).
+
+- VDUSE_SET_VQ_READY: Notify userspace that a virtqueue should become ready or
+  not ready (when VDUSE_F_QUEUE_READY is negotiated).
+
+- VDUSE_SUSPEND: Notify userspace that the device is being suspended (when
+  VDUSE_F_SUSPEND is negotiated).
+
 After DRIVER_OK status bit is set via the VDUSE_SET_STATUS message, userspace is
 able to start the dataplane processing as follows:
 
@@ -227,7 +236,7 @@ able to start the dataplane processing as follows:
    described by the descriptors in the descriptor table should be also mapped into
    userspace via the VDUSE_IOTLB_GET_FD ioctl before accessing.
 
-5. Inject an interrupt for specific virtqueue with the VDUSE_INJECT_VQ_IRQ ioctl
+5. Inject an interrupt for specific virtqueue with the VDUSE_VQ_INJECT_IRQ ioctl
    after the used ring is filled.
 
 Enabling ASID (API version 1)
@@ -238,11 +247,11 @@ version 1. Set it up with ioctl(VDUSE_SET_API_VERSION) on `/dev/vduse/control`
 and pass `VDUSE_API_VERSION_1` before creating a new VDUSE instance with
 ioctl(VDUSE_CREATE_DEV).
 
-Afterwards, you can use the member asid of ioctl(VDUSE_VQ_SETUP) argument to
-select the address space of the IOTLB you are querying.  The driver could
-change the address space of any virtqueue group by using the
-VDUSE_SET_VQ_GROUP_ASID VDUSE message type, and the VDUSE instance needs to
-reply with VDUSE_REQ_RESULT_OK if it was possible to change it.
+Afterwards, ioctl(VDUSE_VQ_SETUP) takes a virtqueue group index in
+struct vduse_vq_config::group.  The driver can change the address space
+of any virtqueue group by using the VDUSE_SET_VQ_GROUP_ASID message type,
+and the VDUSE instance needs to reply with VDUSE_REQ_RESULT_OK if it was
+possible to change it.
 
 Similarly, you can use ioctl(VDUSE_IOTLB_GET_FD2) to obtain the file descriptor
 describing an IOVA region of a specific ASID. Example usage:
-- 
2.43.0

