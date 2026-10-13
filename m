Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5990415F38
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 01:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791855843; cv=none; b=KhAh6dahEFiKGp9w8HzYS16nb0ZIFaz9l7Uo4OxXd6e2IxpIAbsCSsKQ9+6fj8tewv7w7z5hT9IBuHwrJ7f5FzqvKBO8omdY8A8I4q058ZAjOnrEuife5GxNBID91Z9mNs10npq7oibbsmJtYh3i+jbLwb32bPcCd0JX8rHd3PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791855843; c=relaxed/simple;
	bh=cwxYtqwV/asJI0sJ0LThEUuGst5eSyMrVjDHOf8D+Tc=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=PeGEEy47Irwo7UrLflicBQSsFMv601A1zQyzcT7hYrHKLTpKL0o1ItAo0y1hcJfnS8hw5X4L+R089UWiSyUiTvXl18k3Ww4ctCs9diP3zc8US0a+JDN/Cnu7rCoopogwVmOSOoj4MAbppzGbbThtsvKmhAUSM7vGWwi+v/7epjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pAyFLk7p; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pAyFLk7p"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso846639a12.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 18:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791855841; x=1792460641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lKPaX1rZHzqkluIlwZ5oqUSCtuKL8Cpnoh/XmdieGa0=;
        b=pAyFLk7paXKxrkn8c72rJreBTor/XtNoHRo5kTxy4mbg+hjYWndVAHATazbXlYjNP2
         qG91wyhjWVXmFysdR3BBwo+hLlYNsGV/UnvfKF+inz3qLiPp77AulUdRLzg+PtGmaL60
         qJ3K8YtaSoyFQKR2LAogr6szC8rRBzpQXJDE0oP78cZdK4CDShqZYQoGJxurwB6e1geB
         Og4H5XIGaneQ2Ub0SH6OTdS+Cs0dW+Ql/l6b4YHpwttK4M3oBnUE576pJ/5oEAXpbpuE
         8YVsk16mvODCn81KQ5gHoWzQo3eJFPK29SS6qem+NPrhzGXrKOiLcuGzQasWu5tGlbET
         AW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791855841; x=1792460641;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lKPaX1rZHzqkluIlwZ5oqUSCtuKL8Cpnoh/XmdieGa0=;
        b=0jiWem5VQLyol0fEnWt2sIflnl2v3yWogML8IbxuZTGWzIh10QynAFp9emszcrDDZb
         jC6/Un1K10Kp0W6RMyHmNfTjxQ6j63wulD3ZrtbEFvl0xn7kFRv/XwwMidXrjU5aq+qa
         u/bTndDjnNEplLlgl6luW6ds8ayK/alfBDrTceTIO5injT7MbEZWEJyaufIMihlWPdJz
         2UgJPqik3hPotghQa+Y+dvYl2kSGzbHhT6BR5FytbuV9Q0Suwx8ywSFu6QjhP2cI2W8/
         cSjgFHoYUcAg5n+QRqWJrcnR971SXgqq0I0nZGm7yAO4eC042EovNEm3HbAG9usZC8NC
         gPrg==
X-Forwarded-Encrypted: i=1; AKwUvByQxQPAGQb5902i1epU8UV1zWMJOw1NW/MKtMvI5AlYwDFiYqjV5GdZAIN+X2CxwjAR2f0CwDhCLOg=@vger.kernel.org
X-Gm-Message-State: AFq9FYID+t6Z21b2UG5cyocyvfUyTEZ11Qy46kCm+PIeNLLbuNaDEvBC
	Yy72Ap4HUVa6ujqSqeBaBEO9xDRrruF3BHcXcU9HckdmNrsN9Jn359Lq
