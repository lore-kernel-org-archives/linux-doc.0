Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BFE305666;
	Thu, 23 Jul 2026 01:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770675; cv=none; b=i1jFEYgRU1/JbzlqlWptqX6d59TyZS43W6p/8cNWdPcWFUZRlnt+IfuRlp+zGcsaUISZpdIYFfeTRePj2nM1kJB7zAH6u6Oa9p/OvocnAzJVrECN3Umo0Wgt1Jf6NqPQwTgoO5LQFKnyxv7crVSr8t7stYb1SAwIVqbvjezf50s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770675; c=relaxed/simple;
	bh=0Z08NEVZ3WBscaXfo3JMSWa9G5cN5U079yPU4pPGwhc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKH0I0Tou+EZrb4Ejm5uiOMi06ntZ19tzwtaBNteRr3GMV52U9t66za00kQB/Hs6nvb39LlFL+vrRmvQnZxWJKqwP7U84CV+8CwJme1GHouI9yeN3Q09IUJf428NHbAsJanTgQNdXLpUwSSrgj0Fnr6Bln49lX6vFe7nO09PeBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aUc1EdB5; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aUc1EdB5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784770674; x=1816306674;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0Z08NEVZ3WBscaXfo3JMSWa9G5cN5U079yPU4pPGwhc=;
  b=aUc1EdB50yBi8v4vE158x5G+Yc52kfyMA0i5tQLJEEz6qD0tbBYOiAP8
   82Y2S0wAeDj2BxgJL1WwDYkknMStLIaGCTzBmkmdwpy+0Toq8ldG+miP+
   oVqm2cJx9HBmwY0YW6MqkOxRr0gHY6c6BfLredE86ycjrj7/prUdb7/AU
   5Szq4thLEPbCVLySLmO8G6FhzSC+JzPHLaN85prcd2dvDrZEuR3mkDOlN
   ozxHyyPcGe8WBqQQNLbO/BG2NeaarsMfI14BR+eiBfxGSaqjIzSRmgou1
   hw8Jz6vQEafx1nBYcKvXY1ePM/lgDd+rc7udYoAHKz40UE4V5YhNnxGNU
   Q==;
X-CSE-ConnectionGUID: nTHseQOrTjyrq4SkFB1u8A==
X-CSE-MsgGUID: Jto1SK1uSc+WtDhYexKRUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96558572"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96558572"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:37:53 -0700
X-CSE-ConnectionGUID: i+t0P73ZQG6A89qlnLnnbA==
X-CSE-MsgGUID: lgUjlpm1Toy+x31md31S4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="258949336"
Received: from smtp.ostc.intel.com ([10.54.29.231])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 18:37:52 -0700
Received: from soc-2MQ6070HFF.clients.intel.com (unknown [10.125.128.219])
	by smtp.ostc.intel.com (Postfix) with ESMTP id 3A19A6399;
	Wed, 22 Jul 2026 18:37:52 -0700 (PDT)
From: Shreshth Srivastava <shreshth.srivastava@intel.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Borislav Petkov <bp@alien8.de>,
	Jonathan Corbet <corbet@lwn.net>,
	x86@kernel.org
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Marco Elver <elver@google.com>,
	Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Biggers <ebiggers@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Shreshth Srivastava <shreshth.srivastava@intel.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Tony Luck <tony.luck@intel.com>
Subject: [PATCH] x86/mce: Document the mce=print_all command line parameter
Date: Wed, 22 Jul 2026 18:37:30 -0700
Message-ID: <20260723013730.3033-1-shreshth.srivastava@intel.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mce=print_all command line option is supported but has never
been documented. Add it.

Suggested-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Shreshth Srivastava <shreshth.srivastava@intel.com>
Acked-by: Tony Luck <tony.luck@intel.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index eb4e0d28f74b..0ec18a5597a2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3792,6 +3792,9 @@ Kernel parameters
 		nobootlog
 			disable boot machine check logging.
 
+		print_all
+			print all machine check logs to the console.
+
 		monarchtimeout (number)
 			sets the time in us to wait for other CPUs on machine
 			checks. 0 to disable.
-- 
2.53.0

