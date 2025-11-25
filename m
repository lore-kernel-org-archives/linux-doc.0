Received: from sg-1-105.ptr.blmpb.com (sg-1-105.ptr.blmpb.com [118.26.132.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A0719E839
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 05:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=118.26.132.105
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764049043; cv=none; b=nLfBosudmJZbIpvsdlOZwCjdqeixUBSkiET3sfbyvO9XZiFCJNbFMBCaO2g1g0MpbJ4T2xGZMCZkk9Y8CBk8U2TwEIGByXKBQWlTKVjH7VbFytF5Z/32KuAYGclYhkIIzPH/Db2pDa7QMdFwbPOE+zVX4/n1EoPa25gGTg7nkK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764049043; c=relaxed/simple;
	bh=w5La5jh/Uv+izbAgl+V1CQn4LnGRc796eOW0W2uY7ac=;
	h=Message-Id:Content-Type:Date:From:Subject:Mime-Version:To; b=eqHUUN+QyMisgnLk3xB1s+mnhPUd9Ka4fXKQ6I0BKCTReyIukN23Ih/xyzxkJ6ZPGQGZU6eGxzAo9yYpUNDuXsKREL22uSPWUfS4+clLatD0YvAaqn0DjRt0ggX+RvVFJhR5+k9muPludf0ZaZh+7CVRJPn/n0rLMzOq8JoODl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ePrgSRei; arc=none smtp.client-ip=118.26.132.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ePrgSRei"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1764049027; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=8hT0NKOOjIYiXgplfiKmdVgvR5DExh+esozZ/H+1RSI=;
 b=ePrgSReitGrQtByYtd1SveM3zt0LGMoYyj64SNi9rn3AB7yUPT2ub+F0TCdaBOvdAimXlk
 /MN4KK/IHlFCJnFXtXXdmNrlTxpEgpXCBC6RL08Y5HoGHWcDwMUOQEg88MEkgjHTgqRiry
 OCgy62EWfLCJ5trMAk4ohdoyxK3MMi6O+WPiz96mLz2plsfpr4+cDyAvYThTJu3hlEM5Tx
 O8Vy/FXSr9dbqvuf7gRX2NgMZjDabgtvs9g93X5efP1yjE9rnVysnJm2BZ84WhbAyjbT2G
 bq9d8jt60Ev1qkwRrpd4BtCedTN/50MKabBngFs76fvYFJCh3R7FOzj+CL6Xkw==
Message-Id: <20251125053406.148219-1-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Nov 2025 13:34:06 +0800
From: "Jian Zhang" <zhangjian.3032@bytedance.com>
Subject: [PATCH] Docs: admin/kernel-parameters: Add trace_clock=tai
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Lms-Return-Path: <lba+269254081+e510a3+vger.kernel.org+zhangjian.3032@bytedance.com>
To: "Jonathan Corbet" <corbet@lwn.net>, 
	"Andrew Morton" <akpm@linux-foundation.org>, 
	"Borislav Petkov (AMD)" <bp@alien8.de>, 
	"Peter Zijlstra (Intel)" <peterz@infradead.org>, 
	"Pawan Gupta" <pawan.kumar.gupta@linux.intel.com>, 
	"Petr Mladek" <pmladek@suse.com>, 
	"Feng Tang" <feng.tang@linux.alibaba.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, "Kees Cook" <kees@kernel.org>, 
	"Arnd Bergmann" <arnd@arndb.de>, 
	"Frank van der Linden" <fvdl@google.com>, 
	"Bjorn Helgaas" <bhelgaas@google.com>, <linux-doc@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
X-Original-From: Jian Zhang <zhangjian.3032@bytedance.com>

After CLOCK_TAI is added, add missing option trace_clock=tai.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 6c42061ca20e..fdbd2149f321 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7452,6 +7452,7 @@
 			mono_raw - Use ktime_get_raw_fast_ns() for time
 				stamps.
 			boot - Use ktime_get_boot_fast_ns() for time stamps.
+			tai - Use ktime_get_tai_fast_ns() for time stamps.
 			Architectures may add more clocks. See
 			Documentation/trace/ftrace.rst for more details.
 
-- 
2.47.0
