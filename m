Received: from mail-dl2-f43.google.com (mail-dl2-f43.google.com [74.125.229.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9B94373BF6
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 02:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790736683; cv=none; b=CdezHFHwEkOUJ68O7a9PFIF1a4wE6PCix8EU0UicHQLWE9LbBOwSzO0EvbxCjZw2BjRGSQsYeXmJuWhuQe3WElzk2DxihShWj/aCRDZyicD7YSJkIGPsCGxNbBwLZN81eO48WsEkwjWLPWQ8CPcMa4lOAgp+VBvBnJrHjKkgecM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790736683; c=relaxed/simple;
	bh=3RCQiiGiOcS89Sc7XimbHotJkA/dulcxRVmBe0BF3MA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UaWOFDR+B3MsqqGONZyKWOrxURFcJaHXSgn0zSog9T+TNBFX2btnP3sTiV4td2rZ8dYNAnXErIFBAT8MNRjtWFYNESnkdJfoCoZH24+qgztAZMeGkdjdFsI/kLe/npjyPtQmkvHX4bhMQBR/poFU7ShbsQuAOZeG8mEKY221dAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mr8bdhGB; arc=none smtp.client-ip=74.125.229.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mr8bdhGB"
Received: by mail-dl2-f43.google.com with SMTP id a92af1059eb24-1450541ab18so5262389c88.0
        for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 19:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790736678; x=1791341478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=udxMl2iGuUO1ZRkCUqUYDdpK0NWx0fsMJs0kN/8DGsY=;
        b=mr8bdhGBXTbi5l3DVDL3vRbb7YkLQZ7dvdNLkDSsyioMGlMIJsgIQdYRb4UiEtixIn
         NBpWx4Wf1PRWqitY5IYGc059PqQARtANLoQv3c0Epiz/CgUL0NtwEyHQIU6UWmajyi0t
         6H8g5Rh1T26aeXigGEmwzHUqTrPmFwy4q5QXY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790736678; x=1791341478;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=udxMl2iGuUO1ZRkCUqUYDdpK0NWx0fsMJs0kN/8DGsY=;
        b=1TE2HA2bVgKTdhN0ROh4dANZSLoF8py6nGkNNO+b3r0TNKBbDKwjbD+YAhroX24ZpJ
         /WCkPoe9v/pcec1PjrdTY2vggge4RLKpc5JOq28jipZPdDSGmwQFCkbiHVreNdA4RZ+q
         jE9KkPOWSBLMHIHne3a5Wwk06zXXp+pCmWfpOaptakm04Kk/ZVOemDl2z+1OhELvkttn
         8qAsIKBVKl8vhSX8pY092Vlr1koVJukg2LO5tCR2H2b4mqaMBY5YYFMBV0aj3WD8j9HJ
         fBtailfphYZ/eUtd0V0IZRdkI7CCMpgF95Y2LM7PI49bPAeR0sDkWkhd/AJbVQ4fRLcX
         o08Q==
X-Forwarded-Encrypted: i=1; AKwUvBy734U4Rp79NfvW6WBFquSm+5b+gY2ADA6ymGR0AjtdZbRcW7Z7P4P3yQ1sB51IrbYSaIPyyrREWBM=@vger.kernel.org
X-Gm-Message-State: AFuF++nq6R/gg1kiSNhDay03mSABCkGjsWUeSpv8ZNbnD86b15SwyJBL
	9d4H54vLU7jQbe/+aTbzFFWLHqq0G3Gtk7okajBrJIwX1aZfdlDdAwrvL6JF/OwuMA==
X-Gm-Gg: AYBFou1UpOQiEggzHdcP1mgAOvR/4uAjuu41xlwvh0VlE+CsJXtZBeelp0dfakF3yPo
	O0v8z3adMn29Y+eRe3xk+ajEyFI2ehBtJd07GqTd9xXwKGsEsHl9yhSItFmRk6D4lyt/broNZSb
	MLz3YXFp0AqZy9nGVm3xvWEgR33y2DLy2FQM5MuCsnjQUdmJvX32RPdmpr1e3BcXE+DtUeJOpWJ
	/bZTqbXiIbB5EYWLvv2kC2KGWli26QgjkTBKtzp80tFciu1A1jKkXX5Vff46IkoRxPJVqCsWS09
	o+plSu4QEM/ZJJy2RNQmTme6uOTlGNRH/fsKtVjMFeDJC4jUIJqiddStcAFo/qq82L9//cYzqHV
	z2GHzZvxJMl6kAOk6FCZ45RY9bBICQe7KTDDM/wKzMPJy9kp0GKHlxWNtCR3vOYP1AMiMGn9PCI
	RGtncEtJziVqRXsj+bhwQD30gS4tuOZ3prV3WRXi8m06ewgCy5TYenoapITCZSvWnHf0QXGBVGF
	pY29nGo1vKNmhuotrI3SeFvffINVX9+emTXwJMgOu959RM=
X-Received: by 2002:a05:701b:230c:b0:144:fd7c:84f4 with SMTP id a92af1059eb24-14c9c65f884mr1852704c88.5.1790736677848;
        Tue, 29 Sep 2026 19:51:17 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5f5a:aa9:d06d:b4a7])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-14d083fe728sm229720c88.6.2026.09.29.19.51.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 19:51:17 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	Ulf Hansson <ulfh@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Len Brown <lenb@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v3 7/8] PM: runtime: Expand introduction with core concepts and structure
