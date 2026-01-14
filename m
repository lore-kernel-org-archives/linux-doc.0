Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665AF361651
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 21:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768426468; cv=none; b=Tn7vzVfDXqv3jure1pUFjb+BM8IeN+GnamubzEc0cxpB90qsurpNMq/1oBo6j7Fwfb2MwccObYl4/a8y+LGtK/3ukLrrNGtvMvfP2XNdBnGL0UYXSqJcu7QPIxfHDgIugyP7EqpcqZvpy672TSpOonTsAKFUzpNZ/78hlnCV1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768426468; c=relaxed/simple;
	bh=9in78rjKHXFfg7w69sXqer35Ki4r88+O4RkMgHiDMEE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cn+oXJ2rictlJ8kHuYIQeppeDehbHaIwWex403nGNbrliGMITkEXbpgNQSHuwo1/TkB+9brI8Amvs0TR1cPuWOvlzfjnOGfIBwBn5X/8zgFK+AthC6rSwhRX234jQxrPuiQQYJh+ot0BfgSUD+Ea9T0Ij2AxMDldzeeE9hNoxYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SjcMuL4d; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SjcMuL4d"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7c78d30649aso187243a34.2
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 13:34:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768426464; x=1769031264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U7XgQVWhUwcysFnko8qRq5dHQ4c7d0Rm3BbWfFJ4FJk=;
        b=SjcMuL4deu1NsK0EMJDaqTXuowbQGPPxISLQJuXZf5Qyl8iDkJo2P1taJR2AvaWizz
         aMG6IlDShoxm5DW/m/bmqEdP8GT3kSypfZ3yNbRCgVe/b9+zp+VPmHkZ9TlIOBXKKT7Q
         V9YmKhAgl0gqxIqvYns+F8AlYo3TMV7A4idahPi0fpL3A1Rut0Z/fsYXBAVCTnPFLPTj
         fyuVlnMWWRNaSU2up977pIGsGwy8nVeg4B8NDmTnL3qDo8ToUJ/8inuWObz1ACdrKoCc
         0gJiYg4OGvNG1Tnlul19cusDKGY7lkN3iX5Hb1XUSvPLBCW7/Oxv04EANxgwaAtoXC9l
         jXBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768426464; x=1769031264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U7XgQVWhUwcysFnko8qRq5dHQ4c7d0Rm3BbWfFJ4FJk=;
        b=wJBtautOaSiV1X89fiPCUiJ3fAJY+UYO2RiypeAAwaTtgIk0RFUl2v883VhySPFcY4
         HCH8KJq0EYwvER6VtMJq5fxW5AuOY7Capfd/666EJiSqt+t9TBozmgVuMxP6ba+qIHah
         bvJRONYsX824Hwzod9KTMk5ah42otjilXAgm8z8tm8LZTk4HEOQVYZsj8j/IBQyNM2QP
         OkyR/+P8ZHNQkYH+VRb5TpbVhBZwbksDQRp7EBc4socJNevMRT2VUdR0HrTAO8RHoKOA
         JyXWrjingaHykGtPtYTZd2qx+hOX3ka3fbSFNjcSAlvclq9dzfTFA/J0CneD5ve6GqXv
         jpfA==
X-Forwarded-Encrypted: i=1; AJvYcCUZzBQPG47hM/Ca3foik8uV/Ri2V+f1syC30AVCAVnVuEw+OUmqEThLvDXrEut1ZhgTa+FAkkfK+WM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaJ2LMTNAgY2SQVCp2bxYZB01egztHtOFr3r3pOWmEeoaclP9i
	fKVRbaxEU24RowQjReZX9qT1QeYLsKzGhel2I8SfekRRxMkbM5BgybHX
X-Gm-Gg: AY/fxX6xWIjAffXy58zwqX+nqWuAlPGaeAqcXH1tGkf9ccjfPFGHOgVmjDsMzStN7mP
	3DUK1DC4NvgVhPu1Quxm09DwebeYP0a2aZQeeWChb2OXe72XN2PHudvcUHO23JY2VoBSg6TDUwD
	BMO1ZrRUxjDW6l8O0El+WUZ95UOU3GIOX1vLoj7Cs2hosAJa0fce2l4eOlfBbAVfTUzJbIAfTz1
	FXGdBCX4BTYnd176LXNOMQ4SpwILS1QFZNBvcdMcK4Fy25oTADF2sF+DupAGGml7GFtQky6YkZt
	sUpK82rMQ6hWU8KnfhsMr/xnPRm0USuxWfEfm2EaPB8hyZmtoUwVDjKOOk4wJVgy/636gdewkoH
	eRAa+PxQoUXgSdppjVTJYDOeTDQMcLzyZ/Z7vFnuDkz9UsHnac3/y7ggV019MjLdWiFFzL93pB6
	xqkepw0gDBcUIhfP7X9LMGIxFT7LNEc5exetbyxzV/Qk7z
X-Received: by 2002:a05:6830:1cc2:b0:79d:eccc:96eb with SMTP id 46e09a7af769-7cfc8b3a75amr2512388a34.26.1768426464258;
        Wed, 14 Jan 2026 13:34:24 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9c2esm19771776a34.21.2026.01.14.13.34.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:34:23 -0800 (PST)
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
Subject: [PATCH V4 04/19] dax: Save the kva from memremap
Date: Wed, 14 Jan 2026 15:31:51 -0600
Message-ID: <20260114213209.29453-5-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114213209.29453-1-john@groves.net>
References: <20260114153133.29420.compound@groves.net>
 <20260114213209.29453-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Save the kva from memremap because we need it for iomap rw support.

Prior to famfs, there were no iomap users of /dev/dax - so the virtual
address from memremap was not needed.

Signed-off-by: John Groves <john@groves.net>
---
 drivers/dax/dax-private.h | 9 +++++++--
 drivers/dax/fsdev.c       | 1 +
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 0867115aeef2..f3cf0a664f1b 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -67,8 +67,12 @@ struct dev_dax_range {
 /**
  * struct dev_dax - instance data for a subdivision of a dax region, and
  * data while the device is activated in the driver.
- * @region - parent region
- * @dax_dev - core dax functionality
+<<<<<<< Conflict 1 of 1
++++++++ Contents of side #1
+ * @region: parent region
+ * @dax_dev: core dax functionality
+ * @virt_addr: kva from memremap; used by fsdev_dax
+ * @align: alignment of this instance
  * @target_node: effective numa node if dev_dax memory range is onlined
  * @dyn_id: is this a dynamic or statically created instance
  * @id: ida allocated id when the dax_region is not static
@@ -81,6 +85,7 @@ struct dev_dax_range {
 struct dev_dax {
 	struct dax_region *region;
 	struct dax_device *dax_dev;
+	void *virt_addr;
 	unsigned int align;
 	int target_node;
 	bool dyn_id;
diff --git a/drivers/dax/fsdev.c b/drivers/dax/fsdev.c
index 29b7345f65b1..72f78f606e06 100644
--- a/drivers/dax/fsdev.c
+++ b/drivers/dax/fsdev.c
@@ -201,6 +201,7 @@ static int fsdev_dax_probe(struct dev_dax *dev_dax)
 		pr_debug("%s: offset detected phys=%llx pgmap_phys=%llx offset=%llx\n",
 		       __func__, phys, pgmap_phys, data_offset);
 	}
+	dev_dax->virt_addr = addr + data_offset;
 
 	inode = dax_inode(dax_dev);
 	cdev = inode->i_cdev;
-- 
2.52.0

