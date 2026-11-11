Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794355605;
	b=EZJcXshFS1H/FH1cYtaopg/RPPsSiyAh4Y0yJd3ZSSLtW9Lm8zThzR9KgTvvIbcWlhmr
	 MekgbFnzZByJ9N/E/DNGb0E0VHOsRe9TwbHR67zUYrs6ljU//WFq1Qjx5ipzDQ0158Dmy
	 b4kaGjkFpMJffiEt8y4rZqLSBYksYT671DWX5056elTpCNnlbwR1nCpMuE2C/YPmDXs0u
	 p57BfOuRObSwleSL2LRPP2v+pLHDJdG5+EPaBiV/DOfSYBAed9dR6w7fPo1aQ5PvJyHLq
	 3SxhRkzB0HMGHjXsZhOlXGe4TZQdCkjsvIyELpC210yV4A4IXwUTkfOYi4jGEuxkDgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794355605;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
	b=t4c+ssz0ZctH0JhupixiMa2Js3M8q/M8TfdTKiVHITaAbPCt2MqXENEeyuindc8nluLl
	 AkOycmv3OrF7pT7FCOcRh9R4UjZVXPsc6dA/3rdQdbeWYU1fHfEuHbmblY+4cC9bJEfWk
	 yaJzl4IRosHAB8suc9kuvZd8iUje3uQBAEmSMyjzF/+5B+XQ1EXLFEAKQo8JFluJLJNHE
	 MQy+rR057A1alpdy872HQy61IHJG1OzX5HrN5/iPmEpaTbp7nWsuH7FKV29JYicLs5cGc
	 rSYaA+JrrxWMpfHEbTeHviTrm7u7IE/xjdpQclNkSvhVeCaY6wJsCc0f2XwIA810B7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCED60A263A
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 00:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCED60A263A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l8W675bL
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3acb11973c3so2139779a91.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 16:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794355605; x=1794960405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=l8W675bLrsWjbpK2F3mrBFkG6K78C5ZAp2zxEV7PhWqS5rklWYa6R2AmU4AdBIj8Ft
         X7ZcJs80TDEQ4mdX4B/U5hTNWCtcsta+46BIhrQcfjdtcLhzuWDq+Ny58zpvZqv9O6Vg
         4dkCaqOnILNMn3hH/Imle3E99TOodgLFhuBCghJJoYMzMhixDe4bgbgTy15509g6A8xf
         Beujegev4eaFnh0lhDbJAGbJsodFeoPoORy9FvVVWP0clh5ZYEz+Xb5LHaDfkjSV73IJ
         0m9UPchgMnPHpI1Q17NmJgU7/QC0d9Ry7sz9dyQjtVHy8TEPrP+azTjjc86Q2fSYAmh9
         eOXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794355605; x=1794960405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QVooZCmJPrWWhT96Ks8ytGn0KExMeex3eOhOngE0EKo=;
        b=fGVybeIvCg/ECScOPZxo9yjtHAfydApTnG7upO18o90P+xq1yXDN6CbHj3hBEHlrWt
         3ztCuaMmfxYRmdtXLcx5MFFXm0uboi6FWqiAXKpyFK1AyGPBbckxj9P75iXaLE8QXuwd
         4mUsLSYFoT7qtyx60mvQs6/Nr239iGSylRjVGWY5wfci6dSpZMNo4a90PTQCTXp2tej3
         7rXv/O8PLaMS4lafyNDqSh5w1f3F2tXFwfqEcvzO+kCHJfq7yBgxNmDi06OMIgXVrSOZ
         9Dn5X3nzSvP6SkJereyPckhAucopTJKIQuRfCY5OmjvKfEjGBKsryAQr7ZeiJhLBP/7B
         3muQ==
X-Forwarded-Encrypted: i=1; AL+hErEZxnm0ty1JnDdsUydYeAVanHfh7hsv14lW8gkFC8qJT43UpAC5XkqN4XyLel6MI9wZVFepjKAWrkU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5QtdXwJrFyLKC9teyAYt/WNkJfS1nUawFOJK9B7fFz6SiGWsv
	BAwkUAK0PFuKh1GQnKVICoyh9ofWlVNCQxWGe1uSlOZxvPhlK1Gb1LN0
