Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794323363;
	b=PYh0DyZSxm7DAzk8+VxZlfiT5DFZCBycWZhYsR0k3jBLsmsiVz7r7oR5z0L/qMe8hmy3
	 2V/zc6jupJ+2Xz9tNgd7U2g+N+sdhU157z9lY4BWg3MUC2lalLYTA8Z663TvXzF472tmj
	 H3EcOjQPVyrTWLqXKaBs855ohQhojghQknaIMQSgQSE6xvOP4PsBkku0Ocn8b76xzIlXr
	 UTNzNfbuiA+SCdcDEWExHhurdQtwakrRSdlfznvSpBQqYXI3GljXxA82QTkhdVx6Vv4Uo
	 93AuoN52+BYy9ugvNeGs7bi81qwZmPIBhAzwT2qmUTNqYDVVhk3CPYp2TDDn2cT7aEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794323363;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
	b=RDh2SAsX7UXlkmKEDE4MZDzCSMErmHmuQH2auOv1QXJhMsSAacDIwDBGlDr6gY4MjWIG
	 n1HXKZ60elV9L77HR2CE5OC+5pIuxtKyxK3fFg4i3uZ5Qko3oH2QyXHmPejOLSyKSYITw
	 X1QNDqWks0c598q000m3jz5rKrry28JJmW+p7UikIUK6PId4KoenndpMHT19fSOKzhqmH
	 hHXuqcpqyXCctqYCOl+D05zOvaSUd6i+3Kc4xPLcKCvp7QDD2vRjfDwQtFQG2AovB5XFl
	 niHZ0v7nUP7QE9JF43jkNl4mnBA4kqjmACB7srgyPYNBgm1N1XsbpJxhUTRkpbS1mRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4QpF8ou;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01487606A323
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 15:09:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01487606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B4QpF8ou
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so2621675eec.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 07:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794323362; x=1794928162; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=B4QpF8ouB8Q6nBzEB/Q7sZusx5i7sWZ5TsA820PHsIelv6zqt9zXo3py/jnQI6nYBh
         eivnC71PPNFzu0zyymC1VUVPS1qtNvwBB7itMcUZ5Yr6wjwjmOzR9j3Y2xM5HoPNJGUj
         eKHQJTCklWk3jvJoVhr0gbzXe8e9p9z3kqOirY7n3ZdbVWyjgQfp59L9C6CLxJE1H6x5
         ATjVNFtlJOVN31RSDy4KeQnqqZqSv1N9xMB1ASaZlsB4H2cqOpOZvgzowtKtf+sK5xk4
         /J6Zqc7N5alDJraLGQ0oIQWRHbR/8ccv4ynPFNGIdFYPPhwo6IGR7ZxD3h4s/82ZbT9x
         ZxCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794323362; x=1794928162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rW7wY2dSAmljd85v6jjosIWS8OLneAfUfN99gDJ44Us=;
        b=rnYajtUkTzKsdDXAHuqwUkwhaD09j+gs7qhvag0zHxQCe1HNTx4O2DuO4IIZ+ke3nQ
         dOtBwk5+ukTdxEtMVFRkNVPMBmr7suPsI5JUO8CrmUl70DsnXVWY5ht1l6KlU+6mVPyp
         ijgu+VqnnQU1XdC7HNGgVfKxddrevdTCv4VzNcjiUm1FqaS4ld+0eWOZ+WU1cmnA3aTj
         17M+bZqXhb/1hwHuSJfYlbBwzWyf8Khu2o9eXg2Cp2+uk3uFO6ziRwYuXzKeUSpS+PgU
         vPUubk9+Hb9Cen8ktsofdflQv+dnj5QhgQE8SazudwJqNvgC6D62w4LyTM2Zz9OSbyKI
         k3SA==
X-Forwarded-Encrypted: i=1; AL+hErE2VFlE5PvTVfF64Kq/TcDqGLzXxflqIabBRQf0wdlgnMVnvUZEMywSdYoEgCoBPdr8CNKYtdV+GwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+feWanmgvBN7ViutkQlsd1/8KWWWhh7eDTB/WmVt9jyZ299hYP
	mHp4Ity/M5NiR2R+U5JqfHaVS+rS8dfJq53oaaoUcsvqmjqvouRqjTmCUaEzVmlh
