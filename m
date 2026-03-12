Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAFF3FE669
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 17:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773338051; cv=none; b=dEhG4KzSCPFHA4n8JejV2nl9KnTtLBMwszPUXj2gPjLwz/NVxB76Pic6+tEwXG1dXS+wztXLv3DYEpZ2oN488e/rI1riK3dky8bQrG6ghYLwD1u5QiOujw4kB/IW/SkyYbIFWpNh8cDzXdIHCYxIpyPqFu+NaiDaElzW4id+7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773338051; c=relaxed/simple;
	bh=JCTBH7GXPbxvcv4uKgjSOwbR68uwRtHYauKTbfhWfuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OXmK9zbB/eqgQtVSMT1fpMI/xsad3zCZyG+sgjlRCWHkZh0BCFlGXMYZ4WMphGAakQFd0v5eXDSEAobubR1VIR9siFJL3barKlbq+qm5lsxy0e3cjVK0PTNkJRKjA1NwdnHH9Q2Q9Jnx2AubgaDtWzwg43DeX0YiU8cILvV533s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QsczDYEn; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QsczDYEn"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ae4d919f9bso9021435ad.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 10:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773338049; x=1773942849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uUkJl4DF7APJYPjD474UUxiLiC7WbxzdLnKNmRAWUWg=;
        b=QsczDYEnpqjOeM9qM7T4bSWbvkCrmkOGQMkWci28R5R3WswZiQSf3YDXOxeu9fvZjp
         juyksWSwnKJC9yutWn2HT0oVGj0be2MUBrKjwJbNShZgq8g8jjB1dNvT8FmlzeIGuoI1
         gt5J+YoRpcE/BI9jcF2HejhKGZl0NQxlG40g8+Ru6C3UsHn9rU0hM/wp+WxWB4NcoCTJ
         m2awI8W9mX2SMUOwsTmT7ce46SE9alITjX0kogwYkPGnLemYLehUHAKsKt4bM679dWVt
         9IzwOXJmH0/VpJ1xVVWKCviafDGj8/PNQSmtg2PllqVwsKG19MmhSZwsq4z7LyYFFKTs
         KEeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773338049; x=1773942849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uUkJl4DF7APJYPjD474UUxiLiC7WbxzdLnKNmRAWUWg=;
        b=T8TlScADCjeR/Az+8D8Ph39zk0S+6tVSI4AasxA31upIcPdghvlMCFIa2NYqAD7ydB
         dkO3xOJiLmBEg50H+kiHYILo1qYHmm4q+7JFkxSxWrvmAMYmGGKKeUwMzWHNJn4TkVU9
         uS3H6Abeps8FAuE0h8ad9dKDejx8vv5eRMsIIB5vL7JB77Pnm4e1OFBY/xcRLKg30797
         1eIErRHWwZKz4cAwQPIScX9tT/3CAnRpeQFcbADxkdKEFbEAxLywAxheWFxCPOs1VAy1
         JaHdWCXqYDaj7VnV3oyTV74HP9mSs8fBbWspk+P+2B1EPnb18BK6jBdBe7GdhQgULYP1
         VPuA==
X-Forwarded-Encrypted: i=1; AJvYcCWtDMEYdNGcLwHN3AnZRZPBxEqCjP19+dbGpgbnhFKoz2jyKQuuR4Jsu0nMsBIaLE1A09MpQKI6sI8=@vger.kernel.org
X-Gm-Message-State: AOJu0YycBVb55GQrzGsrHq4sjSsOhf59GlJ1NutByRq6wkK+94VCJ9iL
	girpOToOBqp02UmgQjHbDe+eMjOTf6iN/xYrsjx22ehuF9AHN/s7lxCW
X-Gm-Gg: ATEYQzxHXF3W5/MO+nWW81TonEgPDLkaojHgD1We9gVeIgZsK0LWJrQVOO9Weo77smt
	h0BW77ESPVCKDn/JDd07mvw+R2g6R7Ll0TAvmA5hQ1xYoFSrsVDXtN1Y9cdGy5OTUf4nQIhy1/K
	ACW9cLfzF/r+Umd4GTfdHCdOvpZj19zjWF+aMuew5UiPanJfokmpS+sL83mvsnsfVKAlxY/l0F/
	IjnScQJWEpuxkMDBrO+0TQ4m8BkmifiG39cNpxxFJgc+HV67RsFghvjLB9iV7v4Uw4/fRK4oHxF
	xrG2B1guYJM0GR91eYnv19mxRsnXwahzDGHPnoxBpec8WVN51GHEhq0dneqLR4M7lgQJPUhU6ot
	gPNTi0/NtXkS8Wp4bhCIhvG+gI4AmWP374r20dY254UsvJWK7TczvG5hX4GfBMxAgOBqIR50gxq
	Ttq6RMzWUa9MtOrEgY0U8JdjGSf3NuxV66Wxh4XW9XhC1GEY8H8haFnaQleTdosB+BhWnIpQo8L
	WPgu3NyELaE3bQ0ns1WmqifsqQTYzp1JKdsnwi0KBSA8PI=
X-Received: by 2002:a17:903:17c3:b0:2ad:d5d7:bad2 with SMTP id d9443c01a7336-2aecac36dfdmr3146585ad.48.1773338049641;
        Thu, 12 Mar 2026 10:54:09 -0700 (PDT)
Received: from visitorckw-work01.c.googlers.com.com (7.162.199.104.bc.googleusercontent.com. [104.199.162.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae378ca7sm60453345ad.91.2026.03.12.10.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 10:54:08 -0700 (PDT)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: djakov@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: marscheng@google.com,
	wllee@google.com,
	aarontian@google.com,
	jserv@ccns.ncku.edu.tw,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 2/2] docs: interconnect: Document consumer APIs and drop outdated text
Date: Thu, 12 Mar 2026 17:53:41 +0000
Message-ID: <20260312175341.2944154-3-visitorckw@gmail.com>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260312175341.2944154-1-visitorckw@gmail.com>
References: <20260312175341.2944154-1-visitorckw@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The documentation currently states that consumer interfaces are not
documented, which is no longer true.

Remove the outdated claim and include the existing kernel-doc from
drivers/interconnect/core.c (filtered for consumer APIs) and
drivers/interconnect/bulk.c.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 Documentation/driver-api/interconnect.rst | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/interconnect.rst b/Documentation/driver-api/interconnect.rst
index cf7a83f8c953..cebb77b49d8d 100644
--- a/Documentation/driver-api/interconnect.rst
+++ b/Documentation/driver-api/interconnect.rst
@@ -95,8 +95,14 @@ Interconnect consumers
 
 Interconnect consumers are the clients which use the interconnect APIs to
 get paths between endpoints and set their bandwidth/latency/QoS requirements
-for these interconnect paths.  These interfaces are not currently
-documented.
+for these interconnect paths.
+
+.. kernel-doc:: drivers/interconnect/core.c
+   :functions: devm_of_icc_get of_icc_get_by_index of_icc_get icc_get
+               icc_put icc_enable icc_disable icc_set_bw icc_set_tag
+               icc_get_name
+
+.. kernel-doc:: drivers/interconnect/bulk.c
 
 Interconnect debugfs interfaces
 -------------------------------
-- 
2.53.0.851.ga537e3e6e9-goog

