Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CA43986E4
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767800095; cv=none; b=Kvm++gQheqhK6v98u/vvd8hAT3gWf4Etb8FLeeIDiYAFaN4X1l1aQ9d+fu3lMVIRod/ALor9VvQRM+TKLzzOhgX9CJ+n1kZhhV/WqWAgkBr9I4QRivUKGSF1c0XPOHmyuTmnMaMbQNVvwOsf2yEAlD8GkggOklFpMvwjEvNRfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767800095; c=relaxed/simple;
	bh=rKi3IJhFbcB0WLwepeKv+pU0rou+ccXKzIoDaJEyXMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kDI4dFvHHX/V7ciI4wSzGjIRYOtzcuo8J0/b9m/ZX3FndmjoUFkm3MrQNLt7HfJaYy/gPawOj4CBjMaEbRoJ3n8gD44HiJpCbLFvpAYJF94Egw64NWlw4gUEg5sAijZt3PLnAa6iPyFVBqZYIz7UeIpboSRHX3RJJABv9i0J1ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERMqzBXV; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERMqzBXV"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-4510974a8cdso1184265b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:34:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767800092; x=1768404892; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBCgapkD0tMSytl4lZx+vzryyZ4HeCqXI7xZ8qhc6V8=;
        b=ERMqzBXVYH3qzX1YWyUuLaDxMqSFKhoNr2tnqLVy9emLvTrmWbxhrCrbIWf7+O76k1
         6CZdI3y4kRa5LNnspnGiK7LvCNhsN2MpH96YZ/S8hdMYfeLvot5/Q4XoBm9YbnHO5Equ
         2QeVHMYiXjosqkc40Ah2qYzhgUcu2pWs/dbq00RhlSGjPQOLtGcgbEQ3DSoFiZ6/eTlM
         YUk79H7cdB5KtpzpCxXIyK6FbcDkA/iMYf87DOaSo9rXII24W/GWQH5zdjI63rvtewaQ
         GcQwpcHHw9ZwLu0phgghDv3eQTcmUIOOSJ+eqrfoJe6BoOOjRR889OPmjHoap3BjcspQ
         XrvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767800092; x=1768404892;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBCgapkD0tMSytl4lZx+vzryyZ4HeCqXI7xZ8qhc6V8=;
        b=OXXr1tg7UVIfPZCRjVmomsAwuqz/6t/gpfPzUWpUOlBwKxqHiZCPhYOCvVsut5lfZb
         Bg9ub9dyQDf5Z5JHZuhG6jEN37jnJhh0d3OXAuTscjQzqqjKeywyizBkD7JuWgaXM62Q
         a2qwc6QAHbOpSyMAnw8Mt0f/qM1tNCmhUZWmL+ljx9H7PIxSZ5nSC9aUGnORw9kNyf48
         tIDbfhtOSMS/YWy9eqT3WFhmsv/fVG+BohXr92FhQFRtq+vh0winh6ttpSZaAA7P8/h2
         sSEaICGqoYc5tH2zqSmZa6pg9J8BoD7zCVc9MH2QFLZMZtP/lMdcYvIe7zmcjH6hUQNB
         m+lg==
X-Forwarded-Encrypted: i=1; AJvYcCWmmmDBhSHL1RZRDx9BZRueb8KqNWksab243j6e4xr/+I1p2OyIdOrYeA0O3s8ZfkncXyY95LQX4Zg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMmPYRFbClfghxEJP7EBNmJRPzvumYwzrb4eC0p2mzE0POYJyb
	y5P0OidqnzmFnfXN0CYka3VRdECaf0SewKO+iug30sfglKDEf7cyb+mr
