Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753464;
	b=RqcIhwuyEmPJuphhf6ZtqfDOfw4CYE2Jbg8NzXws8zhLmahztC36JmnuynQQPLebkYvT
	 sxeixdhr453E2FzoOSEoGd2pyLLxQe6WdAlVGHjJ2GLcgsj6tLibi+iE6re05t915puiq
	 GoDe3tisTcCdFgFQ6ATGLCelkEk00SU+tdg2ZO65BPM37fXFV9FSMzTAGo8uFV90GsmEC
	 eF4Inv3pbG5QCdAAAWtqzLUGmex7zeSLLLAyH5BeDE11LTR/+5G39AShL2+yDKs5pkRGY
	 Nx2g5YHErn/ZPWF1x2d1n9Xk5IC6CAbdTbtZgh+F0lJ9+75mcd8NdEqzbrSByf+Adng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
	b=NheN3cT3JYMPhS7s+N6fV2Z5W30jz68Lhv4DBphg5c55FyXpA4nJXipOYg2kEP9xg2sY
	 Hh4tbAKKM4hOtCgQZ770ksPsBECSt5lajhKcDHU6jMusevrdu2kx4I6zYFPCpDUFCd+h4
	 CFurCzM5GD+9jkgsjVrdsjeyq4G+dbKRA9bJzRcXALRyBYImr/UMcOBrZQKYVQ850z7dD
	 JpDQnnFmpRoVt1WqzoCxebbFq4Y4Q47Un0er2sogVnlQMNCrZIVC+OafDQQPhnZBSdQ2B
	 kBOS/UzozQsxTTC69L0opvL1twZREX7p7HnEZyhhjF6Pa4OBnDZA5XEKYRNL3r8dRPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF20F606A31D
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF20F606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIGObF5+
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso13697615e9.1
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 06:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753462; x=1795358262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=JIGObF5+n9z2rF2DAEPIH2wEAG3uYTfbAus5HXg0lWmaFmYAMCO4Q4uM0BUtPHeg4A
         GPyH/Dr0LX9Cj/EkDbK7Slo/ruNLFYLk+ahuPHjUnLKBw0jjG7Z1njYWhFvhBj9UihxN
         UICSUPnKvcHJ4+4lSH0rEhuQK8PCcjMpwmCDjtumC/7XZY5PWWkA/gAb8v9nKkSbxrV/
         Y9ThN/v4ygArVzLZAXb3YM7BxUVKfigR84V8gBR45JeqbTPR2CfifN2+sENM0bcHdFtM
         lj61zu7W35zudlmbCik3sb15ddV3QrjhbaumMuJP4SWZ2/FHSVE/m0/Qf+yUjxTHpyeM
         Qc+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753462; x=1795358262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZrrte1o5NSIPT2kPnWiRAF/yUTjYoJq4hLlMOko4J0=;
        b=eX0FxE+sq3ZWHQZ/PTNJWE3qI1sJNw56L5cL2MVA/KR3epF3k5h+t0gwPTuaBieAiD
         q1JBi2SmxS63pyLSBJ9FjXmwAy3mE99C9BU2iNY29uOC5LGy+W62Sdhl7StnKy8hnEZn
         bmDMNrQMMoa9/UMpoTTvBaDqWBoQyQYNtA6esoYuoWKVUdow14p1IEIyFbmfXZ7id2dy
         zgg1PR8yYf5rFvd2P7yn9w6w9DmwCVLY+RzP4ZEdb/Xh1XCSdCqXRK0uHM7tLWzu9l09
         kizbIsuDCGYFl4pWuRxdiMjGopARSBLnLAS5iLV+XZ73sXZ+6/fBiPiYTF+SHggBcLl6
         AuMg==
X-Forwarded-Encrypted: i=1; AL+hErEOGk1Lljj/fVGQQEYBsrxqKpK9iHylx56PeiDTXoxuunGQMJCB4LwXhiua2kxvO3FadRp8yH8IYE4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ke+HEcdpS59L4evfGNgKv0xrkRdpYJZqg78GO0f6Iqe2kuUlQ
	HYVSGkNSrF57c55MgJ6q0mFLqDKQ9Sw4e5EugoYCpqJksfe1vX/jgD3T
X-Gm-Gg: AYBFou23HKcorglyZgZ49uiWOqEcBffHE/KVU4P7nPy6tRaxJQ1rqLx/+8ngFtSuklx
	Ecn7oAfjIqBHg0MyA0dLe5c7d9/1KEtudPjDrGpkC8/qjbOr/bgnHQBwNpKziTj5rQ+iHpPteuL
	M3wRu1bVn8RsOi3kiR8DPDUx2Cwm9XzM9Z7/DoT8tz3inrPiVaISvSMGbVKYYvOf30ke1sa30pT
	kG+Ot9kHv6i/ZRzFghpV9CCy5NL+nNwjKVqgBFRvDKpfKU+N5SqkdDIvM2lTJok07dorZqrjhQ/
	WCUa4Sr5+6NFmsKwQHe8CDImsEnHM+gN0Uqw0ujouaKiTwF6LC3Syntow8ODZHyBrIzQJp4Zfl4
	wW4aGtePk3H+TyIwCuJRmLICtZEWuNZMTDzf5v2R1h6w5gxUCgsyfc6nUzyq2DbFQZg2KbV06GA
	MxnOLjtjCJnpSGfqN9+Ycf1K2FsoN1ISqUPqJivtLIPKIfrZiavJKAOMaVg7vgiV8Y2bkN2V0P4
	ABjXw0NVLO0AlkZ6k4ZcTvZcRTzet+sckbfWfRZdYbY85/+cjbb9S2SaWtwhZm6R341RbODWJlU
	dy5meVQNweCp1Y4JAv/MTbtInVaDqf9UowFQVC2nvGpQ6D8GrL7ZYsXJK3szSCq5Xi7QQwk0QO4
	lKPWOW96W7qMgnhU=
X-Received: by 2002:a05:600c:6092:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb55a44be7mr159448425e9.8.1794753460960;
        Sun, 15 Nov 2026 06:37:40 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:39 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] hwmon: add three more board models
Date: Sun, 15 Nov 2026 15:25:37 +0100
Message-ID: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

Add three boars, submitted by users via GitHub repo.

Eugene Shalygin (1):
  hwmon: (asus-ec-sensors) add ROG CROSSHAIR X870E DARK HERO

John Roden (1):
  hwmon: (asus-ec-sensors) add ROG STRIX X670E-F GAMING WIFI

Kostiantyn Korn (1):
  hwmon: (asus-ec-sensors) Add support for PRIME Z590-A

 Documentation/hwmon/asus_ec_sensors.rst |  3 +++
 drivers/hwmon/asus-ec-sensors.c         | 34 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

-- 
2.56.1

