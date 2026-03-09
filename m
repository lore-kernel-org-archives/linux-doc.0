Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CB3BED09
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 12:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060354; cv=none; b=Q/bxCuvxsdBeYHBY5gRVg5Lc0nNJXJUM+5QxT/M39OlwOeEaqu0JNHQRjhk4LyTVuY028tKhW/RxL0XBR03XiH2yksdAB/DKeLIRGxosuyQ6wM87WuAlvejmlyFGBwNh65DGZuDuH3ynMbOdbutdhx1cwow+iR8vUML/UPZHRKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060354; c=relaxed/simple;
	bh=msrA7wGjRRGTCwCsfx7ePt2yNBhyVAifse7Q2+9fCm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GoXWl/zhM9HtMEoaGwep/3ws546KcmH4PCskA6BRj5sF3uhV20A58xZ7lWrb0/JJoSQKFFRbzhcVQOP4uQhDPv9jXxbd+BXQiLI3SK3f7xnRTTefshboqaOev7luXui2ZE/wd86XV0Hp93dwduot5bxVuqjr4Qdd8FwiWAdGQE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awEHbyIp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awEHbyIp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c73a12af63cso1487969a12.0
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 05:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773060352; x=1773665152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TQsAUyUgurtuYPOjOt9kS2ZoheMJQ/CgpVDQoe0FZmA=;
        b=awEHbyIphba0IKRzVQ8WeBRDsxVx+4o0gw7U+SZzzkV3PAs84V2TmVieNA0HmDckuI
         HfDrGy6HDaDSKmz+mD2kx3KfhKsE14/Vgi+CgYtOP/vblX1rWORcq20Pf4J0qD3fZy1w
         o03KtrtpSvVRL1NoWaabUwm/J9eO0yhrLwsOVdROU5I5pQO0zzsYsuUZYWvZAxKCI/yo
         u+EzgXRVqacbt1kmfN5zA02UJ9Xm8xcY/KRMr3YBqSxiiGl9zQM5uBzNDP6tDrm+uBk0
         ZK62u6PgxldMn2HZXQ6NDf33M6BiT154b9IVhUJjS/ldZR7/yj4HM5h/4PQ2u9Aj0740
         HA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060352; x=1773665152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TQsAUyUgurtuYPOjOt9kS2ZoheMJQ/CgpVDQoe0FZmA=;
        b=pGWWHktUXUSpLhrmOvWYTzTiv7L00JEAt3JzjARBFTtDHM+O0sTsKMte1V6I9jMKrm
         QHJDQY7s7k1XwzcpAyFILzfPROCNtBJ9JpfZoazW6tHz58ZrfLpelgQOJbs+1+N0u0Uv
         PqTtwCE4m2IRUpL2p8mEex21XfRaTKKWQ+GU+6Ew6MdlHh1Y+S0nGeJX59N4pikfyd/S
         QyOurG3gC6Q3HEhevjBa/DZVCxibkQ08ICycD6bCYpFqHqpfe1ga/4n9Q+2RFZBWZqQf
         wmjwQj6JoEOIBw1ZTcEx6m5/QpoQoQNG/VuF7Yg+t5cFtWu0jPnzgsFC1LPmaUh53FLp
         HXug==
X-Forwarded-Encrypted: i=1; AJvYcCVDxjdpRILrcoOw2oiCR1ISmbNboqAM4BTpIWAW7IwHMilbPjSgpzVznZ9pNYFGOLDAPcavkrn4+Ek=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrq0R81flrGCXIYi3XtRNEw4wg1HhQRbAguw9Ktmsx84VhQ+ME
	/6pWKBzeNg29H//lDwXP7uyZFnuGZgRWD508Oxw6KyOJkC1Ov2DJ6NWv
X-Gm-Gg: ATEYQzxPbwooiods8aMFwmipG04EUMA7fAkKrziemaDtB0+KAuvcMQc/VXMSgXV8xBr
	+VBQ2r/nGSq0x4DXhIYbcZ06UvISmORKsHCs1JAtb1jOYjl4CbDXrIIW0Bk/OMFy8P6JmlqXcJR
	g+sOndAYUR+z72aFblwfhfI0QjDpf53yujJCh4pI5+aHs3ue4g6KAltPmgpFT1mgC4X3HsEiaj4
	0j7wIO5vMNcBXuXCUyROUapWR0vO2HH6lYAo7nyz/PDkPE1qkqGjvQMojG09m1hQTSTsUmN7t2O
	JoILJOcxIZrbYXmlD0838Zi3HAmLr9zCtD0wsrD4ttxNThvLlwTZlZdcI2egU/lT4qzN88Duh/U
	DQ289Bv4E4YI0fkJVIfQEShjBxXby5jo5lIEV0fuqUUc5g9qTsdEwyTxZjv3pmos7hsdRfMwAXm
	1IygKzgXS83O0UFE00tXc5aZgD00BvXSMdfBM38mEZ7RQU89Kf6ym0/w8k5ALh
X-Received: by 2002:a05:6a20:d807:b0:398:8546:c3e1 with SMTP id adf61e73a8af0-3988546ca4bmr4730270637.62.1773060352201;
        Mon, 09 Mar 2026 05:45:52 -0700 (PDT)
Received: from ubuntu24-04.. (120-51-71-230.tokyo.ap.gmo-isp.jp. [120.51.71.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm9178830a12.27.2026.03.09.05.45.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:45:51 -0700 (PDT)
From: sawara04.o@gmail.com
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Kyoji Ogasawara <sawara04.o@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 net-next 2/2] net/smc: Add documentation for limit_smc_hs and hs_ctrl
Date: Mon,  9 Mar 2026 21:45:40 +0900
Message-ID: <20260309124541.22723-3-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309124541.22723-1-sawara04.o@gmail.com>
References: <20260309124541.22723-1-sawara04.o@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

Document missing SMC sysctl parameters limit_smc_hs and hs_ctrl

Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
---
 Documentation/networking/smc-sysctl.rst | 27 +++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/networking/smc-sysctl.rst b/Documentation/networking/smc-sysctl.rst
index 17b8314c0e5e..3bbc5739f8ac 100644
--- a/Documentation/networking/smc-sysctl.rst
+++ b/Documentation/networking/smc-sysctl.rst
@@ -111,3 +111,30 @@ smcr_max_recv_wr - INTEGER
 	like before having this control.
 
 	Default: 48
+
+limit_smc_hs - INTEGER
+	Whether to limit SMC handshake for newly created sockets.
+
+	When enabled, SMC listen path applies handshake limitation based on
+	handshake worker congestion and queued SMC handshake load.
+
+	Possible values:
+
+	- 0 - Disable handshake limitation
+	- 1 - Enable handshake limitation
+
+	Default: 0 (disable)
+
+hs_ctrl - STRING
+	Select the SMC handshake control profile by name.
+
+	This string refers to the name of a user-implemented
+	BPF struct_ops instance of type smc_hs_ctrl.
+
+	The selected profile controls whether SMC options are advertised
+	during TCP SYN/SYN-ACK handshake.
+
+	Only available when CONFIG_SMC_HS_CTRL_BPF is enabled.
+	Write an empty string to clear the current profile.
+
+	Default: empty string
\ No newline at end of file
-- 
2.43.0

