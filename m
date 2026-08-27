Received: from mta1.migadu.com (out-165.mta1.migadu.com [95.215.58.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA11DD525
	for <linux-doc@vger.kernel.org>; Thu, 27 Aug 2026 00:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787788895; cv=none; b=A7luXdNOdHpa2er3/dPslBDUmArBs1Qja9yCQ2qzE8k6ZHUWRuUo86toBbItrIUgsPUYaFIJFs9nKNnsyybd1aeOWf7jp2oMYXoxOfS8lYLP+VR2zuJh9SHMGqYwhvCySyGawNpu4iG71PCKfdz8FVcWsve4AkEVmVcJ/gj+lyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787788895; c=relaxed/simple;
	bh=nb9Tbop7u7Gyn6AIVPCudlCvO4vbRR92MCmqSU5eK6o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pz81f6TptS+xe6gs/MvP8sOV38z5MHvwTF78yogbXJzVbOQIUX8EjV0vkemIA0zY4OmcAaRof0LGDTCwEJDcNSu41VgZPx37LrQEENjOY3cTtIW5ZC13miMKcEfBarlHbi5xiQ6ryoaYn9tzzK5zSM7qK2lxEi3u72Q9v8antWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=loXMeo9B; arc=none smtp.client-ip=95.215.58.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="loXMeo9B"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=nb9Tbop7u7Gyn6AIVPCudlCvO4vbRR92MCmqSU5eK6o=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787788890; v=1; x=1788393690;
 b=loXMeo9BstjECdMDaMth5QJn2dnQi8K/mye9n5hyfcL5oM9ZWegT7Pfkh+SKnAINpRb2W202
 LbMj3qRUeDGT1u9r7OgbC1HMu/FxlbudV7ySN0bxKEUQhAJOSt6+SN1wpUF6loLCqTlDvnKP1dF
 4talIPCWTtPzQcSdBGL2hjmY=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from dragon-master.speedport.ip (2003:fc:df23:7abd:c598:7cec:94a0:927b)
	by smtp.migadu.com with ESMTPS id a6df62b32feb26dc;
	Thu, 27 Aug 2026 00:01:30 +0000
X-Mizu-Trace-ID: a6df62b32feb26dc
X-Migadu-Flow: FLOW_OUT
From: Md Haris Iqbal <haris.iqbal@linux.dev>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Md Haris Iqbal <haris.iqbal@linux.dev>,
	Christoph Hellwig <hch@lst.de>
Subject: [RFC for-next 1/3] block: reject unknown status tags in error injection rules
Date: Thu, 27 Aug 2026 02:01:13 +0200
Message-ID: <20260827000115.128093-2-haris.iqbal@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260827000115.128093-1-haris.iqbal@linux.dev>
References: <20260827000115.128093-1-haris.iqbal@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

An unknown status tag leaves *status at BLK_STS_OK, which
error_inject_add() then rejects.  Fail in match_status() instead, so that
rejecting a bad tag does not rely on BLK_STS_OK being invalid for a rule.

For a single status= this does not change behaviour: an unknown tag still
fails the write with -EINVAL.  A repeated status= where an invalid tag
comes first is now rejected instead of being overridden by the later one.

Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
---
 block/error-injection.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/block/error-injection.c b/block/error-injection.c
index e14bc4b723ef..47cdd8973adc 100644
--- a/block/error-injection.c
+++ b/block/error-injection.c
@@ -171,15 +171,18 @@ static int match_op(substring_t *args, enum req_op *op)
 static int match_status(substring_t *args, blk_status_t *status)
 {
 	const char *tag;
+	int ret = 0;
 
 	tag = match_strdup(args);
 	if (!tag)
 		return -ENOMEM;
 	*status = tag_to_blk_status(tag);
-	if (!*status)
+	if (!*status) {
 		pr_warn("invalid status '%s'\n", tag);
+		ret = -EINVAL;
+	}
 	kfree(tag);
-	return 0;
+	return ret;
 }
 
 static ssize_t blk_error_injection_parse_options(struct gendisk *disk,
-- 
2.53.0

