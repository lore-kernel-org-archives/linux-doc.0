Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F91480353
	for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 14:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396801; cv=none; b=HoT81qiM/W7TGpgBR/vWe1G1lMa7DOlUTBcf1fOEOImM1NrMcNxkZFdZuQ6yjrnTTeUFjkIxqaAJ4yOlYCZ9+HXYFJkT15675Z7Y1RTMbQ/xjzjVCov0mM/NxUZD6tw0KlleuJq9kGRw2agZveo7iiW/qt05IEGH0MpyjWwXz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396801; c=relaxed/simple;
	bh=k5pbw3gWXkD+2lSDgyawLTDWIcAys0OeL71nHG/+9K0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l8cMboPo/C/+t+/+5Ob5ACm42Oln+m1D9e/wbycyTBUuGIRUNgHMBJAg5pOaIGg1EnC9xBggsND2pilyLhttJwwRmQYYHGkrhbWg+fuan+OxfLEaKUh7IyhAcc7H/mWHvC3JZl20feDZp8vUiRGWGyTYB/igZ7ANs2cKS+Y+v/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e4667YEZ; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e4667YEZ"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso2047667a12.0
        for <linux-doc@vger.kernel.org>; Mon, 14 Sep 2026 07:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789396798; x=1790001598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=e4667YEZxcRS9doRa/bZ3tm6gfoQOg9hsnYwQfQlgc1bAHPbTID3GJEWtblQKpadSs
         ytMMOsmjDNSvr2xlYNOyRtBrHeoNAsK77VB/WNH8gaoa/NynfsrnOxE2ZkmrYnWgWI5D
         oBXgtfYqw15EtjIE+FE9I0jdbt0mkHPdDgy6TTIIhMJZrFhNz/VePPuKbJE2kdVM4HvP
         ajy62iQlY3k3DgjC0F5RWNgiHwxJA6UozoKpzP3sp7e8I9aFt/BqANvgyxbeCSxsphR6
         +V2zqvvjek6vhIX9ux4bwgkrN1dmhrBEUWrGQctlxQs4gteXOneufNRPxyfw4Y7NJN5X
         OTJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789396798; x=1790001598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7je+QGWbrv106IbpMWADgcAusdkekcf43RbJ56qmHI=;
        b=LEUVaMiWyVrBqvIA5ZT5Q2WTJ9Y3bI+G7BZQOF6vOnLG3Ul1ZxAX0igzmKP/P2hXNs
         u5iqTaa4hz96w4LZ1d8bIihl2ucoXDqy4yq/0Jj+QucX3hd3fxl4ixizP1z06cXrQJsd
         CoNnrFiib+slyV/fYmhJvN/L8JS+ZgXJH9wV0QM9scHTgCSncCiN93IPn75w8E6+yQmU
         XgNZH9/ytZznZdDYW4Ty1N0KbvA+BrfaaMixkuc2UugMLrd6boJ7W4ubfty9Il/uGwjR
         h2f3yfBFrB0yauKaOzlldVSVRwDh98z6A8h5N6UCVp7JUn2QWAqRg1LsTCStsHjGwOqc
         fZNg==
X-Gm-Message-State: AFuF++lqeleLnPca52ZbW54qEASQW4M+ewjHWXtvNyqNvl1OJTeMRnAi
	NaWgWb/5blis9fvvGtVmQZ53VCAw7jDsktaNDAEkFo9cXuspqaSCu6MPuGRdFo9o
