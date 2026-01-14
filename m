Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBE6355020
	for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 23:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768433328; cv=none; b=A7//dENKvWgEVaxM4CoYD+bcFl8oFfB+XSLosOHWUB44CZ0WqdnQW/cMrSkBA0k7L51T0XyidUPTSMY7uxrvlpi2iIlce7IfA18gmNpy/Ena04J/SZ+iCJvhw5Qsof8JcGz/GtiPJmCP15RLLK1jhzAT0YWay6Q1BbNNxVLSxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768433328; c=relaxed/simple;
	bh=zG2TyLnXjDP5W7454KU8fBzg3dWWFM4U6U41q0cfD0M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RM4odV1VzYrNEihvkJFzal8pxkWxWGfQOfe1Ir9+jBVRL26QUloBrzSfUEAiX4XeqiUiXM5oE05S9wpPx8PnKY9G6ao6skx1l9IBmmlEcj9kG5p8TOPADydzP6P380W0C91DPPZVp1KOqfyw0hr5Wrtn5Ir3rCDW7tctAx0E42U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mb9cw3ui; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=Groves.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mb9cw3ui"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8ba0d6c68a8so40213685a.1
        for <linux-doc@vger.kernel.org>; Wed, 14 Jan 2026 15:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768433311; x=1769038111; darn=vger.kernel.org;
        h=content-transfer-encoding:libfuse:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UUX1Xqe9Ih33TiO90xcxWEJ1pXhMadrkogKYy+yJV2U=;
        b=Mb9cw3ui2YFfi0lZD5Y9bvck0kQwdr5KlGUiEvknn5wlxEs6KwxHGnUaTjqJlpF49P
         ajdSfDDMGHf7uPOcXr70aPnnVDKHTiB58Vb0ftjfKs6mvx8R/ch5C1Oh5cCQj2pLgJWH
         wf4F0Kfd4v8RMQMTjToYZfadrjzfwUBAHYH9KwepsWapnuBjJavp/VbiqfN47DNC+brb
         m5TjPgtP+ktEe864NGO5IeobRGzlPmUFxcxR1fnTfuH8aM/hIxYOgeWKQ0FOgXYFU9H4
         9amOVnY+hPHTbtiXEwLECD5xDofzKjMa+4/Fhry+j98MKiywBTyeQw9qNypKr7G4mca/
         juSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768433311; x=1769038111;
        h=content-transfer-encoding:libfuse:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUX1Xqe9Ih33TiO90xcxWEJ1pXhMadrkogKYy+yJV2U=;
        b=lCogu4eQlovWsfb3Hfhr3Xh5sqlpmkf6kZTbIHD6bxInpV8WdWm+PfV7CWWlB7KnCs
         LkTVbdLESqmezJqfOOEYsros+s4Zn+9wM0EShusHhAkbAzupNwnXtYQSFcaRkQmYi01e
         NubyZEQA4upd0v36B8rIvhO46CJa3mLeEji4DsdKFksDTq5NMf4Ht4x+Gk82m8XgN4RL
         ZlDU+Q3xh3ezs2SaBbz0EvlQZqYfACYgKzBGHEDVfNTcT7e47DzXb8wQM0lHKRyHCxHF
         Vdm6eMnvX1GagzOwci6iwLSsDIE7du2/AIAbBMkI3vcUY5M2X45bvJ+QYmusFvkAI/P1
         gNgg==
X-Forwarded-Encrypted: i=1; AJvYcCUFRCh71jM5kbshiPHM9wU+dbDjKdWqethXwXTQ43pe6b0T9gfs/3i/xaNxXMP0lOYk6I1pYRyUJzY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuuJJE8csSjlvPAfrQ733hMTW1HjtOi7Dn5ZWqWHhC0SPYC7gg
	T6U/wvH+oHoWjSMsYWLxjN88j3m8JsssQUpBSPe82NIU1zs9xSXc2KJu7rILqw==
X-Gm-Gg: AY/fxX5yVxTE2uhlNOlYPjLzE5zDqCk4SdxyEdDq+k1yI2qJs+by3ptuJc/YeRM5OVp
	vx/Njuv4VhcHbEa5NuQh8uiC4lBxCzjLdyPJeW/JRgYpk3emxj1Kg/Ko/mxssYsro7XGbcl7KG0
	tmuRRIxlAAxvNt+FKIuDdqUzDW8jHv+n7T1C3MqeIkHaTeXqXslL+xbTRsxw+ImHaMcePlQFunB
	leqAtHT8w+bZGX+Le/5luO5eeICGr/WMax9iyI89jnXpwS5f+4am3oBC+DZMM9HGFt8BCA2LdIi
	bsQZDdmnGMIwGMy+M805JavsTGix6lLxk3glDMx7DamtKjxRlkOHGXNWWDPHWMqMp79JvOhuXAh
	cSZr7fMwasHkSYcNCiu4jkpROrOoCA/NqhJ3aqYA+oCITQZ36m5ifbq6YkMDiKt8gQ9frzHveU8
	3ldBIMV9Aml116PP1Ury6C7zXjMWtHPlHxjb/YX+rh2CXlJ1fMwzjbv3w=
X-Received: by 2002:a05:6808:f8a:b0:450:d833:6bb6 with SMTP id 5614622812f47-45c73d65f1amr2396599b6e.30.1768426990473;
        Wed, 14 Jan 2026 13:43:10 -0800 (PST)
Received: from localhost.localdomain ([2603:8080:1500:3d89:4c85:2962:e438:72c4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45a5e1b0779sm11316868b6e.7.2026.01.14.13.43.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 14 Jan 2026 13:43:10 -0800 (PST)
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
Subject: [PATCH V4 0/3]
Date: Wed, 14 Jan 2026 15:43:04 -0600
Message-ID: <20260114214307.29893-1-john@groves.net>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114153133.29420.compound@groves.net>
References: <20260114153133.29420.compound@groves.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
libfuse: add basic famfs support to libfuse
Content-Transfer-Encoding: 8bit

This short series adds adds the necessary support for famfs to libfuse.

This series is also a pull request at [1].

Changes since V3:
- The patch "add API to set kernel mount options" has been dropped. I found
  a way to accomplish the same thing via getxattr.

References

[1] - https://github.com/libfuse/libfuse/pull/1414


John Groves (3):
  fuse_kernel.h: bring up to baseline 6.19
  fuse_kernel.h: add famfs DAX fmap protocol definitions
  fuse: add famfs DAX fmap support

 include/fuse_common.h   |  5 +++
 include/fuse_kernel.h   | 98 ++++++++++++++++++++++++++++++++++++++++-
 include/fuse_lowlevel.h | 37 ++++++++++++++++
 lib/fuse_lowlevel.c     | 31 ++++++++++++-
 patch/maintainers.txt   |  0
 5 files changed, 169 insertions(+), 2 deletions(-)
 create mode 100644 patch/maintainers.txt


base-commit: 6278995cca991978abd25ebb2c20ebd3fc9e8a13
-- 
2.52.0

