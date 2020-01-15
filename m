Return-Path: <SRS0=CyXp=3E=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74189C33CB1
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 10:28:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3D25E2467C
	for <linux-doc@archiver.kernel.org>; Wed, 15 Jan 2020 10:28:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729693AbgAOK2m convert rfc822-to-8bit (ORCPT
        <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Jan 2020 05:28:42 -0500
Received: from mga02.intel.com ([134.134.136.20]:57005 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729657AbgAOK2m (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 15 Jan 2020 05:28:42 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 02:28:41 -0800
X-IronPort-AV: E=Sophos;i="5.70,322,1574150400"; 
   d="scan'208";a="218081469"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 02:28:35 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH v4] drm/trace: Buffer DRM logs in a ringbuffer accessible via debugfs
In-Reply-To: <20200114172155.215463-1-sean@poorly.run>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200114172155.215463-1-sean@poorly.run>
Date:   Wed, 15 Jan 2020 12:28:31 +0200
Message-ID: <87v9pdj9o0.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 14 Jan 2020, Sean Paul <sean@poorly.run> wrote:
> From: Sean Paul <seanpaul@chromium.org>
>
> This patch uses a ring_buffer to keep a "flight recorder" (name credit Weston)
> of DRM logs for a specified set of debug categories. The user writes a
> bitmask of debug categories to the "trace_mask" node and can read log
> messages from the "trace" node.
>
> These nodes currently exist in debugfs under the dri directory. I
> intended on exposing all of this through tracefs originally, but the
> tracefs entry points are not exposed, so there's no way to create
> tracefs files from drivers at the moment. I think it would be a
> worthwhile endeavour, but one requiring more time and conversation to
> ensure the drm traces fit somewhere sensible.
>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Pekka Paalanen <ppaalanen@gmail.com>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> Link: https://patchwork.freedesktop.org/patch/msgid/20191010204823.195540-1-sean@poorly.run #v1
> Link: https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html #v2
> Link: https://patchwork.freedesktop.org/patch/msgid/20191212203301.142437-1-sean@poorly.run #v3
>
> Changes in v2:
> - Went with a completely different approach:
> https://lists.freedesktop.org/archives/dri-devel/2019-November/243230.html
>
> Changes in v3:
> - Changed commit message to be a bit less RFC-y
> - Make class_drm_category_log an actual trace class
>
> Changes in v4:
> - Instead of [ab]using trace events and the system trace buffer, use our
>   own ringbuffer
> ---
> ---
>  Documentation/gpu/drm-uapi.rst |   9 +
>  drivers/gpu/drm/Kconfig        |   1 +
>  drivers/gpu/drm/Makefile       |   2 +-
>  drivers/gpu/drm/drm_drv.c      |   3 +
>  drivers/gpu/drm/drm_print.c    |  80 +++++--
>  drivers/gpu/drm/drm_trace.c    | 376 +++++++++++++++++++++++++++++++++
>  include/drm/drm_print.h        |  39 ++++
>  7 files changed, 487 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/gpu/drm/drm_trace.c
>
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 56fec6ed1ad8..089eb6fd3e94 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -312,6 +312,15 @@ Debugfs Support
>  .. kernel-doc:: drivers/gpu/drm/drm_debugfs.c
>     :export:
>  
> +DRM Tracing
> +---------------
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_trace.c
> +   :doc: DRM Tracing
> +
> +.. kernel-doc:: drivers/gpu/drm/drm_trace.c
> +   :internal:
> +
>  Sysfs Support
>  =============
>  
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index d0aa6cff2e02..9d8077e87afe 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -14,6 +14,7 @@ menuconfig DRM
>  	select I2C
>  	select I2C_ALGOBIT
>  	select DMA_SHARED_BUFFER
> +	select RING_BUFFER
>  	select SYNC_FILE
>  	help
>  	  Kernel-level support for the Direct Rendering Infrastructure (DRI)
> diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
> index 6493088a0fdd..88b4674934e6 100644
> --- a/drivers/gpu/drm/Makefile
> +++ b/drivers/gpu/drm/Makefile
> @@ -29,7 +29,7 @@ drm-$(CONFIG_DRM_PANEL) += drm_panel.o
>  drm-$(CONFIG_OF) += drm_of.o
>  drm-$(CONFIG_AGP) += drm_agpsupport.o
>  drm-$(CONFIG_PCI) += drm_pci.o
> -drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
> +drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o drm_trace.o
>  drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
>  
>  drm_vram_helper-y := drm_gem_vram_helper.o \
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 7c18a980cd4b..98260b9f8004 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -1114,6 +1114,7 @@ static const struct file_operations drm_stub_fops = {
>  static void drm_core_exit(void)
>  {
>  	unregister_chrdev(DRM_MAJOR, "drm");
> +	drm_trace_cleanup();
>  	debugfs_remove(drm_debugfs_root);
>  	drm_sysfs_destroy();
>  	idr_destroy(&drm_minors_idr);
> @@ -1135,6 +1136,8 @@ static int __init drm_core_init(void)
>  
>  	drm_debugfs_root = debugfs_create_dir("dri", NULL);
>  
> +	WARN_ON(drm_trace_init(drm_debugfs_root));
> +
>  	ret = register_chrdev(DRM_MAJOR, "drm", &drm_stub_fops);
>  	if (ret < 0)
>  		goto error;
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 111b932cf2a9..0ac1867937bf 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -262,21 +262,37 @@ void drm_dev_dbg(const struct device *dev, enum drm_debug_category category,
>  	struct va_format vaf;
>  	va_list args;
>  
> -	if (!drm_debug_enabled(category))
> -		return;
> -
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> -
> -	if (dev)
> -		dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> -			   __builtin_return_address(0), &vaf);
> -	else
> -		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -		       __builtin_return_address(0), &vaf);
> +	if (drm_debug_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +
> +		if (dev)
> +			dev_printk(KERN_DEBUG, dev, "[" DRM_NAME ":%ps] %pV",
> +				   __builtin_return_address(0), &vaf);
> +		else
> +			printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +			       __builtin_return_address(0), &vaf);
> +
> +		va_end(args);
> +	}
>  
> -	va_end(args);
> +	if (drm_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +
> +		if (dev)
> +			drm_dev_trace_printf(dev, "[%ps] %pV",
> +					     __builtin_return_address(0),
> +					     &vaf);
> +		else
> +			drm_trace_printf("[%ps] %pV",
> +					 __builtin_return_address(0),
> +					 &vaf);
> +
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(drm_dev_dbg);
>  
> @@ -285,17 +301,28 @@ void __drm_dbg(enum drm_debug_category category, const char *format, ...)
>  	struct va_format vaf;
>  	va_list args;
>  
> -	if (!drm_debug_enabled(category))
> -		return;
>  
> -	va_start(args, format);
> -	vaf.fmt = format;
> -	vaf.va = &args;
> +	if (drm_debug_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
>  
> -	printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> -	       __builtin_return_address(0), &vaf);
> +		printk(KERN_DEBUG "[" DRM_NAME ":%ps] %pV",
> +		       __builtin_return_address(0), &vaf);
>  
> -	va_end(args);
> +		va_end(args);
> +	}
> +
> +	if (drm_trace_enabled(category)) {
> +		va_start(args, format);
> +		vaf.fmt = format;
> +		vaf.va = &args;
> +
> +		drm_trace_printf("[%ps] %pV", __builtin_return_address(0),
> +				 &vaf);
> +
> +		va_end(args);
> +	}
>  }
>  EXPORT_SYMBOL(__drm_dbg);
>  
> @@ -312,6 +339,15 @@ void __drm_err(const char *format, ...)
>  	       __builtin_return_address(0), &vaf);
>  
>  	va_end(args);
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +
> +	drm_trace_printf("[%ps] *ERROR* %pV", __builtin_return_address(0),
> +			 &vaf);
> +
> +	va_end(args);

