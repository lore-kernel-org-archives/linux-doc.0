Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1F9500950
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 18:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983422; cv=none; b=baODvjQLDdLCARJbbLQA4v7P1vPVEw/kk6eWVNWwgZCIqvBbzehm0TVLD9imBOwa8fn1WIBFT1NOYlgYyNqBboui4uTcnL2lHbv53rzHXXVnvb/bgekeNutv7mAR9u3yeTCBcjKCSjlEqcpv91BOqslFIwTDS9ohzfvhVKB38GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983422; c=relaxed/simple;
	bh=mUaAPex2zYkREJnrQGiCJxM6eL4CNyGsNbVN3DhA0pw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Cgf5JapfH/oamCU61uCeqZgZll53dCpuHowwnM+hJX4AYCgLgln03EMwGnNb42cFyb9V8YYU/tbHBRndCbCYL79zmQp24JjVDMiGVcRtYV468pX02uL7OzDxkezdiHlPqyFHcEBkm6J++QGbLmIOrB3uaJa08vsSb3jj4ybjPag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz; spf=pass smtp.mailfrom=suse.cz; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oS4YGdlB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=RUZT/BrO; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b=oS4YGdlB; dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b=RUZT/BrO; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oS4YGdlB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="RUZT/BrO";
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="oS4YGdlB";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="RUZT/BrO"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 8C40933994;
	Fri,  9 Jan 2026 18:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767983416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/ht5eE52Gh6uoyihl6oLtSFtk1R8TyWnRaIeBcYU+Q=;
	b=oS4YGdlBueOVwX7Ai8HD4aosGcEY3ERSbF1TGD2zlSCSskx1+0AmRLnYRiAdKSwU4DWCdk
	d5qAl7W+MQYmMmBu9/ltlQ5UiTlTvEktWcykGeq+T5Rx1WC3d7oiJnucAn0Qc7a7gIR1O7
	AOjJzXKY/eB1+pSwiftiQj4G0qzSN5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767983416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/ht5eE52Gh6uoyihl6oLtSFtk1R8TyWnRaIeBcYU+Q=;
	b=RUZT/BrOZ4N+4PF1FIuH9Bl5JMG6SZZ6C4gIi15HthJAyKJrIi2n0tIM32BPVfjo3ueBeo
	C4l3t5MSxYlvR6DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1767983416; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/ht5eE52Gh6uoyihl6oLtSFtk1R8TyWnRaIeBcYU+Q=;
	b=oS4YGdlBueOVwX7Ai8HD4aosGcEY3ERSbF1TGD2zlSCSskx1+0AmRLnYRiAdKSwU4DWCdk
	d5qAl7W+MQYmMmBu9/ltlQ5UiTlTvEktWcykGeq+T5Rx1WC3d7oiJnucAn0Qc7a7gIR1O7
	AOjJzXKY/eB1+pSwiftiQj4G0qzSN5c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1767983416;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a/ht5eE52Gh6uoyihl6oLtSFtk1R8TyWnRaIeBcYU+Q=;
	b=RUZT/BrOZ4N+4PF1FIuH9Bl5JMG6SZZ6C4gIi15HthJAyKJrIi2n0tIM32BPVfjo3ueBeo
	C4l3t5MSxYlvR6DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 464803EA63;
	Fri,  9 Jan 2026 18:30:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Re5fEDhJYWk6GgAAD6G6ig
	(envelope-from <pvorel@suse.cz>); Fri, 09 Jan 2026 18:30:16 +0000
From: Petr Vorel <pvorel@suse.cz>
To: linux-doc@vger.kernel.org
Cc: Petr Vorel <pvorel@suse.cz>,
	Jonathan Corbet <corbet@lwn.net>,
	Michael Kerrisk  <mtk@man7.org>,
	Alejandro Colomar <alx@kernel.org>,
	man-pages@man7.org
Subject: [PATCH 1/1] Documentation: Link man pages to https://man7.org/
Date: Fri,  9 Jan 2026 19:30:09 +0100
Message-ID: <20260109183012.114372-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.cz:mid,suse.cz:email]
X-Spam-Level: 
X-Spam-Flag: NO

Convert mentioned man pages in docs to pages online in
https://man7.org/. Use new extension sphinx.ext.extlinks + format
custom CSS.

NOTE: Keep :manpage: (plain text instead of link) for non-existing man
pages (xyzzy(2), xyzzyat(2), fxyzzy(3)) in adding-syscalls.rst
(including translations).

Signed-off-by: Petr Vorel <pvorel@suse.cz>
---
Hi all,

@Michael @Alejandro (or whoever is responsible for man7.org),
feel free to shout if you don't like extra traffic from kernel.org doc.

@Jonathan I chose man7.org as it looks as the most complete and the most
up to date man page collection.

Kind regards,
Petr

 Documentation/admin-guide/LSM/landlock.rst    |  2 +-
 Documentation/admin-guide/initrd.rst          |  6 +--
 Documentation/arch/powerpc/dexcr.rst          |  6 +--
 Documentation/bpf/prog_lsm.rst                |  4 +-
 Documentation/conf.py                         |  9 ++++
 Documentation/dev-tools/kunit/start.rst       |  2 +-
 Documentation/process/adding-syscalls.rst     | 30 ++++++------
 Documentation/security/landlock.rst           |  2 +-
 Documentation/sphinx-static/custom.css        |  7 ++-
 .../it_IT/process/adding-syscalls.rst         | 30 ++++++------
 .../sp_SP/process/adding-syscalls.rst         | 30 ++++++------
 Documentation/userspace-api/check_exec.rst    | 10 ++--
 Documentation/userspace-api/landlock.rst      | 46 +++++++++----------
 Documentation/userspace-api/spec_ctrl.rst     |  6 +--
 14 files changed, 102 insertions(+), 88 deletions(-)

