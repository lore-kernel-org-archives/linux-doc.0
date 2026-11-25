Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795645083;
	b=TVbQqVOHABjKUDpKFQeYVyFu+g8hmNaMrrSbk2HqldJfs1GdeWdt+gUkaDq4jLvb2pZ1
	 WGwL5L6oVBV3cm0lFfEJWZBpjpKtJ1q9n83MKelVY97AcZy2yJtKYIJ6cUMy7sZvvznjA
	 rmQO0SfHi4wMmqHe9AVKca3rU3auCrUGfuQkUMy+kTq7g3mWi21AZ6q9wMoeB3CfCFg9L
	 JKOb0FwX+FRxU6TfIzY6+99Ls8huLZY5OeMfa3l2ihkBZEOXJ4KuyceEA79qSrBExuny2
	 1AgB+6CapY528EBwWatwH3+uC60D9YtM7s57+zmDzOcdR3YwJ4+LY6Kqq8GDC0BlnhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795645083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
	b=h7K1WxACtbbrxZJC3yS2Czw5U5aoYbPx7Dt7wWcRPjUm3FG6SVZzfAtRAU1n7WggPsw+
	 WMjVIEp/Wp+8IyQ2xLHpMGQRq9dzP/udGTIN6yJ1FtONtvBlTeLIz3a5iAwprh1OdvrKI
	 8QF3PmiDgy+BpaWXZ3Bv8KIPeOYM7qOVu1sukixCASP7OUjZOG6jlNQtTdpNYK7R68JUe
	 KVRy3po9WHOASHm+jEseuQBkk46dR8pR8JcP0ifBDSTzotZdnDF8J4dXzvkDlrev+VEqB
	 04RRDUjQPeO5L8W3eC8CV+SKvnJBvhk+ESvnuwmyGSXNzxSzWbC6Boi0JxeWfqtDOug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81452606A323
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 22:18:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81452606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fZxGGnum
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-38431138772so8265021eec.1
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 14:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795645082; x=1796249882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=fZxGGnumQ471hrV6MSOZ544ePTSYpR3Lpx1xjQjLGbLFi+CyEjoihhTrNFOnsUregf
         PC9dfmFaXIseGu4FIHQknJd41iX+Pfjh+pVEa9givyLuAaa/QLXg6hZjapJd29+5FKQd
         SeINeDM6vBzGE5p3mXaJRacxB7gjH+HgroTijO5ZiWPRCJUlOnihF9TN/DA2gQWygDHo
         Dhm817XIYFjIozAp7hurJ/G7vqVyV55MLsjBP0W7ANa0kSpDD+CCgM3lZTXbkR41rR10
         SGVpyeLQ678n98ApzY4dBaVcEPR4K6Ndqn6Qo6ZXJXg/iFEXXgD7UhMPSDkDWcAGwMTd
         bJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795645082; x=1796249882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BnNnCP79mIT11o498QX7t0hvFj8f/s/nQ+8DjF/+0o0=;
        b=EkQK3AdndeU/HyN+A5RiuAjKpRUeelaALvLdE0DefnNm01hjwYBrF4YaI4Iv7BVr1N
         E6YtEoNrP0GSRt7REnkUNilzUsLVp7KqXO53m9MiWYCpRNB6O8tUCUYM3O0jHBFLIStH
         CRN5gWj+i47pwuQ0wC1jny/vY/szbYGA39TIl3jNz3kjgo3x44EVuN4UOlLBldxZ1NL1
         jaRtlkQh+0nagDfWcVNtiH7l0rxujpwH8YRyIISrMeIr49HL0n2NrqBv/2b8PzhEBcD2
         LIF7Zmre5bnT7Ii0HQBN7jt9ZYrJ3SeDXc6CdkGmcQrlWyZATE41E54eeiWfn12glQIb
         LTSw==
X-Forwarded-Encrypted: i=1; AL+hErHdwzpU1KUlMs12T3nxh5L83yjtTAwVThS7xu57xtD85kHU+SOyKuKs4l54rF0q9QuL2lTvxglrBUU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VkFnCzdkWGbcpoCHt14EWv/rfn7nbx8QwLRCOz0Zt9NlRF0uX
	2eMWA8FHNB+KG+qpK+UG3BTryXHFpqDrQM7/Ue5Qjx+kxW91ef0BQ/sm
