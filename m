Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5121B26D4C7
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 02:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771814304; cv=none; b=QQpToYrotPLdVJX+x7c52oWojySQkNLmZdYTddqMslbXyLcMplTZwLmz2KaTVoyVsoKtZ3XvSYpZZ0UtgxWc4jGGBuafd8KKBaWFcpOYoLugATPuYGsl/vb6IX/Ua0aVPvFInR0lCOruPnkLNzaExmSw6NFiRZiLnpbV4UO1pgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771814304; c=relaxed/simple;
	bh=hQZ4RzCCncvW2OCRt6NdIBv7oMg2RYjH+aIKCbca1uE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jOpU/FBRLY0Zcqk0SLY2Z0Lzc4jPA4qyEYNHo0pqGyQuj9v3vA5ViN9+FvvBY0c1X8ZWl9pJn2ll593y4vAUpxu9qAtHGiWeXI58D19yCYatklrTvxb7aG+xeV+iNh53Ptq4yClPnUXYC4j/aSjoqpBalWs2dQL8EjjdprZuayw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cTQoTMYm; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTQoTMYm"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-823210d1d8eso2065979b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 18:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771814303; x=1772419103; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMT8wFDz7qD4WZoEwD8t8Q2gmp9vlJakzzcqRJg3S4U=;
        b=cTQoTMYmw4BaEeINeC+geTW3UDjlDh++uM1KA+32YA0/CLahUGYgKzXcpMwlKFNJWP
         0N9PtvWipg81uXC1r9ECoyrmkD9ZVhoNVJ0tmfnLb6GAG+i02CqF+ki6hJWUbIESZbxZ
         zHIRJWjuRSHAXhg1O/ehdyI8hl+JT/Gt2xdF3dIfKFfX9fbOu7aQwY4kJDw/iur7yeTF
         90bzXEhj6Jm+kcZccpcUrZsAumZooVZuIeTxrbTnY3niD1NQr8htr0vbJIo/RK4vPe8L
         ojco3EbOlOEWyVAZe9lN5TryrGBcTLqGzubOGGF0m8kH6u/mHW1DnBuh044kVe1TQ8Jx
         1aFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771814303; x=1772419103;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMT8wFDz7qD4WZoEwD8t8Q2gmp9vlJakzzcqRJg3S4U=;
        b=d0Z1HMXuNwHOu0lEIYr0ViuWRFDHrYbmt9Lrxi+k+uXar0L5nhpMZLvgecOnNkUPGS
         Tos+9nDcLn+btdK9q05grLN4n1zx2lIFA0MEvkHU29ul0S1mlSq3DJbYpngamUUyUji3
         VdWci8WDOYawKiS3JsY+IrHl07j7BvcAEdau6JX/0l+cYkxHlMuzn17rd6vZxZAuBOwf
         dtePPlJD/6Gc1ig5KRqjaEmhtl2gpuYiGFIUG76tPgida13Tveri8qKsIyNqd4o3xJyr
         eLR01KB6I+YBn5UXpshxS9D8xw+fbCdT+1HsHfyhrNTWcs3Pa2VMOAj+9X4JCfiwZcjd
         I4Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWJDZTuNlHV5N5V+qlK6WCmlWcvhVe6c37pG3yAdKuSI9S1Qj/xzeS0wrxxJc/8z6ZEL38i0yJqpLA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVoKKVa4PUEA0u8rg870nlnNB1KuP+gjMehWilW/cyNMoCvXga
	msuptDVaXyrZvBsUhR5h5GELe1xWXQdf8eMi8pgQYWXiYN53P1q8/WM9uD68ChI7
X-Gm-Gg: AZuq6aJJigse2UzAoKCJ9GSoV46IDexEsf9WghvCYGmrsG2nwtSlrt+cGK8M5Z2j+ag
	sIV+8wM4i2lIzQofhkpWrC+CrLkqh4JG7YtjS232QN1VVp9rLZnDq/tC1drqZMWQn3hmE8QIXc1
	sN0/qnfYSvH64dc0JrvM0e5LPYOdv9d+UAwLX+xZ8PuCsYGfnlERJVAJ+7bTv+jcWBjkxWwGgaT
	fMTiBfQlF5lYoziaOYvUsg7Z/s+xnE4OnT08+DFCrTRmUQcqc9AtNO3lutlxS5Ftztm4vu3E+i6
	c4cHkEVb2BB4HIP/+zZZ4UZxRDXywjqI9qqtqlY5C1qTh6TES3SR3euSCjdAewx5AjJnt9q3qU5
	FPgCRxsBIwmMuGTBRm6e/NBEDiMMtZLTGylEGpPdPLswSPWmmHXJ94fWYi2CcK1kV1sgp/PMzi8
	bpEXUezuzCsMUKg5C39hug3bGFjfQMNw==
