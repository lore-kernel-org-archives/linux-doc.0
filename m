Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621FD2BEFEE
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 17:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783098431; cv=none; b=V10dMJtvpxcTcVbLAZVOkFzdMZdRoFyZ7d5y46ccoV5fuN53jEJ2PnI8CbvIC42erHtHrJSxnjrkEJGHiUeQoSpEKF6yYcN5TIJDD+/1MkrYmpE8h/bkfPmTrEP/FygZhmFJv3hCxaAdpKukREddvW44RZsmoca/sHni//fbpJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783098431; c=relaxed/simple;
	bh=TScPT134W+E4UN6BNVVPGG0o0CJvwBXxJ31qbIrrzGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b4VdxZ8lcLRnHfitejWZvy1fIOHmQIcnRUa7PTXs1/9rP15mTXgD50qrLQhIGxwjRMN7oPf95Zc2FfiYbAnK3rq7/92WcAq77AVhc58Tc+xY6PqUruKqVuKbgC3qcFWAMkwHbVCq09L9yMNNtGS7Y6OKzJTl8kamxSsKXxNIolE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWXDJPm9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWXDJPm9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so10499935ad.2
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 10:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783098429; x=1783703229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmNuqUOtCZwKWpFv/G4WFvqRYroonXT9uxOxUH2oEGM=;
        b=NWXDJPm9RNEI81t1buiFuKTHDTyzjyptp6nzJPHRQA2tQHhtCxEF3sDaf/bE8533fj
         HAxQc8Etk8ZAUDpxg0MVP059RdOpAOGjHLG6FTR7ALR9H8yxiM0Y/hohYywd38T/rMOg
         vhpXiWUEtct03KptAKzWTQxq4c8GvFtx75XShZc8t4A/MENxfxtK5RMRVELVFYVr5Kgy
         EyR4z3hn0oMclacmXiAWYk/KU6iL8ygml103g6rzUExAlcF351Mm4bzV84ppO38ZpNz7
         SxOkLk1XUDyJMa3YRZxAQ1W64pZpRlmTfPnQ0DIQbaVBC7Ra874oDwJKxjzeatR5RExc
         tcLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783098429; x=1783703229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RmNuqUOtCZwKWpFv/G4WFvqRYroonXT9uxOxUH2oEGM=;
        b=j2onUC536cG8oy7hj98TFyFzy+seJsC00lgM/MEr0cPZLV6c0jKrrTXkbAaorowtHm
         YPlo4ClO772uDRxj8dxZcOiZrPWtW2YzzKdKQpYW4dU5hkOf/3srMYwHA0WYVmXIzfdR
         pgS5RvrvWOUkBGQblQ3V6pAPBn8IOruEPK284P+dIijQlrl8Li3iO8V/JanCy1C3qz4+
         PeWoJl96wTenK3x0HUu4+anhv2okG6nbnFM4LdWY4rTsXqx9SxM8DWr60wSdm1Oigskr
         D1bXLvSQl97YzEtT8sy4CVpMOcLOOSsjfAVFTty+Ppcchn4PRYITnIeM0A1rN3r30xjG
         vUOA==
X-Gm-Message-State: AOJu0YwvPFYDMFKvkWc1EdrEyQSkX19lYLblsRcXj0ziP4lOqu5/s3ok
	wfMdu4fA4Cb9tctfNzTjSOJ3PjT1t7kkfO4vOfSR+GLvoh617480AmbANQWbnJDO
X-Gm-Gg: AfdE7cmrcgVw7ZqXyTJ0WgSO+SigeJmCgxM44E5Flu9iJuhAOEG1yT7I5aL5Hr7ZndZ
	FP2XLRAxpJ5TAWgQt7B5PQhJjr612mbv2hVtilAS3VMugfCIn9lRGSu0MmVla81b0Ca6GjjENtj
	kCHemb7/N8tI8Q6GR99W7Q1hzEbPSABeFYiFcsj5t93yAznneel0d2rwlV6ZoCCuKK61D72ChuL
	/yS4dDppXM1IncmM4Tq0R/l41crGwIGpKW3t1GO3meTVqr7JecqB5VDkex73VmeJat8bKOmTWFx
	R0Vo94UvUwNAxWjTljfi1JKQ+/eM1+micphLyPNKUDwO3QMdGQEJDdGwQ+qvIo/sakxDxdKlhss
	ruUqNvzSYTpeN/y1OqKe7WVuYXbpCC51Pv0pp4hX1A2gfvXa4ktxfL82hTAuS1Lh5vzwNiM5XDX
	WMX0xd16nZCc3NLaDG82vrKH+hBAQ0tTLGJ+JRJSgZTyT1MdQKIBtx4qd3yFt1Zc/utc02DXUEI
	L1sYu+EA4ESv5tOBN4NV8FE3P8ifABgEf0Aq0niCDF2+Y6a+Jk=
