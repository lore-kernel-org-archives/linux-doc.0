Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FB54281D
	for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790087317; cv=none; b=PvJYHPcqFLHsznYbjNQyfuZm8N+3kbdG1JmhRNOTSdy6YWGWZwxXNC58QyDxNQmcXSuasYghtJ3Te4YRwTwKrdyuEIRCNECw8Vu7tC0pVkO58LWkBvkA3xtsDRYkOF0CSZlTwpj8E33yJjobBhutXX5DTpzSnvAdWY6ZWR2MKgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790087317; c=relaxed/simple;
	bh=mMUtEEojzt9J8y96cs3e6JAjp06vfiuaPVxbmzHBeZE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iX/bXxF9ba+47n8Jc3C6dE2hraZPJ5dAbzoW8610Nf/MqF7BOyTGeVfY/My4YeIhuL+sdKD4/AyhFuZ7YNnsCYi+WaqdQo4ZX4DDOJ5ivfCPRBSB3/3LNu0hHuDEbOI6iTFZ3Ypuo2NAncznvgdL/7a72MfqfbGDp0HTw39xYL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYEibxN7; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYEibxN7"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso3917948e87.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Sep 2026 07:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790087314; x=1790692114; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JLJfF6hhwT/ytTs8DqMt8dJw/Qx7jiDljUxbYquadd4=;
        b=kYEibxN7VS/1rqlySqbPxRIIt0hsjjgqdM+AUhXpO1r7VmHbJuS3LcSBcAuG/e7vzV
         kpUoyOSJFh9XZbuQ+z4zyv6KcaOPZ7VLuijCAk5f3/lddNdS4YT5cqtPe79Rz5C+33yi
         cSXX2NXM7CYD9/FZNi3j/Hj+s8r0ZnJVmHb6g0Z3hIkTVRfOlKBOe7DgZyvLufKPTguq
         B0xy+5E2Oh7IwxIXgs0u4VXESj++4N528S4l//ICkGUPhW9cK4d/9oSdIUFXK6YXFwZW
         XillEo2EeuP29Qxl08r4ayd+RK8tQdr3sH6FNf1cq3RkpmhpQNVkLBco383nxRTusiia
         piXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087314; x=1790692114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JLJfF6hhwT/ytTs8DqMt8dJw/Qx7jiDljUxbYquadd4=;
        b=y1IhGy66I2OoB1jr869NUw1e6RTyyACqPTwkYS6x5owmekiWP2kUOr4D7Upy5NWZW2
         uK8A/E4qSCH2L8S5WRBgmOuj8nzefKCwxLogTFQEQ2/GACe1lFYvJiaN1gZOQU/ZT26N
         OO9z+z3BFKhZFgzBHocievq05BqNMZU1ETiI3xqlkV5ov6Ba1pJGgwOuBTmt6ZceNRlu
         QS/G+LAtWfFmW4bpoc3tDK9Fg3T3sD3MBZzucOjTkNti+V+z20Rypgip4ILSC/EQ8CIL
         9zyF3NTC7vuf5aIIwuHlsUNBDEEVSN8PdkpP16AuT+9x2jJe/lnS8vqzZGmCV90ct1FT
         ixGw==
X-Gm-Message-State: AFuF++lE6ZNL8uuXu0+fFc/F/gKUKy5CHvD+YJA/WqRYB6R+jvc0HJHF
	Iyqdbl0r6UviL+Rx+0N2q+Z8MHDftn2s1+I3a/JfsEbhNR0XeYBM/OWNaALnayGA
X-Gm-Gg: AYBFou0R/LslChsOvWizs60AIwwftVPQjPs75Ikg2ImxqDnW4n5kvOHynrv9ji0HVJu
	rKesjAdx8PGqm8ZPc2WdqAGBQHy8sFzOTfq5qdwjurNCX55+a2dfRV+V4+SXGDrEtkgAEXtJzae
	IPJ7NNdotuYsk/uF5b1GdLGwb3+8cah19FJbLurrFdGxPYim6SrIwPqLK+xZQpRpm97uxpBMbLv
	4Oj3hyyhIcOYJXvkQ13o0HMFhaHv+2klAYMdE0ce1ToL6Qr0TJw19HwJFjRrv3E6ZkP6+9mw+Z1
	ZDPAFNorgDAlxmlYEBAXgZoEUHHKQiQ0USWlUh+jxXRj+TUzDimA3a3YELc8vKVGQp3wJ385hjK
	mSRBd2DXiNeGBHN0KRk10HoItyLGKiB1bvgUbNC5hYoAJQF4VQqstH8uGMCNl0knJ4bpDxymrC/
	vBiRG2HIPVZ2xJOvQ3h18JkBSosxoHS/lnq+N363Ony0cAKZ7psuqsCbvUg7NSyei87G84VGSTx
	j+WyLg+DJurO3RIWskEg93iYJZ0WrcZtJIVDqOd
