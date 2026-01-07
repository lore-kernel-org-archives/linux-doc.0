Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32987399A51
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800108; cv=none; b=i9305F+UamDxOcQ521FSa1/58O2yBFEclcO0KAsWjO5ikXPX1DrFf46nqtqY7CKu1aSvm3NXy5t6ZQDStyExlGFINONya8NIQxi64YhH9hs/1inJIscBTV40Z6OI9e7xE7MSZn537xyLBxasI2YEU5LWD79vgFtT9TW/O21tnxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800108; c=relaxed/simple;
	bh=T7kVRtDmArs/KXDA6UJCem652WSoCrheiHFH0MGwghY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pArq35ib6AzwU/pOB+LObkCW+Ebrf8mrjErcwcZIxQ5uKe3MXA5gVx9Befc6uiMcj8pZQmNHVd6Sh+pBfzd/rvdHa4IJienELR+z6acsUGPlNYWimnavyonZID9CrWtc/MB8oyBFN5Saw55ZrEqPTvpP9A8GExLO2eV37W/dS1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YDPCSqem; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YDPCSqem"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4510974a8cdso1184382b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800103; x=1768404903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BslOQ1R3lDLc6puAK0BHaW8erjjx+/BdZBfKYLZomH0=;
        b=YDPCSqemylFWmNwdjKiZbbsOOgCFlGMOQ8D2s3DoBh9Ec1OJySrUIl+Cxh2KSzoIEy
         DOgBy0FkMmE6N1IRvUR54I8X81N2RaRU1D1z/Ry7dzX3XihM9cSIFbXHMktHpgoC4zBg
         qDcNJM83RQWK8owz9yVS7sCzFoOKpCJXyWwAfcf8iKhFXZ6Dx7Dyb10ObDj3zgwmFIvg
         126babvo7OwhKeAWO/Bj9M3xsT0Wnp+ziCpn5C5pNljDsUKMIdfqIPdMfCyapwnpgkl2
         WU/y0n6uqgLl5pkw/g/coF5X/EzQHlzms4XOHgOi0aNTkaM4dj/1e2c2BZRyWbMnfN7q
         0K+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800103; x=1768404903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BslOQ1R3lDLc6puAK0BHaW8erjjx+/BdZBfKYLZomH0=;
        b=rwLs/yne+64nR/lKkH8Z1OFt2I/bpStn/uoapGVgWGDhEzYkEytq/eW/uqX07vRrxM
         s+ajQDLskn6TJQjalY5kXXWtVElAv4r1LmvsSE+W9T3FDzYTLpCuuuPzjsk92RlX0LRp
         PZ7ciAtidtI3dUoyFX1P7JKY24j2W1WEbZ8ln9ybzraL9c6NxscAK3W8DwkHTGugw0CF
         jIbkj4EW5WTQtmrm6cpBQsktO5ahP10iT6zLj3areFrzWsgWm3Luuh+2dvXJjrB7UaFg
         KYxYgG6VHdZwnmHnT23/KbDQJuV6VjmloJRT522Wx3Ns9odhYcQZKa7p7noarrK++SNr
         4cjw==
X-Forwarded-Encrypted: i=1; AJvYcCWRin7Ow/YvnYCi2vFFSi1Nxa1icE+VYuICHMUwuB0KLM/jpuxGN1c7ak0uK1N1MHrX6k6XPNykpOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7nJqW0Ye+wYAk5DIZwW5i6iahlP8uuVFtXAPTTqPIs2dmLZh9
	A4YP3vrI3+qF5nISXx0RXH/HQRKykbsKlxeHy5+FKksdMzolLa7Kl4/v
