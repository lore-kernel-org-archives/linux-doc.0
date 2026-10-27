Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109235;
	b=VIo7v32j0bRfmCc9nGZvMT0ZpJaVbSPOX5+o/s4nL9sIBY35hW5Pv6R8JB/74y/rTsej
	 DtiT5gku3SOuhK0da+RIo4cU0ho/v+GyUCEtzGuoiyyJPv047saj7RhlYVQCEhWbR7snA
	 IxtZX8J1ATKrjUnq9igFTQELQ6jc+7uZxkXH1UmM5fMwCbz5g0B6Q8prkEcjgL0xONN3J
	 N5hEnou2OGwAnLUKMCF+AX/G6Fmf4HvUZL5qySrRq0djLctlYcYMqPjGiIDE+AhvWww3Q
	 kbSg0KCjQZV+wSOEIQBBobCM8AI5aI3fEWTOxQi16osJdjUcPsRhIibm7d4sH0i+8WA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109235;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=HFwDNLv3n+wl+JreLzg2KvEaj4Ho3mAm9pShsdfkSdI=;
	b=bOjYe4o4t+JNf1aLPy8mc4Pb+dvTj/EOwyUnni7yXJR1sauQQNOI7/6IqGtnEENHaZyo
	 KIePcVqwplSgYN2MqSFZ/lCrzJvEN7oDEj9BHDsFbYsrU65OuX2rXYo+KM077HryKgRXI
	 oE5y3sm+hmHNX4hINSG2K3dVS/zOuGYXIe2esEpxsQ+qYfN++JoHY8AwAH7a6u3ZnO0EK
	 Om1TlpVfmCRyQuBO1P/qU48yKoKAql8y8rRdhqhSmNNomZ1aOKEZ5VHwcLe/IN9bb3z7E
	 JGRnFa0xYZ34Ft0uMLNSJiLfVjFM1HCPZTHpSM/nQE19kaXWxdLjsKMjk4iesudIZxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Axq6+pnr;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE768606A332
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE768606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Axq6+pnr
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso2712092f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109233; x=1793714033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HFwDNLv3n+wl+JreLzg2KvEaj4Ho3mAm9pShsdfkSdI=;
        b=Axq6+pnr1Vtgqr4v69LLt3RaAq7k1IMQ7FhaSOZzz89a6lHBeFOr77M3j91ygjKvDH
         vW1kEPOwTfJv6/v6coa3mh6BRTlsIYo4Qq7xRSyeEeUmSEO+GVswzV/hYPn+7FVDs9wV
         75jFsCMep9vJ95+PGlhl/75UmcGwA8kotHZEseurbYCEdN5S5yOonMuxsR5mS5odrdsj
         9eo039drmgS50WpZbllG3q+FX9oC8RtwhQgJmGnX/tXeOOsp7gaEs7C3uUyuNwAMbmGN
         BoDUegWv6aUwvVjscZXEFPhs3604EOOAYkN1fypwmG0rnidrhWGwFb+WpMSdhA+JE/A5
         c4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109233; x=1793714033;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HFwDNLv3n+wl+JreLzg2KvEaj4Ho3mAm9pShsdfkSdI=;
        b=pQ+BYmbQpO+T8dLUz1a0mTFXwsoHGodaSYMMg7GWU5USUCjpd3Y9YohYEqueOK5lGq
         EnuDjjDeGjeIUFBESTWf4bXI/aHnI8hMP1/h6OOlnU/qLiSN4wCJk0pnHswlC/pcFQsq
         GsQpKaVuUogmGR/wkNW/qzTK+D/HyDLYXnPgKtM5wrNMahuBqP4SV6yoMew6yqOA9mzQ
         Zpos2b5OOcstYOYHp1EItVfTRIyLmk5H6vLCUg/eikRNHqoF2bo4u4Rse6F4u9NO25tY
         W3FpA2TGVxcBehp19BUOvfigSi/8FN30E3LQCiha70Aa4WLNQKzjI+gzR3AjFyuXEv0a
         HyPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXkOefSdiA/E2e2/MF4Xfe9GkbVeGj86OpDUICGI478sRQZtYhW4xJMTBdQYJntfJkAXbkobYzZuI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaIIjrfDyY+2thoCQB+8ZkBPuxHdYy3bVE1ikDbJJW6rHFZL+x
	7f7D9tLk6mwjZXgJXr7f9zUCw81YKi/V8FvGDDeh7kZ/KE7P/9S46oyS
