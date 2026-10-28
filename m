Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194436;
	b=gcn+gbnYMu4vzkmiwpoOESFNWnEN8iJfG05hGv4B4iBZrELRRsDK/SEUF+X1dqP8a12f
	 YNl/MmGHoapIow5TNtesni2lvXuviUJa8yREMi39zlu+9TqxI9ai552fiLCih7pP7KZG+
	 nJJ5g6Ao5NbQDQxLb+Sd4awjUOFT/gkTeNZo9Wfg64CeVMgf0hk89nATy0mmk6fGEcgkI
	 kHBYTGWMwYTa1wCTdk6SVrUAcarK8x1JKdSvuPs8OoYfgG+RJidhCWr9LWRZkiTt0d5+p
	 Tm6bS7U2kCzfBzNtMyoOSB0Z1LUEWcVpkbc+raUpmwDe+n9xsct6hzzrBJmHga52aOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
	b=oPlldr4hByDyFwG6blQv4F39LioXeX4oejnX+1W6k7vhR2RkA+GAFNCymUjSw4TjBCTd
	 t9LhhIhiWxVw9Q0eCFZnioedxtEkrZQEi0SikcFqhnmau1EJVwwCxumJSVdp0HpiGrDYh
	 ktArzcYitBd6lBxfBkPHiACFwQGlo9z5orYSRZ4DLR7DzK9+PYb/W/d20ICZPYGJrE7Oh
	 tkrgR0ng3c9Dyvms//OsuDQJBwUR2NtzXUY71OKK9mJmkj+8EBpUVR8Bb0cg6i3yR55YJ
	 Y5LyXn7jDNfbRg7HalBh9/ZVUg5oCSxGZlQpnFZwISVZijrGWI4mmPntu0Pj4JAagDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a0tLEIZV;
	arc=none smtp.remote-ip=74.125.224.51
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB960A2634
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 13:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11EB960A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=a0tLEIZV
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-676858d42f8so942794d50.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 06:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1793194435; x=1793799235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
        b=a0tLEIZVYyhkTlIJHtgGbFZONiiDQraHICSs8nIr1Mw8HVsHHaim+W21SJOURks2cx
         61LO/g8DvIxgQhaGuocD17ZH/DA4iaOHyjQrLqvDuajbQoadCuwEJCYzv6ytYZ488PyY
         6RP5RF0HmPdnKboB6PcfpwOn894vMmmRnBEgJgJHkKN20mHnSrwCmpTy9nNQaa76UAWN
         NpNmbx2oRjFr0n7ImcBB7NpIjIxHAYO1AHWj0PGm8ai11QqqZC4jA1qSo7eoPgwI0ndQ
         cBlclyvHvowc6wQkBzpllidO02OCyWxupMHOBYWp76zlmeTbU415dVFYLCJd5WjoD/Bk
         ik0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194435; x=1793799235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mHBWVyhcqxaC5vumFhxxpKEuhD3213M1GsePKvUPh1Q=;
        b=OYimDerXKuOGEGKhlrtTSaHMF/84Yq20/zx4EhLCvQD3wfVeMeaplVcsZTtf9FJX4h
         OrMuXi+TVWW4bEJFyWRr91eHEipQ2njRWrjVMHcgJK2nyYM5bnYUGIHwdjnGZU/7k5UJ
         exC+4VVHziez/csRFUIvt/31EHy+k80OHVI6gajKZ/FuzOwvrcpXNttNqnkvUl+7yZSh
         2R7pLzKeJhAUThqkNsqOyukqiRpdvGOkU7hfx2ljy+f5AFxlUXJHoq0MjJHdbbNaz4P1
         ojPQOQBLITp+Tg5AbkXr+p3diLcxUxzX2f1KiiBIXjLn/uFLeVuL1Jud8YDg9VYJ4Znf
         p1BA==
