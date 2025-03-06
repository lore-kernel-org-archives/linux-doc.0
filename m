Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AFBE1A76BC
	for <linux-doc@vger.kernel.org>; Thu,  6 Mar 2025 10:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741257420; cv=none; b=hYUdlaSNul3w+SNIwUpksOaayGTXdFIDPHWU0m327EB9ColUNrAyJtvxrMgrMiTRCa9ktoS2UGNlbs1BgCgJ2tOx6GOyHzFMqW7MBQjMnUjUGOHDHOkfc6Zbm0NTdGcYgQq5iuRcTwe+bFhhb//C52h92ml5JX+1Z4ru/6R3gZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741257420; c=relaxed/simple;
	bh=OA6xas3OZHH2hAK748oTfdeYdg8otpDLDOU8Exf7Z6o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XACv/X1KSQSz0kcDc8iJmeAP+RpYSZnSSJktXCAOIG9VjdpXdhk2tH7m9om4G5ojrWF2OFT0ZeAMwAPnrAbOswH15f0wDv2H3OBv6xmPsMCXdSDKQSSyErrTkAS/lbLo10uD4d8SD8gfMBMYolWwlAKxxGp0KzqE3TYeYGYMNzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JYy3Ql5/; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JYy3Ql5/"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-224100e9a5cso7138655ad.2
        for <linux-doc@vger.kernel.org>; Thu, 06 Mar 2025 02:36:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741257418; x=1741862218; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yiXjEDf+juP/trg+zOJtHBIF6nQ063y8G2qUqzF0lO4=;
        b=JYy3Ql5/dA/oMBM5NHZeN8TRYhdr1JH75JOO+4t3O5t0QsXeS27QkFPQlYFuOLXiaw
         aHO3f3a0VlcCjlDhCvow25vkYxIoALrjK+F+/LzGPcuZXho6YA6TS19qj6ae4edmUPLf
         VdTr33uHUmh2N/UzyQnWgg6tqDPhhGKvP87KP5ttKNXBF6OXHgKPmQ+AvCs5oIPUuTeK
         QhZCINgWttOlSLJ1twcX4UhP9XT17Lpv29X7CjBM6bwpF69iJWO0L/KV5cWs2CLicpYS
         Y0E46oqa9L//7DYKsLv1sUTQx5jZmmzLb+qDDM2fwlmfg4EQPYQgSBLpPjSYATKvWg0q
         yejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741257418; x=1741862218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yiXjEDf+juP/trg+zOJtHBIF6nQ063y8G2qUqzF0lO4=;
        b=PnPUytG7cz2IPgjlu+zv8Q2wAam1/P35mwEDB69vSUT+hfA5wLe7eV/1sjQC71j1x6
         UuMZc90mGpp2EP6pEqkiRCwpcPpm4P4Oggy7n4ojrAYU3qTzxLrhYh0zLoCzO9aPBTk9
         4X/IM37xWtALibnfqadz4FGWFf+kD+J3dB9DwQaI/CWhIpk7MHfeExKJ2rTKWbrxmx7u
         DfqpbXSx4cKoFZRw7wx2fPU1ZgXLAk/Pk9JTYrBInVe6En0euE0mNLy0Pwoz/aRSCQJH
         Mu44JA5TbpVimH36hzKfvAwwD7MNFxEOG0J7O9ID/pbTvLFMaVYroVPwRWHlduEYBHy2
         u86g==
X-Forwarded-Encrypted: i=1; AJvYcCWcIEGfuTguBHyGbKbrKbNE3Dv0/ePqw05J8MjnDWEEzD1NAIl/BIEd9G9gG6Nmrew0RqyAEKH59Qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7WzTxqN554KS0jwJBReRujOHoseJ6Q9QpLuI3JNPX7yw/ZjGG
	J5G5ie2FdtPsbWGS66woOcErHP55A0coCw0zXxEmlYTfooiHui8lBaLOk7P7S2U=
X-Gm-Gg: ASbGncvtAlTlIU3dcWgZGKXPLyPuQlDQdNYPaogVBbzfoLVqrBBbuB1DLjD/JsuV+2m
	48NohvIDFbA1eSSI6m690W4EPGDYdVCM5uT/XaRybc94Jni2WPsyZvsF1DTtM8/MarqwO/MRIfw
	vrlxsat/PBQ2e/Y1+NqO4EEp0fiinr0d6PLzIbZSBVwH11a9VssXYQMdXcwb9P3dZGCDAUYDm5p
	7zeDZsmD2SN+MmNlH7kzEBel+BlUGQauU7DodaRPvhcNnNdozgnLLWwGJYg7igF4FnL3zF694nw
	SbGeP8HI9DHwp0/WNOyTnA3c9a0qbukF6EjNi5rJItuYFQ==
X-Google-Smtp-Source: AGHT+IHcMs+PV7uDFH/Rmpek6rv3YjbBK9IJnCI1pXQAz+dbkjHnKWAHcDTLLpfw3p4Tp6c4UwMheQ==
X-Received: by 2002:a05:6a00:2e20:b0:736:3954:d78c with SMTP id d2e1a72fcca58-73682b737c4mr9197455b3a.6.1741257417710;
        Thu, 06 Mar 2025 02:36:57 -0800 (PST)
Received: from localhost ([122.172.84.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698206eadsm1033435b3a.16.2025.03.06.02.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:36:57 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Yury Norov <yury.norov@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] docs: core-api: Update kernel-api.rst to include cpumask.h
Date: Thu,  6 Mar 2025 16:06:49 +0530
Message-Id: <cover.1741257214.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This includes cpumask.h in kernel-api.rst and fixes some kernel-doc formatting
warnings/errors.

Viresh Kumar (2):
  cpumask: Fix kernel-doc formatting errors in cpumask.h
  docs: core-api: Update kernel-api.rst to include cpumask.h

 Documentation/core-api/kernel-api.rst |  6 +++
 include/linux/cpumask.h               | 65 +++++++++++++++------------
 2 files changed, 43 insertions(+), 28 deletions(-)

-- 
2.31.1.272.g89b43f80a514

