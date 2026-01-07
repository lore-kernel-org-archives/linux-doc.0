Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF503A0B32
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 17:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767806156; cv=none; b=ZV8wDQVpN4cg6gJ3FZhZDsYDNq1j4eQlxBE33BootY62cfg1X0otc0KQl37PcuefM80oHxhNnfnKe0og26Pus1yPphlwIvcRAXTsroo8sqeqMjNZ/DlI37dmT2bqyjnPbBaBgpeBoo9mD3mtp+qdV/k8/T8s8KCh5GRsb906e6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767806156; c=relaxed/simple;
	bh=JZb4un39BlPP+OGm49xPg22uNlLarYMy/HsntlA1Vg4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBsb4aFfVao8g7Lcz1DqMA66NwuB2iHOF97lC1hiGtjcosz0zTU8QLtF5l7rbihSTBUrRXupsxL9tLx6PHOkKefAsl+yyFp9VitGRND05VQsvS2ScuXGeldNst25yf6oyI2wlHAuq0Fm6SYSrsvard0WDoJYgorgM1x7Jxr4l6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S1Tdu05a; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S1Tdu05a"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7f121c00dedso2186668b3a.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 09:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767806151; x=1768410951; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=txgoLEmMjHER+EBzHDKZOrkZdUQtWotXYsSwAupxNQg=;
        b=S1Tdu05aMINu7EWXhbu9Fmk7U0Oe/uu+LR9iNpt2hjSLWwaLGLBZswAVUtOZFar9Kd
         8Ji/s94o8xVRkXq8xSamEM315a9Wh7PMsaeCRFuvlCpyThvEbXHMFXwjT1XlUcX/tNt/
         kcYcneDa/38kh1ZNVnNUK20vrltqQGXVJEGbmQFhrUavrpWBvUWuVNyd9q0f+uGbmdhl
         jVLdvN+7MJmL6Sdb01jnmJr3eNr2227U17leD7WgWpZT835VaR0g1oEm7y1MQnpv6Yr0
         vAGigoLnFGdfQ0XaJYuXp1FergcsVOWv9s/cv00tPjerEFHFaUTxpFPhx48+c2XdkDU+
         ANeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767806151; x=1768410951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=txgoLEmMjHER+EBzHDKZOrkZdUQtWotXYsSwAupxNQg=;
        b=R9meuqgzLI71z1cGfLG8E87+1EVTVXBpJ/6P8rFtAR+7HFdT+t+02CMwZkf05w4i9I
         rHRuZZU/Da/DrLQ5NDJrxcMahE/kytB5LaNQV4TJ0xjavDx6Hbzj+8CEwWc8cG5jeW37
         ErGp0jd4EZNC1JLMOAI8b4b3dMEBXL69z5IY8L3cVwqKo7mCTunIovdGtLmETbJmhBw6
         vL2uhMJ1jXHm3F6zRQlHskFk4w5fr3sThJMHuvCkSeSdy2Mg/xNqF/b8/FDQmU1Ccs0o
         AQio7QWCMxB7vj8xDDCfyHKZLPYJN3bWXJjUJ22WY0sU2mOVrjdSTDhdRJCHzyd1CF7P
         LYeg==
X-Forwarded-Encrypted: i=1; AJvYcCVvRWDA3FAM9jvv/DwRx2LAo8uLNJf/1v7NTCPCcUw8TYwgL4R4xXI4J/qd+NPP3uAAsd6s2ee+TL4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb5mgXsmlEIaJxhU7zHu4MQpd6h5pjb5QqllnTVC0Ua4ImtUiD
	jWlmMngGHiQix9h5ERmoE/a9wK+xdc57eImTqrQZlMLdZSnRdF1ix4Bp4+E46w==
X-Gm-Gg: AY/fxX4Mrve1OTYNez9jE96qbDOFexqi+q1cMxTBf7Gs2iTmYIu7eAD6BLzeJ8bceri
	z7jN9iABO7Gst/sGmA9SvPXPqn9VKOdZAOb10iXfE+Uudyma2fXMUC9LxNBFV0plW05AUXUtc8y
	RB6sttMRWqeNU9KrWwIUI+nO5KaYEc/1WhgfgEdDzOn8ldE3EkKim107f0QPaBy/jNL8U1zkm+l
	QBcRCKOOKnY9I3N7zWH2ZDa9IVLEv1QFGhNx2LLZF2kOxP05+Nn2lyLBFfy9E8Z+lui6SYWbvok
	57yEK5jFlNIjaPB4XvGZVpXbhS354zFEaPJiIFwXLYmKv00dPt1W+SzjUktkQMHYtwmdO8fdMEK
	a7bNrIbG8hlkUjPdYiYwFrJPgMVLk8VSJicIRACc/A97mVFypkWs3iqJAJmGlZqVS5ig21TOb3t
	yD8+eWRff0HNL4VdzscU1UAwDND7yW2gw8tAYEJ7zRYqR0
X-Google-Smtp-Source: AGHT+IFI7aw5Hflr3Zesdi0nYazb40KN8jZ7mrRBERbvb07PBqlelReQ+seRv6/V7wYnwshvoEme0w==
X-Received: by 2002:a05:6808:144e:b0:450:b14:7a6a with SMTP id 5614622812f47-45a6bef2392mr1217539b6e.60.1767800088459;
        Wed, 07 Jan 2026 07:34:48 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e183ac3sm2398424b6e.4.2026.01.07.07.34.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:48 -0800 (PST)
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
Subject: [PATCH V3 0/4] libfuse: add basic famfs support to libfuse
Date: Wed,  7 Jan 2026 09:34:39 -0600
Message-ID: <20260107153443.64794-1-john@groves.net>
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


This short series adds adds the necessary support for famfs to libfuse.

This series is also a pull request at [1].

References

[1] - https://github.com/libfuse/libfuse/pull/1414


John Groves (4):
  fuse_kernel.h: bring up to baseline 6.19
  fuse_kernel.h: add famfs DAX fmap protocol definitions
  fuse: add API to set kernel mount options
  fuse: add famfs DAX fmap support

 include/fuse_common.h   |  5 +++
 include/fuse_kernel.h   | 98 ++++++++++++++++++++++++++++++++++++++++-
 include/fuse_lowlevel.h | 47 ++++++++++++++++++++
 lib/fuse_i.h            |  1 +
 lib/fuse_lowlevel.c     | 36 ++++++++++++++-
 lib/fuse_versionscript  |  1 +
 lib/mount.c             |  8 ++++
 7 files changed, 194 insertions(+), 2 deletions(-)


base-commit: 6278995cca991978abd25ebb2c20ebd3fc9e8a13
-- 
2.49.0

