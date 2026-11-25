Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592399;
	b=j3mx4Gx1X//LRsA+ulWjY94p9FqnfADvQooiSz7xgMnW5ghBWPcsukeOHQM/TFwOjiZO
	 2P+oNX7Jvd4Vm4mSId8WcZ/hWeoIYGxDsFl8TVT50mikA9x8+no+IkQQ7v4XnqCzPqEEb
	 sLKdJlWXHpwACxM2NRtcT8pJur0XT2nFoGo9LbVkaARpOUDEXIf+rr82RcETpkBRdfO3l
	 PZ0uSm6L4Jo1rfy3Z9tZ1qHZo9aSU1EfZwbzP+75B+obsvYtRVi4JuEBFPkV9D0qGyiAA
	 4SwFnQGrypG6GclHsveeZ1Qwazzmu7iV4CQOgu76WzfgqKmx9kTYrv1IO0RJBsmYwGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592399;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
	b=ig0A2hJ79QNxQe4MNCXnjmlaNFo8YKmlUNDavuYhggvEia93PH7OdAt0t3NYbEwWbQZ6
	 X4ht4UVLXwO58ASE1CRSfZDc038DrEeWovVzOApDiXat+3YuVN90VypziOybzD+wvLhPw
	 Qw4FTpjCTAXlvo0OyEGZY0ibiJ1UczP4QQkYhnCWsQaNS51wosem9c64SBFvhB1Wv1gVA
	 tRTAtWo/4LhnWFlz+vHCabkbpsNRvjByCS4f5Mn37XOSqYpa7Sp6bGiUs0LJ6V4jTmGmA
	 ZFliVBt0JO7Tb3BmMhBUmdaZ36dz/OmJCPiJxqYevTPOGe8SJeed9SMABPu57oUkOxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjjSHTcS;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BBE606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8BBE606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cjjSHTcS
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e3b22e971so2810148f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592397; x=1796197197; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
        b=cjjSHTcSrHrh4Uxp8wVViuT4smzPfmMkjlhfaP9Ka1QzEjRMy9zDbQziVzv1TaBRYW
         aF7+sjCV5MT4p0r3q7WYpiYe+k4+PwcPC5W4mR+cGDYkLrsQkmRmKPVTi0zkrzSv69d5
         n9A/5nrEsV9exQCHsIhMgOlj4UrbORTRRk4QlZ8a1Th9Hl4b6Kos3hLAXjRCUHDh/FMo
         TFSg1y6DPd+TlFQj9EzNCMjXYHzYJUJsSzhhrlIUjkw2Bt2n7UVUHmrd0e4UtLeyLZXm
         CsNq69+hQCp/Zj13orM1N/2tzNO/LUjU3+7CEiDkxR9Vnmnd9zC/s4ysZbQyZkvz5u0S
         JeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592397; x=1796197197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fic+huB0IdoHR3E/p8bmW1S+ux+MyhR7gu/qGNu0uOA=;
        b=KvesoiCZqHBVb68n/I3610ocsH0DbGhWo4c8/pTTLytaz0li/hYi0O0YuYbOJ4YIlQ
         q2QXkq+A9531cK3UpuJ2LaOzGZn/k7G9rFEQqWGbDcAQsPwXKNXY3kutmp8WPdzSQgsL
         FFBE6MflAvIL7TuWhXJWEOPE1jujnk+BabivA6lAY5XBICKRYAweVGNwFh9nRX4nccWb
         Kqi10WtxvsCjdw+otkgGj3ljRP+YxznsNe+KGz0s1Wj4njgnSqReTBKF+WIuvvKXMokw
         sgXfIOLpSsAO1+LfUReCplR5vxoo4mPoDRVPmN4lDu4u0fDiAevYATnGTPV7VysCMU3t
         wYmw==
X-Forwarded-Encrypted: i=1; AL+hErHB2qG+f/2YW2yED4WI4MsGeClGgL38IU+YRMxBi/uPyxfI1GWEq2nodNrBJr2xXKXU8Vz1Mv7b7oQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8gCxBILLPXn/DaehYJGpeCcjPpzsqlDHalxqUfTzknIzLh4B0w
	B1p/HqXujN70NgZ0Kw7AXQUHMGOrTEZbqzqBrbux4ZfnehNtnVWOkPhXcWJKRw==