X-Gm-Gg: AYBFou1GP35Q/P0+Y1+jJK2CHQVVV3seXgWTk3yxG5dqdarQ2uzPwoLQzChR8bVw35x
	PkJl6Qi823BwvzNWlK4vjShdMk6/vf1UAI9cTriw6dCkUB6Lf21SD8AO4zj+2x9JO/6uHP9O8/J
	UQIO9YZaToT7Q97AS6oa3TatdOZbKR4sheiEOLYB6c564qk6P0eHxGq92GxfaRxIiiSU6Ba2rnQ
	QaSFz0PSJRTBYhWPWAAOm24IruW4TP1+0zlEAHrk7CLzbLxgob8kZATrXN0vlmGiaR0h3B+LAt3
	wgxSHJ+nQSiY68hd9rVuo/zpuL+E6YSp6/dKlM/4tDrsizfp6ksZ9mE77g+MCGPVz29Llvaf6/u
	y1rrHO7zmPod86R3+fG9rOyBqNk8ubnnyix0hUYxg2C2Jz6wBz54Qpm+1LiDo6xNQFfWA85zeol
	CPT0nMPqUOGbbSmFb5K/r3XDjDkb9zvD4BZqa8zdWweJcs70HKgT7KWOONik0voPlEux9h1ocEH
	WwS1p/6hlpGCHF2jYKcbM7y1tAyBvIMZqeYio+JGncP6nxy0B3oz7btdenHYABXTnukOAvYMt8K
	KOtAzre56aOUqJucg3KATPIYtVGFcfE0VH9NraUmAaAIF3D0
X-Received: by 2002:a17:902:f644:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2edb924c692mr24302405ad.61.1794316877150;
        Tue, 10 Nov 2026 05:21:17 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d4a31esm8861065ad.22.2026.11.10.05.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:21:16 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	dave.hansen@linux.intel.com,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	hpa@zytor.com,
	james.morse@arm.com,
	jic23@kernel.org,
	mingo@redhat.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tan.shaopeng@fujitsu.com,
	tglx@kernel.org,
	tony.luck@intel.com,
	zengheng4@huawei.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [PATCH v5 0/7] fs/resctrl: Fix some resctl bugs related to mpam
Date: Tue, 10 Nov 2026 21:20:47 +0800
Message-ID: <20261110132054.3702-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Fix resctrl RMID allocation to report a retryable -EBUSY only when
the target CLOSID actually has RMIDs in limbo.

Split the domain-offline path out so it releases busy RMIDs without
allocating a monitor context it never uses.

Also unmount resctrl with the CDP state it was mounted with to fix
another bug with mpam cdp.

And do not allow monitor group move when the RMID index changes.

These fixes are split out of the v10 Narrow-PARTID series below.
        https://lore.kernel.org/all/20261020134239.3921377-1-ruanjinjie@huawei.com/

Changes in v5:
- Update and split the patch as Reinette and Ben suggested.
- Adjust the commit message.
- Add Reviewed-by.
- Link to v4:
  - https://lore.kernel.org/all/20261105070934.2258613-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261105123524.2282090-1-ruanjinjie@huawei.com/

Changes in v4:
- Fix the unmount resctrl bug as Reinette suggested.
- Adjust the commit message.
- Add Reviewed-bys.
- Link to v3:
  - https://lore.kernel.org/all/20261031063634.1678345-1-ruanjinjie@huawei.com/
  - https://lore.kernel.org/all/20261031094616.1691026-1-ruanjinjie@huawei.com/

Changes in v3:
- Add Reviewed-by.
- Local varibles uses reverse Christmas tree style.
- Update the commit message as Reinette suggested.
- Link to v2: https://lore.kernel.org/all/20261030092144.1233551-1-ruanjinjie@huawei.com/

Changes in v2
- Update the commit message as Reinette suggested.
- Link to v1: https://lore.kernel.org/all/20261029081513.924019-1-ruanjinjie@huawei.com/

Jinjie Ruan (6):
  fs/resctrl: Report a temporary RMID shortage per CLOSID
  fs/resctrl: Do not allocate a monitor context when releasing limbo
    RMIDs
  fs/resctrl: Clear the CDP state after the cleanup
  fs/resctrl: Stop the limbo handler while resctrl is unmounted
  fs/resctrl: Release the limbo RMIDs when the CDP state changes
  fs/resctrl: Add info/moveable_mon_group

Peter Newman (1):
  fs/resctrl: Disallow monitor group move when the RMID index changes

 Documentation/filesystems/resctrl.rst |  15 ++-
 arch/x86/include/asm/resctrl.h        |   6 +
 drivers/resctrl/mpam_resctrl.c        |   9 ++
 fs/resctrl/internal.h                 |   3 +-
 fs/resctrl/monitor.c                  | 151 ++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 |  50 ++++++++-
 include/linux/arm_mpam.h              |   1 +
 7 files changed, 196 insertions(+), 39 deletions(-)

-- 
2.43.0