diff --git a/Documentation/admin-guide/LSM/landlock.rst b/Documentation/admin-guide/LSM/landlock.rst
index 9e61607def087..8b1e8ba36b719 100644
--- a/Documentation/admin-guide/LSM/landlock.rst
+++ b/Documentation/admin-guide/LSM/landlock.rst
@@ -143,7 +143,7 @@ filters to limit noise with two complementary ways:
 
 - with sys_landlock_restrict_self()'s flags if we can fix the sandboxed
   programs,
-- or with audit rules (see :manpage:`auditctl(8)`).
+- or with audit rules (see :man8:`auditctl`).
 
 Additional documentation
 ========================
diff --git a/Documentation/admin-guide/initrd.rst b/Documentation/admin-guide/initrd.rst
index 67bbad8806e8c..58ec3359f7085 100644
--- a/Documentation/admin-guide/initrd.rst
+++ b/Documentation/admin-guide/initrd.rst
@@ -102,7 +102,7 @@ First, a directory for the initrd file system has to be created on the
 	# mkdir /initrd
 
 The name is not relevant. More details can be found on the
-:manpage:`pivot_root(2)` man page.
+:man2:`pivot_root` man page.
 
 If the root file system is created during the boot procedure (i.e. if
 you're building an install floppy), the root file system creation
@@ -226,7 +226,7 @@ a directory under the current root. Example::
 	# mount -o ro /dev/hda1 /new-root
 
 The root change is accomplished with the pivot_root system call, which
-is also available via the ``pivot_root`` utility (see :manpage:`pivot_root(8)`
+is also available via the ``pivot_root`` utility (see :man8:`pivot_root`
 man page; ``pivot_root`` is distributed with util-linux version 2.10h or higher
 [#f3]_). ``pivot_root`` moves the current root to a directory under the new
 root, and puts the new root at its place. The directory for the old root
@@ -266,7 +266,7 @@ disk can be freed::
 	# blockdev --flushbufs /dev/ram0
 
 It is also possible to use initrd with an NFS-mounted root, see the
-:manpage:`pivot_root(8)` man page for details.
+:man8:`pivot_root` man page for details.
 
 
 Usage scenarios
diff --git a/Documentation/arch/powerpc/dexcr.rst b/Documentation/arch/powerpc/dexcr.rst
index ab0724212fcd1..946e997f05015 100644
--- a/Documentation/arch/powerpc/dexcr.rst
+++ b/Documentation/arch/powerpc/dexcr.rst
@@ -41,7 +41,7 @@ prctl
 
 A process can control its own userspace DEXCR value using the
 ``PR_PPC_GET_DEXCR`` and ``PR_PPC_SET_DEXCR`` pair of
-:manpage:`prctl(2)` commands. These calls have the form::
+:man2:`prctl` commands. These calls have the form::
 
     prctl(PR_PPC_GET_DEXCR, unsigned long which, 0, 0, 0);
     prctl(PR_PPC_SET_DEXCR, unsigned long which, unsigned long ctrl, 0, 0);
@@ -120,8 +120,8 @@ Note that
   software should read the appropriate SPRs directly.
 
 * The aspect state when starting a process is copied from the parent's state on
-  :manpage:`fork(2)`. The state is reset to a fixed value on
-  :manpage:`execve(2)`. The PR_PPC_SET_DEXCR prctl() can control both of these
+  :man2:`fork`. The state is reset to a fixed value on
+  :man2:`execve`. The PR_PPC_SET_DEXCR prctl() can control both of these
   values.
 
 * The ``*_ONEXEC`` controls do not change the current process's DEXCR.
diff --git a/Documentation/bpf/prog_lsm.rst b/Documentation/bpf/prog_lsm.rst
index ad2be02f30c2d..fba989eb662c8 100644
--- a/Documentation/bpf/prog_lsm.rst
+++ b/Documentation/bpf/prog_lsm.rst
@@ -95,7 +95,7 @@ eBPF program.
 Loading
 -------
 
-eBPF programs can be loaded with the :manpage:`bpf(2)` syscall's
+eBPF programs can be loaded with the :man2:`bpf` syscall's
 ``BPF_PROG_LOAD`` operation:
 
 .. code-block:: c
@@ -117,7 +117,7 @@ the generated helper, ``my_prog__open_and_load``.
 Attachment to LSM Hooks
 -----------------------
 
-The LSM allows attachment of eBPF programs as LSM hooks using :manpage:`bpf(2)`
+The LSM allows attachment of eBPF programs as LSM hooks using :man2:`bpf`
 syscall's ``BPF_RAW_TRACEPOINT_OPEN`` operation or more simply by
 using the libbpf helper ``bpf_program__attach_lsm``.
 
diff --git a/Documentation/conf.py b/Documentation/conf.py
index 1ea2ae5c6276c..e6b972f1f1b02 100644
--- a/Documentation/conf.py
+++ b/Documentation/conf.py
@@ -38,6 +38,14 @@ doctree = os.path.abspath(".")
 # Exclude of patterns that don't contain directory names, in glob format.
 exclude_patterns = []
 
+extlinks = {
+    # when adding new section update also custom.css
+    'man2': ('https://man7.org/linux/man-pages/man2/%s.2.html', '%s(2)'),
+    'man3': ('https://man7.org/linux/man-pages/man3/%s.3.html', '%s(3)'),
+    'man7': ('https://man7.org/linux/man-pages/man7/%s.7.html', '%s(7)'),
+    'man8': ('https://man7.org/linux/man-pages/man8/%s.8.html', '%s(8)'),
+}
+
 # List of patterns that contain directory names in glob format.
 dyn_include_patterns = []
 dyn_exclude_patterns = ["output"]
@@ -152,6 +160,7 @@ extensions = [
     "parser_yaml",
     "rstFlatTable",
     "sphinx.ext.autosectionlabel",
+    'sphinx.ext.extlinks',
     "sphinx.ext.ifconfig",
     "translations",
 ]
diff --git a/Documentation/dev-tools/kunit/start.rst b/Documentation/dev-tools/kunit/start.rst
index a98235326bab0..963cb9f6518e1 100644
--- a/Documentation/dev-tools/kunit/start.rst
+++ b/Documentation/dev-tools/kunit/start.rst
@@ -123,7 +123,7 @@ Filtering tests by name
 ~~~~~~~~~~~~~~~~~~~~~~~
 If you want to be more specific than Kconfig can provide, it is also possible
 to select which tests to execute at boot-time by passing a glob filter
-(read instructions regarding the pattern in the manpage :manpage:`glob(7)`).
+(read instructions regarding the pattern in the manpage :man7:`glob`).
 If there is a ``"."`` (period) in the filter, it will be interpreted as a
 separator between the name of the test suite and the test case,
 otherwise, it will be interpreted as the name of the test suite.
diff --git a/Documentation/process/adding-syscalls.rst b/Documentation/process/adding-syscalls.rst
index fc0b0bbcd34df..98736c299f686 100644
--- a/Documentation/process/adding-syscalls.rst
+++ b/Documentation/process/adding-syscalls.rst
@@ -28,8 +28,8 @@ interface.
        descriptor for the relevant object allows userspace to use
        ``poll``/``select``/``epoll`` to receive that notification.
      - However, operations that don't map to
-       :manpage:`read(2)`/:manpage:`write(2)`-like operations
-       have to be implemented as :manpage:`ioctl(2)` requests, which can lead
+       :man2:`read`/:man2:`write`-like operations
+       have to be implemented as :man2:`ioctl` requests, which can lead
        to a somewhat opaque API.
 
  - If you're just exposing runtime system information, a new node in sysfs
@@ -39,14 +39,14 @@ interface.
    in a namespaced/sandboxed/chrooted environment).  Avoid adding any API to
    debugfs, as this is not considered a 'production' interface to userspace.
  - If the operation is specific to a particular file or file descriptor, then
-   an additional :manpage:`fcntl(2)` command option may be more appropriate.  However,
-   :manpage:`fcntl(2)` is a multiplexing system call that hides a lot of complexity, so
+   an additional :man2:`fcntl` command option may be more appropriate.  However,
+   :man2:`fcntl` is a multiplexing system call that hides a lot of complexity, so
    this option is best for when the new function is closely analogous to
-   existing :manpage:`fcntl(2)` functionality, or the new functionality is very simple
+   existing :man2:`fcntl` functionality, or the new functionality is very simple
    (for example, getting/setting a simple flag related to a file descriptor).
  - If the operation is specific to a particular task or process, then an
-   additional :manpage:`prctl(2)` command option may be more appropriate.  As
-   with :manpage:`fcntl(2)`, this system call is a complicated multiplexor so
+   additional :man2:`prctl` command option may be more appropriate.  As
+   with :man2:`fcntl`, this system call is a complicated multiplexor so
    is best reserved for near-analogs of existing ``prctl()`` commands or
    getting/setting a simple flag related to a process.
 
@@ -99,7 +99,7 @@ version mismatch:
    code can zero-extend a smaller instance of the structure (effectively
    setting ``param_4 = 0``).
 
-See :manpage:`perf_event_open(2)` and the ``perf_copy_attr()`` function (in
+See :man2:`perf_event_open` and the ``perf_copy_attr()`` function (in
 ``kernel/events/core.c``) for an example of this approach.
 
 
@@ -122,7 +122,7 @@ of the ``O_CLOEXEC`` constant, as it is architecture-specific and is part of a
 numbering space of ``O_*`` flags that is fairly full.)
 
 If your system call returns a new file descriptor, you should also consider
-what it means to use the :manpage:`poll(2)` family of system calls on that file
+what it means to use the :man2:`poll` family of system calls on that file
 descriptor. Making a file descriptor ready for reading or writing is the
 normal way for the kernel to indicate to userspace that an event has
 occurred on the corresponding kernel object.
@@ -144,8 +144,8 @@ giving an :manpage:`fxyzzy(3)` operation for free::
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) is equivalent to fxyzzy(fd, ...)
 
 (For more details on the rationale of the \*at() calls, see the
-:manpage:`openat(2)` man page; for an example of AT_EMPTY_PATH, see the
-:manpage:`fstatat(2)` man page.)
+:man2:`openat` man page; for an example of AT_EMPTY_PATH, see the
+:man2:`fstatat` man page.)
 
 If your new :manpage:`xyzzy(2)` system call involves a parameter describing an
 offset within a file, make its type ``loff_t`` so that 64-bit offsets can be
@@ -153,7 +153,7 @@ supported even on 32-bit architectures.
 
 If your new :manpage:`xyzzy(2)` system call involves privileged functionality,
 it needs to be governed by the appropriate Linux capability bit (checked with
-a call to ``capable()``), as described in the :manpage:`capabilities(7)` man
+a call to ``capable()``), as described in the :man7:`capabilities` man
 page.  Choose an existing capability bit that governs related functionality,
 but try to avoid combining lots of only vaguely related functions together
 under the same bit, as this goes against capabilities' purpose of splitting
