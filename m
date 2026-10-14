Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B813B7747
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 06:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791959519; cv=none; b=Pfa+nGTrkE4g/6T0NEZjJIypP+3JLPbhCl1wxdOhD9P13riKTn6/i7bUAzq39fkT3CROLN4Di1R0fl3Y4cu5usbloUrQSlgEMxki1e9SEhAc0fLsqq5TT8sf5ndhPT2wYgUi0zRPRsSIvkilhbiyTENhtvHvoeQP3uXxnZlWmP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791959519; c=relaxed/simple;
	bh=74FdFCacJw6GbUv7++ML8NImEqMMG42aWZE8nEd1flk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ECXmGQYGY6LtEEl+aLGLh9wjIL6TMDgL8ipMeCj7JXcREVnJ2bojnVHX/s/ePM1B7cEQ9q4Lx4rMvyOyQmqoMsZ3X0KiL04/ZGl70pXTqBbEt8gNoFPjNnAl3o35WOyuOBCqRMacGtTVEpC6ioN797/61ZgdXnfme+ypbId4kEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QT5GEC3Q; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QT5GEC3Q"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-892734ce7e6so34484b3a.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 23:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791959517; x=1792564317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7QZtp9jIzAG926bhFvO9p+OcazsRqTm/bshkZwZ0Cl4=;
        b=QT5GEC3QwQh/8DO8DJXvBkspteJj3MGyWcFDjx+7dR2sUfFF2Eq8tTuzdKDJS4DtON
         Xd70Ji/y5udz25PHfgB387WBtEBdwQoaZO9zFS4PEE097AbSi/UXh4O0A/yMp3yjGHOa
         8KKeyKdt92pW0GWUj5fYRrO9NSbJGOU2zJd6icwSV3rKh6jagcOZZbVdKuTx65kDMNn/
         6ICMUmXzK+Ef1b8vExGmjCPfd46ao/tOc7GzB9iQwzavdcuym3bltxJkSQEcG7PX0BRs
         UROlb1Rgs5B+hghvh41YKff6qD0MRmbr9KImov3BYC7Lu4yFulp+sb9Y5L4V/foEej3o
         AJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791959517; x=1792564317;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7QZtp9jIzAG926bhFvO9p+OcazsRqTm/bshkZwZ0Cl4=;
        b=P35nk54yPaous06F0rcCWKftMWAtBSC+W8BKNj0JdEt50z09EOHXZHUhG+eKWTNoDA
         PtFE357VJLcvK18vh3I8frFwjDhyF3URY2FBX2llAD7xxt41Tb7FfstqJ2J+gPGPJMIS
         Yr45RBSS7zaKgoooqCALK84shrvm3PFaTocWExXrFxT7LkIm0vTaaF+78dGt4JEGt7J3
         VeqLb7aZZDvqD1rn+iCZuvhCsOOTkmOeh5t27BqD7ZhK3+VZ7NTrxhRqvNP2SiEet6J/
         UDpErul7/TAqsI8n5or+F1O2ZVSP6ONfzVtGXjzf9ZAO7UGnbVq60iV6Pg079lY0KEb8
         vtjw==
X-Forwarded-Encrypted: i=1; AKwUvBw5cfuiCPwnAWxl2/Be01Ku6/AGiNfZqhHPYFAjSoARCVXKzjtsvC10JebiWWl7cuhMg7beu4OEOfk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJmBKRKzX3w73hDWZzEkOpP1bIojkPUp+Py5m850GjI97Huh1pk
	/E448o2RZDF/ZuqBiSoicMzQPx8NQeTsGxQAwEp5YX79D1qkLNW9w0Ze
