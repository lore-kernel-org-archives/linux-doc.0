Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C6197D922
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730374AbfIROXQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:33180 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726330AbfIROXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 04ADEB673;
        Wed, 18 Sep 2019 14:23:11 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 01/11] drm/vram: Add struct drm_vram_buffer to VRAM helpers
Date:   Wed, 18 Sep 2019 16:22:57 +0200
Message-Id: <20190918142307.27127-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Drivers with dedicated video memory occasionally need to reserve a memory
area for a specific purpose, such as cursor images or sprites. Using GEM
VRAM buffer objects can be problematic. For small buffers, GEM VRAM buffer
objects are inefficient as they are aligned to page boundaries. And they
cannot easily be placed at specific memory offsets. This can lead to memory
fragmentation and is a problem for hardware with only a small amount of
memory.

The data structure struct drm_vram_buffer manages an area of video
memory. In contrast to GEM VRAM buffer objects, the memory is of static
size and dedicated to a single purpose. The area can be of any size and
places at an arbitrary offset. A single buffer can hold multiple frames.

A use case is in ast's and mgag200's cursor handling. Each driver
reserves a small amount of dedicated video memory (<=32 KiB) that holds a
double-buffered cursor image. The image is in a HW-specific, non-standard
format. With a VRAM buffer, the dedicated memory can be of an optimal size
and located at the high end of video memory. The remaining video memory is
available for the framebuffer's GEM VRAM buffer objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-mm.rst             |  19 +-
 drivers/gpu/drm/drm_vram_helper_common.c | 259 ++++++++++++++++++++++-
 include/drm/drm_vram_helper.h            |  64 ++++++
 3 files changed, 335 insertions(+), 7 deletions(-)
 create mode 100644 include/drm/drm_vram_helper.h

diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
index 99d56015e077..eac12bd0ea3f 100644
--- a/Documentation/gpu/drm-mm.rst
+++ b/Documentation/gpu/drm-mm.rst
@@ -379,15 +379,12 @@ GEM CMA Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_cma_helper.c
    :export:
 
-VRAM Helper Function Reference
-==============================
+VRAM Helper Library
+===================
 
 .. kernel-doc:: drivers/gpu/drm/drm_vram_helper_common.c
    :doc: overview
 
-.. kernel-doc:: include/drm/drm_gem_vram_helper.h
-   :internal:
-
 GEM VRAM Helper Functions Reference
 -----------------------------------
 
@@ -400,6 +397,18 @@ GEM VRAM Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_gem_vram_helper.c
    :export:
 
+VRAM Buffer Function Reference
+------------------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_vram_helper_common.c
+   :doc: vbuf overview
+
+.. kernel-doc:: include/drm/drm_vram_helper.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/drm_vram_helper_common.c
+   :export:
+
 GEM TTM Helper Functions Reference
 -----------------------------------
 
