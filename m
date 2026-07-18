Received: from tbjjbihbhdcb.turbo-smtp.net (tbjjbihbhdcb.turbo-smtp.net [199.187.173.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4354538BF7A
	for <linux-doc@vger.kernel.org>; Sat, 18 Jul 2026 15:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.187.173.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784387988; cv=none; b=rlSl6qE1l0X1n0UddakjhgImLrJDpRvbDlV1TIZwcnrhYrZdXTiuqQ3zZbpR3aV2+E0rDTtwGswYtfzX6dPFODRDkgg5CWw3UK4MV8Tpq/xXxrzIEUEqWpP/0hZI8ypPkt/IMALyrQAo4yVvcDVLFdhSVfhUL9juMMxkONezRjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784387988; c=relaxed/simple;
	bh=Bj01rTs72G5G3hTMUGs2u01wBQoDXkn1eEinImEKYHU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cgaskspLv9DnelceATa9afSpD/pfxAlU0orR2C37rBIJ+XIZv0aQ2pAM45pDGrMP+gGBelw7LpZ6p92ohiSWgHY0W+gZmYQUUAOqzxwcBTomQ6DM7B5W/72Im1r8u4TlcW5i7HeNKaguKe65j3XTW/U+5/5lxYPsyUra7Q6C2D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me; spf=pass smtp.mailfrom=yahyatoubali.me; dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b=jngG6zSW; arc=none smtp.client-ip=199.187.173.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahyatoubali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yahyatoubali.me header.i=@yahyatoubali.me header.b="jngG6zSW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yahyatoubali.me; s=turbo-smtp; x=1784992787; h=Received:
	Received:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	References:MIME-Version:Content-Transfer-Encoding:Feedback-Id;
	bh=Fiz0WkfSo74SZTPU6D0LhG/TiRSGhDPRCVJNIa4nQHc=; b=jngG6zSWCPhMI
	Uzf46sNsMMcJyKnS/5gZOwpT7U3BiHcZi/nZLOpE9O4DF8Mnnfmpo8gU74kzodSt
	MEaN6vzjB7pxYaJVn5Aq7nE/9T21yxwd5uBrOWUy5e9hmhDhxUrQ8as0mMuWMkrr
	UNFqM8y1YQnDK3UZ5USlQlMivE65nQ=
Received: (qmail 2204602 invoked from network); 18 Jul 2026 15:19:46 -0000
Received: from 105.76.9.106  by turbo-smtp.com with SMTP; 18 Jul 2026 15:19:44 -0000
X-TurboSMTP-Tracking: 64-018cfb16-00001e63a859b342c005-005-4288bd4b
From: Yahya Toubali <yahya@yahyatoubali.me>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Mark Pearson <mpearson-lenovo@squebb.ca>, "Derek J. Clark" <derekjohn.clark@gmail.com>, Armin Wolf <W_Armin@gmx.de>, linux-doc@vger.kernel.org (open list:DOCUMENTATION), linux-kernel@vger.kernel.org (open list), platform-driver-x86@vger.kernel.org (open list:LENOVO drivers)
Cc: Yahya Toubali <yahya@yahyatoubali.me>
Subject: [PATCH 4/5] Documentation: fix spelling typos
Date: Sat, 18 Jul 2026 16:19:10 +0100
Message-ID: <20260718151913.1892547-4-yahya@yahyatoubali.me>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718151913.1892547-1-yahya@yahyatoubali.me>
References: <20260718151913.1892547-1-yahya@yahyatoubali.me>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-Id: 26016534

Fix 'Minumum' -> 'Minimum' in lenovo-wmi-other.rst and 'maintainance' -> 'maintenance' in housekeeping.rst.

Signed-off-by: Yahya Toubali <yahya@yahyatoubali.me>
---
 Documentation/core-api/housekeeping.rst        | 4 +++-
 Documentation/wmi/devices/lenovo-wmi-other.rst | 2 +-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index ccb0a88b9cb3..f4dc5f9337b1 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ======================================
 Housekeeping
 ======================================
@@ -9,7 +11,7 @@ extreme workloads can't stand, such as in some DPDK usecases.
 
 The kernel work moved away by CPU isolation is commonly described as
 "housekeeping" because it includes ground work that performs cleanups,
-statistics maintainance and actions relying on them, memory release,
+statistics maintenance and actions relying on them, memory release,
 various deferrals etc...
 
 Sometimes housekeeping is just some unbound work (unbound workqueues,
diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
index 011054d64eac..65cb78ef285a 100644
--- a/Documentation/wmi/devices/lenovo-wmi-other.rst
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -163,5 +163,5 @@ data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
     [WmiDataId(1), read, Description("Mode.")] uint32 NumOfFans;
     [WmiDataId(2), read, Description("Fan ID."), WmiSizeIs("NumOfFans")] uint32 FanId[];
     [WmiDataId(3), read, Description("Maximum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMaxSpeed[];
-    [WmiDataId(4), read, Description("Minumum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
+    [WmiDataId(4), read, Description("Minimum Fan Speed."), WmiSizeIs("NumOfFans")] uint32 FanMinSpeed[];
   };
-- 
2.55.0


