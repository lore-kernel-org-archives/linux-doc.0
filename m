Received: from mail-yx1-f68.google.com (mail-yx1-f68.google.com [74.125.224.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D424C3876DF
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 04:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769144280; cv=none; b=oQk7g98+fLDc5K7BOxVUbZ//+RHuwcZBNaEWQsBJGy+YAkWvoNbVSdYBU6gSONk5kH2J32+MlKEd4rROG2b4dHWmSQemfUtW30Ua+tIuPLmuTpzy+Llzvhaw6DdDXVF8pXbg4s8lAye+7cxRqLzI1hxuiFy3+F+/bRp0kC/zlGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769144280; c=relaxed/simple;
	bh=uSGUjxT6vDYwFOxXkjkFU0pbIbdjzCnzKu1CcO3NxY8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gjS2FeWABd+eTwUW1fOnhaq+OyU56uWTuBblCF7SZCRUkGmnwb8Pnm5rK3kR5/7aIpaRY7RTI5KTRFFzBAEsxLzdoUF88FR0KEQfBuzoGdqbYd1UVxC65yzC7IDZENRmq4H37WvRpPCYVAQhNOoHXZ6YMK97yjgFZhpt1m/jqKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNTgL1uh; arc=none smtp.client-ip=74.125.224.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNTgL1uh"
Received: by mail-yx1-f68.google.com with SMTP id 956f58d0204a3-649295a4a5bso1660505d50.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jan 2026 20:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769144269; x=1769749069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XZ4usUMGfNo7J4lew0QKMfQ7VuYcLUlFI2hm5aH3MjE=;
        b=BNTgL1uhqs9fS1ndy7tQ3nmiEKi2tKgOfFqHt2s4LOH+ik3tZe1Rm6hHEIxoybTc9i
         gJjBgP9F8H0sfziS/qD2lQA5tzY+x6jfVaUVsdsq4/+FlAQkCUWuhkUAfX7LlTbcl8Fd
         VGc+wWvJGGYyeQFzFBferqubsv7WbU9Eu5AiXoHA3JURMXR9KrCzmDjCsz8VCwbZgrds
         dqcCxAd/qSGz9TSAt/Jxz8jXC/D2KdrUG/LC8CM80QiipngwTOtetd6rDKsm+5Rp5teo
         LL7g2P35w/whNi0+tL2KrEjSY2aJcnrkUvVRmotlDQ7n8e7ILc0BHFpVRP31qu4263CM
         kjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769144269; x=1769749069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XZ4usUMGfNo7J4lew0QKMfQ7VuYcLUlFI2hm5aH3MjE=;
        b=nmEqfGBemH4G03z3fdueuBbxJN9V6nryUH60lq7cxTnXIXZaKlojY6qgHRQPVSXknx
         oDTPI59Co2IvmQrrTw/XqV/OPp6obXf79Fhytn74RhMAf1iae4jQunWjbHkUnGtw+/ez
         T67e0pyi4xmLOjokTAJo4R2/W37L8L8y0KEplaHm0j4sxGf6km1u3mUY7BT6X6WBMCz3
         oegKeMSd/n8RJwQQQS4HWf9lOHRqDZK4dF51E6rOrDm9iCUi6/cCYBJXnm8x6vhCy0N6
         Wfpgw2QjM4b8FAvraw5m7WQ7JPa9wgIbTC+OlnlWV3T2DrHoyvC6jvxBW74SzrLjtILW
         AAPg==
X-Forwarded-Encrypted: i=1; AJvYcCX9tpEEVY3gDYJqM/dJrfY+6I3ukubuuT5XydaFM3k+Peiwjaql9Ey+IC2YSljbx6M5R+Y7doW54Ns=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTuJjBoQJxMUjx5bvsoORbyC57dGqXScJMoNd4X38rvySvqlmw
	EPDyZsYVa1SO0Nn+aZuZl5Gark9VFdv6ZqHpo9PJZMb+FTlEbN8jbtI=
X-Gm-Gg: AZuq6aJQxzO1pbZKN54vBLGuIyEpAU5vK8jImivIvOHz8dJj+OxHT8kszIndLq/Bel3
	Eo+6pwysGcVlYB16cN3bHLB/dj3fNCvL3ic6iBTEPMvOaQeQo11YJhv3XCQ5Zoir9da3kCBu8BM
	DSwkJo4f1FN4Rqp98eTJbYLjHSusPFklDLXoOMBFOnvsG4qJzNf/S58WxO1UhmTQK8ElEBO91Ie
	JfpUNAM5uvjlZ0XvcyJ1IIZdE9P7tTlbr0I/xX5xdFpIt9W+uAVuGatKlmEQ52ruJOUyahhejZ+
	qjq7LUZjUMQ/0uOpVMj8pUQVxo3x9Sr6WcZx2dGTe+Oom0l28Do2E+DEXTwtNVq6mbxt5ku1nlv
	9lebUeiEDpEj1lUucHNGm+Yjx0F4DfXD2bWQlzX1LQEkm73HRD7JGPFr5dWpspaQmD7qp1/AJG2
	D/1V+PPAUjSHnhbVLtZMcKGKLRcBAisyG8400pN/bJC9/QAsfxGgGYDyY+l2ZsxA==
X-Received: by 2002:a05:690c:9693:b0:786:5afa:375c with SMTP id 00721157ae682-79439a09235mr29912047b3.67.1769144269171;
        Thu, 22 Jan 2026 20:57:49 -0800 (PST)
Received: from localhost (23-116-43-216.lightspeed.sntcca.sbcglobal.net. [23.116.43.216])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7943af14427sm6466517b3.12.2026.01.22.20.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 20:57:48 -0800 (PST)
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
To: damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	bijan311@gmail.com,
	ajayjoshi@micron.com,
	Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Subject: [RFC PATCH 5/5] mm/damon/sysfs-schemes: accept "node_sys_bp" in goal's target_metric
Date: Thu, 22 Jan 2026 20:57:28 -0800
Message-ID: <20260123045733.6954-6-ravis.opensrc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123045733.6954-1-ravis.opensrc@gmail.com>
References: <20260123045733.6954-1-ravis.opensrc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow userspace to select the new goal metric "node_sys_bp" by writing
it to goals/<G>/target_metric. Also set goal->nid for this metric when
committing goals from sysfs to the running schemes.

Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
---
 mm/damon/sysfs-schemes.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/mm/damon/sysfs-schemes.c b/mm/damon/sysfs-schemes.c
index 3a699dcd5a7f..37cd5d715821 100644
--- a/mm/damon/sysfs-schemes.c
+++ b/mm/damon/sysfs-schemes.c
@@ -1038,6 +1038,10 @@ struct damos_sysfs_qgoal_metric_name damos_sysfs_qgoal_metric_names[] = {
 		.metric = DAMOS_QUOTA_NODE_MEMCG_FREE_BP,
 		.name = "node_memcg_free_bp",
 	},
+	{
+		.metric = DAMOS_QUOTA_NODE_SYS_BP,
+		.name = "node_sys_bp",
+	},
 };
 
 static ssize_t target_metric_show(struct kobject *kobj,
@@ -2566,6 +2570,9 @@ static int damos_sysfs_add_quota_score(
 			}
 			goal->nid = sysfs_goal->nid;
 			break;
+		case DAMOS_QUOTA_NODE_SYS_BP:
+			goal->nid = sysfs_goal->nid;
+			break;
 		default:
 			break;
 		}
-- 
2.43.0

