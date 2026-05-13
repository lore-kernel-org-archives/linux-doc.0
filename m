Received: from mail.runxiyu.org (runxiyu.org [155.138.132.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4B62BD5BF;
	Wed, 13 May 2026 00:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=155.138.132.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778633739; cv=none; b=JvX80wVptfv9XLq3NBdPnGxebjxLNqJ3JAG4ufDHpkn3Fv2aRrPBHKuiwm6qWEn/gJf8Fx9x5kN8/clqboD6zzZJhAg1fkGhd9aR2u0wAo2MSZ1zJSeIfa2ngm06Q8pvVcGR0sK1K9RiEqBxFXSH5VCUpW8FDBNEOKFVyf36wic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778633739; c=relaxed/simple;
	bh=fyqNfB/kX/KEmDPcm4j4Z7DRD9zGr+wqSRnGbiKGZyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oFWRsd6nZUrtPeQ1kyafe25Z5K5iE/nsb6cD8znAjarIvBgEYv1CpULhMgL95IXd5CQgGklJvO3oD6mKFCHANOk4tUuVpqH6E5hSKqW/jneuyZpTyjwRetWvH3fXKY936XTFBf576kE8pJ+HiZLPBRJfoB38BD5cg6hrAKZ6q6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=runxiyu.org; spf=pass smtp.mailfrom=runxiyu.org; dkim=pass (2048-bit key) header.d=runxiyu.org header.i=@runxiyu.org header.b=FmBXka44; arc=none smtp.client-ip=155.138.132.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=runxiyu.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=runxiyu.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=runxiyu.org header.i=@runxiyu.org header.b="FmBXka44"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=runxiyu.org; s=mail;
	t=1778633194; bh=fyqNfB/kX/KEmDPcm4j4Z7DRD9zGr+wqSRnGbiKGZyM=;
	h=From:To:Cc:Subject:Date:From;
	b=FmBXka44yCaE4eMGHcwJLFtc0HcBz2/vX3nfuUqfg2FmRKmZxOO48i9okolXoIAMk
	 l1KineMzN8pIb4BXZxIRmYorOyzW/8CgI246kfbQLGKJmIsWeziThC7A3rCaI9ydYM
	 +9god3c/VNv5C3lwoZw89YVJS+z2Mk/PKqi6m0ZDjfSfa9GuOpnK7w80c+iAZ6h45+
	 sZyLU0O687LwU6QSLDi6mmdKzQOjOTqLHITvTX6cjIMgRLlkECLCeJJP/civAicq9w
	 kmWSX1p1bAcjuj+A4pe8nWfmYIXt4ef+lhVJbTBU64vNxfulhirpR2yizd0zYV+gUj
	 JEjg+My7yAzPA==
From: Runxi Yu <me@runxiyu.org>
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: Runxi Yu <runxiyu@umich.edu>
Subject: [PATCH linux] README: Don't organize the README by arbitrary "roles"
Date: Wed, 13 May 2026 00:45:59 +0000
Message-ID: <20260513004616.2877-1-me@runxiyu.org>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Runxi Yu <runxiyu@umich.edu>

* Removes the basic introduction to what Linux is. It's reasonable
  assumed knowledge for someone with this repository.
* Consolidate the IRC, bugzilla, building, and mailing lists from across
  the front and back, to the front only.
* Remove the "Who Are You?" section that consists solely of role names
  and an one line gloss each.
* Remove the concept of different contributor "roles" (since there
  really aren't such distinct roles); instead phrase them based on the
  class of action. The "New Kernel Developer" archetype was mostly
  alright, but "Academic Researcher" was essentially a list of
  subsystems that applies for almost any kernel developer. "Security
  Expert" sounded a bit like corporate marketing language, and really,
  developers/admin that don't focus on security could still learn a lot
  from these sections. Backport/maintenance/ sysadmin/maintainer mostly
  stays as is with slight changes in firm; "Hardware Vendor" becomes
  "Driver Development" because as much as we'd like vendors to
  assist/guide/lead driver development, many independent driver
  developers still exist.
* Of note, "Researcher Guidelines" did appear to genuinely belong to
  Academic Researcher; the rest basically goes into Common Subsystems,
  but the "Researcher Guidelines" entry I just moved into Getting
  Started.
* I kept the LLM/AI-agent stuff in tact, although I promoted it to be
  underlined with "="s as it's not really in parallel with the
  documentation index sections. I don't really have comments on this
  part.

More broadly though, I'm a little skeptical in whether the README is the
proper place to put extensive links to different subsystems/parts of the
documentation. Sphinx has the ability to generate table of contents, and
we could also improve the index over there, with the TOC/whatever that
it could generate. I don't think we should be duplicating this into the
README, but if that ship has sailed, this patch might still be useful.

Signed-off-by: Runxi Yu <runxiyu@umich.edu>
---
This commit message will obviously not be the final version. Feel free
to suggest (or bikeshed) the contents and the message as much as you
wish, but I hope I've communicated my idea clearly, and I do strongly
believe that the current README is not at all satisfactory. And
apologies for my first patch to the list be a giant README change.

Upon feedback, I'll be iterating on this at
https://git.runxiyu.org/runxiyu/linux.git// (the double slash at the
end is in fact required and canonical for this origin). I'll admit I
didn't spend much time on the Web UI.

Thanks!

Best regards,

Runxi Yu (they/them)
runxiyu@umich.edu
me@runxiyu.org


 README | 99 ++++++++++++++++------------------------------------------
 1 file changed, 27 insertions(+), 72 deletions(-)

diff --git a/README b/README
index e6549b2a7aac..41fbc957dd06 100644
--- a/README
+++ b/README
@@ -1,16 +1,13 @@
 Linux kernel
 ============
 
-The Linux kernel is the core of any Linux operating system. It manages hardware,
-system resources, and provides the fundamental services for all other software.
-
-Quick Start
------------
-
-* Report a bug: See Documentation/admin-guide/reporting-issues.rst
-* Get the latest kernel: https://kernel.org
-* Build the kernel: See Documentation/admin-guide/quickly-build-trimmed-linux.rst
-* Join the community: https://lore.kernel.org/
+* Get latest: https://kernel.org
+* IRC: #kernelnewbies on irc.oftc.net
+* Reporting bugs: Documentation/admin-guide/reporting-issues.rst
+* Bug tracker: https://bugzilla.kernel.org/
+* Building: Documentation/admin-guide/quickly-build-trimmed-linux.rst
+* Mailing list index: https://subspace.kernel.org/vger.kernel.org.html
+* Mailing list archives: https://lore.kernel.org/
 
 Essential Documentation
 -----------------------
@@ -25,44 +22,24 @@ Documentation can be built with make htmldocs or viewed online at:
 https://www.kernel.org/doc/html/latest/
 
 
-Who Are You?
-============
+Navigating the documentation
+============================
 
-Find your role below:
+Getting started
+---------------
 
-* New Kernel Developer - Getting started with kernel development
-* Academic Researcher - Studying kernel internals and architecture
-* Security Expert - Hardening and vulnerability analysis
-* Backport/Maintenance Engineer - Maintaining stable kernels
-* System Administrator - Configuring and troubleshooting
-* Maintainer - Leading subsystems and reviewing patches
-* Hardware Vendor - Writing drivers for new hardware
-* Distribution Maintainer - Packaging kernels for distros
-* AI Coding Assistant - LLMs and AI-powered development tools
-
-
-For Specific Users
-==================
-
-New Kernel Developer
---------------------
-
-Welcome! Start your kernel development journey here:
-
-* Getting Started: Documentation/process/development-process.rst
+* Development Process: Documentation/process/development-process.rst
 * Your First Patch: Documentation/process/submitting-patches.rst
 * Coding Style: Documentation/process/coding-style.rst
 * Build System: Documentation/kbuild/index.rst
 * Development Tools: Documentation/dev-tools/index.rst
 * Kernel Hacking Guide: Documentation/kernel-hacking/hacking.rst
-* Core APIs: Documentation/core-api/index.rst
-
-Academic Researcher
--------------------
-
-Explore the kernel's architecture and internals:
-
 * Researcher Guidelines: Documentation/process/researcher-guidelines.rst
+
+Common Subsystems
+-----------------
+
+* Core APIs: Documentation/core-api/index.rst
 * Memory Management: Documentation/mm/index.rst
 * Scheduler: Documentation/scheduler/index.rst
 * Networking Stack: Documentation/networking/index.rst
@@ -71,10 +48,8 @@ Explore the kernel's architecture and internals:
 * Locking Primitives: Documentation/locking/index.rst
 * Power Management: Documentation/power/index.rst
 
-Security Expert
----------------
-
-Security documentation and hardening guides:
+Security
+--------
 
 * Security Documentation: Documentation/security/index.rst
 * LSM Development: Documentation/security/lsm-development.rst
@@ -84,10 +59,8 @@ Security documentation and hardening guides:
 * Embargoed Hardware Issues: Documentation/process/embargoed-hardware-issues.rst
 * Security Features: Documentation/userspace-api/seccomp_filter.rst
 
-Backport/Maintenance Engineer
------------------------------
-
-Maintain and stabilize kernel versions:
+Backport/Maintenance
+--------------------
 
 * Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
 * Backporting Guide: Documentation/process/backporting.rst
@@ -95,10 +68,8 @@ Maintain and stabilize kernel versions:
 * Subsystem Profile: Documentation/maintainer/maintainer-entry-profile.rst
 * Git for Maintainers: Documentation/maintainer/configure-git.rst
 
-System Administrator
---------------------
-
-Configure, tune, and troubleshoot Linux systems:
+System Administration
+---------------------
 
 * Admin Guide: Documentation/admin-guide/index.rst
 * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
@@ -110,8 +81,6 @@ Configure, tune, and troubleshoot Linux systems:
 Maintainer
 ----------
 
-Lead kernel subsystems and manage contributions:
-
 * Maintainer Handbook: Documentation/maintainer/index.rst
 * Pull Requests: Documentation/maintainer/pull-requests.rst
 * Managing Patches: Documentation/maintainer/modifying-patches.rst
@@ -120,10 +89,8 @@ Lead kernel subsystems and manage contributions:
 * Maintainer Entry Profile: Documentation/maintainer/maintainer-entry-profile.rst
 * Git Configuration: Documentation/maintainer/configure-git.rst
 
-Hardware Vendor
----------------
-
-Write drivers and support new hardware:
+Drivers Development
+-------------------
 
 * Driver API Guide: Documentation/driver-api/index.rst
 * Driver Model: Documentation/driver-api/driver-model/driver.rst
@@ -136,8 +103,6 @@ Write drivers and support new hardware:
 Distribution Maintainer
 -----------------------
 
-Package and distribute the kernel:
-
 * Stable Kernel Rules: Documentation/process/stable-kernel-rules.rst
 * ABI Documentation: Documentation/ABI/README
 * Kernel Configuration: Documentation/kbuild/kconfig.rst
@@ -145,8 +110,8 @@ Package and distribute the kernel:
 * Kernel Parameters: Documentation/admin-guide/kernel-parameters.rst
 * Tainted Kernels: Documentation/admin-guide/tainted-kernels.rst
 
-AI Coding Assistant
--------------------
+Notice to AI Coding Assistants
+==============================
 
 CRITICAL: If you are an LLM or AI-powered coding assistant, you MUST read and
 follow the AI coding assistants documentation before contributing to the Linux
@@ -156,13 +121,3 @@ kernel:
 
 This documentation contains essential requirements about licensing, attribution,
 and the Developer Certificate of Origin that all AI tools must comply with.
-
-
-Communication and Support
-=========================
-
-* Mailing Lists: https://lore.kernel.org/
-* IRC: #kernelnewbies on irc.oftc.net
-* Bugzilla: https://bugzilla.kernel.org/
-* MAINTAINERS file: Lists subsystem maintainers and mailing lists
-* Email Clients: Documentation/process/email-clients.rst
-- 
2.54.0