X-Gm-Gg: AY/fxX6M+CI+q3AIot+aADi8SmFsyhpSYAeKU+05U4HJwNZ+LIMkQ4uxYkwqa12EGH2
	mCtQy642sBeGDBf/FuQ9Dae9J7+tYj2rh0Ho728LrtBQ7ukAHSxEMTnVv9EUWdtUqkEblkG86s/
	5NSwYCLseuUXu+8xHt18eTDA4K43C6qonj7m85vJ99RDoBYUX42AQK5PYMdiakoubFwr1V8Tbjh
	3jK18gyW/LDpaKAeC9nwX+ldT9iwvg2PJvlf0U00AAp9KWb8+7+yRI+luePs+OB54Nqw358HufU
	2VoHcUcwEEJmCo6L7zlWaIcxFsq6KtC9MLjMk0gCnsiPOCwYWSvZazeGW/FeI5/CsZsc1M+kXhf
	zUiUVvK7KkUQ79KwCsu3p9wsYusCWVEKenlorVD0Sxm4y90z8b2YxKu9zP+9/xV2Jt9WiMc/y9m
	roUP4VlC3v9zIfgr4NwYfl9KLodjzgRxPfREXc4PACc/5/
X-Google-Smtp-Source: AGHT+IHcdywbJhWbPofmdnwqwy3siWxMKS2ZL8FYrwKJtzA3ot5XniZZCZFcJRodTSEL4vBFeFPTwA==
X-Received: by 2002:a05:6808:4a52:20b0:45a:76c9:303c with SMTP id 5614622812f47-45a76c9325cmr272281b6e.32.1767800091392;
        Wed, 07 Jan 2026 07:34:51 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:a917:5124:7300:7cef])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e183ac3sm2398424b6e.4.2026.01.07.07.34.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 07 Jan 2026 07:34:50 -0800 (PST)
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
Subject: [PATCH V3 1/4] fuse_kernel.h: bring up to baseline 6.19
Date: Wed,  7 Jan 2026 09:34:40 -0600
Message-ID: <20260107153443.64794-2-john@groves.net>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260107153443.64794-1-john@groves.net>
References: <20260107153244.64703-1-john@groves.net>
 <20260107153443.64794-1-john@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is copied from include/uapi/linux/fuse.h in 6.19 with no changes.

Signed-off-by: John Groves <john@groves.net>
---
 include/fuse_kernel.h | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/fuse_kernel.h b/include/fuse_kernel.h
index 94621f6..c13e1f9 100644
--- a/include/fuse_kernel.h
+++ b/include/fuse_kernel.h
@@ -239,6 +239,7 @@
  *  7.45
  *  - add FUSE_COPY_FILE_RANGE_64
  *  - add struct fuse_copy_file_range_out
+ *  - add FUSE_NOTIFY_PRUNE
  */
 
 #ifndef _LINUX_FUSE_H
@@ -680,7 +681,7 @@ enum fuse_notify_code {
 	FUSE_NOTIFY_DELETE = 6,
 	FUSE_NOTIFY_RESEND = 7,
 	FUSE_NOTIFY_INC_EPOCH = 8,
-	FUSE_NOTIFY_CODE_MAX,
+	FUSE_NOTIFY_PRUNE = 9,
 };
 
 /* The read buffer is required to be at least 8k, but may be much larger */
@@ -1119,6 +1120,12 @@ struct fuse_notify_retrieve_in {
 	uint64_t	dummy4;
 };
 
+struct fuse_notify_prune_out {
+	uint32_t	count;
+	uint32_t	padding;
+	uint64_t	spare;
+};
+
 struct fuse_backing_map {
 	int32_t		fd;
 	uint32_t	flags;
@@ -1131,6 +1138,7 @@ struct fuse_backing_map {
 #define FUSE_DEV_IOC_BACKING_OPEN	_IOW(FUSE_DEV_IOC_MAGIC, 1, \
 					     struct fuse_backing_map)
 #define FUSE_DEV_IOC_BACKING_CLOSE	_IOW(FUSE_DEV_IOC_MAGIC, 2, uint32_t)
+#define FUSE_DEV_IOC_SYNC_INIT		_IO(FUSE_DEV_IOC_MAGIC, 3)
 
 struct fuse_lseek_in {
 	uint64_t	fh;
-- 
2.49.0