All the new non-debug struct drm_device based logging macros I added are
just thin wrappers around the dev_<level> ones. The only benefit of
__drm_err() is adding __builtin_return_address(0), which I think should
not be relevant in an error level print; it should be non-ambiguous
without it. IMO the function names are noise in non-debug logging. I'd
consider removing the __drm_err() function altogether:

 #define DRM_ERROR(fmt, ...)						\
-	__drm_err(fmt, ##__VA_ARGS__)
+	_DRM_PRINTK(, ERR, "*ERROR* " fmt, ##__VA_ARGS__)

What this means is that you wouldn't get the drm trace on error level
logging. However, you already weren't getting it on any of the other
levels either, nor were you getting it for DRM_DEV_ERROR() which uses
drm_dev_printk().


BR,
Jani.


>  }
>  EXPORT_SYMBOL(__drm_err);
>  
> diff --git a/drivers/gpu/drm/drm_trace.c b/drivers/gpu/drm/drm_trace.c
> new file mode 100644
> index 000000000000..0e7cf342d1d9
> --- /dev/null
> +++ b/drivers/gpu/drm/drm_trace.c
> @@ -0,0 +1,376 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright (C) 2020 Google, Inc.
> + *
> + * Authors:
> + * Sean Paul <seanpaul@chromium.org>
> + */
> +
> +#include <linux/cpumask.h>
> +#include <linux/debugfs.h>
> +#include <linux/kernel.h>
> +#include <linux/ring_buffer.h>
> +#include <linux/slab.h>
> +#include <linux/stat.h>
> +
> +#include <drm/drm_device.h>
> +#include <drm/drm_print.h>
> +
> +#define DRM_TRACE_MAX_LEN	256
> +
> +/**
> + * DOC: DRM Tracing
> + *
> + * *tl;dr* DRM tracing is a lightweight alternative to traditional DRM debug
> + * logging.
> + *
> + * While DRM logging is quite convenient when reproducing a specific issue, it
> + * doesn't help when something goes wrong unexpectedly. There are a couple
> + * reasons why one does not want to enable DRM logging at all times:
> + *
> + * 1. We don't want to overwhelm syslog with drm spam, others have to use it too
> + * 2. Console logging is slow
> + *
> + * DRM tracing aims to solve both these problems.
> + *
> + * To use DRM tracing, write a DRM debug category mask (this is a bitmask of
> + * &drm_debug_category values) to the trace_mask file:
> + * ::
> + *
> + *    eg: echo 0x106 > /sys/kernel/debug/dri/trace_mask
> + *
> + * Once active, all log messages in the specified categories will be written to
> + * the DRM trace. Once at capacity, the trace will overwrite old messages with
> + * new ones. At any point, one can read the trace file to extract the previous N
> + * DRM messages:
> + * ::
> + *
> + *    eg: cat /sys/kernel/debug/dri/trace
> + *
> + * Considerations
> + * **************
> + * The contents of the DRM Trace are **not** considered UABI. **DO NOT depend on
> + * the values of these traces in your userspace.** These traces are intended for
> + * entertainment purposes only. The contents of these logs carry no warranty,
> + * expressed or implied.
> + *
> + * New traces can not be added to the trace buffer while it is being read. If
> + * this proves to be a problem, it can be mitigated by making a copy of the
> + * buffer on start of read. Since DRM trace is not meant to be continuously
> + * read, this loss is acceptable.
> + *
> + * The timestamps on logs are CPU-local. As such, log messages from different
> + * CPUs may have slightly different ideas about time.
> + *
> + * Since each CPU has its own buffer, they won't all overflow at the same rate.
> + * This means that messages from a particularly active CPU could be dropped
> + * while an inactive CPU might have much older log messages. So don't be fooled
> + * if you seem to be missing log messages when you see a switch between CPUs in
> + * the logs.
> + *
> + * Internals
> + * *********
> + * The DRM Tracing functions are intentionally unexported, they are not meant to
> + * be used by drivers directly. The reasons are twofold:
> + *
> + * 1. All messages going to traces should also go to the console logs. This
> + *    ensures users can choose their logging medium without fear they're losing
> + *    messages.
> + * 2. Writing directly to the trace skips category filtering, resulting in trace
> + *    spam.
> + */
> +
> +struct drm_trace_info {
> +	struct ring_buffer *buffer;
> +	struct dentry *debugfs;
> +	struct dentry *debugfs_mask;
> +	enum drm_debug_category category_mask;
> +};
> +static struct drm_trace_info drm_trace;
> +
> +struct drm_trace_seq_iter {
> +	loff_t pos;
> +	cpumask_var_t cpu_mask;
> +	int cpu;
> +	u64 ts;
> +};
> +
> +static void *drm_trace_seq_start(struct seq_file *seq_file, loff_t *pos)
> +{
> +	struct drm_trace_info *info = seq_file->private;
> +	struct drm_trace_seq_iter *iter;
> +	int cpu;
> +
> +	iter = kzalloc(sizeof(*iter), GFP_KERNEL);
> +	if (!iter)
> +		return NULL;
> +
> +	if (!zalloc_cpumask_var(&iter->cpu_mask, GFP_KERNEL))
> +		return NULL;
> +
> +	/*
> +	 * TODO: We could do better than stopping record for the entirety of the
> +	 *	 read session.
> +	 */
> +	ring_buffer_record_off(info->buffer);
> +
> +	/*
> +	 * pos is only used as a means of determining whether we're at the start
> +	 * of the virtual file, or continuing a read. We don't want to skip over
> +	 * log lines since that's not a meaningful thing to do.
> +	 */
> +	iter->pos = *pos;
> +
> +	iter->cpu = -1;
> +
> +	/*
> +	 * There's no way to extract the ring buffer's cpumask, so we'll try
> +	 * every possible cpu and skip the invalid entries.
> +	 */
> +	for_each_possible_cpu(cpu) {
> +		if (ring_buffer_entries_cpu(info->buffer, cpu))
> +			cpumask_set_cpu(cpu, iter->cpu_mask);
> +	}
> +
> +	return iter;
> +}
> +
> +static void *drm_trace_seq_next(struct seq_file *seq_file, void *data,
> +				loff_t *pos)
> +{
> +	struct drm_trace_info *info = seq_file->private;
> +	struct drm_trace_seq_iter *iter = data;
> +	int cpu;
> +
> +	*pos = ++iter->pos;
> +	iter->cpu = -1;
> +	iter->ts = 0;
> +
> +	/* Find the oldest event across our cpu_mask */
> +	for_each_cpu(cpu, iter->cpu_mask) {
> +		u64 ts;
> +
> +		if (!ring_buffer_peek(info->buffer, cpu, &ts, NULL)) {
> +			cpumask_clear_cpu(cpu, iter->cpu_mask);
> +			continue;
> +		}
> +		if (iter->cpu == -1 || ts < iter->ts) {
> +			iter->ts = ts;
> +			iter->cpu = cpu;
> +		}
> +	}
> +	if (iter->cpu == -1)
> +		return NULL;
> +
> +	return iter;
> +}
> +
> +static void drm_trace_seq_stop(struct seq_file *seq_file, void *data)
> +{
> +	struct drm_trace_info *info = seq_file->private;
> +	struct drm_trace_seq_iter *iter = data;
> +
> +	free_cpumask_var(iter->cpu_mask);
> +	kfree(iter);
> +
> +	ring_buffer_record_on(info->buffer);
> +}
> +
> +static int drm_trace_seq_show(struct seq_file *seq_file, void *data)
> +{
> +	struct drm_trace_info *info = seq_file->private;
> +	struct drm_trace_seq_iter *iter = data;
> +	struct ring_buffer_event *event;
> +	u64 ts, usec;
> +
> +	if (iter->pos == 0) {
> +		seq_printf(seq_file, "[%3s %12s] %s\n", "cpu", "timestamp",
> +			   "message");
> +		return 0;
> +	} else if (iter->cpu == -1) {
> +		/* This happens when we start a session with position > 0 */
> +		return SEQ_SKIP;
> +	}
> +
> +	event = ring_buffer_consume(info->buffer, iter->cpu, &ts, NULL);
> +
> +	ts += 500;
> +	/* ts converts from ns->us */
> +	do_div(ts, 1000);
> +	/* ts converts from us->s */
> +	usec = do_div(ts, USEC_PER_SEC);
> +
> +	seq_printf(seq_file, "[%3u %5llu.%06llu] %s", iter->cpu, ts, usec,
> +		   (const char *)ring_buffer_event_data(event));
> +
> +	return 0;
> +}
> +
> +static const struct seq_operations drm_trace_sops = {
> +	.start = drm_trace_seq_start,
> +	.next = drm_trace_seq_next,
> +	.stop = drm_trace_seq_stop,
> +	.show  = drm_trace_seq_show
> +};
> +
> +static int drm_trace_fop_open(struct inode *inode, struct file *file)
> +{
> +	struct seq_file *seq_file;
> +	int ret;
> +
> +	ret = seq_open(file, &drm_trace_sops);
> +	if (ret)
> +		return ret;
> +
> +	seq_file = (struct seq_file *)file->private_data;
> +	seq_file->private = inode->i_private; /* this is drm_trace_info */
> +
> +	return 0;
> +}
> +
> +static const struct file_operations drm_trace_fops = {
> +	.open = drm_trace_fop_open,
> +	.read = seq_read,
> +	.llseek = seq_lseek,
> +	.release = seq_release,
> +};
> +
> +/**
> + * drm_trace_init - initializes tracing for drm core
> + * @debugfs_root: the dentry for drm core's debugfs root
> + *
> + * This function is called on drm core init. It is responsible for initializing
> + * drm tracing. This function must be matched by a call to drm_trace_cleanup().
> + *
> + * Returns: 0 on success, -errno on failure
> + */
> +int drm_trace_init(struct dentry *debugfs_root)
> +{
> +	struct drm_trace_info *info = &drm_trace;
> +	int ret;
> +
> +	info->buffer = ring_buffer_alloc(PAGE_SIZE * 2, RB_FL_OVERWRITE);
> +	if (!info->buffer)
> +		return -ENOMEM;
> +
> +	info->debugfs_mask = debugfs_create_u32("trace_mask",
> +						S_IFREG | S_IRUGO | S_IWUSR,
> +						debugfs_root,
> +						&info->category_mask);
> +	if (IS_ERR(info->debugfs)) {
> +		ret = PTR_ERR(info->debugfs);
> +		goto err_debugfs_mask;
> +	}
> +
> +	info->debugfs = debugfs_create_file("trace", S_IFREG | S_IRUGO,
> +					    debugfs_root, info,
> +					    &drm_trace_fops);
> +	if (IS_ERR(info->debugfs)) {
> +		ret = PTR_ERR(info->debugfs);
> +		goto err_debugfs;
> +	}
> +
> +	return 0;
> +
> +err_debugfs_mask:
> +	debugfs_remove(info->debugfs_mask);
> +err_debugfs:
> +	ring_buffer_free(info->buffer);
> +	return ret;
> +}
> +
> +/**
> + * drm_trace_cleanup - cleans up tracing for drm core
> + *
> + * This function is responsible for cleaning up anything that was previously
> + * initialized in drm_trace_init()
> + */
> +void drm_trace_cleanup()
> +{
> +	struct drm_trace_info *info = &drm_trace;
> +
> +	debugfs_remove(info->debugfs);
> +	debugfs_remove(info->debugfs_mask);
> +	ring_buffer_free(info->buffer);
> +	memset(info, 0, sizeof(*info));
> +}
> +
> +/**
> + * drm_trace_enabled - check if a debug category has traces enabled
> + * @category: the debug category to check
> + *
> + * Returns true if the given category has drm traces enabled, false otherwise.
> + */
> +bool drm_trace_enabled(enum drm_debug_category category)
> +{
> +	return READ_ONCE(drm_trace.category_mask) & category;
> +}
> +
> +static int drm_trace_write(const void *data, unsigned int len)
> +{
> +	struct drm_trace_info *info = &drm_trace;
> +	struct ring_buffer_event *event;
> +	void *event_body;
> +
> +	event = ring_buffer_lock_reserve(info->buffer, len);
> +	if (!event)
> +		return -ENOMEM;
> +
> +	event_body = ring_buffer_event_data(event);
> +	memcpy(event_body, data, len);
> +
> +	return ring_buffer_unlock_commit(info->buffer, event);
> +}
> +
> +/**
> + * drm_trace_printf - adds an entry to the drm trace
> + * @format: printf format of the message to add to the trace
> + *
> + * This function adds a new entry in the drm trace.
> + */
> +void drm_trace_printf(const char *format, ...)
> +{
> +	char buf[DRM_TRACE_MAX_LEN];
> +	va_list args;
> +	int ret;
> +
> +	va_start(args, format);
> +	ret = vsnprintf(buf, sizeof(buf), format, args);
> +	va_end(args);
> +
> +	if (ret < 0)
> +		return;
> +	else if (ret >= sizeof(buf))
> +		ret = sizeof(buf) - 1;
> +
> +	drm_trace_write(buf, ret + 1);
> +}
> +
> +/**
> + * drm_dev_trace_printf - adds an entry to the drm trace
> + * @dev: pointer to device so we can print the name
> + * @format: printf format of the message to add to the trace
> + *
> + * This function adds a new entry in the drm trace.
> + */
> +void drm_dev_trace_printf(const struct device *dev, const char *format, ...)
> +{
> +	char buf[DRM_TRACE_MAX_LEN];
> +	struct va_format vaf;
> +	va_list args;
> +	int ret;
> +
> +	va_start(args, format);
> +	vaf.fmt = format;
> +	vaf.va = &args;
> +	ret = snprintf(buf, sizeof(buf), "%s %s: %pV", dev_driver_string(dev),
> +		       dev_name(dev), &vaf);
> +	va_end(args);
> +
> +	if (ret < 0)
> +		return;
> +	else if (ret >= sizeof(buf))
> +		ret = sizeof(buf) - 1;
> +
> +	drm_trace_write(buf, ret + 1);
> +}
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 8f99d389792d..1f3dae7150f0 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -320,6 +320,45 @@ static inline bool drm_debug_enabled(enum drm_debug_category category)
>  	return unlikely(__drm_debug & category);
>  }
>  
> +#ifdef CONFIG_DEBUG_FS
> +
> +int drm_trace_init(struct dentry *debugfs_root);
> +bool drm_trace_enabled(enum drm_debug_category category);
> +__printf(1, 2)
> +void drm_trace_printf(const char *format, ...);
> +__printf(2, 3)
> +void drm_dev_trace_printf(const struct device *dev, const char *format, ...);
> +void drm_trace_cleanup(void);
> +
> +#else
> +
> +static inline int drm_trace_init(struct dentry *debugfs_root)
> +{
> +	return 0;
> +}
> +
> +static inline bool drm_trace_enabled(enum drm_debug_category category)
> +{
> +	return false;
> +}
> +
> +__printf(1, 2)
> +static inline void drm_trace_printf(const char *format, ...)
> +{
> +}
> +
> +__printf(2, 3)
> +static inline void drm_dev_trace_printf(const struct device *dev,
> +					const char *format, ...)
> +{
> +}
> +
> +static inline void drm_trace_cleanup(void)
> +{
> +}
> +
> +#endif
> +
>  /*
>   * struct device based logging
>   *

-- 
Jani Nikula, Intel Open Source Graphics Center