X-Gm-Gg: AYBFou2QOyYyAcWKLGAWQIHePDR6oWagtZQw6tFwLvhNIlH5LeWPMpgaQyz2srVsiLW
	PaXKXfczQGtfVImKoA67RkQ1hPhjDj9mrBYaz4KDeLgVKobNyLUj3/0JRs0p+ZjWd+88DA5dFUZ
	ousOfNy6UoGrWPuxvXlxQcDNHoMHPW38xBFpFKOenWfax4YsjK1S3qKpUkvCggsM4L930V+6gZL
	4Ece+ebdmFuQsq0HJk3M21QEN0ZdajvtNcnSX/iSEniqb2Iu6BaUUBuN1VK4tZHaqfoxhlk2oLw
	+ZMwvbIKTzzyoY4HkBe0tPUSYI0t0S8Ko1yTn02dUN0AQ2fvU8AxBIw3WTKOPcz+Q/HFAr2Ie4N
	PhBLLrlWZABEEt/Pu4ZBmMM1vH5/v+kGUXmB9do+lA+QJNahBhVyQLp0qJTbFqSoNV/KS9O3oqW
	ApZ5vh1FfWnyfgkuGkmtWzR1ZR/4MD2KeUOb0cjKjcO2aoWCLdkMZXMq76vLfxDpZmj44J7KBrs
	4F1UdFGOUFXeoDOWZIqybHAiOMTNSoQ42jXOQi1ySOhV/PTt7VNPEMRsioSTpc9UZQA64/AEZ5g
	Ffp3ltA=
X-Received: by 2002:a5d:6f08:0:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e3eba1207mr20313170f8f.51.1793109232976;
        Tue, 27 Oct 2026 06:53:52 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:53:51 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 03/15] fbdev: efifb: move the BMP headers to <video/bmp.h>
Date: Tue, 27 Oct 2026 14:53:30 +0100
Message-Id: <20261027135342.2003632-4-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The DRM splash client parses the same BMP headers as efifb. Rather than
keep a second copy of the structures, move them to include/video/bmp.h
with the magic number.

BMP is little endian whatever the CPU, so the header gives the fields
as __le16 and __le32, and efifb now reads them with
get_unaligned_le16() and get_unaligned_le32(). Width and height are
read signed, as the format has them. No change on the little endian
systems EFI runs on.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---

Notes:
    TODO for the efifb maintainers, not changed here so that this patch
    only moves the headers: the bound check
    
    	if ((bitmap_offset + bmp_pitch * bmp_height) > bgrt_image_size)
    
    is done in u32 and can wrap with a crafted BGRT image, for instance
    with a bitmap_offset close to 4 GiB, and so can round_up(3 * bmp_width,
    4) and the product with a huge width; image_offset_x + bmp_width against
    lfb_width is a u32 sum too. efifb_copy_bmp() would then read outside the
    mapped image. The DRM splash client checks the same headers with
    check_add_overflow() and check_mul_overflow(). I can send a separate fix
    if wanted.

 drivers/video/fbdev/efifb.c | 49 ++++++++++++++-----------------------
 include/video/bmp.h         | 40 ++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+), 31 deletions(-)
 create mode 100644 include/video/bmp.h

diff --git a/drivers/video/fbdev/efifb.c b/drivers/video/fbdev/efifb.c
index 3411be06d3e6..fd348a72f780 100644
--- a/drivers/video/fbdev/efifb.c
+++ b/drivers/video/fbdev/efifb.c
@@ -16,32 +16,13 @@
 #include <linux/platform_device.h>
 #include <linux/printk.h>
 #include <linux/sysfb.h>
+#include <linux/unaligned.h>
+#include <video/bmp.h>
 #include <video/vga.h>
 #include <asm/efi.h>
 #include <drm/drm_connector.h>  /* For DRM_MODE_PANEL_ORIENTATION_* */
 #include <drm/drm_panel_quirks.h> /* For drm_get_panel_orientation_quirk */
 
-struct bmp_file_header {
-	u16 id;
-	u32 file_size;
-	u32 reserved;
-	u32 bitmap_offset;
-} __packed;
-
-struct bmp_dib_header {
-	u32 dib_header_size;
-	s32 width;
-	s32 height;
-	u16 planes;
-	u16 bpp;
-	u32 compression;
-	u32 bitmap_size;
-	u32 horz_resolution;
-	u32 vert_resolution;
-	u32 colors_used;
-	u32 colors_important;
-} __packed;
-
 static bool use_bgrt = true;
 static bool request_mem_succeeded = false;
 static u64 mem_flags = EFI_MEMORY_WC | EFI_MEMORY_UC;