X-Gm-Gg: AYBFou20e+1jv+gkJ01HPdZSX/2eKnpvQc5n/CpuweP8rP2FQ2W5McOZxd/2efHDQGV
	Ej0Ip35SLz9XQMHpGIWzH1pQvRSiMXrSUimiXpfkkY+ypRv2SULCHgIBcyat8qg6II96+RiUbUJ
	umFukc5nvK8YlvTuC2jXbFK2EqMWuB5hRc2WmvFRdVM2p/PW3472WUKps1T1R+isCaZ48n73wuz
	POj6Mx6Wd+HF9/edYA3UBPHMcyQautb5I/wndcZrZuu7+3HRSrx7EnBGsYhaWqPtkyTKf57ebXd
	/L2pirLpH72JlHxpE9tzfdgkE0f+sExYj7tTSiHVQCuZKkU+TIKCrVa9K7MX8JM5VPG+7ezxQsK
	UOtd2fUy5xwcbsO+o6dgjdhVhUJIBiwNbIpQwyLKYSG1880lM0veNOgMfNBIC+0OS99NurV/uAE
	rjUr+imnVZwe3/Lmert1OI3nv+ly8oCIritm92ooGgk7kUgsUtzVElu7GDCBl0eLuF3n01jfs7c
	M+yxIalCujCWyWVMQ==
X-Received: by 2002:a05:6a21:3383:b0:3d3:adad:f176 with SMTP id adf61e73a8af0-3db40733007mr7430953637.24.1789396798408;
        Mon, 14 Sep 2026 07:39:58 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4c6572ecasm5149444a12.22.2026.09.14.07.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 07:39:57 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: paulmck@kernel.org,
	dlustig@nvidia.com,
	joelagnelf@nvidia.com,
	corbet@lwn.net,
	akiyks@gmail.com,
	luc.maranget@inria.fr,
	j.alglave@ucl.ac.uk,
	dhowells@redhat.com,
	npiggin@gmail.com,
	boqun@kernel.org,
	peterz@infradead.org,
	will@kernel.org,
	parri.andrea@gmail.com,
	stern@rowland.harvard.edu
Cc: linux-doc@vger.kernel.org,
	lkmm@lists.linux.dev,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH v3 0/2] Documentation/litmus-tests: Add SRCU fastpath litmus tests
Date: Mon, 14 Sep 2026 22:39:40 +0800
Message-ID: <20260914143943.1503066-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves the SRCU fastpath litmus tests from
tools/memory-model/litmus-tests/ to Documentation/litmus-tests/srcu/,
as suggested by Paul McKenney.

This series splits the two litmus-test patches from the earlier
[PATCH 00/13] srcu: Round out atomic SRCU support series:
https://lore.kernel.org/rcu/20260907075829.2073224-1-kunwu.chan@linux.dev/

The two tests verify the memory ordering required by the reader-free
synchronize_srcu_atomic() fastpath: the grace-period anchor must be
ordered before the per-CPU lock-counter scan.

Patch 1 verifies that the anchor-before-scan ordering forbids a reader
from being missed by the scan, while patch 2 shows that reversing the
ordering permits the problematic outcome.

Changes in v3:
- Add a critical-section write after the smp_mb() in P1 of both
  litmus tests, so the barrier properly models the lock-increment
  to critical-section ordering in __srcu_read_lock().  The smp_mb()
  was previously vacuous because P1 had no subsequent memory access.
  Suggested by Akira Yokosawa.
- Adjust indentation of the SRCU entries in litmus-tests/README.
-v2: https://lore.kernel.org/all/20260912024225.2872265-1-kunwu.chan@gmail.com/

Changes in v2:
- Use a filter for the P0 scan result, as suggested by Paul McKenney.

Tested with herd7 7.58 using linux-kernel.cfg.
 
Kunwu Chan (2):
  Documentation/litmus-tests: Add SRCU fastpath anchor-before-scan test
  Documentation/litmus-tests: Add SRCU fastpath scan-before-anchor test

 Documentation/litmus-tests/README             | 21 +++++++
 .../SRCU-fastpath-anchor-before-scan.litmus   | 58 +++++++++++++++++++
 .../SRCU-fastpath-scan-before-anchor.litmus   | 56 ++++++++++++++++++
 3 files changed, 135 insertions(+)
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-anchor-before-scan.litmus
 create mode 100644 Documentation/litmus-tests/srcu/SRCU-fastpath-scan-before-anchor.litmus

-- 
2.43.0

