Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6383533F3;
	Tue, 28 Jan 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738022796; cv=none; b=hiWekdC5b9twYiLXVICHYCPk7BM8/z225P7Ut2Ro07d3g2KuPut5Mh5L4rhkZA7k//7IoFdR+ILKzxqwByiVNPAbXxPTEsGXKyZlwbDWSufPLEPtBp4cyllo0hZ+WDUaNBFHBczQ18CXXD7hq9AUzsgE2RNBSxJpvkoVObKjKKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738022796; c=relaxed/simple;
	bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DHkP9L/Pzf8Z/snyllA2pT6KpqJuvihVZq4ZYS2MWGuR5mgrppC3Vp5UpF/fqtPauergZN4E08g4R662eP5DBhPbr78LOxySbzljyFLq+EnJJsB0DXB8j7GPKpI/5yLPsLALg09YjGXCpXnEqcWcokYbX2WBiB91geQH8Vm8SVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMbqCVZI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMbqCVZI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995C3C4CEE0;
	Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738022795;
	bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UMbqCVZIhWUNOG6pwcxM3vV7QS3gmeUlDvAxwudM+XQlG18DYaJVCyQfHG5/8K/yj
	 0GIssh6oORjjGHMP0vHmL8V8C1dvZIJvso/5PAJnnz3DGfuHKbrZ4EWK3Mb4j3lFFq
	 GgUMPEszGBPpDJBXf7Y2jcHEyK6n8qL4hFO8oULBLoDgb6Wgqa9CkQfcDPLLItwBO1
	 M4JSK2yrdbsqGO7qA35AMAWhnBoC2/YEB11g7SAxmxwQJTBid96VAp/cz5Xpj3ur/q
	 cl2HpIegxB09n0IdEuR3u1C8kVPcwJDYdLcyGrYd9dWUXNGeIkDOhqc/mlxUIU37Ez
	 SM0mJMidSzbdg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1tcZ7h-0000000DRL1-3WAU;
	Tue, 28 Jan 2025 01:06:33 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	Chao Yu <mchehab+huawei@kernel.org>,
	Jaegeuk Kim <mchehab+huawei@kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [RFC v2 10/38] ABI: sysfs-fs-f2fs: fix date tags
Date: Tue, 28 Jan 2025 01:05:59 +0100
Message-ID: <380e21e11e5b1b9e7cc38ddb0c1e6695b3c69254.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Some date tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..e44bb614964b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -347,7 +347,7 @@ Description:	Used to control configure extension list:
 		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
-Date		April 2019
+Date:		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
@@ -355,7 +355,7 @@ Description:	If checkpoint=disable, it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-Date		July 2019
+Date:		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
-- 
2.48.1

