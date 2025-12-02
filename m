Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0DE63126C6
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764676337; cv=none; b=WMUD/qonUl+YQyOqX63wDDNTvENnQUWXfqcb9/wFJqRqZbWau00hemcl9IsrYP5/6zpJn8+HI/o7JwZC9T8Llu818dHhb5g/hOV/0C4YqzW/m5hQzaD5pbGlUMd750sI4Jz2+gYEyQ3Roj8prpDUb9ERv1DxmhHnu2sZirArO3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764676337; c=relaxed/simple;
	bh=RZiMVeuMpFtsxH0FT6sSt415Si5xUzm3G12T/hIkpi4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V9VEQi9wm7ijxEhtOTv8rhWUgnFLcLRpWrZvejyhjGoW/fXwh5xcxbR6MvconwvDOz4dqKQzQnxp7fjMQ859CP8wipV3G7qsgTlc5k4/NeIolxQpOoAAeUUQinfJXQUA87sRL13hhFrZ/wAHaDnYzjxQY1fSD6n6npdODroBxw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=FlfRja74; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="FlfRja74"
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC1F63F592
	for <linux-doc@vger.kernel.org>; Tue,  2 Dec 2025 11:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1764676331;
	bh=JIEUjuYaaXoiZWfV9sg4WJ4d4l0iSxZy3vnXjkSudlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FlfRja74bCV9cU19wK5RbDfTgf6DB0jtWsmvkFMVKfvff9szF9V/kDH+3lTO+Gre7
	 bmWYbIyvxTypT/nRdT6v25kBtZ5nrTnUKitvDGTfwHzn9a+rfGWdTxT2B9P1yA7cFc
	 4oQfSQTQPZtnbJpC5DwN0fA61uj4XJc+Ypx4/djPTidaxtO14LRM3gl6+psGzljWWu
	 znsVYFpMb7qj701J9mM50K9Liu3OXYjhph12ZQULavqGyHOLttPR3TMrmSMHKiOjnx
	 xI+hSFj1S0HeNA/mixVjS3DE1WiAyF8fGhbauFBrRZJC94qLXpTttAft8t3PFuEH+t
	 Z0oJLhAJRBwUIoRcpRCCeQxEcAFeoSCvPOl6WVl9YSF3Bxepf+AlxINw8AWIb83MfS
	 my4/DPdhhYxO4uTiRsmuFFo0bVu3hJzFWuWeHukglfUYtYYkcMv/gpxoLxMMhmea8c
	 1vaB2x7yuxAkY4XgvLQnlEKnarCKiPK+u3fP34Men+tO5C5NVU+lWvKvgHcy7YH4pU
	 kXzhGwOdnEi15PLjex6LVUZWkm/5PylZhB1pQ1nK3fLEVyDidPAVA++UlS3xgNUFAX
	 Hi48eHwuec2sswALcviSNNC5zwUJPqkrux9gJEH4SJjxkkNKvc1GVw0NGchW7LhbyH
	 8MqXh2yNwsvRngy1BzJEtQPc=
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-64161017e34so6659125a12.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Dec 2025 03:52:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764676331; x=1765281131;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JIEUjuYaaXoiZWfV9sg4WJ4d4l0iSxZy3vnXjkSudlI=;
        b=j9/k5TT5MzkY3qdnYMrvpknUEIrBuQ82agKh/iAQqQorUJjEZckq7BlGoSN0akAme6
         Mc0Ao45kZy2Nu3cumr5HwpBWgo7UQhr7eBrDwaUZpwjKCr6h/7ArG8y8ozU/A4v7DRWa
         h7J9ouu5P9iJVia1S7vdOdcdaJ36J0Pp/sp9IQeBnjrR1qJNP+8lUNATCXuAPRQ4zva8
         ESz0j4nQ6IA2Ew/IEPD9VflKpgac6Z5SMQaemy66ZnRy6KzYK9Rrkq7jkM6QsKPmReB2
         N7vvs1Fiz9PoAZ/MZtLDLoEmLFVm0jeFyaiMKx42FIzFo2cLhQctzFxWC2Ly4oUztZq1
         35xg==
X-Gm-Message-State: AOJu0Yy2aE7AGBI+BLDE1NGWQ/CeSY+EIGwMLVgScX5HmKBD81SSX48M
	Rc304jJ/+CtA36FbDN2i2zuR7PAZbTtkbhjXbRw23yMJG4gihcGY64GEpvqP4NK1fctaX5zUyaK
	pROuoGv8T+48v1fcDjhpKa6rMwwlavzwB4w3FRPQZoPOPzr2z+GtREXU0wDu6TR8tC/H4+t1+Y5
	6G3g==
