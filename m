Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794884352;
	b=k6bXzMSeja48qsJXfkSFIVaSNfU7NzlY8QTM8bm3jyyPHcj6FwENDQv8K+lzTAnOt+3Q
	 t7+gv7FBOIl4PR31WJOA4A6b0OWDqtj0tdp2p+py7L6BvUdacBknL20kpFaMOZhb3csgG
	 1dA9F01Zk1YFEa6AZu9KpFRaZLAtfJ2VyIodlN3eEsGyRWdCP5AZMmpCFzvSXXxpRATPU
	 Qm9+EXJ0T22NlT6YNQVDCrndDGPsfSD8P5mg+MqsPV45ZBZKep9coLH/ABkqVbp6MZnvk
	 gaxrbWP8wCqUfNs3sDF2WqnH9MhE8oOmgxaBXmAubuzvEyjRn9OjXeqyPsWgn51E5Jg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794884352;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
	b=zjUgza2aGmzFmt51OXBWlmKyiKJmTqXOPSOe9AB5D02NpKl/bgCldnV4p5tKhnEjvGm+
	 FOU0cOcRlxfdPPPr1rEvoY8PHUp83NZbMPo45lpIBcOi7DBwcoDagj0VaQ61OtBK/xro+
	 tKTK8CtgRQ8IxMFyrD33uYYb9JTwD7fTjuiTQDE+9sRCN/G4gWPN9JZZIf+xEbJhGz3fQ
	 t9PwoZ205cebm2N0RakJuZXmFIU6BgXcjdmO7s6BLzeW8EysWvDRz46chpX8T998A/dv0
	 92AMNnfIhVlrpWxDxh56b/lceVrV/F2TvUx9HL4wS/6ruxnCVYwiEeE2C9ZN6PZKAow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j;
	arc=none smtp.remote-ip=209.85.128.176
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B28606A329
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 02:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B28606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dQoZW17j
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-8b4d26094beso16650887b3.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:59:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794884351; x=1795489151; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=dQoZW17jiNebFuE6azQ83jmKtjqcxcl5zox5/c9ay6PslDfs/OuTxMsQK+M93ZKxLu
         CyJYN8ep/zcVgJmJyDSjHdmSyO8In/0hZGEXZXgl188jmnl8t7EW4jrx2miND6RHUCGB
         CgJW+Q/Bf4JgPuTefi0kDMTb7iEg+i8irfbYxbN64//aJaiyIUsEG+siLRDJs0dpCndY
         CdzY5+RJF9PvDX9DgMSx0PK0f9olnMNJc8gppLDlmu23HGwYc2L7nHo2Y5I6ywE0mHNy
         31yP+aUy91KVf6nZ32brydM00jb9uxJAKYSP0ghepC3RbnV2VUvM1l7wM1KjfUWbyzDO
         u3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794884351; x=1795489151;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=slhAC7n0qqOkMBcIxUMzZVPcbaUbXiJAGexBTZo7f90=;
        b=odtmnH0khy4zuZc262BgRh8PnergX+oYw0nzQdwZpWb0sOAjPAk12vG85xNijx6D6l
         XVBizEw/CnOZgvv0wGYlJ/ZeBAFIDfY17uiSLBYbc0OIyt82QrD4ZG8LBn0pUaVMyo9s
         1ngXj0SdoCKJJcP6DcVK6rSFbnlGK+buGOx06z+Owox2r72hQNkLtQCETpWpOdwEpfWd
         nwdc7FH7u1BHuRyUxlXw0AQwjqVZqWWrDxjKRAUW/wkenyEBDKSe3321u3tUJO/5zGhV
         bxpVyrIDmiFQtjhcVsBDX1mYLpMN6SljgdywHGr/RNM4a7Z7waZJqX0qAEhPoViGzoNa
         taGw==
X-Forwarded-Encrypted: i=1; AL+hErHBRHYNm0pih0J3nCLEsXTWZFZWAWI/RdeyxJz8U+A09XLzNQeZZNIRRlLO4PZ32qyOXSr8eKwts7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aZ4IZEtPHRGuytBPi41bryoB8MrbfaNjaR5YDQMtZBnTrczyv
	3TpIIHSR+zEB8ptS0305hAzj+yzdaRkbP0hJ5aMc/gMKPaGfHlBtqW7ZGBrmR83RJCI=