X-Gm-Gg: AYBFou3hxZ2IMGarNe+//cRa7D3XiIclFBEuic5fBdemJhDo+nsKl8iUjj/jlSEef35
	sSJl+pOQQGVVXyJzmvOIfvR39ndtvqXwrUFazp0TD6Bf3E45Zc9DdEz64CHnC5d/QM+5I/eSNNp
	Qoz3LyPgwx9NSDoRrwzXQ7hq/mbnKdLf+8QFXLynB6Sjevb4JBabXqzO8+ZbKOG74zlUiUztees
	fov2w10SqnI5TspOyZsuNoiV815B2ObyKBxx2DEdZ5aPtN6DJHMpvC5KXT5sD0WMei0OFLCWRgD
	fe++jTTx/LZppaCbn3HorvTAxR9iFk2NeUfnHWP4LJum6XlupvK9J2U/TJb6CVGBTvZEig/8S6b
	URD4Gixq6i079cYJ+4eRJgdhmDJa+YWj1Tf3YlGGMCJfcMe/Sf14cMO1nJz07qF9iGHLMhrvkHW
	QgixZdFQpQTLpb/HUL5TPfdpwpvNwC7G0BYeMzCGb8dYq80luswH5lZru+kdZaOhZ6x3bF12H7v
	tpsaWRDMmlF77my/GrX+RQi5us3Or2rmfay0HWSuTeNU0DLneTSgaO5jJtiohwkSePspCdxqVSq
	GTlE1m5Hbydw+luLjAB2hFB4vMhgFixVwKvk7t1lQybqS4DQaGCtQHLZtRNfZnTOGv+vzrWRcdC
	23aJ3WKLCiwQhjlCLDW9B+xN+hMTJxXrw8ZEeddKn6/xTyM0=
X-Received: by 2002:a17:90b:224e:b0:3a4:f75d:d194 with SMTP id 98e67ed59e1d1-3b182ec22a1mr635276a91.36.1794355604794;
        Tue, 10 Nov 2026 16:06:44 -0800 (PST)
Received: from localhost.localdomain ([183.96.175.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm474361a91.4.2026.11.10.16.06.39
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 16:06:43 -0800 (PST)
From: Joonho Lee <mynameisjune111@gmail.com>
To: linux-sound@vger.kernel.org
Cc: tiwai@suse.com,
	perex@perex.cz,
	anton.yakovlev@opensynergy.com,
	mst@redhat.com,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	linux-doc@vger.kernel.org,
	Joonho Lee <mynameisjune111@gmail.com>
Subject: [PATCH v24 14/16] docs: describe virtio-sound capture options
Date: Wed, 11 Nov 2026 09:05:41 +0900
Message-ID: <20261111000543.28550-15-mynameisjune111@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111000543.28550-1-mynameisjune111@gmail.com>
References: <20261111000543.28550-1-mynameisjune111@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the request-owned default capture path, its temporary memory
and copy cost, and the two remaining default-off compatibility
parameters. Remove the earlier opt-in staging and short/empty-response
descriptions.

Assisted-by: LLM
Signed-off-by: Joonho Lee <mynameisjune111@gmail.com>

---
Documentation/admin-guide/kernel-parameters.txt |   23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8344,6 +8344,29 @@
 
 			Can be used multiple times for multiple devices.
 
+	virtio_snd.capture_packed_status= [HW,ALSA]
+			Read an explicitly enabled packed status trailer after
+			the returned capture data. The fixed status scatterlist is
+			used by default.
+			Format: <bool>
+			Default: false.
+
+	virtio_snd.capture_pause_restart= [HW,ALSA]
+			Stop and release the stream when pausing capture. On
+			resume, send SET_PARAMS, PREPARE, and START. With this
+			option disabled, pause uses STOP and START while retaining
+			the prepared stream.
+			Format: <bool>
+			Default: false.
+
+			Capture always receives into request-owned buffers, then
+			appends validated, frame-aligned audio to the ALSA ring in
+			request order. A valid short response is retained. Empty
+			responses are tolerated only during bounded startup or for
+			requests already in flight at STOP or PAUSE. This uses up
+			to one PCM buffer of temporary memory and copies returned
+			audio into the ALSA ring.
+
 	vga=		[BOOT,X86-32] Select a particular video mode
 			See Documentation/arch/x86/boot.rst and
 			Documentation/admin-guide/svga.rst.
