Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDBD3E3178
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 11:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790509801; cv=none; b=H/xsxAf3aCc+hKbdIu/DpQvrYglzF+iLQuE5qwl9pkB+dL6LDayxhekWGoa+DZ4XoP3bhkrWqYD0/xlgjrnRdvhM9ubVU39cwIpTM1n8SmC2LZQNyjeY95NO31aPHkDhATfZRd1iMQ5wS8nEcIIJprMfwPY0otx4gkMmaut00r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790509801; c=relaxed/simple;
	bh=41gFk0UApM7sj3xsEnocBfMxYa2eQMRQZ+9fB8uQVIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hKIiTPPZAOGsQwFTRZExallo7U98ShImlIp3ixN4E8hJS/HL7ZRvkIj6EGfltB3nNCoh2motJPCS1f34PzKn+I45C24PEKtKmiA7pmfLLZ+PPst0aA42szYn7y5jC483CxfmT1LJssl0UkDqb8w1bQeqPnxtCfFmdn6jLlcgT40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech; spf=none smtp.mailfrom=osyx.tech; dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b=kYOo0Xlg; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osyx.tech
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osyx.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osyx-tech.20251104.gappssmtp.com header.i=@osyx-tech.20251104.gappssmtp.com header.b="kYOo0Xlg"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so11332655e9.0
        for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 04:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osyx-tech.20251104.gappssmtp.com; s=20251104; t=1790509797; x=1791114597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=kYOo0Xlg9062UpWjmX9XTIec9BSuyTMi36QLOMEVQQWeftghZNPq6VT0JYLyAuUScv
         +K1Z/DlB2IT76N30r7Pb9+wcMnqOkOTzkDVir5YYhh4mowPTkuc+peB0EJKaerLD/Rqz
         CdRYi/IIpgNdr188Y/wi6FjAJQ3d60jJQYVmXtalgnAjI2X29KMqOw/n4/DEoJ5abTNt
         fFNl5QCzN1V7Q9EYwRQdrjfMCREzX+No7IQWVb+P2hg9SXU3rexDOUPSdJAAiunXW2q1
         2vZ6Y7uyLX0hY35/d2J5OA5xSFfSO10KddAex1PyHhfpZ9c1MpSWSW0F9ZkcvLhg5xM8
         UlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790509797; x=1791114597;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tu9vpFECaX1jeiiFhdPQG51U6ZbrKqBUmuowoFSuZ9s=;
        b=JfCO2XO9L2IHXs0ipagjyixlVDl56FzIPTX3WfCJtLeskH0wpBZlQA0GefoesaCzjI
         0rBnP9dCQ6qWDYmsWDlPvXSevvSghe0alj/7ALD56nmopETZC+7uBb62PKx+tiCNfKHd
         mPmFrcES0fkFpRXBpgHwefAbF41BxP0XNxFO9rKuiw75EQIQdyiudsp39cGP6YjSOmF8
         j4bwWQvdmVx4BUNXOpuTRiH6wpcGdRArNcWDuhv9AvjAatCNe5DXql7G8+HCOSDVVgAe
         6mJl9xo539iamVQDB6fvSzSa9XzPiv0yomKqlnWhAP3kmhXbMh26UvHmo8zWhCPuVliN
         jZGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzJKv/6HLZSh08uIzhKY+Iueo47xDbahKGDzlu+/6AlZtvKO26q2gxkbdfq9SMuvsyun0eRfd4/BsA=@vger.kernel.org
X-Gm-Message-State: AFuF++n3E/HmCIzGS9O12YLZEo4QmJbqMD9JJ+aehVr9urkpkOUcJ+Ls
	ryUnglIfkJ3C6tnyPxHqCsH/HR2lK/9FcgUwaLFaG7eTVwJWjy0cnh9PWqCCHkUFEUeu
X-Gm-Gg: AYBFou0ZvMCEF4pgpISkwNBJvj7g2uZzVPxU1SibgG0qBFQ7nXhflZ8quxeFmPQ3B5V
	8eOR4KWVNHJjxMDz8jNn/kEm5pmehBAERxRb9dGPLZGgWBAh6y1JJtPIZGwm4EysZgIShvb43te
	JBMNzbxB3Ipn+8faoqME+J/ndt5gEAQ1/5K1vtl0RAi+CYB7GbZOlgidvojzEiFyuJwFFHwbWLf
	n120yjeUbYoNQPRaBnObPTla5JwAM4qxXfP1o0yhD952PtGGNk8TbnaXZy6Ii2NdRQ8D58Be2ci
	+iV02JIObg+ssvWmA9UTzZrUlYZWMFRzjXNQi6cl6kjbsN4AM4bhDWWYPI6ErTLsz29Gsdj66h/
	ZCf5PSx+CdsLfFabhlQnf4JVzyQaEI2w7jAnYxPIPMziIw/QRNbUPQnS8/NDOdrZGEJFG6Qe6sl
	foXIUOVvhKL7/9lT3hETkB7m9s/xLWg+y5eiOAd+s5JYTXrFEE4ERtxxWIMLEZTQ2CeZFKw2TNy
	rx6BvR4nljtm9h9Fv0=
X-Received: by 2002:a05:600c:620f:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-49ffe395d5cmr47873615e9.12.1790509797287;
        Sun, 27 Sep 2026 04:49:57 -0700 (PDT)
Received: from jp-linux.tailbfef0e.ts.net ([2001:8a0:f59c:a900:6d6e:8514:ff1c:6c57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00178bebasm57095935e9.11.2026.09.27.04.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 04:49:56 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Peixoto?= <jpeixoto@osyx.tech>
To: gregkh@linuxfoundation.org,
	will@kernel.org
Cc: catalin.marinas@arm.com,
	andrew.jones@oss.qualcomm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	jose@osyx.tech,
	davidmcerdeira@osyx.tech,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v4 3/3] MAINTAINERS: add Bao hypervisor entry
Date: Sun, 27 Sep 2026 12:49:24 +0100
Message-ID: <f8be09ac54f1e0e8a46f077ebadef13301f3d054.1790357735.git.jpeixoto@osyx.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1790357735.git.jpeixoto@osyx.tech>
References: <cover.1790357735.git.jpeixoto@osyx.tech>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a MAINTAINERS entry covering the Bao hypervisor drivers and their
UAPI header.

Signed-off-by: João Peixoto <jpeixoto@osyx.tech>
---
v4:
- Drop the arch/*/include/asm/bao.h and include/linux/bao.h entries (the
  files are gone); use the directory form for drivers/virt/bao/.

 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c..fc37a1db1aab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4559,6 +4559,14 @@ F:	drivers/video/backlight/
 F:	include/linux/backlight.h
 F:	include/linux/pwm_backlight.h
 
+BAO HYPERVISOR
+M:	José Martins <jose@osyx.tech>
+M:	David Cerdeira <davidmcerdeira@osyx.tech>
+M:	João Peixoto <jpeixoto@osyx.tech>
+S:	Maintained
+F:	drivers/virt/bao/
+F:	include/uapi/linux/bao.h
+
 BARCO P50 GPIO DRIVER
 M:	Santosh Kumar Yadav <santoshkumar.yadav@barco.com>
 M:	Peter Korsgaard <peter.korsgaard@barco.com>
-- 
2.43.0

