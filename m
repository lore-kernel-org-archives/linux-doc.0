Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFC1225785
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 23:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766445972; cv=none; b=Kj+ofzslluWmiPqmtOm0OO9nis+hc1FzsHkCRVxmMuFp+tJAMTYGU3L9oojYbzeZCVc7cvotbucdFgNwEDMOQ09UY2uorSqh1vu5vNeQq834kYbzq+r16TD+BqIedTCdHWpTyuULDK79gVNYOzGNu+bvaOmMC/xQsx4QCJV3e+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766445972; c=relaxed/simple;
	bh=YfjijN5FFZZ4eB74c8b3d2vGNs8Uo+WChpSQBh3BE3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uD+kXR1q6KRzyzOlrbJ56mFDuahyvEnkhBT6bPS4uhF8vBDcDlYHkXXzeTDgCE8esCNrpjveVE3jR6i4jFi6KV0jWJ5UKw0KI2MMmY2eeq0mpcZLU91Wm3zjEUDWBZ1VEizfiz3LxFLSvg7ymgk/yEHnbGjGbEeHYQuJT/ROkXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=e4JPO1D3; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="e4JPO1D3"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766445965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uN2rrw0PeHY2Pc4U7XZnnymlb95LYoyVngCnCWSl+XI=;
	b=e4JPO1D3aDyIBNjbBhb+BLU/2Aci4rBKHwUiWzttk2pag1gqMeXWdtG13KcLbyXhqUuZ3U
	ocNKlzvhFCZikDcdirz/WKSFUoHKP+TxnbSm0V+W5jN/RJxe2tpIIQKdVrlc6raMN8cqdP
	lQW7mkgE33Di3+gbMRKttOyCO/nQxDE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Documentation: kernel-hacking: Remove :c:func: annotations
Date: Tue, 23 Dec 2025 00:25:04 +0100
Message-ID: <20251222232506.2615-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Remove the useless :c:func: annotations.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Only applies after applying https://lore.kernel.org/lkml/20251219171827.44015-2-thorsten.blum@linux.dev/

Changes in v2:
- Remove backticks as suggested by Jonathan
---
 Documentation/kernel-hacking/hacking.rst | 169 +++++++++++------------
 1 file changed, 84 insertions(+), 85 deletions(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 06fcb7c662d3..bd5401b92442 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -49,7 +49,7 @@ User Context
 
 User context is when you are coming in from a system call or other trap:
 like userspace, you can be preempted by more important tasks and by
-interrupts. You can sleep by calling :c:func:`schedule()`.
+interrupts. You can sleep by calling schedule().
 
 .. note::
 
@@ -57,13 +57,13 @@ interrupts. You can sleep by calling :c:func:`schedule()`.
     operations on the block device layer.
 
 In user context, the ``current`` pointer (indicating the task we are
-currently executing) is valid, and :c:func:`in_interrupt()`
+currently executing) is valid, and in_interrupt()
 (``include/linux/preempt.h``) is false.
 
 .. warning::
 
     Beware that if you have preemption or softirqs disabled (see below),
-    :c:func:`in_interrupt()` will return a false positive.
+    in_interrupt() will return a false positive.
 
 Hardware Interrupts (Hard IRQs)
 -------------------------------
@@ -115,7 +115,7 @@ time, although different tasklets can run simultaneously.
     'tasks'.
 
 You can tell you are in a softirq (or tasklet) using the
-:c:func:`in_softirq()` macro (``include/linux/preempt.h``).
+in_softirq() macro (``include/linux/preempt.h``).
 
 .. warning::
 
@@ -171,7 +171,7 @@ in every architecture's ``include/asm/unistd.h`` and
 Linus.
 
 If all your routine does is read or write some parameter, consider