X-Forwarded-Encrypted: i=1; AKwUvBzlaloObDyVfIRjBgP/rJFtkevax+e5hQWf11dSv7Pk2qeRVOr2XaDJhaJia1fjCTi3ISEWwdyFb2U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEcVWisCwXEm2D6Io9gqjiC6Qwbs4Sy3ZTPkxXX8SU/Z2uWOCn
	70rAv+MXiUGScsga90eSly6pMN4Li4Qw6qu5Is5RKy2/XvwuH5m3iUAmiqIycatnFoff
X-Gm-Gg: AYBFou3DiQN+nQGn/1g/+hk2MtnE4q5YFfAynQTAPdnFgkR5noh+sYo4bPLeTd2AM3K
	lGEa3MKJFady8S4nOgYfQO65Bdef2Hh2Z360kfnuC5OhO2GY2dGu17nWLI8sjyTG2FvfFZd8oNm
	sK2/8HmdF5aNKw99X9DsY2BZfxA0Co9S/hgybLGTn2OzS4Xg/uziw1h5dAQazuLZMT9LAR5iS/v
	EO9reLuWMPLqxKSfF+KtQB/O3LlShx57IrabPpbtbPEVsEnrSadf0/ta47VE6GuMpmuOkQfdsr1
	bcTEU7Eyk04O0uCWIaB2lTYyMH7VcS7n5XCzPKG5lGMrOi3TLjcz7DYBQxafGrCtj9xfY/gcGf9
	AQQHOtmpTkZVmDNMqBnWm1bWL8KxiAPnoZUJ4eMUyxDzMi/cYRlrcsuyTOrvY9td1Q1HHTigW3c
	V0oOgyA51TDLF6sr4zy9VxLs6XqHa9OMvS48Jd+WGNnMz5ozH9fgkv3uPZtGXfP1jGZvjk2Gj0d
	FfugsiI/Dvp/AtM+7wZDsjUfOVr0ZbPTMMi0bFv7EAQPsZtUO68xNLhnweWQhzFk4L0jtP77ru5
	nMMaAyiuskf8DdkoQ4buuRk5o4dyRQnwYURYBpCeEpNIqmIj/HMmcnosBtGXYPPDmWlz/Wnp5qK
	g+XcexipSBlWFzI+rIpxXF2BsnR+K7/AdDTYCf4Nv2BoKm0g=
X-Received: by 2002:a53:d60f:0:b0:679:992e:3ad8 with SMTP id 956f58d0204a3-67a7bd3cbf0mr1120504d50.132.1793194434760;
        Wed, 28 Oct 2026 06:33:54 -0700 (PDT)
Received: from CC-KJQTV599DQ.attlocal.net ([2600:1702:7b5a:ab90:103d:30e1:1f09:a9ae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm1694911d50.1.2026.10.28.06.33.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 06:33:54 -0700 (PDT)
From: Ketan Bhardwaj <ketan@armoriq.io>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kernel@vger.kernel.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>,
	Ketan Bhardwaj <ketan@armoriq.io>
Subject: [RFC PATCH v2 6/6] MAINTAINERS: add an entry for the Kernel Assurance Plane
Date: Wed, 28 Oct 2026 09:33:35 -0400
Message-ID: <20261028133335.75899-7-ketan@armoriq.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028133335.75899-1-ketan@armoriq.io>
References: <20261028133335.75899-1-ketan@armoriq.io>
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

Add the KAP maintainers and the files they look after.

Assisted-by: Claude
Co-developed-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Assisted-by: Codex
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f53047a..0946d15 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14118,6 +14118,16 @@ W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/radio/radio-keene*
 
+KERNEL ASSURANCE PLANE (KAP)
+M:	Ketan Bhardwaj <ketan@armoriq.io>
+M:	HARIHARA SUDHAN. R <harisudhan@armoriq.io>
+L:	linux-security-module@vger.kernel.org
+S:	Supported
+F:	Documentation/ABI/testing/securityfs-kap
+F:	Documentation/security/kap.rst
+F:	include/linux/kap.h
+F:	security/kap/
+
 KERNEL AUTOMOUNTER
 M:	Ian Kent <raven@themaw.net>
 L:	autofs@vger.kernel.org
-- 
2.51.0