diff --git a/drivers/gpu/drm/drm_vram_helper_common.c b/drivers/gpu/drm/drm_vram_helper_common.c
index 2000d9b33fd5..ec55fa374edc 100644
--- a/drivers/gpu/drm/drm_vram_helper_common.c
+++ b/drivers/gpu/drm/drm_vram_helper_common.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 
+#include <drm/drm_vram_helper.h>
 #include <linux/module.h>
 
 /**
@@ -8,9 +9,11 @@
  * This library provides &struct drm_gem_vram_object (GEM VRAM), a GEM
  * buffer object that is backed by video RAM. It can be used for
  * framebuffer devices with dedicated memory. The video RAM is managed
- * by &struct drm_vram_mm (VRAM MM).
+ * by &struct drm_vram_mm (VRAM MM). For very simple use cases,
+ * &struct drm_vram_buffer provides management of memory buffers with
+ * static size.
  *
- * With the GEM interface userspace applications create, manage and destroy
+ * With the GEM interface, userspace applications create, manage and destroy
  * graphics buffers, such as an on-screen framebuffer. GEM does not provide
  * an implementation of these interfaces. It's up to the DRM driver to
  * provide an implementation that suits the hardware. If the hardware device
@@ -88,7 +91,259 @@
  * drm_gem_vram_kmap(). It (optionally) maps the buffer into kernel address
  * space and returns the memory address. Use drm_gem_vram_kunmap() to
  * release the mapping.
+ *
+ * Occasionally, it is easier and more efficient to dedicate a memory
+ * buffer to certain functionality and not bother with GEM. One example is
+ * hardware cursor support. Such buffers are typically small or have uncommon
+ * pixel formats, such as a small color palette or a reduced number of bits
+ * per pixel. DRM GEM objects and framebuffers can often not be used directly
+ * with such functionality, as an additional dithering step is required.
+ * Maintaining such buffers with GEM objects can lead to memory fragmentation,
+ * which is a problem for devices with only a small amount of VRAM.
+ *
+ * The data structure &struct drm_vram_buffer and its helpers provide memory
+ * management for these use cases. Each instance of &struct drm_vram_buffer
+ * handles a dedicated area of VRAM. It offers double buffering (or more)
+ * and access to the current front and back buffer.
+ *
+ * For example, assume a hardware cursor with 64 x 64 pixels and 2 bytes per
+ * pixel. Storing this cursor's image requires 8 KiB of VRAM. The VRAM buffer
+ * could manage this memory as shown below.
+ *
+ * .. code-block:: c
+ *
+ *      static const struct drm_vram_buffer_funcs funcs = {
+ *              .update = do_update, // see below
+ *              .set_base = do_set_base, // see below
+ *      };
+ *
+ *      struct drm_vram_buffer vbuf;
+ *
+ *      drm_vram_buffer_init(&vbuf, 0x0ul, 16 * 1024 * 1024, 0, 2,
+ *                           &funcs);
+ *
+ * A call to drm_vram_buffer_init() initializes the VRAM buffer. The
+ * cursor-image buffer is located at VRAM address 0x0. It is 16 KiB in
+ * size to allow for double buffering. The implementation auto-detects the
+ * frame size (i.e., the size of each individual sub-buffer) from the number
+ * of frames, which is 2. Finally there's a structure of call-back functions,
+ * which are explained below. The rest of VRAM memory can be managed with
+ * other memory managers, such as other VRAM buffers or GEM VRAM helpers.
+ *
+ * A call to drm_vram_buffer_cleanup() releases the VRAM buffer.
+ *
+ * .. code-block:: c
+ *
+ *      drm_vram_buffer_cleanup(&vbuf);
+ *
+ * Displaying a VRAM buffer is a two-step process. The first step fills the
+ * current back buffer, the second step swaps buffers and sends the new front
+ * buffer's offset to the display's scanout engine. The first step should be
+ * performed in the cursor plane's &struct drm_plane_helper_funcs.prepare_fb()
+ * callback, the second step should be located in the plane's
+ * &struct drm_plane_helper_funcs.atomic_update() callback.
+ *
+ * .. code-block:: c
+ *
+ *      int prepare_fb(struct drm_plane *plane,
+ *                     struct drm_plane_state *new_state)
+ *      {
+ *              int width = new_state->fb->width;
+ *              int height = new_state->fb->height;
+ *              void *src = ...; // memory buffer of new_state->fb
+ *
+ *              drm_vram_buffer_update(&vbuf, src, width, height);
+ *      }
+ *
+ *      void atomic_update(struct drm_plane *plane,
+ *                         struct drm_plane_state *old_state)
+ *      {
+ *              drm_vram_buffer_swap(&vbuf);
+ *      }
+ *
+ * The call to drm_vram_buffer_update() looks up the next available back
+ * buffer and gives its address to the VRAM buffer's
+ * &struct drm_vram_buffer_funcs.update() callback; together with the other
+ * arguments. After a successful call the back buffer is ready for displaying.
+ * This is done by the call to drm_vram_buffer_swap().
+ *
+ * The implementation of do_update() and do_set_base() looks something like
+ * shown below.
+ *
+ * .. code-block:: c
+ *
+ *      int do_update(struct drm_vram_buffer *vbuf, void *dst, void *src,
+ *                    unsigned int width, unsigned int height)
+ *      {
+ *              unsigned int x, y;
+ *              unsigned int i = 0;
+ *
+ *              for (y = 0; y < height; ++y) {
+ *                      for (x = 0; x < width; ++x, ++i) {
+ *                              dst[i] = convert_to_cursor_format(src[i]);
+ *                      }
+ *              }
+ *              return 0;
+ *      }
+ *
+ *      void do_set_base(struct vram_buffer *vbuf, u64 addr)
+ *      {
+ *              // write addr to device registers and enable HW cursor
+ *      }
+ *
+ * The implementation of do_update() does the format conversion and sets up
+ * the destination buffer (i.e., the VRAM buffer's current back-buffer frame).
+ * The implementation if do_set_base() writes the back buffer's address to
+ * the device and hence makes it the new front buffer.
  */
 
 MODULE_DESCRIPTION("DRM VRAM memory-management helpers");
 MODULE_LICENSE("GPL");
