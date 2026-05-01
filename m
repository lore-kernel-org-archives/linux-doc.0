Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC80282F29
	for <linux-doc@vger.kernel.org>; Fri,  1 May 2026 04:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777610357; cv=none; b=NNv+ROpd0zZbSVWtevVzefCrfoo+txvA1psgkYs49PQtQ+6QzTRQKDIVmwYiodREHB+by/Suc6TmDnjHi1Ecps/e3gAHL5UZrpYMX/lVltLW4D+mp+qzGVuvkHDrv9JcsYBDsY6Rhs5wiXU+gxphN2zQD4brsIQPOhSAlkgPlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777610357; c=relaxed/simple;
	bh=PsQs7NLAB1RRqHwwl9eDEVrHpYZNNzCJ8N0zMmJvMrY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=BuYO3fnMd8vRvsY4+brvbe0KGW0F2YjYB93Q7qwgbL/VMwmFV7TRDpg5pZb/ODTFXOyvzx80J4gxINgBKadLwTKJsLwnT4MHoiG0u8eitWTAFCJ4RkbkM3VmwPgV9Jft7ZR7U+SnE4tnopmqsaYvr0sp08UQdFLKi1WhzWaMdTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IbKFKPwV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Z4JjHtuK; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IbKFKPwV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Z4JjHtuK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777610355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MSN4u2NPq4JEtDR+jAo6z8R+tHeobnFZ9drkUCkA2Uk=;
	b=IbKFKPwVzshCXxw5KZH1WxblQ+WfbxLT5gkgCjjTdH3RnsIARpyfXYlYMJ6rXIoTIxtQMt
	6jo38ESpyZCcbcZQuLuFXwZlJ4pMVzTRCLMRhwQuOpWwy8ZkVGykI1kAaGEqMGsVAkz2ka
	NWo8p6Z2MJvwps7zAiJUpIGy5dnz97s=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-Fgjdu12bNVS4xOAZAnHW-Q-1; Fri, 01 May 2026 00:39:14 -0400
X-MC-Unique: Fgjdu12bNVS4xOAZAnHW-Q-1
X-Mimecast-MFC-AGG-ID: Fgjdu12bNVS4xOAZAnHW-Q_1777610353
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-48a55ecc249so9612405e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Apr 2026 21:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1777610352; x=1778215152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MSN4u2NPq4JEtDR+jAo6z8R+tHeobnFZ9drkUCkA2Uk=;
        b=Z4JjHtuKH3cZoE7HOljKut6tOtOTbdRa2rEufEJY2Aspk1jUBGYtD1pMiT0AxDkchr
         V3u4B49Y9woTai+fGr1EkraF13hzwaXL07RuuSGTIpZSxYgsRb0Gkl8ie4dBCc4pWEse
         97ezw+LA1k+ElaVRml5k0cxJpFayYO0aq+0Kzbdn2K6x40/Yu55OoNlsELpoIf8wXiGU
         A2tv3UHV0lymVaUy6UPPPDaMQQL2rPf04eaLbAU1FdNGxBFwdjY6wvbYl/eNKN1MtOVD
         s8+XfpfiZrLQqsEbYUeXh9JplQj5p9zZsDUNY9tKga+3qcoeOdq+RC+f1JQ9FRQhdND+
         wYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777610352; x=1778215152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MSN4u2NPq4JEtDR+jAo6z8R+tHeobnFZ9drkUCkA2Uk=;
        b=rPvYHDM1TnDvgtREY7o0GtwO8WjSHo7jpn7fHfj9DfyVkiDyMDLV4UMenvVMcvi3Mm
         YXZOlV/6oO1GSjgCEQ/iVtSek5Ll40S3YGv2ALpkF4uMDm9PqobFElEfAa8oI58wruET
         gpwqR5J9ozOG3HLAjmE8JJ0C3ELPIzasx0yIeoE3UGSD3SXVijkNMOqgYa+qdtw15P91
         j0d7bn99ytDbQLgfXWDv+UZVV9hOaUznrtHVrX/izhDkPL+48XGGuMmuD2GeJ2E0FZJh
         IQ+OItaKkzG37lM9cEu5+D2DUEEq6vQxvT5wqPV3QRsaOyOc0D+kLPZ5av8N3jWNPke6
         RVwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9rez4uj0e6tlijp7/7r8xOhRGPx4CGK76/23MCuUrREN5rUJaGRPsoCdhosaOnkwneRFrTfqPeMvg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYWs9JgmUCvLhDxo2OFeAeAFpeG9e1LNV/snLqKxPPLOs2FQpI
	y1WMADe1Jm9LYJMye5PmoLbNtycc5SVIjL0MT4UGsUOWE30Ec0f+rEZNY1H6fKIjrD9SnttQjjI
	odBGSbfSB0Vvij9r8EXTW/6FlT1dqFl2qwKrJk6yTSz3BQkBTgNY+5JsxME0F+slI2zlosQ==
X-Gm-Gg: AeBDiet4Vep6iOAGcggOddVWAsNTyBGsDYohXETy8SnsbxX5vPu7W1erBogmSP3p8xW
	t2X4qdkYdyVpPqJBqhS8ZNRFTmzg5s9Zvle7+tJG6t/A+azVPoce1nq14aEAx3DEhYi4gydlfyn
	Y+ovOtFEEMzV8JzgRU2TdyHaNW5A4a4sdL5eYucSDsU+QdFl4nqg0A7X8/dmnKmUBb+EqKP9ROm
	Yv/+1D81AeqvkReZWIDqPffZVXeUafQfgrb9qckf++oDYJAyA+fevhLQpEssX0mu4d2ohjCJeIV
	STWfYtqwmk3kJfuNa2a8wCPbrATs0hmHhOzl6O10qt8yKxZ9PT055DgSe9V7er7WVQDF5ohdIzl
	GRwt2s7gf5rrWqnOCHuhiJqdjg432OkAbTCWmGYG/r3RbvEdX
X-Received: by 2002:a05:600c:154d:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48a8452db0fmr91959645e9.25.1777610352438;
        Thu, 30 Apr 2026 21:39:12 -0700 (PDT)
X-Received: by 2002:a05:600c:154d:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-48a8452db0fmr91959305e9.25.1777610352062;
        Thu, 30 Apr 2026 21:39:12 -0700 (PDT)
Received: from costa-tp.redhat.com ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8fede418sm5737025e9.6.2026.04.30.21.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 21:39:11 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Ryan Cheevers <cheeversr0@gmail.com>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Waiman Long <longman@redhat.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] docs: housekeeping: Fix struct member access in code example
Date: Fri,  1 May 2026 07:38:46 +0300
Message-ID: <20260501043855.980567-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No such array housekeeping_cpumasks

Fix to housekeeping.cpumasks.

Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/core-api/housekeeping.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index 92c6e53cea75..ccb0a88b9cb3 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -99,7 +99,7 @@ the same RCU read side critical section.
 A typical layout example would look like this on the update side
 (``housekeeping_update()``)::
 
-	rcu_assign_pointer(housekeeping_cpumasks[type], trial);
+	rcu_assign_pointer(housekeeping.cpumasks[type], trial);
 	synchronize_rcu();
 	flush_workqueue(example_workqueue);
 
-- 
2.53.0

