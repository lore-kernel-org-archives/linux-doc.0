Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3A444A404
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774896; cv=none; b=SAXqIzXc9IsePwrmtSG7FlscqqGXKN82rlIA4yuQ+RsYUlstMGKNkBFCD5TE6xkevd0uBz7OqC4bQgvhhmkm1800U0zT6tYvKPg1FV0PT0A2rTzFHr+hlLXZm4iPWt9C12rJRzHjIcs9/gg82CAjAzA4nWxbUp9dBZcF916kMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774896; c=relaxed/simple;
	bh=m1ip0be5p6K//25N2xI+s07kjlY0PpGTuRk26Ygx5rA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ctqt6Z9Aj53KM2xSOtQ3Sm9mEIV9biWuWiqI5Sh38ZVFsqKMNGMvgDBVUgoqXWieLEV35UkFiA21tOhRwOKopkTWEZ3LjYIQw8Zr9nBMQewdTllLNt5FXqwVLcVgvjozazxrvOj+i8I+o654JbY9Mv8sahwk/Tg2Zo+ohlG4l0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cmSsXUQp; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cmSsXUQp"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cbedd5aece4so3020453a12.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774893; x=1789379693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tR97cmi0NkWDiEH0s6YYBJjyIYeR1zRd9pdLJfF85lM=;
        b=cmSsXUQpyoAx4etzE8XRFvUYbYy6oCmXSRHL8doQHGhWFwrXtoCXT3JAZG9sOXk8yO
         SCFsceMZbXcMCYUR5mT/+rwu/HiID52NodrCSjDLWKnbfSOTPDs7W0T/7t+NoVvAgwUK
         c1Blt7jkqGa47Kqrw+NSjQ1oUmyRdVRGpv9tI0FN60m/w6VAlGFEQ0dQiC0SaYjl3Hjl
         4KRc8O3ktxwTRz0eootcBGs50mXYo7WZfX3JmR1lizeN/Ocjaz/6g2HbFRJtW0DivuZV
         4daVyhqSyTB5QrzL3U3Bwv3RKLwZqVUyXX0L0wlOymvDIbPmtHUzBWOMosMRknMVWh7K
         pzdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774893; x=1789379693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tR97cmi0NkWDiEH0s6YYBJjyIYeR1zRd9pdLJfF85lM=;
        b=CJBvAGJ6T5uzj2u3uaZtiEFu9m7p51jBloxzcV8HMP0zo0xkVyFSnZAECjcWtydW9f
         845CmLvq67PmtAlj8gzh/tapT+sJBURJJ9m8FKI4KpgUIMN4IEUbA303sA3llxNnGYxd
         9gEcRMxaO08TukBWHnHpDniIbbtuF0pIfNqykwgX5yzfJxm0z8ksrgE9Pm+jABsKuKNE
         Dgy8QJ+G1yXjW9ERrXni4aB/IEMf05HwWB+7QtNK1zqpzQXUHPFqNrq4aoV7ZTyDJBj1
         jFMuPq1WBncR2hM0AyyvT4p6BoSNEjKAWFrbAIhGRkVl9LW+C6slIMPWAgLuInuLwP4+
         HYsQ==
X-Forwarded-Encrypted: i=1; AKwUvBybU3Gl1UVrmNr+23r9YelyWHNuEw44MksqXXHh873DfcVdXWd3v5cwhtS4hPatLl75y/zTpx6n6rQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k/5LXofJvC2UzEEYimhivwNlBjRH4LMi4Xo92e0rOpfenzbwK8
	yUmzAcmywANI0p20AH7TNf+2HSijdGYe8Vf3UGfqB4JoDZqemFqZ/01L1qqMjphV
X-Gm-Gg: AYBFou0tmQ6H3L4/Cqyq5fI4r2hW/i34NFxAeAiyZtFP/fscYQfu8AiQjs+yIoDuCIQ
	tVaFl/5x5p9bh3oisflK6N8Ev12OMakBW/PY+tIcYuQ43uX/lhT3852G+MPD6z187C/a4sKF5Yi
	PoUsgDm0c1SoMbelo8OWgdwVWh3V/SAV8P5oIe06AOXEMe1Rv5XpMid2ibIUkBdy/xwceqzbate
	VC79nsYgPm20p2jW7u0sa3U58PLQ3STRMg1OIxbGA0uTeuobzHYob8iOIsKgCEAvV73yHJGO7Ir
	QTbYfTCa2rLyOkcW61XtxpWn3iOHVCftzt1d0XbFxuSG6Ews6odyK3E68ZhTn8noZQpVU1BsmTm
	jEltpUrm4UnSI1gnkpPZF3hWrkdLOShM9dyDJqoRkgEVsQuXxzBebDkRXdfiG2SWIX3yfCY6LJE
	u7VcluVt7ZKlnOuF+Iu7zVFIfAPyZQeSgFgkrh8AVhfkeU1FpjfdxOgu+FnAkvR5wTuFCP2YA0r
	+gpe6E1OkRksQ==
X-Received: by 2002:a17:90b:3fd0:b0:36b:de66:92c3 with SMTP id 98e67ed59e1d1-39b07fed101mr30328985a91.10.1788774893379;
        Mon, 07 Sep 2026 02:54:53 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:54:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH iwl-next v2 0/4] intel: fix typos in comments
Date: Mon,  7 Sep 2026 15:24:42 +0530
Message-ID: <20260907095446.27290-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Comment typos across the Intel ethernet drivers, split per driver.  Found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Comments only, no code
changes.

v1 went out with a bare [PATCH] and a "net:" subject prefix.  As
maintainer-netdev.rst asks, v2 designates the patches to a tree, and
each subject now names the component it touches instead of "net:".  The
series is rebased onto that tree; the diff is unchanged.

v1: https://lore.kernel.org/all/20260907064528.6602-1-hemanth.selam@gmail.com/


Hemanth Selam (4):
  i40e: fix typos in comments
  ice: fix typos in comments
  ixgbevf: fix typo "enble" in comment
  Documentation/eth/intel: fix repeated words in comments

 Documentation/networking/device_drivers/ethernet/intel/i40e.rst | 2 +-
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_common.c                   | 2 +-
 drivers/net/ethernet/intel/i40e/i40e_ethtool.c                  | 2 +-
 drivers/net/ethernet/intel/ice/ice.h                            | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c                       | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c                      | 2 +-
 drivers/net/ethernet/intel/ixgbevf/ixgbevf_main.c               | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

