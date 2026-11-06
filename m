Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981210;
	b=pUBYq197dSvo9LkGmwLR5oF2UWYxXHhab50aS7jPqnyevNCWxGvJG+pP/bmIIfTETpwk
	 VDNx0aFm5gl0H+a5XmTGX7f/fxqrEQKXSC7xOhFuB9PWU1Ue4Gd6LImSV9yGi+K6ahRgv
	 GG+xNMKab+RK6qRFA3hMbXg5eRsjFIvjLrluQPTy2+8P3ljhSanbj9Kx4CUgzvBr8/7Vz
	 Icqb5sfedl8x5O6aCtLz0jU6n5hiPTz7YBHcF5poQYXogOOdpNLkA0OKBLPzMt7HPkQJx
	 MDQ1FreJn1zNeG+xpSFdujpj42sxrQYu+jRNP56FI9n54DLEPwJ+dZ9yEtDY60iDyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
	b=vEvo7XOE+37w/i35aeeQLx8ep8HLfTQFZvKIJt74SlUPqKGMosaFLVKsBxJTShLBEk7e
	 SrsBCZhSGdHTEyAsAr/i4M2o6UV5JPuW2fDAFOOt5zuorRbuQHIEyUtT/5P1vQuTVHoJC
	 2lBUP6ylWWqaq8KR/7j9N8q/BZZyy0hOccp4prynEi24GceI/sSPBXVALVWr1IHxrxCKa
	 Nt4uIDCV4ZG98TLJO1UjktPk3uhF9Wr7FU/6Zyh68apvM3OK7XHgjBDmLGTFmbS6HUsgK
	 6x3W2x9cE7DFrHr2zmtUfZg6rI3UoP1biyboTevetrm53KLwUW7YC011zVEp8vn/NVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FmSEEYOf;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE2D606A33D
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:06:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE2D606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=FmSEEYOf
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5293485e9.2
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793981208; x=1794586008; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
        b=FmSEEYOfRbAxuX4ZtuYuPL49kmYsFuLYpE7paXhrlg25qD5TsUf5jmSJ0LgW10YySh
         kqa+tK/h5HbaZm6W9ldQcm85LLc8I/E6rNLPS70ffxgbByVL/TLefIX1nS3qk0Q3tX8u
         JuMra9Xy6bp0v54JsLwrlyCA4R9MZaY7oU3xRo/2fCK1Kqm6lFeufdd1t9TJzEA/S2fj
         WaOJdBiwp7HtVc7O0P4lqACnR5Ce2RzkVffe1TFtcw74tlI7WwFD8Bp/L9/NXwVgqrWF
         s79OLC/ecq4HY0eF88ZzVMg9m3bjylQF7qeGeSQVFf2GvpiCIBChJCS235tLvR5VPX2V
         t5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981208; x=1794586008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WJzbf28TF6HkN7JNOqMOcLqHDlrTilq9qsNwsPdOZyY=;
        b=jLxv6bplP3vaiEt+OqVLO0fsQURuqgUGoEtKXeZ6Rd6m8PDD8JUzOg5UxvlAoeFx40
         HmWNL9e83t3+qZUNwdU8cD/al7yMUM5oK2ispg1RudtXmDMaBACbQJNDSssta79WmI2q
         am89t/2zpirq9IGyb4AhER1K+7Pl4AFplshZ3ok0S02mf+rE2IS37zJyrm4AJvBqB1Sk
         GFK+0Wc8tV7YhwR9ExJhP2neqvmgbpakprQg0JSHoPUhprebDDVNwMGzbQ/LscRP/qhw
         +xBl73H9o4ORAQExPVesNsNNMptVlxSQuGqyESdWB6E27YNxhzTiXj02R67ZTFtWYr7D
         1IAg==
X-Forwarded-Encrypted: i=1; AKwUvBzFn2+fHlQH1XZDHa4/6wC4jCiNTyraWVATGbyISTw61VND+M1boFzmV4s8U4LecRLEZ9RdL86vfsg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+C+2vJ1TX3Vw+gfP6jwnOhPB7CuxdokJ+9sw5ZOzaIsnjVK3F
	PcV99NpWvr4w3i4aznF3+WyT39zpHGumMP05118HmIiDzRUKPTJMn/LI/ljZV33YKeE=
X-Gm-Gg: AYBFou3LS/0TSQUShujMpfz2APN5QMiQa9Cfl+VCDP9jnJzh7xQqxmnhf1+QWIeyR/s
	uUyabl25LZreOuX6LLpklk9rEDGEiFiwAdozcHvtPtPLMVrZqIqx0ObUFc6jvfRVcf2AFfIGvOX
	NxyG7INsE2ICdSsUDDlDr6iZIS2mP/pGpswMG6DQIP6YpwVidBovstzqhtjYbw0n9/qlvLzfAjl
	fAi2ZOAwNzDERrTykF5OidDtGedFfAiFnUDFwlKCVJrJYwqNCfjhYTvpoDTDpR7Y75Jph7sJmDq
	pPLdWeRr4Ybq5IQ+2G+7yX7++04PqPGUqE3SFJxjOC9Yugs1T00psTCOKOVmZRYOHbWEBm/QspF
	Z/wRI7gWdLmoSZUfr2ogdKJOR8Gs3kJHOBRMobrIB4ZXiPb/B6ssR2Qe/I9Gg9DsyBDUHGOHpx+
	EomzPaBd4Ic1CJXw4NPjk+FOX4UOsy2dWW/z+Yxhr+eLw6MrEeYv9eSNTcJD2cMV7v5KVL6oz78
	xXv0DjW2uFNW+GSJw1B3DxxHt6VwHKBmaxvux3qbySoN9axE2XYBl/jAqLOc/cPqd+4tUKO4Tz4
	0tuJcFbtXIj3TTX0jI1lm47GcvtfomM5sZQAqxkjQT5n9T1Xswb9
X-Received: by 2002:a05:600c:6095:b0:4a1:fb01:13 with SMTP id 5b1f17b1804b1-4b6df9bf214mr51113125e9.18.1793981208208;
        Fri, 06 Nov 2026 08:06:48 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm172665795e9.15.2026.11.06.08.06.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:06:47 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Ingo Molnar <mingo@kernel.org>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 3/3] Documentation: no_hz: Add tick stop in polling idle
Date: Fri,  6 Nov 2026 17:06:15 +0100
Message-ID: <20261106160621.347228-4-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106160621.347228-1-marco.crivellari@suse.com>
References: <20261106160621.347228-1-marco.crivellari@suse.com>
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

On nohz_full CPUs the scheduling-clock tick is stopped while polling.
Update the documentation accordingly.

Cc: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: Thomas Gleixner <tglx@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
---
 Documentation/timers/no_hz.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/timers/no_hz.rst b/Documentation/timers/no_hz.rst
index 4006cab64079..d3ada4a0ebea 100644
--- a/Documentation/timers/no_hz.rst
+++ b/Documentation/timers/no_hz.rst
@@ -246,6 +246,9 @@ Known Issues
 		be even worse than that of dyntick-idle.  Furthermore,
 		this parameter effectively disables Turbo Mode on Intel
 		CPUs, which can significantly reduce maximum performance.
+		Note also that on nohz_full CPUs the scheduling-clock tick
+		is stopped while polling, so that it does not keep running
+		and interrupt the task once it resumes after idle.
 
 *	Adaptive-ticks slows user/kernel transitions slightly.
 	This is not expected to be a problem for computationally intensive
-- 
2.56.0

