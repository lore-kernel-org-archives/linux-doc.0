Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FF931E822
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 22:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795385; cv=none; b=JRv1QJPb/dzsrJS9z4yHTKGTkO2L9BkW+VKQ7N3recmAOQaKgwSYj1Y0kNNeyVbM3nM3XR/rKZPMnQsLzQ52l72yKpgj7wy5LWwrdhdRkwv4/OUsmm0ShFgYs9YT6xtwEJfSulYRV8atx8eL4IrR28uXpfk3j6g2ViG8Qc81Fig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795385; c=relaxed/simple;
	bh=EIMWWlWDcq0uEYhrtukreWiGwiCZqVgmmuCgjtQWFjc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUARhsaNDnKEdcDR5BFm5iJSuN7aPa4zv1BMIkQ48vpK/5qdoGG+xlSpAlN6hpWKEvLWoagpZqImqUsGjTB+E1ijIOSqWCzVXWWRnc0LlHQ2jJaq8JpkA5XtajLw8wS0E0utv0yf+7aEsFkXa0XkscGWbdVhUt7sxaKEOR6DOYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fmXc8oU8; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fmXc8oU8"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so3313816a91.3
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785795383; x=1786400183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=fmXc8oU8QMWRSg83kAatQ3GNpWjjSeFXdDFz/EfLaJR8lKtFDy8k0BgzDeSjG2vWVz
         ki12rrVoKtLy/xhEYzjUwiPnpnQx8EJvEVlnO38s8VFitlvTkKJgwNGwbzLtMkrnWoOo
         fIqW34odSPmPAuE/k8SK5pPMnz4tKg8p1y788wYxfXejjxlxWjSdRzmNsDiU5Y/u1MSP
         jAWjAy/LXbw4LMyus0OIqSPZ0VjjNN5H8HUBdbMKs6sgWpB5993X9HaBdcjRudC4qCPN
         x1NAQAg5lJtFxI7qRIhyGFE0IWdPCENlqmcGjGMbKmUe/3alR/KpxVA/q1nWrNoaVCKJ
         TNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785795383; x=1786400183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cyQb3HEnxnGJdzSi8B8jk9beGpq3QOPyQ1mK+KBtq5A=;
        b=pS/2WhwfTUz8R0/UN7BVKRvtKutI07khLNJsE5zTB//JbIdCBl9+OjmPsA8sqAYXqH
         HTUR5Ipx52LPutip8tKZTe3V8bwEzSGZn4zPOvBwd23580PCi9sYztRxdNtQ1NV4oAw3
         FO3eyyi9Aeqx+70esv4lE17b153tHcG6a+bNwGskU0IkZM3Mx5suYtgMOE4hcERHE25V
         Uo6s779w6t05yDM/1Kb1nXxjnV01kgNijrSj3sjPA5eGYkTHlMOrUUYR3x7jf5hRbbsk
         QNRELYAg3RYPsr5UzJBELry07PQ/gPZdbMOL814+YtILWDyBPuXtWdWb4Wv9q8v8nVld
         dQeA==
X-Forwarded-Encrypted: i=1; AHgh+Rr6cS/We8M1YIUh+iuOEnMUA538ebF0DbQeHavvrE/77B34c3v86OTD0q2/TwJherL4QCvusrGVSBo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzF5Ie2La76PMvRNT39EkBalJ6ATs/mCWo8LLo21bL1zz6BsxDe
	qXm1w59CTKTwFcMQF8dIVwAsHatB6EH1v9OekcmE5olkqkEBh79JGBsV
X-Gm-Gg: AR+sD13+q1BD+/9N1dI2Xh0V/8q6zhDkET62JunSiFUHVJk3BbAzJVq7HfPbZQRPJ8f
	HQ21S5SMoECIWjNAhwn5qzY44CI28gByP3+DXWIBwzQBvewfAHFDE+p381qPCi9wKr4PNMOOR8/
	P9xY28ztGsrrfUN4RJXsh1PCgAWBieYO+xdgwcxIHffI61OIGgl/gzghjVhMcVl4ldAAsKTyMaP
	lpLsd8iOCPI56+ReIgYlg8Hm7wmfYy0WljEqi8JNRl5fpc1613XfAo2Sd2URXqJNYGmy7QCwGqL
	JU3Q4MR/KkrSpeudQTIaAmu+KWW1/GR/LthYEGsTUy6E1W2NzabVeCl6BoZ8ZxpxhfYTtcJs5AX
	Y1yZijU318ZWjAJnE3KvdmS8CBNeghSXWkKN7Ha3dYwBu0NVohunF/GAlQg6qKq0xMYsZYobGNt
	AywQkQzSE1wnZRDx9wU6gMMwe/eHxVMu19dKabOlRoqRIWE0dIwuR8aRjV1GG/nzFt7dgmzW81g
	gpYMj6ImrAav6m9QaZkcpwbXZ3OZAZ58Bka7MiMbw==
X-Received: by 2002:a17:90b:5824:b0:381:9028:5945 with SMTP id 98e67ed59e1d1-38fbc43a847mr11586487a91.14.1785795382878;
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab1334cfsm38685666c88.1.2026.08.03.15.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:16:22 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: lkml@antheas.dev
Cc: W_Armin@gmx.de,
	corbet@lwn.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jdelvare@suse.com,
	kuurtb@gmail.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Matthew Schwartz <matthew.schwartz@linux.dev>
Subject: [PATCH 3/6] platform/x86: msi-wmi-platform: terminate msi_quirks DMI table
Date: Mon,  3 Aug 2026 15:16:11 -0700
Message-ID: <20260803221614.59324-4-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803221614.59324-1-derekjohn.clark@gmail.com>
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20260803221614.59324-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Matthew Schwartz <matthew.schwartz@linux.dev>

The msi_quirks table lacks a terminating empty entry so it crashes the
kernel on non-quirked MSI Claw devices.

Signed-off-by: Matthew Schwartz <matthew.schwartz@linux.dev>
---
 drivers/platform/x86/msi-wmi-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
index 2439b4f0001b..fdc2f6f4ca7e 100644
--- a/drivers/platform/x86/msi-wmi-platform.c
+++ b/drivers/platform/x86/msi-wmi-platform.c
@@ -268,6 +268,7 @@ static const struct dmi_system_id msi_quirks[] = {
 		},
 		.driver_data = &quirk_gen2,
 	},
+	{ }
 };
 
 static int msi_wmi_platform_parse_buffer(union acpi_object *obj, u8 *output, size_t length)
-- 
2.55.0