@@ -340,7 +340,7 @@ arrives at a 64-bit kernel from a 32-bit application will be split into two
 32-bit values, which then need to be re-assembled in the compatibility layer.
 
 (Note that a system call argument that's a pointer to an explicit 64-bit type
-does **not** need a compatibility layer; for example, :manpage:`splice(2)`'s arguments of
+does **not** need a compatibility layer; for example, :man2:`splice`'s arguments of
 type ``loff_t __user *`` do not trigger the need for a ``compat_`` system call.)
 
 The compatibility version of the system call is called ``compat_sys_xyzzy()``,
@@ -619,7 +619,7 @@ References and Sources
     - https://lwn.net/Articles/604515/
 
  - Architecture-specific requirements for system calls are discussed in the
-   :manpage:`syscall(2)` man-page:
+   :man2:`syscall` man-page:
    http://man7.org/linux/man-pages/man2/syscall.2.html#NOTES
  - Collated emails from Linus Torvalds discussing the problems with ``ioctl()``:
    https://yarchive.net/comp/linux/ioctl.html
@@ -636,7 +636,7 @@ References and Sources
    commit: https://lore.kernel.org/r/alpine.DEB.2.11.1411191249560.3909@nanos
  - Suggestion from Greg Kroah-Hartman that it's good for new system calls to
    come with a man-page & selftest: https://lore.kernel.org/r/20140320025530.GA25469@kroah.com
