Received: from mail-oi1-f201.google.com (mail-oi1-f201.google.com [209.85.167.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8562C32B117
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 04:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781841985; cv=none; b=U+oCRpeDrWbzTFTzVSWZgTubVV9O0uCCyVLgps/Jufp83BN+2PzKsjd6Qmv2A9behXy5D1IsA2e+gsqvRCUBYtHpK0a1JzdrMfuzBzxkrkreypHcNZmvp3VO2JRqP3G9Z2dvQXTrQoAvkB6tFomV6wiC9hF/WshIbD3gRTc0/aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781841985; c=relaxed/simple;
	bh=sVTqAK4Wzh2wMiFpGJDdy/dhah6Alzdol6TjbFPzzzs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Hr/S6tyZkmrBfB76ywQMseNiZAsKW38K241KhIGzjTTf2TEKgtP4y5tCO3JMFwz0TEsXS1yDZbjOd783Hl4Ef+GrGGdObeA8aKJvsX1t1Go4NnM/hXH79z7kZN577EZO/U6JqxznWWuOLvHf4Fr0GMHZDzDt06NCBighBGIdsO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bg/sWZah; arc=none smtp.client-ip=209.85.167.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bg/sWZah"
Received: by mail-oi1-f201.google.com with SMTP id 5614622812f47-486e64c8edeso2251970b6e.2
        for <linux-doc@vger.kernel.org>; Thu, 18 Jun 2026 21:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781841983; x=1782446783; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B986OHYKnyFOmWr4Pq/xx21N23f5ntjT3AU9YAu1Fcg=;
        b=Bg/sWZahSV+hn35IJOuhumE0/Q6X8moo3ojMwy25cumlZEhIfoI4TapSOAy6yFYIkm
         WV1ldgvL9lumDybfgWK9JmA7xfgSMFoff7JplT/Ahpmmd8eIPQ0VE2f702L0Fyhn9NL3
         WS/CqXN+W0PmnvrwSVo1taRfMt0V1redxpxyEDkSLmoA71yjRhK70qlakLN9lhOpaL68
         stWNLvEaI/Ou3/LsQDWL5DAu4efrd2EHLyxysd20nUQ1cR7sCOcKJOT8KrSfxE6cRjPa
         qljPJrFNszOVDRzoahlsUduGBQRCeBvvWLhvaIinaBbDwlZJlavSWUalySNKNEbXuxvn
         OOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781841983; x=1782446783;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B986OHYKnyFOmWr4Pq/xx21N23f5ntjT3AU9YAu1Fcg=;
        b=ARo0MCrYn6yUflZwJznVD7ogWxkM57gpzX8RlsDsrKzV6XqiMv+osZRYFh6rtcFv7k
         CZ2PhvBfS3AeFh/1+xSN4NKPORTke91WROWuDT34L+PXHNrgr27VUvN6JjbT4GXnVEXg
         J/QiMzwVi9hO3iSACNMJzBeUNZQVCt2zZxzzu5UbJVbmbBJhUiAv7lZ+cd4QNRU5B0dX
         pQzxvDevs3IImE+QqbwuAF2b86TkOCeV2rfi05FzYFd/xP0Ccff0Qv1eQEtjRWiaSFKT
         VsDoj5iTzHnAE6W8ShmmpCqEnEsxeNb3WoqIe40RcHryGVfQ01/GVLvsnwBeHMwkGCWu
         WWcw==
X-Forwarded-Encrypted: i=1; AFNElJ+xr4zMTfyNROdrkD3OcV2OwZQKQAI4WvZFB8lDIDuNHb0WwB8arq5zp8sfX4dsQeGDdUsiEJ/Hg+w=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRLMhUvhYzq7+KYECe4mbkzyLjxRvx+E9RDuTYoVR0I68aa6HU
	BcFPm3jsXzlOrVkP00Z0Q1HeX9CDYwkjO+tkGO9ymZKjzao5q/2qfZAbFpAWsh92mHTqUVIYNOP
	XSpPKnMyJJg==
X-Received: from ioai14.prod.google.com ([2002:a05:6602:72ce:b0:96a:6b68:25a8])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:15a5:b0:489:6ad8:404d
 with SMTP id 5614622812f47-489b18d4466mr701378b6e.41.1781841983112; Thu, 18
 Jun 2026 21:06:23 -0700 (PDT)
Date: Fri, 19 Jun 2026 04:06:04 +0000
In-Reply-To: <20260619040609.4010746-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260619040609.4010746-1-nkapron@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619040609.4010746-3-nkapron@google.com>
Subject: [PATCH v2 2/4] usb: gadget: f_fs: Tie read_buffer lifetime to ffs_epfile
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	Felipe Balbi <felipe.balbi@linux.intel.com>, Michal Nazarewicz <mina86@mina86.com>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Currently, ffs_epfile_release unconditionally frees the endpoint's
read_buffer when a file descriptor is closed. If userspace explicitly
opens the endpoint multiple times and closes one, the read_buffer is
destroyed. This can lead to silent data loss if other file descriptors
are still actively reading from the endpoint.

By tying the lifetime of the read_buffer to the ffs_epfile structure itself
(which is destroyed when the functionfs instance is torn down in
ffs_epfiles_destroy), we eliminate the brittle dependency on open/release
calls while correctly matching the conceptual lifetime of unread data on
the hardware endpoint.

Fixes: 9353afbbfa7b ("usb: gadget: f_fs: buffer data from =E2=80=98oversize=
d=E2=80=99 OUT requests")
Cc: stable@vger.kernel.org
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/functi=
on/f_fs.c
index 38e36faefe92..374ab36eaaa3 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1374,7 +1374,6 @@ ffs_epfile_release(struct inode *inode, struct file *=
file)
=20
 	mutex_unlock(&epfile->dmabufs_mutex);
=20
-	__ffs_epfile_read_buffer_free(epfile);
 	ffs_data_closed(epfile->ffs);
=20
 	return 0;
@@ -2390,6 +2389,7 @@ static void ffs_epfiles_destroy(struct super_block *s=
b,
=20
 	for (; count; --count, ++epfile) {
 		BUG_ON(mutex_is_locked(&epfile->mutex));
+		__ffs_epfile_read_buffer_free(epfile);
 		simple_remove_by_name(root, epfile->name, clear_one);
 	}
=20
--=20
2.54.0.1136.gdb2ca164c4-goog

