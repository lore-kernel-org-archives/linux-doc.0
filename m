Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32CB045A286
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774915; cv=none; b=LWhU3hMEW9ZH2v+EHHCAXu07PMkg6YIIAycb8e00bZCyFjI9Ma3qYCOBUqSQnhxcJi9A6R27zbxMsERu38ALR9eCsR00oG9C7TRXwM/n6JJ5qqYBMtAgFKusUHWKNXfUZc1JjFyEfa+w2eelFzYkTXqcjlUWZ7sk0evPDuYGaMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774915; c=relaxed/simple;
	bh=tDCa7ypFvLoWhXF3E8eC2MDG7wG71/R39Yigupo+2EY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QGH0MaAVb+fLDuD0APA6hqiyxvbeRs9U/21jzE3ceQ/SN7y8asXTlYcQe1DO8aquUO70p0RsiMnd8ZmDb0uaskWxejcu5o0bHISd/QDcDIX9qP2VbDZ2ovqV7+rLcfiSQdovlIEnmLjBii+DcpQGweFZ5YFiqp9YSiCh2njwSbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPZy4pId; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPZy4pId"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-38759bcd877so3371409a91.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774913; x=1789379713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kTIH4rp729nLZ+mp+FLaZ9eDX+y2kMWtUzXLWEWBJHs=;
        b=JPZy4pIdEyja1/Zz8cD7RSlL9A6TNFwv2gmRwTipVgEN2aZayza5B04LfndeTDlldu
         XnRWw2GjPP/1PrCA66SIekfaRzPzlnBBXLLUkA/Rl9m95oscfuwySc/tcNLz/5UL3ObG
         gmOb70WyJTwx3gQBui1fVFBYiGCtNY7s9g8qwQw5dlqdm09xFbhuy95wE3YWoKDu1zXm
         QXejF3jxhharvDWxA5V/W54BhE5DsBo7Qte0PfXGcpLu6pcWejcdfUqkU8L3Qa6inFDp
         68f75roel78iT49xuOM0HT1xUTWIbrtK/3kpber6bsYwUMu59kHbzfBNKnz4XvxqRAeM
         14WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774913; x=1789379713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTIH4rp729nLZ+mp+FLaZ9eDX+y2kMWtUzXLWEWBJHs=;
        b=HcAOuijm4m64Uv12xLN7L8wfQU82D+8a8qv9vWsV3s5dpMoRP6TMCsukarSnOUgoCd
         boJp0+L+D4gjkFy3R4fidrxzhhGi5jcrYGy+O6hBkQICJkQyEZbZoO6SRt+rQMq9t4vi
         LNwJiCYpQpLrwpERi41UYeQuU6eG0Q8dnM0hZ7EWT8k0L7U0RKJI2Kqmgt7qVTBu6HaD
         Mie5N9fJNyRU/XQXPnjJ7nYy+7VqEw0VGPxP54iqzPkdGTJfs/gZK+WXL/+MKKMwsbUx
         DzdfMEIPVGcHsB1XH0KAiS2HYVhW3o4zpNwKikEGSr5EnYEdJb11toxbeF4BEc58xxbO
         9CMA==
X-Forwarded-Encrypted: i=1; AKwUvByOR3ejagFD60U+P6hM77kacA+DUNvNq3iGfRCpxlXsa2o0erT5llTAOhyeuDd5ovkj/Tu7vwl1J50=@vger.kernel.org
X-Gm-Message-State: AFuF++mJNhXXbNnNucitKiEfbMS4LBs03dFMLsce4YDIbTaKqe0ixxOS
	ZNtmBMlrz3Ovi+irISjhYNSUQ7V7f+abBM0u8sbTn401lgscTf00DP/b
X-Gm-Gg: AYBFou3OGmwbGBO6p50iBBppO6JeHVDekhdR8AMEvz747VRe3t3Ek0DKA4poUb0wLF1
	vEP73yBbV5aNMpU5W++sE1yNNV7hXcrQ2CgwowhKi0qRQ7JKCKxzjXJz8K+PFydYPHiRTu8825X
	BlCjjN4vSTGot8l21RQTpJ1fXkX2TJMxnlXQsEElnNCFK/XnEn+n4TL9hqJnMNUUFHfvSIMlUDX
	HctDVF+kM+DUKTPQHlq8O/Yq8w7yIcRtn4hTW2QrCZL3mhZR2G/JI68qvDUDUf7rE9sJSddcFGJ
	ktDOhaxtq6uzFyQrbwTFVW4Jvs8I1LaXvizrRHCUsWdNItWYepomalLfD9bM0851CTW6wBNqP9y
	xt7Ko6oiKPf8/3+2ofltiK2q2BPYM7qJQ4w6xMw8WA413lItPxYTSdXn9Qlya3akZYXGHz95ohY
	u3LTRno+6dFruBy5tn8MRdFDrp2+tPVxKRHdI2S2eNzHVFFx3MfO0VuFJlQke6BJyQLzE3+rqRl
	4VVOP7R44hELA==
X-Received: by 2002:a17:90b:5289:b0:398:e96a:8999 with SMTP id 98e67ed59e1d1-39b261d0d83mr36070397a91.16.1788774913277;
        Mon, 07 Sep 2026 02:55:13 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:55:12 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH iwl-next v2 4/4] Documentation/eth/intel: fix repeated words in comments
Date: Mon,  7 Sep 2026 15:24:46 +0530
Message-ID: <20260907095446.27290-5-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095446.27290-1-hemanth.selam@gmail.com>
References: <20260907095446.27290-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop repeated words reported by checkpatch.pl. Only touches
documentation text.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to iwl-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto iwl-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064528.6602-1-hemanth.selam@gmail.com/

 Documentation/networking/device_drivers/ethernet/intel/i40e.rst | 2 +-
 Documentation/networking/device_drivers/ethernet/intel/iavf.rst | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/networking/device_drivers/ethernet/intel/i40e.rst b/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
index 53d9d5829d69..e01f0adda3f6 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/i40e.rst
@@ -692,7 +692,7 @@ queues: for each tc, <num queues>@<offset> (e.g. queues 16@0 16@16 assigns
 16 queues to tc0 at offset 0 and 16 queues to tc1 at offset 16. Max total
 number of queues for all tcs is 64 or number of cores, whichever is lower.)
 
-hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new new hardware
+hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new hardware
 offload mode in mqprio that makes full use of the mqprio options, the
 TCs, the queue configurations, and the QoS parameters.
 
diff --git a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
index eb926c3bd4cd..5840569917f5 100644
--- a/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
+++ b/Documentation/networking/device_drivers/ethernet/intel/iavf.rst
@@ -171,7 +171,7 @@ queues: for each tc, <num queues>@<offset> (e.g. queues 16@0 16@16 assigns
 16 queues to tc0 at offset 0 and 16 queues to tc1 at offset 16. Max total
 number of queues for all tcs is 64 or number of cores, whichever is lower.)
 
-hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new new hardware
+hw 1 mode channel: ‘channel’ with ‘hw’ set to 1 is a new hardware
 offload mode in mqprio that makes full use of the mqprio options, the
 TCs, the queue configurations, and the QoS parameters.
 