- - Discussion from Michael Kerrisk of new system call vs. :manpage:`prctl(2)` extension:
+ - Discussion from Michael Kerrisk of new system call vs. :man2:`prctl` extension:
    https://lore.kernel.org/r/CAHO5Pa3F2MjfTtfNxa8LbnkeeU8=YJ+9tDqxZpw7Gz59E-4AUg@mail.gmail.com
  - Suggestion from Ingo Molnar that system calls that involve multiple
    arguments should encapsulate those arguments in a struct, which includes a
diff --git a/Documentation/security/landlock.rst b/Documentation/security/landlock.rst
index 3e4d4d04cfae4..90523c86226d7 100644
--- a/Documentation/security/landlock.rst
+++ b/Documentation/security/landlock.rst
@@ -74,7 +74,7 @@ the same results, when they are executed under the same Landlock domain.
 
 Taking the ``LANDLOCK_ACCESS_FS_TRUNCATE`` right as an example, it may be
 allowed to open a file for writing without being allowed to
-:manpage:`ftruncate` the resulting file descriptor if the related file
+:man2:`ftruncate` the resulting file descriptor if the related file
 hierarchy doesn't grant that access right.  The following sequences of
 operations have the same semantic and should then have the same result:
 
diff --git a/Documentation/sphinx-static/custom.css b/Documentation/sphinx-static/custom.css
index 06cedbae095c2..b38bfc50c0378 100644
--- a/Documentation/sphinx-static/custom.css
+++ b/Documentation/sphinx-static/custom.css
@@ -20,7 +20,7 @@ div.sphinxsidebar { font-size: inherit;
 		    overflow-y: auto; }
 /* Tweak document margins and don't force width */
 div.document {
-    margin: 20px 10px 0 10px; 
+    margin: 20px 10px 0 10px;
     width: auto;
 }
 
@@ -151,3 +151,8 @@ div.sphinxsidebar a:hover {
     text-decoration: underline;
     text-underline-offset: 0.3em;
 }
+
+/* monospace for man page links */
+a.extlink-man2, a.extlink-man3, a.extlink-man7, a.extlink-man8 {
+    font-family: SFMono-Regular,Menlo,Monaco,Consolas,Liberation Mono,Courier New,Courier,monospace;
+}
diff --git a/Documentation/translations/it_IT/process/adding-syscalls.rst b/Documentation/translations/it_IT/process/adding-syscalls.rst
index df8c652d004b1..48e060ba05d3f 100644
--- a/Documentation/translations/it_IT/process/adding-syscalls.rst
+++ b/Documentation/translations/it_IT/process/adding-syscalls.rst
@@ -34,8 +34,8 @@ vostra interfaccia.
        di file all'oggetto corrispondente permette allo spazio utente di
        utilizzare ``poll``/``select``/``epoll`` per ricevere quelle notifiche.
      - Tuttavia, le operazioni che non si sposano bene con operazioni tipo
-       :manpage:`read(2)`/:manpage:`write(2)` dovrebbero essere implementate
-       come chiamate :manpage:`ioctl(2)`, il che potrebbe portare ad un'API in
+       :man2:`read`/:man2:`write` dovrebbero essere implementate
+       come chiamate :man2:`ioctl`, il che potrebbe portare ad un'API in
        un qualche modo opaca.
 
  - Se dovete esporre solo delle informazioni sul sistema, un nuovo nodo in
@@ -46,15 +46,15 @@ vostra interfaccia.
    Evitate d'aggiungere nuove API in debugfs perché questo non viene
    considerata un'interfaccia di 'produzione' verso lo spazio utente.
  - Se l'operazione è specifica ad un particolare file o descrittore, allora
-   potrebbe essere appropriata l'aggiunta di un comando :manpage:`fcntl(2)`.
-   Tuttavia, :manpage:`fcntl(2)` è una chiamata di sistema multiplatrice che
+   potrebbe essere appropriata l'aggiunta di un comando :man2:`fcntl`.
+   Tuttavia, :man2:`fcntl` è una chiamata di sistema multiplatrice che
    nasconde una notevole complessità, quindi è ottima solo quando la nuova
-   funzione assomiglia a quelle già esistenti in :manpage:`fcntl(2)`, oppure
+   funzione assomiglia a quelle già esistenti in :man2:`fcntl`, oppure
    la nuova funzionalità è veramente semplice (per esempio, leggere/scrivere
    un semplice flag associato ad un descrittore di file).
  - Se l'operazione è specifica ad un particolare processo, allora
-   potrebbe essere appropriata l'aggiunta di un comando :manpage:`prctl(2)`.
-   Come per :manpage:`fcntl(2)`, questa chiamata di sistema è un complesso
+   potrebbe essere appropriata l'aggiunta di un comando :man2:`prctl`.
+   Come per :man2:`fcntl`, questa chiamata di sistema è un complesso
    multiplatore quindi è meglio usarlo per cose molto simili a quelle esistenti
    nel comando ``prctl`` oppure per leggere/scrivere un semplice flag relativo
    al processo.