X-Received: by 2002:a05:6a00:338d:b0:81f:4d16:5d8a with SMTP id d2e1a72fcca58-826da95ecd2mr5239840b3a.29.1771814302529;
        Sun, 22 Feb 2026 18:38:22 -0800 (PST)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826f2fc0c9esm2399402b3a.8.2026.02.22.18.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 18:38:21 -0800 (PST)
Received: by archie.me (Postfix, from userid 1000)
	id C59D2420AAB4; Mon, 23 Feb 2026 09:38:18 +0700 (WIB)
Date: Mon, 23 Feb 2026 09:38:18 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [REGRESSION BISECTED] Unexpected section title false positive
 warnings on DOC: directive
Message-ID: <aZu9muHK02vPPl8E@archie.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

[this is actually a repost of [1] since that thread didn't get any attention
from the regressor.]

Hi,

Building htmldocs on docs-next currenly produces about 80 new warnings; which
all of them are unexpected section title on DOC: kernel-doc directive, like:

/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: CRITICAL: Unexpected section title.

Userspace I/O
------------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Userspace I/O' ./drivers/target/target_core_user.c' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:25: ./drivers/target/target_core_user.c:35: (SEVERE/4) Unexpected section title.\n\nUserspace I/O\n-------------')
/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: CRITICAL: Unexpected section title.

Ring Design
----------- [docutils]
WARNING: kernel-doc 'scripts/kernel-doc.py -rst -enable-lineno -function 'Ring Design' ./include/uapi/linux/target_core_user.h' processing failed with: SystemMessage('/home/bagas/repo/linux-kernel/Documentation/driver-api/target:28: ./include/uapi/linux/target_core_user.h:14: (SEVERE/4) Unexpected section title.\n\nRing Design\n-----------')

These turns out to be false-positive as touching the source file in question
(e.g. drivers/target/target_core_user.c) and making htmldocs again makes the
regression go away for the corresponding docs.

Bisection (with git-bisect(1)) points to bea467aa5da1f5 ("docs: media:
v4l2-ioctl.h: document two global variables") as the first bad commit, even
though that I suspect that bdd1cf87847ff6 ("kernel-doc: add support to handle
DEFINE_ variables") may be the actual culprit (regressor).

The full bisection log:

git bisect start
# status: waiting for both good and bad commits
# bad: [7f3c3a0a9103dc92c823f27db3284ac2914e7558] MAINTAINERS: Add doc files on real-time support to Real-time Linux
git bisect bad 7f3c3a0a9103dc92c823f27db3284ac2914e7558
# status: waiting for good commit(s), bad commit known
# good: [9448598b22c50c8a5bb77a9103e2d49f134c9578] Linux 6.19-rc2
git bisect good 9448598b22c50c8a5bb77a9103e2d49f134c9578
# bad: [5188f6bd408f937d81c0c37eb59ddc1035cd912c] docs: admin: devices: /dev/sr<N> for SCSI CD-ROM
git bisect bad 5188f6bd408f937d81c0c37eb59ddc1035cd912c
# bad: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables
git bisect bad bea467aa5da1f51834501da3ac3c40204027a221
# good: [82e87387f6e2af9f69a7528733e953fd22e815aa] Documentation: kernel-hacking: Remove comma
git bisect good 82e87387f6e2af9f69a7528733e953fd22e815aa
# good: [bdd1cf87847ff6aaadd53a185209d2bb2db72165] kernel-doc: add support to handle DEFINE_ variables
git bisect good bdd1cf87847ff6aaadd53a185209d2bb2db72165
# first bad commit: [bea467aa5da1f51834501da3ac3c40204027a221] docs: media: v4l2-ioctl.h: document two global variables

Mauro: Since you're the author of regressor, can you please take a look on it?

Thanks.

#regzbot introduced: bea467aa5da1f5

[1]: https://lore.kernel.org/regressions/aUuLHzk5jdyBAxD7@archie.me/

-- 
An old man doll... just what I always wanted! - Clara