X-Gm-Gg: AYBFou1XXqb/jd8Fq4Q5XDadNilSdr51EHXKmCBBmrj2CUk1pMavb05YIXQHVxsvnNc
	kDLwd3/uzhD37TcTgFFMNR7pjE0JQaX5qklYK/QAQtvh8e8vmfQ7y3Un5QizP4sgjYG0iCpzVnr
	JZ7lfXoZKpE8KsJh0aoBShn4rKlrZuh9+qHE9c2F3fI32UqHyQRR02J9oC9pPm9hFOizIo9Vku/
	jvE0mMxafCl3KHSwkay0cy3Ir7lrn2W/b3hNC1Y/fdJSY99TyB1hDtVMQNihHCuueepASekaLQi
	vbAbbUagjFRTI1yKwZENXoB98EhzxmKQb2Dwd3DhOCoMPcFacumCIj/sQ6Fak3VDFjlSm5ah2xe
	syGQjNWSYo6RXuiA2FZFxzYkRjDcmR7qiMFdP4YOR8xhDx6bCKMv1yTCiAZsFfNt6r2Mm4NQBrX
	lf7DCQH3vSZB+KiixzIqeYM+3w2UEjZKdV32tCqYc7RoAniJnXOBQfdLR8Q2TMhcoEfopthI6wU
	RzML7gtROp44wC5qT1dzWoKf8PppFxDA+3zw67AA4doYAK7jelzdMUAEjk6a/rS
X-Received: by 2002:a17:90b:4a8f:b0:3aa:fc22:8ab0 with SMTP id 98e67ed59e1d1-3ab3a8e55damr9182667a91.38.1791855840930;
        Mon, 12 Oct 2026 18:44:00 -0700 (PDT)
Received: from localhost.localdomain (c-174-165-208-10.hsd1.wa.comcast.net. [174.165.208.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac38b36d41sm1060191a91.2.2026.10.12.18.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 18:44:00 -0700 (PDT)
From: Michael Kelley <mhkelley58@gmail.com>
X-Google-Original-From: Michael Kelley <mhklinux@outlook.com>
To: haiyangz@microsoft.com,
	wei.liu@kernel.org,
	decui@microsoft.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3 1/1] Documentation: hyperv: Update documentation for sending VMBus packets
Date: Mon, 12 Oct 2026 18:43:54 -0700
Message-Id: <20261013014354.18023-1-mhklinux@outlook.com>
X-Mailer: git-send-email 2.25.1
Reply-To: mhklinux@outlook.com
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The functions for sending VMBus packets have changed.
vmbus_sendpacket_mpb_desc() can target multiple ranges, and
vmbus_sendpacket_pagebuffer() has been removed. vmbus_sendpacket_getid()
has been added. Update the documentation accordingly.

Fixes: 45a442fe369e ("Drivers: hv: vmbus: Remove vmbus_sendpacket_pagebuffer()")
Cc: stable@vger.kernel.org
Signed-off-by: Michael Kelley <mhklinux@outlook.com>
---
Changes in v3:
* Fixed typo in the documentation text [Sashiko]

Changes in v2:
* Add vmbus_sendpacket_getid() to the documentation. [Naman Jain]

 Documentation/virt/hyperv/vmbus.rst | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/Documentation/virt/hyperv/vmbus.rst b/Documentation/virt/hyperv/vmbus.rst
index 654bb4849972..c546e821ce6b 100644
--- a/Documentation/virt/hyperv/vmbus.rst
+++ b/Documentation/virt/hyperv/vmbus.rst
@@ -141,14 +141,15 @@ Three functions exist to send VMBus channel messages:
 
 1. vmbus_sendpacket():  Control-only messages and messages with
    embedded data -- no GPAs
-2. vmbus_sendpacket_pagebuffer(): Message with list of GPAs
-   identifying data to transfer.  An offset and length is
-   associated with each GPA so that multiple discontinuous areas
-   of guest memory can be targeted.
-3. vmbus_sendpacket_mpb_desc(): Message with list of GPAs
-   identifying data to transfer.  A single offset and length is
-   associated with a list of GPAs.  The GPAs must describe a
-   single logical area of guest memory to be targeted.
+2. vmbus_sendpacket_getid(): Similar to vmbus_sendpacket() but returns
+   a transaction ID that is matched against a reply from the Hyper-V
+   host. Useful when the struct completion (or other rendezvous data)
+   must reside on the caller's stack. By invalidating the transaction
+   ID before exiting the function due to a timeout or other error, a
+   late arriving interrupt is assured to not trash the stack.
+3. vmbus_sendpacket_mpb_desc(): Message with one or more data ranges
+   to target. Each range consists of a single offset and length plus
+   a list of GPAs that describe a logical area of guest memory.
 
 Historically, Linux guests have trusted Hyper-V to send well-formed
 and valid messages, and Linux drivers for synthetic devices did not
-- 
2.25.1