X-Gm-Gg: AZFdTZfQmlitMTO5fEVtRAg7IXko4NsnMCiyke4HtyXciQB9oJAg0LFnkrsY4Lwy9dm
	h95EdjXqSHWDa8myjO5RHU3hQ/0WW6aUHrplaIHQ4S92byjC/2J3yRLBIV8IevdgLLpgDr+6tpA
	Niqsfco37qHXydR9+gfq5+/lnFahsvGz2sP3a5YJGikn9kfmA/+2HiEjKvX9J+vZmslJflORWIq
	0jGL4d9rKBUPLOL0ETdqVahfHkZ5bNNhFbjw4DXiZfNw7EgRWSs0IY3n7PPum2c1jJVNlR6tm9J
	3LBF8Rwh49O5GKgUB28J2QEhoOO0rh7J+V+Z9WQGnGizouISwOz7WpYETkXathyfU/pWWTz2LoV
	9RtXE7Q9+gZGhjTuZZrhp/QgOLYWarMNjDuZyzv/kUAN1uLrrctVx3hiLioLfABz5YtQTeZbi9/
	o7IB2wkxIPVm5tyeW+YSLote4uTWV94HLR564qfsQq6WnRlicCOOvHOVZbuIf93V1LfwUY/XO0m
	G57kfZA41joLce2XZYnaG4pFlzQttEZRrD7tFUXZfdVaOVCHBcSPmPx1hLqROxKPPITuQKJw3Be
	P/iF5RqY5O6JnNdMdUpnbIwLWyqQeK407Ac25nSuvt8ojaIaRqGgkIi2YU6105HdGkxVxVSnJiE
	dYbXucSrRryWGS4oZQdX7NTQCLQsTb7980HCNpq7krwxpbSefPhjOHc7KTX68LN+2XPf7WadFFK
	ZvbdYsCf3DVvvt6qJEAA==
X-Received: by 2002:a05:690c:ec5:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b4aa2a0f51mr73400777b3.39.1794884351354;
        Mon, 16 Nov 2026 18:59:11 -0800 (PST)
Received: from localhost (107-220-129-194.lightspeed.chrlnc.sbcglobal.net. [107.220.129.194])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec065f84sm14469217b3.29.2026.11.16.18.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 18:59:10 -0800 (PST)
From: Matt Turner <mattst88@gmail.com>
Subject: [PATCH v2 0/7] alpha: marvel: environmental sensors
Date: Mon, 16 Nov 2026 21:59:07 -0500
Message-Id: <20261116-marvel-env-v2-0-ef614eb2e7f1@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NyQ6CMBRFf4W8tTUdkGnlfxgWpTzhGQbTYqMh/
 Xdb3Lo8ybnn7uDQEjposh0senK0LhHkKQMz6mVARn1kkFwWQoiczdp6nBgunvVcVrUpVdFpBXH
 wtHin9xG7tT92r+6BZkuFZIzkttV+jjcvkvc37AXjrKq5khXmXYmX6zBrms5mnaENIXwBKOuc4
 7YAAAA=
X-Change-ID: 20261114-marvel-env-d0289c736ba3
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4421; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=2N/yDN2Wcz2QGAy54x4oEamhIu757IC6EK7THi85BJc=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLJ+H/qzetuVvIoC36zY7Wp/JHPDE9069+2S91qsMs2uz
 mTrw/PbOj6yMIhxMcwUU2SJW6/IMqttx1Kf09K/YOawMoEMkRZpYAACFga+3MS8UiMdIz1TbUM9
 QyBDxygeIqfHoJFZXFyaWqSbVlDkkJdfkliSmZ9XrJdfkJpXkF6gl5aZVpKRkV9UnAo0Qi8vtcT
 U1dHNyNDAxNLRwszJwtHUxNnZydDJzdHR2dXJyNLcxMDZ0tHE1dKcgYtTAOaa5EKG/xmWhp8D69
 iDJVPk5pfFlyZecviS9/LQ9jZLC6aXNpYOBYwMH21/XNZ/Ha52r7HnW2zxNcuUpg9XXkQIMD1QW
 HUm8OpyFgA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

The service processors of the Marvel AlphaServers (GS1280, ES80, ES47)
monitor temperatures, fans, voltages and power supplies. Linux can't read
these sensors, and the events the firmware raises when one changes state
are printed only with CONFIG_VERBOSE_MCHECK, and then decoded wrongly.

