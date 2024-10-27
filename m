Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B18A17BB25
	for <linux-doc@vger.kernel.org>; Sun, 27 Oct 2024 20:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730059239; cv=none; b=u8sZNaQeCGVPkc6zZ7FxHMOPy8m+HgR8Uu/mrbDGF+qbpQlqu4TI4y+WxhjUMzMFrV+4uNTIuB3lrYUVfl6zEm6rv44KPMMXCrzh3UCi1c4LHmjZjwXseUmmDqXaOA5y/nM6RtDJ0NPKU2Ja9g8PLmGvMDFyfrzsUyd2NgmUuXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730059239; c=relaxed/simple;
	bh=HnC/YPSHeNYM8IsGJsmyJAFQYRswBMe+vOP4b93Fgr8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hd3VwqrdTDe+pt+sk4TkItTsNoj41qAKLKAKJItf7nd2LWXJUA69kIfMeuUKVGJtv+LYnRnHdepN/hohm7mRdgymBkaQUMaHpsHk2UmrrguNKDnfosFCTG689SfU/s7r7INvrMJDFBHsUjeBKmeBGykswnhSFSmUKBVvBkRyO9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com; spf=none smtp.mailfrom=kutsevol.com; dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b=oEDRhVzo; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=kutsevol.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kutsevol-com.20230601.gappssmtp.com header.i=@kutsevol-com.20230601.gappssmtp.com header.b="oEDRhVzo"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3e60f6ea262so1735590b6e.1
        for <linux-doc@vger.kernel.org>; Sun, 27 Oct 2024 13:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kutsevol-com.20230601.gappssmtp.com; s=20230601; t=1730059235; x=1730664035; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoy0+G1B62y4A0aPMtVHcQS+DKaSVd+7u5DUTQklBRA=;
        b=oEDRhVzocnC+AMmA35nACpiaVpcC71E6YZ8PPuzck9YNOBbuKMX3/dsvsFzKRZqlA7
         JFpvEfAqDtuRdySsZvqml7Zmyeo8tessGQp0TdbVleUBggfODENUsPI0K7KbA1Oi1yW+
         gpA1CHh26+YnHCW+G9aVIARQtSnVkTP5xPD2U+b2qX6mrQq2ztM8/4GWnWiACzKz6rsa
         yVBx07StjYG1Ct3Wbhum87pOgbAtWbdJp49WtjAZtEaFyLhWVlClGx3J4QV58AmXJwa0
         viNOXHxSbsnxUEGZv2wGIEaycpD6TGOVrs+I8DYFDJx5kn0hk4VLzMWf+3iOUWJ+iok2
         GHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059235; x=1730664035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoy0+G1B62y4A0aPMtVHcQS+DKaSVd+7u5DUTQklBRA=;
        b=U43cUK9fg7Yz2R+0tkvDUeWQzyVzMKOQly/YHSFe0o9ZaHjFeqnPs3ifXfk4/KbMs1
         1iuJQzY4kxFJJWy6vWsQxr5kxOklk1fVwBu7iCFYuJ6rSx8DZHfvXi4JkB9mkk2Tg8Ga
         TtzTHUOGnkSPdS2hnrnxwpLpxSt8CpWY3j8BnARdF6Fl1y4nOO44krCjfxndZKUZwRKt
         etruxN9CWbiKl61YxTrlH2/p6G2bWGSneiguONafes18esDqQz/ILm0DpFfFh/ke8kdK
         E+iSdDaFWUEVya+LPbAJP36GOO9WmxhSOBZvcZENsDfTiFYwyJHQCjcDimRqeqZC11aU
         PO4g==
X-Forwarded-Encrypted: i=1; AJvYcCX7nbjS+P/+ZlX+EF53VVRF/Z9JZePQ5XrJYMnO+T1bZZZPCUHFpNcj0Z0DxyLdyzRIFhv1nYkoQgo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh968FnISL5Q2TNV1dI8E19bAMvGvrWPPqlYlyM4GnMbusTfxR
	/as4A5x7YCsPvbPMCLFdAHkpOZsrnfWBZO96hoenei0V4uC+RdPDVstrkqGIiq8=
