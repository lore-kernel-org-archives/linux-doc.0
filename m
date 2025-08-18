Received: from mail-io1-f74.google.com (mail-io1-f74.google.com [209.85.166.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0074132253F
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 14:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527346; cv=none; b=n/OrHEKG3Tz8P6mY86D3T9bZuYSnPpRLBCak8ikDgiUle1FFKzNkHlgxL7dYw4KHxfJC53TbBOfBrGArOv8SbcHQ5CObFPk+Hvfd0dfOKt1h2CfxDRig+PQockQKzuKLwomXYqz/pZXvrKWlySxlvJPBaFn0LFmSxO6cavAgDUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527346; c=relaxed/simple;
	bh=x/oEAdvTY89TEEY1xHYiXUYgEnx1TSPHrLh5CPsg2H0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HR5awaTAJUQUP+km9W9e7OpXidQXcHMUFjm6k+wBYceozTi7IC3YyBFeB1fuUj1RnOYsY1ef9i+fBUynRBNOTX0f3F0Sf4JmFl5jMrPrhvOW7XoRE5uxDhbw6KsruF3LxIpjtpVpnRwA3K2dvfaW9TNj2pRbgUbiG+3iN4NuOio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dna2+mSN; arc=none smtp.client-ip=209.85.166.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jdenose.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dna2+mSN"
Received: by mail-io1-f74.google.com with SMTP id ca18e2360f4ac-88432cccc80so424776939f.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 07:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755527344; x=1756132144; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3z0lOGnoy2DTiFRtSQ834KWO6kfpYDPrVEHJnQZTKok=;
        b=Dna2+mSNhgWoIoabV72mea5G+en/4hp4KwWb5A/F6j3jTpeTxOBB+UkVX/VupT+Sqm
         IirdhzormGDNtuuuJxpuymvlc8GczjZgkMTwIRsGRamI8Rxktg4+6M8wc4kWemAOaHSO
         tf4Wn3dutHnUhIpUqFDYRjJFhkZ+DKPTywWfg/5aXoRfW2eUGe4i77J4WjYrhhPEfG5n
         mSqa9pBHpzR2ypr/qsP+pglL97lfxe5R45odUNRnL5J3eYZr1Zz8XXjEfA9IKjjjEvgX
         UaV8g778LZCxGIZen2Ppkw4SxyeAd+ryDG+d6/+GsLEccrjE9p5yWkg4s/CH3ndvWhlj
         PaDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755527344; x=1756132144;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3z0lOGnoy2DTiFRtSQ834KWO6kfpYDPrVEHJnQZTKok=;
        b=kXRw7HU5iBPM4mYbz/Cvg6yAzQr2rOl+7XIT4bPobhcUugURybZiUMsDndUCj9Qx7X
         SSm/WvuymRcOfFlEhnALa6xUUl1J1nSZUA6GzHzhym/rNWSSB8eXRoyMEAssrr0xHrI/
         LkfhkG3oD7XgdJ1PT104xbeZmZAKjI2QRqogtgNCT5DElQYl6vWZKCChIE0p12gW6yHU
         BoqisSQ/1DRkAEmEAfDmm8g0wY3NUDXpQ4Qsd4DE6Fkm+Wpvw2X2r7EVGxVAmmkNbyD/
         7NhhFPeb56vsECXr54eL4JHKaEH3xS4Bc3MzES37QNwlX6G9GWooFhefBuzJxXquCc3N
         6K/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX1N5y5HRI3tltu7x48oYD6wJ9eV6ohnHm1OdvuSRzx2TAnzNVOMhPsI3CGdSfNUOR+GUVgrFQekAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCyAf6zVCEOVeXGVeCPJX76thkw6zPTLFO0BqXUC4q/yfocb7+
	uLNa6+7fjnwT5jYYUKcht0TPrz/E+OlGlrpS5eJOqzVTIzXc6xwl45c1lHdEEXzWSa1/B9JXq/L
	7OJ7BU8Htzg==
X-Google-Smtp-Source: AGHT+IHn1f5s0goJbEhBCAC7DNa7GiAi2gXYe6kZJfpneYr5QGRSUwUzApKz5hpqoRdffdS5McJgcY5ZqlP+
X-Received: from iov15.prod.google.com ([2002:a05:6602:750f:b0:884:4d31:3618])
 (user=jdenose job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6602:640e:b0:881:983d:dd7b
 with SMTP id ca18e2360f4ac-8843e3eba5emr2445335539f.8.1755527344033; Mon, 18
 Aug 2025 07:29:04 -0700 (PDT)
Date: Mon, 18 Aug 2025 14:28:05 +0000
In-Reply-To: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250818-support-forcepads-v2-0-ca2546e319d5@google.com>
X-Mailer: b4 0.14.2
Message-ID: <20250818-support-forcepads-v2-5-ca2546e319d5@google.com>
Subject: [PATCH v2 05/11] HID: input: allow mapping of haptic output
From: Jonathan Denose <jdenose@google.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Henrik Rydberg <rydberg@bitmath.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Angela Czubak <aczubak@google.com>, 
	"Sean O'Brien" <seobrien@google.com>, Jonathan Denose <jdenose@google.com>
Content-Type: text/plain; charset="utf-8"

From: Angela Czubak <aczubak@google.com>

This change makes it possible to parse output reports by input mapping
functions by HID drivers.

Signed-off-by: Angela Czubak <aczubak@google.com>
Co-developed-by: Jonathan Denose <jdenose@google.com>
Signed-off-by: Jonathan Denose <jdenose@google.com>
---
 drivers/hid/hid-input.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hid/hid-input.c b/drivers/hid/hid-input.c
index 9d80635a91ebd8d8bdafaac07b5f85693b179cb4..d42c1fbd20a1cc01c04f93cf10f1d1c18043929c 100644
--- a/drivers/hid/hid-input.c
+++ b/drivers/hid/hid-input.c
@@ -682,9 +682,10 @@ static void hidinput_configure_usage(struct hid_input *hidinput, struct hid_fiel
 	if (field->report_count < 1)
 		goto ignore;
 
-	/* only LED usages are supported in output fields */
+	/* only LED and HAPTIC usages are supported in output fields */
 	if (field->report_type == HID_OUTPUT_REPORT &&
-			(usage->hid & HID_USAGE_PAGE) != HID_UP_LED) {
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_LED &&
+	    (usage->hid & HID_USAGE_PAGE) != HID_UP_HAPTIC) {
 		goto ignore;
 	}
 

-- 
2.51.0.rc1.163.g2494970778-goog