X-Received: by 2002:ac2:4e11:0:b0:5b8:99b1:4884 with SMTP id 2adb3069b0e04-5b8c1836e53mr3902709e87.40.1790087313390;
        Tue, 22 Sep 2026 07:28:33 -0700 (PDT)
Received: from fedora-tap.advaoptical.com ([82.166.23.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46d2064sm589691e87.24.2026.09.22.07.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:28:32 -0700 (PDT)
From: Sagi Maimon <maimon.sagi@gmail.com>
To: Richard Cochran <richardcochran@gmail.com>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Jakub Kicinski <kuba@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Simon Horman <horms@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>,
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	netdev@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sagi Maimon <maimon.sagi@gmail.com>
Subject: [PATCH net-next 0/9] ptp: ocp: TAP CPLD follow-up fixes
Date: Tue, 22 Sep 2026 17:28:20 +0300
Message-ID: <20260922142829.57740-1-maimon.sagi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Follow-up to the automated review of the TAP CPLD series, as Jakub asked
for on the v15 posting.  Nothing here changes what the driver puts on the
I2C wire: the ISP command sequence, the frame contents and the arbitration
timing are untouched.

Patches 1-5 answer the review of 3/4.  Patch 1 is the one with real
runtime behaviour to it: the CPLD identification read shared
ptp_ocp_sync_work() with the 1 Hz in-sync poller, and a claim that has to
wait for the MicroBlaze can occupy that work item for seconds, delaying
the dpll change notification and stalling the cancel_delayed_work_sync()
that ptp_ocp_remove() - also the .shutdown handler - starts with.  Patch 2
is the point the review rated High: the hand-back can fail, and the driver
would then cache and publish whatever answered on the TMC segment as the
board serial and id.

Patches 6-9 answer the review of 4/4.  Three of them remove ways the
driver could report success, or keep reporting an identity, when the part
had not done what was asked:

 - a latched FAILED made every later flash of a part that had failed once
   return -EIO at the enable step, before reaching the ERASE and REFRESH
   that would recover it (patch 8);
 - the post-REFRESH predicate was already satisfied by the state SET_DONE
   leaves behind, so a REFRESH that was ACKed but never latched passed it
   with the old image still running (patch 9);
 - the cached identity was dropped after the erase *wait* rather than
   before the erase was issued, and it dropped cpld.id too, which is the
   silicon IDCODE and cannot change (patch 7).

Patch 6 stops publishing the string "unknown" as a devlink running
version.  The review pointed out that devlink_info_version_put() invokes
its version_cb before the empty-value early-out, so an empty value still
registers the component name for devlink_flash_component_get() - which is
what a placeholder was needed for - while emitting no version attribute.

Tested on an ADVA TimeCard X1: the CPLD programs and activates as before
with the whole series applied, so the two checks that decide whether an
operation is believed - ENAB after EN_CFG_TP in patch 8, and ENAB clear
after REFRESH in patch 9 - agree with the part.  Patches 2-4 sit on the
hand-back timeout and adapter-lookup failure paths, which do not trigger
in normal operation; the hand-back measures about 670 ms against its 2 s
budget.

v15: https://lore.kernel.org/netdev/20260916153242.157171-1-sagi.maimon@adtran.com/T/#u


Sagi Maimon (9):
  ptp: ocp: move the CPLD identification read off the sync worker
  ptp: ocp: do not cache EEPROM content after a failed TMC bus hand-back
  ptp: ocp: hand the TMC bus back once on an acquire timeout
  ptp: ocp: forget a CPLD i2c adapter number that no longer resolves
  ptp: ocp: correct the CPLD bookkeeping comments and the flash progress
  ptp: ocp: report fw.cpld with an empty value until the USERCODE is
    read
  ptp: ocp: drop only the USERCODE when flashing, and drop it before
    erasing
  ptp: ocp: tolerate a latched FAILED when entering configuration mode
  ptp: ocp: confirm the CPLD really left configuration mode after
    REFRESH

 Documentation/ABI/testing/sysfs-timecard     |   8 +-
 Documentation/networking/devlink/ptp_ocp.rst |  28 ++-
 drivers/ptp/ptp_ocp.c                        | 188 +++++++++++++++----
 3 files changed, 170 insertions(+), 54 deletions(-)


base-commit: 10cfa109c880092df32e396647b4afdca9be8350
-- 
2.47.0

