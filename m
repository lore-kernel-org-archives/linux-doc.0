Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF7E40E8E1
	for <linux-doc@vger.kernel.org>; Mon,  7 Sep 2026 06:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763548; cv=none; b=VUwTlThMTtWgBO3xYK+IwzOQbKrGGpvm8+jR/R43QN038ZUNVhR75R3scPAALbHMYT6/uWlpfpG4LnTZoo7iMnS07rXcmC84RzVlIlOceJzVqq9rO5ye4X1LDX4IufNAfUnBgFrOw7wMrqHPWiAnlQANLaH8ywopDDNacQ9paH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763548; c=relaxed/simple;
	bh=5fUeK/Z5b3ew/Qab9dwvTg8ptqVTibIEMxGUMA1R2/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ubkIR1wFzZMPnozfsYbopbBDw2vjZRdVyGMMbnkQG0bPV7pL6w+Ds97pNdcTvi27wGoAsqlvDm4Eyi7rt1r1YLM5yTPCoEiGjP7UjbbwFnB6kqYW9V3G78yGp20FabPKs3jTcY3NthTMBzJYOHXjPLpOgO/hKvVXjaqja8AF6mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2OcIATn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2OcIATn"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-398e9698a70so2744312a91.0
        for <linux-doc@vger.kernel.org>; Sun, 06 Sep 2026 23:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763547; x=1789368347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRkujaorlRRownXMQ24CydTkW9kZUj9cAg9923H2gP4=;
        b=V2OcIATnVVro2MsY3OySyMiCqcnRDyx+tbptnBpq9B+d+OcNzPtlhieouEqOEAhP2l
         tbPNIg8Rud+fDeLtrOevThoM8fXbuPpQ0ulf2lCcP+gYxaWLDD5vWXpldSE31IPUxvjD
         qzkR1fTGI4X7pRC2pNDqqofAJPkO+j656adGoj9FbqGU4IWEAP8NqRBo3X5G3UpOiaAZ
         PPuaGZmTFDXTYqdkiIOBLoharWjcizIgA05jWUb9hgDaC0hqiEFL8qeGXHfHS2dNhlXF
         s4l0JXWHh/c9/X25DDDdrqdqk1ruIpGM7QzrTItAQhNDCRSA+EVPr7oHK83PYo1My83l
         RxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763547; x=1789368347;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRkujaorlRRownXMQ24CydTkW9kZUj9cAg9923H2gP4=;
        b=U+RQS5YrmlBDIXBOt/z9Vp5BRRySGWR4yZtC4iZ265KEg1hPa9q5WgRnYdDTipGJXM
         i7oLF4a8Io3jM+ygzKJAKFzR1coiZKqTuo6F+clUJoxo4hqedj2AVrJaz83JBOJ8KWNv
         rjp66CuKMfxhsKKibCw11nEYe14Mb1ZrhjZAaPk/IW7QxC9C2DrLWfSlhOWkbYAO/d+i
         msdOI63zGj+LU0FQYg9CA2vsyVBoaFMxo3CNVW2oDNqCl7OQ09FTu7VncE5EKMZFJ3mU
         CHd/D+Hsu0S2WeBttwut1qMFPVXMgIWmh6xmZdSyl2d36ZwN34FG8TW8nqrId/9e/Smp
         IxnQ==
X-Forwarded-Encrypted: i=1; AKwUvBxKgNNu3w/dn2zaMliVrK2t+kf1kZAE7QAvA3xJGLesJcCUgPfy7taVv4R8O3rvqSZnkrkforwvong=@vger.kernel.org
X-Gm-Message-State: AFuF++msFN0qww2Jz+//h9EU7ITyk6eYnzqa86vGEqHJJpHDbsQUFLDg
	2O5gXGDp4tFpddsdZa4UrlhJLUotmSml7dZL5KxGg4HKJFIFBNO5H+CN
X-Gm-Gg: AYBFou3pna46kgzw5owctP/++ay6d/1WgMy8xh7AQevh8ZKNe+uu1HfNn2fJvZWSRwC
	e78Rj99SHmUJ3q8uhNp5ypmsPvKEQMgK+JJGAqDKy9edYlEbSMtDiWEhW9bZBPp2i9qwbJtK4c4
	jQRuVHVU9QBZRY+g1Teyz74DMAZEC5qfHvWDU4u2DQsqQygHzvjvdV2o8J1Q9B0rqzfgpWCcRU9
	BcFwXbJTs1panv57TvYVhpOGUqrlznp8bbhi5SIKKwNM+l8hGKg1maH4enDXZzYQExBwWEz/qrp
	6blqzzYaPABQJDFkfcy9kbnCm5GFe1I35q10Dz9r/Cp66W/NW/EurH52tTjEWTp4axz/CDYcauw
	kfZ6BpKHotL9cwNXtVzD5YshEgYe37uqMLBgQV2+DY2wChB3VuHF+6fYq9GhgaW9Px53AGdFE8B
	i8xyowyQ3mVGIZs8nJTZaUM1FD3vMCd2/pAwA3u0fNaeJs+kKM5QUoIri2IiXtnArynVPQILv2j
	sbXFDgfvsUl+g==
X-Received: by 2002:a17:90b:4d06:b0:366:10f1:3d91 with SMTP id 98e67ed59e1d1-39b2614df74mr30463582a91.1.1788763546458;
        Sun, 06 Sep 2026 23:45:46 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm17209594c88.8.2026.09.06.23.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:45:46 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/2] Documentation/networking: fix repeated words in comments
Date: Mon,  7 Sep 2026 12:15:28 +0530
Message-ID: <20260907064528.6602-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064528.6602-1-hemanth.selam@gmail.com>
References: <20260907064528.6602-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
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
 
-- 
2.48.1

