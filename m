Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1074421244
	for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185673; cv=none; b=LdOi9e2WMjJVYQo+4Q2y3/i8XEPKZFX7vGkx8EO0tIdC2BDMQ2fmR/gnGk7WImKzmcXyiu7VAjGgkTLIULTK/aV/ShX5/quON3zz/CAGc+38CxIlXlNJS5JRRUXtk3UlzmJuzeSNfeK7X5bucnmmotScR70oOo3Vz7LPHNDYQfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185673; c=relaxed/simple;
	bh=cv3kk5egmQXlDJvzUveGMkYSNyw7O54onpjvk1Il9Oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cdbN9DMPyx7gWKcyy9YYLdeRu96rBrzZEYBjTZ7b3351neoFF8lrEu/FcU1WIs6JedCmtapb8/UKbbHF3YfBv9BkgPLwwEjwfezSgHWlCuoUIq1ucquyKCEMlgNLSk8ArlDp0AcX3P4+VFRq3kKEY97zvKJCSEb7DF/FLgeP/GA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Iaf9aUu0; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Iaf9aUu0"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso5080765ad.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Sep 2026 10:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185670; x=1790790470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/uWDBb1uS4h5PTodUKMRyx5us4JzrXxHaBUn/GM73f4=;
        b=Iaf9aUu06v6e0eQd6pI/eOMsQP69vqOBTdlydzqbu2/seILSZtQLukOHaY/R3V1sfR
         NTYPzayxomPL6lprtGil60J6mrGqVrxvvu2xoNS1NUb3C2cqDcJ9eqJE9nobZo/xnQXg
         laU1OS+/p74F8C5aWoRYpSYYFddWm7y53Xp3c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185670; x=1790790470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/uWDBb1uS4h5PTodUKMRyx5us4JzrXxHaBUn/GM73f4=;
        b=grB7wbvvlhYGkJ0n6JiIzT2Zll0HzeRBTbrjkg28aRGq3dzsQhuxwD8eA55oJOUum2
         yD017FrIDDs5fd3VQRbcTVbxl6rcmIf85qdpSxi1PB07OegsT6f57RuPwIHb4IHttxPi
         pufDi04WC1IJwmKRszgGxySNy3fKB80BLhd2NCfMVfUiCbxGMNVg0kALMsVLI1g5qz9G
         JL6ZxjZMgKdTZ/cDD94g99KCbZmuOvLJjG6X6bfJIQ1aH6RjPhYXhGjgE4CAfQMY6NPQ
         plMpBamNmIs7eNZXb+nnjKRwTqlCGVFws1jLvkg5ySwxQgaYoVl215A1E4Pt3gcWBVku
         1kwA==
X-Gm-Message-State: AFuF++nujsMQGeyDjS4mDu7AWxGkUXbWXyDeqXmtLXpIFRBgFHozfC23
	B1RZoHwNFlAwFS3+27qURGWbVaW9VfXeAFr5dJN3abcA5rRpAl2TQjw/nRvGmLU/9g==
X-Gm-Gg: AYBFou2SEqUQSmBPyjKvelDP10edGvRcPYsZpQiqRJlDoC1kNAkmybkWAI7D/76pfTK
	UPgMU0VIblvLOIz0Hij2JFifKwI9PI5ZXZRAzbMi3ZeAXJSdx5OkM7DoSD++lWIm9KUsHRnZqsU
	RoRbkBEb1fB0RKEXq+gIcOrUc0ITX2ORDJ/E28Cz6PFAJA2YKZgkWTdCg/ZF1Ly/u3qyp4aNnD+
	JDeLSwcdil1qSBLOqf6ZgTUp1iAVBHXVic74bczhIftkmnUoG0h6JeoDlyasSUeZDCgKO1CDi+6
	KzCicsNhq6Z3uvzw+0FhRxKWfdCkfZ8VbIjtggVrJ/wdR3Xwx1yxRizlv9ue6/28zwEacmwwXbX
	dYjPbMC26vdOqU00ZRwx+37sL9Ex1Xhrel7Adla8LCzvdzcINEWo3JSlpxBJfhhK5BiFdlq0vjW
	gUzB4BC5iayi0s+QtUtOu+CDVwc/nhN5DoNw0IxBsIeMsNAHRd8G1/a+V6MDU/vFyyEnccARDjJ
	vs9/0+F6pFaPwVRRbxyw335TA3XlqYn4ixOdw==
X-Received: by 2002:a17:903:1847:b0:2d6:f6ba:263d with SMTP id d9443c01a7336-2df69d0b3a0mr29106195ad.7.1790185670158;
        Wed, 23 Sep 2026 10:47:50 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2df6a5f4219sm15306515ad.68.2026.09.23.10.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:49 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 6/8] PM: runtime: Clarify driver callback expectations and structure Section 2
Date: Wed, 23 Sep 2026 10:40:30 -0700
Message-ID: <20260923104031.v2.6.If19ee35d3b80d115f264484b21fb003a962762fa@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Section 2 describes the three runtime callbacks, but:

1) it's fairly dense to read (150+ lines); and
2) it glosses over a big point -- that it's uncommon for drivers to
   implement ->runtime_idle()

Add a note up-front to help direct the reader about #2, and add headings
to try to break up the text a bit.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v1)

 Documentation/power/runtime_pm.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 423287fce34a..e0c20132dabd 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -54,6 +54,14 @@ There are three device runtime PM callbacks defined in 'struct dev_pm_ops'::
 	...
   };
 
+Most device drivers only need to implement ->runtime_suspend() and
+->runtime_resume(). The ->runtime_idle() callback is optional and rarely
+implemented by peripheral device drivers, as the PM core automatically handles
+suspension and autosuspend when ->runtime_idle() is omitted (or returns 0).
+
+Subsystem and Driver Callbacks
+------------------------------
+
 The ->runtime_suspend(), ->runtime_resume() and ->runtime_idle() callbacks
 are executed by the PM core for the device's subsystem that may be either of
 the following:
@@ -87,6 +95,9 @@ not block or sleep, but it also means that the synchronous helper functions
 listed at the end of `Section 4`_ may be used for that device within an
 interrupt handler or generally in an atomic context.
 
+Callback Semantics
+------------------
+
 The subsystem-level suspend callback, if present, is _entirely_ _responsible_
 for handling the suspend of the device as appropriate, which may, but need not
 include executing the device driver's own ->runtime_suspend() callback (from the
@@ -167,6 +178,9 @@ return a non-zero value (typically -EBUSY or -EAGAIN).  Unlike
 return codes from ->runtime_idle() as a fatal device error; any non-zero value
 simply stops the PM core from suspending the device.
 
+Core Guarantees and Synchronization Rules
+-----------------------------------------
+
 The helper functions provided by the PM core, described in `Section 4`_,
 guarantee that the following constraints are met with respect to runtime PM
 callbacks for one device:
-- 
2.56.0.rc1.310.g51773c2048-goog

