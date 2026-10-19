Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792433452;
	b=MpX0tGPoPy0tFPB5LUupXwjTQTZ9dqc4J6W0yiAib3WZiVKO96+uHwn1QS5eMYak0hbe
	 AQz6alxQr7JRzogc/1nRComYH49gi2qM51Yt+NWWnb3mVgrH2EaxKCFPzETO7gyoA0mcF
	 GkFYnY1ZTgt1rRoPgxRrgXp9lBS8sAZ95iOJPOSHBq0CKU2WcoJ3Po/m1pAsWKqd2cv9v
	 ipTKu+QS8/GBfBOCQDou5hTowAfcGyfsQbjh0Aw50zaaaEFdJ29hLHdhRmtFg5C/U6/IO
	 prZR74qUL8/onrThCrzNWcZGeAt01ymCi8Wy9gnTfk7lCd2fhVS4gvPsZFcua7cw4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792433452;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=SVvib7IvDFKVhLJxve8I9C62Hf50rN4ShcZWZYoSaU8=;
	b=J+nfS/1TIx+cuUGIQ9bARQCMruPIOaDOCfo8ZFbQxbpBQ2yLymsatkP6RNFRLH8upuJr
	 eM4xsCy6/lb+UGf2N9NF63je7a/GCRtgV6cNyFRZbVZyQIhxpUDN29vLW5K7M9wRa5SPQ
	 YUSC/FDw5LCbrgQIDCn+fPWsK1ZmrM/3RP7XrDJZpw9IilXBjFQQrKXWzG+sARvIlOORw
	 uDVqI/5GbtRGgcR9O980U+SyPcRscHLLTcuo+us0oFeRwcWxcEn6U8DDVmi7opJf7deSa
	 hUq4neYwFTUKD2Jo6A6I90DNzh/+VmAQ864VZmn97kErj+H5VQzflDLrSxocSn3Z9cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQuZsx1P;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAB606A337
	for <linux-doc@vger.kernel.org>; Mon, 19 Oct 2026 18:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31EAB606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HQuZsx1P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792433451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SVvib7IvDFKVhLJxve8I9C62Hf50rN4ShcZWZYoSaU8=;
	b=HQuZsx1PjLu98z7Awno65FQN8gVGrnC9vKKcPlkicMH832DJr5caLAyJuB7G4PK9Y69tHV
	R5mdo+EMytOM75F1qkeJ/oUOYEdblIIwL24Kk5thm5oQe6+q4SrR61OtKfKEse3GKNu/Yj
	6zfyjx3hHQQkBCTBNqkl9N1pqnfdJF8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-445-kXlfb2kiPW6_LwUBJ3PR4g-1; Mon,
 19 Oct 2026 18:10:46 +0000
X-MC-Unique: kXlfb2kiPW6_LwUBJ3PR4g-1
X-Mimecast-MFC-AGG-ID: kXlfb2kiPW6_LwUBJ3PR4g_1792433444
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8C8E41801BD5;
	Mon, 19 Oct 2026 18:10:43 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D5B6A41B;
	Mon, 19 Oct 2026 18:10:40 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH-next v4 4/9] cgroup/cpuset: Do housekeeping check before converting invalid partition to valid
Date: Mon, 19 Oct 2026 14:10:15 -0400
Message-ID: <20261019181020.1069325-5-longman@redhat.com>
In-Reply-To: <20261019181020.1069325-1-longman@redhat.com>
References: <20261019181020.1069325-1-longman@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When a hotplug event happens or when update_cpumasks_hier() is called, an
invalid partition may be converted back to valid. However check against
housekeeping conflict isn't being done which can lead to a partition
state that violates the housekeeping rules. Update the code to allow
reviving an invalid partition only if it can pass the housekeeping check.

Fixes: 4a74e418881f ("cgroup/cpuset: Check partition conflict with housekeeping setup")
Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index cef3cd0a6906..046c7ce5a037 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1981,9 +1981,15 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 			bool exclusive = true;
 
 			/*
-			 * Convert invalid partition to valid has to
-			 * pass the cpu exclusivity test.
+			 * Convert invalid partition to valid has to pass the
+			 * cpu exclusivity test as well as the housekeeping
+			 * check.
 			 */
+			if (prstate_housekeeping_conflict(cs->partition_root_state,
+							  parent_prs, xcpus, NULL)) {
+				part_error = PERR_HKEEPING;
+				goto write_error;
+			}
 			rcu_read_lock();
 			cpuset_for_each_child(child, css, parent) {
 				if (child == cs)
-- 
2.55.0