X-Gm-Gg: AZFdTZdAuvNn+3DewYjzsDbEndrCjRvW7DK4y18+vjsM+tWYmUB6gafa4QeaPvebq0U
	m5q40JZHEWgH32Gi5+s5z5FH+zD6+2/Gm5PkZ1L8Lpu9J64uodIt6gYtmTg5rrMk4ttqqEjTHsG
	h63+ZLgQ593Hgn3NJbdA980t5mmYeFBIM6qo3BHfEiWYSNuCjdHOgNR4Isz6+N/uf8gUyt88qnO
	lwfcInFJH5U1t64C1y46ZKNnDCvQx9eJrr0BlccDnAJ7vkhnrN1/R0nqIvOwKMy8W+PM/5dUxi/
	G5h3/MRwt8NTsPLpKgo03pQnBFz4aTyAAPmU7C5xYvBaMLsZMfvWW4M5K2RZ3FUqg9WlusR4F6E
	l1pD7fRMPIRyUpo+WN+HHDB+PUr8FiGiTp4W7xiKQdaH8NKH3w6kvLXbzIQ/Rli6SzbIcdDoJeC
	qE1uFJYZkd0QhFLkIbFAuEooLBeXl4wdU5o8OPakPz4L7lIiJRl67lpgQGdWbiu3YuX07ETfmgm
	cT53liDsGgSLFsbkTKj9rXaBI3r/om4IWZ78eNNwIElolcSbchem/de87VSDnOuUsOOF64pnlK1
	nlr/ZYRnPiDh3FsucZjdigWMl1zbjgBal6nzK1KNgNuZj0tj5035RpsjXkJoKUbicPn1q6TsV3J
	QPpJtlYOxJjN2yYkRSJHFFC6F37kfbnwDfekAjkGMoeu7DGutrSGkd+Y3A//H4WXWDa2CPZnCAj
	AXT0r/7EAwNBqXScRGJJuqYF67IuSdD8P0MbnZR9ha/3fCpibN/eWFsp7Ev4I3LxfY1Z/RDmu6f
	+VQdb8oK62HU8ohTg==
X-Received: by 2002:a05:6000:2b8a:b0:4a7:b365:19dd with SMTP id ffacd0b85a97d-4abb4b85bcbmr21938249f8f.53.1795592396978;
        Tue, 24 Nov 2026 23:39:56 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-fb56-7a23-de2e-e3d4.rev.sfr.net. [2a02:8434:fda5:4201:fb56:7a23:de2e:e3d4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bc8ce06sm31725489f8f.47.2026.11.24.23.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:39:56 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: bootconfig: Document the current config limits
Date: Wed, 25 Nov 2026 08:39:41 +0100
Message-ID: <8b11df1def359a2b28cd4bb6c42606e25ab9d6d7.1795592381.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bootconfig has accepted 8192 nodes since the node limit was raised for
DCC support. The admin guide still describes the old 1024-node limit and
derives example entry counts from it.

Describe the current node budget and how keys and values consume nodes.
Document the 32767-byte limit for initrd attachments, including the
terminating NUL byte and excluding alignment padding.

Fixes: 6c40624930c5 ("bootconfig: Increase max nodes of bootconfig from 1024 to 8192 for DCC support")
Signed-off-by: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
---
Hi Masami,

Thanks again for the reviews. The guide still lists the old 1024-node
limit. I checked the 8192-node limit on my Ubuntu machine and tested a
maximum-size config with all four initrd alignment paddings on top of
your padding fix.

Thanks,
Eduardo

 Documentation/admin-guide/bootconfig.rst | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
index 3d6412458c8b6..30bf89cf0f67a 100644
--- a/Documentation/admin-guide/bootconfig.rst
+++ b/Documentation/admin-guide/bootconfig.rst
@@ -354,18 +354,13 @@ The final kernel cmdline will be the following::
 Config File Limitation
 ======================
 
-Currently the maximum config size is 32KB and the total key-words (not
-key-value entries) must be under 1024 nodes.
-Note: this is not the number of entries but nodes, an entry must consume
-more than 2 nodes (a key-word and a value). So theoretically, it will be
-up to 512 key-value pairs. If keys contains 3 words in average, it can
-contain 256 key-value pairs. In most cases, the number of config items
-will be under 100 entries and smaller than 8KB, so it would be enough.
-If the node number exceeds 1024, parser returns an error even if the file
-size is smaller than 32KB. (Note that this maximum size is not including
-the padding null characters.)
-Anyway, since bootconfig command verifies it when appending a boot config
-to initrd image, user can notice it before boot.
+A bootconfig can contain up to 8192 nodes. Each component of a key and
+each value, including each element of an array, consumes one node. Keys
+with a common prefix share the nodes for that prefix.
+
+The data is limited to 32767 bytes, independently of the node count.
+For a bootconfig attached to an initrd, the limit includes the
+terminating NUL byte. Alignment padding is excluded.
 
 
 Bootconfig APIs

base-commit: 56bb11fe6aacc7666938e8e6765b44aa0cf1fcdd
-- 
2.53.0