X-Gm-Gg: AYBFou0xw7+ZTF23ov95Njygjb4K7JfZvLwgfmd3eaIp4z9+NXM7RJa31uqz6rdiPP4
	dAMVUt+8j6yTD4GDWR3CqV77IGyxYD3uZPRIsPOse8LrFjsU9uPtD+TgOcDVcVL/h21s6oFgmNZ
	q16/bCMT4pkca8gWC8eNL4C9lXOBf4YYckd4jwTgsJoQCxP2em6BbpsmiDmzdcWo8Nq3xWiQLUo
	UFyaud2Lp3S9I+UqFS9QoM+J/G4V6cG8twcTnH09zow9dvYrVFLO40/YLYj3GNNYyb/phZOGlcE
	jOiUhdc2WSq6FBiGi0d/FcvK2Fqq0A8WvCrJ6n7jdjULrOfUXy+UIVYn0Glggd3ZoLGybdiODxb
	UBI7v6GqPNkQNpYD7kXa695uOC3Ar7DjS/7qWJwBXc4yJ1jeyvnDwV4cpq0+jtH4TZ71wO1xJut
	Tjm1h38i2r0n6WhbUdamwwFzpip629pmk36jI3m2svUCb6zxlPDkhphkU66cVO45gZwn4HVm1JL
	ngt27C6abX4NuZ8eQ==
X-Received: by 2002:a05:6a20:e211:b0:3e1:5086:35cc with SMTP id adf61e73a8af0-3e16c011dd1mr12605891637.39.1791959517270;
        Tue, 13 Oct 2026 23:31:57 -0700 (PDT)
Received: from embedsky001.tail6d6b2f.ts.net ([183.34.68.117])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm5405054a12.18.2026.10.13.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 23:31:56 -0700 (PDT)
From: Yonghao Zhang <hyz3367@gmail.com>
To: paulmck@kernel.org,
	frederic@kernel.org,
	neeraj.upadhyay@kernel.org,
	joelagnelf@nvidia.com,
	josh@joshtriplett.org,
	boqun@kernel.org,
	urezki@gmail.com,
	rostedt@goodmis.org,
	mathieu.desnoyers@efficios.com,
	jiangshanlai@gmail.com,
	qiang.zhang@linux.dev,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Cc: rcu@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yonghao Zhang <hyz3367@gmail.com>
Subject: [PATCH] doc: Fix stale RCU_GP_WAIT_FQS value in stallwarn.rst
Date: Wed, 14 Oct 2026 14:31:30 +0800
Message-Id: <20261014063130.3691735-1-hyz3367@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sample "kthread starved" splat in stallwarn.rst shows
RCU_GP_WAIT_FQS(3), which was correct when the example was captured,
but has been stale since commit fea3f222d352 ("rcu: Record ->gp_state
for both phases of grace-period initialization") inserted
RCU_GP_ONOFF (3) and RCU_GP_INIT (4) ahead of it, shifting
RCU_GP_WAIT_FQS from 3 to 5.

Update the sample output to show (5), matching the current tree.h
values and the later "kthread timer wakeup" example in the same file.

Fixes: fea3f222d352 ("rcu: Record ->gp_state for both phases of grace-period initialization")
Signed-off-by: Yonghao Zhang <hyz3367@gmail.com>
---
 Documentation/RCU/stallwarn.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/RCU/stallwarn.rst b/Documentation/RCU/stallwarn.rst
index b888e13c02a4..049694b9c681 100644
--- a/Documentation/RCU/stallwarn.rst
+++ b/Documentation/RCU/stallwarn.rst
@@ -379,7 +379,7 @@ If the relevant grace-period kthread has been unable to run prior to
 the stall warning, as was the case in the "All QSes seen" line above,
 the following additional line is printed::
 
-	rcu_sched kthread starved for 23807 jiffies! g7075 f0x0 RCU_GP_WAIT_FQS(3) ->state=0x1 ->cpu=5
+	rcu_sched kthread starved for 23807 jiffies! g7075 f0x0 RCU_GP_WAIT_FQS(5) ->state=0x1 ->cpu=5
 	Unless rcu_sched kthread gets sufficient CPU time, OOM is now expected behavior.
 
 Starving the grace-period kthreads of CPU time can of course result
-- 
2.34.1