X-Gm-Gg: AZFdTZft5RrGJewhw/eaVdWEVzDMoivf91N1xsiA7qWKrwK6qQ8ULhnAoEhNJa58JIi
	sQ1yrYTYxjsYf4KlUxdK+tyCXa54mM0dq8q3oiirLfM64zqMUpf/gFTGe7vMb8mkTgELOHSGnHS
	DKSrgVjB+TG5jA+U5BRjZu5rxsd48GZxuSsXPbCJ/RpK9TOH+x0fbprxHvs3P+owwGSXvZrsriD
	ZryVEtLdmDE4fOqXmCpXa5NYp71S/Y8l7nXeXh2XBemK6PIvwslz1RxgRMVj+XD0S/kXZszHao8
	3KwUBeMz8TJ7hKPHCLY63UojKEWvVuWJo/3XmoTQDou9umRHBhzGQwEBH7AVZAxTmuMkDRUKV0+
	h/jY0ajzGMxWIBguIiSaaMDIsF5WTMDMlIE1qi50YvYoVAllwO71Z1BaI8uXMQh1my3L6tO2uQc
	ueinn7RaLC1exkeVCPSn88CqroqHf9OW4Z1FO8jiGDTYU4o7DK1X1RYkbAT4eXfrlZk/aNdaxB2
	tAhUqQmvLpGhkRbYEDdiJ2tXa5+GbTPDr3/tTZ9+g+kFVgHWDsi/ndYxbFf5FyTavLU8rtf4Kss
	5sSgxPT7whAY9z1Pg1rl
X-Received: by 2002:a05:693c:87d8:b0:386:b896:319c with SMTP id 5a478bee46e88-386b8963d3amr8931010eec.35.1795645082138;
        Wed, 25 Nov 2026 14:18:02 -0800 (PST)
Received: from a1-free ([2603:c021:8021:f000:0:1865:8c38:18fc])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm69581357eec.5.2026.11.25.14.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 14:18:01 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	TAKANO Mitsuhiro <takano32@gmail.com>
Subject: [PATCH v2 0/3] docs: ABI: report a symbol that one file describes twice
Date: Wed, 25 Nov 2026 22:17:55 +0000
Message-ID: <20261125221758.2535044-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
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

check_issues() compares a symbol across files, but it skips the case
where one file describes the same symbol twice: the loop returns as
soon as the symbol has one file.  The ABI parser keys every entry on
its own, so a repeated symbol on one file is visible as two entries
that point at the same file.  Compare at that level.

Doing so surfaces two entries that claim the same ABI:

  - shutdown_unlock in sysfs-driver-mlxreg-io, described once in the
    October 2021 block and again in May 2025 with a different default;
  - the internal MCU protocol_version in sysfs-driver-hid-lenovo-go,
    whose entry carries right_handle/, the group the removable
    controller lives in.

The two documentation fixes come first, so the tree does not gain
warnings in the middle of the series, and the checker is added last.

Four symbols are described by two files each.  That is legitimate when
two drivers expose an attribute with the same name for different
devices, as hid-lenovo-go and hid-lenovo-go-s do, so the cross-file
case keeps being reported, but as information rather than as a
warning.

The first version was posted on 2026-11-25:

https://lore.kernel.org/all/20261125190742.2420486-1-takano32@gmail.com/

This version points the internal MCU entry at the top-level attribute,
which is where sysfs_create_groups() puts it since mcu_attr_group has
no name, and the checker keeps its warning for an entry that ends up
without a file, counts lines rather than occurrences, and drops an
unused loop key.

An AI coding assistant found the two duplicate entries and drafted the
checker.  The counts above come from running get_abi.py validate
before and after; the paths and the group were read from the driver,
not from the document being fixed.

TAKANO Mitsuhiro (3):
  docs: ABI: mlxreg-io: Drop the second shutdown_unlock entry
  docs: ABI: hid-lenovo-go: Point one entry at the top-level attribute
  docs: python: abi_parser: Detect a symbol repeated on one file

 .../ABI/stable/sysfs-driver-mlxreg-io         | 12 -----
 .../ABI/testing/sysfs-driver-hid-lenovo-go    |  2 +-
 tools/lib/python/abi/abi_parser.py            | 48 ++++++++++++-------
 3 files changed, 33 insertions(+), 29 deletions(-)


base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
-- 
2.53.0

