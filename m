Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E27F242D88
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 18:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790534264; cv=none; b=oVIQtPp4P5FT587F5SRbBIYCf9gvstcoxBiOFDiupi0yVxklPikBU11vMXngsQJlYKUcGxkjqR7tSxlMTZhFJy4ydlxGx2ZGwblnlahTrLCYwUmvKoVEcbJaItM5LDaUvW9xTJz01gYIK1u1bGVkEVPun+v5qz2xD72/LLNZug8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790534264; c=relaxed/simple;
	bh=+SzNif70qE9WRlzB0/sLIUts33w6w9XQ0QdBUjA5N+I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oq75p9lEklZ41jxXOJ7YO2AuzO04mEgyeqLGdTYBJcgaMLfUGfGd5TT9Ag1TWl3SCCSRQQdp44Wiq/KDDVqgf6qNB6Zkn6IIxgVJiXhXs9k9SEu8tuFSgcewL24D4xWfQw2lalS/M62K++VwDY6RSTfUy2DQMepzvsc9DLU32Dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=lZ6JiTH1; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="lZ6JiTH1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail2; t=1790534253; x=1790793453;
	bh=/JZjuA7Gay/H6k9tLxvbNGqDH2HHf+NplZp9w1gF9Y8=;
	h=From:To:Cc:Subject:Date:Message-ID:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=lZ6JiTH1Jm8FR0lXZRYJJ2/kZkB1usgkSM9AQLU9sMKS4r2ztVHi5OUcZ9vQLCZAq
	 cP44/e0erz+X3vgv/uXYZgqHOxyOO2+6RVEHNSNKiro9dzXqxs+lYJkOGV+hDzguCd
	 Ur0DK8ma8SLSoETtAgOV6afKTjQX+PAooqvVifTlw48PiCHh87o0H3qU9z5uJt/HZ4
	 hNd4/qx34LH6fiRcrIQklxkaQIapkgAuKfgbgrGS0wgjN4YPrf223ddSYRUGfETTuM
	 aFoFUoclpUTIT1OkaV+KHjngBa+HP4S6HDmLtPyGLGUtBG3Zb+CcX2NxIxgacUgKKh
	 +WpTdyieSnIBQ==
X-Pm-Submission-Id: 4htCpw74spz1DF4X
From: Vas Zayarskiy <contact@vasily.cc>
To: linux@roeck-us.net,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v4 0/5] hwmon: AMPINEL telemetry support and shared fixes
Date: Sun, 27 Sep 2026 21:37:18 +0300
Message-ID: <20260927183723.4078226-1-contact@vasily.cc>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This revision limits AMPINEL support to read-only telemetry. It drops the
hid-generic change and the hwmon match callback, so the series no longer
needs a HID change. The separate keyboard interface is deliberately
unsupported and remains unbound with the default driver selection.

Changes since v3:
- Select the telemetry interface in the existing probe switch using its
  vendor collection and input report layout. Reject the keyboard there,
  following the Aquaero and Leakshield approach. Remove the USB parent
  cast, USB header dependency and interface-number check.
- Split shared report type/length validation and unknown firmware-version
  handling into their own patches. Check received status reports against
  the HID descriptor length for all devices using the raw-event path.
- Add the missing trailing comma and correct the -ENODATA and unit
  conversion wording in the numeric-fix commit message.
- Rebase onto hwmon-next 9edd5ab2656f (7.3-rc4). The relevant driver and
  HID matching code are unchanged from the previous base.

The earlier probe-time callback concern was resolved in review: HID core
blocks callbacks throughout probe unless hid_device_io_start() is called.
This driver does not call it, so no initialization-race fix is included.

Validation of this revision:
- The changed hwmon object builds on x86_64 and i386 with W=1 and Sparse.
- All 995 previously captured reports pass the actual C parser/read replay
  with ASan/UBSan, including simulated 32-bit long clamping.
- Shared regression cases cover invalid report types and lengths, power
  and current conversion, unavailable readings, startup expiry and unknown
  firmware offsets. Removing the new shared validation fails the tests.
- A userspace harness exercises the actual stock HID matching and probe
  selection/error unwind: telemetry is accepted and the keyboard rejected.
  This is not a live kernel binding test.
- All seven Python tests pass; the updated RST renders without warnings.

V3 was tested on physical AMPINEL hardware across loading, reload,
suspend/resume and reboot. The telemetry decoding is unchanged here, but
this exact revision has not been loaded on hardware. Validation of the
other Aquacomputer models remains synthetic. Channel labels follow report
order; alarm reporting and protection configuration are not supported.

AI assistance: Codex assisted with implementation, tests and submission
text; Sparse was used for static analysis.

V3: https://lore.kernel.org/linux-hwmon/20260914233728.22725-1-contact@vasily.cc/
Review: https://lore.kernel.org/linux-hwmon/a968a02f-c513-42f0-993f-ede4f785025c@roeck-us.net/
Probe clarification: https://lore.kernel.org/linux-hwmon/d45d4de8-6925-40ad-a5b7-b8cef6356175@roeck-us.net/

Vas Zayarskiy (5):
  hwmon: (aquacomputer_d5next) Avoid truncating scaled sensor readings
  hwmon: (aquacomputer_d5next) Expire the initial sensor cache
  hwmon: (aquacomputer_d5next) Validate incoming status reports
  hwmon: (aquacomputer_d5next) Skip unknown firmware version offsets
  hwmon: (aquacomputer_d5next) Add AMPINEL telemetry support

 Documentation/hwmon/aquacomputer_d5next.rst |  13 +++
 drivers/hwmon/Kconfig                       |   4 +-
 drivers/hwmon/aquacomputer_d5next.c         | 101 ++++++++++++++++++--
 3 files changed, 106 insertions(+), 12 deletions(-)


base-commit: 9edd5ab2656f040d726b5388f49ceac10bb2944f
