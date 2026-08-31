Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E38380FD4
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 20:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206648; cv=none; b=jTZ5P71GrEK/jYbZ22kIqzngBLOsRAezFXOBvcZyf1nEFyseSEqG/S6h7HR9RDCgQ4lsVu/Py2kKfK9z8qgKeNFJfnwTFkKyXPnn0EpINW5mKYKrC4yhQZ1LQOmWOU31EK9TfBZcZXh0mr13snVVZJNsvscBeJUlSxOEe/tQ+R8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206648; c=relaxed/simple;
	bh=I4/G3HmEXJ4OVElGeCZxuKwSWS6iAiOY/MRgSX2ruGk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OnpoGkS4bbu41OC9I0CSmyyMgn+CiuBkoVTp0htzzkhWJiCYPJ0WzzeOjCCfQDLACUtaT3Yp6SWdjm3uu4beaJucayUffq3L+J8ZXum/rjFtnQFVpox2IUH46ARVfjbvHUWaL0VwEu8DfeHvW7VKecpTHrXIwmtldchvds7eAuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgqzQ81z; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgqzQ81z"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-482fc2b44a7so136021f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788206645; x=1788811445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=I4/G3HmEXJ4OVElGeCZxuKwSWS6iAiOY/MRgSX2ruGk=;
        b=qgqzQ81zhEJh2GPyiNOuPMkOGskPfeeAq0aULF0UsXs8suNQq3ozMHqKtz/JhIsT+7
         g1UsvfbXT5zDCc+ykExEY304yR/LHc+X7kbNv+vGf9VN3ZnCV9XV2CClZ9SEXGuFPXyw
         Yw3OUP+9AR5NdY74J/1iEt/WfSCXv9Y8XN44NWkN8rG55rpNN8Cl8bjC9TIh489pf6kG
         N5dpOgy92t7+BS6Bc/KSyPEnGFbE088CEWbwueLYd/ixrVqneD98Raqp1GnrAofgQc71
         IZZdKhH0Y7MV/aqGO1GGCeR91G9NzsuoQNT1PgyCVSbPv/jq5gYdvErmdRc6nxy68WBF
         6Wyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206645; x=1788811445;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I4/G3HmEXJ4OVElGeCZxuKwSWS6iAiOY/MRgSX2ruGk=;
        b=AyHt5bIcWk0AIy/3aZ7W3WxFmJVRMdd0XQmwCZz8cgAK5+gWZNCwmVNQQLWCKTqmeo
         x+sGVv9YQbZOcixs2jG300LjOOmI5raEKtwng+NJ45rLdmIwpufVESA5Tj/oVjAHMrBR
         AoI1j5y+xx29gkdrb+L2FCEG+U4V1yYlApufr1pM0ddOEVF66kOEbqB2A+2CmQZSO6EJ
         RmMLEOK9LW0ov8UEsqgfZMyTQy15fU7Z53rmZ9UTkKQe4+yrLYP9Im3/FVxSZ7sC089A
         yS5kzMipqJH8tfwBpEA2GqiVFd2iruN4F6o5Tja1t6/er+3Pva3jeFQEn1Prnxaj4Tly
         QMzg==
X-Forwarded-Encrypted: i=1; AKwUvBwFvfeg1aXeTaUb8um/S/rS3sAgQDRZ0he68C3/5fFyL486jZtdjPX+Jk0QxJlkYnwLp/kef5oZSb0=@vger.kernel.org
X-Gm-Message-State: AFuF++n4YvSgPXnwIu6KbrvdC/jkWvn7N1Pdez7k7C+zx//BKOr6m2Zw
	4VF3hlReWLQO61FA9T7Ys9PAEMth4aGUaefIhPIQGK9YjPxSYEylcpeIRu7tl6vx990=
X-Gm-Gg: AYBFou2E+UwEe1rxVuBzFFJX/3AoDpumZK7vsIPeVMyYKXpzkZ3391DJ2RHmbjHJZua
	LH3yc7Jmx8gxViOCYm20zI9Oa/555hzKRFuz/wEaPdKp7cWxc3HXkBTsGFtH1vKkg6DMPP3jYhF
	/Rlt3+Y8Cv1WJZWzD4JgUiDGguvFe1RhIGickmQxc7rwFH9sG63hvJLnRAmGq81m2BeMLwjLovV
	Js4GCasKnu/QcF13O9gH+lzzoiYFtKXlMzLQgvT73q1Qo+L4s/tce9O3URW+jqRFDwd4nb7zwFr
	LdqL+xaOLCjbcAdG3cOVJvIJlhRCFuD9bqTrbZyMtVwhyhp227roYFbLqwPwiZhtfZbq1XFRd7m
	dPojRwBzTHYeUqrSYzJYWW2Xdf7tgqQnlLr5cJ9UqM5WYONVcVzAt08yKR9jeDcMNMUgkuS82X+
	b6sU6FDcFVfLQWOwJt9urip1I1HCAd5C00HCtl/OVXxpbpm/ZG4q9Z5lOqFEPtEY4lp0mR4jy7w
	BuhZOnJrV++MuPygEk=
X-Received: by 2002:a5d:5d86:0:b0:47f:773f:2d68 with SMTP id ffacd0b85a97d-482f79bac52mr39529891f8f.16.1788206644929;
        Mon, 31 Aug 2026 13:04:04 -0700 (PDT)
Received: from christian-ThinkPad-T470.. ([2a03:4460:170d:5700:b1a9:fd9c:45a3:43b7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm125783f8f.15.2026.08.31.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 13:04:04 -0700 (PDT)
From: Christian Melendez <chrismelnu@gmail.com>
To: Haiyang Zhang <haiyangz@microsoft.com>
Cc: linux-hyperv@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: netvsc.rst: is XDP_REDIRECT still actually unsupported?
Date: Mon, 31 Aug 2026 22:03:57 +0200
Message-Id: <20260831200357.45390-1-chrismelnu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Haiyang,

Documentation/networking/device_drivers/ethernet/microsoft/netvsc.rst
still says "XDP_REDIRECT action is not yet supported," but
netvsc_run_xdp() in netvsc_bpf.c seems to handle it fully -- calls
xdp_do_redirect(), tracks stats, and netvsc_drv.c advertises
NETDEV_XDP_ACT_REDIRECT. This looks like it's been true since your
commit 1cb9d3b6185b.

Is the doc just stale, or is there a caveat I'm missing? Happy to
send a one-line fix, or feel free to just tweak it yourself if
that's quicker.

Thanks,
Christian
