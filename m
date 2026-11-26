Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.62
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795672359;
	b=sw5x0Ce0loBXYAM+/t5uMvhiH8uKt3YPZ4E6FLKzxCej8W3mLG2FqpPvdyNC7t7b8Phx
	 gW2a7UXvTFV1aON7K+LhbbRUyV6vAkeYTemO0Md1YsG22BNhOBE+aqQFWw/3kEW8lTzm2
	 I+1sHLyW/YmWC9llrSoQ+2b1S6qDkFVWByd3xnJb5Zn9zek9GT4nAK1wh23TGXPqndTGH
	 t2Atd0FX349h/s3V9qRE6hRbm7W9PLG2N5sXWQQsNQPuoAuNsCIitJsKwPZOC279tAIjU
	 ekMc/W9IROkxlD+4dDzgOtMoQpHkUq4FcU+G1TAEZcnD3tTjbsXQo0gPzDbaSO2P7hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795672359;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rp87fFVo66z0bNjr/QAS94X3yd/Vue0JZ5sGVAATgmM=;
	b=gHKrXZMuC4jcGCyCKcH8xu03QABRtD3nrlkXzXVEKDcGemhRE86VydmSWkH++MtmCGzt
	 DqE+2z9QdHDkSTx1VbaK3ZBiSj6NqU2VyaSVOxVZRSE/dhTPJ/QBaHkaGBbGUvvCZnT8w
	 ima6R7uBXwcRrn1KSpX37fHt4j1PEB7j1izCiHOLR2nIL1rd5SF3Tts1wx8UA//V+8UMz
	 EoR8dOfo+QbTzUh+ijRIofH/mdI9MsgXam9soKXQjSwGFOYW8blNSJeXzX7GhD5xI14I3
	 8DJJzfV2FBIp2eUlDKJDQQzoYXCUK/3ACztQCWsJYG387iokvQltCy05h8zQbkl7OdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QG573tJa;
	arc=none smtp.remote-ip=91.218.175.62
Received: from mta0.migadu.com (out-62.mta0.migadu.com [91.218.175.62])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91253606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 05:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91253606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=QG573tJa
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=PDJSASvlt9xJZen0jV2WM8AUZCLu70P+kYtSbovdDvs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795672356; v=1; x=1796277156;
 b=QG573tJaV654Sq6KseiWH+511Ij/DlsFvITfxRTQIVkHzfaXrNe3TpmmvmTK6hGzBqrZQkjV
 XGmgtLZfpdM/Pwa98GdUK9Meljq8EYzvB1PbtddLDt6iJNh6FRUeAXWb5OZW2kl/Rm23XEWB/bp
 hHZVVvsh76S1r+FAPLevpEN4=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id bb5f8296b098adfa;
	Thu, 26 Nov 2026 05:52:36 +0000
X-Mizu-Trace-ID: bb5f8296b098adfa
X-Migadu-Flow: FLOW_OUT
From: Guopeng Zhang <guopeng.zhang@linux.dev>
To: longman@redhat.com,
	tj@kernel.org,
	corbet@lwn.net
Cc: ridong.chen@linux.dev,
	hannes@cmpxchg.org,
	mkoutny@suse.com,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	cgroups@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guopeng Zhang <zhangguopeng@kylinos.cn>
Subject: [PATCH 2/2] docs: cgroup-v2: Document the housekeeping CPU requirement
Date: Thu, 26 Nov 2026 13:52:06 +0800
Message-ID: <20261126055206.251724-3-guopeng.zhang@linux.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126055206.251724-1-guopeng.zhang@linux.dev>
References: <20261126055206.251724-1-guopeng.zhang@linux.dev>
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

From: Guopeng Zhang <zhangguopeng@kylinos.cn>

The cpuset.cpus.partition documentation does not describe the
housekeeping CPU requirement for isolated partitions.

When full dynticks is enabled, changes to the isolated partition
configuration must leave at least one active CPU available for
housekeeping.

Signed-off-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
---
 Documentation/admin-guide/cgroup-v2.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
index 2f792ff29425..36199da5c842 100644
--- a/Documentation/admin-guide/cgroup-v2.rst
+++ b/Documentation/admin-guide/cgroup-v2.rst
@@ -2838,6 +2838,13 @@ Cpuset Interface Files
 	kernel boot command line option.  If those CPUs are to be put
 	into a partition, they have to be used in an isolated partition.
 
+	In addition to the CPU 0 restriction above, when full dynticks is
+	enabled with "nohz_full=" or the "nohz" flag of "isolcpus=", the
+	isolated partition configuration must leave at least one active CPU
+	available for housekeeping. This CPU must be outside the full-dynticks
+	CPU set, the CPUs isolated at boot using the "domain" flag of
+	"isolcpus=", and the CPUs in all isolated partitions.
+
 
 Device controller
 -----------------
-- 
2.43.0

