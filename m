Received: from mail-ot1-f74.google.com (mail-ot1-f74.google.com [209.85.210.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B28B3C4577
	for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781460627; cv=none; b=GChTwfPlgd1G7VoeyHmHRklIeAJ07jEXd9wnsFcx13M7TtJcgdXUNH0qOONmgUdlaXcUoqHpTO+gJtp2pRi4tIfzbaXWyq1G/1rZm3sgVTRJOg61qBFrbKXTeBsM1JzrziRH/csVZzPJks/ThH9P9AmdqycEQANcuQnR23peCNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781460627; c=relaxed/simple;
	bh=pnClWQJviYBoH6cDuU8ZJcbNjWlEzhzBwOJ9/hro1Ts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=qlnKuTFa3xATIXaR3Y6lSzlXrySKy4XdThv4EEyRb8b4LWl2ml6lIjA9rMEQr5/CnW6S2pAIKXSdkHRWqEQDs49yRdnchBYX43sjHUuauHW8wY/jgz5y4z36NfRmqo3IR617Xt1r5Ke23BSmgefRt2NetKU7dx89LRhf8mTntYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L5A3SBka; arc=none smtp.client-ip=209.85.210.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nkapron.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L5A3SBka"
Received: by mail-ot1-f74.google.com with SMTP id 46e09a7af769-7e6d439842bso4161491a34.0
        for <linux-doc@vger.kernel.org>; Sun, 14 Jun 2026 11:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781460625; x=1782065425; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oMUdnPs/sqoh4R9nqzrtto2wV/exDGc4nKPsPCCrzww=;
        b=L5A3SBka1+UA8vXII8aCYqj/02fju5Cfv4yGjTV8wJgiWEmmNfs576b8fHsj9KzcLr
         V6N1AK3bHsbW2OEk99oJSDi9vY/CCpMJucg7eBQN4HiyQ39uwuOjX+HvGrLEV59izVzl
         F71iTkhH/rZLWIGykjS8Sp2bjc+Pl/hSG3DQQnWv3qEHnx842fJo693mCzvNWX7UZLb3
         p/NP2lAzxt5pyv2pChl8Po7lztHceUaWNalvW0zLt8RefcN9CXdXqMUwolNUULnLpQdG
         qECvFwmWibwOApnUGU+apF/XyPwFzpa+bxg3pyW4V8Yg8tTir9j7op518tcaJegcWzLg
         geQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781460625; x=1782065425;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oMUdnPs/sqoh4R9nqzrtto2wV/exDGc4nKPsPCCrzww=;
        b=MH1aUsIPfTBqueNJMzSnygtELkp8fq3XVC8BGuEn0QGcTaCWdt6Vd0u5l1OiIBnrP3
         tpLZs3fYTcw4BZ/NdY5nQFBmiEBA6H6Wx5XNOihEIKDMms0IFEm2ZeUiN5sJzZOzOl/v
         K/chM5P8BTMD3EaW07vX5FJWdSqu/JVHeJELhCES3GWRKtYG61H3QbIINLp98LgBswXK
         DUxA/iaWaWBa59EuE/V8GMfhl/PxH0XZLAT47fp/S+oSkKj4DkBLHMFwhzKG9Vyj2U7A
         r48soR7mzlTy+DJTz/MWnnRrxPlg0KrN2w+9GsZ+AT0xnI+V9FNtmIDgMuhGS1PPBErg
         Xx1w==
X-Forwarded-Encrypted: i=1; AFNElJ99WJjSImjZJ+fqQNFjLDl71uXgiphugbdXdJ+ug22qzBPHOkztU3iwolyQagF10Yb38Ztpr7SDcig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbX5MX5fYe5Q8cxrV8ugbrCnLXyk3qyOfhyuH7Bczowgl//gg6
	3lNY6YcJTTLAYMXFdjTZzvqKnntSpcvn26EV/81bReQNGFH5VQKsmRCPa6RDlVt77RL34bJWLI8
	O2VSSDB0Wtg==
X-Received: from jabgn2.prod.google.com ([2002:a05:6638:2c02:b0:5e2:99fa:da7f])
 (user=nkapron job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6808:3508:b0:482:65b4:4fd6
 with SMTP id 5614622812f47-4872f4a087fmr7182175b6e.20.1781460624816; Sun, 14
 Jun 2026 11:10:24 -0700 (PDT)
Date: Sun, 14 Jun 2026 18:10:00 +0000
In-Reply-To: <20260614181006.3648010-1-nkapron@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260614181006.3648010-1-nkapron@google.com>
X-Mailer: git-send-email 2.54.0.1136.gdb2ca164c4-goog
Message-ID: <20260614181006.3648010-2-nkapron@google.com>
Subject: [PATCH 1/3] usb: gadget: f_fs: Initialize epfile->in early to fix
 endpoint direction checks
From: Neill Kapron <nkapron@google.com>
To: gregkh@linuxfoundation.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	Paul Cercueil <paul@crapouillou.net>, 
	"=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-usb@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Neill Kapron <nkapron@google.com>
Content-Type: text/plain; charset="UTF-8"

When parsing endpoint descriptors, ffs_data_got_descs() generates the
eps_addrmap which contains the endpoint direction. However, epfile->in
was previously only populated in ffs_func_eps_enable() which executes
upon USB host connection. As a result, early userspace ioctls like
FUNCTIONFS_DMABUF_ATTACH that run before the host connects would see
epfile->in as 0, leading to incorrect DMA directions.

By moving the initialization to ffs_epfiles_create(), epfile->in is
accurate before userspace opens the endpoint files.

Fixes: 7b07a2a7ca02 ("usb: gadget: functionfs: Add DMABUF import interface")
Assisted-by: Antigravity:gemini-3.1-pro
Signed-off-by: Neill Kapron <nkapron@google.com>
---
 drivers/usb/gadget/function/f_fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 75912ce6ab55..38e36faefe92 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2364,6 +2364,7 @@ static int ffs_epfiles_create(struct ffs_data *ffs)
 			sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
 		else
 			sprintf(epfile->name, "ep%u", i);
+		epfile->in = (ffs->eps_addrmap[i] & USB_ENDPOINT_DIR_MASK) ? 1 : 0;
 		err = ffs_sb_create_file(ffs->sb, epfile->name,
 					 epfile, &ffs_epfile_operations);
 		if (err) {
@@ -2453,7 +2454,6 @@ static int ffs_func_eps_enable(struct ffs_function *func)
 		ret = usb_ep_enable(ep->ep);
 		if (!ret) {
 			epfile->ep = ep;
-			epfile->in = usb_endpoint_dir_in(ep->ep->desc);
 			epfile->isoc = usb_endpoint_xfer_isoc(ep->ep->desc);
 		} else {
 			break;
-- 
2.54.0.1136.gdb2ca164c4-goog