X-Gm-Gg: ASbGncsIbcfTv9ln8KNP5a9At415E+iu9scPn5NyN98cUTB5lsdrN0Rt+T/fnFkVTol
	IpcXQY912fho9DbNHSwGQz4VBM0XdDiYAve0V660Rwy5qzLhFrtm98IxgRtBiSaF5lWN3Pw37ac
	7PdvJoQvNv66O7lD/wkYsUezZ8E1d8efXg5g418RzJvaoD5AvMbSEvLXybNjJk8x5EGMo8o55xD
	FaLlBUvNkAh/cT655fXSFH3hJIi9wKwkzx4saklpCokKpG2MGVAL/wG39DReBkRQB3w+FyljKPl
	Y3fxeBt1FwjFIUtIIDS0lC19e1oxbym5TMLU8GA0LXpPgEl7vR3hWGQWMe8lVehrvpLIkUR9FG9
	hTtvMFggwakryBBqApQFTLfo6yZgAgmwEX9uwOUIMkqEx0bCyaVhM+x+IdqC6knkcEpZApceuJP
	5OSdm4f76Tx4W/4LmnKMwddmk=
X-Received: by 2002:a05:6402:1467:b0:647:8d63:d8b4 with SMTP id 4fb4d7f45d1cf-6478d63d985mr1389521a12.6.1764676331228;
        Tue, 02 Dec 2025 03:52:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnMiVlmki0ogqB/rjjKmxYW241m0D9+1e4z7ydsRRIt5eGoAPCv4LFWTLrYgGpg63kI73JFw==
X-Received: by 2002:a05:6402:1467:b0:647:8d63:d8b4 with SMTP id 4fb4d7f45d1cf-6478d63d985mr1389506a12.6.1764676330801;
        Tue, 02 Dec 2025 03:52:10 -0800 (PST)
Received: from amikhalitsyn.lan (p200300cf5702200011ee99ed0f378a51.dip0.t-ipconnect.de. [2003:cf:5702:2000:11ee:99ed:f37:8a51])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647510519efsm15206765a12.29.2025.12.02.03.52.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 03:52:10 -0800 (PST)
From: Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To: kees@kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Aleksa Sarai <cyphar@cyphar.com>,
	Tycho Andersen <tycho@tycho.pizza>,
	Andrei Vagin <avagin@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?St=C3=A9phane=20Graber?= <stgraber@stgraber.org>
Subject: [PATCH v2 0/6] seccomp: support nested listeners
Date: Tue,  2 Dec 2025 12:51:52 +0100
Message-ID: <20251202115200.110646-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Dear friends,

this patch series adds support for nested seccomp listeners. It allows container
runtimes and other sandboxing software to install seccomp listeners on top of
existing ones, which is useful for nested LXC containers and other similar use-cases.

I decided to go with conservative approach and limit the maximum number of nested listeners
to 8 per seccomp filter chain (MAX_LISTENERS_PER_PATH). This is done to avoid dynamic memory
allocations in the very hot __seccomp_filter() function, where we use a preallocated static
array on the stack to track matched listeners. 8 nested listeners should be enough for
almost any practical scenarios.

Expecting potential discussions around this patch series, I'm going to present a talk
at LPC 2025 about the design and implementation details of this feature [1].

Git tree (based on for-next/seccomp):
v2: https://github.com/mihalicyn/linux/commits/seccomp.mult.listeners.v2
current: https://github.com/mihalicyn/linux/commits/seccomp.mult.listeners

Changelog for version 2:
- add some explanatory comments
- add RWB tags from Tycho Andersen (thanks, Tycho! ;) )
- CC-ed Aleksa as he might be interested in this stuff too

Links to previous versions:
v1: https://lore.kernel.org/all/20251201122406.105045-1-aleksandr.mikhalitsyn@canonical.com
tree: https://github.com/mihalicyn/linux/commits/seccomp.mult.listeners.v1

Link: https://lpc.events/event/19/contributions/2241/ [1]

Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-kselftest@vger.kernel.org
Cc: bpf@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>
Cc: Andy Lutomirski <luto@amacapital.net>
Cc: Will Drewry <wad@chromium.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Aleksa Sarai <cyphar@cyphar.com>
Cc: Tycho Andersen <tycho@tycho.pizza>
Cc: Andrei Vagin <avagin@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Stéphane Graber <stgraber@stgraber.org>


Alexander Mikhalitsyn (6):
  seccomp: remove unused argument from seccomp_do_user_notification
  seccomp: prepare seccomp_run_filters() to support more than one
    listener
  seccomp: limit number of listeners in seccomp tree
  seccomp: handle multiple listeners case
  seccomp: relax has_duplicate_listeners check
  tools/testing/selftests/seccomp: test nested listeners

 .../userspace-api/seccomp_filter.rst          |   6 +
 include/linux/seccomp.h                       |   3 +-
 include/uapi/linux/seccomp.h                  |  13 +-
 kernel/seccomp.c                              | 116 +++++++++++--
 tools/include/uapi/linux/seccomp.h            |  13 +-
 tools/testing/selftests/seccomp/seccomp_bpf.c | 162 ++++++++++++++++++
 6 files changed, 286 insertions(+), 27 deletions(-)

-- 
2.43.0

