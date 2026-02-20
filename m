Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2B92D3ECF
	for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 16:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771606367; cv=none; b=aqnq6tyCu4+6CkI4oUOSFx03wze2DYvHWOSJei2/PxhRcIuIYfg0GNkzX69/Uk9bU/q7uWmmMfNg+9SYIIuJEJf1zkCzWGsK4e+gOPeXxLOoPQqMu4N2b6lvfK++IRogpdf5k6j5jZgIx7soJonru0HQY1gqlLzm9t01YSU2FWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771606367; c=relaxed/simple;
	bh=IqPQ11TxVNwfGfAE21ETJ/ooX/oPSydMfPJi4pktBiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CmZMktPjDMJ7AWAvvgsju2tJMII3STV+WUEkDWAP6y+/07U5b39zSggEumgBByg8xZA+Rii78BAygIp7E27Vv1r/4kX/1SejbliCDOJS4OwjvOHmkokhttFpv9K+K0uYTWHAfDwuyccWeb6grXB+g+T/zyA6Noi7ipX3pjanrUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WevBewtO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WevBewtO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483a233819aso18937845e9.3
        for <linux-doc@vger.kernel.org>; Fri, 20 Feb 2026 08:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771606364; x=1772211164; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=quHTn17dpdrYevLKDusB6NpnopISHyw9U38mQUOhUW0=;
        b=WevBewtODdrPNJyOWFJoUbyVKfBeQE84vfmYsOWXngULM2wb4NDRL/bV2laE3Z8dQt
         XKDGNC8MxXLHBDfEDOBHLh1FMtzj4LfOpPj7CZOB7ND4GZUXcttWvL5lxVn+XQPNT/H1
         1lMeMz9Hn9fdP6mefckPQr7qkR6JuhuEQ7aM5JjwIJnIEOTxKeyCB3fb7T7/bpl14Ufx
         esGnmRjU5ahXgxMCE5betvVdpWQ3wbwdyrAyNyetMLpNwLj+Bt2vv5TRoe0okFx07JA6
         u0zkc1iehPhKXPfCR9PJ4LPT3WY7cJK5N+34m8nO8T7lMGxnjuoyqbmcDq6ENt1+CG6G
         DsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771606364; x=1772211164;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=quHTn17dpdrYevLKDusB6NpnopISHyw9U38mQUOhUW0=;
        b=P5uklr8n4Y0TS+nVsb+ZZEVRNDZP3Yk7vNEdmS3XxWQZzs1aWB7vx/lEpiFmdxA39Q
         36hSoU89VqSEy9hqP7JcwD8SWoWvQnyU3ra1bskAcFBQ/rY72/TsPWRGIapBRxE47Kkh
         gK4TwMidWhVdBWjCFqMFyI4O/T6Ijn/doQQ7lV+nUMwM5o3fG+h17T6cmjnNZqMNCMKp
         +ddcWvnyujmohHP0rgSPRYy/zudyJO6OXHe+McoMwhbR+q17IBNtZSAeiek2h98Hv4oY
         vwxhz7biaBdEi6FiPO6IzHQ+h0Z3JBspUKxxhDsuO2v4lUytHrn2HUtDVP9Yfz2ZsSRA
         pg4A==
X-Forwarded-Encrypted: i=1; AJvYcCX4xAoPX8wVbC3Xt4dtzGwx5a4/QWs5tLSBhhG7XGhEQZVUQ/hjR2q2vHIkldGMDCQvgVG/zirNN2U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrw0byhEZ/mp3z9u+z2psLG6bwLaJTV2YdqVlKezpPda9rFiSE
	0/WyplpcA4jWJGqBxUwTA47t6btTWBmVRj0JGC6iEE6dFnVhd/Rjll3z
X-Gm-Gg: AZuq6aI98I9geT4c+spcdbhNcWd3n1/NGhmhcTLKLjOmMrfKI6RKuHtj+Zq3+XuWe7x
	c7JXj1lXdR6i/hTROZXYH8doIo7bMKYJGvXf/S10+2bQs9jtoSHGf+RDFbbhSPH4iXF0T5XdEXZ
	rN80xiMDSFxsxokzUUj8yQtbctIVOzhVxhvgqY6BXt7G0EkSdg2vPZu+ACS4FH+GGv2E06WHpft
	RJb4WR7h/Fkgh3BxEyjnZ1BAptlz5tgvGy/rc/skofec7THTIh3uyfv4ikb7YvksUT5/Z6bHCay
	zgm+V2GwnWkp/fBv87lkInIqx5yFmSzNPHmqCJo8D1M1W0ImjI0MPfN8zauAQkyoKFiOE1bnGwO
	Q5IHoAtceazLK2VjMqK2/aJd8qr48ANnI8dpgMJ9fmAw9oH1LRa/E999c/+LuBfCiQO3mYvrgOL
	ezsMh2YmjWXeg1I5sZTr4=
X-Received: by 2002:a05:600d:640f:20b0:483:9139:4c1d with SMTP id 5b1f17b1804b1-483a9607e3cmr2232775e9.14.1771606363708;
        Fri, 20 Feb 2026 08:52:43 -0800 (PST)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-483a3dfd902sm21265095e9.7.2026.02.20.08.52.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 08:52:43 -0800 (PST)
From: Askar Safin <safinaskar@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: patches@lists.linux.dev,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] doc: early_userspace_support.rst: trivial fix: directory -> file
Date: Fri, 20 Feb 2026 16:52:38 +0000
Message-ID: <20260220165238.4162735-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Trivial fix.

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 .../driver-api/early-userspace/early_userspace_support.rst      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/early-userspace/early_userspace_support.rst b/Documentation/driver-api/early-userspace/early_userspace_support.rst
index 61bdeac1b..60d1e1bc9 100644
--- a/Documentation/driver-api/early-userspace/early_userspace_support.rst
+++ b/Documentation/driver-api/early-userspace/early_userspace_support.rst
@@ -73,7 +73,7 @@ usr/gen_initramfs.sh.  This means that CONFIG_INITRAMFS_SOURCE
 can really be interpreted as any legal argument to
 gen_initramfs.sh.  If a directory is specified as an argument then
 the contents are scanned, uid/gid translation is performed, and
-usr/gen_init_cpio file directives are output.  If a directory is
+usr/gen_init_cpio file directives are output.  If a file is
 specified as an argument to usr/gen_initramfs.sh then the
 contents of the file are simply copied to the output.  All of the output
 directives from directory scanning and file contents copying are

base-commit: 8bf22c33e7a172fbc72464f4cc484d23a6b412ba (mainline)
-- 
2.47.3

