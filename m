Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608041;
	b=eDhO7kq8cd81KPiph176s8deesmmG6Sjns6YxT+6ZHJj5vxCr/a9QKBoDwGGuil85g4u
	 18sb52gq/sWxAhs368UVkg0zOvbG8bgFM5mF72yUVI6/gC5rB7cO6F8OWZtdE9ae14y8n
	 oYZLVhE9+z8gIPQBZnQaILExB0I0M04WFr/kc6ZNkm2qhLUMTyeGkGKP/SxtiG3jakWsJ
	 7KoEHBoVqG7oHYfeRQ9TCrSiStpx9uEPiTBzT78J1ww0PLH4qAdS/2UX9NSi56GtsaFCN
	 AQ1whHX/8i4KOtaXnLciHpFIhiI5NuKoQwjw2z4kpLDA+20XdsOIqFt/LKrPaC02gZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608041;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
	b=bDrBBqNBDpQTW23MM0d6mpGf2XeI79cB3WER+vIRv41STWMj0wEg7/9YO5Ky5Agc9Orb
	 T44VMbz38ZIhUzKf4ZINhoEtzGzhp8TWGpTvh6DCTyB94KKkq39g5NiY6ZxTzp+OoIn11
	 6gVRWqo1IFgT8Y3SWUx/tWGsC//ozVgRvzCAYwAyXHi06YXf2OZDXNJFIp9UjidANWEC8
	 4BJKJIiraO0zSVk7CMdJFfU9wFQ9hiCknM2wpZ0+vIDHNv696kU39HuQbpYEFSBrrc5X1
	 63obSN++gJA0VpLDLUqE8oS1wLwr2b+A/j/hCKXVrHcD3i2Do4VuCJEm8dRTLtM0MPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gp3+oZfi;
	arc=none smtp.remote-ip=74.125.82.69
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ED6606A893
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:14:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18ED6606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Gp3+oZfi
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so1234610c88.1
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608040; x=1795212840; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
        b=Gp3+oZfipAwpCv6RQBf3lDsHT0qEp1qD0xIU57NwQdPHacBufI3y/HY7/OzAFWbLjK
         COC86LQPt+kgTBoKHOH3z6liqUMbnRcvtWkBB8WIqiXDeiT4yGTVjFMACF1ENKsDRbjx
         C3I0ki9/tkmtjMMKA7wp0aKqDyg0qSYa2CbrM2wVKFsFljYWzj+9s9c16NYqeljycZwO
         iVGH7QDXUWto3Mg/o5+eK2TJvkhs9meOk57rJhHmcN6kCEqi48DpXJcEWMzNJ5yGHuUx
         jDmPg41tRHpFxTCOlMTfPNin1c89BrbkTIVqWmod8KAvcs1ZMcaLvN+715sxpWXF+n3Q
         1aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608040; x=1795212840;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EfW5r72ztIVpTPsFjdHYnm3oK6ZY2qO8ZM5ubM8gZAk=;
        b=cLpMizYNlbElxd8qRg735D8hA5Q45Aq1W1i/A7HmJb5ChkrV5ykwZrpD0q86c2GnOr
         lzv8DZxHA2yzvsHJuW34sxIQ5YnJidSSnKKYY6DG+KKl6gS/5qy9dvUerG06qyhFU8Xv
         pbfwseItnJjIBTXCtwz3DIpF5bJovBAISw05FjMbHkoOi5ELtQHofqyRCGhWO4ygjg95
         rQQ6nyzTgtGPwgqfk7BSmmBNbcBqI2FetXSNN10q/wWzN6nsUDtNghB9+hRCEyyng8G1
         U0RIM3y6qxgsh/VUZUCsBt1NxxZofszQHtoMfWRSsk70sT1N5yLIRvsKAnCnHzvyjdZT
         v//w==
X-Forwarded-Encrypted: i=1; AL+hErECtiwgEtoqDVIoahlOlE6LCYVDekTjWKBt7cE1DdO9h5jQCFR8t7hOYOvXDR9GW0rDjF+4J8W3FQw=@vger.kernel.org
X-Gm-Message-State: APuU4Z91nrNqRPwO7OGcYMrIzCFDvOr2Gf/izM1c5HGH2cx7lJMoUr3v
	ae3Y2zdOCKMFycW7ohgJD7bfsLw6kdow+iGch5LNrW/aWCjIp1U0xv9kj0loX95inqlqJV+2kCy
	GFpQ2fm8dBmfloQ==
X-Received: from dltt2.prod.google.com ([2002:a05:701a:c962:b0:1b2:3bcd:9068])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:b88c:b0:1b5:58e:b547 with SMTP id a92af1059eb24-1b5058eb73fmr2722892c88.22.1794608039776;
 Fri, 13 Nov 2026 14:13:59 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:46 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-12-wusamuel@google.com>
Subject: [PATCH bpf-next v3 1/9] Documentation: ioctl-number: Add
 PROCFS_IOCTL_MAGIC range 0x10-0x11
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

PAGEMAP_SCAN (0x10) and PROCMAP_QUERY (0x11) use PROCFS_IOCTL_MAGIC.
ext4 uses the same numbers on other files, so mark the row as a
conflict.

Suggested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index dbe462040999..fbc3537fc9ee 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -248,6 +248,7 @@ Code  Seq#    Include File                                             Comments
 'f'   00-0F  fs/ext4/ext4.h                                            conflict!
 'f'   00-0F  linux/fs.h                                                conflict!
 'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
+'f'   10-11  linux/fs.h                                                conflict! procfs ioctls (PROCFS_IOCTL_MAGIC)
 'f'   13-27  linux/fscrypt.h
 'f'   81-8F  linux/fsverity.h
 'g'   00-0F  linux/usb/gadgetfs.h
-- 
2.56.0.679.gc527c65306-goog