@@ -111,7 +111,7 @@ di gestire un conflitto di versione in entrambe le direzioni:
    programma in spazio utente estendendo la struttura dati con zeri (in pratica
    ``param_4 = 0``).
 
-Vedere :manpage:`perf_event_open(2)` e la funzione ``perf_copy_attr()`` (in
+Vedere :man2:`perf_event_open` e la funzione ``perf_copy_attr()`` (in
 ``kernel/events/core.c``) per un esempio pratico di questo approccio.
 
 
@@ -136,7 +136,7 @@ enumerazione di flag ``O_*`` che è abbastanza ricca).
 
 Se la vostra nuova chiamata di sistema ritorna un nuovo descrittore di file,
 dovreste considerare che significato avrà l'uso delle chiamate di sistema
-della famiglia di :manpage:`poll(2)`. Rendere un descrittore di file pronto
+della famiglia di :man2:`poll`. Rendere un descrittore di file pronto
 per la lettura o la scrittura è il tipico modo del kernel per notificare lo
 spazio utente circa un evento associato all'oggetto del kernel.
 
@@ -160,8 +160,8 @@ funzionalità su un descrittore di file già aperto utilizzando il *flag*
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) is equivalent to fxyzzy(fd, ...)
 
 (Per maggiori dettagli sulla logica delle chiamate \*at(), leggete la pagina
-man :manpage:`openat(2)`; per un esempio di AT_EMPTY_PATH, leggere la pagina
-man :manpage:`fstatat(2)`).
+man :man2:`openat`; per un esempio di AT_EMPTY_PATH, leggere la pagina
+man :man2:`fstatat`).
 
 Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede un parametro
 per descrivere uno scostamento all'interno di un file, usate ``loff_t`` come
@@ -171,7 +171,7 @@ architetture a 32-bit.
 Se la vostra nuova chiamata di sistema :manpage:`xyzzy(2)` prevede l'uso di
 funzioni riservate, allora dev'essere gestita da un opportuno bit di privilegio
 (verificato con una chiamata a ``capable()``), come descritto nella pagina man
-:manpage:`capabilities(7)`.  Scegliete un bit di privilegio già esistente per
+:man7:`capabilities`.  Scegliete un bit di privilegio già esistente per
 gestire la funzionalità associata, ma evitate la combinazione di diverse
 funzionalità vagamente collegate dietro lo stesso bit, in quanto va contro il
 principio di *capabilities* di separare i poteri di root.  In particolare,
@@ -331,7 +331,7 @@ in questo livello di compatibilità.
 
 (Da notare che non serve questo livello di compatibilità per argomenti che
 sono puntatori ad un tipo esplicitamente a 64-bit; per esempio, in
-:manpage:`splice(2)` l'argomento di tipo ``loff_t __user *`` non necessita
+:man2:`splice` l'argomento di tipo ``loff_t __user *`` non necessita
 di una chiamata di sistema ``compat_``)
 
 La versione compatibile della nostra chiamata di sistema si chiamerà
@@ -601,7 +601,7 @@ Riferimenti e fonti
     - https://lwn.net/Articles/604515/
 
  - Requisiti specifici alle architetture sono discussi nella pagina man
-   :manpage:`syscall(2)` :
+   :man2:`syscall` :
    http://man7.org/linux/man-pages/man2/syscall.2.html#NOTES
  - Collezione di email di Linux Torvalds sui problemi relativi a ``ioctl()``:
    http://yarchive.net/comp/linux/ioctl.html
@@ -621,7 +621,7 @@ Riferimenti e fonti
    programma di auto-verifica per le nuove chiamate di sistema:
    https://lore.kernel.org/r/20140320025530.GA25469@kroah.com
  - Discussione di Michael Kerrisk sulle nuove chiamate di sistema contro
-   le estensioni :manpage:`prctl(2)`: https://lore.kernel.org/r/CAHO5Pa3F2MjfTtfNxa8LbnkeeU8=YJ+9tDqxZpw7Gz59E-4AUg@mail.gmail.com
+   le estensioni :man2:`prctl`: https://lore.kernel.org/r/CAHO5Pa3F2MjfTtfNxa8LbnkeeU8=YJ+9tDqxZpw7Gz59E-4AUg@mail.gmail.com
  - Consigli da Ingo Molnar che le chiamate di sistema con più argomenti
    dovrebbero incapsularli in una struttura che includa un argomento
    *size* per garantire l'estensibilità futura:
diff --git a/Documentation/translations/sp_SP/process/adding-syscalls.rst b/Documentation/translations/sp_SP/process/adding-syscalls.rst
index f21504c612b25..0de587ced35f7 100644
--- a/Documentation/translations/sp_SP/process/adding-syscalls.rst
+++ b/Documentation/translations/sp_SP/process/adding-syscalls.rst
@@ -34,8 +34,8 @@ a su interfaz.
        usar ``poll``/``select``/``epoll`` para recibir esta notificación.
 
      - Sin embargo, operaciones que no mapean a operaciones similares a
-       :manpage:`read(2)`/:manpage:`write(2)` tienen que ser implementadas
-       como solicitudes :manpage:`ioctl(2)`, las cuales pueden llevar a un
+       :man2:`read`/:man2:`write` tienen que ser implementadas
+       como solicitudes :man2:`ioctl`, las cuales pueden llevar a un
        API algo opaca.
 
  - Si sólo está exponiendo información del runtime, un nuevo nodo en sysfs
@@ -47,17 +47,17 @@ a su interfaz.
    interfaz (interface) de 'producción' para el userspace.
 
  - Si la operación es específica a un archivo o descriptor de archivo
-   específico, entonces la opción de comando adicional :manpage:`fcntl(2)`
-   podría ser más apropiada. Sin embargo, :manpage:`fcntl(2)` es una
+   específico, entonces la opción de comando adicional :man2:`fcntl`
+   podría ser más apropiada. Sin embargo, :man2:`fcntl` es una
    llamada al sistema multiplexada que esconde mucha complejidad, así que
    esta opción es mejor cuando la nueva funcion es analogamente cercana a
