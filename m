Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAA4369D66
	for <linux-doc@vger.kernel.org>; Tue, 14 Jul 2026 01:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783993431; cv=none; b=L8i6iT907Nuy0Zg1NgAyv8Va0SdP97xJvspubezoCr/4fvmVUObt7tUgMqmbFmpmed267FeQATLqZlxTrdgreRIXyhDHWNL+yWw+7kLxXEQarmKc3vfvcVkg0MZc7M2rEkSojKjyUFH/09glWxSQMZT7Ym7aCRYqebC2c3nteTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783993431; c=relaxed/simple;
	bh=5lO/T3tnm3QZEAd2EPJ8hvjU8Xe4okA8Q7GeLUp0bqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mH7mNB+UzX3ucWRqzr/ouvHN24DsOuOXeQQICX9Ac51xO0YUXsY5Ku6zm8kBI+aHhxHNRszfACXRPHAZ/i6pfQGSBpjcxTnZkTFBBzcgCoLI8/gxvGnHxHom7AB1hxiUsFW4GhXpFObf1/u2NnegH/ZFlRt+4o+bW2dhoJnKB1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bly4fUQ6; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bly4fUQ6"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so401722a12.3
        for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783993427; x=1784598227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5bTdiv92W8B3yu+NVFE+yxGCJJQl+ix1X/J4ESOiB7Y=;
        b=Bly4fUQ6WN18DqhvrKN5f2QLG3kwVrum0T4Rw6IcemrvNbVhSayUSHAil3jeKDnKTQ
         xUXGPqxWSr62AjBSwkXfOHlyuJtJratHzOVZGwDO/4WeXaBp5G1z8c3BaA+pmOEYyg8P
         85hLiPOpPXW0rMklWPGXYqCmJoPEhH53Azov1IGHSp6GiYkLqEgXSJ00z6w2dZ8Q9eac
         pFRliSeWiBBc+UvAvq6gXMCLX8uCGQCRvDvCRFauAbiHRzjrPgDlDGuZj9l2a+Vv27ia
         Lm5PxIKkQwGpCqPwBJYqcwH9ubE8xamMIkb+yMAJQ+5JTtGSmPtV2xUrD6NrQaYAOeFh
         cLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783993427; x=1784598227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5bTdiv92W8B3yu+NVFE+yxGCJJQl+ix1X/J4ESOiB7Y=;
        b=fbp78+suzP/8z2OeVCvc5t2JvXDefeAwU6uejezAX19sxMhacqVCUYV+PbJotU1WiH
         aHTtZfz+q3fd/wwN0SMyqQJHp+nTSIigSqj+60cmgH9VzZ+K/Y+FZ2LjmmSLxLROcuQb
         K8UpEXLa3BUjADs1CRg9LQHpFrWPfEiCumLtrSGksZl0Nio7njIAsA2PoGQ/YeodjPb2
         V3nooD2OHFAXhluN3NlYkjw+KFPuioO20ppE9hSRZOA9zP5wJLE+oVVhn+GuDWltPB9d
         NouwdVg77PBUmUr5dshLC4RQWfXwgMuqFQ9QbcOu7llVi0r+WrS1xD17FXL/3WlMGWdw
         Htxw==
X-Forwarded-Encrypted: i=1; AHgh+RqifKBrpjh50FI7JjivfJY1mrreU/2BIaBbK8FXAlSEMwncsbezCHlA4NaxejmAJ3iCtGaracjKyus=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3G57dyUjGls2C93FCf9ynu6e8lKESaOQW6ehoFWOqVXxAA/6
	Lsf8RR3wy/OO6vwamg2KBkRKPyiqq8ytr2p+7In2JLru6BwavNKO3bcM
