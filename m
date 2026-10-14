Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CAF472F65
	for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 23:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792020813; cv=none; b=isW9TQL1mUN5vm58897CcF6XJJ9W2vppMxxW/eOPG0hNM90mhicskKyWFtSkgLF1B0wlJX8bsO4FwBfMq+mijQYWrRKjBzvQkowXGz1k0edfG39uxrglWDHj4DtIR79hkuyVhUQ2HOnsPtahmUuaE6qxlM/m2/T+Ht2bG6vJSdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792020813; c=relaxed/simple;
	bh=K/I5NWhUXJWrp1nXqlraN8PsJJyLvjB7tRO6oqNPmAI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=es08Og45/BsMsBVlmZGMWc2zhAZW0YyfsFlP28SFDLyv25guc85WDeqKPMP02QdBqfxK4zL+GnvmauicNPTTyVk6Mqxac2ByoGkwQY5i9AGE70g4n2JRLU59Msmwvnb2N5MGEF5XRxMJBW9vN9BgpN/EBhYu2SCZSOG/MnQTfHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YE0otQ8+; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YE0otQ8+"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso4839432eec.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Oct 2026 16:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792020811; x=1792625611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pp4bcKUtEGOnHoHIpBPONEdiUWw24ATuUwzAiK0GuAA=;
        b=YE0otQ8+YR+aAOr7TZdlJPwCt8/AA85xw1LPmjvlkmxaako8VDjbXYeScbB1AixJM7
         daEiE0XpuzkLnC3pms4rf0DpRHLTflZDZhbC2QhEc2N9JIZ/6l6PiCB+dwK0QK7ElR1d
         groLWROxccx7Tsh89DuDtVXMc8pAS6FOEqX7hGi4rf0DA6uB6DpfYj1Pm4g6xtfuS0sX
         qNzfDRXaHtQ9zXAqoZuJDykYi5PRUZkptti9CEvcaAKMpf04utW4SA1YPSeW5u6nLpeJ
         81lc9kA4B4eE4tTExcoMedw8KszG7zFwbCgCuuWEh3SI0YJmJsNDScbCYiUQtZrYvKys
         X0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792020811; x=1792625611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pp4bcKUtEGOnHoHIpBPONEdiUWw24ATuUwzAiK0GuAA=;
        b=fucuquRsFPz0LRxEhQsSE/J2JxJCCVbpRk2XAyOtGA247OWCApb4cjvldUu8iu2sZ7
         vcPLeNQXbyD3qIeNNqfMg3WUa2fzbyTSQxd72ZoXqidKYI3fmjcjug1AScBAldCAUq/d
         dAbj+3iM20/cRrnkN9II+NDqzWW5tp+48ue/2urJ9kgi3N8AG2M0ToKjjzqaKuAvICoX
         Tv3FXDoLP5HCPBGEDV46FBuNyuGnERayJpXUpjgnLiY5QYoYo8yoqTMk/3o0M/9tizLN
         krctKmead6yXZwk8F4NDeEVJxsGYA3YNG2aPZnmuYVkgjottkZr1I8CxnV4WjQ8xbFUj
         wEjg==
X-Forwarded-Encrypted: i=1; AKwUvBwqTj6cqvIvrz5pcjSxXp9BRGmbkmMUX1Taw4pQ5pzzlWm8SW8HHODYV1PoIlJFogbRttJDCcZf5YY=@vger.kernel.org
X-Gm-Message-State: AFq9FYID6dLB2rcU3bJSaBskOrw0Sj6jMwDD0cpHdPhaaC8K14y5F+eR
	Bzv3XK0yyCSiVcon3ouawE+DTaHZZ0w5DpWmFW+zlyulQGYn42Y6iqpb
X-Gm-Gg: AYBFou1R96XnYmriNtVYfST3K0JlHtICLjYUMIVbsu9C/hDRFH4SCXq6JZjOjVHuL4E
	a7KDeLjBO5BUWKAgAU6wgCnqjJmohAbKC++TDDghR8H91byehjpItJk7sl2bg3LLX+rMMDx9hKs
	ZzENZzvFzpUXAk6j48fsSVaJLv1pEBuzZg3WoySUGexGzJq+ya1vWaWtl+Bvxv6SfffCOZnRGfi
	/Iw+9LC7cCnglz2p4nHumj+Jv+R9Jc/V05CcCVz15AYddg6D13AeKevKR6879iDyWaAVm+IRliE
	3SeEylV1hnKj+n0gSN4z3u8/nzg0sWX9LwWYCw6yUJq5spVkdSeWYdErDxxKs8lcR3uxCuuDV/v
	95FQ6EL7gM0mPa41M3Rpe/Jyn7ccUPX+oGeVSXUf/3Q2XerzPGoZdvgg7/m+lI/AnB0oDWc6AYl
	pGhQNhmIIlKj2VYWuPneURW+bRChnBrk3Mbpgk8kpCH0eTsri6Uc3lW+KTZAgVEezowydR+3PRD
	qAG6oSwOTSDPni6KK6TpiqsvGFiv6GsJsfxXac93fHpL5YZXDgIDqF4
X-Received: by 2002:a05:693c:820b:b0:35f:b0f:d15c with SMTP id 5a478bee46e88-35f0b0fd614mr877238eec.39.1792020810741;
        Wed, 14 Oct 2026 16:33:30 -0700 (PDT)
Received: from dev-oss-0.tail8d7c7c.ts.net (c-73-70-201-200.hsd1.ca.comcast.net. [73.70.201.200])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm62110502eec.0.2026.10.14.16.33.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:33:30 -0700 (PDT)
From: Qian Xiao <heyheyco@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qian Xiao <heyheyco@gmail.com>
Subject: [PATCH] hwmon: (asus_wmi_sensors) Drop misleading BIOS upgrade advice
Date: Wed, 14 Oct 2026 16:33:18 -0700
Message-ID: <20261014233318.34567-1-heyheyco@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Known Issues section suggests that upgrading to a BIOS with WMI
method version two or greater should rectify the problem. However, the
driver refuses to bind when the BIOS reports a version below two, so
every system using the driver already meets that condition and the
advice does not help.

Remove the sentence. While at it, fix a typo in the preceding sentence.

Link: https://lore.kernel.org/linux-hwmon/CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com/
Signed-off-by: Qian Xiao <heyheyco@gmail.com>
---
For context, the fan issue has continued to be reported with the in-tree
driver (which implies method version >= 2), e.g.:
https://www.reddit.com/r/archlinux/comments/tunnvb/psa_if_youre_experiencing_weird_fan_behaviour_on/
https://forums.unraid.net/topic/131340-semi-solved-611x612x-bug-system-fans-stopped-after-a-few-hours-asus-mainboard-linux-517-driver-asus-wmi-driver-issue/

 Documentation/hwmon/asus_wmi_sensors.rst | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/Documentation/hwmon/asus_wmi_sensors.rst b/Documentation/hwmon/asus_wmi_sensors.rst
index 8f2096c..f6fa66f 100644
--- a/Documentation/hwmon/asus_wmi_sensors.rst
+++ b/Documentation/hwmon/asus_wmi_sensors.rst
@@ -72,7 +72,5 @@ Known Issues:
    X470 Pro seems particularly bad for this. The more frequently the WMI
    interface is polled the greater the potential for this to happen. Until you
    have subjected your computer to an extended soak test while polling the
-   sensors frequently, don't leave you computer unattended. Upgrading to new
-   BIOS version with method version greater than or equal to two should
-   rectify the issue.
+   sensors frequently, don't leave your computer unattended.
  * A few boards report 12v voltages to be ~10v.
-- 
2.53.0