-   la funcionalidad existente :manpage:`fcntl(2)`, o la nueva funcionalidad
+   la funcionalidad existente :man2:`fcntl`, o la nueva funcionalidad
    es muy simple (por ejemplo, definir/obtener un flag simple relacionado a
    un descriptor de archivo).
 
  - Si la operación es específica a un proceso o tarea particular, entonces
-   un comando adicional :manpage:`prctl(2)` podría ser más apropiado. Tal
-   como con :manpage:`fcntl(2)`, esta llamada al sistema es un multiplexor
+   un comando adicional :man2:`prctl` podría ser más apropiado. Tal
+   como con :man2:`fcntl`, esta llamada al sistema es un multiplexor
    complicado así que está reservado para comandos análogamente cercanos
    del existente ``prctl()`` u obtener/definir un flag simple relacionado a
    un proceso.
@@ -115,7 +115,7 @@ entonces permite versiones no coincidentes en ambos sentidos:
    instancia más pequeña de la estructura (definiendo efectivamente
    ``param_4 == 0``).
 
-Revise :manpage:`perf_event_open(2)` y la función ``perf_copy_attr()`` (en
+Revise :man2:`perf_event_open` y la función ``perf_copy_attr()`` (en
 ``kernel/events/code.c``) para un ejemplo de esta aproximación.
 
 
@@ -140,7 +140,7 @@ parte de un espacio numerado de flags ``O_*`` que está bastante lleno.)
 
 Si su llamada de sistema retorna un nuevo descriptor de archivo, debería
 considerar también que significa usar la familia de llamadas de sistema
-:manpage:`poll(2)` en ese descriptor de archivo. Hacer un descriptor de
+:man2:`poll` en ese descriptor de archivo. Hacer un descriptor de
 archivo listo para leer o escribir es la forma normal para que el kernel
 indique al espacio de usuario que un evento ha ocurrido en el
 correspondiente objeto del kernel.
@@ -164,8 +164,8 @@ efectivamente dando una operación :manpage:`fxyzzy(3)` gratis::
  - xyzzyat(fd, "", ..., AT_EMPTY_PATH) es equivalente a fxyzzy(fd, ...)
 
 (Para más detalles sobre la explicación racional de las llamadas \*at(),
-revise el man page :manpage:`openat(2)`; para un ejemplo de AT_EMPTY_PATH,
-mire el man page :manpage:`fstatat(2)` manpage.)
+revise el man page :man2:`openat`; para un ejemplo de AT_EMPTY_PATH,
+mire el man page :man2:`fstatat` manpage.)
 
 Si su nueva llamada de sistema :manpage:`xyzzy(2)` involucra un parámetro
 describiendo un describiendo un movimiento dentro de un archivo, ponga de
@@ -175,7 +175,7 @@ incluso en arquitecturas de 32-bit.
 Si su nueva llamada de sistema  :manpage:`xyzzy` involucra una
 funcionalidad privilegiada, esta necesita ser gobernada por la capability
 bit linux apropiada (revisado con una llamada a ``capable()``), como se
-describe en el man page :manpage:`capabilities(7)`. Elija una parte de
+describe en el man page :man7:`capabilities`. Elija una parte de
 capability linux que govierne las funcionalidades relacionadas, pero trate
 de evitar combinar muchas funciones sólo relacionadas vagamente bajo la
 misma sección, ya que va en contra de los propósitos de las capabilities de
@@ -331,7 +331,7 @@ que luego necesitan ser reensamblados en la capa de compatibilidad.
 
 (Note que un argumento de una llamada a sistema que sea un puntero a un
 type explicitamente de 64-bit **no** necesita una capa de compatibilidad;
-por ejemplo, los argumentos de :manpage:`splice(2)`) del tipo
+por ejemplo, los argumentos de :man2:`splice`) del tipo
 ``loff_t __user *`` no significan la necesidad de una llamada a sistema
 ``compat_``.)
 
@@ -593,7 +593,7 @@ Referencias y fuentes
     - https://lwn.net/Articles/604515/
 
  - Requerimientos arquitectura-específicos para llamadas al sistema son discutidos en el
-   :manpage:`syscall(2)` man-page:
+   :man2:`syscall` man-page:
    http://man7.org/linux/man-pages/man2/syscall.2.html#NOTES
  - Recopilación de emails de Linus Torvalds discutiendo problemas con ``ioctl()``:
    https://yarchive.net/comp/linux/ioctl.html
@@ -610,7 +610,7 @@ Referencias y fuentes
    separados: https://lore.kernel.org/r/alpine.DEB.2.11.1411191249560.3909@nanos
  - Sugerencias de Greg Kroah-Hartman que es bueno para las nueva llamadas al sistema
    que vengan con man-page y selftest: https://lore.kernel.org/r/20140320025530.GA25469@kroah.com
- - Discusión de Michael Kerrisk de nuevas system call vs. extensiones :manpage:`prctl(2)`:
+ - Discusión de Michael Kerrisk de nuevas system call vs. extensiones :man2:`prctl`:
    https://lore.kernel.org/r/CAHO5Pa3F2MjfTtfNxa8LbnkeeU8=YJ+9tDqxZpw7Gz59E-4AUg@mail.gmail.com
  - Sugerencias de Ingo Molnar que llamadas al sistema que involucran múltiples
    argumentos deben encapsular estos argumentos en una estructura, la cual incluye
diff --git a/Documentation/userspace-api/check_exec.rst b/Documentation/userspace-api/check_exec.rst
index 05dfe3b56f711..0d03b5fe9ad5a 100644
--- a/Documentation/userspace-api/check_exec.rst
+++ b/Documentation/userspace-api/check_exec.rst
@@ -5,7 +5,7 @@
 Executability check
 ===================
 