X-Gm-Gg: AfdE7cnOgcMUU/TZVZEV6pvFNofIzx2d8w34yQK7Fxi43am8Waguzc9juE+Nv1msSf6
	T99a1wEtn4q6sOUgSHn6aFKMZSvY7FAoWE7PKDdLR3DKknEKLxgvjEujDzyxP7eDAycPnqufnxn
	UCAbfBS1x2EnUsBDTeJ6WjjHF52GF3jnUD2Bo6VIOZhWFOu91O7uBGtlHFjAy7iLonDDaq+Sf1r
	BvtSVq7dw2nTfnNcepubrxyYxPZVCaQkXSuyS8oIg6j7QvgfdU7vfNycqAmj3X0xyZP8VAtY4ti
	ZX2ouHTxUtLLQmoavwGl0DB/tfWruLuIR3bdOVQgFsd2LV0xwrNnld9lpjMZ/f4MZfEO5jtoUKp
	JEzwAIHXcPNTIYVj3BnXtbyyvmxYFMtBxKV7f115CGLbgrjSCmb2KNFhrXgQTlTBg3baXpbtavm
	elnYKjVCGUOA==
X-Received: by 2002:a05:6a21:50b:b0:3c0:9c1b:d0b7 with SMTP id adf61e73a8af0-3c110a1213fmr12717930637.66.1783993427065;
        Mon, 13 Jul 2026 18:43:47 -0700 (PDT)
Received: from sleipnir ([2804:d45:3612:3b00:32a3:79f0:cdff:a04a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b924258a2sm59675775c88.1.2026.07.13.18.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 18:43:46 -0700 (PDT)
From: Lincoln Wallace <locnnil0@gmail.com>
To: paul@paul-moore.com,
	corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	penguin-kernel@I-love.SAKURA.ne.jp,
	rdunlap@infradead.org,
	Lincoln Wallace <locnnil0@gmail.com>
Subject: [PATCH 1/2] doc: LSM: describe CONFIG_LSM and lsm= as the selection mechanism
Date: Mon, 13 Jul 2026 22:38:31 -0300
Message-ID: <20260714013832.977443-2-locnnil0@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714013832.977443-1-locnnil0@gmail.com>
References: <20260714013832.977443-1-locnnil0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LSM usage document states that security modules are selectable at
build time via CONFIG_DEFAULT_SECURITY and can be overridden at boot
time via the "security=..." kernel command line argument.

CONFIG_DEFAULT_SECURITY no longer exists: LSMs are enabled via
CONFIG_LSM, an ordered list of the LSMs to initialize, which can be
overridden at boot time with the "lsm=" parameter. The "security="
parameter remains as a deprecated way to choose a legacy "major"
security module, and is ignored when "lsm=" is specified; see commit
89a9684ea158 ("LSM: Ignore "security=" when "lsm=" is specified").

A previous attempt replaced "security=" with "lsm=" in place [1],
which was rejected because the parameters are not equivalent:
"security=" selects a single major module while the built-in
CONFIG_LSM list otherwise remains active, whereas "lsm=" must list
every LSM to enable.

Update the paragraph to describe CONFIG_LSM and "lsm=" as the current
selection mechanism, keeping "security=" documented as the deprecated
legacy option, matching the wording in kernel-parameters.txt.

Link: https://lore.kernel.org/r/20250114225156.10458-1-rdunlap@infradead.org [1]

Signed-off-by: Lincoln Wallace <locnnil0@gmail.com>
---
 Documentation/admin-guide/LSM/index.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/LSM/index.rst b/Documentation/admin-guide/LSM/index.rst
index b44ef68f6e4d..c24310c709dc 100644
--- a/Documentation/admin-guide/LSM/index.rst
+++ b/Documentation/admin-guide/LSM/index.rst
@@ -6,9 +6,11 @@ The Linux Security Module (LSM) framework provides a mechanism for
 various security checks to be hooked by new kernel extensions. The name
 "module" is a bit of a misnomer since these extensions are not actually
 loadable kernel modules. Instead, they are selectable at build-time via
-CONFIG_DEFAULT_SECURITY and can be overridden at boot-time via the
-``"security=..."`` kernel command line argument, in the case where multiple
-LSMs were built into a given kernel.
+CONFIG_LSM, an ordered list of the LSMs to enable, and can be
+overridden at boot-time via the ``"lsm=..."`` kernel command line
+argument. The ``"security=..."`` kernel command line argument remains
+available to choose a legacy "major" security module, but has been
+deprecated by the ``"lsm=..."`` parameter.
 
 The primary users of the LSM interface are Mandatory Access Control
 (MAC) extensions which provide a comprehensive security policy. Examples
-- 
2.53.0

