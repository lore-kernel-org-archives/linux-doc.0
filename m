Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F533C1BF;
	Tue, 27 Jan 2026 10:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769508825; cv=none; b=Rqfs+mHrHaiPUrQiwMWpAEPb/NlWtRnhcRs7xCMzByhtaV4RjiPW0rtGCeNyV9kUnb133xCRbrLEaXpxO8x7Paz2PMMxrt4ULkfVQMoG8nxcgl1mBpGOnAq4OFbqtZYIp3+duPZacArqZNYj/K8g8HBMQ/9JN1W5s3tBAOD57/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769508825; c=relaxed/simple;
	bh=XFIpcjRKktodju0Cjd6RYExE3T6O0QCEiKFyxSSf/Rc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TpsyIgMzZqsneC24wPQmEhrdoPwJS1ybMvfXVW7Lm6ZMnEDJL51Yk2Oeh90PI2Rjafwviw4KkHSnpacLizgJr7RJReI46UbvmyE8yCyJhPVYHvMu4cPe053Qgvj2JDuYjf9MrzQnMlacZHxGyywMcpurexLeYVRoqPovJkb61c0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=af8coZA9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="af8coZA9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97863C2BC9E;
	Tue, 27 Jan 2026 10:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769508824;
	bh=XFIpcjRKktodju0Cjd6RYExE3T6O0QCEiKFyxSSf/Rc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=af8coZA9BUPEDoer1KvA4BldlCunm220DeBeveB8Shw78WEQLnksm1FVs0ZXmqw8Z
	 4DmZgJNJHE6yHw3DQrvFZzOkIfmUjkg9VzUgzR+PxPVraJn2/7/6GWd6VlXdkArnuF
	 ysn6fy2aE8Pu36+w3RuNu9ZjeI4VL24RkziF6a0stgEOVn1cRKPbsfG9biEf9A9zkp
	 /TgHR8TOWAxsMUfQwqQ5iZQri2Tbty3T2dq/rjy2+ASsQBMgl8yM4sU8ltBvBl0bMx
	 kDF9mIFg/ePRw4hqC7lHNIaoT6VbnM5y3RAZFzYSMQQYa/C0mjw41e4MOVAzoW9DAg
	 18GjiLrYQVcdQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.99.1)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1vkg4s-0000000BVWv-3jhz;
	Tue, 27 Jan 2026 11:13:42 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH 14/14] kdoc_parser: handle struct member macro VIRTIO_DECLARE_FEATURES(name)
Date: Tue, 27 Jan 2026 11:13:33 +0100
Message-ID: <cdfb3d717cf5215b05a12f2b3b6d33214692e743.1769508371.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1769508371.git.mchehab+huawei@kernel.org>
References: <cover.1769508371.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

From: Randy Dunlap <rdunlap@infradead.org>

Parse the macro VIRTIO_DECLARE_FEATURES(name) and expand it to its
definition. These prevents one build warning:

WARNING: include/linux/virtio.h:188 struct member 'VIRTIO_DECLARE_FEATURES(features' not described in 'virtio_device'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 tools/lib/python/kdoc/kdoc_parser.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/lib/python/kdoc/kdoc_parser.py b/tools/lib/python/kdoc/kdoc_parser.py
index 4be7728a5e62..4696be9212a0 100644
--- a/tools/lib/python/kdoc/kdoc_parser.py
+++ b/tools/lib/python/kdoc/kdoc_parser.py
@@ -155,6 +155,7 @@ struct_xforms = [
             struct_args_pattern + r'\)', re.S), r'\1 \2[]'),
     (KernRe(r'DEFINE_DMA_UNMAP_ADDR\s*\(' + struct_args_pattern + r'\)', re.S), r'dma_addr_t \1'),
     (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + struct_args_pattern + r'\)', re.S), r'__u32 \1'),
+    (KernRe(r'VIRTIO_DECLARE_FEATURES\(([\w_]+)\)'), r'union { u64 \1; u64 \1_array[VIRTIO_FEATURES_U64S]; }'),
 ]
 #
 # Struct regexes here are guaranteed to have the end delimiter matching
-- 
2.52.0