-The ``AT_EXECVE_CHECK`` :manpage:`execveat(2)` flag, and the
+The ``AT_EXECVE_CHECK`` :man2:`execveat` flag, and the
 ``SECBIT_EXEC_RESTRICT_FILE`` and ``SECBIT_EXEC_DENY_INTERACTIVE`` securebits
 are intended for script interpreters and dynamic linkers to enforce a
 consistent execution security policy handled by the kernel.  See the
@@ -33,7 +33,7 @@ set to 1 (i.e. always enforce restrictions).
 AT_EXECVE_CHECK
 ===============
 
-Passing the ``AT_EXECVE_CHECK`` flag to :manpage:`execveat(2)` only performs a
+Passing the ``AT_EXECVE_CHECK`` flag to :man2:`execveat` only performs a
 check on a regular file and returns 0 if execution of this file would be
 allowed, ignoring the file format and then the related interpreter dependencies
 (e.g. ELF libraries, script's shebang).
@@ -65,7 +65,7 @@ SECBIT_EXEC_RESTRICT_FILE and SECBIT_EXEC_DENY_INTERACTIVE
 ==========================================================
 
 When ``SECBIT_EXEC_RESTRICT_FILE`` is set, a process should only interpret or
-execute a file if a call to :manpage:`execveat(2)` with the related file
+execute a file if a call to :man2:`execveat` with the related file
 descriptor and the ``AT_EXECVE_CHECK`` flag succeed.
 
 This secure bit may be set by user session managers, service managers,
@@ -89,7 +89,7 @@ arbitrary code execution e.g., by enforcing a write xor execute policy.
 When ``SECBIT_EXEC_DENY_INTERACTIVE`` is set, a process should never interpret
 interactive user commands (e.g. scripts).  However, if such commands are passed
 through a file descriptor (e.g. stdin), its content should be interpreted if a
-call to :manpage:`execveat(2)` with the related file descriptor and the
+call to :man2:`execveat` with the related file descriptor and the
 ``AT_EXECVE_CHECK`` flag succeed.
 
 For instance, script interpreters called with a script snippet as argument
@@ -107,7 +107,7 @@ of any exec securebits:
    Always interpret scripts, and allow arbitrary user commands (default).
 
    No threat, everyone and everything is trusted, but we can get ahead of
-   potential issues thanks to the call to :manpage:`execveat(2)` with
+   potential issues thanks to the call to :man2:`execveat` with
    ``AT_EXECVE_CHECK`` which should always be performed but ignored by the
    script interpreter.  Indeed, this check is still important to enable systems
    administrators to verify requests (e.g. with audit) and prepare for
diff --git a/Documentation/userspace-api/landlock.rst b/Documentation/userspace-api/landlock.rst
index 1d0c2c15c22e3..8bf7ee9b389cf 100644
--- a/Documentation/userspace-api/landlock.rst
+++ b/Documentation/userspace-api/landlock.rst
@@ -290,13 +290,13 @@ access to, regardless of the underlying filesystem.
 Inheritance
 -----------
 
-Every new thread resulting from a :manpage:`clone(2)` inherits Landlock domain
+Every new thread resulting from a :man2:`clone` inherits Landlock domain
 restrictions from its parent.  This is similar to seccomp inheritance (cf.
 Documentation/userspace-api/seccomp_filter.rst) or any other LSM dealing with
-task's :manpage:`credentials(7)`.  For instance, one process's thread may apply
+task's :man7:`credentials`.  For instance, one process's thread may apply
 Landlock rules to itself, but they will not be automatically applied to other
 sibling threads (unlike POSIX thread credential changes, cf.
-:manpage:`nptl(7)`).
+:man7:`nptl`).
 
 When a thread sandboxes itself, we have the guarantee that the related security
 policy will stay enforced on all this thread's descendants.  This allows
@@ -309,7 +309,7 @@ Ptrace restrictions
 
 A sandboxed process has less privileges than a non-sandboxed process and must
 then be subject to additional restrictions when manipulating another process.
-To be allowed to use :manpage:`ptrace(2)` and related syscalls on a target
+To be allowed to use :man2:`ptrace` and related syscalls on a target
 process, a sandboxed process should have a superset of the target process's
 access rights, which means the tracee must be in a sub-domain of the tracer.
 
@@ -329,18 +329,18 @@ The operations which can be scoped are:
     same or a nested Landlock domain.
 
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET``
-    This limits the set of abstract :manpage:`unix(7)` sockets to which we can
-    :manpage:`connect(2)` to socket addresses which were created by a process in
+    This limits the set of abstract :man7:`unix` sockets to which we can
+    :man2:`connect` to socket addresses which were created by a process in
     the same or a nested Landlock domain.
 
-    A :manpage:`sendto(2)` on a non-connected datagram socket is treated as if
-    it were doing an implicit :manpage:`connect(2)` and will be blocked if the
+    A :man2:`sendto` on a non-connected datagram socket is treated as if
+    it were doing an implicit :man2:`connect` and will be blocked if the
     remote end does not stem from the same or a nested Landlock domain.
 
-    A :manpage:`sendto(2)` on a socket which was previously connected will not
+    A :man2:`sendto` on a socket which was previously connected will not
     be restricted.  This works for both datagram and stream sockets.
 
-IPC scoping does not support exceptions via :manpage:`landlock_add_rule(2)`.
+IPC scoping does not support exceptions via :man2:`landlock_add_rule`.
 If an operation is scoped within a domain, no rules can be added to allow access
 to resources or processes outside of the scope.
 
@@ -352,14 +352,14 @@ The operations covered by ``LANDLOCK_ACCESS_FS_WRITE_FILE`` and
 overlap in non-intuitive ways.  It is recommended to always specify both of
 these together.
 
