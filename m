Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF02E265631
	for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 20:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739304368; cv=none; b=BTfK0VLSn/KBhFhNzNzsqhAnuOUW08W7JXNYnLlUxOhIMF6o9lZGpJtAAJ5iI64C7/It7vwsz1r0uCI1NPvAkM03GFAOrnVaKrehDv6o4OuXS6hLFK4qFd99rTxtmsezEtQMlWrqJttijMwl30u2+IfhYAd5ruwoq/fLLab3ARU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739304368; c=relaxed/simple;
	bh=ft0iTXOlvHUjc3hz8JBZEHUjPHt9IGzMRpYUZVq8nDk=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=mcZJzU1697WrcAZEdakURoxzlY4y/y+Khgd300m4dW1wgXFpaflG52p2wA5MGCzSEZVSQo0bCLQ6v1K+QeatDkuizh4PBdRuevjsIdr5F79fGohrWk10XxhwUZDuiuBew95W6Ru4QlwWnKQupG4puEQSbFM1vowM5USUyDIKggM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=twsj5kPc; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="twsj5kPc"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de74599749so4249179a12.1
        for <linux-doc@vger.kernel.org>; Tue, 11 Feb 2025 12:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739304364; x=1739909164; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Nxkie6yLM0q2pX+0WAYEdeQeZkDttdl+fqsW8wL2k/g=;
        b=twsj5kPcxUDuVWjBv9vg518yUWxM4dXIEiKPGZm0+MKODqD8lGnR1yluoDEsaV/3vF
         ogdYolUyq6Tou1SUyRnYa9bIpNA+eXIQT2oCuhYfJ5GUpkvAemGwXuMGjNCkj3/sFpGI
         0FvoD4SEOUh9RuzTr04S4Q194TuiPUGp0bGeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739304364; x=1739909164;
        h=cc:to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Nxkie6yLM0q2pX+0WAYEdeQeZkDttdl+fqsW8wL2k/g=;
        b=ArWWBTq3FZx/mjQm3g9mAq02l8o91ggstttlRBbJwC2OAE2gpvrTF68hKfW34aS/0E
         4CP8NGSsY7qDuyTP2q0r5tCiG81XUxXrTnvvwzvDUYcDbPvYfzaJiTqZbaC9a5a3PV7p
         vmhLRtzZud3hNIyqD4NKxwKxrzFfF90ykOHwWkvD/P5tYi6QaVFfZPwLsj9W8LaEld5P
         0LXEM/he8uDihJ/BiJCili9gcAsvvh1ctsUW7mITjFzeuX+CQSh8JiTDX+N6Uquy0PiV
         DUOwwPhbwmnNlihc8st/j0ckVHnmhPjmqFJpTdm9qS+Erw5hFferNHCu3d30JMYRJcr/
         wy2A==
X-Forwarded-Encrypted: i=1; AJvYcCXtTRabcFPkY5WHLmuhiW4NBD3MH9YxPoNkPauJGAHTmayQdqjMqf/PPDmDxcuzOlsYkQaN2PwYQ78=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2nJw6aKZJ+WpNT07zlZm4eMDI6EXDFAbxU993r9hm8X5Pphlo
	zLKZtLKWo3rCjxw9CXU+hJgfJNaZikF9ohaHqp66G4Rnu9FUs84ETShXwN+yM8XaxwqEQsBmiL7
	mJ4E9Me8PqPb6Zj2hoPlSIivSiadhinvyobJ+Xg==
X-Gm-Gg: ASbGncu6jUbqh9YqRw+BUCaY69xtwbt6j+MPKRba+zYI5qU5v/hZb4FVAMRycmd9VQT
	Ell2BT0eXIqYgttwKPYJt3LhMr79H5vT1CU4HVRXHiVrde1yBGtx9F9e4QbCRfHHbjFMgu5y0hw
	RuIxtN827KhxaIeG39y9F6wA+c
X-Google-Smtp-Source: AGHT+IHoKfgQCKWZr7QsjqOlhYz8Ox3tvPFbg93XOMkmh6ra72F9JlcLUDZxrph5gh4NGZsFZXFolvtA6RlQNHopUqo=
X-Received: by 2002:a17:907:6d05:b0:aab:8ca7:43df with SMTP id
 a640c23a62f3a-ab7f347db66mr24967366b.39.1739304363872; Tue, 11 Feb 2025
 12:06:03 -0800 (PST)
Received: from 155257052529 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 11 Feb 2025 20:06:03 +0000
From: Joe Damato <jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 11 Feb 2025 20:06:03 +0000
X-Gm-Features: AWEUYZm9IYCWBJGOUEwrC9uMXesN9YSdVvlwLoAEoxsHN8IrvsvNvDyqzWHbUjM
Message-ID: <CALALjgz_jtONSFLAhOTYFcfL2-UwDct9AxhaT4BFGOnnt2UF8A@mail.gmail.com>
Subject: [PATCH net-next v2] documentation: networking: Add NAPI config
To: netdev@vger.kernel.org
Cc: kuba@kernel.org, rdunlap@infradead.org, bagasdotme@gmail.com, 
	ahmed.zaki@intel.com, Joe Damato <jdamato@fastly.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Document the existence of persistent per-NAPI configuration space and
the API that drivers can opt into.

Update stale documentation which suggested that NAPI IDs cannot be
queried from userspace.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 v2:
   - Reword the Persistent Napi config section using some suggestions
     from Jakub.

 Documentation/networking/napi.rst | 33 ++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/networking/napi.rst
b/Documentation/networking/napi.rst
index f970a2be271a..d0e3953cae6a 100644
--- a/Documentation/networking/napi.rst
+++ b/Documentation/networking/napi.rst
@@ -171,12 +171,43 @@ a channel as an IRQ/NAPI which services queues
of a given type. For example,
 a configuration of 1 ``rx``, 1 ``tx`` and 1 ``combined`` channel is expected
 to utilize 3 interrupts, 2 Rx and 2 Tx queues.

+Persistent NAPI config
+----------------------
+
+Drivers often allocate and free NAPI instances dynamically. This leads to loss
+of NAPI-related user configuration each time NAPI instances are reallocated.
+The netif_napi_add_config() API prevents this loss of configuration by
+associating each NAPI instance with a persistent NAPI configuration based on
+a driver defined index value, like a queue number.
+
+Using this API allows for persistent NAPI IDs (among other settings), which can
+be beneficial to userspace programs using ``SO_INCOMING_NAPI_ID``. See the
+sections below for other NAPI configuration settings.
+
+Drivers should try to use netif_napi_add_config() whenever possible.
+
 User API
 ========

 User interactions with NAPI depend on NAPI instance ID. The instance IDs
 are only visible to the user thru the ``SO_INCOMING_NAPI_ID`` socket option.
-It's not currently possible to query IDs used by a given device.
+
+Users can query NAPI IDs for a device or device queue using netlink. This can
+be done programmatically in a user application or by using a script included in
+the kernel source tree: ``tools/net/ynl/pyynl/cli.py``.
+
+For example, using the script to dump all of the queues for a device (which
+will reveal each queue's NAPI ID):
+
+.. code-block:: bash
+
+   $ kernel-source/tools/net/ynl/pyynl/cli.py \
+             --spec Documentation/netlink/specs/netdev.yaml \
+             --dump queue-get \
+             --json='{"ifindex": 2}'
+
+See ``Documentation/netlink/specs/netdev.yaml`` for more details on
+available operations and attributes.

 Software IRQ coalescing
 -----------------------

base-commit: ae9b3c0e79bcc154f80f6e862d3085de31bcb3ce
-- 
2.43.0
