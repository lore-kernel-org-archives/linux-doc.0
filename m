Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794622115;
	b=PUo5jMawjNkP7iTba2cJgU7eAho1XwFTA4wcmux/d7Vwda76gP50Tz7sghU50HqqjBEk
	 BuWAVI4tcC/uTz5ZF4/RI20A2ctEEY8Ep8gqkaXFUTgMmZEY2ypwKoL8HD95H6CulSU3E
	 F2eA29Ue0PUSyHiglHhuN6dctwQi7GtfSuNgumvcWLX50YBqnBioEjbQRsA5vlrhPZqBr
	 zXx9TTiinxHIW3aJajJF/9hDf3AE2REIC+wwnD7oQEwijx9FKyXcKV0nCVeAunidsFcEu
	 dWZMZFGtjdyC/18u05og+GWDI8PrkynGR+tHV58syIPh9NqSv69Wuosd1se6XN+gkGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794622115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
	b=LWA38B7UmfLOv+hQOxa5wvHg+oraVJZPsjO08onoApSQRK92Ly4v3RNl/h9jqCbSVoI0
	 vDg8MRf+0Val1iDfa3zDZiDVPXiMOYr5+NLaA5RdqUZOCjjnCw5dJEDEOQJPjtbNIsAdb
	 0mAcg8tv9P2AGRCDNaGqE42qUmIazKLwSCfx7DpACpCDDzZvrQzkeM/nYo7h7DBUGCRI7
	 vIQ9MBtP2pisfWegzJEEGhHEu0ENhXEw21mqRf0jyjAivLVnCmnXoMotx05gAMsA1nW62
	 jJk2GMR6TVq6Zh4iFs9qkKI1qQZOhMdo+XQPqiZW4uRiBV0T0Lumk1WWd6dMwsaD46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C8606A332
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 02:08:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 786C8606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uuOZEsG8
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-3704d30b84fso2147125eec.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 18:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794622108; x=1795226908; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=uuOZEsG8WWZxqYAyLJEbOteJLzRbKeB1yMqlQVeytRpsEwgTVKMITpypNt3OnidQoh
         pZCQk0AvcA4scQvJEQ47GwY1deGsW3iMJea2R/8w9RkuFQfsJHfbOn1jpzO/wskJ9ule
         B7tJFz2W/txKyLhqx3l1uCgrgj0XHPur6PYwJHuFOlt1py3U3+H8XizQeUzZGEPuqWMj
         iPG6MenxfXP8YXrFUG9WCRk0OEsXbFgKJSVeXHmaLQEH6LhmJGOSXBKkg2kVEDGaMHVa
         AWT3UjUM9aoW6kZsophhX16E+Ked4761jH6+GYO0zxj6eE89xCJulsQf0MIVTL9/+9Z6
         xGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794622108; x=1795226908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XeTY8NwbUCIb5XggB4uHl0AKr+krf2v/zuQTgZl5q1I=;
        b=feZ9cJdYxx6tolMDR/51UKrn4lwvCF/0hrMjldV+8p4pOdswdg8aWpivth9vM2Hxbc
         At7kWMs6DETdDDvP1eysgjzJKPvYh5P2nifFVYJknykrUuKgzc8URXrjxIiirbbSLOlp
         N0QMiu+UHIHEC9ScM5ordTV0P9fSBcnr1fO4152aeq6bV6gqdd2xeNiM8hiDe4+8vhvD
         8yxh6v19JJwMRukWad5oi2dai05SjtTzJP53VjdabcVXa211isTAaTPDgWViDzb+Vx67
         KF38/Djn1aZL8UvQaEGQN8UJfYtmuq/EQ6bkMmCJkCtdAQheAhcAv3n9luRnUg7Me8tn
         6S9w==
X-Forwarded-Encrypted: i=1; AL+hErGb2B/jEczBSBd1tUdy+YsjCyCsYyr7HWoz2TzVhQaVnSeHt99YFkXp1PXOUNZHK3OJ5Rx+e1yGFGA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+AzL/stAfZWLkLcIdIC6JMgmDaHO4y/Hr8vKjkPD2A9a4wtCDj
	XMZ+s66ByVY2bL9eNXy/4/AW2eAdTQAHdy4ds2XXjXg3MQjhK6PKQA9o
X-Gm-Gg: AYBFou1Ud7pK84lA9C6ilYDDQk+fyD5NDUEK5Zg8VWG9ol89eo0DjNWsKIkwORiqwpu
	Z2aeNv4avWiIOy39iSm7qZRJoFnMBpzOdgFu0zhHfdD0PGBlLKhHXHhaCXzy+zaPiTQT0V0gLPg
	kpO4i6wMe0qs/dq9e9lKfT8MkQNz2RfUKV9X9L+PAHL2I70LwYEMEZq7fOIXc8ksG7Ubz8I3Cft
	HCt0ubQH4o4Fc6diQs9iDjJLWnW/kMHzm8X/w5eR9O7RmglL0g1jlG5D3rBfVolVIDft3E8UuDk
	CwUmrjbAa2fsLapodMqG8V5ooiKleEB9c6xGwUleyYtccYobRZFe6K2BdAfPM++YkLCiQU2EPGm
	7q8ScOlxaW9GeVCvjJczIiyU+s5FsWwbDC6Dp6Eyyq2c0VnZ4R8HIdNsyXTKHO6pI9W6VAMz+h7
	729WyWQZUOeOnb2sL+UL2P4siS/Z+Al/mBc7eXtGEpno6jNgYtHBg8iaf1iAKT5KUxXjJGXmN0U
	sBrbWVvWATvq1QNuKxVstmHXYmZ+EGArGB334lAKyUkW0F0PBdsl0g/Qg3wE3k07vepOl6FbxdO
	pq/OaTdm55gd2/cfID8aV6lTeGAqBMnWRyAVtKOzR3vWh47aNWiwg+nsontlXvFtwdnIq9iwwHw
	viMCuOcbb2uuygbNwkcnWbsRyzIWhIiCKD0riQn0YU7duuDj5+UNJVzDmVRHHeQnybRL8Runhlr
	bZ2qs=
X-Received: by 2002:a05:7300:f544:b0:36a:1788:3d1c with SMTP id 5a478bee46e88-3796879f0bemr4131136eec.34.1794622108507;
        Fri, 13 Nov 2026 18:08:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm18875218eec.21.2026.11.13.18.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:08:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Stuart Hayes <stuart.w.hayes@gmail.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 0/2] platform/x86: dell_rbu: make usable
Date: Fri, 13 Nov 2026 18:08:13 -0800
Message-ID: <20261114020815.75539-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

First commit updates the API to one not disabled by default on many distros.

Second commit fixes upload of firmware more than 4MB in size, which is most
modern ones,

v2: remove Co-Authored-By: tags

Rosen Penev (2):
  platform/x86: dell_rbu: Use the firmware upload API
  platform/x86: dell_rbu: Allocate large monolithic images contiguously

 Documentation/admin-guide/dell_rbu.rst |  25 ++--
 drivers/platform/x86/dell/Kconfig      |   2 +-
 drivers/platform/x86/dell/dell_rbu.c   | 161 ++++++++++++++++++-------
 3 files changed, 131 insertions(+), 57 deletions(-)

--
2.56.1