X-Gm-Gg: AY/fxX6IXQqfRO85llMw5JYy1UJNbIYaucw6GlOdvPprXCP2tYWhMKAVBBccxoMYc2w
	ORxe826tfkAs/UhQWxMPbT+CUnzru0vcSFMgDmvoIWHIPDkyz+x/TdsjBhYuvnjK7NZIi2ZMUvl
	L4Rc88hhBEdvjRPUZxiVB8YXCzJtfh/DDd4Z/lcXihOM0iFlIGlwz50AV/VGeuRapsD2SNSsnRy
	WFsOLZzmi1GGazunrjK6N+3cq918hnzdi0DuAFDE3Ka8rGgHj2qcmnWhe69itkns7o7b3FdHrTI
	njRTK3Rtim29SQDUNLC7+DmFsYE3yFxWHpjJScB3E5MwwpAscp1R3saWXH7yx5O8+5dlWY01tAF
	THBRRQOzccFu1GSwX1WgMtywzNwkMhGOPo4Y94J8899Ahuk/bwMl2wIaExMWcWTpj/4Seg16bLy
	lCC9z528F6mbldbaHNkr8BuE3/mmO4CIdA7pFlPOQaZb0U
X-Google-Smtp-Source: AGHT+IFJGITn60MlSGetG+LZu+Db9CCtjDGtz1GjRDdVPE59eX1t6Y4D5yt852Xe5lWy1d4GVHK31A==
X-Received: by 2002:a05:6808:300f:b0:44d:badf:f449 with SMTP id 5614622812f47-45a6bd18773mr1110582b6e.1.1767800103393;
        Wed, 07 Jan 2026 07:35:03 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e183cd4sm2415499b6e.1.2026.01.07.07.35.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:35:02 -0800 (PST)
Sender: John Groves <grovesaustin@gmail.com>
From: John Groves <John@Groves.net>
X-Google-Original-From: John Groves <john@groves.net>
To: John Groves <John@Groves.net>,
	Miklos Szeredi <miklos@szeredi.hu>,
	Dan Williams <dan.j.williams@intel.com>,
	Bernd Schubert <bschubert@ddn.com>,
	Alison Schofield <alison.schofield@intel.com>
Cc: John Groves <jgroves@micron.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	David Hildenbrand <david@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	"Darrick J . Wong" <djwong@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Jeff Layton <jlayton@kernel.org>,
	Amir Goldstein <amir73il@gmail.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Stefan Hajnoczi <shajnocz@redhat.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Josef Bacik <josef@toxicpanda.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Chen Linxuan <chenlinxuan@uniontech.com>,
	James Morse <james.morse@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Sean Christopherson <seanjc@google.com>,
	Shivank Garg <shivankg@amd.com>,
	Ackerley Tng <ackerleytng@google.com>,
	Gregory Price <gourry@gourry.net>,
	Aravind Ramesh <arramesh@micron.com>,
	Ajay Joshi <ajayjoshi@micron.com>,
	venkataravis@micron.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	John Groves <john@groves.net>
Subject: [PATCH 0/2] ndctl: Add daxctl support for the new "famfs" mode of devdax
Date: Wed,  7 Jan 2026 09:34:57 -0600
Message-ID: <20260107153459.64821-1-john@groves.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260107153244.64703-1-john@groves.net>
References: <20260107153244.64703-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This short series adds support and tests to daxctl for famfs[1]. The
famfs kernel patch series, under the same "compound cover" as this
series, adds a new 'fsdev_dax' driver for devdax. When that driver
is bound (instead of device_dax), the device is in 'famfs' mode rather
than 'devdax' mode.

References

[1] - https://famfs.org


John Groves (2):
  daxctl: Add support for famfs mode
  Add test/daxctl-famfs.sh to test famfs mode transitions:

 daxctl/device.c                | 126 ++++++++++++++--
 daxctl/json.c                  |   6 +-
 daxctl/lib/libdaxctl-private.h |   2 +
 daxctl/lib/libdaxctl.c         |  77 ++++++++++
 daxctl/lib/libdaxctl.sym       |   7 +
 daxctl/libdaxctl.h             |   3 +
 test/daxctl-famfs.sh           | 253 +++++++++++++++++++++++++++++++++
 test/meson.build               |   2 +
 8 files changed, 465 insertions(+), 11 deletions(-)
 create mode 100755 test/daxctl-famfs.sh


base-commit: 4f7a1c63b3305c97013d3c46daa6c0f76feff10d
-- 
2.49.0

