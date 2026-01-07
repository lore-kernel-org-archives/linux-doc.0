Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BB538A72E
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800052; cv=none; b=gIVwrTBjPpQtVnYKMU47R7VnUWVF1gyWwpUV/o15lor1Ku0aluMWWfY/u5sJ42AFz45F0dvkjxl+0SNsjnE0EKixV6FBHRa1r2DPtucQviVEet0Fl4FD2fwhadbyzx9RrekQ9LvCmmkBz5WFGQLZVYOZG8+QFtcJk8gC4eNWmqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800052; c=relaxed/simple;
	bh=4TXKGjJAeQJwDyMsPwSGTtB9EZ4t0ayfW9/mqhAX0Rk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m9oF/jKUUJd1dSo/3KEbw2tz8ekBMeVpdtm9PRduMK7SzKNgCjHXBVm59H1x/+ZV7Utlbh4+ZR53nUhJeCthQ7W1pm7vMCLZCLOyJbm6QoSHcSgz4MSIFGvKvVmMH75L6M8EtPD7K/hh5zFu/uF06m+nG4fccHPbTIsOFAUW+Y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cgf62Zsk; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cgf62Zsk"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-459ac606f0bso1285333b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800050; x=1768404850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xsoizNZgLZaDBPInQieK4jd0iMDgMqPyINA++t0nMgM=;
        b=Cgf62ZskAjdt/2L9b76VksAj77KbHek0naYG1vY1XQe23J4K38Nz1m/K740Rq7OlVo
         zLrwDRz5pGtWlCx667y+8EAUB273ZdeuzKrbxsBY+oNeTvu0SY49seTPDl4AvCkc8QPB
         uVImzIVQC82a6q7azDL99a9d/fyPNfahq1bHxWIqZ5uJEJhv9t/1KtKG/fEgSR2DBKbI
         Zb6q4dOJcfuXVbsGmRwaBLvw0jmpHd/yl3zjhn96IJqrWRWoY6C8HOTfAMH/wye1Rhb7
         NUlMbF9S8UQ3rFA1t0Y2ei35zezVqIdTn9oGDJu8+NiTbR7w+V0CavvAqeizpWdW2KCX
         SePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800050; x=1768404850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xsoizNZgLZaDBPInQieK4jd0iMDgMqPyINA++t0nMgM=;
        b=SWlYxomNj0OtMkt5/6G6Wld81mY7BavPUVdgi5ygmU2rRK+atJ7KY3eMgTSwVYIG8I
         0UEHywrwEypb0lObzY2MCyrsOKEoiGZGm81whrvtzfzDb1/caJrDPzVkAzyJXp8FDmPS
         H9hdMIHAJvk/imaJOCoy77TB7czISv+Bd9PEqP/zQFKpf0sFnhXJ7QeXbDtpj3mNAbQ+
         tcWH74Boju5OrQ+LK9wkWYBTzUJab2JI9oyaF/puHq5ajvtfq36zOiQRgisW3qNyajUb
         T9G/WLfGhqWFLveoNuCGity+ZH8U+H1dH9D9wSXUfAh4SDYUvhqEoPx53A6zaTI5dhld
         jI7w==
X-Forwarded-Encrypted: i=1; AJvYcCW72cJbEpF6yaXDiTK51jRWLGpstawlSOAga3lE9kIVo+gZy0bJmkXoD5CVv4cP01XKXeHxnk/yWJU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8gwqpCQnBdtKC3297Igi+UmsIwBdGtYU6raOqDzfj0sQJESse
	ztgz4WC5f/rYqXAIRphEsRWuKvl7BAuN+x8o63eVstHhiKYMkSFae5A1
X-Gm-Gg: AY/fxX7kQLGv7ymNlZRCcRLsJQheZ8psNTBt9F7k/SYpVvVrDzyvknfehTTZVqFPE5Y
	AySCUCcLuzBeE4FO47uDf+3qX/jwHKjFQealLqlGpZ/+OeESEobl7jZ1BY0ZgHZzC9xqEtmHwko
	ya4D4Hwj5/Jw/FXx+emF5+mYnbmJ6pgmb9NXFRtPVq3ljsdxp6C/7AMVU4etpMknavgEvWwthSd
	zMCISBvvo0EtFxViulv5Qj28U9ytC1WgyY/IzVKWIWPirMbOBsoUrasJbdzgdFiIER7xKlJdHRw
	QMTWevZCfF/bbUTermi/vBimfdAPWN+f0GakzmYhrsGk3OW7Cp6ldYBD2xB81Ub49ky0nblIVlc
	y80/2EkE8JFVwE5rjV5xUhzH+aou/PBom2ZA1mjrjmxsxE6nzbPnFmc/SDMMFnUfBgREtWOcOg6
	TGUw16oHxVaeXxcAL4WSgAu1erXoI8mR7dOJiy/zxMAk2ijjk53Pd5GZ0=
X-Google-Smtp-Source: AGHT+IFO/ZLxuqaj17abyw10+8CVi9iLvz7AXlLgZerskMOrQo6BFT5caxK0XQr+JNLPJZbm/V9Mbw==
X-Received: by 2002:a05:6808:1786:b0:44f:f747:f9f with SMTP id 5614622812f47-45a6be3820fmr1144818b6e.36.1767800050216;
        Wed, 07 Jan 2026 07:34:10 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e2f1de5sm2398106b6e.22.2026.01.07.07.34.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:09 -0800 (PST)
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
Subject: [PATCH V3 10/21] famfs_fuse: Kconfig
Date: Wed,  7 Jan 2026 09:33:19 -0600
Message-ID: <20260107153332.64727-11-john@groves.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260107153332.64727-1-john@groves.net>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153332.64727-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add FUSE_FAMFS_DAX config parameter, to control compilation of famfs
within fuse.

Signed-off-by: John Groves <john@groves.net>
---
 fs/fuse/Kconfig | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/fuse/Kconfig b/fs/fuse/Kconfig
index 3a4ae632c94a..3b6d3121fe40 100644
--- a/fs/fuse/Kconfig
+++ b/fs/fuse/Kconfig
@@ -76,3 +76,17 @@ config FUSE_IO_URING
 
 	  If you want to allow fuse server/client communication through io-uring,
 	  answer Y
+
+config FUSE_FAMFS_DAX
+	bool "FUSE support for fs-dax filesystems backed by devdax"
+	depends on FUSE_FS
+	depends on DEV_DAX
+	default FUSE_FS
+	select DEV_DAX_FS
+	help
+	  This enables the fabric-attached memory file system (famfs),
+	  which enables formatting devdax memory as a file system. Famfs
+	  is primarily intended for scale-out shared access to
+	  disaggregated memory.
+
+	  To enable famfs or other fuse/fs-dax file systems, answer Y
-- 
2.49.0