+
+/*
+ * Helpers for dedicated VRAM buffers
+ */
+
+/**
+ * DOC: vbuf overview
+ *
+ * A VRAM buffer manage an area of video memory that has been dedicated
+ * to a specific functionality. Typical use cases are hardware cursors and
+ * sprites.
+ */
+
+/**
+ * drm_vram_buffer_init - Initializes a VRAM buffer
+ * @vbuf:	The VRAM-buffer instance to initialize
+ * @base:	The managed memory's base address
+ * @size:	The managed memory's size in bytes
+ * @frame_size:	The size of each individual sub-buffer
+ * @nframes:	The number of sub buffers
+ * @funcs:	Hardware-specific call-back functions
+ * Returns:	0 on success, or a negative error code otherwise.
+ */
+int drm_vram_buffer_init(struct drm_vram_buffer *vbuf,
+			 resource_size_t base, resource_size_t size,
+			 unsigned int frame_size, unsigned int nframes,
+			 const struct drm_vram_buffer_funcs *funcs)
+{
+	void *mem;
+
+	/* try to auto-detect 0-value arguments */
+	if (!frame_size && !nframes) {
+		frame_size = size;
+		nframes = 1;
+	} else if (!frame_size) {
+		frame_size = size / nframes;
+		if (!frame_size)
+			return -EINVAL;
+	} else if (!nframes) {
+		nframes = size / frame_size;
+		if (!nframes)
+			return -EINVAL;
+	} else if (frame_size * nframes > size) {
+		return -ENOMEM;
+	}
+
+	mem = ioremap(base, size);
+	if (!mem)
+		return -ENOMEM;
+
+	vbuf->funcs = funcs;
+	vbuf->mem_base = base;
+	vbuf->mem_size = size;
+	vbuf->mem = mem;
+	vbuf->frame_size = frame_size;
+	vbuf->nframes = nframes;
+	vbuf->next_index = 0;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_vram_buffer_init);
+
+/**
+ * drm_vram_buffer_cleanup - Releases a VRAM buffer
+ * @vbuf:	The VRAM buffer to release
+ */
+void drm_vram_buffer_cleanup(struct drm_vram_buffer *vbuf)
+{
+	iounmap(vbuf->mem);
+}
+EXPORT_SYMBOL(drm_vram_buffer_cleanup);
+
+/**
+ * drm_vram_buffer_update - Updates the current back buffer
+ * @vbuf:	The VRAM buffer
+ * @src:	The source buffer
+ * @width:	The source buffer's width in pixel
+ * @height:	The source buffer's height in scanlines
+ * Returns:	0 on success, or a negative error code otherwise
+ */
+int drm_vram_buffer_update(struct drm_vram_buffer *vbuf, void *src,
+			   unsigned int width, unsigned int height)
+{
+	unsigned long off;
+	void *dst;
+	int ret;
+
+	if (!vbuf->funcs->update)
+		return 0;
+
+	off = vbuf->frame_size * vbuf->next_index;
+	dst = &vbuf->mem[off];
+
+	ret = vbuf->funcs->update(vbuf, dst, src, width, height);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_vram_buffer_update);
+
+/**
+ * drm_vram_buffer_swap - Replaces the current front buffer wih the back buffer
+ * @vbuf:	The VRAM buffer
+ */
+void drm_vram_buffer_swap(struct drm_vram_buffer *vbuf)
+{
+	if (vbuf->funcs->set_base) {
+		unsigned long off = vbuf->frame_size * vbuf->next_index;
+		u64 addr = vbuf->mem_base + off;
+
+		vbuf->funcs->set_base(vbuf, addr);
+	}
+
+	vbuf->next_index = (vbuf->next_index + 1) % vbuf->nframes;
+}
+EXPORT_SYMBOL(drm_vram_buffer_swap);
+
+/**
+ * drm_vram_buffer_get - Returns the current back buffer
+ * @vbuf:	The VRAM buffer
+ * Returns:	The address of the current back buffer
+ *		in kernel address space
+ */
+void *drm_vram_buffer_get(struct drm_vram_buffer *vbuf)
+{
+	unsigned long off = vbuf->frame_size * vbuf->next_index;
+
+	return &vbuf->mem[off];
+}
+EXPORT_SYMBOL(drm_vram_buffer_get);
+
+/**
+ * drm_vram_buffer_get_current - Returns the current front buffer
+ * @vbuf:	The VRAM buffer
+ * Returns:	The address of the current front buffer
+ *		in kernel address space
+ */
+void *drm_vram_buffer_get_current(struct drm_vram_buffer *vbuf)
+{
+	unsigned int cur_index;
+	unsigned long off;
+
+	cur_index = vbuf->next_index + (vbuf->nframes - 1) % vbuf->nframes;
+	off = vbuf->frame_size * vbuf->next_index;
+	return &vbuf->mem[off];
+}
+EXPORT_SYMBOL(drm_vram_buffer_get_current);
diff --git a/include/drm/drm_vram_helper.h b/include/drm/drm_vram_helper.h
new file mode 100644
index 000000000000..6b5c2381543b
--- /dev/null
+++ b/include/drm/drm_vram_helper.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#ifndef DRM_VRAM_HELPER_H
+#define DRM_VRAM_HELPER_H
+
+#include <linux/types.h>
+
+/*
+ * DRM VRAM dedicated memory
+ */
+
+struct drm_vram_buffer_funcs;
+
+/**
+ * struct drm_vram_buffer - Manages a dedicated area of video RAM
+ * @funcs:	Call-back functions
+ * @mem_base:	The base address of the managed memory
+ * @mem_size:	The size of the managed memory
+ * @mem:	Mapping of the VRAM buffer's memory into kernel address space
+ * @frame_size:	The size of each individual frame
+ * @nframes:	The number of frames
+ * @next_index:	The index of the next frame (i.e., the current back buffer)
+ *
+ * The data structure &struct vram_buffer manages a dedicated area of video
+ * RAM.
+ */
+struct drm_vram_buffer {
+	const struct drm_vram_buffer_funcs *funcs;
+
+	resource_size_t mem_base;
+	resource_size_t mem_size;
+
+	u8 *mem;
+
+	unsigned int frame_size;
+	unsigned int nframes;
+	unsigned int next_index;
+};
+
+/**
+ * struct drm_vram_buffer_funcs - Call-back functions for
+ *                                &struct drm_vram_buffer
+ * @update:	Updates the current back buffer from a source buffer
+ * @set_base:	Sets the current back buffer as the new front buffer
+ *              used by hardware
+ */
+struct drm_vram_buffer_funcs {
+	int (*update)(struct drm_vram_buffer *vbuf, void *dst, void *src,
+		      unsigned int width, unsigned int height);
+	void (*set_base)(struct drm_vram_buffer *vbuf, u64 address);
+};
+
+int drm_vram_buffer_init(struct drm_vram_buffer *vbuf,
+			 resource_size_t base, resource_size_t size,
+			 unsigned int frame_size, unsigned int nframes,
+			 const struct drm_vram_buffer_funcs *funcs);
+void drm_vram_buffer_cleanup(struct drm_vram_buffer *vbuf);
+int drm_vram_buffer_update(struct drm_vram_buffer *vbuf, void *src,
+			   unsigned int width, unsigned int height);
+void drm_vram_buffer_swap(struct drm_vram_buffer *vbuf);
+void *drm_vram_buffer_get(struct drm_vram_buffer *vbuf);
+void *drm_vram_buffer_get_current(struct drm_vram_buffer *vbuf);
+
+#endif
-- 
2.23.0