-A particularly surprising example is :manpage:`creat(2)`.  The name suggests
+A particularly surprising example is :man2:`creat`.  The name suggests
 that this system call requires the rights to create and write files.  However,
 it also requires the truncate right if an existing file under the same name is
 already present.
 
 It should also be noted that truncating files does not require the
-``LANDLOCK_ACCESS_FS_WRITE_FILE`` right.  Apart from the :manpage:`truncate(2)`
-system call, this can also be done through :manpage:`open(2)` with the flags
+``LANDLOCK_ACCESS_FS_WRITE_FILE`` right.  Apart from the :man2:`truncate`
+system call, this can also be done through :man2:`open` with the flags
 ``O_RDONLY | O_TRUNC``.
 
 The truncate right is associated with the opened file (see below).
@@ -370,10 +370,10 @@ Rights associated with file descriptors
 When opening a file, the availability of the ``LANDLOCK_ACCESS_FS_TRUNCATE`` and
 ``LANDLOCK_ACCESS_FS_IOCTL_DEV`` rights is associated with the newly created
 file descriptor and will be used for subsequent truncation and ioctl attempts
-using :manpage:`ftruncate(2)` and :manpage:`ioctl(2)`.  The behavior is similar
+using :man2:`ftruncate` and :man2:`ioctl`.  The behavior is similar
 to opening a file for reading or writing, where permissions are checked during
-:manpage:`open(2)`, but not during the subsequent :manpage:`read(2)` and
-:manpage:`write(2)` calls.
+:man2:`open`, but not during the subsequent :man2:`read` and
+:man2:`write` calls.
 
 As a consequence, it is possible that a process has multiple open file
 descriptors referring to the same file, but Landlock enforces different things
@@ -476,8 +476,8 @@ Filesystem topology modification
 --------------------------------
 
 Threads sandboxed with filesystem restrictions cannot modify filesystem
-topology, whether via :manpage:`mount(2)` or :manpage:`pivot_root(2)`.
-However, :manpage:`chroot(2)` calls are not denied.
+topology, whether via :man2:`mount` or :man2:`pivot_root`.
+However, :man2:`chroot` calls are not denied.
 
 Special filesystems
 -------------------
@@ -514,7 +514,7 @@ IOCTL support
 -------------
 
 The ``LANDLOCK_ACCESS_FS_IOCTL_DEV`` right restricts the use of
-:manpage:`ioctl(2)`, but it only applies to *newly opened* device files.  This
+:man2:`ioctl`, but it only applies to *newly opened* device files.  This
 means specifically that pre-existing file descriptors like stdin, stdout and
 stderr are unaffected.
 
@@ -573,25 +573,25 @@ Device IOCTL (ABI < 5)
 ----------------------
 
 IOCTL operations could not be denied before the fifth Landlock ABI, so
-:manpage:`ioctl(2)` is always allowed when using a kernel that only supports an
+:man2:`ioctl` is always allowed when using a kernel that only supports an
 earlier ABI.
 
 Starting with the Landlock ABI version 5, it is possible to restrict the use of
-:manpage:`ioctl(2)` on character and block devices using the new
+:man2:`ioctl` on character and block devices using the new
 ``LANDLOCK_ACCESS_FS_IOCTL_DEV`` right.
 
 Abstract UNIX socket (ABI < 6)
 ------------------------------
 
 Starting with the Landlock ABI version 6, it is possible to restrict
-connections to an abstract :manpage:`unix(7)` socket by setting
+connections to an abstract :man7:`unix` socket by setting
 ``LANDLOCK_SCOPE_ABSTRACT_UNIX_SOCKET`` to the ``scoped`` ruleset attribute.
 
 Signal (ABI < 6)
 ----------------
 
 Starting with the Landlock ABI version 6, it is possible to restrict
-:manpage:`signal(7)` sending by setting ``LANDLOCK_SCOPE_SIGNAL`` to the
+:man7:`signal` sending by setting ``LANDLOCK_SCOPE_SIGNAL`` to the
 ``scoped`` ruleset attribute.
 
 Logging (ABI < 7)
diff --git a/Documentation/userspace-api/spec_ctrl.rst b/Documentation/userspace-api/spec_ctrl.rst
index ca89151fc0a8e..9ee2e96b8d87a 100644
--- a/Documentation/userspace-api/spec_ctrl.rst
+++ b/Documentation/userspace-api/spec_ctrl.rst
@@ -13,7 +13,7 @@ can be supplied on the kernel command line.
 There is also a class of mitigations which are very expensive, but they can
 be restricted to a certain set of processes or tasks in controlled
 environments. The mechanism to control these mitigations is via
-:manpage:`prctl(2)`.
+:man2:`prctl`.
 
 There are two prctl options which are related to this:
 
@@ -41,7 +41,7 @@ Bit  Define                 Description
 3    PR_SPEC_FORCE_DISABLE  Same as PR_SPEC_DISABLE, but cannot be undone. A
                             subsequent prctl(..., PR_SPEC_ENABLE) will fail.
 4    PR_SPEC_DISABLE_NOEXEC Same as PR_SPEC_DISABLE, but the state will be
-                            cleared on :manpage:`execve(2)`.
+                            cleared on :man2:`execve`.
 ==== ====================== ==================================================
 
 If all bits are 0 the CPU is not affected by the speculation misfeature.
@@ -56,7 +56,7 @@ PR_SET_SPECULATION_CTRL
 -----------------------
 
 PR_SET_SPECULATION_CTRL allows to control the speculation misfeature, which
-is selected by arg2 of :manpage:`prctl(2)` per task. arg3 is used to hand
+is selected by arg2 of :man2:`prctl` per task. arg3 is used to hand
 in the control value, i.e. either PR_SPEC_ENABLE or PR_SPEC_DISABLE or
 PR_SPEC_FORCE_DISABLE.
 
-- 
2.51.0

