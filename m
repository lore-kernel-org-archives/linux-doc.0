Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9039F34F255
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 04:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775535239; cv=none; b=OEIdxVej7mLwnMeDmuLnXlWW0K8AP0vuAk4Qh7F2soLzunGvVS0SglDlN5iTLUW+U4caYR86feAQgY7uUx7TDzBB/OT8nAPqU/G5chUlOq21Na0MrVkC9HN9XdeyRMd+eM2uxWYbLXhE6Tdmajx+Uk3R4VZ71VWg1wyqoFHzyXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775535239; c=relaxed/simple;
	bh=9a8DmApUDTCRmbn/EJgWGX9051OnV3aVstIiRC2e2DE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pA8Tv65BR9r8BNZdetPx59Ee8KS0B++ZoQFpZF8Dn4/lmvLrfKEqGCIrGnBN16qrzvxKGyr8HWd3tDQFRlxLzCeV1YYh6YRi8pcsnNHz5v/XHcaYqtYtoP7Bk4YfGIsG/nggsNzMf/Q8iCHc5488c2W6atP86Z3kn6G0hkcxW9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gDCAFTqT; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gDCAFTqT"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-127380532eeso2708166c88.1
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 21:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775535237; x=1776140037; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8lgOPiT00rpMCnbTFBagNZlQ4AYJdr+RiU/kRaXCOik=;
        b=gDCAFTqTCkGijMG64AvWeqOPjS/kUwkYNDOCER66s/OQ3kuqPG6qRC1KtDPT7hFZrO
         7Dr6GM2RlxOSJDS0PDU7kV/YRSxHKS2r1bgA92PPsui6IYopxd4TRecJMWSmIuCJjU4D
         aRroMrjwPqvPS1CmTjRg0Z7b/l8PGTeoTyJCn7TVeG4Nq2upE4uVduVFh76FXGXhapzJ
         lAee8+1rwlInZqT5t6fGaywkP6YnrCbOAW7A5LUANUq3dFYcjeRK5teba4VYoW0X2t+g
         gFw3GLc2ICXvrMPtGYIw6QCQOtD7K3ssZFmb3OMeguHaOtvkzduKiMNPuagu6WD1CFyJ
         KzKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775535237; x=1776140037;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8lgOPiT00rpMCnbTFBagNZlQ4AYJdr+RiU/kRaXCOik=;
        b=WzvL3nn2TRpk+t6TWPxi2rbClNtON3dD+/k0co1N6DMZ+d7BOzfsLcEibPhX0Ds6aK
         C0ZGRt+Fp/M10tVwuVpPW1kQKzKimPW+/BZb47ZNDH+YvE0CMum1o/+v0IOPYYGAKG2G
         KKmPq0YHNpMNFCD49qbQ5grJMoyeUJTKsrEyoxlEQanDs2iZJTmjnx85eFkp+pMlZEoJ
         CgclhxHKLOx5sq/Do45ajkgc8ck06QzHZDXRhuaq5VEEcZ75WzVIShTY499EgZBmc7Nr
         5OdvIuxrdvRhQLUJ8jm7q7rWlh6KWmZJjDrp9GNftzN9gIXyecnPQJK1HhDzNJkEbhb8
         KoqA==
X-Forwarded-Encrypted: i=1; AJvYcCUt3w0WHqy28so6TBU7dJ2PuTFENuGwq2w8MjFmvRlUzJLGSHfnin5Vj95V94/Yk5iGNNIy1khhKfU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxW+LgSGMZWtua4oUvI/dlCB7cHx59bswaPdCj2rFXMKGU3T9ET
	NhMaXv4f8W2dHP9L9kis3/PFulDvDwGEZszd5b/nwo8OylmlIn1iiC60