X-Received: by 2002:a17:902:ffd0:b0:2c8:1c05:16bb with SMTP id d9443c01a7336-2cbb9e9f3f3mr1021855ad.24.1783098429420;
        Fri, 03 Jul 2026 10:07:09 -0700 (PDT)
Received: from parrot.meuintelbras.local ([45.179.5.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c876ea9sm19643688c88.13.2026.07.03.10.07.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 10:07:09 -0700 (PDT)
From: Daniel Pereira <danielmaraboo@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	Daniel Pereira <danielmaraboo@gmail.com>
Subject: [PATCH v2 0/7] docs: pt_BR: process: translation updates and additions
Date: Fri,  3 Jul 2026 14:05:40 -0300
Message-ID: <20260703170552.174764-1-danielmaraboo@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series updates the Brazilian Portuguese (pt_BR) translation
for the core Linux kernel development process documentation.

The goal is to expand accessibility for Portuguese-speaking developers,
bringing over crucial guides ranging from subsystem-specific rules to
organizational maturity frameworks.

All documents have been strictly formatted to adhere to the 80-column
line length limit to ensure proper Sphinx HTML rendering and consistency
with the existing pt_BR infrastructure.

Changes in v2:
- Patch 7: Added adding-syscalls.rst to the index.rst toctree to resolve a Sphinx 
  build warning.

Summary of translations included in this series:
- process/adding-syscalls.rst (Adding System Calls guide)
- process/contribution-maturity-model.rst (TAB Upstream Maturity framework)
- process/botching-up-ioctls.rst (Driver-private API and ioctl design)
- process/backporting.rst (Stable tree backporting and conflict resolution)
- process/applying-patches.rst (Patch application workflows)
- process/development-process.rst (Advanced Topics and Conclusion sections)
- process/6.Followthrough.rst (Patch life-cycle followthrough guide)

Thanks!

Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>

Daniel Pereira (7):
docs: pt_BR: process: Translate the patch followthrough guide
docs: pt_BR: process: translate 7.AdvancedTopics and 8.Conclusion
docs: pt_BR: Add translation for applying-patches and update index
docs: pt_BR:  translate backporting.rst documentation
docs: pt_BR: process: translate botching-up-ioctls guide
docs: pt_BR: process: translate contribution maturity model
docs: pt_BR: translate process/adding-syscalls.rst

Documentation/translations/pt_BR/index.rst   |   5 +
.../pt_BR/process/6.Followthrough.rst        | 220 ++++++
.../pt_BR/process/7.AdvancedTopics.rst       | 201 +++++
.../pt_BR/process/8.Conclusion.rst           |  73 ++
.../pt_BR/process/adding-syscalls.rst        | 700 ++++++++++++++++++
.../pt_BR/process/applying-patches.rst       | 447 +++++++++++
.../pt_BR/process/backporting.rst            | 598 +++++++++++++++
.../pt_BR/process/botching-up-ioctls.rst     | 256 +++++++
.../process/contribution-maturity-model.rst  | 111 +++
.../pt_BR/process/development-process.rst    |   3 +
10 files changed, 2614 insertions(+)
create mode 100644 Documentation/translations/pt_BR/process/6.Followthrough.rst
create mode 100644 Documentation/translations/pt_BR/process/7.AdvancedTopics.rst
create mode 100644 Documentation/translations/pt_BR/process/8.Conclusion.rst
create mode 100644 Documentation/translations/pt_BR/process/adding-syscalls.rst
create mode 100644 Documentation/translations/pt_BR/process/applying-patches.rst
create mode 100644 Documentation/translations/pt_BR/process/backporting.rst
create mode 100644 Documentation/translations/pt_BR/process/botching-up-ioctls.rst
create mode 100644 Documentation/translations/pt_BR/process/contribution-maturity-model.rst

--
2.47.3