X-Google-Smtp-Source: AGHT+IFbKUZ7FnBC2Wao6JUPJhNSJps9AKvrtUtqDnBgQVi+QfoNxo39LrQXX2TIC3JIc1aepdLG0g==
X-Received: by 2002:a05:6808:2dc6:b0:3e6:40b3:e525 with SMTP id 5614622812f47-3e640b3e88amr1601921b6e.41.1730059235127;
        Sun, 27 Oct 2024 13:00:35 -0700 (PDT)
Received: from localhost.localdomain (fwdproxy-ash-017.fbsv.net. [2a03:2880:20ff:11::face:b00c])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-461321431a1sm27946241cf.25.2024.10.27.13.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 13:00:34 -0700 (PDT)
From: Maksym Kutsevol <max@kutsevol.com>
Subject: [PATCH net-next v4 0/2] netcons: Add udp send fail statistics to
 netconsole
Date: Sun, 27 Oct 2024 12:59:40 -0700
Message-Id: <20241027-netcons-add-udp-send-fail-statistics-to-netconsole-v4-0-a8065a43c897@kutsevol.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKybHmcC/zXN0QrCMAyF4VcZuTaw1YnUVxEvQpNqYLSjiTIYe
 3eL4OUPH+fsYNJUDG7DDk0+alpLj/k0QHpReQoq94YwhnkawxWLeKrFkJjxzSuaFMZMuqA5uZp
 rMvT6d3UR5BTpQjHH6RyhD69Nsm6/0zt01+3m8DiOL+5Js9uOAAAA
To: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 Breno Leitao <leitao@debian.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Maksym Kutsevol <max@kutsevol.com>
X-Mailer: b4 0.13.0

Enhance observability of netconsole. Packet sends can fail.
Start tracking at least two failure possibilities: ENOMEM and
NET_XMIT_DROP for every target. Stats are exposed via an additional
attribute in CONFIGFS.

The exposed statistics allows easier debugging of cases when netconsole
messages were not seen by receivers, eliminating the guesswork if the
sender thinks that messages in question were sent out.

Stats are not reset on enable/disable/change remote ip/etc, they
belong to the netcons target itself.

Reported-by: Breno Leitao <leitao@debian.org>
Closes: https://lore.kernel.org/all/ZsWoUzyK5du9Ffl+@gmail.com/
Signed-off-by: Maksym Kutsevol <max@kutsevol.com>
---
Changelog:
v4:
 * Rebased after
   https://lore.kernel.org/netdev/20241017095028.3131508-1-leitao@debian.org/
   was merged
 * cc doc maintainers.
 * adhere to 80 columns. Learn that checkpatch defaults to 100. Okay :)

v3:
 * https://lore.kernel.org/netdev/20240912173608.1821083-2-max@kutsevol.com/
 * cleanup the accidental slip of debugging addons.
 * use IS_ENABLED() instead of #ifdef. Always have stats field.

v2:
 * https://lore.kernel.org/netdev/20240828214524.1867954-2-max@kutsevol.com/
 * fixed commit message wording and reported-by reference.
 * not hiding netconsole_target_stats when CONFIG_NETCONSOLE_DYNAMIC
   is not enabled.
 * rename stats attribute in configfs to transmit_errors and make it
   a single u64 value, which is a sum of errors that occured.
 * make a wrapper function to count errors instead of a return result
   classifier one.
 * use u64_stats_sync.h to manage stats.

v1:
 * https://lore.kernel.org/netdev/20240824215130.2134153-2-max@kutsevol.com/

---
Maksym Kutsevol (2):
      netpoll: Make netpoll_send_udp return status instead of void
      netcons: Add udp send fail statistics to netconsole

 Documentation/networking/netconsole.rst |  5 +--
 drivers/net/netconsole.c                | 61 +++++++++++++++++++++++++++++++--
 include/linux/netpoll.h                 |  2 +-
 net/core/netpoll.c                      |  6 ++--
 4 files changed, 65 insertions(+), 9 deletions(-)
---
base-commit: 03fc07a24735e0be8646563913abf5f5cb71ad19
change-id: 20241027-netcons-add-udp-send-fail-statistics-to-netconsole-dc9a5a9f9139

Best regards,
-- 
Maksym Kutsevol <max@kutsevol.com>

