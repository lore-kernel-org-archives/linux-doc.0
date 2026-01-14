Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F2438A9B9
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 23:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768432779; cv=none; b=Ij8SJOIHCHUW2y17yn/xPd+IKPAAz+hxN1wqQNrQ9RHgXVa+1unptc37a6Qea0eUyFLSA3R2WyGs+nZ+MmoDTruAA5Dq0i3BV7D+lcxRY5Z+HmddJZgLOTT8oLh01xWPUz2Ob+AFUd1OCCtB8+3KV70bUHcb/n/oQT5/t0hka74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768432779; c=relaxed/simple;
	bh=EHMwJPD2Vt6csWKDxVM2bpGH+6rPVOBI0T+ZdejS8PM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jlfzUqbe1wrrcQNW7VZhiwhbWi/Azf1EFh7D5cSEyEm5YeHAF+ENTPWj4ixfOHAhDsgdJTQA8t1xOULa0LxTh+evBngvNDoMrkYcVN5VG8WgBDf7yWsvTUSbMVOH9XUhgbSxkFDWlfK9hsiBhkgoSDAHfGGUzWQh53DFp3RuuX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObRw2eHM; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObRw2eHM"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2b05fe2bf14so767985eec.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768432767; x=1769037567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WIEMUdHe6tYyV62gaPFR8QpHnKQnU3PaCpWSzsgNDe8=;
        b=ObRw2eHM50a9vlVG7ZfGVerwDmdjkLfI0hzjYRcpsRSz4XhLJZHTA7Kx8Rc25vfzwn
         keaWbCGjo3oFCnl4driL2p5bC634nB8GUB1RMLUedaKHOQ02CHYhTLTLLK3TJqk3KKVL
         1Xow/qYOrFAd1ixfRiIVETx2+JIV7gW+SeM3MckYQGy2Vy/knMEZtmy928NJtQGkE2um
         rgRl078KuzWwjCXvBTZmuIs22h9pjokgj4ydFQAlTAfxjQH0Bc9014sDD3HjeiHKR+V+
         FByLnc2Un2frbWopA2CROkcVxnK8PIdac7vQHDtUNhuHgdsA7MyDDINDL/KM8dNJnrL8
         WwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768432767; x=1769037567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WIEMUdHe6tYyV62gaPFR8QpHnKQnU3PaCpWSzsgNDe8=;
        b=ip6dUzREoogmoSqg8JxI1drZn6bqR2wmMTqh4svZAPCQMle7ouOpRPAtNjG0YmB9wi
         FqcURhvJSLm4XkvGOoBGoN/k21YtXiMT7Xx5f/t0YzVzL9QxtxNFJEUn5PZEsmFXJyA6
         2aOeLZUsb9DiRRi8bet4ZlXejtYo3NSJiLVbEcdDgPn5DN5OV7khA+EJMrUHo9U9YGjK
         +lhlCCmidfLvXcmgwTtu3uXHZUF3HgYjkUEoN90NkoFE+eHEj4NgwW7PFnSv1TvfhYOg
         dx+e0Z2q3/Fn5B/uLaQIWwf0QCTjGWi9oKgRdR8YqpFyI+VGFPfwFMX3uTYe1+dyspZ2
         qOFg==
X-Forwarded-Encrypted: i=1; AJvYcCVxHHEGovvWjWvTqv6/5g9BGLyLjNT8YdrT7fEcpUB57F+wJGwOMgZGHHcs1HAcuLJsbO9irOcOm/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEEEyFIYv85v36NAJjEr4FDaO2goMGA6tqLo9esIMR+NAP8Nmk
	zPyWGD/R961GbgpTupK1XzhpSKv27g+O8LswFImIMjaV6kgOKycUvUX5
X-Gm-Gg: AY/fxX7NssmSoUBt1plFaxjdf9QIcO8tX81F763FXtKn+xIt1CRDkzZN8tu2dnuhIUz
	ye7sMCPELRsb3MFCAb8caZ3z2gkg2UE6/Q95lH5szFbhTXb69ioRW3xF+qkOoSptDO4P0hdnI6r
	wgAqrr0Rg1g6LwyKFHeti3Zrn6sFJuxnfVXMRzAZHR1ZjV5/9oQhN97+7GOi899CSuoQunrF3YY
	taWMbhy6K+hdYt8Z/I4qtxM5j63pH1EWAKmeA6OrZrYwvjmLfcYD5Kt6EiE1+itVUCJxkfVUY4T
	42HOPn3QO4lb1CyST7gEAKL6KrmYprSJIiPnjdrRe0jgmvCuqJXJtEjTBNuY6SCF1T04PB+mr8m
	oM/L5j5MvBMIaZz9aHue6dFjEOiBumdBXbzZ/5ZukfpL5pkZ47jej2dHKwVpTbcGsdoB8A//ZUC
	qm8Kw/90DEg+E5l+KbhxP5WQ5EmCBwkglffiTtUVSss7MD7EeaABvjy00=
X-Received: by 2002:a05:6871:7817:b0:3e0:9188:8f10 with SMTP id 586e51a60fabf-40406c5d030mr2965148fac.0.1768427121522;
        Wed, 14 Jan 2026 13:45:21 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-3ffa4de55ffsm17644773fac.2.2026.01.14.13.45.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:45:21 -0800 (PST)
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
	linux-fsdevel@vger.kernel.org
Subject: [PATCH V2 0/2] ndctl: Add daxctl support for the new "famfs" mode of devdax
Date: Wed, 14 Jan 2026 15:45:17 -0600
Message-ID: <20260114214519.29999-1-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114153133.29420.compound@groves.net>
References: <20260114153133.29420.compound@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No change since V1 - reposting as v2 to keep this with the related
kernel (dax and fuse) patches and libfuse patches.

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