Patches 1 and 2 fix the event reporting. Patch 3 adds the SRM callback
that refreshes the readings of one config tree node, patch 4 passes the
firmware's events to a notifier chain, and patch 5 registers a platform
device. Patch 6 is the hwmon driver, which polls, and patch 7 makes it
reread the sensors and notify userspace when the firmware reports an
event.

The hwmon patches depend on the alpha ones, so I'd suggest the whole
series go through the alpha tree with an ack from Guenter.

Tested on an ES47, where sensors(1) shows the temperatures, fans,
voltages and power supply status. Disconnecting AC from one of its two
power supplies raised a system event that set the supply's in_fault and
woke poll() and udev, and reconnecting it cleared the fault the same
way. No voltage is out of range, so the voltage alarms were checked by
forcing the warning and failure states in the console's packets.

I used Claude Code to help write this series: working out the packet
layout, drafting the code and changelogs, and checking the firmware
documentation. I reviewed and tested the result.

Signed-off-by: Matt Turner <mattst88@gmail.com>
---
Changes in v2:
- hwmon: report the firmware's states by their documented meaning: a
  sensor's warning and failure states are its reading reaching the
  warning and failure limits, not a broken sensor (Guenter)
- hwmon: report power supplies as in channels with only a fault
  attribute instead of power alarms (Guenter)
- hwmon: depend on !ALPHA_LEGACY_START_ADDRESS for generic kernels,
  which leave out core_marvel.o (Sashiko)
- hwmon: drop the private mutex, rely on the hwmon core lock and take
  hwmon_lock() in the event work (Sashiko)
- hwmon: notify each alarm attribute whose value changed, and only those
  (Sashiko, Magnus)
- hwmon: report a voltage outside its limits as in_min_alarm and
  in_lcrit_alarm or in_max_alarm and in_crit_alarm, by comparing it with
  the nominal voltage in the console's packet (Guenter, Magnus)
- alpha: define CCB_CFGTREE in asm/console.h instead of the uapi header,
  since it is a Marvel console extension, and say it comes from Tru64
  (Magnus)
- hwmon: return -ENODATA from every alarm of a sensor that became unknown
- alpha: drop the unreachable SRM check from
  marvel_cfgtree_partial_update(), and move the GCT node type and
  subtype the driver uses to asm/gct.h
- Reorder: fix the event layout before printing it unconditionally, and
  put the alpha patches first
- Drop the Assisted-by trailers, describe tool use here instead (Guenter)
- Link to v1: https://patch.msgid.link/20261114-marvel-env-v1-0-890328e4b7e5@gmail.com

---
Matt Turner (7):
      alpha: marvel: fix the environmental subpacket layout
      alpha: marvel: report environmental events without VERBOSE_MCHECK
      alpha: marvel: refresh environmental readings through the console
      alpha: marvel: notify environmental events
      alpha: marvel: register a platform device for the environmental sensors
      hwmon: Add driver for Marvel AlphaServer environmental sensors
      hwmon: (marvel-env) Notify userspace of environmental events

 Documentation/hwmon/index.rst       |   1 +
 Documentation/hwmon/marvel-env.rst  |  76 ++++
 MAINTAINERS                         |   8 +
 arch/alpha/include/asm/console.h    |   5 +
 arch/alpha/include/asm/err_ev7.h    |  16 +-
 arch/alpha/include/asm/gct.h        |   2 +
 arch/alpha/include/asm/marvel_env.h |  17 +
 arch/alpha/kernel/core_marvel.c     |  56 +++
 arch/alpha/kernel/err_marvel.c      |  39 +-
 arch/alpha/kernel/proto.h           |   1 +
 arch/alpha/kernel/srmcons.c         |   3 +-
 arch/alpha/lib/callback_srm.S       |   1 +
 drivers/hwmon/Kconfig               |  12 +
 drivers/hwmon/Makefile              |   1 +
 drivers/hwmon/marvel-env.c          | 690 ++++++++++++++++++++++++++++++++++++
 15 files changed, 909 insertions(+), 19 deletions(-)
---
base-commit: 0b4cadbe7c39d830dec35c4a2655483de0dae568
change-id: 20261114-marvel-env-d0289c736ba3

Best regards,
--  
Matt Turner <mattst88@gmail.com>