X-Gm-Gg: AeBDieuOzFXGOSP4aHHeiEl+RGWHHepNcOogZj+z68KZo/Yh1zvFnijNqbJO1G490lr
	hIHGBSiWNpeAoWF0UNtEDpAAb+f9YnYyzVohd2R2JN61b43zhkWSYJqI3fc4KbrlwHFxOZfHtXk
	KZfV7lBvblgTSvgQGnUDO67Xel6x/BU+CjXVftKcy0hbuzm+6zT7CwNxbq61RevI+8XDxKYoyjX
	KsiDJcBgrbGOxxejAMaag/wHpst+s+c9kAxTDRbMzyF9TfCXJST7AFDoitA/vi6JMmyjjqh7I88
	5xJlzMTUKBwZ7u6NW/A0bHAyCsLkzYUpy4xLcjbWI/74xF0vEyj14PAZj69GF3QNgMN/FVSqNig
	X8/irdhp/TgXI4W48ounn5KJFCeohc9NtNzDh5fWKgxTqUACYpXgSUJhvFn7pMYpIc8zAjRNp7o
	l5aYZkq8rB0lWKixcpIOdMwUO8q585Etz5f7vlwWhORr6i/VAJRiWpQPyf+nfSwiIUMXSfer4ph
	KPr
X-Received: by 2002:a05:7022:6613:b0:127:5cda:fb7d with SMTP id a92af1059eb24-12bfb6e999amr8794388c88.6.1775535237329;
        Mon, 06 Apr 2026 21:13:57 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bed93f861sm18523808c88.0.2026.04.06.21.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 21:13:56 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	Lambert Fan <fanzhaoming@anopc.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] Add OneXPlayer Configuration HID Driver
Date: Tue,  7 Apr 2026 04:13:49 +0000
Message-ID: <20260407041354.2283201-1-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds an HID driver for OneXPlayer HID configuration devices. There are
currently 2 generations of OneXPlayer HID protocol. The first (OneXPlayer
F1 series) only provides an RGB control interface over HID. The Second
(X1 mini series, G1 series, AOKZOE A1X) also includes a hardware level
button mapping interface, vibration intensity settings, and the ability
to switch output between xinput and a debug mode that can be used to debug
the button mapping. Some devices (G1 Series, APEX) use a hybrid of Gen1
RGB control and Gen 2 controller settings. To ensure there is no conflicts
when the driver is loaded, we skip creating the RGB interface for Gen 2
devices if there is a DMI match.

I'll also add a note that Gen 1 devices also have an interface for
setting the key map and debug mode, but that is done entirely over a
serial TTY device so it is not able to be added to this driver. There
are also some "Gen 0" devices (OneXPlayer 2 Series) also use it, but
the TTY interface also handles the RGB control so no support is
provided by this driver for those devices.

Signed-off-by: Derel J. Clark <derekjohn.clark@gmail.com>
---
v2:
  - Add DMI quirks for certain devices that ship with both GEN1 and GEN2
    MCU to avoid clashing when initializing the RGB interface.
  - Add left & right vibration intensity attributes.
  - Add additional mappings for keyboard inputs.
  - Add a delayed work trigger to re-apply settings after the MCU
    completes initializing after a suspend/resume cycle.
v1: https://lore.kernel.org/linux-input/20260322031615.1524307-1-derekjohn.clark@gmail.com/
Derek J. Clark (5):
  HID: hid-oxp: Add OneXPlayer configuration driver
  HID: hid-oxp: Add Second Generation RGB Control
  HID: hid-oxp: Add Second Generation Gamepad Mode Switch
  HID: hid-oxp: Add Button Mapping Interface
  HID: hid-oxp: Add Virbation Intenstity Attributes

 MAINTAINERS           |    6 +
 drivers/hid/Kconfig   |   13 +
 drivers/hid/Makefile  |    1 +
 drivers/hid/hid-ids.h |    6 +
 drivers/hid/hid-oxp.c | 1595 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 1621 insertions(+)
 create mode 100644 drivers/hid/hid-oxp.c

-- 
2.53.0