Date: Tue, 29 Sep 2026 19:49:55 -0700
Message-ID: <20260929194956.v3.7.I45a794e4452e3df22419acdd8f11e2b788b3413f@changeid>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260930025044.104824-1-briannorris@chromium.org>
References: <20260930025044.104824-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I commonly see people have difficulty learning how runtime PM works
because of the following key points [*]:

 1) there are several boolean concepts in runtime PM, with somewhat
    similar meanings:

     enabled / disabled
     active / suspended
     allowed / forbidden

 2) if these concepts are documented at all, they're scattered across
    the kerneldoc or Documentation/

 3) the runtime_pm.rst docs don't make any attempt to ease a reader into
    understanding the concepts, and instead jump straight into how it's
    implemented (queues, 'struct device' fields, helpers).

Let's try to remedy this a bit by discussing the core concepts and
highlights at the top of the introduction, and introduce a few
sub-headings, so it's easier to navigate different aspects of the
introduction.

While shuffling the intro around, I also see that the existing text
largely mirrors the layout of the following sections (2, 3, and 4), but
does so out of order. Reorder those, and point to section numbers.

[*] In addition to API complexity. I count 61 pm_*() helpers, 7 of which
    are variations of put() and 8 of which are variations of get().

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

(no changes since v2)

Changes in v2:
Address review feedback around descriptions of "enabled" and "active". I
know not every point of discussion was settled, but I hope this updated
version resolves many of them and provides a better basis for further
improvement.
 * Avoid calling enabled and active "orthogonal"
 * Describe more of their inter-relationship
 * Prioritize talking about "enabled" first, since that's the first
   concept a reader should know about
 * Brief mentions of parent/child and supplier/consumer, and dependency
   handling
 * Other tweaks

 Documentation/power/runtime_pm.rst | 103 +++++++++++++++++++++++------
 1 file changed, 84 insertions(+), 19 deletions(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 68903d93a3e7..c63fbf0ff862 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -13,31 +13,96 @@ Runtime Power Management Framework for I/O Devices
 1. Introduction
 ===============
 
-Support for runtime power management (runtime PM) of I/O devices is provided
-at the power management core (PM core) level by means of:
-
-* The power management workqueue pm_wq in which bus types and device drivers can
-  put their PM-related work items.  It is strongly recommended that pm_wq be
-  used for queuing all work items related to runtime PM, because this allows
-  them to be synchronized with system-wide power transitions (suspend to RAM,
-  hibernation and resume from system sleep states).  pm_wq is declared in
-  include/linux/pm_runtime.h and defined in kernel/power/main.c.
-
-* A number of runtime PM fields in the 'power' member of 'struct device' (which
-  is of the type 'struct dev_pm_info', defined in include/linux/pm.h) that can
-  be used for synchronizing runtime PM operations with one another.
+Runtime power management (or runtime PM, sometimes shortened to RPM) allows
+individual I/O devices to transition between high and low-power states
+dynamically while the system is running, conserving power without waiting for a
+system-wide sleep state.
+
+Core Concepts
+-------------
+
+Understanding runtime PM requires distinguishing between several pairs of
+related but distinct concepts that apply to each device: **enabled** /
+**disabled**, **active** / **suspended**, and **allowed** / **forbidden**.
+
+* **Enabled**: To use runtime PM to manage a device's power states, it must
+  first be **enabled**. If RPM is never enabled for a device, it generally
+  stays inactive from an RPM perspective, and the PM core will ignore it.
+  If it is enabled, the PM core can manage the device status (see **Active**
+  below) according to its understanding of whether the device is in use, and
+  perform state transitions via the appropriate PM callbacks
+  (->runtime_suspend(), ->runtime_resume()).
+
+  Each device has an internal disable counter (``disable_depth``) which
+  determines whether runtime PM is currently enabled. Devices are initially
+  registered with runtime PM disabled (``disable_depth == 1``), though some bus
+  types (such as PCI) may enable it before driver probe.
+
+  To opt into runtime PM, a driver first ensures that the device's recorded
+  status matches its actual physical state (for example, by calling
+  pm_runtime_set_active() if the device was powered on at probe) and then calls
+  pm_runtime_enable(), decrementing ``disable_depth`` to zero (i.e.,
+  **enabled**). Runtime PM may be disabled again explicitly via
+  pm_runtime_disable() or temporarily during system sleep transitions.
+
+* **Active**: The PM core tracks a device's runtime status as either **active**
+  (the device is operational, having completed its resume callback or otherwise
+  marked active) or **suspended** (the device is idle or in a low-power state,
+  having completed its suspend callback or otherwise marked suspended), along
+  with transitional **suspending** and **resuming** phases. When runtime PM is
+  **enabled**, state transitions are primarily driven by reference counting:
+  drivers call pm_runtime_resume_and_get() (or related variants) before using
+  the hardware, to ensure the device is active; and pm_runtime_put() (or
+  related variants) once work completes. When a device's usage counter drops to
+  zero and its dependencies (children or consumers) are suspended, the PM core
+  can suspend the device immediately or after an autosuspend delay.
+
+  Besides driving the state of the device in question, a device's runtime
+  status also affects those of its dependencies — its parent (if the parent's
+  ``power.ignore_children`` is false) and its linked supplier device(s) (for
+  links with the ``DL_FLAG_PM_RUNTIME`` flag). An **active** device holds
+  reference counts on its dependencies, preventing them from suspending.
+
+* **Allowed**: System policy and user space govern whether dynamic suspension
+  is permitted through the concepts of **allowed** and **forbidden**,
+  manipulated in-kernel via pm_runtime_allow() and pm_runtime_forbid() and
+  exposed to user space through the ``/sys/devices/.../power/control``
+  attribute. When runtime PM is forbidden (``control`` set to ``on``), the PM
+  core increments the device's usage counter, forcing the device to remain
+  active regardless of whether the driver is idle. When runtime PM is allowed
+  (``control`` set to ``auto``), this reference is dropped, permitting the PM
+  core to automatically suspend the device whenever its driver and child
+  devices are no longer using it.
+
+Notably, runtime PM also has a feature called "autosuspend." This is different
+than the ``control`` notion of "auto" (i.e., "allowed"). Autosuspend is
+described in more detail in `Section 9`_.
+
+Implementation Structure
+------------------------
+
+Support for runtime power management is provided at the power management core
+(PM core) level by means of:
 
 * Three device runtime PM callbacks in 'struct dev_pm_ops' (defined in
-  include/linux/pm.h).
+  include/linux/pm.h). See `Section 2`_.
+
+* A number of runtime PM fields in the 'power' member of 'struct device' that
+  can be used for synchronizing runtime PM operations with one another. These
+  are covered in `Section 3`_.
 
 * A set of helper functions defined in drivers/base/power/runtime.c that can be
   used for carrying out runtime PM operations in such a way that the
-  synchronization between them is taken care of by the PM core.  Bus types and
-  device drivers are encouraged to use these functions.
+  synchronization between them is taken care of by the PM core. Bus types and
+  device drivers are encouraged to use these functions. They are covered in
+  `Section 4`_.
 
-The runtime PM callbacks present in 'struct dev_pm_ops', the device runtime PM
-fields of 'struct dev_pm_info' and the core helper functions provided for
-runtime PM are described below.
+* The power management workqueue pm_wq in which bus types and device drivers can
+  put their PM-related work items. It is strongly recommended that pm_wq be
+  used for queuing all work items related to runtime PM, because this allows
+  them to be synchronized with system-wide power transitions (suspend to RAM,
+  hibernation and resume from system sleep states). pm_wq is declared in
+  include/linux/pm_runtime.h and defined in kernel/power/main.c.
 
 .. _Section 2:
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