-implementing a :c:func:`sysfs()` interface instead.
+implementing a sysfs() interface instead.
 
 Inside the ioctl you're in user context to a process. When a error
 occurs you return a negated errno (see
@@ -230,12 +230,12 @@ Really.
 Common Routines
 ===============
 
-:c:func:`printk()`
-------------------
+printk()
+--------
 
 Defined in ``include/linux/printk.h``
 
-:c:func:`printk()` feeds kernel messages to the console, dmesg, and
+printk() feeds kernel messages to the console, dmesg, and
 the syslog daemon. It is useful for debugging and reporting errors, and
 can be used inside interrupt context, but use with caution: a machine
 which has its console flooded with printk messages is unusable. It uses
@@ -253,7 +253,7 @@ address use::
     printk(KERN_INFO "my ip: %pI4\n", &ipaddress);
 
 
-:c:func:`printk()` internally uses a 1K buffer and does not catch
+printk() internally uses a 1K buffer and does not catch
 overruns. Make sure that will be enough.
 
 .. note::
@@ -267,26 +267,26 @@ overruns. Make sure that will be enough.
     on top of its printf function: "Printf should not be used for
     chit-chat". You should follow that advice.
 
-:c:func:`copy_to_user()` / :c:func:`copy_from_user()` / :c:func:`get_user()` / :c:func:`put_user()`
----------------------------------------------------------------------------------------------------
+copy_to_user() / copy_from_user() / get_user() / put_user()
+-----------------------------------------------------------
 
 Defined in ``include/linux/uaccess.h`` / ``asm/uaccess.h``
 
 **[SLEEPS]**
 
-:c:func:`put_user()` and :c:func:`get_user()` are used to get
+put_user() and get_user() are used to get
 and put single values (such as an int, char, or long) from and to
 userspace. A pointer into userspace should never be simply dereferenced:
 data should be copied using these routines. Both return ``-EFAULT`` or
 0.
 
-:c:func:`copy_to_user()` and :c:func:`copy_from_user()` are
+copy_to_user() and copy_from_user() are
 more general: they copy an arbitrary amount of data to and from
 userspace.
 
 .. warning::
 
-    Unlike :c:func:`put_user()` and :c:func:`get_user()`, they
+    Unlike put_user() and get_user(), they
     return the amount of uncopied data (ie. 0 still means success).
 
 [Yes, this objectionable interface makes me cringe. The flamewar comes
@@ -296,8 +296,8 @@ The functions may sleep implicitly. This should never be called outside
 user context (it makes no sense), with interrupts disabled, or a
 spinlock held.
 
-:c:func:`kmalloc()`/:c:func:`kfree()`
--------------------------------------
+kmalloc()/kfree()
+-----------------
 
 Defined in ``include/linux/slab.h``
 
@@ -305,7 +305,7 @@ Defined in ``include/linux/slab.h``
 
 These routines are used to dynamically request pointer-aligned chunks of
 memory, like malloc and free do in userspace, but
-:c:func:`kmalloc()` takes an extra flag word. Important values:
+kmalloc() takes an extra flag word. Important values:
 
 ``GFP_KERNEL``
     May sleep and swap to free memory. Only allowed in user context, but
@@ -326,20 +326,20 @@ interrupt context without ``GFP_ATOMIC``. You should really fix that.
 Run, don't walk.
 
 If you are allocating at least ``PAGE_SIZE`` (``asm/page.h`` or
-``asm/page_types.h``) bytes, consider using :c:func:`__get_free_pages()`
+``asm/page_types.h``) bytes, consider using __get_free_pages()
 (``include/linux/gfp.h``). It takes an order argument (0 for page sized,
 1 for double page, 2 for four pages etc.) and the same memory priority
 flag word as above.
 
 If you are allocating more than a page worth of bytes you can use
-:c:func:`vmalloc()`. It'll allocate virtual memory in the kernel
+vmalloc(). It'll allocate virtual memory in the kernel
 map. This block is not contiguous in physical memory, but the MMU makes
 it look like it is for you (so it'll only look contiguous to the CPUs,
 not to external device drivers). If you really need large physically
 contiguous memory for some weird device, you have a problem: it is
 poorly supported in Linux because after some time memory fragmentation
 in a running kernel makes it hard. The best way is to allocate the block
-early in the boot process via the :c:func:`alloc_bootmem()`
+early in the boot process via the alloc_bootmem()
 routine.
 
 Before inventing your own cache of often-used objects consider using a
@@ -355,48 +355,48 @@ task structure, so is only valid in user context. For example, when a
 process makes a system call, this will point to the task structure of
 the calling process. It is **not NULL** in interrupt context.
 
-:c:func:`mdelay()`/:c:func:`udelay()`
--------------------------------------
+mdelay()/udelay()
+-----------------
 
 Defined in ``include/asm/delay.h`` / ``include/linux/delay.h``
 
-The :c:func:`udelay()` and :c:func:`ndelay()` functions can be
+The udelay() and ndelay() functions can be
 used for small pauses. Do not use large values with them as you risk
-overflow - the helper function :c:func:`mdelay()` is useful here, or
-consider :c:func:`msleep()`.
+overflow - the helper function mdelay() is useful here, or
+consider msleep().
 
-:c:func:`cpu_to_be32()`/:c:func:`be32_to_cpu()`/:c:func:`cpu_to_le32()`/:c:func:`le32_to_cpu()`
------------------------------------------------------------------------------------------------
+cpu_to_be32()/be32_to_cpu()/cpu_to_le32()/le32_to_cpu()
+-------------------------------------------------------
 
 Defined in ``include/asm/byteorder.h``
 
-The :c:func:`cpu_to_be32()` family (where the "32" can be replaced
+The cpu_to_be32() family (where the "32" can be replaced
 by 64 or 16, and the "be" can be replaced by "le") are the general way
 to do endian conversions in the kernel: they return the converted value.
 All variations supply the reverse as well:
-:c:func:`be32_to_cpu()`, etc.
+be32_to_cpu(), etc.
 
 There are two major variations of these functions: the pointer
-variation, such as :c:func:`cpu_to_be32p()`, which take a pointer
+variation, such as cpu_to_be32p(), which take a pointer
 to the given type, and return the converted value. The other variation
-is the "in-situ" family, such as :c:func:`cpu_to_be32s()`, which
+is the "in-situ" family, such as cpu_to_be32s(), which
 convert value referred to by the pointer, and return void.
 
-:c:func:`local_irq_save()`/:c:func:`local_irq_restore()`
---------------------------------------------------------
+local_irq_save()/local_irq_restore()
+------------------------------------
 
 Defined in ``include/linux/irqflags.h``
 
 These routines disable hard interrupts on the local CPU, and restore
 them. They are reentrant; saving the previous state in their one
 ``unsigned long flags`` argument. If you know that interrupts are
-enabled, you can simply use :c:func:`local_irq_disable()` and
-:c:func:`local_irq_enable()`.
+enabled, you can simply use local_irq_disable() and
+local_irq_enable().
 
 .. _local_bh_disable:
 
-:c:func:`local_bh_disable()`/:c:func:`local_bh_enable()`
---------------------------------------------------------
+local_bh_disable()/local_bh_enable()
+------------------------------------
 
 Defined in ``include/linux/bottom_half.h``
 
@@ -406,15 +406,15 @@ them. They are reentrant; if soft interrupts were disabled before, they
 will still be disabled after this pair of functions has been called.
 They prevent softirqs and tasklets from running on the current CPU.
 
-:c:func:`smp_processor_id()`
-----------------------------
+smp_processor_id()
+------------------
 
 Defined in ``include/linux/smp.h``
 
-:c:func:`get_cpu()` disables preemption (so you won't suddenly get
+get_cpu() disables preemption (so you won't suddenly get
 moved to another CPU) and returns the current processor number, between
 0 and ``NR_CPUS``. Note that the CPU numbers are not necessarily
-continuous. You return it again with :c:func:`put_cpu()` when you
+continuous. You return it again with put_cpu() when you
 are done.
 
 If you know you cannot be preempted by another task (ie. you are in
@@ -433,25 +433,25 @@ initialization. ``__exit`` is used to declare a function which is only
 required on exit: the function will be dropped if this file is not
 compiled as a module. See the header file for use. Note that it makes no
 sense for a function marked with ``__init`` to be exported to modules
-with :c:func:`EXPORT_SYMBOL()` or :c:func:`EXPORT_SYMBOL_GPL()`- this
+with EXPORT_SYMBOL() or EXPORT_SYMBOL_GPL()- this
 will break.
 
-:c:func:`__initcall()`/:c:func:`module_init()`
-----------------------------------------------
+__initcall()/module_init()
+--------------------------
 
 Defined in  ``include/linux/init.h`` / ``include/linux/module.h``
 
 Many parts of the kernel are well served as a module
 (dynamically-loadable parts of the kernel). Using the
-:c:func:`module_init()` and :c:func:`module_exit()` macros it
+module_init() and module_exit() macros it
 is easy to write code without #ifdefs which can operate both as a module
 or built into the kernel.
 
-The :c:func:`module_init()` macro defines which function is to be
+The module_init() macro defines which function is to be
 called at module insertion time (if the file is compiled as a module),
 or at boot time: if the file is not compiled as a module the
-:c:func:`module_init()` macro becomes equivalent to
-:c:func:`__initcall()`, which through linker magic ensures that
+module_init() macro becomes equivalent to
+__initcall(), which through linker magic ensures that
 the function is called on boot.
 
 The function can return a negative error number to cause module loading
@@ -459,9 +459,8 @@ to fail (unfortunately, this has no effect if the module is compiled
 into the kernel). This function is called in user context with
 interrupts enabled, so it can sleep.
 
-:c:func:`module_exit()`
------------------------
-
+module_exit()
+-------------
 
 Defined in  ``include/linux/module.h``
 
@@ -474,18 +473,18 @@ it returns.
 Note that this macro is optional: if it is not present, your module will
 not be removable (except for 'rmmod -f').
 
-:c:func:`try_module_get()`/:c:func:`module_put()`
--------------------------------------------------
+try_module_get()/module_put()
+-----------------------------
 
 Defined in ``include/linux/module.h``
 
 These manipulate the module usage count, to protect against removal (a
 module also can't be removed if another module uses one of its exported
 symbols: see below). Before calling into module code, you should call
-:c:func:`try_module_get()` on that module: if it fails, then the
+try_module_get() on that module: if it fails, then the
 module is being removed and you should act as if it wasn't there.
 Otherwise, you can safely enter the module, and call
-:c:func:`module_put()` when you're finished.
+module_put() when you're finished.
 
 Most registerable structures have an owner field, such as in the
 :c:type:`struct file_operations <file_operations>` structure.
@@ -506,8 +505,8 @@ Declaring
 ---------
 
 You declare a ``wait_queue_head_t`` using the
-:c:func:`DECLARE_WAIT_QUEUE_HEAD()` macro, or using the
-:c:func:`init_waitqueue_head()` routine in your initialization
+DECLARE_WAIT_QUEUE_HEAD() macro, or using the
+init_waitqueue_head() routine in your initialization
 code.
 
 Queuing
@@ -515,16 +514,16 @@ Queuing
 
 Placing yourself in the waitqueue is fairly complex, because you must
 put yourself in the queue before checking the condition. There is a
-macro to do this: :c:func:`wait_event_interruptible()`
+macro to do this: wait_event_interruptible()
 (``include/linux/wait.h``) The first argument is the wait queue head, and
 the second is an expression which is evaluated; the macro returns 0 when
 this expression is true, or ``-ERESTARTSYS`` if a signal is received. The
-:c:func:`wait_event()` version ignores signals.
+wait_event() version ignores signals.
 
 Waking Up Queued Tasks
 ----------------------
 
-Call :c:func:`wake_up()` (``include/linux/wait.h``), which will wake
+Call wake_up() (``include/linux/wait.h``), which will wake
 up every process in the queue. The exception is if one has
 ``TASK_EXCLUSIVE`` set, in which case the remainder of the queue will
 not be woken. There are other variants of this basic function available
@@ -537,10 +536,10 @@ Certain operations are guaranteed atomic on all platforms. The first
 class of operations work on :c:type:`atomic_t` (``include/asm/atomic.h``);
 this contains a signed integer (at least 32 bits long), and you must use
 these functions to manipulate or read :c:type:`atomic_t` variables.
-:c:func:`atomic_read()` and :c:func:`atomic_set()` get and set
-the counter, :c:func:`atomic_add()`, :c:func:`atomic_sub()`,
-:c:func:`atomic_inc()`, :c:func:`atomic_dec()`, and
-:c:func:`atomic_dec_and_test()` (returns true if it was
+atomic_read() and atomic_set() get and set
+the counter, atomic_add(), atomic_sub(),
+atomic_inc(), atomic_dec(), and
+atomic_dec_and_test() (returns true if it was
 decremented to zero).
 
 Yes. It returns true (i.e. != 0) if the atomic variable is zero.
@@ -551,11 +550,11 @@ should not be used unnecessarily.
 The second class of atomic operations is atomic bit operations on an
 ``unsigned long``, defined in ``include/linux/bitops.h``. These
 operations generally take a pointer to the bit pattern, and a bit
-number: 0 is the least significant bit. :c:func:`set_bit()`,
-:c:func:`clear_bit()` and :c:func:`change_bit()` set, clear,
-and flip the given bit. :c:func:`test_and_set_bit()`,
-:c:func:`test_and_clear_bit()` and
-:c:func:`test_and_change_bit()` do the same thing, except return
+number: 0 is the least significant bit. set_bit(),
+clear_bit() and change_bit() set, clear,
+and flip the given bit. test_and_set_bit(),
+test_and_clear_bit() and
+test_and_change_bit() do the same thing, except return
 true if the bit was previously set; these are particularly useful for
 atomically setting flags.
 
@@ -572,29 +571,29 @@ be used anywhere in the kernel). However, for modules, a special
 exported symbol table is kept which limits the entry points to the
 kernel proper. Modules can also export symbols.
 
-:c:func:`EXPORT_SYMBOL()`
--------------------------
+EXPORT_SYMBOL()
+---------------
 
 Defined in ``include/linux/export.h``
 
 This is the classic method of exporting a symbol: dynamically loaded
 modules will be able to use the symbol as normal.
 
-:c:func:`EXPORT_SYMBOL_GPL()`
------------------------------
+EXPORT_SYMBOL_GPL()
+-------------------
 
 Defined in ``include/linux/export.h``
 
-Similar to :c:func:`EXPORT_SYMBOL()` except that the symbols
-exported by :c:func:`EXPORT_SYMBOL_GPL()` can only be seen by
-modules with a :c:func:`MODULE_LICENSE()` that specifies a GPLv2
+Similar to EXPORT_SYMBOL() except that the symbols
+exported by EXPORT_SYMBOL_GPL() can only be seen by
+modules with a MODULE_LICENSE() that specifies a GPLv2
 compatible license. It implies that the function is considered an
 internal implementation issue, and not really an interface. Some
 maintainers and developers may however require EXPORT_SYMBOL_GPL()
 when adding any new APIs or functionality.
 
-:c:func:`EXPORT_SYMBOL_NS()`
-----------------------------
+EXPORT_SYMBOL_NS()
+------------------
 
 Defined in ``include/linux/export.h``
 
@@ -602,8 +601,8 @@ This is the variant of `EXPORT_SYMBOL()` that allows specifying a symbol
 namespace. Symbol Namespaces are documented in
 Documentation/core-api/symbol-namespaces.rst
 
-:c:func:`EXPORT_SYMBOL_NS_GPL()`
---------------------------------
+EXPORT_SYMBOL_NS_GPL()
+----------------------
 
 Defined in ``include/linux/export.h``
 
@@ -621,7 +620,7 @@ There used to be three sets of linked-list routines in the kernel
 headers, but this one is the winner. If you don't have some particular
 pressing need for a single list, it's a good choice.
 
-In particular, :c:func:`list_for_each_entry()` is useful.
+In particular, list_for_each_entry() is useful.
 
 Return Conventions
 ------------------
@@ -631,9 +630,9 @@ and return 0 for success, and a negative error number (eg. ``-EFAULT``) for
 failure. This can be unintuitive at first, but it's fairly widespread in
 the kernel.
 
-Using :c:func:`ERR_PTR()` (``include/linux/err.h``) to encode a
-negative error number into a pointer, and :c:func:`IS_ERR()` and
-:c:func:`PTR_ERR()` to get it back out again: avoids a separate
+Using ERR_PTR() (``include/linux/err.h``) to encode a
+negative error number into a pointer, and IS_ERR() and
+PTR_ERR() to get it back out again: avoids a separate
 pointer parameter for the error number. Icky, but in a good way.
 
 Breaking Compilation
@@ -824,7 +823,7 @@ Thanks
 Thanks to Andi Kleen for the idea, answering my questions, fixing my
 mistakes, filling content, etc. Philipp Rumpf for more spelling and
 clarity fixes, and some excellent non-obvious points. Werner Almesberger
-for giving me a great summary of :c:func:`disable_irq()`, and Jes
+for giving me a great summary of disable_irq(), and Jes
 Sorensen and Andrea Arcangeli added caveats. Michael Elizabeth Chastain
 for checking and adding to the Configure section. Telsa Gwynne for
 teaching me DocBook.
-- 
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4