@@ -145,9 +126,10 @@ static bool efifb_bgrt_sanity_check(const struct screen_info *si, u32 bmp_width)
 
 static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_info *si)
 {
-	u32 bmp_width, bmp_height, bmp_pitch, dst_x, y, src_y;
+	u32 bmp_width, bmp_height, bmp_pitch, bitmap_offset, dst_x, y, src_y;
 	struct bmp_file_header *file_header;
 	struct bmp_dib_header *dib_header;
+	s32 width, height;
 	void *bgrt_image = NULL;
 	u8 *dst = info->screen_base;
 
@@ -186,20 +168,25 @@ static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_i
 		goto error;
 
 	file_header = bgrt_image;
-	if (file_header->id != 0x4d42 || file_header->reserved != 0)
+	if (get_unaligned_le16(&file_header->id) != BMP_FILE_MAGIC_ID ||
+	    get_unaligned_le32(&file_header->reserved) != 0)
 		goto error;
+	bitmap_offset = get_unaligned_le32(&file_header->bitmap_offset);
 
 	dib_header = bgrt_image + sizeof(*file_header);
-	if (dib_header->dib_header_size != 40 || dib_header->width < 0 ||
-	    dib_header->planes != 1 || dib_header->bpp != 24 ||
-	    dib_header->compression != 0)
+	width = get_unaligned_le32(&dib_header->width);
+	height = get_unaligned_le32(&dib_header->height);
+	if (get_unaligned_le32(&dib_header->dib_header_size) != 40 ||
+	    width < 0 || get_unaligned_le16(&dib_header->planes) != 1 ||
+	    get_unaligned_le16(&dib_header->bpp) != 24 ||
+	    get_unaligned_le32(&dib_header->compression) != 0)
 		goto error;
 
-	bmp_width = dib_header->width;
-	bmp_height = abs(dib_header->height);
+	bmp_width = width;
+	bmp_height = abs(height);
 	bmp_pitch = round_up(3 * bmp_width, 4);
 
-	if ((file_header->bitmap_offset + bmp_pitch * bmp_height) >
+	if ((bitmap_offset + bmp_pitch * bmp_height) >
 				bgrt_image_size)
 		goto error;
 
@@ -222,12 +209,12 @@ static void efifb_show_boot_graphics(struct fb_info *info, const struct screen_i
 
 		src_y = y - bgrt_tab.image_offset_y;
 		/* Positive header height means upside down row order */
-		if (dib_header->height > 0)
+		if (height > 0)
 			src_y = (bmp_height - 1) - src_y;
 
 		memset(dst, 0, bgrt_tab.image_offset_x * 4);
 		dst_x = bgrt_tab.image_offset_x;
-		efifb_copy_bmp(bgrt_image + file_header->bitmap_offset +
+		efifb_copy_bmp(bgrt_image + bitmap_offset +
 					    src_y * bmp_pitch,
 			       (u32 *)dst + dst_x, bmp_width, si);
 		dst_x += bmp_width;
diff --git a/include/video/bmp.h b/include/video/bmp.h
new file mode 100644
index 000000000000..8aa249f2302f
--- /dev/null
+++ b/include/video/bmp.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _VIDEO_BMP_H
+#define _VIDEO_BMP_H
+
+#include <linux/types.h>
+
+/* "BM", the first two bytes of a BMP file */
+#define BMP_FILE_MAGIC_ID 0x4d42
+
+/*
+ * The headers at the start of a BMP file. Every field is little endian,
+ * whatever the CPU, and the headers need not be aligned in memory: read them
+ * with get_unaligned_le16() and get_unaligned_le32().
+ */
+struct bmp_file_header {
+	__le16 id;
+	__le32 file_size;
+	__le32 reserved;
+	__le32 bitmap_offset;
+} __packed;
+
+/*
+ * BITMAPINFOHEADER. Width and height are signed: a negative width means
+ * nothing, and a negative height that the rows go top to bottom.
+ */
+struct bmp_dib_header {
+	__le32 dib_header_size;
+	__le32 width;
+	__le32 height;
+	__le16 planes;
+	__le16 bpp;
+	__le32 compression;
+	__le32 bitmap_size;
+	__le32 horz_resolution;
+	__le32 vert_resolution;
+	__le32 colors_used;
+	__le32 colors_important;
+} __packed;
+
+#endif /* _VIDEO_BMP_H */
-- 
2.39.5

